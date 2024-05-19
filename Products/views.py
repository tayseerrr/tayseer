import json
import uuid
from rest_framework import viewsets, status, mixins
from rest_framework.decorators import api_view
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from Loans.serializer import LoanSerializer
from Products.locations.mapv3 import all_locations_nearby
from Products.serializer import *
from Users.models import StudentProfile


@api_view(['GET'])
def installment_info(request):
    if request.user.is_anonymous:
        return Response(status=status.HTTP_401_UNAUTHORIZED)
    try:
        data = {}
        student = StudentProfile.objects.get(user=request.user)
        loan = student.loan
        if student.loan is None:
            orders = Order.objects.filter(bill__customer=request.user)
            if orders:
                data['type'] = 'order'
                order = Order.objects.filter(bill__customer=request.user)[0]

                serializer = OrderSerializer(order)
                data['amount'] = order.bill.price
                data['start_date'] = order.order_date
        #         divide the amount by 40% of 850 on monthly basis
                data['installment'] = order.bill.price * 0.4 / 850
                data['data'] = serializer.data




        else:
            data['type'] = 'loan'
            data['amount'] = loan.amount

            serializer = LoanSerializer(loan)
            data['data'] = serializer.data

        return Response(data, status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)
    pass


@api_view(['GET'])
def is_installment_allowed(request):
    if request.user.is_anonymous:
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    # roll_no, specialization, collage, enrollment_year, level, average, study_type,loan
    try:
        student = StudentProfile.objects.get(user=request.user)
        if student.loan is not None:
            # not allowed
            return Response({

                'msg': 'لديك تمويل شراء حالياً',

                'status': 'fail'
            },
                status=status.HTTP_200_OK)
        elif student.average < 2.0:
            return Response(
                {
                    'msg': 'المعدل الحالي لا يسمح  لك بالحصول على تمويل شراء',
                    'status': 'fail'
                },

                status=status.HTTP_200_OK)
        elif student.study_type != 1:
            return Response({
                'msg': 'الدراسة غير النظامية لا تسمح لك بالحصول على تمويل شراء',
                'status': 'fail'

            }, status=status.HTTP_200_OK)
        elif student.warning:
            return Response({
                'msg': 'لديك بالفعل إنذار أكاديمي',
                'status': 'fail'

            }, status=status.HTTP_200_OK)
        elif student.graduation:
            return Response({
                'msg': 'انت على وشك التخرج',
                'status': 'fail'

            }, status=status.HTTP_200_OK)
        return Response(
            {
                'msg': 'انت مؤهل للحصول على تمويل شراء',
                'status': 'success'

            },
            status=status.HTTP_200_OK)

        pass
    except Exception as e:
        print(e)
        return Response(    {
                'msg': 'ليس لديك حساب اكاديمي مفعل',
                'status': 'fail'

            }

        ,status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def bills(request):
    orders = Order.objects.filter( status='A')
    serializer = OrderSerializer(orders, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def installment_requests(request):
    orders = Order.objects.filter( status='P')
    serializer = OrderSerializer(orders, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['POST'])
def installment_status(request):
    try:
        if request.user.is_anonymous:
            return Response(status=status.HTTP_401_UNAUTHORIZED)
        if request.data['order_id'] is None or request.data['order_id'] == '' or request.data['status'] is None or \
                request.data['status'] == '':
            return Response(status=status.HTTP_400_BAD_REQUEST)

        order_id = request.data['order_id']
        order = Order.objects.get(order_id=order_id)
        order.approved_by = request.user
        order.status = request.data['status']
        order.save()
        return Response(status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def branches(request):
    # location = request.query_params.get('location')
    location = request.data['lat'] + ',' + request.data['lng']
    res = all_locations_nearby(location)
    return Response(res, status=status.HTTP_200_OK)


class BillViewSet(mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  GenericViewSet):
    queryset = Bill.objects.all()
    serializer_class = BillSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        try:
            id = request.data['id']
            product = Product.objects.get(id=id)
            user = request.user
            bill = Bill.objects.create(
                price=product.price,
                product=product,
                customer=user,
            )
            bill.save()
            return Response({'bill_id': bill.id, }, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def retrieve(self, request, *args, **kwargs):
        try:
            bill = Bill.objects.get(id=kwargs['pk'])
            serializer = BillSerializer(bill)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)


class OrderViewSet(mixins.CreateModelMixin, mixins.ListModelMixin,
                   mixins.RetrieveModelMixin,
                   GenericViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def create(self, request, *args, **kwargs):
        # order_id, order_no, bill, receiving_method
        try:
            bill_id = request.data['bill_id']
            bill = Bill.objects.get(id=bill_id)
            receiving_method = request.data['option']
            if receiving_method == 'D':
                bill.price = bill.price + 50
                bill.save()

            if (request.data['address'] == '' or request.data['address'] is None) and receiving_method == 'D':
                return Response(status=status.HTTP_400_BAD_REQUEST)
            address = request.data['address']
            order = Order.objects.create(

                bill=bill,
                receiving_method=receiving_method,
                order_no=uuid.uuid4(),
                address=address
            )
            order.save()
            return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductListSerializer
    permission_classes = [AllowAny]

    def list(self, request, *args, **kwargs):
        try:
            # get brand and category from query params
            brand = request.query_params.get('brand', None)
            category = request.query_params.get('category', None)

            if brand == '':
                brand = None
            if category == '':
                category = None

            if brand is not None and category is not None:
                products = Product.objects.filter(brand=brand, category=category)
            elif brand is not None:
                products = Product.objects.filter(brand=brand)
            elif category is not None:
                products = Product.objects.filter(category=category)
            else:
                products = Product.objects.all()

            serializer = self.get_serializer(products, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def create(self, request, *args, **kwargs):
        try:
            product = Product.objects.create(
                name=request.data['name'],
                price=request.data['price'],
                brand=request.data['brand'],
                category=request.data['category'],

            )
            product.save()
            if 'image' in request.FILES:
                product.image = request.FILES['image']
                product.save()

            if 'details' in request.data:
                details = request.data['details']
                details = json.loads(details)

                for detail in details:
                    product_detail = ProductDetailsField.objects.create(
                        product=product,
                        title=detail['key'],
                        value=detail['value'],
                    )
                    product_detail.save()

            return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, *args, **kwargs):
        try:
            product = Product.objects.get(id=kwargs['pk'])
            product.name = request.data['name']
            product.price = request.data['price']
            product.description = request.data['description']
            product.save()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def retrieve(self, request, *args, **kwargs):
        try:
            product = Product.objects.get(id=kwargs['pk'])
            serializer = ProductSerializer(product)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        try:
            product = Product.objects.get(id=kwargs['pk'])
            product.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

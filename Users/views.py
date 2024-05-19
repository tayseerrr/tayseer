from datetime import datetime, timedelta

from django.shortcuts import render
from django.utils.crypto import get_random_string
from rest_framework import viewsets, status, mixins
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework_simplejwt.tokens import RefreshToken

from Products.models import Order
from Products.serializer import OrderSerializer
from Users.models import User, VerificationCode
from Users.permissions import BlockCertainActions
from Users.serializer import *
from utilities import month_diff
from Users.models import User


@permission_classes([AllowAny])
@api_view(['GET'])
def email_activate(request):
    user = request.user
    print(user)
    # if user.is_anonymous:
    #     return Response(status=status.HTTP_401_UNAUTHORIZED)
    user.email_active = True
    print(user)
    user.save()
    return Response(status=status.HTTP_200_OK)
    # try:
    #
    #     uuid = request.data['uuid']
    #     code = request.data['code']
    #     check_status = VerificationCode.objects.check_verification_code(uuid=uuid, code=code)
    #     if check_status:
    #
    #         return Response(status=status.HTTP_200_OK)
    #
    #     return Response(status=status.HTTP_400_BAD_REQUEST)
    # except Exception as e:
    #     print("Error: ", e)
    #     return Response(status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def commitments_info(request):
    try:
        user = request.user
        student = StudentProfile.objects.get(user=user)
        salary = student.salary
        monthly_installment = 375
        loan = student.loan

        orders = Order.objects.filter(bill__customer=user, status='A')
        print(student.loan, " ", student.loan.status, )
        print(orders, " ", orders.exists())
        if (not student.loan or not student.loan.status) and (not orders or not orders.exists()):
            return Response(status=status.HTTP_204_NO_CONTENT)

        if orders:
            order = orders.first()
            total_price = float(order.bill.price)
            months_required = total_price // monthly_installment
            last_month_payment = total_price % monthly_installment
            if last_month_payment > 0:
                months_required += 1
            today = datetime.now().date()
            months_paid = month_diff(today, order.order_date)
            remaining_months = months_required - months_paid

            data = {
                'type': 'order',
                'month': remaining_months,
                'installment': monthly_installment,
                'last_month': last_month_payment,
                'amount': total_price,
                'start_date': order.order_date.strftime('%Y-%m-%d %H:%M'),
                'end_date': (order.order_date + timedelta(days=30 * remaining_months)).strftime('%Y-%m-%d'),
                'product_image': order.bill.product.image.url.replace('/https%3A/',
                                                                      'https://') if 'https%3A' in order.bill.product.image.url else order.bill.product.image.url,
                'product_name': order.bill.product.name,
                'product_price': total_price,
                'remaining_amount': total_price - (months_paid * monthly_installment),
            }

            if monthly_installment > total_price:
                data['installment'] = total_price
                data['last_month'] = 0
                data['month'] = 0
                data['paid_amount'] = total_price

        else:

            loan_amount = float(loan.amount)
            months_required = loan_amount // monthly_installment
            last_month_payment = loan_amount % monthly_installment
            if last_month_payment > 0:
                months_required += 1
            today = datetime.now().date()
            months_paid = month_diff(today, loan.apply_date)
            remaining_months = months_required - months_paid

            data = {
                'type': 'loan',
                'month': remaining_months,
                'installment': monthly_installment,
                'last_month': last_month_payment,
                'amount': str(loan_amount),
                'start_date': loan.apply_date.strftime('%Y-%m-%d'),
                'end_date': (loan.apply_date + timedelta(days=30 * remaining_months)).strftime('%Y-%m-%d'),
                'remaining_amount': loan_amount - (months_paid * monthly_installment),
            }

            if months_paid == 0:
                data['remaining_amount'] = loan_amount
            elif last_month_payment > 0:
                data['month'] -= 1
                data['remaining_amount'] = loan_amount - (months_paid * monthly_installment)
            else:
                data['remaining_amount'] = loan_amount - (months_paid * monthly_installment)

            data['paid_amount'] = (months_paid - 1) * monthly_installment + last_month_payment

        return Response(data)

    except StudentProfile.DoesNotExist:
        return Response({'error': 'Student profile not found'}, status=status.HTTP_404_NOT_FOUND)
    except Exception as e:
        print("Error: ", e)
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['GET'])
def my_applications(request):
    user = request.user
    if user.is_anonymous:
        return Response(status=status.HTTP_401_UNAUTHORIZED)
    try:
        data = {}
        student = StudentProfile.objects.get(user=user)
        loan = student.loan

        if loan:
            serializer = LoanSerializer(loan, many=False)
            data['loan'] = serializer.data
        orders = Order.objects.filter(bill__customer=user)
        if orders:
            serializer = OrderSerializer(orders.first(), many=False)
            data['order'] = serializer.data
        print(data)
        return Response(data)
    except Exception as e:
        print("Error: ", e)
        return Response(status=status.HTTP_204_NO_CONTENT)


# {"email": "root@root.com", "password": "root"}

@api_view(['POST'])
def auth(request):
    try:
        email = request.data['email']

        password = request.data['password']

        users = User.objects.all().order_by('-date_joined')
        user = User.objects.get(email=email)
        if not user.email_active:
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'account_type': user.account_type,
            },
                status=status.HTTP_302_FOUND)

        if not user.check_password(password):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'account_type': user.account_type,
        },
            status=status.HTTP_200_OK)
    except Exception as e:
        print("Error: ", e)
        return Response(status=status.HTTP_400_BAD_REQUEST)


class StudentProfileViewSet(
    mixins.RetrieveModelMixin,
    mixins.ListModelMixin,
    GenericViewSet):
    queryset = StudentProfile.objects.all()
    serializer_class = StudentProfileSerializer

    #
    # permission_classes = [BlockCertainActions]

    def list(self, request, *args, **kwargs):
        user = request.user
        if user.is_anonymous:
            return Response(status=status.HTTP_401_UNAUTHORIZED)
        try:
            profile = StudentProfile.objects.get(user=user)
            serializer = self.get_serializer(profile)
            return Response(serializer.data)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_204_NO_CONTENT)

    def retrieve(self, request, *args, **kwargs):
        user = request.user
        if user.is_anonymous:
            return Response(status=status.HTTP_401_UNAUTHORIZED)
        # get pk from request
        pk = kwargs.get('pk')
        if user.id.__str__() == pk or user.account_type == 'admission':
            print("User is the same user or admission")
            return super().retrieve(request, *args, **kwargs)
        return Response(status=status.HTTP_401_UNAUTHORIZED)


class UserAuthViewSet(viewsets.ModelViewSet):
    permission_classes = [BlockCertainActions]
    serializer_class = UserSerializer

    def create(self, request, *args, **kwargs):
        try:
            # username = get_random_string(length=10)
            #
            # الطالب : s442006665@st.uqu.edu.sa
            # الموظف :
            # amgamdi@uqu.edu.sa
            # مكتبة جرير :
            # jarir@jarirbookstore.com
            #              ACCOUNT_TYPE_CHOICES = (
            #         ('admin', 'Admin'),
            #         ('student', 'Student'),
            #         ('admission', 'Admission'),
            #         ('supplier', 'Supplier'),
            #     )

            if request.data['email'].__contains__('@st.uqu.edu.sa'):
                account_type = 'student'
            elif request.data['email'].__contains__('@jarirbookstore.com'):
                account_type = 'supplier'
            elif request.data['email'].__contains__('@uqu.edu.sa'):
                account_type = 'admission'
            else:
                account_type = 'admin'
            user = User.objects.create_user(
                # username=username,
                email=request.data['email'],
                first_name=request.data['first_name'],
                last_name=request.data['last_name'],
                account_type=account_type,
                email_active=False

            )
            VerificationCode.objects.create_verification_code(user)

            user.set_password(request.data['password'])
            user.save()
            return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

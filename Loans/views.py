from rest_framework.decorators import api_view

from Users.models import StudentProfile

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated  # Ensure the user is authenticated
from .models import Loan
from .serializer import LoanSerializer
from django.utils import timezone


class LoanViewSet(viewsets.ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer
    permission_classes = [IsAuthenticated]  # Add this to ensure that the user is authenticated

    def list(self, request, *args, **kwargs):
        """Handle loan applications."""
        user = request.user
        # if user.account_type != 'admission':
        #     return Response({'message': 'You are not allowed to view loans'}, status=status.HTTP_403_FORBIDDEN)

        queryset = Loan.objects.all()
        serializer = LoanSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        """Handle loan applications."""
        user = request.user
        if user.account_type != 'student':
            return Response({'message': 'You are not allowed to apply for loans'}, status=status.HTTP_403_FORBIDDEN)

        try:
            student = StudentProfile.objects.get(user=user)
            if student.loan is not None:
                return Response({'message': 'You have an active loan'}, status=status.HTTP_400_BAD_REQUEST)
            loan = Loan.objects.create()
            student.loan = loan
            student.save()
            return Response({'message': 'Loan application submitted successfully'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def partial_update(self, request, pk=None):
        """Handle loan approval."""
        loan = self.get_object()
        user = request.user
        # if user.account_type != 'admission':
        #     return Response({'message': 'You are not allowed to approve loans'}, status=status.HTTP_403_FORBIDDEN)

        loan.status = True
        loan.approved_date = timezone.now()
        loan.approved_by = user
        loan.save()
        return Response({'message': 'Loan approved successfully'}, status=status.HTTP_200_OK)


@api_view(['GET'])
def is_loan_allowed(request):
    if request.user.is_anonymous:
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    # roll_no, specialization, collage, enrollment_year, level, average, study_type,loan
    try:
        student = StudentProfile.objects.get(user=request.user)
        if student.loan is not None:
            # not allowed
            return Response({
                'msg': 'لديك قرض مسبقاً',
                'status': 'fail'
            },
                status=status.HTTP_200_OK)
        elif student.average < 2.0:
            return Response(
                {
                    'msg': 'المعدل الحالي لا يسمح  لك بالحصول على قرض ',
                    'status': 'fail'
                },

                status=status.HTTP_200_OK)
        elif student.study_type != 1:
            return Response({
                'msg': 'الدراسة غير النظامية لا تسمح لك بالحصول على قرض ',
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
                'msg': 'انت مؤهل للحصول على قرض',
                'status': 'success'

            },
            status=status.HTTP_200_OK)

        pass
    except Exception as e:
        print(e)

        return Response({
            'msg': 'ليس لديك حساب اكاديمي مفعل',
            'status': 'fail'

        }
        )

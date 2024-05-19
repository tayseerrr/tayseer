from datetime import datetime

from django.contrib.auth import get_user_model
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenRefreshSerializer, TokenObtainPairSerializer
from rest_framework_simplejwt.tokens import RefreshToken

from Loans.models import Loan
from Loans.serializer import LoanSerializer
from Users.models import User, StudentProfile
from utilities import month_diff


class AppTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        return token

    def validate(self, attrs):
        data = super().validate(attrs)
        # RefreshToken instance is created here, we can modify the refresh token as well
        refresh = self.get_token(self.user)

        # Optionally, add role to refresh token if needed

        data['refresh'] = str(refresh)
        data['access'] = str(refresh.access_token)
        data['role'] = self.user.role  # Fetch the role from the user or set default

        return data
        return data


USER_CLASS = get_user_model()


class AppTokenRefreshSerializer(TokenRefreshSerializer):
    def validate(self, attrs):
        try:
            data = super().validate(attrs)
            refresh = RefreshToken(attrs['refresh'])
            user = USER_CLASS.objects.get(id=refresh.payload['user_id'])
            data['role'] = user.role  # Fetch the role from the token or set default
            return data
        except Exception as e:
            raise serializers.ValidationError('Invalid token')


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email']
        extra_kwargs = {'password': {'write_only': True, 'required': True}}


class StudentProfileSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()
    study_type = serializers.SerializerMethodField()
    duration = serializers.SerializerMethodField()

    def get_duration(self, obj):
        if obj.loan is None:
            return 0
        salary = obj.salary
        salary = obj.salary
        monthly_installment = float(salary) * 0.4
        today = datetime.now()
        months_paid = month_diff(today, obj.loan.apply_date)
        month = float(obj.loan.amount) // float(monthly_installment)
        last_month = float(obj.loan.amount) % float(monthly_installment)
        if last_month > 0:
            month = month + 1
        month -= months_paid

        return int(month)

    def get_study_type(self, obj):
        if obj.study_type == 1:
            return 'انتظام'
        elif obj.study_type == 2:
            return 'انتساب'
        elif obj.study_type == 3:
            return 'الكتروني'

    def get_full_name(self, obj):
        return obj.user.get_full_name()

    loan = serializers.StringRelatedField(source='loan.amount')

    #
    # def get_duration(self, obj):
    #     if obj.loan is None:
    #         return 0
    #     return obj.loan.duration

    class Meta:
        model = StudentProfile
        # user, roll_no, specialization, collage, enrollment_year, level, average, study_type,loan
        fields = ['full_name', 'roll_no', 'specialization',
                  'collage', 'enrollment_year',
                  'level', 'average', 'study_type',
                  'loan', 'duration'
                  ]

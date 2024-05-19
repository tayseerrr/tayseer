from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from Loans.models import Loan
from Users.models import StudentProfile


class LoanSerializer(ModelSerializer):
    user = serializers.SerializerMethodField()

    def get_user(self, obj):
        student = StudentProfile.objects.get(loan=obj)
        if student:
            if student.user.get_full_name() != '':
                return student.user.get_full_name()
            else:
                return student.user.username

    class Meta:
        model = Loan
        fields = '__all__'

import random
import string
from datetime import datetime, timedelta

import pytz
from django.contrib.auth import get_user_model
# models.py
from django.db import models
from uuid import uuid4
from Users.email_sender import send_email


class VerificationCodeManager(models.Manager):
    def create_verification_code(self, user):
        # check if exists or create
        if self.model.objects.filter(user=user).exists():

            code = self.model.objects.get(user=user)
        else:
            uuid = uuid4()
            code = self.model(user=user, uuid=uuid)

        # Generate a new code
        code.code = ''.join(random.choices(string.digits, k=6))
        code.save()  # Save the instance
        send_email(email=user.email, code=code.code)  # Send an email with the new code
        return code.uuid
        # code = self.model
        # code.code = ''.join(random.choices(string.digits, k=6))
        # code.save()
        # return code.uuid

    def check_verification_code(self, uuid, code):
        try:
            codes = self.all()
            verification_code = self.get(uuid=uuid, code=code, )
            # get user
            verification_code.user.email_active = True
            verification_code.user.save()
            verification_code.delete()
            return True
        except self.model.DoesNotExist:
            print("Verification code does not exist")
            # if self.model.objects.filter(uuid=uuid).exists():
            # if self.model.objects.filter(uuid=uuid, created_at__lt=current_time).exists():
            #     self.model.objects.filter(uuid=uuid).delete()

            return False


USER_CLASS = get_user_model()


class VerificationCode(models.Model):
    user = models.OneToOneField(USER_CLASS, on_delete=models.CASCADE)
    code = models.CharField(max_length=6)
    uuid = models.UUIDField(editable=False)
    created_at = models.DateTimeField(auto_now_add=True)

    objects = VerificationCodeManager()

    def __str__(self):
        return self.code + " " + self.uuid.__str__()

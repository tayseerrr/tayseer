from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser
from django.db import models

{"email": "root@root.com", "password": "root"}


class MyUserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        """
        Creates and saves a user with the given email and password.
        """
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(email, password, **extra_fields)

    def get_queryset(self):
        return super().get_queryset()


class User(AbstractUser):
    ACCOUNT_TYPE_CHOICES = (
        ('admin', 'Admin'),
        ('student', 'Student'),
        ('admission', 'Admission'),
        ('supplier', 'Supplier'),
        #     student, admission, supplier
    )
    account_type = models.CharField(max_length=20, choices=ACCOUNT_TYPE_CHOICES, default='student')
    address = models.TextField(blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True,
                                     help_text='Format: YYYY-MM-DD')

    email = models.EmailField(unique=True)
    email_active = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    #  account_type, address,
    USERNAME_FIELD = 'email'
    username = None
    REQUIRED_FIELDS = [ 'first_name', 'last_name']
    objects = MyUserManager()

    def __str__(self):
        return self.email + ' ' + self.email_active.__str__() + ' ' + self.account_type
#     Warning

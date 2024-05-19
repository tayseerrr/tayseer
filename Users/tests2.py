from django.test import TestCase

import os
from datetime import datetime

from django.utils import timezone

from Users.email_sender import send_email
from utilities import month_diff

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Root.settings')

import django

django.setup()
# Add this import statement at the top of your file
from faker import Faker
from Users.models import User, StudentProfile

# Inside your Django management command or any other function where you want to generate fake users
send_email(
    email="raghadsamanudi@gmail.com",
    code="123456"
)


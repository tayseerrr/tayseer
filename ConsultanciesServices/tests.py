import os
import django

# from faker import Faker

# # Initialize Django to access its ORM features
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Root.settings')
django.setup()

# send email
from django.core.mail import send_mail
t=send_mail(
    'Subject here',
    'Here is the message.',
    'tayseer.20240@gmail.com',
    ['salahaldinalhajsoft@gmail.com']
)
print(t)
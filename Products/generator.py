import os
import django
from faker import Faker

# Initialize Django to access its ORM features
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Root.settings')
django.setup()

from Products.models import Product  # Adjust 'your_app' to the actual app name where `Product` is defined

faker = Faker()

def create_fake_products():
    name = faker.name()
    price = round(faker.random_number(digits=5) / 100, 2)  # Generate a decimal by dividing a larger number
    mark = faker.random_element(elements=dict(Product.MARKS).keys())
    category = faker.random_element(elements=dict(Product.CATEGORIES).keys())
    image = faker.image_url()
    # be sure image to convert to string like this /https%3A/placekitten.com/849/538
    if image.startswith('http'):
        image = image.replace('https://', '/https%3A/')

    product = Product.objects.create(name=name, price=price, mark=mark, category=category, image=image)
for i in range(10):
    create_fake_products()

from django.db import models
from faker import Faker


class Product(models.Model):
    MARKS = (
        ('AP', 'Apple'),
        ('HW', 'Huawei'),
        ('AD', 'Android'),
    )
    CATEGORIES = (
        ('SP', 'Smart Phone'),
        ('TL', 'Tablet & Laptop'),
        ('AC', 'Accessories'),
    )
    name = models.CharField(max_length=128)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    brand = models.CharField(max_length=2, choices=MARKS)
    category = models.CharField(max_length=2, choices=CATEGORIES)
    image = models.ImageField(upload_to='products/images/', blank=True, null=True)

    supplier = models.ForeignKey('Suppliers.Supplier',
                                 on_delete=models.DO_NOTHING,
                                 related_name='products', null=True,
                                 blank=True, default=1)

    def __str__(self):
        return self.name + ' ' + self.price.__str__()


class ProductDetailsField(models.Model):
    id = models.AutoField(primary_key=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product_details')
    title = models.CharField(max_length=32)
    value = models.CharField(max_length=32)

    def __str__(self):
        return self.title + ": " + self.value

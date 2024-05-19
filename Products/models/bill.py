from django.db import models
from Products.models import Product


class Bill(models.Model):
    id = models.AutoField(primary_key=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='bills')
    customer = models.ForeignKey('Users.User', on_delete=models.DO_NOTHING, related_name='bills')
    bill_date = models.DateField(auto_now_add=True)

    # id, price, product, customer, bill_date
    def __str__(self):
        return self.customer.email + ' ' + self.product.name

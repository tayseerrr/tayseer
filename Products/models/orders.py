from django.db import models

from Products.models import Product
from Products.models.bill import Bill


class Order(models.Model):
    STATUS_CHOICES = (
        ('P', 'Pending'),
        ('A', 'Accepted'),
        ('R', 'Rejected'),
    )
    status = models.CharField(max_length=1, choices=STATUS_CHOICES, default='P')
    approved_by = models.ForeignKey('Users.User', on_delete=models.SET_NULL, related_name='approved_orders', blank=True, null=True)
    # Receiving method
    RECEIVING_METHOD_CHOICES = (
        ('D', 'Delivery'),
        ('P', 'Pickup from store'),
    )
    order_id = models.AutoField(primary_key=True)
    order_no = models.UUIDField(
        editable=False,
        unique=True,
        db_index=True,
        auto_created=True,

    )
    bill = models.ForeignKey(Bill, on_delete=models.CASCADE, related_name='orders')
    receiving_method = models.CharField(max_length=1, choices=RECEIVING_METHOD_CHOICES)
    address = models.TextField(blank=True, null=True)
    order_date = models.DateTimeField(auto_now_add=True, blank=True, null=True,auto_created=True)

    # order_id, order_no, bill, receiving_method


    @property
    def total_price(self):
        return self.bill.price + self.bill.delivery_charge
    @property
    def customer_name(self):
        return self.bill.customer

    @property
    def customer_email(self):
        return self.bill.customer.email
    @property
    def product_name(self):
        return self.bill.product.name
    @property
    def bill_date(self):
        return self.bill.bill_date
    @property
    def supplier_name(self):
        return self.bill.supplier.name
    @property
    def delivery_charge(self):
        return self.bill.delivery_charge
    @property
    def price(self):
        return self.bill.price
    @property
    def product_mark(self):
        return self.bill.product.mark
    @property
    def product_details(self):
        return self.bill.product.product_details.all()

    def __str__(self):
        return self.order_no.__str__()+ ' ' + self.bill.customer.email + ' ' + self.bill.product.name

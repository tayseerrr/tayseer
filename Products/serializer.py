from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from Products.models import Product, ProductDetailsField, Order, Bill


class BillSerializer(ModelSerializer):
    #     id, price, product, customer, bill_date
    class Meta:
        model = Bill
        fields = ['id', 'price', 'product', 'customer', 'bill_date']
        read_only_fields = ['id']


class ProductDetailsFieldSerializer(ModelSerializer):
    class Meta:
        model = ProductDetailsField
        fields = ['title', 'value']
        read_only_fields = ['id']




class OrderSerializer(ModelSerializer):
    name = serializers.SerializerMethodField()
    email = serializers.StringRelatedField(source='bill.customer.email')
    product_name = serializers.SerializerMethodField()
    receiving_method = serializers.SerializerMethodField()
    price = serializers.SerializerMethodField()

    def get_price(self, obj):
        return obj.bill.price

    approved_by = serializers.StringRelatedField(source='approved_by.email')

    approved_by = serializers.SerializerMethodField()

    #
    def get_approved_by(self, obj):
        # print(obj)
        # return obj.approved_by
        if obj.approved_by:
            if obj.approved_by.get_full_name() != '':
                return obj.approved_by.get_full_name()
            else:
                return obj.approved_by.email
        return 'none'

    def get_product_name(self, obj):
        return obj.bill.product.name

    def get_name(self, obj):
        if obj.bill.customer:
            if obj.bill.customer.get_full_name() != '':
                return obj.bill.customer.get_full_name()
            else:
                return obj.bill.customer.email

    def get_receiving_method(self, obj):
        if obj.receiving_method == 'D':
            return 'التوصيل'
        else:
            return 'استلام من المتجر'

    class Meta:
        model = Order
        #  # order_id, order_no, bill, receiving_method
        fields = ['order_id', 'order_no',
                  'bill', 'receiving_method',
                  'name', 'email',
                  'product_name', 'address',
                  'order_date', 'status',
                  'approved_by', 'price'

                  ]
        # fields = '__all__'
        read_only_fields = ['order_id']


class ProductListSerializer(ModelSerializer):
    image = serializers.SerializerMethodField()

    def get_image(self, obj):
        image = obj.image.url.replace('/https%3A/', 'https://')
        return image

    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'brand', 'category', 'image', ]
        read_only_fields = ['id']


class ProductSerializer(ModelSerializer):
    image = serializers.SerializerMethodField()
    details = ProductDetailsFieldSerializer(many=True, read_only=True)

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['details'] = ProductDetailsFieldSerializer(instance.product_details.all(), many=True).data
        return representation

    def get_image(self, obj):
        image = obj.image.url.replace('/https%3A/', 'https://')
        return image

    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'brand', 'category', 'image', 'details']
        read_only_fields = ['id']

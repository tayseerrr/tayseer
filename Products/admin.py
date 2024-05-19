from django.contrib import admin
from Products.models import *


class ProductDetailAdmin(admin.TabularInline):
    model = ProductDetailsField
    extra = 1


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductDetailAdmin]


admin.site.register(Product, ProductAdmin)
admin.site.register(Bill)
admin.site.register(Order)

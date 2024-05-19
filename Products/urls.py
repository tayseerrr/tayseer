from django.urls import path, include
from rest_framework.routers import DefaultRouter

from Products.views import *

router = DefaultRouter()
router.register(r'products', ProductViewSet, basename='products')
router.register(r'orders', OrderViewSet, basename='orders')
router.register(r'bills', BillViewSet, basename='bills')

urlpatterns = [
    # Your other URL patterns
    path('bills/all', bills, name='bills'),

    path('', include(router.urls), name='products'),

    path('branches/', branches, name='branches'),
    path('installment/check/', is_installment_allowed, name='check_installment'),
    path('installment/list/', installment_requests, name='installment_requests'),
    path('installment/change/', installment_status, name='installment_status'),
    path('installment/info/', installment_info, name='installment_status'),


]

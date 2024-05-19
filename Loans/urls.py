from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import *
router = DefaultRouter()
router.register(r'', LoanViewSet, basename='loans')
urlpatterns = [
    # Your other URL patterns
    path('check/', is_loan_allowed, name='check_loan'),
    path('', include(router.urls), name='loans'),

]

from django.urls import path, include
from rest_framework.routers import DefaultRouter

from ConsultanciesServices.views import *

router = DefaultRouter()
router.register(r'', ConsultingViewSet)

urlpatterns = [
    path('booked/<str:id>/', booked, name='booked'),
    path('book/', booking, name='book'),
    path('my/', my, name='book'),
    path('', include(router.urls), name='consulting'),

]

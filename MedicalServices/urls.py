from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()
router.register(r'partners', MedicalPartnerViewSet)
# router.register(r'partner_offers', MedicalPartnerOfferViewSet)
router.register(r'applied', MedicalPartnerOfferAppliedViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('apply/', apply_offer),
    path('applications/', applications),
]

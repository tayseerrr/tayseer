from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)
from .views import *

router = DefaultRouter()
router.register(r'auth', UserAuthViewSet, basename='user')
router.register(r'students', StudentProfileViewSet, basename='students')
# {
#  "email": "root@root.com",
#  "password": "root"
# }
urlpatterns = [
    # Your other URL patterns

    path('token/', auth, name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('applications/', my_applications, name='auth'),
    path('activate/', email_activate, name='commitments'),
    path('commitments/', commitments_info, name='commitments'),
    path('', include(router.urls), name='auth'),


]

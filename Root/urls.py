import os.path

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

urlpatterns = ([
                   path('admin/', admin.site.urls),
                   path('api/v1/users/', include('Users.urls')),

                   path('api/v1/consulting/', include('ConsultanciesServices.urls')),
                   path('api/v1/loan/', include('Loans.urls')),
                   path('api/v1/supplier/', include('Suppliers.urls')),
                   path('api/v1/medical/', include('MedicalServices.urls')),
                   path('api/v1/', include('Products.urls')),
               ] + static('/files/', document_root=settings.MEDIA_ROOT) +
               static('/static/', document_root=os.path.join(settings.MEDIA_ROOT, 'products')))

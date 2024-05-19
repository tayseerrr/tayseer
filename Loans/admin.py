from django.contrib import admin

from Loans.models import Loan

admin.site.register(Loan)
admin.site.site_header = "Tayseer Admin Panel"
admin.site.site_title = "Tayseer Admin Panel"
admin.site.index_title = "Welcome to Tayseer Admin Panel"

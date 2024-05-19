from django.contrib import admin
from .models import *

# Inline admin class for MedicalPartnerOffer
class MedicalPartnerOfferAdminInline(admin.TabularInline):
    model = MedicalPartnerOffer
    extra = 1

# Admin class for MedicalPartner
class MedicalPartnerAdmin(admin.ModelAdmin):
    inlines = [MedicalPartnerOfferAdminInline]  # Use Inline admin class here
    list_display = ['mid', 'name', 'logo', 'description', 'branches']
    search_fields = ['name', 'branches']
    list_filter = ['name']
    list_per_page = 10
    # list_editable = ['name', 'logo', 'description', 'branches']
    list_display_links = ['mid']
    # by page
    list_max_show_all = 200
    list_per_page = 200
    # list_select_related = ['name', 'branches']

# Register the parent model's admin class
admin.site.register(MedicalPartner, MedicalPartnerAdmin)
admin.site.register(MedicalPartnerOffer)
admin.site.register(MedicalPartnerOfferApplied)
# admin.site.register(MedicalPartnerOffer, MedicalPartnerOfferAdminInline)

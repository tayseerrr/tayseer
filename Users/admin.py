from django.contrib import admin
from .models import User
from django.contrib.auth.admin import UserAdmin
from Users.models import *
from django.utils.translation import gettext as _

class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ['email', 'account_type', 'email_active']
    ordering = ['email']

    fieldsets = (
        (None, {"fields": ("email", "password", "email_active", "is_active",
                           )}),
        (_("Personal info"), {"fields": ("first_name", "last_name","account_type","address")}),

        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )
    radio_fields = {"account_type": admin.HORIZONTAL}
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("email", "password1", "password2"),
            },
        ),
    )
    search_fields = ["email"]

class StudentProfileAdmin(admin.ModelAdmin):
    # user, roll_no, specialization, collage, enrollment_year, level, average, study_type,loan
    model = StudentProfile
    list_display = ['user', 'roll_no', 'specialization', 'collage', 'enrollment_year', 'level', 'average', 'study_type','loan']
#      make user searchable
    raw_id_fields = ['user']
    search_fields = ['user__email',]

admin.site.register(User, CustomUserAdmin)
admin.site.register(StudentProfile, StudentProfileAdmin)
admin.site.register(VerificationCode)


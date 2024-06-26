# Generated by Django 4.2.11 on 2024-05-06 14:26

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('ConsultanciesServices', '0009_rename_consulting_consultant'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='consultancybooking',
            unique_together={('booked_by', 'booked_for', 'date', 'time')},
        ),
    ]

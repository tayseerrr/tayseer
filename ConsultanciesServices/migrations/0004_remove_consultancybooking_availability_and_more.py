# Generated by Django 4.2.11 on 2024-04-27 13:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ConsultanciesServices', '0003_remove_consultancybooking_consulting_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='consultancybooking',
            name='availability',
        ),
        migrations.RemoveField(
            model_name='consultancybooking',
            name='datetime',
        ),
        migrations.AddField(
            model_name='consultancybooking',
            name='date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='consultancybooking',
            name='time',
            field=models.TimeField(blank=True, null=True),
        ),
    ]

# Generated by Django 4.2.11 on 2024-05-11 07:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ConsultanciesServices', '0010_alter_consultancybooking_unique_together'),
    ]

    operations = [
        migrations.AlterField(
            model_name='consultant',
            name='profile_picture',
            field=models.ImageField(blank=True, null=True, upload_to='consultants/profile_pictures/'),
        ),
    ]

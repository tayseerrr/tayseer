# Generated by Django 4.2.11 on 2024-05-06 03:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MedicalServices', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='medicalpartnerofferapplied',
            name='applied_time',
        ),
        migrations.AlterField(
            model_name='medicalpartnerofferapplied',
            name='applied_date',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]

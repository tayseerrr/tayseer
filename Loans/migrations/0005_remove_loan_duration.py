# Generated by Django 4.2.11 on 2024-04-27 09:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Loans', '0004_loan_apply_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='loan',
            name='duration',
        ),
    ]

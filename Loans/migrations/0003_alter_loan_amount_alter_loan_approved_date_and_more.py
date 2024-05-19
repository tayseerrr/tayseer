# Generated by Django 4.2.11 on 2024-04-25 22:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Loans', '0002_rename_issued_date_loan_approved_date_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='loan',
            name='amount',
            field=models.DecimalField(decimal_places=2, default=2000, max_digits=10),
        ),
        migrations.AlterField(
            model_name='loan',
            name='approved_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='loan',
            name='duration',
            field=models.IntegerField(default=8),
        ),
    ]

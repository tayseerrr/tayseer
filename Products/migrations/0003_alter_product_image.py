# Generated by Django 4.2.11 on 2024-04-15 19:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Products', '0002_bill_alter_product_supplier_order_bill_product_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='products/images/'),
        ),
    ]

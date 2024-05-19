# Generated by Django 4.2.11 on 2024-04-15 20:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Suppliers', '0001_initial'),
        ('Products', '0004_rename_mark_product_brand'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='supplier',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='products', to='Suppliers.supplier'),
        ),
    ]

# Generated by Django 4.2.11 on 2024-04-26 00:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Products', '0011_order_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='order_date',
            field=models.DateTimeField(auto_created=True, auto_now_add=True, null=True),
        ),
    ]
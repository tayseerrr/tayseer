# Generated by Django 4.2.11 on 2024-04-17 22:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Products', '0008_order_adderss'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order',
            old_name='adderss',
            new_name='adders',
        ),
    ]

# Generated by Django 4.2.11 on 2024-04-15 19:40

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Suppliers', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Products', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bill',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('bill_date', models.DateField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('delivery_charge', models.DecimalField(decimal_places=2, max_digits=10)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='bills', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterField(
            model_name='product',
            name='supplier',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='products', to='Suppliers.supplier'),
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('order_id', models.AutoField(primary_key=True, serialize=False)),
                ('order_no', models.UUIDField(db_index=True, editable=False, unique=True)),
                ('receiving_method', models.CharField(choices=[('D', 'Delivery'), ('P', 'Pickup from store')], max_length=1)),
                ('bill', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='orders', to='Products.bill')),
            ],
        ),
        migrations.AddField(
            model_name='bill',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='bills', to='Products.product'),
        ),
        migrations.AddField(
            model_name='bill',
            name='supplier',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='bills', to='Suppliers.supplier'),
        ),
    ]

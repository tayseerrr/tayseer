# Generated by Django 4.2.11 on 2024-04-14 20:25

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Loan',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=10)),
                ('duration', models.IntegerField()),
                ('issued_date', models.DateField()),
                ('status', models.BooleanField(default=True)),
            ],
        ),
    ]

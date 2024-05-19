# Generated by Django 4.2.11 on 2024-05-04 06:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='MedicalPartner',
            fields=[
                ('mid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=64)),
                ('logo', models.ImageField(upload_to='', verbose_name='medical/partners/logos/')),
                ('description', models.TextField()),
                ('branches', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='MedicalPartnerOffer',
            fields=[
                ('offer_id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=64)),
                ('discount', models.FloatField()),
                ('partner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='offers', to='MedicalServices.medicalpartner')),
            ],
        ),
        migrations.CreateModel(
            name='MedicalPartnerOfferApplied',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('applied_date', models.DateField()),
                ('applied_time', models.TimeField()),
                ('offer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='applied_offers', to='MedicalServices.medicalpartneroffer')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='applied_offers', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
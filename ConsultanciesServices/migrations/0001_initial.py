# Generated by Django 4.2.11 on 2024-04-14 20:25

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ConsultancyBooking',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('datetime', models.DateTimeField()),
                ('availability', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Consulting',
            fields=[
                ('cid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=64)),
                ('specialization', models.CharField(max_length=64)),
                ('experience', models.IntegerField()),
                ('description', models.TextField(max_length=256)),
                ('profile_picture', models.ImageField(upload_to='consultants/profile_pictures/')),
                ('status', models.BooleanField(default=True)),
            ],
        ),
    ]

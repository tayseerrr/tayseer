# Generated by Django 4.2.11 on 2024-05-04 09:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ConsultanciesServices', '0008_alter_consulting_specialization'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Consulting',
            new_name='Consultant',
        ),
    ]

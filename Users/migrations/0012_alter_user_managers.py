# Generated by Django 4.2.11 on 2024-05-02 13:48

import Users.models.user
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0011_studentprofile_graduation_studentprofile_warning'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='user',
            managers=[
                ('objects', Users.models.user.MyUserManager()),
            ],
        ),
    ]

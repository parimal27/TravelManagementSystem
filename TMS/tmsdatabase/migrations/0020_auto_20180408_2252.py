# Generated by Django 2.0.2 on 2018-04-08 17:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0019_auto_20180408_2225'),
    ]

    operations = [
        migrations.RenameField(
            model_name='hroombooked',
            old_name='hrbid',
            new_name='rbid',
        ),
    ]

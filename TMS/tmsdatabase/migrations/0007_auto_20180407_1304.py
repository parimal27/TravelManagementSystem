# Generated by Django 2.0.2 on 2018-04-07 07:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0006_auto_20180407_1102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bseatbooked',
            name='mno',
            field=models.BigIntegerField(),
        ),
    ]

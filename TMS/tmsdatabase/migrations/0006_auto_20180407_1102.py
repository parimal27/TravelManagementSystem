# Generated by Django 2.0.2 on 2018-04-07 05:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0005_auto_20180407_0221'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fseatbooked',
            name='mno',
            field=models.BigIntegerField(),
        ),
    ]

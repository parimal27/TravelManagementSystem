# Generated by Django 2.0.2 on 2018-04-08 18:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0022_auto_20180408_2342'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hroombooked',
            name='hid',
            field=models.IntegerField(default='0'),
        ),
        migrations.AlterField(
            model_name='hroombooked',
            name='uid',
            field=models.CharField(default='parimal', max_length=50),
        ),
    ]
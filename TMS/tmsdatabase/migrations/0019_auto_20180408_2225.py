# Generated by Django 2.0.2 on 2018-04-08 16:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0018_hroombooked_rno'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hroombooked',
            name='bookedfrom',
            field=models.DateField(verbose_name='date published'),
        ),
        migrations.AlterField(
            model_name='hroombooked',
            name='bookedtill',
            field=models.DateField(verbose_name='date published'),
        ),
    ]

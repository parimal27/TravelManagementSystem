# Generated by Django 2.0.2 on 2018-04-07 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0008_auto_20180407_2055'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tseatbooked',
            name='coid',
        ),
        migrations.RemoveField(
            model_name='tseatbooked',
            name='tid',
        ),
        migrations.RemoveField(
            model_name='tseatbooked',
            name='uid',
        ),
        migrations.RemoveField(
            model_name='tseatfare',
            name='bid',
        ),
        migrations.RenameField(
            model_name='bseatbooked',
            old_name='btime',
            new_name='rtime',
        ),
        migrations.AddField(
            model_name='bseatbooked',
            name='rdate',
            field=models.DateField(default='1999-1-12'),
        ),
        migrations.AddField(
            model_name='fseatbooked',
            name='rdate',
            field=models.DateField(default='1999-1-12'),
        ),
        migrations.AddField(
            model_name='fseatbooked',
            name='rtime',
            field=models.TimeField(default='00:00:00'),
        ),
        migrations.AlterField(
            model_name='fseatbooked',
            name='bdate',
            field=models.DateField(default='1999-2-12', verbose_name='date published'),
        ),
        migrations.DeleteModel(
            name='TSeatBooked',
        ),
        migrations.DeleteModel(
            name='TSeatFare',
        ),
    ]

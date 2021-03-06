# Generated by Django 2.0.2 on 2018-04-06 18:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tmsdatabase', '0003_bseatbooked_session'),
    ]

    operations = [
        migrations.CreateModel(
            name='FSeatBooked',
            fields=[
                ('fsbid', models.IntegerField(primary_key=True, serialize=False)),
                ('pname', models.CharField(max_length=50)),
                ('page', models.IntegerField()),
                ('mno', models.IntegerField()),
                ('email', models.CharField(max_length=50)),
                ('fid', models.IntegerField()),
                ('spoint', models.CharField(default=True, max_length=50)),
                ('epoint', models.CharField(default=True, max_length=50)),
                ('seatno', models.IntegerField()),
                ('uid', models.CharField(max_length=50)),
                ('bdate', models.DateTimeField(default='1999-2-12', verbose_name='date published')),
                ('session', models.CharField(default='0', max_length=50)),
                ('fare', models.IntegerField(default='0')),
            ],
        ),
        migrations.RemoveField(
            model_name='fseatfare',
            name='fid',
        ),
        migrations.AddField(
            model_name='flight',
            name='nos',
            field=models.IntegerField(default='0'),
        ),
        migrations.AddField(
            model_name='flight',
            name='seatfare',
            field=models.IntegerField(default='0'),
        ),
        migrations.DeleteModel(
            name='FSeatFare',
        ),
    ]

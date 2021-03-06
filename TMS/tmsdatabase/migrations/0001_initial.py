# Generated by Django 2.0.2 on 2018-04-06 06:49

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BBetStationInfo',
            fields=[
                ('betsid', models.IntegerField(primary_key=True, serialize=False)),
                ('btype', models.CharField(default=True, max_length=20)),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('atime', models.CharField(max_length=15)),
                ('dtime', models.CharField(max_length=15)),
                ('seatfare', models.IntegerField(default=False)),
                ('seatype', models.CharField(default=False, max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='BSeatBooked',
            fields=[
                ('bsbid', models.IntegerField(primary_key=True, serialize=False)),
                ('betsid', models.IntegerField()),
                ('pname', models.CharField(max_length=50)),
                ('page', models.IntegerField()),
                ('mno', models.IntegerField()),
                ('email', models.CharField(max_length=50)),
                ('bid', models.IntegerField()),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('seatno', models.IntegerField()),
                ('uid', models.CharField(max_length=50)),
                ('bdate', models.DateTimeField(default='1999-2-12', verbose_name='date published')),
            ],
        ),
        migrations.CreateModel(
            name='Bus',
            fields=[
                ('bid', models.IntegerField(primary_key=True, serialize=False)),
                ('btype', models.CharField(max_length=20)),
                ('noofseats', models.IntegerField()),
                ('spoint', models.CharField(default=True, max_length=50)),
                ('epoint', models.CharField(default=True, max_length=50)),
                ('bownerid', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Coach',
            fields=[
                ('coid', models.IntegerField(primary_key=True, serialize=False)),
                ('noofseats', models.IntegerField()),
                ('ctype', models.CharField(default=True, max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Flight',
            fields=[
                ('fid', models.IntegerField(primary_key=True, serialize=False)),
                ('fname', models.CharField(default=True, max_length=50)),
                ('spoint', models.CharField(default=True, max_length=50)),
                ('epoint', models.CharField(default=True, max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='FSeatFare',
            fields=[
                ('fsfid', models.IntegerField(primary_key=True, serialize=False)),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('seatfare', models.IntegerField()),
                ('seatype', models.CharField(max_length=15)),
                ('fid', models.ForeignKey(on_delete=False, to='tmsdatabase.Flight')),
            ],
        ),
        migrations.CreateModel(
            name='Hotels',
            fields=[
                ('hid', models.IntegerField(primary_key=True, serialize=False)),
                ('hname', models.CharField(default=True, max_length=50)),
                ('howner', models.CharField(default=True, max_length=50)),
                ('hcountry', models.CharField(default=True, max_length=50)),
                ('hstate', models.CharField(default=True, max_length=50)),
                ('hcity', models.CharField(default=True, max_length=50)),
                ('noofrooms', models.IntegerField()),
                ('htype', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='HRoomBooked',
            fields=[
                ('hrbid', models.IntegerField(primary_key=True, serialize=False)),
                ('hrfid', models.IntegerField()),
                ('bookedfrom', models.DateTimeField(verbose_name='date published')),
                ('bookedtill', models.DateTimeField(verbose_name='date published')),
                ('hid', models.ForeignKey(on_delete=False, to='tmsdatabase.Hotels')),
                ('uid', models.ForeignKey(on_delete=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='HRoomFare',
            fields=[
                ('hrfid', models.IntegerField(primary_key=True, serialize=False)),
                ('roomtype', models.CharField(default=True, max_length=50)),
                ('roomfare', models.IntegerField()),
                ('hid', models.ForeignKey(on_delete=False, to='tmsdatabase.Hotels')),
            ],
        ),
        migrations.CreateModel(
            name='IsUserActive',
            fields=[
                ('uid', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('active', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='TBetStationInfo',
            fields=[
                ('tbsid', models.IntegerField(primary_key=True, serialize=False)),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('atime', models.CharField(max_length=15)),
                ('dtime', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Train',
            fields=[
                ('tid', models.IntegerField(primary_key=True, serialize=False)),
                ('tname', models.CharField(max_length=55)),
                ('spoint', models.CharField(default=True, max_length=50)),
                ('epoint', models.CharField(default=True, max_length=50)),
                ('btype', models.CharField(max_length=20)),
                ('noofcoach', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='TSeatBooked',
            fields=[
                ('tsbid', models.IntegerField(primary_key=True, serialize=False)),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('seatno', models.IntegerField()),
                ('bdate', models.DateTimeField(verbose_name='date published')),
                ('coid', models.ForeignKey(on_delete=False, to='tmsdatabase.Coach')),
                ('tid', models.ForeignKey(on_delete=False, to='tmsdatabase.Bus')),
                ('uid', models.ForeignKey(on_delete=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='TSeatFare',
            fields=[
                ('tsfid', models.IntegerField(primary_key=True, serialize=False)),
                ('src', models.CharField(default=True, max_length=50)),
                ('dst', models.CharField(default=True, max_length=50)),
                ('seatfare', models.IntegerField()),
                ('seatype', models.CharField(max_length=15)),
                ('bid', models.ForeignKey(on_delete=False, to='tmsdatabase.Train')),
            ],
        ),
        migrations.AddField(
            model_name='tbetstationinfo',
            name='tid',
            field=models.ForeignKey(on_delete=False, to='tmsdatabase.Train'),
        ),
        migrations.AddField(
            model_name='coach',
            name='tid',
            field=models.ForeignKey(on_delete=False, to='tmsdatabase.Train'),
        ),
        migrations.AddField(
            model_name='bbetstationinfo',
            name='bid',
            field=models.ForeignKey(on_delete=False, to='tmsdatabase.Bus'),
        ),
    ]

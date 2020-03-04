from django.db import models
from django.contrib.auth.models import User 
# Create your models here.
  
class Bus(models.Model):
	bid=models.IntegerField(primary_key=True)
	btype=models.CharField(max_length=20)
	noofseats=models.IntegerField()
	spoint=models.CharField(max_length=50)
	epoint=models.CharField(max_length=50)
	bownerid=models.IntegerField()
	
class Train(models.Model):
	tid=models.IntegerField(primary_key=True)
	tname=models.CharField(max_length=55)
	spoint=models.CharField(max_length=50)
	epoint=models.CharField(max_length=50)
	btype=models.CharField(max_length=20)
	noofcoach=models.IntegerField()
class Coach(models.Model):
	coid=models.IntegerField(primary_key=True)
	noofseats=models.IntegerField()
	ctype=models.CharField(max_length=50)
	tid=models.ForeignKey(Train,on_delete=False)
class TBetStationInfo(models.Model):
	tbsid=models.IntegerField(primary_key=True)
	tid=models.ForeignKey(Train,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	atime=models.CharField(max_length=15)
	dtime=models.CharField(max_length=15)
class TSeatBooked(models.Model):
	tsbid=models.IntegerField(primary_key=True)
	tid=models.ForeignKey(Bus,on_delete=False)
	coid=models.ForeignKey(Coach,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	seatno=models.IntegerField()
	uid=models.ForeignKey(User,on_delete=False)
	bdate=models.DateTimeField('date published')

class TSeatFare(models.Model):
	tsfid=models.IntegerField(primary_key=True)
	bid=models.ForeignKey(Train,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	seatfare=models.IntegerField()
	seatype=models.CharField(max_length=15)
class Flight(models.Model):
	fid=models.IntegerField(primary_key=True)
	fname=models.CharField(max_length=50)
	spoint=models.CharField(max_length=50)
	epoint=models.CharField(max_length=50)
class FSeatFare(models.Model):
	fsfid=models.IntegerField(primary_key=True)
	fid=models.ForeignKey(Flight,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	seatfare=models.IntegerField()
	seatype=models.CharField(max_length=15)	

	
class BBetStationInfo(models.Model):
	betsid=models.IntegerField(primary_key=True)
	bid=models.ForeignKey(Bus,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	atime=models.CharField(max_length=15)
	dtime=models.CharField(max_length=15)
class BSeatFare(models.Model):
	bsfid=models.IntegerField(primary_key=True)
	betsid=models.ForeignKey(BBetStationInfo,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	seatfare=models.IntegerField()
	seatype=models.CharField(max_length=15)

class BSeatBooked(models.Model):
	bsbid=models.IntegerField(primary_key=True)
	bid=models.ForeignKey(Bus,on_delete=False)
	src=models.CharField(max_length=50)
	dst=models.CharField(max_length=50)
	seatno=models.IntegerField()
	uid=models.ForeignKey(User,on_delete=False)
	bdate=models.DateTimeField('date published')
	
class Hotels(models.Model):
	hid=models.IntegerField(primary_key=True)
	hname=models.CharField(max_length=50)
	howner=models.CharField(max_length=50)
	hcountry=models.CharField(max_length=50)
	hstate=models.CharField(max_length=50)
	hcity=models.CharField(max_length=50)
	noofrooms=models.IntegerField()
	htype=models.CharField(max_length=20)

class HRoomFare(models.Model):
	hrfid=models.IntegerField(primary_key=True)
	hid=models.ForeignKey(Hotels,on_delete=False)
	roomtype=models.CharField(max_length=50)
	roomfare=models.IntegerField()
	
class HRoomBooked(models.Model):
	hrbid=models.IntegerField(primary_key=True)
	hid=models.ForeignKey(Hotels,on_delete=False)
	uid=models.ForeignKey(User,on_delete=False)
	hrfid=models.IntegerField()
	bookedfrom=models.DateTimeField('date published')
	bookedtill=models.DateTimeField('date published')

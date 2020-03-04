from django.db import models
from django.contrib.auth.models import User 
# Create your models here.
  
class Bus(models.Model):
	bid=models.IntegerField(primary_key=True)
	btype=models.CharField(max_length=20)
	noofseats=models.IntegerField()
	spoint=models.CharField(max_length=50,default=True)
	epoint=models.CharField(max_length=50,default=True)
	bownerid=models.IntegerField()

class Train(models.Model):
	tid=models.IntegerField(primary_key=True)
	tname=models.CharField(max_length=55)
	spoint=models.CharField(max_length=50,default=True)
	epoint=models.CharField(max_length=50,default=True)
	btype=models.CharField(max_length=20)
	noofcoach=models.IntegerField()
class BSeatBooked(models.Model):
	bsbid=models.IntegerField(primary_key=True)
	betsid=models.IntegerField()
	pname=models.CharField(max_length=50)
	page=models.IntegerField()
	mno=models.BigIntegerField()
	email=models.CharField(max_length=50)
	bid=models.IntegerField()
	src=models.CharField(max_length=50,default=True)
	dst=models.CharField(max_length=50,default=True)
	seatno=models.IntegerField()
	uid=models.CharField(max_length=50)
	bdate=models.DateField('date published',default='1999-2-12')
	rdate=models.DateField(default='1999-1-12')
	session=models.CharField(max_length=50,default='0')
	fare=models.IntegerField(default='0')
	rtime=models.TimeField(default='00:00:00')
class Coach(models.Model):
	coid=models.IntegerField(primary_key=True)
	noofseats=models.IntegerField()
	ctype=models.CharField(max_length=50,default=True)
	tid=models.ForeignKey(Train,on_delete=False)
class TBetStationInfo(models.Model):
	tbsid=models.IntegerField(primary_key=True)
	tid=models.ForeignKey(Train,on_delete=False)
	src=models.CharField(max_length=50,default=True)
	dst=models.CharField(max_length=50,default=True)
	atime=models.CharField(max_length=15)
	dtime=models.CharField(max_length=15)

class Flight(models.Model):
	fid=models.IntegerField(primary_key=True)
	fname=models.CharField(max_length=50,default=True)
	spoint=models.CharField(max_length=50,default=True)
	epoint=models.CharField(max_length=50,default=True)
	seatfare=models.IntegerField(default='0')	
	nos=models.IntegerField(default='0')
	atime=models.CharField(max_length=15,default='0:0')
	dtime=models.CharField(max_length=15,default='0:0')
class FSeatBooked(models.Model):
	fsbid=models.IntegerField(primary_key=True)
	pname=models.CharField(max_length=50)
	page=models.IntegerField()
	mno=models.BigIntegerField()
	email=models.CharField(max_length=50)
	fid=models.IntegerField()
	spoint=models.CharField(max_length=50,default=True)
	epoint=models.CharField(max_length=50,default=True)
	seatno=models.IntegerField()
	uid=models.CharField(max_length=50)
	bdate=models.DateField('date published',default='1999-2-12')
	rtime=models.TimeField(default='00:00:00')
	rdate=models.DateField(default='1999-1-12')
	session=models.CharField(max_length=50,default='0')
	fare=models.IntegerField(default='0')	
class BBetStationInfo(models.Model):
	betsid=models.IntegerField(primary_key=True)
	bid=models.ForeignKey(Bus,on_delete=False)
	btype=models.CharField(max_length=20,default=True)
	src=models.CharField(max_length=50,default=True)
	dst=models.CharField(max_length=50,default=True)
	atime=models.CharField(max_length=15)
	dtime=models.CharField(max_length=15)
	seatfare=models.IntegerField(default=False)
	seatype=models.CharField(max_length=15,default=False)
	

class Hotels(models.Model):
	hid=models.IntegerField(primary_key=True)
	hname=models.CharField(max_length=50,default=True)
	howner=models.CharField(max_length=50,default=True)
	hcity=models.CharField(max_length=50,default=True)
	noofrooms=models.IntegerField()
	add=models.CharField(max_length=150,default='abc')
	roomfare=models.IntegerField(default='0')


	
class HRoomBooked(models.Model):
	rbid=models.IntegerField(primary_key=True)
	hid=models.IntegerField(default='0')
	uid=models.CharField(max_length=50,default='parimal')
	bookedfrom=models.DateField('date published')
	bookedtill=models.DateField('date published')
	rno=models.IntegerField(default='0')
	name=models.CharField(max_length=20,default='abc')
	age=models.IntegerField(default='0')
	rdate=models.DateField('Date published',default='1999-2-2')
	rtime=models.TimeField(default='00:00:00')
	fare=models.IntegerField(default='0')
class IsUserActive(models.Model):
	uid=models.CharField(max_length=50,primary_key=True)
	active=models.IntegerField()

		
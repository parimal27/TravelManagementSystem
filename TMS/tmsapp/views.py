from django.shortcuts import render, render_to_response
from django.views.generic import TemplateView, ListView
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.contrib.auth.models import User 
from tmsdatabase.models import Bus , Hotels, HRoomBooked, BBetStationInfo, FSeatBooked,BSeatBooked, IsUserActive ,Flight
from django.template.context import RequestContext
from django.db.models import Q, Max,Count
from django.db import connection
from django.contrib.auth.decorators import login_required
from datetime import datetime
import time
# Create your views here.


def login(request):
	c={}
	c.update(csrf(request))	
	return render(request,'login.html',c)

def auth_view(request):
	c={}
	c.update(csrf(request))
	username=request.POST.get('uname','')
	password=request.POST.get('password','')
	user=auth.authenticate(username=username , password=password)	
	ua=IsUserActive.objects.filter(uid=username)
	if user is not None:
		auth.login(request,user)
		request.session['uid']=username
		ua=IsUserActive.objects.filter(uid=username).update(active=1)
		ua=IsUserActive.objects.filter(uid=username)	
		return HttpResponseRedirect('/tmsapp/index')
	else:
		return render(request,'login.html',{'error':'username or password invalid','user_active':ua},c)
def logout(request):
	ua=IsUserActive.objects.filter(uid=request.session['uid']).update(active=0)
	ua=IsUserActive.objects.get(uid=request.session['uid'])
	if request.session['uid']:
		del request.session['uid']
	return render(request,'index.html',{'user_active':ua})

def reg(request):
	c={}
	c.update(csrf(request))	
	first_name = request.POST.get('fname', '') 
	last_name = request.POST.get('lname', '') 
	username = request.POST.get('uname', '') 
	password = request.POST.get('password', '')
	email = request.POST.get('email', '') 
	try:
		username_e=User.objects.get(username=username)
		if username_e.username==username:
			return render(request,'login.html',{'error':'username exists,please enter another....to signup','isreg':'true'},c)
	
	except Exception as e:
		s = User(first_name=first_name,last_name=last_name,username = username, password=make_password(password),email=email)
		s.save() 
		ua=IsUserActive(uid=username,active=0)
		ua.save()
		return HttpResponseRedirect('/tmsapp/login')
	

	'''if username_e.username!=username:
		s = User(first_name=first_name,last_name=last_name,username = username, password=make_password(password),email=email)
		s.save() 
		ua=IsUserActive(uid=username,active=0)
		ua.save()
		return HttpResponseRedirect('/tmsapp/login')
	else:
		return render(request,'login.html',{'error':'username exists,please enter another....to signup','isreg':'true'},c)
	'''

def index(request):
	username_exist=request.session.has_key('uid')
	if username_exist:
			ua=IsUserActive.objects.get(uid=request.session['uid'])
			return render(request,'index.html',{'user_active':ua})
	else:
			return render_to_response('index.html')

def booking(request):
	username_exist=request.session.has_key('uid')
	if username_exist:
			
				fli_info=Flight.objects.all().values('spoint').distinct()
				fli_info1=Flight.objects.all().values('epoint').distinct()
				hotels=Hotels.objects.all().values('hcity').distinct()
				
				return render(request,'booking.html',{'fli_info':fli_info,'hotels':hotels,'fli_info1':fli_info1})
				
	else:
		return HttpResponseRedirect("/tmsapp/login")

def ajx(request):
	src=request.GET.get('src','')
	#work like sql like 
	buslist=BBetStationInfo.objects.filter(src__contains=src).values('src').distinct()
	data = {
                'buslist': buslist,
            }
	return render_to_response('ajx.html',data)
def ajx1(request):
	src=request.GET.get('src','')
	#work like sql like 
	buslist=BBetStationInfo.objects.filter(src__contains=src).values('src').distinct()
	data = {
                'buslist': buslist,
            }
	return render_to_response('ajx1.html',data)

def searchbus(request):
	src=request.GET.get('src','')
	dst=request.GET.get('dst','')
	nop=request.GET.get('nop','')
	date=request.GET.get('date','')
	buslist1=BBetStationInfo.objects.filter(src=src,dst=dst)
	if buslist1:
		data={'buslist':buslist1,'nop':nop,'src':src,'dst':dst,'date':date}
		return render(request,"stations.html",data)
	else:
		  
		fli_info=Flight.objects.all().values('spoint').distinct()
		fli_info1=Flight.objects.all().values('epoint').distinct()
		hotels=Hotels.objects.all().values('hcity').distinct()
		#hroom=HRoomFare.objects.all().values('roomtype').distinct()
		return render(request,'booking.html',{'hotels':hotels,'error':'no buses found','fli_info':fli_info,'fli_info1':fli_info1})

#bookflight
def searchflight(request):
	c={}
	c.update(csrf(request))
	spoint=request.GET.get('src','')
	epoint=request.GET.get('dst','')
	date=request.GET.get('date','')
	nop=request.GET.get('nop','')
	try:
		f1_info=Flight.objects.get(spoint=spoint,epoint=epoint)
		bnos=FSeatBooked.objects.filter(fid=f1_info.fid,bdate=date)
		return render(request,"fbookseat.html",{'spoint':spoint,'epoint':epoint,'nos':f1_info.nos,'f1_info':f1_info,'bnos':bnos,'nop':nop,'date':date,'fid':f1_info.fid},c)
	except Exception as e:
		
		fli_info=Flight.objects.all().values('spoint').distinct()
		fli_info1=Flight.objects.all().values('epoint').distinct()
		hotels=Hotels.objects.all().values('hcity').distinct()
		#hroom=HRoomFare.objects.all().values('roomtype').distinct()
		return render(request,'booking.html',{'hotels':hotels,'fli_info':fli_info,'fli_info1':fli_info1,'errorf':'no flight found'})
		
	
	#for x in range(1,(int(nop)+1)):
		
	
def fbookseat(request):
	nop=request.session.get('nop')
	spoint=request.POST.get('spoint','')
	epoint=request.POST.get('epoint','')
	seatfare=request.POST.get('seatfare','')
	date=request.POST.get('date','')
	mno=request.POST.get('mno','')
	email=request.POST.get('email','')
	uid=request.session['uid']
	pas=request.POST.getlist('pass[]')
	age=request.POST.getlist('age[]')
	fid=request.POST.get('fid','')
	s=request.POST.getlist("seat[]")
	for x in range(0,len(s)):
			#s=request.POST.get(str(x),'')
			
			bn=FSeatBooked(rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"),fare=seatfare,spoint=spoint,seatno=s[x],uid=uid,fid=fid,bdate=date,email=email,mno=mno,page=age[x],pname=pas[x],epoint=epoint,session=request.session.session_key)
			bn.save()
	info=FSeatBooked.objects.filter(uid=request.session['uid'],session=request.session.session_key,rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"))
	total=0
	for x in range(len(info)):
		total=total+info[x].fare
		bdate=info[x].bdate
		fid=info[x].fid
	f=Flight.objects.get(fid=fid)
	#mno=BSeatBooked.objects.filter(uid=request.session['uid'])
	cinfo=User.objects.get(username=request.session['uid'])
	return render(request,"fbill.html",{'f':f,'info':info,'cinfo':cinfo,'total':total,'bdate':bdate})
	#return HttpResponseRedirect('/tmsapp/bill') 
def bookseat(request):
	c={}
	c.update(csrf(request))
	srcid=request.GET.get('sname','')
	srcid1=request.GET.get('betsid','')
	src=request.GET.get('src','')
	seatfare=request.GET.get('seatfare','')
	date=request.GET.get('date','')
	dst=request.GET.get('dst','')
	nop=request.GET.get('nop','')
	request.session['nop']=nop
	bnos=BSeatBooked.objects.filter(bid=srcid,bdate=date)
	nos=Bus.objects.get(bid=srcid)

	return render(request,"bookseat.html",{'nos':nos,'src':src,'date':date,'seatfare':seatfare,'dst':dst,'bnos':bnos,'nop':nop,'srcid':srcid,'srcid1':srcid1},c)
def bookbusseat(request):
	#nop=request.POST.get('nop')
	nop=request.session.get('nop')
	src=request.POST.get('src','')
	dst=request.POST.get('dst','')
	seatfare=request.POST.get('seatfare','')
	date=request.POST.get('date','')
	mno=request.POST.get('mno','')
	email=request.POST.get('email','')
	uid=request.session['uid']
	pas=request.POST.getlist('pass[]')
	age=request.POST.getlist('age[]')
	bid=request.POST.get('srcid','')
	betsid=request.POST.get('srcid1','')
	s=request.POST.getlist("seat[]")
	
	for x in range(0,len(s)):
			#s=request.POST.get(str(x),'')
			bn=BSeatBooked(rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"),fare=seatfare,src=src,dst=dst,seatno=s[x],uid=uid,bid=bid,bdate=date,email=email,mno=mno,betsid=betsid,page=age[x],pname=pas[x],session=request.session.session_key)
			bn.save()

	return HttpResponseRedirect('/tmsapp/bill') 
def canclet(request):
	c={}
	c.update(csrf(request))
	username_exist=request.session.has_key('uid')
	if username_exist:
		#cursor=connection.cursor()
		#cursor.execute('''select seatno,src,dst from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by bdate''')
		#flight=FSeatBooked.objects.filter(uid=request.session['uid'])
		#b=BSeatBooked.objects.filter(uid=request.session['uid'])
		#bus=cursor.fetchall()
		businfo=BSeatBooked.objects.raw('''select bsbid,rdate,rtime from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		bus=set()
		for x in businfo:
			b=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			bus.add(b)
		flightinfo=FSeatBooked.objects.raw('''select fsbid,rdate,rtime from tmsdatabase_FSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		flight=set()
		for x in flightinfo:
			b=FSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			flight.add(b)
		return render(request,"canclet1.html",{'flight':flight,'bus':bus},c)
	else:
		return HttpResponseRedirect('/tmsapp/login/')
def canclebusticket(request):
	c={}
	c.update(csrf(request))
	#seatref=request.POST.getlist('pass[]')
	try:
		listc=request.POST.getlist("pass[]")
		for x in listc:
			book=BSeatBooked.objects.filter(uid=request.session['uid'],bsbid=x).delete()
		businfo=BSeatBooked.objects.raw('''select bsbid,rdate,rtime from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		bus=set()
		for x in businfo:
			b=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			bus.add(b)
		flightinfo=FSeatBooked.objects.raw('''select fsbid,rdate,rtime from tmsdatabase_FSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		flight=set()
		for x in flightinfo:
			b=FSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			flight.add(b)
		return render(request,"canclet1.html",{'ferror':'seats canceled...','flight':flight,'bus':bus},c)
	except Exception as e:
		businfo=BSeatBooked.objects.raw('''select bsbid,rdate,rtime from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		bus=set()
		for x in businfo:
			b=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			bus.add(b)
		flightinfo=FSeatBooked.objects.raw('''select fsbid,rdate,rtime from tmsdatabase_FSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		flight=set()
		for x in flightinfo:
			b=FSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			flight.add(b)
		return render(request,"canclet1.html",{'ferror':'seat not found','flight':flight,'bus':bus},c)
def cancleflightticket(request):
	c={}
	c.update(csrf(request))
	#seatref=request.POST.getlist('pass[]')
	try:
		listf=request.POST.getlist("pass[]")
		for x in listf:
			book=FSeatBooked.objects.filter(uid=request.session['uid'],fsbid=x).delete()
		businfo=BSeatBooked.objects.raw('''select bsbid,rdate,rtime from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		bus=set()
		for x in businfo:
			b=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			bus.add(b)
		flightinfo=FSeatBooked.objects.raw('''select fsbid,rdate,rtime from tmsdatabase_FSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		flight=set()
		for x in flightinfo:
			b=FSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			flight.add(b)
		return render(request,"canclet1.html",{'ferror':'seats canceled...','flight':flight,'bus':bus},c)
	except Exception as e:
		businfo=BSeatBooked.objects.raw('''select bsbid,rdate,rtime from tmsdatabase_BSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		bus=set()
		for x in businfo:
			b=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			bus.add(b)
		flightinfo=FSeatBooked.objects.raw('''select fsbid,rdate,rtime from tmsdatabase_FSeatBooked where uid="'''+request.session['uid']+'''" group by rdate,rtime''')
		flight=set()
		for x in flightinfo:
			b=FSeatBooked.objects.filter(uid=request.session['uid'],rdate=x.rdate,rtime=x.rtime)
			flight.add(b)
		return render(request,"canclet1.html",{'ferror':'seat not found','flight':flight,'bus':bus},c)
		
def stations(request):

	return render(request,"stations.html")

def a(request):
	return render_to_response('a.html')
def bill(request):
	info=BSeatBooked.objects.filter(uid=request.session['uid'],rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"))
	total=0
	
	for x in range(len(info)):
		total=total+info[x].fare
		bdate=info[x].bdate
		bid=info[x].bid
		betsid=info[x].betsid
		jdate=info[x].rdate
	businfo=Bus.objects.get(bid=bid)
	betinfo=BBetStationInfo.objects.get(betsid=betsid)
	#mno=BSeatBooked.objects.filter(uid=request.session['uid'])
	cinfo=User.objects.get(username=request.session['uid'])
	return render(request,"bill.html",{'businfo':businfo,'betinfo':betinfo,'info':info,'cinfo':cinfo,'total':total,'rdate':jdate,'bdate':bdate})
def slist(request):
	return render_to_response('slist.html')


def searchhotel(request):
	hcity=request.GET.get("hcity","")
	cidate=request.GET.get("cidate","")
	codate=request.GET.get("codate","")
	hotels=Hotels.objects.filter(hcity=hcity)
	return render(request,"hotels.html",{'hotels':hotels,'cidate':cidate,'codate':codate})
def bookhotel(request):
	cidate=request.GET.get("cidate","")
	codate=request.GET.get("codate","")
	hid=request.GET.get("hid","")
	c={}
	c.update(csrf(request))
	return render(request,"bookhotel.html",{'cidate':cidate,'codate':codate,'hid':hid},c)	
def hotelroombook(request):
	c={}
	c.update(csrf(request))
	cidate=request.POST.get("cidate",'')
	uid=request.session['uid']
	hid=request.POST.get("hid",'')
	p=request.POST.getlist('passname[]')
	a=request.POST.getlist('passage[]')
	codate=request.POST.get("codate",'')
	nor=request.POST.get("nor",'')
	h=Hotels.objects.get(hid=hid)
	try:
		hotel=HRoomBooked.objects.filter(bookedfrom=cidate,bookedtill=codate,hid=hid).aggregate(Max('rno'))['rno__max']
	except Exception as e:
		hotel='0'
	if hotel is None:
		hotel=0
	
	ma=[]
	v='success'
	fare=int(nor)*int(h.roomfare)
	if int(h.noofrooms) > int(hotel)+int(nor):
		for x in range(0,int(nor)+1):
			hotel=hotel+1
			ma.append(hotel)
			
		i=0
		j=0
		for x in range(0,len(p)):
			if(x%3==0):
				j=ma[i]
				i=i+1
			
			bn=HRoomBooked(rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"),fare=fare,rno=j,uid=uid,hid=hid,bookedfrom=cidate,bookedtill=codate,age=a[x],name=p[x])
			bn.save()
		cinfo=User.objects.get(username=request.session['uid'])
		hinfo=Hotels.objects.get(hid=hid)
		hrinfo=HRoomBooked.objects.filter(uid=request.session['uid'],rdate=datetime.now().strftime("%Y-%m-%d"),rtime=datetime.now().strftime("%I:%M"))

		return render(request,"hbill.html",{'cinfo':cinfo,'h':hinfo,'info':hrinfo})
	else:
		v='sorry...all rooms are full..'
	#hotel1=HRoomBooked.objects.raw('''select * from tmsdatabase_HRoomBooked where hrbid="'''+hotel.mhrb+'''"''')
		return render(request,"bookhotel.html",{'cidate':cidate,'codate':codate,'h1':v,'hid':hid},c)	

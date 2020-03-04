from tmsapp.views import login, searchhotel, bookhotel,canclebusticket, cancleflightticket, index, canclet, booking, fbookseat, auth_view, bill, searchflight,reg, bookbusseat, logout, ajx, a, searchbus, hotelroombook, ajx1 ,stations ,bookseat ,slist
from django.contrib.auth import views as auth_views
from django.conf.urls import url
from django.urls import path
urlpatterns=[
	url(r'^login/$',login,name='login'),
	url(r'^canclebusticket/$',canclebusticket,name='canclebusticket'),
	url(r'^cancleflightticket/$',cancleflightticket,name='cancleflight'),
	url(r'^searchhotel/$',searchhotel,name='searchhotel'),
	url(r'^auth/$',auth_view),
	url(r'^reg/$',reg),
	url(r'^logout/$',logout,name='logout'),
	url(r'^index/$', index,name='index'),
	url(r'^booking/$', booking,name='booking'),
	url(r'^hotelroombook/$', hotelroombook,name='hotelroombook'),
	url(r'^canclet/$', canclet,name='canclet'),
	url(r'^searchflight/$', searchflight,name='searchflight'),
	url(r'^ajx/$', ajx,name='ajx'),
	url(r'^ajx1/$', ajx1,name='ajx1'),
	url(r'^stations/$',stations,name='stations'),
	url(r'^bookseat/$',bookseat,name='bookseat'),
	url(r'^bookhotel/$',bookhotel,name='bookhotel'),
	url(r'^fbookseat/$',fbookseat,name='fbookseat'),
	url(r'^bill/$',bill,name='bill'),
	url(r'^searchbus/$',searchbus,name='searchbus'),
	url(r'^slist/$',slist,name='slist'),
	url(r'^bookbusseat/$',bookbusseat,name='bookbusseat'),
	url(r'^a/$', a,name='a'),

	# path('buslist/',BusListView.as_view(), name = 'buslist'),
	#url(r'^loggedin/$', loggedin),
	#url(r'^invalidlogin/$', invalidlogin),
]
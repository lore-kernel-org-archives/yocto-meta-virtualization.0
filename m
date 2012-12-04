Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 66CD4E0045D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Dec 2012 13:43:22 -0800 (PST)
Received: from SESTOEX05.enea.se ([fe80::41cb:8d2e:2e90:a183]) by
	SESTOEX08.enea.se ([fe80::fda4:d8b2:80c9:b320%24]) with mapi id
	14.02.0318.001; Tue, 4 Dec 2012 22:43:20 +0100
From: =?iso-8859-1?Q?David_Nystr=F6m?= <David.Nystrom@enea.com>
To: "ray.danks@se-eng.com" <ray.danks@se-eng.com>
Thread-Topic: [meta-virtualization] PACKAGECONFIG variables.
Thread-Index: AQHN0jcVY+J7cUZi7kav/clHnMTBtpgIvLYAgAAaUgCAAFVLsA==
Date: Tue, 4 Dec 2012 21:43:20 +0000
Message-ID: <88701C38B5D07249817D428430999C9128A89A70@sestoex05.enea.se>
References: <50BE184E.2000403@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F260F@IRSMSX101.ger.corp.intel.com>
	<50BE1EE8.30504@enea.com>,<50BE34FC.8040205@se-eng.com>
In-Reply-To: <50BE34FC.8040205@se-eng.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: PACKAGECONFIG variables.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 21:43:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_88701C38B5D07249817D428430999C9128A89A70sestoex05enease_"

--_000_88701C38B5D07249817D428430999C9128A89A70sestoex05enease_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ray,

Yes, of course. Let's add a *-minimal package configs,
if none are set, we'll let it autodetect + add full dependencies otherwise.
Is it OK for you if I set it to auto detect by default? , this would imply
a local.conf addition to optimize for footprint.
I'm guessing package config selects cannot be set from an image file, I'll =
give that a try tomorrow.

Br,
David

Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Raymond Danks [ray.danks@se-eng.com]
Received: Tuesday, 04 Dec 2012, 18:38
To: David Nystr=F6m [David.Nystrom@enea.com]
CC: Prica, Mihai [mihai.prica@intel.com]; meta-virtualization@yoctoproject.=
org [meta-virtualization@yoctoproject.org]
Subject: Re: [meta-virtualization] PACKAGECONFIG variables.

David,

XenAPI is used by XenServer and Xen Cloud Platform.  There is currently
no underlying metadata support for these packages, so this should be
disabled.

I do, in fact have binary size constraints.  I see where you are going
with this, but would it be possible instead to add a "detect" or "all"
to PACKAGECONFIG?  I suppose an alternative would be to add "*-minimal"
to PACKAGECONFIG which tweak the configure to create minimal build
configurations.

Ray

On 12/04/2012 09:03 AM, David Nystr=F6m wrote:
> I have some issues with how PACKAGECONFIG works, do you guys mind if I
> disable all --without functionality in PACKAGECONFIG, and let libvirt
> ./configure autodetect dependencies ?
> This will result in a bigger libvirt binary, and
> libnl, netcf, augeas, polkit dependencies being mandatory for all
> users of libvirt, unless explicitly disabled by the "xen" PACKAGECONFIG.
>
> Does anyone have any binary size constraints ?
>
> Br,
> David
>
> On 12/04/2012 04:49 PM, Prica, Mihai wrote:
>>
>> Hi,
>>
>> The error is because configure is called with the --with-xenapi
>> option. I think there is a bug in the recipe at the
>> PACKAGECONFIG[xen] line. It should be --without-xenapi instead of the
>> first --with-xenapi. I don't know exactly what xenapi does, Raymond
>> can give you more details here.
>>
>> Try to change this and see if it works.
>>
>> Thanks,
>> Mihai
>>
>> -----Original Message-----
>> From: David Nystr=F6m [mailto:david.c.nystrom@gmail.com]
>> Sent: Tuesday, December 04, 2012 5:36 PM
>> To: Raymond Danks
>> Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
>> Subject: PACKAGECONFIG variables.
>>
>> Hi All,
>>
>> When trying to upgrade to libvirt-1.0, I'm getting some strange errors.
>> How could this pass with the old libvirt I dont know.
>>
>> Is the XenAPI driver something you explicitly build and use ?
>>
>> ------------------------------------------------------------------
>> checking for xen_vm_start in -lxenserver... no
>> configure: error: You must install the XenServer Library to compile
>> XenAPI driver with -lxenserver Configure failed. The contents of all
>> config.log files follows to aid debugging
>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libvir=
t-1.0.0/config.log
>> This file contains any messages produced by compilers while running
>> configure, to aid debugging if configure makes a mistake.
>>
>> It was created by libvirt configure 1.0.0, which was generated by GNU
>> Autoconf 2.69.  Invocation command line was
>>
>>     $
>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libvir=
t-1.0.0/configure
>>
>> --build=3Dx86_64-linux --host=3Dx86_64-poky-linux
>> --target=3Dx86_64-poky-linux --prefix=3D/usr --exec_prefi x=3D/usr
>> --bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/libexec
>> --datadir=3D/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com
>> --localstatedir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/incl ude
>> --oldincludedir=3D/usr/include --infodir=3D/usr/share/info
>> --mandir=3D/usr/share/man --disable-silent-rules
>> --disable-dependency-tracking
>> --with-libtool-sysroot=3D/media/sdb5/eel/build/tmp/sysroots
>> /qemux86-64 --with-python=3Dyes
>> --with-python-inc-dir=3D-I/media/sdb5/eel/build/tmp/sysroots/qemux86-64/=
usr/include/python2.7
>>
>> --enable-nls --without-hyperv --with-remote --without-openvz
>> --without- phyp --without-augeas --with-xen --with-xenapi
>> --with-libxl=3D/media/sdb5/eel/build/tmp/sysroots/qemux86-64/lib
>> --with-xen-inotify --with-macvtap=3Dno --without-esx --without-vbox
>> --without-polkit --without-lxc --without-uml --with-test=3Dyes
>> --with-libvirtd --without-qemu --without-yajl --without-vmware
>>
>>
>> Br,
>> David
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>


--_000_88701C38B5D07249817D428430999C9128A89A70sestoex05enease_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Ray,<br>
<br>
Yes, of course. Let's add a *-minimal package configs, <br>
if none are set, we'll let it autodetect &#43; add full dependencies otherw=
ise.<br>
Is it OK for you if I set it to auto detect by default? , this would imply<=
br>
a local.conf addition to optimize for footprint. <br>
I'm guessing package config selects cannot be set from an image file, I'll =
give that a try tomorrow.
<br>
<br>
Br, <br>
David<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Raymond Danks [ray.danks@se-eng.com]<br>
<b>Received:</b> Tuesday, 04 Dec 2012, 18:38<br>
<b>To:</b> David Nystr=F6m [David.Nystrom@enea.com]<br>
<b>CC:</b> Prica, Mihai [mihai.prica@intel.com]; meta-virtualization@yoctop=
roject.org [meta-virtualization@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-virtualization] PACKAGECONFIG variables.<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">David,<br>
<br>
XenAPI is used by XenServer and Xen Cloud Platform.&nbsp; There is currentl=
y <br>
no underlying metadata support for these packages, so this should be <br>
disabled.<br>
<br>
I do, in fact have binary size constraints.&nbsp; I see where you are going=
 <br>
with this, but would it be possible instead to add a &quot;detect&quot; or =
&quot;all&quot; <br>
to PACKAGECONFIG?&nbsp; I suppose an alternative would be to add &quot;*-mi=
nimal&quot; <br>
to PACKAGECONFIG which tweak the configure to create minimal build <br>
configurations.<br>
<br>
Ray<br>
<br>
On 12/04/2012 09:03 AM, David Nystr=F6m wrote:<br>
&gt; I have some issues with how PACKAGECONFIG works, do you guys mind if I=
<br>
&gt; disable all --without functionality in PACKAGECONFIG, and let libvirt =
<br>
&gt; ./configure autodetect dependencies ?<br>
&gt; This will result in a bigger libvirt binary, and<br>
&gt; libnl, netcf, augeas, polkit dependencies being mandatory for all <br>
&gt; users of libvirt, unless explicitly disabled by the &quot;xen&quot; PA=
CKAGECONFIG.<br>
&gt;<br>
&gt; Does anyone have any binary size constraints ?<br>
&gt;<br>
&gt; Br,<br>
&gt; David<br>
&gt;<br>
&gt; On 12/04/2012 04:49 PM, Prica, Mihai wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; The error is because configure is called with the --with-xenapi <b=
r>
&gt;&gt; option. I think there is a bug in the recipe at the <br>
&gt;&gt; PACKAGECONFIG[xen] line. It should be --without-xenapi instead of =
the <br>
&gt;&gt; first --with-xenapi. I don't know exactly what xenapi does, Raymon=
d <br>
&gt;&gt; can give you more details here.<br>
&gt;&gt;<br>
&gt;&gt; Try to change this and see if it works.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Mihai<br>
&gt;&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: David Nystr=F6m [<a href=3D"mailto:david.c.nystrom@gmail.com=
">mailto:david.c.nystrom@gmail.com</a>]<br>
&gt;&gt; Sent: Tuesday, December 04, 2012 5:36 PM<br>
&gt;&gt; To: Raymond Danks<br>
&gt;&gt; Cc: Prica, Mihai; meta-virtualization@yoctoproject.org<br>
&gt;&gt; Subject: PACKAGECONFIG variables.<br>
&gt;&gt;<br>
&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; When trying to upgrade to libvirt-1.0, I'm getting some strange er=
rors.<br>
&gt;&gt; How could this pass with the old libvirt I dont know.<br>
&gt;&gt;<br>
&gt;&gt; Is the XenAPI driver something you explicitly build and use ?<br>
&gt;&gt;<br>
&gt;&gt; ------------------------------------------------------------------=
<br>
&gt;&gt; checking for xen_vm_start in -lxenserver... no<br>
&gt;&gt; configure: error: You must install the XenServer Library to compil=
e <br>
&gt;&gt; XenAPI driver with -lxenserver Configure failed. The contents of a=
ll <br>
&gt;&gt; config.log files follows to aid debugging <br>
&gt;&gt; /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/=
libvirt-1.0.0/config.log<br>
&gt;&gt; This file contains any messages produced by compilers while runnin=
g <br>
&gt;&gt; configure, to aid debugging if configure makes a mistake.<br>
&gt;&gt;<br>
&gt;&gt; It was created by libvirt configure 1.0.0, which was generated by =
GNU <br>
&gt;&gt; Autoconf 2.69.&nbsp; Invocation command line was<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; $<br>
&gt;&gt; /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/=
libvirt-1.0.0/configure
<br>
&gt;&gt;<br>
&gt;&gt; --build=3Dx86_64-linux --host=3Dx86_64-poky-linux <br>
&gt;&gt; --target=3Dx86_64-poky-linux --prefix=3D/usr --exec_prefi x=3D/usr=
 <br>
&gt;&gt; --bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/libe=
xec <br>
&gt;&gt; --datadir=3D/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com=
 <br>
&gt;&gt; --localstatedir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/inc=
l ude <br>
&gt;&gt; --oldincludedir=3D/usr/include --infodir=3D/usr/share/info <br>
&gt;&gt; --mandir=3D/usr/share/man --disable-silent-rules <br>
&gt;&gt; --disable-dependency-tracking <br>
&gt;&gt; --with-libtool-sysroot=3D/media/sdb5/eel/build/tmp/sysroots<br>
&gt;&gt; /qemux86-64 --with-python=3Dyes<br>
&gt;&gt; --with-python-inc-dir=3D-I/media/sdb5/eel/build/tmp/sysroots/qemux=
86-64/usr/include/python2.7
<br>
&gt;&gt;<br>
&gt;&gt; --enable-nls --without-hyperv --with-remote --without-openvz <br>
&gt;&gt; --without- phyp --without-augeas --with-xen --with-xenapi <br>
&gt;&gt; --with-libxl=3D/media/sdb5/eel/build/tmp/sysroots/qemux86-64/lib<b=
r>
&gt;&gt; --with-xen-inotify --with-macvtap=3Dno --without-esx --without-vbo=
x <br>
&gt;&gt; --without-polkit --without-lxc --without-uml --with-test=3Dyes <br=
>
&gt;&gt; --with-libvirtd --without-qemu --without-yajl --without-vmware<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Br,<br>
&gt;&gt; David<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; meta-virtualization@yoctoproject.org<br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
&gt;&gt;<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_88701C38B5D07249817D428430999C9128A89A70sestoex05enease_--

Subject: Re: Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: meta-virtualization@lists.yoctoproject.org
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (157.45.242.131)
X-Originating-Platform: Linux Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 31 May 2020 21:52:10 -0700
References: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
In-Reply-To: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
Message-ID: <8542.1590987130301454950@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="5bq4s7o25CEDceENYAbN"

--5bq4s7o25CEDceENYAbN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello @ Bruce Ashfield=C2=A0sir,

I have searched for what you have suggested. But, I couldn't find the kern=
el.config file anywhere actually I thibk I am mising something important. M=
Ay I know what mistake I am doing please. Can I get any=C2=A0 link or info =
how to proceed with this=C2=A0 issue please.

*My bblayer.conf file is as below: (* Am I missing any layers here? *)*

# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.co=
nf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION =3D "2"
BBPATH =3D "${TOPDIR}"

BBFILES ?=3D ""
BBLAYERS ?=3D " \

/home/siddhu/Documents/yocto/sources/poky/meta \
/home/siddhu/Documents/yocto/sources/poky/meta-poky \
/home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking \
/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
/home/siddhu/Documents/yocto/sources/meta-cloud-services \
/home/siddhu/Documents/yocto/sources/meta-selinux \
/home/siddhu/Documents/yocto/sources/meta-virtualization\
/home/siddhu/Documents/yocto/sources/meta-raspberrypi \
"

*My local.conf file I have added the below details:*

MACHINE ??=3D "raspberrypi4"
DISTRO_FEATURES +=3D "virtualization xen"
PACKAGE_CLASSES ?=3D "package_rpm"
CONF_VERSION =3D "1"
IMAGE_FEATURES +=3D "ssh-server-dropbear"

--
Best Regards,
Siddhartha V

--5bq4s7o25CEDceENYAbN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello @<span class=3D"fa fa-user fa-3x"></span>&nbsp;Bruce Ashfield&nbsp;si=
r,<br /><br />&nbsp; &nbsp; &nbsp; I have searched for what you have sugges=
ted. But, I couldn't find the kernel.config file anywhere actually I thibk =
I am mising something important. MAy I know what mistake I am doing please.=
 Can I get any&nbsp; link or info how to proceed with this&nbsp; issue plea=
se.<br /><br /><strong><span style=3D"white-space: pre-wrap;">My bblayer.co=
nf file is as below: (</span></strong>Am I missing any layers here?<strong>=
<span style=3D"white-space: pre-wrap;">)</span></strong><br style=3D"white-=
space: pre-wrap;" /><br style=3D"white-space: pre-wrap;" /><span style=3D"w=
hite-space: pre-wrap;"># POKY_BBLAYERS_CONF_VERSION is increased each time =
build/conf/bblayers.conf</span><br style=3D"white-space: pre-wrap;" /><span=
 style=3D"white-space: pre-wrap;"># changes incompatibly</span><br style=3D=
"white-space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">POKY_BBLA=
YERS_CONF_VERSION =3D "2"</span><br style=3D"white-space: pre-wrap;" /><spa=
n style=3D"white-space: pre-wrap;">BBPATH =3D "${TOPDIR}"</span><br style=
=3D"white-space: pre-wrap;" /><br style=3D"white-space: pre-wrap;" /><span=
 style=3D"white-space: pre-wrap;">BBFILES ?=3D ""</span><br style=3D"white-=
space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">BBLAYERS ?=3D " =
\</span><br style=3D"white-space: pre-wrap;" /><br style=3D"white-space: pr=
e-wrap;" /><span style=3D"white-space: pre-wrap;"> /home/siddhu/Documents/y=
octo/sources/poky/meta \</span><br style=3D"white-space: pre-wrap;" /><span=
 style=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/pok=
y/meta-poky \</span><br style=3D"white-space: pre-wrap;" /><span style=3D"w=
hite-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/poky/meta-yoct=
o-bsp \</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-s=
pace: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-oe \</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-s=
pace: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-multimedia \</span><br style=3D"white-space: pre-wrap;" /><span style=3D=
"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-openemb=
edded/meta-python \</span><br style=3D"white-space: pre-wrap;" /><span styl=
e=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-ope=
nembedded/meta-networking \</span><br style=3D"white-space: pre-wrap;" /><s=
pan style=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/=
meta-openembedded/meta-filesystems \</span><br style=3D"white-space: pre-wr=
ap;" /><span style=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto=
/sources/meta-cloud-services \</span><br style=3D"white-space: pre-wrap;" /=
><span style=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sourc=
es/meta-selinux \</span><br style=3D"white-space: pre-wrap;" /><span style=
=3D"white-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-vir=
tualization\</span><br style=3D"white-space: pre-wrap;" /><span style=3D"wh=
ite-space: pre-wrap;"> /home/siddhu/Documents/yocto/sources/meta-raspberryp=
i \</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-space=
: pre-wrap;"> "</span><br /><br /><br style=3D"white-space: pre-wrap;" /><s=
trong><span style=3D"white-space: pre-wrap;">My local.conf file I have adde=
d the below details:</span></strong><br style=3D"white-space: pre-wrap;" />=
<br style=3D"white-space: pre-wrap;" /><span style=3D"white-space: pre-wrap=
;">MACHINE ??=3D "raspberrypi4"</span><br style=3D"white-space: pre-wrap;" =
/><span style=3D"white-space: pre-wrap;">DISTRO_FEATURES +=3D "virtualizati=
on xen"</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-s=
pace: pre-wrap;">PACKAGE_CLASSES ?=3D "package_rpm"</span><br style=3D"whit=
e-space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">CONF_VERSION =
=3D "1"</span><br style=3D"white-space: pre-wrap;" /><span style=3D"white-=
space: pre-wrap;">IMAGE_FEATURES +=3D "ssh-server-dropbear"</span><br style=
=
=3D"white-space: pre-wrap;" /><br /><br /><br />-- <br />Best Regards,<br =
/>Siddhartha V

--5bq4s7o25CEDceENYAbN--

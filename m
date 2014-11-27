Return-Path: <sragolu@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4B16E0087D; Thu, 27 Nov 2014 00:52:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 512CBE007BA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 00:52:26 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id s18so3874124lam.15
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 00:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=j1VPHKHMOrS/sQm+tOyFgnsP1gkwcNRn+5JLw6Jgtpk=;
	b=iMHckmaifHj+SnE+zB5MRAR2m793j+48l4azx3cszWop+YZZSf6IQbm2aBzdbP8S2i
	Dz150T17Qk5qCfT1hftIrZ4FrahP5Kdy54duDgs9YfYFD61eVq6RyOrrg1QXiF1FST6l
	jiM9Mk/nf+MvhE+uRoxe0cXOQ5tPp6Ol5lT+YgHQsfMaEMv1S06XAb0zD+/xK1BSGhsv
	LugLtVHI6U1ykcRmzbX9xraiX1hQ/HKgDtYGozbAEca05wucb/i0Dhb8oBwOEjtxvZrp
	VsOmPY1NXJfS5YcFHxO4kVtLFkq/2WLGlDuW+9cAaeZyhuSDiSXMyg6LF0wW3aHRuJRn
	JG+g==
X-Gm-Message-State: ALoCoQn6o6HOt1/DsTbu0siNFBqClGgrAbD7mff0kajhsTRwM1EnXOTwisOiarOcbzVNAtaswNzE
MIME-Version: 1.0
X-Received: by 10.152.120.133 with SMTP id lc5mr38253173lab.62.1417078345130; 
	Thu, 27 Nov 2014 00:52:25 -0800 (PST)
Received: by 10.25.206.15 with HTTP; Thu, 27 Nov 2014 00:52:25 -0800 (PST)
Date: Thu, 27 Nov 2014 14:22:25 +0530
Message-ID: <CAH4+OFrDCLx8Kbsc9XCZY8_e4sD=gMBQajjb0b-s8JotAYKtJw@mail.gmail.com>
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
To: meta-virtualization@yoctoproject.org
Subject: Keystone is not working in meta-cloud-services Stable/juno
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
X-List-Received-Date: Thu, 27 Nov 2014 08:52:36 -0000
Content-Type: multipart/alternative; boundary=089e01176919617d850508d3430c

--089e01176919617d850508d3430c
Content-Type: text/plain; charset=UTF-8

Hi All,

I am new to this forum. Please help me in solving this issue with
stable/juno keystone. I have taken meta-cloud-services of stable/juno
http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=382e7184e5a23ebfeb2fd9ec432e6545170fee7d

After booting openstack-image-controller, ran
/etc/keystone/service-user-setup

after that any keystone or openstack service commands giving below errors.

root@controller:/etc/keystone# keystone user-list
WARNING: Bypassing authentication using a token & endpoint (authentication
credentials are being ignored).
Unable to establish connection to
http://controller:8081/keystone/admin/v2.0/users

root@controller:/etc/keystone# keystone --debug user-list
WARNING: Bypassing authentication using a token & endpoint (authentication
credentials are being ignored).
DEBUG:keystoneclient.session:REQ: curl -i -X GET
http://controller:8081/keystone/admin/v2.0/users -H "User-Agent:
python-keystoneclient" -H "X-Auth-Token:
{SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
INFO:requests.packages.urllib3.connectionpool:Starting new HTTP connection
(1): controller
Unable to establish connection to
http://controller:8081/keystone/admin/v2.0/users


my environment variables are
root@controller:/etc/keystone# env
TERM=xterm
SHELL=/bin/sh
SSH_CLIENT=192.168.7.220 54638 22
SSH_TTY=/dev/pts/0
USER=root
MAIL=/var/mail/root
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
PWD=/etc/keystone
OS_PASSWORD=password
EDITOR=/bin/vi
TZ=UTC
PS1=\u@\h:\w\$
OS_AUTH_URL=http://controller:8081/keystone/main/v2.0/
OS_USERNAME=admin
SHLVL=1
HOME=/home/root
OS_TENANT_NAME=admin
LOGNAME=root
SSH_CONNECTION=192.168.7.220 54638 192.168.7.2 22
SERVICE_ENDPOINT=http://controller:8081/keystone/admin/v2.0
SERVICE_TOKEN=password
_=/usr/bin/env
OLDPWD=/home/root


keystone.conf is
# The port number which the public service listens on
# public_port = 5000

# The port number which the public admin listens on
# admin_port = 35357
admin_endpoint = http://192.168.7.2:8081/keystone/admin/
public_endpoint = http://192.168.7.2:8081/keystone/main/


I will be really thankful, if you could guide me.

Thanks,
Srinivas.

--089e01176919617d850508d3430c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi All,</span><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I am n=
ew to this forum. Please help me in solving this issue with stable/juno key=
stone. I have taken meta-cloud-services of stable/juno</div><div style=3D"f=
ont-family:arial,sans-serif;font-size:13px"><a href=3D"http://git.yoctoproj=
ect.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=3D382e7184e5a23ebfeb2f=
d9ec432e6545170fee7d" target=3D"_blank">http://git.yoctoproject.org/cgit/cg=
it.cgi/meta-cloud-services/commit/?id=3D382e7184e5a23ebfeb2fd9ec432e6545170=
fee7d</a><br></div><div style=3D"font-family:arial,sans-serif;font-size:13p=
x"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">Aft=
er booting openstack-image-controller, ran /etc/keystone/service-user-setup=
</div><div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div>=
<div style=3D"font-family:arial,sans-serif;font-size:13px">after that any k=
eystone or openstack service commands giving below errors.</div><div style=
=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><div>root@controller:/etc/keysto=
ne# keystone user-list</div><div>WARNING: Bypassing authentication using a =
token &amp; endpoint (authentication credentials are being ignored).</div><=
div>Unable to establish connection to=C2=A0<a href=3D"http://controller:808=
1/keystone/admin/v2.0/users" target=3D"_blank">http://controller:8081/keyst=
one/admin/v2.0/users</a></div></div><div style=3D"font-family:arial,sans-se=
rif;font-size:13px"><br></div><div style=3D"font-family:arial,sans-serif;fo=
nt-size:13px"><div>root@controller:/etc/keystone# keystone --debug user-lis=
t =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>WARNING: Bypassing authentication u=
sing a token &amp; endpoint (authentication credentials are being ignored).=
</div><div>DEBUG:keystoneclient.session:REQ: curl -i -X GET=C2=A0<a href=3D=
"http://controller:8081/keystone/admin/v2.0/users" target=3D"_blank">http:/=
/controller:8081/keystone/admin/v2.0/users</a>=C2=A0-H &quot;User-Agent: py=
thon-keystoneclient&quot; -H &quot;X-Auth-Token: {SHA1}5baa61e4c9b93f3f0682=
250b6cf8331b7ee68fd8&quot;</div><div>INFO:requests.packages.urllib3.connect=
ionpool:Starting new HTTP connection (1): controller</div><div>Unable to es=
tablish connection to=C2=A0<a href=3D"http://controller:8081/keystone/admin=
/v2.0/users" target=3D"_blank">http://controller:8081/keystone/admin/v2.0/u=
sers</a></div><div><br></div></div><div style=3D"font-family:arial,sans-ser=
if;font-size:13px"><br></div><div style=3D"font-family:arial,sans-serif;fon=
t-size:13px">my environment variables are=C2=A0</div><div style=3D"font-fam=
ily:arial,sans-serif;font-size:13px"><div>root@controller:/etc/keystone# en=
v</div><div>TERM=3Dxterm</div><div>SHELL=3D/bin/sh</div><div>SSH_CLIENT=3D1=
92.168.7.220 54638 22</div><div>SSH_TTY=3D/dev/pts/0</div><div>USER=3Droot<=
/div><div>MAIL=3D/var/mail/root</div><div>PATH=3D/usr/local/bin:/usr/bin:/b=
in:/usr/local/sbin:/usr/sbin:/sbin</div><div>PWD=3D/etc/keystone</div><div>=
OS_PASSWORD=3Dpassword</div><div>EDITOR=3D/bin/vi</div><div>TZ=3DUTC</div><=
div>PS1=3D\u@\h:\w\$=C2=A0</div><div>OS_AUTH_URL=3D<a href=3D"http://contro=
ller:8081/keystone/main/v2.0/" target=3D"_blank">http://controller:8081/key=
stone/main/v2.0/</a></div><div>OS_USERNAME=3Dadmin</div><div>SHLVL=3D1</div=
><div>HOME=3D/home/root</div><div>OS_TENANT_NAME=3Dadmin</div><div>LOGNAME=
=3Droot</div><div>SSH_CONNECTION=3D192.168.7.220 54638 192.168.7.2 22</div>=
<div>SERVICE_ENDPOINT=3D<a href=3D"http://controller:8081/keystone/admin/v2=
.0" target=3D"_blank">http://controller:8081/keystone/admin/v2.0</a></div><=
div>SERVICE_TOKEN=3Dpassword</div><div>_=3D/usr/bin/env</div><div>OLDPWD=3D=
/home/root</div></div><div style=3D"font-family:arial,sans-serif;font-size:=
13px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">keysto=
ne.conf is=C2=A0</div><div style=3D"font-family:arial,sans-serif;font-size:=
13px"><div># The port number which the public service listens on</div><div>=
# public_port =3D 5000</div><div><br></div><div># The port number which the=
 public admin listens on</div><div># admin_port =3D 35357</div><div>admin_e=
ndpoint =3D=C2=A0<a href=3D"http://192.168.7.2:8081/keystone/admin/" target=
=3D"_blank">http://192.168.7.2:8081/keystone/admin/</a></div><div>public_en=
dpoint =3D=C2=A0<a href=3D"http://192.168.7.2:8081/keystone/main/" target=
=3D"_blank">http://192.168.7.2:8081/keystone/main/</a></div></div><div styl=
e=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div style=3D"f=
ont-family:arial,sans-serif;font-size:13px"><br></div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">I will be really thankful, if you cou=
ld guide me.</div><div style=3D"font-family:arial,sans-serif;font-size:13px=
"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">Than=
ks,</div><div style=3D"font-family:arial,sans-serif;font-size:13px">Sriniva=
s.</div></div>

--089e01176919617d850508d3430c--

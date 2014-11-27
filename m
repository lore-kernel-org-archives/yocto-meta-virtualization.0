Return-Path: <sragolu@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81901E0087D; Wed, 26 Nov 2014 22:03:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1C3AE007BA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Nov 2014 22:03:36 -0800 (PST)
Received: by mail-la0-f51.google.com with SMTP id ms9so3633222lab.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Nov 2014 22:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=MIvcKPMBrYNslAEsGLIKT58wkU67SfzqmypDPZvrhAg=;
	b=gdZiJ/UGgWNZwS88lskzOyxuPtlb/6EmkRolq5fFfbqJpS9I8OCPu4yJS8TwQdp/Af
	XCMiL1x4iCtVGrZ/QNR4Xo0/j7ppKOB5rycovH2Hx+0H8A7O1a/n8SAfx3Rk9LPrUbDh
	0iUTjSiwXCtWQOicOSo1QkCTpvfW711pZsi9pID3F0uo7H98xRi1T+t6acSbG5vKf0/J
	IUWApWtaEdUvg/32a88XShUH0CLbE9Gll9S7nxUspZ/wofbkPm2Y9V8aExIDdqXN/wzx
	Q4Wf3cOv2lnFkkVMm0vHQFvFBKWnyzf2bC/8+gn3n9lhWQQ1lgDhjXA1b/3aCDqDWqR2
	CZKg==
X-Gm-Message-State: ALoCoQn1huLeYAfw15REcqJoS+zZBvC6udTTh6gq+wl3WGsiPDIRlTqapbWUphCDTf10y0ZYVTBm
MIME-Version: 1.0
X-Received: by 10.152.43.166 with SMTP id x6mr27529602lal.14.1417068214420;
	Wed, 26 Nov 2014 22:03:34 -0800 (PST)
Received: by 10.25.206.15 with HTTP; Wed, 26 Nov 2014 22:03:34 -0800 (PST)
Date: Thu, 27 Nov 2014 11:33:34 +0530
Message-ID: <CAH4+OFoSB_kBOaSFV50WB5QtpZte16-ZRY=LDu=wUV=CJhRhug@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Nov 2014 06:03:42 -0000
Content-Type: multipart/alternative; boundary=001a11c29b588b22590508d0e754

--001a11c29b588b22590508d0e754
Content-Type: text/plain; charset=UTF-8

Hi All,

I am new to this forum. Please help me in solving this issue with
stable/juno keystone. I have taken meta-cloud-services of stable/juno
http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=382e7184e5a23ebfeb2fd9ec432e6545170fee7d

After booting openstack-image-controller, ran
/etc/keystone/service-user-setup

after that any keystone or openstack service commands giving below errors.

*root@controller:/etc/keystone# keystone user-list*
*WARNING: Bypassing authentication using a token & endpoint (authentication
credentials are being ignored).*
*Unable to establish connection to
http://controller:8081/keystone/admin/v2.0/users
<http://controller:8081/keystone/admin/v2.0/users>*


*root@controller:/etc/keystone# keystone --debug user-list        WARNING:
Bypassing authentication using a token & endpoint (authentication
credentials are being ignored).DEBUG:keystoneclient.session:REQ: curl -i -X
GET http://controller:8081/keystone/admin/v2.0/users
<http://controller:8081/keystone/admin/v2.0/users> -H "User-Agent:
python-keystoneclient" -H "X-Auth-Token:
{SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"INFO:requests.packages.urllib3.connectionpool:Starting
new HTTP connection (1): controllerUnable to establish connection to
http://controller:8081/keystone/admin/v2.0/users
<http://controller:8081/keystone/admin/v2.0/users>*

my environment variables are
root@controller:/etc/keystone# env
*TERM=xterm*
*SHELL=/bin/sh*
*SSH_CLIENT=192.168.7.220 54638 22*
*SSH_TTY=/dev/pts/0*
*USER=root*
*MAIL=/var/mail/root*
*PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin*
*PWD=/etc/keystone*
*OS_PASSWORD=password*
*EDITOR=/bin/vi*
*TZ=UTC*
*PS1=\u@\h:\w\$ *
*OS_AUTH_URL=http://controller:8081/keystone/main/v2.0/
<http://controller:8081/keystone/main/v2.0/>*
*OS_USERNAME=admin*
*SHLVL=1*
*HOME=/home/root*
*OS_TENANT_NAME=admin*
*LOGNAME=root*
*SSH_CONNECTION=192.168.7.220 54638 192.168.7.2 22*
*SERVICE_ENDPOINT=http://controller:8081/keystone/admin/v2.0
<http://controller:8081/keystone/admin/v2.0>*
*SERVICE_TOKEN=password*
*_=/usr/bin/env*
*OLDPWD=/home/root*


*keystone.conf is *
# The port number which the public service listens on
# public_port = 5000

# The port number which the public admin listens on
# admin_port = 35357
admin_endpoint = http://192.168.7.2:8081/keystone/admin/
public_endpoint = http://192.168.7.2:8081/keystone/main/


I will be really thankful, if you could guide me.

Thanks,
Srinivas.

--001a11c29b588b22590508d0e754
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am new to this forum. Please =
help me in solving this issue with stable/juno keystone. I have taken meta-=
cloud-services of stable/juno</div><div><a href=3D"http://git.yoctoproject.=
org/cgit/cgit.cgi/meta-cloud-services/commit/?id=3D382e7184e5a23ebfeb2fd9ec=
432e6545170fee7d">http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-serv=
ices/commit/?id=3D382e7184e5a23ebfeb2fd9ec432e6545170fee7d</a><br></div><di=
v><br></div><div>After booting openstack-image-controller, ran /etc/keyston=
e/service-user-setup</div><div><br></div><div>after that any keystone or op=
enstack service commands giving below errors.</div><div><br></div><div><div=
><b>root@controller:/etc/keystone# keystone user-list</b></div><div><b>WARN=
ING: Bypassing authentication using a token &amp; endpoint (authentication =
credentials are being ignored).</b></div><div><b>Unable to establish connec=
tion to <a href=3D"http://controller:8081/keystone/admin/v2.0/users">http:/=
/controller:8081/keystone/admin/v2.0/users</a></b></div></div><div><b><br><=
/b></div><div><b><div>root@controller:/etc/keystone# keystone --debug user-=
list =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>WARNING: Bypassing authenticatio=
n using a token &amp; endpoint (authentication credentials are being ignore=
d).</div><div>DEBUG:keystoneclient.session:REQ: curl -i -X GET <a href=3D"h=
ttp://controller:8081/keystone/admin/v2.0/users">http://controller:8081/key=
stone/admin/v2.0/users</a> -H &quot;User-Agent: python-keystoneclient&quot;=
 -H &quot;X-Auth-Token: {SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8&quot=
;</div><div>INFO:requests.packages.urllib3.connectionpool:Starting new HTTP=
 connection (1): controller</div><div>Unable to establish connection to <a =
href=3D"http://controller:8081/keystone/admin/v2.0/users">http://controller=
:8081/keystone/admin/v2.0/users</a></div><div><br></div></b></div><div><br>=
</div><div>my environment variables are=C2=A0</div><div><div>root@controlle=
r:/etc/keystone# env</div><div><b>TERM=3Dxterm</b></div><div><b>SHELL=3D/bi=
n/sh</b></div><div><b>SSH_CLIENT=3D192.168.7.220 54638 22</b></div><div><b>=
SSH_TTY=3D/dev/pts/0</b></div><div><b>USER=3Droot</b></div><div><b>MAIL=3D/=
var/mail/root</b></div><div><b>PATH=3D/usr/local/bin:/usr/bin:/bin:/usr/loc=
al/sbin:/usr/sbin:/sbin</b></div><div><b>PWD=3D/etc/keystone</b></div><div>=
<b>OS_PASSWORD=3Dpassword</b></div><div><b>EDITOR=3D/bin/vi</b></div><div><=
b>TZ=3DUTC</b></div><div><b>PS1=3D\u@\h:\w\$=C2=A0</b></div><div><b>OS_AUTH=
_URL=3D<a href=3D"http://controller:8081/keystone/main/v2.0/">http://contro=
ller:8081/keystone/main/v2.0/</a></b></div><div><b>OS_USERNAME=3Dadmin</b><=
/div><div><b>SHLVL=3D1</b></div><div><b>HOME=3D/home/root</b></div><div><b>=
OS_TENANT_NAME=3Dadmin</b></div><div><b>LOGNAME=3Droot</b></div><div><b>SSH=
_CONNECTION=3D192.168.7.220 54638 192.168.7.2 22</b></div><div><b>SERVICE_E=
NDPOINT=3D<a href=3D"http://controller:8081/keystone/admin/v2.0">http://con=
troller:8081/keystone/admin/v2.0</a></b></div><div><b>SERVICE_TOKEN=3Dpassw=
ord</b></div><div><b>_=3D/usr/bin/env</b></div><div><b>OLDPWD=3D/home/root<=
/b></div></div><div><br></div><div><b><br></b></div><div><b>keystone.conf i=
s=C2=A0</b></div><div><div># The port number which the public service liste=
ns on</div><div># public_port =3D 5000</div><div><br></div><div># The port =
number which the public admin listens on</div><div># admin_port =3D 35357</=
div><div>admin_endpoint =3D <a href=3D"http://192.168.7.2:8081/keystone/adm=
in/">http://192.168.7.2:8081/keystone/admin/</a></div><div>public_endpoint =
=3D <a href=3D"http://192.168.7.2:8081/keystone/main/">http://192.168.7.2:8=
081/keystone/main/</a></div></div><div><br></div><div><br></div><div>I will=
 be really thankful, if you could guide me.</div><div><br></div><div>Thanks=
,</div><div>Srinivas.</div><div><br></div><div><br></div></div>

--001a11c29b588b22590508d0e754--

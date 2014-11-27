Return-Path: <sragolu@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35D6EE008EC; Thu, 27 Nov 2014 09:17:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.182 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93E88E008CC
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 09:17:09 -0800 (PST)
Received: by mail-lb0-f182.google.com with SMTP id f15so4877700lbj.27
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 09:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=wiO9LaUDgMvzawspm+9jJnUAE1ZnYic15S6G/uhM5Ig=;
	b=LzG/7l7Py0fItgxhqi09AS2SxGM7sIjWI75fvrCBL1qUteMWExKAB4P/xev1+fU41J
	YyOmvXl29DoE6OusktPJLnxTggKwxQEjJk5bCMn1PZh6XXmeKpRo6w0spA0ITLM8FsIx
	qGeAtt3SDYhNrunAx/EWbteJGW4L/DsCd1ARerf6xtN0IsqX5t4F3qpECTnsbh4ENcbm
	NgH7XMHr/nLBtS8CBZEh70ZA814ZLZ/xDQNlpCGW8DkHGGpZBFuZ6PIM/mTfgqM8jGpV
	EODxvsShkG48epd1mqBoFAixao5qtCVWSWkn7/PrrgL3GPHCrZStoDlL3ccyQ0q0WWzY
	IVzQ==
X-Gm-Message-State: ALoCoQmuUMCQ174nQtdCTRNFeuZENyY+I/XKLYbDiZDuYc3aXp+U4mOeGywkaw7XqgkpIb9ZrwWs
MIME-Version: 1.0
X-Received: by 10.152.120.133 with SMTP id lc5mr40358281lab.62.1417108628465; 
	Thu, 27 Nov 2014 09:17:08 -0800 (PST)
Received: by 10.25.206.15 with HTTP; Thu, 27 Nov 2014 09:17:08 -0800 (PST)
In-Reply-To: <CADkTA4NyCLps3=7OD9rn3UFseOjbAqcQKw+Nc=utLv1zEeW+fA@mail.gmail.com>
References: <CAH4+OFoSB_kBOaSFV50WB5QtpZte16-ZRY=LDu=wUV=CJhRhug@mail.gmail.com>
	<CADkTA4NyCLps3=7OD9rn3UFseOjbAqcQKw+Nc=utLv1zEeW+fA@mail.gmail.com>
Date: Thu, 27 Nov 2014 22:47:08 +0530
Message-ID: <CAH4+OFr1W=CfqXoWNEsCjZrqPMLF8TGC8zP4HHBXYvtJ8-3voA@mail.gmail.com>
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Keystone is not working in meta-cloud-services Stable/juno
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
X-List-Received-Date: Thu, 27 Nov 2014 17:17:14 -0000
Content-Type: multipart/alternative; boundary=089e0117691968805f0508da50ac

--089e0117691968805f0508da50ac
Content-Type: text/plain; charset=UTF-8

Hi Bruce,

Thank you so much for your quick reply.

Regarding issue:

1) I am using lighttpd and apache2 is not running. I am eager to know , is
there any link between apache2 and keystone?

2) I observed keystone is running on 35357 port.
    #netstat -nlp | grep 35357
  But in the keystone and other service configurations of
meta-cloud-services, port listed as 8081

3) If I use meta-cloud-services stable/juno branch as it is, keystone not
able to authenticate itself and other services. Not able to create any
users/services/tenants/roles.

4) I am sure some silly link I might have missed, but struggled a lot , but
no luck.

Finally I have changed all services and keystone to 35357 and 5000 and all
are working fine.

Could you please provide me clue to figure out the issue with 8081 port?
and why keystone running on 35357 default?

Thanks,
Srinivas.

On Thu, Nov 27, 2014 at 9:04 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Thu, Nov 27, 2014 at 1:03 AM, Srinivasa Rao Ragolu
> <sragolu@mvista.com> wrote:
> > Hi All,
> >
> > I am new to this forum. Please help me in solving this issue with
> > stable/juno keystone. I have taken meta-cloud-services of stable/juno
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=382e7184e5a23ebfeb2fd9ec432e6545170fee7d
> >
>
> It's hard to say .. but I can say that everything works fine here. I
> never push an
> untested change:
>
> root@controller:~# uname -a
> Linux controller 3.14.19-yocto-standard #1 SMP PREEMPT Tue Oct 14
> 16:50:12 EDT 2014 x86_64 GNU/Linux
> root@controller:~# keystone user-list
> WARNING: Bypassing authentication using a token & endpoint
> (authentication credentials are being ignored).
>
> +----------------------------------+------------+---------+-----------------------+
> |                id                |    name    | enabled |
> email         |
>
> +----------------------------------+------------+---------+-----------------------+
> | e48cedc717d34becb8a92d93b5415a23 |   admin    |   True  |
> admin@domain.com   |
> | 7b30fcde558a488c95c6d11b92d8fd07 |  alt_demo  |   True  |
> alt_demo@domain.com  |
> | 3c06691847264c8bafcf7887bb536136 |  barbican  |   True  |
> barbican@domain.com  |
> | 260cbb94ea144801b9078de84dd9f629 | ceilometer |   True  |
> ceilometer@domain.com |
> | c4c25a5b3867438eb34bfe3ac660bcbb |   cinder   |   True  |
> cinder@domain.com   |
> | c6ab4e229fcd43e8b7f2ec19c8f6d3f0 |    demo    |   True  |
> demo@domain.com    |
> | e3e8c2b5532b4b828a00fef1e25809b7 |   glance   |   True  |
> glance@domain.com   |
> | 2a9ee8d459354f71b30a1504f79cd1b8 |    heat    |   True  |
> heat@domain.com    |
> | 7e348b3f0077493381aaa372dd7d13bd |  neutron   |   True  |
> neutron@domain.com  |
> | 4f93bd7ebd38460c93768801ff257f83 |    nova    |   True  |
> nova@domain.com    |
> | b3fc4205fe7b4e9bbcaa39b078bc1e8b |   swift    |   True  |
> swift@domain.com   |
> | e924b0717bf947538be9f678a6f7e252 |   trove    |   True  |
> trove@domain.com   |
>
> +----------------------------------+------------+---------+-----------------------+
>
> Have you checked the apache logs ? Is keystone-all running ? Is this the
> first
> boot, or a secondary boot ?
>
> Bruce
>
> > After booting openstack-image-controller, ran
> > /etc/keystone/service-user-setup
> >
> > after that any keystone or openstack service commands giving below
> errors.
> >
> > root@controller:/etc/keystone# keystone user-list
> > WARNING: Bypassing authentication using a token & endpoint
> (authentication
> > credentials are being ignored).
> > Unable to establish connection to
> > http://controller:8081/keystone/admin/v2.0/users
> >
> > root@controller:/etc/keystone# keystone --debug user-list
> > WARNING: Bypassing authentication using a token & endpoint
> (authentication
> > credentials are being ignored).
> > DEBUG:keystoneclient.session:REQ: curl -i -X GET
> > http://controller:8081/keystone/admin/v2.0/users -H "User-Agent:
> > python-keystoneclient" -H "X-Auth-Token:
> > {SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
> > INFO:requests.packages.urllib3.connectionpool:Starting new HTTP
> connection
> > (1): controller
> > Unable to establish connection to
> > http://controller:8081/keystone/admin/v2.0/users
> >
> >
> > my environment variables are
> > root@controller:/etc/keystone# env
> > TERM=xterm
> > SHELL=/bin/sh
> > SSH_CLIENT=192.168.7.220 54638 22
> > SSH_TTY=/dev/pts/0
> > USER=root
> > MAIL=/var/mail/root
> > PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> > PWD=/etc/keystone
> > OS_PASSWORD=password
> > EDITOR=/bin/vi
> > TZ=UTC
> > PS1=\u@\h:\w\$
> > OS_AUTH_URL=http://controller:8081/keystone/main/v2.0/
> > OS_USERNAME=admin
> > SHLVL=1
> > HOME=/home/root
> > OS_TENANT_NAME=admin
> > LOGNAME=root
> > SSH_CONNECTION=192.168.7.220 54638 192.168.7.2 22
> > SERVICE_ENDPOINT=http://controller:8081/keystone/admin/v2.0
> > SERVICE_TOKEN=password
> > _=/usr/bin/env
> > OLDPWD=/home/root
> >
> >
> > keystone.conf is
> > # The port number which the public service listens on
> > # public_port = 5000
> >
> > # The port number which the public admin listens on
> > # admin_port = 35357
> > admin_endpoint = http://192.168.7.2:8081/keystone/admin/
> > public_endpoint = http://192.168.7.2:8081/keystone/main/
> >
> >
> > I will be really thankful, if you could guide me.
> >
> > Thanks,
> > Srinivas.
> >
> >
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--089e0117691968805f0508da50ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div><br></div><div>Thank you so much for your qu=
ick reply.</div><div><br></div><div>Regarding issue:</div><div><br></div><d=
iv>1) I am using lighttpd and apache2 is not running. I am eager to know , =
is there any link between apache2 and keystone?</div><div><br></div><div>2)=
 I observed keystone is running on 35357 port.=C2=A0</div><div>=C2=A0 =C2=
=A0 #netstat -nlp | grep 35357</div><div>=C2=A0 But in the keystone and oth=
er service configurations of meta-cloud-services, port listed as 8081</div>=
<div><br></div><div>3) If I use meta-cloud-services stable/juno branch as i=
t is, keystone not able to authenticate itself and other services. Not able=
 to create any users/services/tenants/roles.</div><div><br></div><div>4) I =
am sure some silly link I might have missed, but struggled a lot , but no l=
uck.</div><div><br></div><div>Finally I have changed all services and keyst=
one to 35357 and 5000 and all are working fine.</div><div><br></div><div>Co=
uld you please provide me clue to figure out the issue with 8081 port? and =
why keystone running on 35357 default?</div><div><br></div><div>Thanks,</di=
v><div>Srinivas.</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Thu, Nov 27, 2014 at 9:04 PM, Bruce Ashfield <span dir=3D"ltr=
">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.a=
shfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Thu, Nov 27, 2014 at 1:03 AM, Srinivasa Rao Ragolu<br>
&lt;<a href=3D"mailto:sragolu@mvista.com">sragolu@mvista.com</a>&gt; wrote:=
<br>
&gt; Hi All,<br>
&gt;<br>
&gt; I am new to this forum. Please help me in solving this issue with<br>
&gt; stable/juno keystone. I have taken meta-cloud-services of stable/juno<=
br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-servic=
es/commit/?id=3D382e7184e5a23ebfeb2fd9ec432e6545170fee7d" target=3D"_blank"=
>http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=
=3D382e7184e5a23ebfeb2fd9ec432e6545170fee7d</a><br>
&gt;<br>
<br>
</span>It&#39;s hard to say .. but I can say that everything works fine her=
e. I<br>
never push an<br>
untested change:<br>
<br>
root@controller:~# uname -a<br>
Linux controller 3.14.19-yocto-standard #1 SMP PREEMPT Tue Oct 14<br>
16:50:12 EDT 2014 x86_64 GNU/Linux<br>
root@controller:~# keystone user-list<br>
<span class=3D"">WARNING: Bypassing authentication using a token &amp; endp=
oint<br>
(authentication credentials are being ignored).<br>
</span>+----------------------------------+------------+---------+---------=
--------------+<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 name=C2=A0 =C2=A0 =
| enabled |<br>
email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+----------------------------------+------------+---------+----------------=
-------+<br>
| e48cedc717d34becb8a92d93b5415a23 |=C2=A0 =C2=A0admin=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:admin@domain.com">admin@domain.com</a>=C2=A0 =C2=A0|<br>
| 7b30fcde558a488c95c6d11b92d8fd07 |=C2=A0 alt_demo=C2=A0 |=C2=A0 =C2=A0Tru=
e=C2=A0 |<br>
<a href=3D"mailto:alt_demo@domain.com">alt_demo@domain.com</a>=C2=A0 |<br>
| 3c06691847264c8bafcf7887bb536136 |=C2=A0 barbican=C2=A0 |=C2=A0 =C2=A0Tru=
e=C2=A0 |<br>
<a href=3D"mailto:barbican@domain.com">barbican@domain.com</a>=C2=A0 |<br>
| 260cbb94ea144801b9078de84dd9f629 | ceilometer |=C2=A0 =C2=A0True=C2=A0 |<=
br>
<a href=3D"mailto:ceilometer@domain.com">ceilometer@domain.com</a> |<br>
| c4c25a5b3867438eb34bfe3ac660bcbb |=C2=A0 =C2=A0cinder=C2=A0 =C2=A0|=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:cinder@domain.com">cinder@domain.com</a>=C2=A0 =C2=A0|<br=
>
| c6ab4e229fcd43e8b7f2ec19c8f6d3f0 |=C2=A0 =C2=A0 demo=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:demo@domain.com">demo@domain.com</a>=C2=A0 =C2=A0 |<br>
| e3e8c2b5532b4b828a00fef1e25809b7 |=C2=A0 =C2=A0glance=C2=A0 =C2=A0|=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:glance@domain.com">glance@domain.com</a>=C2=A0 =C2=A0|<br=
>
| 2a9ee8d459354f71b30a1504f79cd1b8 |=C2=A0 =C2=A0 heat=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:heat@domain.com">heat@domain.com</a>=C2=A0 =C2=A0 |<br>
| 7e348b3f0077493381aaa372dd7d13bd |=C2=A0 neutron=C2=A0 =C2=A0|=C2=A0 =C2=
=A0True=C2=A0 |<br>
<a href=3D"mailto:neutron@domain.com">neutron@domain.com</a>=C2=A0 |<br>
| 4f93bd7ebd38460c93768801ff257f83 |=C2=A0 =C2=A0 nova=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:nova@domain.com">nova@domain.com</a>=C2=A0 =C2=A0 |<br>
| b3fc4205fe7b4e9bbcaa39b078bc1e8b |=C2=A0 =C2=A0swift=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:swift@domain.com">swift@domain.com</a>=C2=A0 =C2=A0|<br>
| e924b0717bf947538be9f678a6f7e252 |=C2=A0 =C2=A0trove=C2=A0 =C2=A0 |=C2=A0=
 =C2=A0True=C2=A0 |<br>
<a href=3D"mailto:trove@domain.com">trove@domain.com</a>=C2=A0 =C2=A0|<br>
+----------------------------------+------------+---------+----------------=
-------+<br>
<br>
Have you checked the apache logs ? Is keystone-all running ? Is this the fi=
rst<br>
boot, or a secondary boot ?<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; After booting openstack-image-controller, ran<br>
&gt; /etc/keystone/service-user-setup<br>
&gt;<br>
&gt; after that any keystone or openstack service commands giving below err=
ors.<br>
&gt;<br>
&gt; root@controller:/etc/keystone# keystone user-list<br>
&gt; WARNING: Bypassing authentication using a token &amp; endpoint (authen=
tication<br>
&gt; credentials are being ignored).<br>
&gt; Unable to establish connection to<br>
&gt; <a href=3D"http://controller:8081/keystone/admin/v2.0/users" target=3D=
"_blank">http://controller:8081/keystone/admin/v2.0/users</a><br>
&gt;<br>
&gt; root@controller:/etc/keystone# keystone --debug user-list<br>
&gt; WARNING: Bypassing authentication using a token &amp; endpoint (authen=
tication<br>
&gt; credentials are being ignored).<br>
&gt; DEBUG:keystoneclient.session:REQ: curl -i -X GET<br>
&gt; <a href=3D"http://controller:8081/keystone/admin/v2.0/users" target=3D=
"_blank">http://controller:8081/keystone/admin/v2.0/users</a> -H &quot;User=
-Agent:<br>
&gt; python-keystoneclient&quot; -H &quot;X-Auth-Token:<br>
&gt; {SHA1}5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8&quot;<br>
&gt; INFO:requests.packages.urllib3.connectionpool:Starting new HTTP connec=
tion<br>
&gt; (1): controller<br>
&gt; Unable to establish connection to<br>
&gt; <a href=3D"http://controller:8081/keystone/admin/v2.0/users" target=3D=
"_blank">http://controller:8081/keystone/admin/v2.0/users</a><br>
&gt;<br>
&gt;<br>
&gt; my environment variables are<br>
&gt; root@controller:/etc/keystone# env<br>
&gt; TERM=3Dxterm<br>
&gt; SHELL=3D/bin/sh<br>
&gt; SSH_CLIENT=3D192.168.7.220 54638 22<br>
&gt; SSH_TTY=3D/dev/pts/0<br>
&gt; USER=3Droot<br>
&gt; MAIL=3D/var/mail/root<br>
&gt; PATH=3D/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin<br=
>
&gt; PWD=3D/etc/keystone<br>
&gt; OS_PASSWORD=3Dpassword<br>
&gt; EDITOR=3D/bin/vi<br>
&gt; TZ=3DUTC<br>
&gt; PS1=3D\u@\h:\w\$<br>
&gt; OS_AUTH_URL=3D<a href=3D"http://controller:8081/keystone/main/v2.0/" t=
arget=3D"_blank">http://controller:8081/keystone/main/v2.0/</a><br>
&gt; OS_USERNAME=3Dadmin<br>
&gt; SHLVL=3D1<br>
&gt; HOME=3D/home/root<br>
&gt; OS_TENANT_NAME=3Dadmin<br>
&gt; LOGNAME=3Droot<br>
&gt; SSH_CONNECTION=3D192.168.7.220 54638 192.168.7.2 22<br>
&gt; SERVICE_ENDPOINT=3D<a href=3D"http://controller:8081/keystone/admin/v2=
.0" target=3D"_blank">http://controller:8081/keystone/admin/v2.0</a><br>
&gt; SERVICE_TOKEN=3Dpassword<br>
&gt; _=3D/usr/bin/env<br>
&gt; OLDPWD=3D/home/root<br>
&gt;<br>
&gt;<br>
&gt; keystone.conf is<br>
&gt; # The port number which the public service listens on<br>
&gt; # public_port =3D 5000<br>
&gt;<br>
&gt; # The port number which the public admin listens on<br>
&gt; # admin_port =3D 35357<br>
&gt; admin_endpoint =3D <a href=3D"http://192.168.7.2:8081/keystone/admin/"=
 target=3D"_blank">http://192.168.7.2:8081/keystone/admin/</a><br>
&gt; public_endpoint =3D <a href=3D"http://192.168.7.2:8081/keystone/main/"=
 target=3D"_blank">http://192.168.7.2:8081/keystone/main/</a><br>
&gt;<br>
&gt;<br>
&gt; I will be really thankful, if you could guide me.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Srinivas.<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--089e0117691968805f0508da50ac--

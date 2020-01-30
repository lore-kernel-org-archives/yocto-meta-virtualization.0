Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.9421.1580397407879774787
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 07:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: asselsm@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id r16so3472754otd.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2020 07:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=TKA8SrqLDQ6UFPARN0AjWhSRz4UOh06S6WSX7AdIpbc=;
        b=Uo5XqsIY4MJC17WY3D10PtHKG9bHyf13xFxyxsRoww1fkxZbxD/MG7DcWssqPYb383
         rjJsKhbmaxwz7ZhqNwUERU4sHpQkFhsvZGQnsbIbAKJb9E9PaPV6jiXKA0Z85GOqWHEK
         nhDKJih6VEjGf1E/dMvCiRvBctW8etSPsLmPg0reiEosYCggd1hKkyWExnPwBlvb6hGS
         vJ/+KhOGa7X9OhRzOBQ26JIOfOjmjCNFhObHUXfaLTWkvausgmkveO0yTo6HI1yH/r3Q
         4ZU+TiUoAhuYuXU811Yc4zJdjAYcupvm2yfIieXDV4K5q+Lpkcx5iHPi53tYC5XBMnpU
         osRA==
X-Gm-Message-State: APjAAAVl+PxoQdM0pzgFflMLuP6mQd04OgYG/ozno5O0JQotgUFGR+Wb
	Ym00GsJWrCvnCdBRfgHw5FExYfBFVQQGB7EMWUQ=
X-Google-Smtp-Source: APXvYqwHv1ovk5bMgPOLOpIdTDun1CZWQUyhP6p/Zcl3r6R9X0BHo4KEW9UsfI0rVVTeqH/ZYwxhCw7E2i7QNa+P0jQ=
X-Received: by 2002:a9d:d06:: with SMTP id 6mr4066909oti.176.1580397406599;
 Thu, 30 Jan 2020 07:16:46 -0800 (PST)
MIME-Version: 1.0
References: <HE1P195MB0201B5C67E67695186884F1AB70B0@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
 <HE1P195MB02016A8E48D9D16872496CC5B70B0@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
 <CADkTA4O-o5CAXAjM1DrgCBbNwJWDAdxciYxZMrvKFwy4wKM+7A@mail.gmail.com>
In-Reply-To: <CADkTA4O-o5CAXAjM1DrgCBbNwJWDAdxciYxZMrvKFwy4wKM+7A@mail.gmail.com>
Reply-To: mark.asselstine@windriver.com
From: "Mark Asselstine" <asselsm@gmail.com>
Date: Thu, 30 Jan 2020 10:16:35 -0500
Message-ID: <CAPuovEJZJ3e9rqO0Aci=jNWgyDHX3H2orYjAzXdhxGYQJTrjAA@mail.gmail.com>
Subject: Re: [meta-virtualization] [ERROR] Yocto rocko | can't initialize iptables
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Fawad Mazhar <fawadmazhar@hotmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000063d81059d5cf214"

--000000000000063d81059d5cf214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 8:16 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Jan 27, 2020 at 4:24 AM Fawad Mazhar <fawadmazhar@hotmail.com>
> wrote:
>
>>
>> Hi guys,
>>
>>
>> I am Fawad and am currently experimenting, with the Yocto project (rock=
o)
>> and using machine cubox-i. Everything builds fine, but when I add
>> virtualization layer, so that docker is able to run on the cubox hardwa=
re,
>> I keep getting the following error =F0=9F=91=87
>>
>
> This is almost always that you don't have the kernel modules installed
> into the image. Double check that whatever image you are building, you h=
ave
> "kernel-modules" in the package install list.
>
> Bruce
>

Agree. IP Tables and the various support for table types can be very much =
a
pain. The configurations should all be set correctly if you are enabling
the docker kernel config fragments. As Bruce mentions this doesn't mean
they are being included in the rootfs so you need to check on that.
Additionally you can attempt to run dockerd by hand, this will allow you t=
o
pass the --debug option to hopefully get more information on the call into
iptables. The use of 'strace' is also your friend here to try and gain
insight into what dockerd is attempting to call. If you can get this you
can run the same command by hand and hopefully gain further insight into
what is failing.

MarkA


>
>
>>
>>
>>
>> Jan 22 08:28:48 solidrun-imx6 authpriv.notice login[286]: ROOT LOGIN  o=
n
>> '/dev/tty1'
>> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.707598]
>> Bluetooth: RFCOMM TTY layer initialized
>> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.716254]
>> Bluetooth: RFCOMM socket layer initialized
>> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.721527]
>> Bluetooth: RFCOMM ver 1.11
>> Jan 22 08:29:00 solidrun-imx6 user.notice kernel: [   30.181268] random=
:
>> crng init done
>> Jan 22 08:29:00 solidrun-imx6 user.notice kernel: [   30.184699] random=
:
>> 7 urandom warning(s) missed due to ratelimiting
>> Jan 22 08:29:11 solidrun-imx6 user.info kernel: [   41.070720] bridge:
>> filtering via arp/ip/ip6tables is no longer available by default. Updat=
e
>> your scripts to load br_netfilter if you need this.
>> Jan 22 08:29:11 solidrun-imx6 user.notice kernel: [   41.098704] Bridge
>> firewalling registered
>> Jan 22 08:29:11 solidrun-imx6 user.info kernel: [   41.136891]
>> nf_conntrack version 0.5.0 (8192 buckets, 32768 max)
>> Jan 22 08:30:39 solidrun-imx6 daemon.err systemd-networkd-wait-online[2=
97]:
>> Event loop failed: Connection timed out
>> Jan 22 08:30:39 solidrun-imx6 daemon.notice systemd[1]:
>> systemd-networkd-wait-online.service: Main process exited, code=3Dexite=
d,
>> status=3D1/FAILURE
>> Jan 22 08:30:39 solidrun-imx6 daemon.err systemd[1]: Failed to start
>> Wait for Network to be Configured.
>> Jan 22 08:30:39 solidrun-imx6 daemon.notice systemd[1]:
>> systemd-networkd-wait-online.service: Unit entered failed state.
>> Jan 22 08:30:39 solidrun-imx6 daemon.warn systemd[1]:
>> systemd-networkd-wait-online.service: Failed with result 'exit-code'.
>> Jan 22 08:30:39 solidrun-imx6 daemon.info systemd[1]: Reached target
>> Network is Online.
>> Jan 22 08:30:39 solidrun-imx6 daemon.info systemd[1]: Starting Docker
>> Application Container Engine...
>> Jan 22 08:30:40 solidrun-imx6 daemon.info dockerd[442]: time=3D
>> "2020-01-22T08:30:40.157956348Z" level=3Dinfo msg=3D"libcontainerd: new
>> containerd process, pid: 453"
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
>> "2020-01-22T08:30:41.328069015Z" level=3Dinfo msg=3D"Graph migration to
>> content-addressability took 0.00 seconds"
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
>> "2020-01-22T08:30:41.335906015Z" level=3Dwarning msg=3D"mountpoint for =
pids
>> not found"
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
>> "2020-01-22T08:30:41.341441681Z" level=3Dinfo msg=3D"Loading containers=
:
>> start."
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: Error starting
>> daemon: Error initializing network controller: error obtaining controll=
er
>> instance: failed to create NAT chain: iptables failed: iptables --wait
>> -t nat -N DOCKER: iptables v1.6.1: can't initialize iptables
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: Perhaps iptable=
s
>> or your kernel needs to be upgraded.
>> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]:  (exit status 3=
)
>>
>>
>>
>> Can anyone help me out here? Below you can find the bblayer.conf file
>> that I use. I also add a custom docker layer, so that the missing kerne=
l
>> configuration variables are added - it still doesn't help.
>>
>> # bblayers.conf
>> LCONF_VERSION =3D "7"
>>
>> BBPATH =3D "${TOPDIR}"
>> BSPDIR :=3D "${@os.path.abspath(os.path.dirname(d.getVar('FILE', True))=
 +
>> '/../..')}"
>>
>> BBFILES ?=3D ""
>> BBLAYERS =3D " \
>>   ${BSPDIR}/sources/poky/meta \
>>   ${BSPDIR}/sources/poky/meta-poky \
>>   ${BSPDIR}/sources/poky/meta-yocto-bsp \
>>   ${BSPDIR}/sources/meta-openembedded/meta-oe \
>>   ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>>   ${BSPDIR}/sources/meta-openembedded/meta-python \
>>
>>
>>   ${BSPDIR}/sources/meta-openembedded/meta-networking \
>>
>>
>>   ${BSPDIR}/sources/meta-openembedded/meta-filesystems \
>>
>>
>>   ${BSPDIR}/sources/meta-virtualization \
>>   \
>>   ${BSPDIR}/sources/meta-freescale \
>>   ${BSPDIR}/sources/meta-solidrun-bsp \
>>   ${BSPDIR}/sources/meta-docker \
>> "
>>
>>
>> Your help would be greatly appreciated.
>>
>> Thank you!
>>
>>
>> Fawad
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>

--000000000000063d81059d5cf214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 27, 2020 at 8:16 AM Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 27, 2020 at 4:24 AM Fawad Mazhar &lt;<a href=3D"mailto:f=
awadmazhar@hotmail.com" target=3D"_blank">fawadmazhar@hotmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div>
<div id=3D"gmail-m_-1149780283294743108gmail-m_-1443852283631223690appendo=
nsend"></div>
<div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi guys,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<span style=3D"font-size:14px;text-align:left;color:rgba(0,0,0,0.9);backgr=
ound-color:rgb(243,246,248);display:inline">I am Fawad and am currently exp=
erimenting, with the Yocto project (rocko) and using machine cubox-i. Every=
thing builds
 fine, but when I add virtualization layer, so that docker is able to run =
on the cubox hardware, I keep getting the following error
<span id=3D"gmail-m_-1149780283294743108gmail-m_-1443852283631223690=F0=9F=
=
=91=87">=F0=9F=91=87</span>=C2=A0<br></span></div></div></div></div></bloc=
kquote><div><br></div><div><div style=3D"font-size:small">This is almost al=
ways that you don&#39;t have the kernel modules installed into the image. D=
ouble check that whatever image you are building, you have &quot;kernel-mod=
ules&quot; in the package install list.</div><div style=3D"font-size:small"=
><br></div><div style=3D"font-size:small">Bruce</div></div></div></div></bl=
ockquote><div><br></div><div>Agree. IP Tables and the various support for t=
able types can be very much a pain. The configurations should all be set co=
rrectly if you are enabling the docker kernel config fragments. As Bruce me=
ntions this doesn&#39;t mean they are being included in the rootfs so you n=
eed to check on that. Additionally you can attempt to run dockerd by hand, =
this will allow you to pass the --debug option to hopefully get more inform=
ation on the call into iptables. The use of &#39;strace&#39; is also your f=
riend here to try and gain insight into what dockerd is attempting to call.=
 If you can get this you can run the same command by hand and hopefully gai=
n further insight into what is failing.=C2=A0</div><div><br></div><div>Mark=
A</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div>=
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-size:14p=
x;text-align:left;color:rgba(0,0,0,0.9);background-color:rgb(243,246,248);d=
isplay:inline">
<br>
</span><br>
<br>
<span></span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<div style=3D"font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;f=
ont-weight:normal;font-size:14px;line-height:21px;color:rgb(212,212,212);ba=
ckground-color:rgb(30,30,30)">
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">28</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
48</span><span>=C2=A0solidrun-imx6
 authpriv.notice login[</span><span style=3D"color:rgb(181,206,168)">286</=
span><span>]: ROOT LOGIN =C2=A0on
</span><span style=3D"color:rgb(206,145,120)">&#39;/dev/tty1&#39;</span></=
div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">28</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
49</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://user.info" target=3D"_blank">user.info</a> kernel: [ =
=C2=A0 </span><span style=3D"color:rgb(181,206,168)">19.707598</span><span=
>] Bluetooth: RFCOMM TTY layer initialized</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">28</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
49</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://user.info" target=3D"_blank">user.info</a> kernel: [ =
=C2=A0 </span><span style=3D"color:rgb(181,206,168)">19.716254</span><span=
>] Bluetooth: RFCOMM socket layer initialized</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">28</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
49</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://user.info" target=3D"_blank">user.info</a> kernel: [ =
=C2=A0 </span><span style=3D"color:rgb(181,206,168)">19.721527</span><span=
>] Bluetooth: RFCOMM ver
</span><span style=3D"color:rgb(181,206,168)">1.11</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">29</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
00</span><span>=C2=A0solidrun-imx6
 user.notice kernel: [ =C2=A0 </span><span style=3D"color:rgb(181,206,168)=
">30.181268</span><span>] random: crng init done</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">29</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
00</span><span>=C2=A0solidrun-imx6
 user.notice kernel: [ =C2=A0 </span><span style=3D"color:rgb(181,206,168)=
">30.184699</span><span>] random:
</span><span style=3D"color:rgb(181,206,168)">7</span><span>=C2=A0urandom =
warning(s) missed due to ratelimiting</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">29</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
11</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://user.info" target=3D"_blank">user.info</a> kernel: [ =
=C2=A0 </span><span style=3D"color:rgb(181,206,168)">41.070720</span><span=
>] bridge: filtering via arp/ip/ip6tables
</span><span style=3D"color:rgb(86,156,214)">is</span><span>=C2=A0no longe=
r available by default. Update your scripts to load br_netfilter
</span><span style=3D"color:rgb(197,134,192)">if</span><span>=C2=A0you nee=
d this.</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">29</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
11</span><span>=C2=A0solidrun-imx6
 user.notice kernel: [ =C2=A0 </span><span style=3D"color:rgb(181,206,168)=
">41.098704</span><span>] Bridge firewalling registered</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">29</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
11</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://user.info" target=3D"_blank">user.info</a> kernel: [ =
=C2=A0 </span><span style=3D"color:rgb(181,206,168)">41.136891</span><span=
>] nf_conntrack version
</span><span style=3D"color:rgb(181,206,168)">0.5</span><span>.0 (</span><=
span style=3D"color:rgb(181,206,168)">8192</span><span>=C2=A0buckets,
</span><span style=3D"color:rgb(181,206,168)">32768</span><span>=C2=A0</sp=
an><span style=3D"color:rgb(220,220,170)">max</span><span>)</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 daemon.err systemd-networkd-wait-online[</span><span style=3D"color:rgb(1=
81,206,168)">297</span><span>]: Event loop failed: Connection timed out</sp=
an></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 daemon.notice systemd[</span><span style=3D"color:rgb(181,206,168)">1</sp=
an><span>]: systemd-networkd-wait-online.service: Main process exited, code=
=
=3Dexited, status=3D</span><span style=3D"color:rgb(181,206,168)">1</span>=
<span>/FAILURE</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 daemon.err systemd[</span><span style=3D"color:rgb(181,206,168)">1</span>=
<span>]: Failed to start Wait
</span><span style=3D"color:rgb(197,134,192)">for</span><span>=C2=A0Networ=
k to be Configured.</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 daemon.notice systemd[</span><span style=3D"color:rgb(181,206,168)">1</sp=
an><span>]: systemd-networkd-wait-online.service: Unit entered failed state=
.</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 daemon.warn systemd[</span><span style=3D"color:rgb(181,206,168)">1</span=
><span>]: systemd-networkd-wait-online.service: Failed
</span><span style=3D"color:rgb(197,134,192)">with</span><span>=C2=A0resul=
t </span><span style=3D"color:rgb(206,145,120)">&#39;exit-code&#39;</span><=
span>.</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> systemd[=
</span><span style=3D"color:rgb(181,206,168)">1</span><span>]: Reached targ=
et Network
</span><span style=3D"color:rgb(86,156,214)">is</span><span>=C2=A0Online.<=
/span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
39</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> systemd[=
</span><span style=3D"color:rgb(181,206,168)">1</span><span>]: Starting Doc=
ker Application Container Engine...</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
40</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: time=3D</s=
pan><span style=3D"color:rgb(206,145,120)">&quot;2020-01-22T08:30:40.157956=
348Z&quot;</span><span>=C2=A0level=3Dinfo msg=3D</span><span style=3D"color=
:rgb(206,145,120)">&quot;libcontainerd:
 new containerd process, pid: 453&quot;</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: time=3D</s=
pan><span style=3D"color:rgb(206,145,120)">&quot;2020-01-22T08:30:41.328069=
015Z&quot;</span><span>=C2=A0level=3Dinfo msg=3D</span><span style=3D"color=
:rgb(206,145,120)">&quot;Graph
 migration to content-addressability took 0.00 seconds&quot;</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: time=3D</s=
pan><span style=3D"color:rgb(206,145,120)">&quot;2020-01-22T08:30:41.335906=
015Z&quot;</span><span>=C2=A0level=3Dwarning msg=3D</span><span style=3D"co=
lor:rgb(206,145,120)">&quot;mountpoint
 for pids not found&quot;</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: time=3D</s=
pan><span style=3D"color:rgb(206,145,120)">&quot;2020-01-22T08:30:41.341441=
681Z&quot;</span><span>=C2=A0level=3Dinfo msg=3D</span><span style=3D"color=
:rgb(206,145,120)">&quot;Loading
 containers: start.&quot;</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: Error star=
ting daemon: Error initializing network controller: error obtaining control=
ler instance: failed to create NAT chain: iptables failed: iptables
</span><span style=3D"color:rgb(244,71,71)">--</span><span>wait -t nat -N =
DOCKER: iptables v1.6.1: can</span><span style=3D"color:rgb(206,145,120)">&=
#39;t initialize iptables</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: Perhaps ip=
tables
</span><span style=3D"color:rgb(86,156,214)">or</span><span>=C2=A0your ker=
nel needs to be upgraded.</span></div>
<div><span>Jan </span><span style=3D"color:rgb(181,206,168)">22</span><spa=
n>=C2=A0</span><span style=3D"color:rgb(181,206,168)">0</span><span style=
=3D"color:rgb(244,71,71)">8</span><span>:</span><span style=3D"color:rgb(1=
81,206,168)">30</span><span>:</span><span style=3D"color:rgb(181,206,168)">=
41</span><span>=C2=A0solidrun-imx6
 <a href=3D"http://daemon.info" target=3D"_blank">daemon.info</a> dockerd[=
</span><span style=3D"color:rgb(181,206,168)">442</span><span>]: =C2=A0(</s=
pan><span style=3D"color:rgb(220,220,170)">exit</span><span>=C2=A0status
</span><span style=3D"color:rgb(181,206,168)">3</span><span>)</span></div>
<br>
</div>
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
Can anyone help me out here? Below you can find the bblayer.conf file that=
 I use. I also add a custom docker layer, so that the missing kernel config=
uration variables are added - it still doesn&#39;t help.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<div style=3D"font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;f=
ont-weight:normal;font-size:14px;line-height:21px;color:rgb(212,212,212);ba=
ckground-color:rgb(30,30,30)">
<div><span style=3D"color:rgb(156,220,254)"># bblayers.conf<br>
LCONF_VERSION</span><span>=C2=A0=3D </span><span style=3D"color:rgb(206,14=
5,120)">&quot;7&quot;</span></div>
<br>
<div><span style=3D"color:rgb(156,220,254)">BBPATH</span><span>=C2=A0=3D <=
/span><span style=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"co=
lor:rgb(86,156,214)">${TOPDIR}</span><span style=3D"color:rgb(206,145,120)"=
>&quot;</span></div>
<div><span style=3D"color:rgb(156,220,254)">BSPDIR</span><span>=C2=A0:=3D =
</span><span style=3D"color:rgb(206,145,120)">&quot;${@os.path.abspath(os.p=
ath.dirname(d.getVar(&#39;FILE&#39;, True)) + &#39;/../..&#39;)}&quot;</spa=
n></div>
<br>
<div><span style=3D"color:rgb(156,220,254)">BBFILES</span><span>=C2=A0?=3D=
 </span><span style=3D"color:rgb(206,145,120)">&quot;&quot;</span></div>
<div><span style=3D"color:rgb(156,220,254)">BBLAYERS</span><span>=C2=A0=3D=
 </span><span style=3D"color:rgb(206,145,120)">&quot; \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/poky/meta \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/poky/meta-poky \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/poky/meta-yocto-bsp \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-openembedded/meta-oe \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-openembedded/meta-multimedia \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-openembedded/meta-python \ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-openembedded/meta-networking \ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-openembedded/meta-filesystems \ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 </span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-virtualization \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-freescale \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-solidrun-bsp \</span></div>
<div><span style=3D"color:rgb(206,145,120)">=C2=A0 </span><span style=3D"c=
olor:rgb(86,156,214)">${BSPDIR}</span><span style=3D"color:rgb(206,145,120)=
">/sources/meta-docker \</span></div>
<div><span style=3D"color:rgb(206,145,120)">&quot;</span></div>
</div>
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
Your help would be greatly appreciated.<br>
<br>
Thank you!</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
Fawad</div>
</div>
</div>
</div>

<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
</blockquote></div></div>

--000000000000063d81059d5cf214--

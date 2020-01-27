Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.8339.1580130960323585263
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 05:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jf1Ndw3E;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id r18so10740592edl.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jan 2020 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MvUW1Qin3dft0eR+1OkknyOS7KbbZiHHeyP/tyQ9Puk=;
        b=Jf1Ndw3EcQafmIMbq7k8bPfvBr2OlWpGFdyEK4/ms5/XWWMHy3bs2vFuvCGljjOCPi
         /y8xjqZtRoiEVZiN1Y1BE8IX6ZBWVJqbjnkOz/yJjsgE19zkglAsq9z5V+MUw7lvLBfA
         cW7kQTzjjQZmRsBbL1TDHB3mNX3UskM/yr0ltPfpD0rmoBSSLcnunJWgriwN0hM8qeZB
         Ltn5JCEwmx56hPudFfQfmLMORil8uQjbCwPR1lhvSPD26T8bAgA7Q+GT73H1l4GYsK/L
         m77ISG1AenG3fEcFtWkLfvCuHbqDcIQXm1ngoIc+ir7rSkuzbN9nE9TLUTHK7G60ON77
         S7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MvUW1Qin3dft0eR+1OkknyOS7KbbZiHHeyP/tyQ9Puk=;
        b=Y/39lb1IgPrFfl9h3ViG/7OpSmUS8ldrpyBlpgKDq+Qukdw58omTGt2lzyrddpZshe
         nYJi2bwCLG2brULfbjHlJTIDeh/vvfBVp+RvToqzZJWXIUczptU3BbC2z7wcsIyUvKO8
         vaQcuTUQ8qCJkskJi0lmYGW1XNDuUoG6UKWBHXl6KHJ7PBRj9ef2Ty967Xmm3Gz2eCll
         I+cTdLbuckFaXkrpOzSfdM80s9pPSeJ1Nd2MghUhyJ/Ie7n+T0ZECmz4IYQgiRdI30qq
         N43JoSJ+FeGDxSN6iwHFakIXR7BngKziuwkC12IYcUt+CrcjoLZQI25+SLKUVDG5uTRG
         CTmA==
X-Gm-Message-State: APjAAAUSc4UDzUJ8PEjDJeBeLcIcC3LPPIJb+Vi21joQzAgefKlUgy7p
	MvYxypDXnBVWxOeIHjTWI5cu1sIr4IgYZ1B6uZI=
X-Google-Smtp-Source: APXvYqyqXrLiHFKaJIRrxHZqgaIpeicz4USunVeRUXQFDldXXknWJgA1g44CoSE9iQuP9Xh4VK7laNhlGirsjPMfzvw=
X-Received: by 2002:a05:6402:309c:: with SMTP id de28mr9020515edb.27.1580130958748;
 Mon, 27 Jan 2020 05:15:58 -0800 (PST)
MIME-Version: 1.0
References: <HE1P195MB0201B5C67E67695186884F1AB70B0@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
 <HE1P195MB02016A8E48D9D16872496CC5B70B0@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <HE1P195MB02016A8E48D9D16872496CC5B70B0@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 27 Jan 2020 08:15:47 -0500
Message-ID: <CADkTA4O-o5CAXAjM1DrgCBbNwJWDAdxciYxZMrvKFwy4wKM+7A@mail.gmail.com>
Subject: Re: [meta-virtualization] [ERROR] Yocto rocko | can't initialize iptables
To: Fawad Mazhar <fawadmazhar@hotmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000007ead36059d1ee8dd"

--0000000000007ead36059d1ee8dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 4:24 AM Fawad Mazhar <fawadmazhar@hotmail.com>
wrote:

>
> Hi guys,
>
>
> I am Fawad and am currently experimenting, with the Yocto project (rocko=
)
> and using machine cubox-i. Everything builds fine, but when I add
> virtualization layer, so that docker is able to run on the cubox hardwar=
e,
> I keep getting the following error =F0=9F=91=87
>

This is almost always that you don't have the kernel modules installed int=
o
the image. Double check that whatever image you are building, you have
"kernel-modules" in the package install list.

Bruce



>
>
>
> Jan 22 08:28:48 solidrun-imx6 authpriv.notice login[286]: ROOT LOGIN  on
> '/dev/tty1'
> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.707598] Bluetooth=
:
> RFCOMM TTY layer initialized
> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.716254] Bluetooth=
:
> RFCOMM socket layer initialized
> Jan 22 08:28:49 solidrun-imx6 user.info kernel: [   19.721527] Bluetooth=
:
> RFCOMM ver 1.11
> Jan 22 08:29:00 solidrun-imx6 user.notice kernel: [   30.181268] random:
> crng init done
> Jan 22 08:29:00 solidrun-imx6 user.notice kernel: [   30.184699] random:=
 7 urandom
> warning(s) missed due to ratelimiting
> Jan 22 08:29:11 solidrun-imx6 user.info kernel: [   41.070720] bridge:
> filtering via arp/ip/ip6tables is no longer available by default. Update
> your scripts to load br_netfilter if you need this.
> Jan 22 08:29:11 solidrun-imx6 user.notice kernel: [   41.098704] Bridge
> firewalling registered
> Jan 22 08:29:11 solidrun-imx6 user.info kernel: [   41.136891]
> nf_conntrack version 0.5.0 (8192 buckets, 32768 max)
> Jan 22 08:30:39 solidrun-imx6 daemon.err systemd-networkd-wait-online[29=
7]:
> Event loop failed: Connection timed out
> Jan 22 08:30:39 solidrun-imx6 daemon.notice systemd[1]:
> systemd-networkd-wait-online.service: Main process exited, code=3Dexited=
,
> status=3D1/FAILURE
> Jan 22 08:30:39 solidrun-imx6 daemon.err systemd[1]: Failed to start Wai=
t
> for Network to be Configured.
> Jan 22 08:30:39 solidrun-imx6 daemon.notice systemd[1]:
> systemd-networkd-wait-online.service: Unit entered failed state.
> Jan 22 08:30:39 solidrun-imx6 daemon.warn systemd[1]:
> systemd-networkd-wait-online.service: Failed with result 'exit-code'.
> Jan 22 08:30:39 solidrun-imx6 daemon.info systemd[1]: Reached target
> Network is Online.
> Jan 22 08:30:39 solidrun-imx6 daemon.info systemd[1]: Starting Docker
> Application Container Engine...
> Jan 22 08:30:40 solidrun-imx6 daemon.info dockerd[442]: time=3D
> "2020-01-22T08:30:40.157956348Z" level=3Dinfo msg=3D"libcontainerd: new
> containerd process, pid: 453"
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
> "2020-01-22T08:30:41.328069015Z" level=3Dinfo msg=3D"Graph migration to
> content-addressability took 0.00 seconds"
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
> "2020-01-22T08:30:41.335906015Z" level=3Dwarning msg=3D"mountpoint for p=
ids
> not found"
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: time=3D
> "2020-01-22T08:30:41.341441681Z" level=3Dinfo msg=3D"Loading containers:
> start."
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: Error starting
> daemon: Error initializing network controller: error obtaining controlle=
r
> instance: failed to create NAT chain: iptables failed: iptables --wait -=
t
> nat -N DOCKER: iptables v1.6.1: can't initialize iptables
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]: Perhaps iptables
> or your kernel needs to be upgraded.
> Jan 22 08:30:41 solidrun-imx6 daemon.info dockerd[442]:  (exit status 3)
>
>
>
> Can anyone help me out here? Below you can find the bblayer.conf file th=
at
> I use. I also add a custom docker layer, so that the missing kernel
> configuration variables are added - it still doesn't help.
>
> # bblayers.conf
> LCONF_VERSION =3D "7"
>
> BBPATH =3D "${TOPDIR}"
> BSPDIR :=3D "${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) =
+
> '/../..')}"
>
> BBFILES ?=3D ""
> BBLAYERS =3D " \
>   ${BSPDIR}/sources/poky/meta \
>   ${BSPDIR}/sources/poky/meta-poky \
>   ${BSPDIR}/sources/poky/meta-yocto-bsp \
>   ${BSPDIR}/sources/meta-openembedded/meta-oe \
>   ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>   ${BSPDIR}/sources/meta-openembedded/meta-python \
>
>
>   ${BSPDIR}/sources/meta-openembedded/meta-networking \
>
>
>   ${BSPDIR}/sources/meta-openembedded/meta-filesystems \
>
>
>   ${BSPDIR}/sources/meta-virtualization \
>   \
>   ${BSPDIR}/sources/meta-freescale \
>   ${BSPDIR}/sources/meta-solidrun-bsp \
>   ${BSPDIR}/sources/meta-docker \
> "
>
>
> Your help would be greatly appreciated.
>
> Thank you!
>
>
> Fawad
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007ead36059d1ee8dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jan 27, 2020 at 4:24 AM Fawad Mazhar &lt;<a=
 href=3D"mailto:fawadmazhar@hotmail.com">fawadmazhar@hotmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div>
<div id=3D"gmail-m_-1443852283631223690appendonsend"></div>
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
<span id=3D"gmail-m_-1443852283631223690=F0=9F=91=87">=F0=9F=91=87</span>=
=C2=A0<br></span></div></div></div></div></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">This is almost alway=
s that you don&#39;t have the kernel modules installed into the image. Doub=
le check that whatever image you are building, you have &quot;kernel-module=
s&quot; in the package install list.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div><div><div style=3D"font-fami=
ly:Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);background-=
color:rgb(255,255,255)"><span style=3D"font-size:14px;text-align:left;color=
:rgba(0,0,0,0.9);background-color:rgb(243,246,248);display:inline">
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
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--0000000000007ead36059d1ee8dd--

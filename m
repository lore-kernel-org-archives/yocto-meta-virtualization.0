Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E805E009A0; Tue, 20 Jun 2017 00:49:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.53 listed in list.dnswl.org]
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2B0BE00B05
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Jun 2017 00:49:52 -0700 (PDT)
Received: by mail-oi0-f53.google.com with SMTP id p187so9479930oif.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Jun 2017 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nEkM+QspqEjUjxhyPz8/zQhpskEUbgabOJjTD8c97n8=;
	b=IT1VdQbd1FTiTfMFdTiJLPNAdwls6gduvBMKATbfCROlBcUGBXYeEI9wtp3xKf+OXY
	0IoB1zNoROWI1k6bh3mzg4/TCfOx4tICburljM0y1cgB9bUPSG9eVvSyjC/P1vrzeimR
	FHsfV8RjyyOiJ45ASqSYZzTEM0F3/bkEKn+9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nEkM+QspqEjUjxhyPz8/zQhpskEUbgabOJjTD8c97n8=;
	b=ZBkbNXUEm+tsyzV1zB62/B+sNUDJaAIaT/Oey0ETtX9ujZ0Fend0jjd7cy6HKKmybl
	OE+SI/3VMjT/FZmxIeQJHfowplHGTuEibEt7H9YkpzgF8nqvX2SXvYQVBwsD6DLEPtgZ
	gS0J9YPXyOi/m0t66QZT4Uqd7azpU5iYkJV/cfXbejs58uXw6TReRhcp9rOGZeJlJL80
	eq2mjqkLtdJ7+IwkPxjjCtp76aEjspEAjp/fZ7jDYGGimH9qspuK15Gus+l9XPrbSbIn
	Kjv2q8gTyplpIqLxbWUvtN4O1aMRQrmON2xqvrfLnVdqBV8i4vcBuAyh0+e6Ti1KvP5V
	+Ahw==
X-Gm-Message-State: AKS2vOzethhRtRpegof9Tu1GN8xur8Jw0DOGOmlB/6y+VxNL/k8AtJDg
	Yyhy/Yv0E/T6tkP1xh734eC52JOrptEh
X-Received: by 10.202.225.65 with SMTP id y62mr12112751oig.113.1497944992009; 
	Tue, 20 Jun 2017 00:49:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.13.80 with HTTP; Tue, 20 Jun 2017 00:49:51 -0700 (PDT)
In-Reply-To: <CACMJ4GZ7_f-060QzY9ovD5Lv2PSVPKNpuqxsA7EWS86t8-3-TQ@mail.gmail.com>
References: <CAFL6qn66cKkfowybMqSBrROogMxRw1R1eQk65E4y=HM0wyfmrA@mail.gmail.com>
	<CACMJ4GZ7_f-060QzY9ovD5Lv2PSVPKNpuqxsA7EWS86t8-3-TQ@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 20 Jun 2017 09:49:51 +0200
Message-ID: <CAFL6qn4_Px+M3w0gN3ZuYHDqQE+mRse=5i9bQTcNT-zhQJjFKA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, meta-xilinx@yoctoproject.org
Subject: Re: How to asign especific HW to each OS working with Xen over MPSoC
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
X-List-Received-Date: Tue, 20 Jun 2017 07:49:54 -0000
Content-Type: multipart/alternative; boundary="001a113d4694247b5205525f7fd9"

--001a113d4694247b5205525f7fd9
Content-Type: text/plain; charset="UTF-8"

Hi Christopher,

First of all, thank you for your replay, but could you send me a bit of
more information about all this questions taking into account that I'm
going to work with the Zynq MPSoC platform, with the ZCU102 board?

Thanks anyway,
Pello

2017-06-20 3:07 GMT+02:00 Christopher Clark <christopher.w.clark@gmail.com>:

> On Sun, Jun 18, 2017 at 11:58 PM, Pello Heriz <
> pello.heriz@alumni.mondragon.edu> wrote:
> >
> >   I'm very interested in knowing how to asign especific HW to each one
> of the running OS-s if I'm working with Xen hypervisor. Is it possible?
> Where do I need to specify this?
>
> It is possible. The method of doing it depends on which type of HW you
> need to assign.
>
> Some options are configured on the Xen or dom0 kernel command lines in
> your bootloader config file (eg. grub.cfg  or syslinux.cfg or ..).
>
> Other options, for other hardware, can be configured in xl.cfg for a VM,
> and xl.conf for the host:
> https://wiki.xenproject.org/wiki/Xen_Man_Pages
>
> You may find more help available on the xen-users mailing list:
> https://lists.xenproject.org/mailman/listinfo/xen-users
>
>
> >   On the other hand, I also would like to know, how would the different
> OS-s running under Xen hypervisor communicate between them. I.e.: an
> application running over Linux (i.e.: Docker) and FreeRTOS.
>
> The simplest method may be to create virtual network interfaces in each
> guest OS, configure networking inside each, and then use that (eg. ssh or
> something else over TCP/IP) for communication between them.
>
> If FreeRTOS doesn't have support for networking on Xen, then you may have
> to look at using the Grant Tables and Event channels, or xenstore, to
> communicate.
>
>
> >   Finally, it would be interesting for me too, to know how to debug the
> behaviour of an OS running under Xen (i.e.: FreeRTOS) in the real MPSoC
> board.
>
> There are instructions on this page:
> https://github.com/GaloisInc/FreeRTOS-Xen
>
> that indicate how you can enable printk within FreeRTOS to output to the
> xen console, which you should be able to access from dom0. That will allow
> you to instrument your FreeRTOS kernel code to output the debugging data
> that you want.
>
> You can also search the archives of xen-devel for references to FreeRTOS
> where Xen developers have provided some feedback on the code in that port.
>
> Good luck,
>
> Christopher
>
> --
> http://openxt.org/
>
>
> >   Any answer would be helpful,
> >
> >   Thanks,
> >   Pello
>
>
>>
>

--001a113d4694247b5205525f7fd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Christopher,<div><br></div><div>First of all, thank you=
 for your replay, but could you send me a bit of more information about all=
 this questions taking into account that I&#39;m going to work with the Zyn=
q MPSoC platform, with the ZCU102 board?</div><div><br></div><div>Thanks an=
yway,</div><div>Pello</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2017-06-20 3:07 GMT+02:00 Christopher Clark <span dir=3D"l=
tr">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">=
christopher.w.clark@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div><span class=3D"">On Sun, Jun 18, 2017 at 11:58 P=
M, Pello Heriz &lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu" targ=
et=3D"_blank">pello.heriz@alumni.mondragon.<wbr>edu</a>&gt; wrote:<br>&gt;<=
br>&gt;=C2=A0=C2=A0 I&#39;m very interested in knowing how to asign especif=
ic HW to each one of the running OS-s if I&#39;m working with Xen hyperviso=
r. Is it possible? Where do I need to specify this?<br><br></span>It is pos=
sible. The method of doing it depends on which type of HW you need to assig=
n.<br><br>Some options are configured on the Xen or dom0 kernel command lin=
es in your bootloader config file (eg. grub.cfg=C2=A0 or syslinux.cfg or ..=
).<br><br>Other options, for other hardware, can be configured in xl.cfg fo=
r a VM, and xl.conf for the host:<br><a href=3D"https://wiki.xenproject.org=
/wiki/Xen_Man_Pages" target=3D"_blank">https://wiki.xenproject.org/<wbr>wik=
i/Xen_Man_Pages</a><br><br>You may find more help available on the xen-user=
s mailing list:<br><a href=3D"https://lists.xenproject.org/mailman/listinfo=
/xen-users" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-users</a><span class=3D""><br><br><br>&gt;=C2=A0=C2=A0 On the oth=
er hand, I also would like to know, how would the different OS-s running un=
der Xen hypervisor communicate between them. I.e.: an application running o=
ver Linux (i.e.: Docker) and FreeRTOS.<br><br></span>The simplest method ma=
y be to create virtual network interfaces in each guest OS, configure netwo=
rking inside each, and then use that (eg. ssh or something else over TCP/IP=
) for communication between them.<br><br></div>If FreeRTOS doesn&#39;t have=
 support for networking on Xen, then you may have to look at using the Gran=
t Tables and Event channels, or xenstore, to communicate.<br><div><span cla=
ss=3D""><br><br>&gt;=C2=A0=C2=A0 Finally, it would be interesting for me to=
o, to know how to debug the behaviour of an OS running under Xen (i.e.: Fre=
eRTOS) in the real MPSoC board.<br><br></span>There are instructions on thi=
s page:<br><a href=3D"https://github.com/GaloisInc/FreeRTOS-Xen" target=3D"=
_blank">https://github.com/GaloisInc/<wbr>FreeRTOS-Xen</a><br><br>that indi=
cate how you can enable printk within FreeRTOS to output to the xen console=
, which you should be able to access from dom0. That will allow you to inst=
rument your FreeRTOS kernel code to output the debugging data that you want=
.<br><br></div><div>You can also search the archives of xen-devel for refer=
ences to FreeRTOS where Xen developers have provided some feedback on the c=
ode in that port.<br></div><div><br>Good luck,<br><br>Christopher<br><br>--=
<br></div><div><a href=3D"http://openxt.org/" target=3D"_blank">http://open=
xt.org/</a><br></div><span class=3D""><div><br><br>&gt;=C2=A0=C2=A0 Any ans=
wer would be helpful,<br>&gt;<br>&gt;=C2=A0=C2=A0 Thanks,<br>&gt;=C2=A0=C2=
=A0 Pello<br><br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br></blockquote></div><br></div></div></span></div>
</blockquote></div><br></div>

--001a113d4694247b5205525f7fd9--

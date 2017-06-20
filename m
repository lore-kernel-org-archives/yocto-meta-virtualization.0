Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8688CE00B01; Mon, 19 Jun 2017 18:07:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E314E009A0;
	Mon, 19 Jun 2017 18:07:25 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id o83so64984319lff.3;
	Mon, 19 Jun 2017 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YogQQkhM/0ThFI9B0J5XJatxXuehN5CVlSq5w+vtYbY=;
	b=mqOgTGwTToD3yhKzu7rdgUrMESDDaKzDwHMv6zQ1VSSPOwQRdROd5bXuL3VrCuZOcc
	/oGlJONEw8vHBesc+x5QxrSUVSxxuUxh3ldOECUWM/ukT1tE9+8RBeuF0aBDFiLfq+Ey
	n3N2a+SBqkVI1RjqaxzuKE/0eAGrJIEQFvZw1EAzbSyrMJ87LlnetB8vXtDqiiMYCQdy
	Zy8XrHswvbN/ol/A6qqIKZf6Kz2hmBuWXKaQj6vKHWh3GTR2/yjXxHQM8OYKnJtc1oc2
	pTGVd2ORaDr0gnwFlpp/ZKvXbAekOfcfSXUrj6BMmm100PAY/G94xSezuUR+YZYjTHX9
	pytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YogQQkhM/0ThFI9B0J5XJatxXuehN5CVlSq5w+vtYbY=;
	b=XJeT1CnbOq27VHPEN9qo2oEeHYWuvFs5teIYkZ7BjGLWBj+GHDsSF2ZqmgVpLZoGI1
	T6koJPu1QnMvQAkY6bfQxsqJIJ9BDdgRCdnHX7dyi+dQ02ZcPr+Zqv4xALgcxH3Ui4CO
	jZnzE8aVEMGr2+nz/ImiRne/6PPsrPcQhgvNYzDSWUUUGWSUBvkE/yB1oGUMsek+7LhG
	wXTK8DUlL2GFJjwke9qaChnam1UN5bW74OkxnsaqrAuq+D8WCe9y0m61Nzo0AvKUmpBq
	87mEQ5GDBidefyaPh4lI0V2qov0xea/7MO/pmU2recj03Bx1qMiaesNIFmVmlvEzChqv
	4Zgg==
X-Gm-Message-State: AKS2vOzSOaf6kJ3G5nmfiNoGG+jD+Ng4kWr1z/gRptM1RghScbC8x1hA
	v1kULx+H3jo3UpnhZ1bAgrLOXeXXcw==
X-Received: by 10.25.26.205 with SMTP id a196mr8870658lfa.164.1497920844848;
	Mon, 19 Jun 2017 18:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.67.69 with HTTP; Mon, 19 Jun 2017 18:07:24 -0700 (PDT)
In-Reply-To: <CAFL6qn66cKkfowybMqSBrROogMxRw1R1eQk65E4y=HM0wyfmrA@mail.gmail.com>
References: <CAFL6qn66cKkfowybMqSBrROogMxRw1R1eQk65E4y=HM0wyfmrA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 19 Jun 2017 18:07:24 -0700
Message-ID: <CACMJ4GZ7_f-060QzY9ovD5Lv2PSVPKNpuqxsA7EWS86t8-3-TQ@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
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
X-List-Received-Date: Tue, 20 Jun 2017 01:07:29 -0000
Content-Type: multipart/alternative; boundary="001a11401c06dbe76b055259df8b"

--001a11401c06dbe76b055259df8b
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 18, 2017 at 11:58 PM, Pello Heriz <
pello.heriz@alumni.mondragon.edu> wrote:
>
>   I'm very interested in knowing how to asign especific HW to each one of
the running OS-s if I'm working with Xen hypervisor. Is it possible? Where
do I need to specify this?

It is possible. The method of doing it depends on which type of HW you need
to assign.

Some options are configured on the Xen or dom0 kernel command lines in your
bootloader config file (eg. grub.cfg  or syslinux.cfg or ..).

Other options, for other hardware, can be configured in xl.cfg for a VM,
and xl.conf for the host:
https://wiki.xenproject.org/wiki/Xen_Man_Pages

You may find more help available on the xen-users mailing list:
https://lists.xenproject.org/mailman/listinfo/xen-users


>   On the other hand, I also would like to know, how would the different
OS-s running under Xen hypervisor communicate between them. I.e.: an
application running over Linux (i.e.: Docker) and FreeRTOS.

The simplest method may be to create virtual network interfaces in each
guest OS, configure networking inside each, and then use that (eg. ssh or
something else over TCP/IP) for communication between them.

If FreeRTOS doesn't have support for networking on Xen, then you may have
to look at using the Grant Tables and Event channels, or xenstore, to
communicate.


>   Finally, it would be interesting for me too, to know how to debug the
behaviour of an OS running under Xen (i.e.: FreeRTOS) in the real MPSoC
board.

There are instructions on this page:
https://github.com/GaloisInc/FreeRTOS-Xen

that indicate how you can enable printk within FreeRTOS to output to the
xen console, which you should be able to access from dom0. That will allow
you to instrument your FreeRTOS kernel code to output the debugging data
that you want.

You can also search the archives of xen-devel for references to FreeRTOS
where Xen developers have provided some feedback on the code in that port.

Good luck,

Christopher

--
http://openxt.org/


>   Any answer would be helpful,
>
>   Thanks,
>   Pello


>

--001a11401c06dbe76b055259df8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Sun, Jun 18, 2017 at 11:58 PM, Pello Heriz &lt;<a =
href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.heriz@alumni.mondrag=
on.edu</a>&gt; wrote:<br>&gt;<br>&gt;=C2=A0=C2=A0 I&#39;m very interested i=
n knowing how to asign especific HW to each one of the running OS-s if I&#3=
9;m working with Xen hypervisor. Is it possible? Where do I need to specify=
 this?<br><br>It is possible. The method of doing it depends on which type =
of HW you need to assign.<br><br>Some options are configured on the Xen or =
dom0 kernel command lines in your bootloader config file (eg. grub.cfg=C2=
=A0 or syslinux.cfg or ..).<br><br>Other options, for other hardware, can b=
e configured in xl.cfg for a VM, and xl.conf for the host:<br><a href=3D"ht=
tps://wiki.xenproject.org/wiki/Xen_Man_Pages">https://wiki.xenproject.org/w=
iki/Xen_Man_Pages</a><br><br>You may find more help available on the xen-us=
ers mailing list:<br><a href=3D"https://lists.xenproject.org/mailman/listin=
fo/xen-users">https://lists.xenproject.org/mailman/listinfo/xen-users</a><b=
r><br><br>&gt;=C2=A0=C2=A0 On the other hand, I also would like to know, ho=
w would the different OS-s running under Xen hypervisor communicate between=
 them. I.e.: an application running over Linux (i.e.: Docker) and FreeRTOS.=
<br><br>The simplest method may be to create virtual network interfaces in =
each guest OS, configure networking inside each, and then use that (eg. ssh=
 or something else over TCP/IP) for communication between them.<br><br></di=
v>If FreeRTOS doesn&#39;t have support for networking on Xen, then you may =
have to look at using the Grant Tables and Event channels, or xenstore, to =
communicate.<br><div><br><br>&gt;=C2=A0=C2=A0 Finally, it would be interest=
ing for me too, to know how to debug the behaviour of an OS running under X=
en (i.e.: FreeRTOS) in the real MPSoC board.<br><br>There are instructions =
on this page:<br><a href=3D"https://github.com/GaloisInc/FreeRTOS-Xen">http=
s://github.com/GaloisInc/FreeRTOS-Xen</a><br><br>that indicate how you can =
enable printk within FreeRTOS to output to the xen console, which you shoul=
d be able to access from dom0. That will allow you to instrument your FreeR=
TOS kernel code to output the debugging data that you want.<br><br></div><d=
iv>You can also search the archives of xen-devel for references to FreeRTOS=
 where Xen developers have provided some feedback on the code in that port.=
<br></div><div><br>Good luck,<br><br>Christopher<br><br>--<br></div><div><a=
 href=3D"http://openxt.org/">http://openxt.org/</a><br></div><div><br><br>&=
gt;=C2=A0=C2=A0 Any answer would be helpful,<br>&gt;<br>&gt;=C2=A0=C2=A0 Th=
anks,<br>&gt;=C2=A0=C2=A0 Pello<br><br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br></blockquote></div><br></div></div></div>

--001a11401c06dbe76b055259df8b--

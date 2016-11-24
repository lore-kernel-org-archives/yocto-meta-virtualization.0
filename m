Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAEE1E00CAF; Thu, 24 Nov 2016 05:57:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81DCCE00BBA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Nov 2016 05:57:17 -0800 (PST)
Received: by mail-qk0-f178.google.com with SMTP id x190so50162416qkb.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Nov 2016 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+e1O375oDQ4uPLWPzhHUR6xQYhNNTWkIyPSplQeJiE=;
	b=mdM4XTLr+AtyYHhzskQ3HH0znAtoYRADT8f+FMy3mYlCjj+pwEXkRbG0Ntk0CQ4dwk
	VFxDza/0tQ6aYApp5mf4+EOrzg/2wZmNyQY89MzFQorOKArc8XYYd/oDiNIIKD8uob78
	EaCi3aFa6xU6J62RUnRtl4k0xyzlacWhg9ODlNmIjfoS/iazpTC5q8906jmVLJFZJMKk
	MejHxcTk2IbptHvRwFfEjpiUJVIomV0/LHV9vQx1jb7qDGQCdDK34TrSok6nUe9wX7qE
	XbqE1iZdsYIQM5Ru7X9K7wSibUBFqrgbXpUk0tR2ai51WoABg3uMvQmrCYyefySfQUDz
	vMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+e1O375oDQ4uPLWPzhHUR6xQYhNNTWkIyPSplQeJiE=;
	b=UoWzQS/LXvSeAKamoozszIGsEjaXDe9BMiXI5w1ual9P2t1Y3XcFILA8sNG8aNqBRn
	+B2l9JwTvQTrrJL5JfS/qLozhmm7CDNzZ83gqMO/z9QfshDn152i5b2nRG5L9jhUwXMy
	fECazejdp3P9h0u1X+5CfdRhWg8lF1uiA3mMgBoDcbGbbzgVY2gt8f6x01gxS9njKJ1j
	vSQ8d0Dx+uFKzcrZZvQGQntcINADB0IPozMwSX5pd4s61NZLeqpSAzjMwibIN4RRWmHO
	yCTOdaeNsCVbRa3yigHm+gwOEzgd7+0f4sYXyKJvh/00xm7Z8lUknsEyWWRD1a3yxAYj
	Bvow==
X-Gm-Message-State: AKaTC00jh/QtOhh77Gp09Q8f7VEDrmy5bToccYxp8MO9S6IsgLDhrhJmarED3eq/aL92HRBcO6K11/Sq5Phslg==
X-Received: by 10.55.207.131 with SMTP id v3mr2228034qkl.159.1479995836483;
	Thu, 24 Nov 2016 05:57:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Thu, 24 Nov 2016 05:57:15 -0800 (PST)
In-Reply-To: <C057D02A-D29A-4920-B281-D689568D6D9F@supercoders.com.au>
References: <C057D02A-D29A-4920-B281-D689568D6D9F@supercoders.com.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Nov 2016 08:57:15 -0500
Message-ID: <CADkTA4P96k=FTwxoVbjvje+aCsK3gEesLNrEcCUF58JDTRWBmw@mail.gmail.com>
To: Andrew Stuart <andrew.stuart@supercoders.com.au>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ERROR: No recipes available for: linux-yocto_4.8.bbappend
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
X-List-Received-Date: Thu, 24 Nov 2016 13:57:20 -0000
Content-Type: multipart/alternative; boundary=001a1145b7fa1a4f9305420c6234

--001a1145b7fa1a4f9305420c6234
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 24, 2016 at 12:51 AM, Andrew Stuart <
andrew.stuart@supercoders.com.au> wrote:

> Hi folks,
>
> I am getting the following error:
>
> ubuntu@ugbuildserver:/mnt/dude/poky-krogoth-15.0.2/build$ bitbake
> xen-guest-image-minimal
> Loading cache: 100% |#############################
> ############################################################
> ##################################################################| ETA:
> 00:00:00
> Loaded 2606 entries from dependency cache.
> ERROR: No recipes available for:
>   /mnt/dude/poky-krogoth-15.0.2/meta-virtualization/recipes-
> kernel/linux/linux-yocto_4.8.bbappend
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> ubuntu@ugbuildserver:/mnt/dude/poky-krogoth-15.0.2/build$
>
> Can anyone suggest please what might be wrong?
>
>
You are using a branch of meta-virtualization that doesn't match the branch
of your
oe-core (or yocto/poky) layers.

by default danging bbappends aren't allowed, and if there's no kernel
recipe with the
same version as the bbappend, you get that error.

Bruce


> thanks
>
> Andrew
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1145b7fa1a4f9305420c6234
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 24, 2016 at 12:51 AM, Andrew Stuart <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andrew.stuart@supercoders.com.au" target=3D"_blank">andrew=
.stuart@supercoders.com.au</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi folks,<br>
<br>
I am getting the following error:<br>
<br>
ubuntu@ugbuildserver:/mnt/<wbr>dude/poky-krogoth-15.0.2/<wbr>build$ bitbake=
 xen-guest-image-minimal<br>
Loading cache: 100% |#############################<wbr>####################=
##########<wbr>##############################<wbr>#########################=
#####<wbr>##############################<wbr>######| ETA:=C2=A0 00:00:00<br=
>
Loaded 2606 entries from dependency cache.<br>
ERROR: No recipes available for:<br>
=C2=A0 /mnt/dude/poky-krogoth-15.0.2/<wbr>meta-virtualization/recipes-<wbr>=
kernel/linux/linux-yocto_4.8.<wbr>bbappend<br>
<br>
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r>
ubuntu@ugbuildserver:/mnt/<wbr>dude/poky-krogoth-15.0.2/<wbr>build$<br>
<br>
Can anyone suggest please what might be wrong?<br>
<br></blockquote><div><br></div><div>You are using a branch of meta-virtual=
ization that doesn&#39;t match the branch of your<br></div><div>oe-core (or=
 yocto/poky) layers.<br><br></div><div>by default danging bbappends aren&#3=
9;t allowed, and if there&#39;s no kernel recipe with the<br></div><div>sam=
e version as the bbappend, you get that error.<br><br></div><div>Bruce<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a1145b7fa1a4f9305420c6234--

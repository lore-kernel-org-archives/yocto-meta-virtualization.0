Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.21286.1633408809655319195
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 21:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DI9kTT30;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so24410008otb.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Oct 2021 21:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/kyWRXG3XUwblOlIEOCudGVhEjQFnMGMpwek94Tw+g=;
        b=DI9kTT30SbYIWKM0nuki4KJIHyEi5CoDi5QaHLj+W0JlhhxKSD+rtDo25P1dTgrVCi
         1H9RQqStoHdjvDRwiNuAOLC9HPZAtoSt1V6+Q18Fq+wdpkaEV24YsDKA4wdGsU1jjnA1
         5gPRh7UmAeusTEnlm057YAba8v6uCk+LXY+hKqye5TDxIzvYxzzLeb4kNqX1ccmUoLat
         u32Wr46tErqXAwq8UiV41anlR6bUZDvLLykLbymbpqbP9kqETgyC13fsjk5ZlxLUJ7nE
         /tC2+fAUOk880aEBrLFyWd9WIXZBKHgCQrCJprGZew4WmZ55/MQXeeudqtMEYqfCbtWu
         182A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/kyWRXG3XUwblOlIEOCudGVhEjQFnMGMpwek94Tw+g=;
        b=gh3WeT5TvJi8UQHB5X9Yc82RnUjoPouhyCL5i8blOCreFR1F1A5oDgU6wg/lcQfIi6
         dnA4YcTuyrlmqeACSB2H3c9KiMvXj63aXmB8emN+oaY/5e8aW9si4Lv3I6FgCT0R7kgr
         Ep/uUGl5Q0rCeFZd9M8fUzMN9zyKyxRe5fEnPQOHN55nmLDdxgPJ/lPq0kXo78XsBVHL
         XQoOg25GJ1fnjVOANDCwdknueTMZI8mseng8vUMst8ViI5yIJhkzg1hSyRVSGFmuUweV
         y66FOCKQAJQPuVtaGFfEVkTxHKrhW6ZaTo+J8kLk+fJF7SksjJmWArIPbj4EIcqnGTa3
         iVwg==
X-Gm-Message-State: AOAM532PKnvXwAAqLCPp0dVBzcbackcmM94c5Ae/hduKjplV9JFlAsDI
	QZcKXGrjka7IFY05gaO7rkY+INsPgPKB0NrYbYo=
X-Google-Smtp-Source: ABdhPJwyaBgT1p69hjfH/QYDAvNQTYe7qepImg4hyOcGblFswk0F+kvC0zgSd79ql3mK5DOENJ6eShoUUSYy9chu21s=
X-Received: by 2002:a9d:68c2:: with SMTP id i2mr12519006oto.338.1633408808886;
 Mon, 04 Oct 2021 21:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210930145423.17162-1-luca.fancellu@arm.com> <8A9B1FAB-2A24-446D-BAC3-FF505225C2F8@arm.com>
In-Reply-To: <8A9B1FAB-2A24-446D-BAC3-FF505225C2F8@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 4 Oct 2021 21:39:58 -0700
Message-ID: <CACMJ4Gb2t-N+gScgU0YE_VbA0-7n=EZFUbeP7=n2_6hhStwJhQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d3a66105cd939fc2"

--000000000000d3a66105cd939fc2
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 8:03 AM Bertrand Marquis <bertrand.marquis@arm.com>
wrote:

> Hi Luca,
>
> > On 30 Sep 2021, at 15:54, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> >
> > Syntax conversion for bbappend linux-yocto_5.10
> > and linux-yocto-dev inside the raspberrypi
> > dynamic layer.
> >
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>


> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>


> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Tested-by: Christopher Clark <christopher.w.clark@gmail.com>



>
> Thanks a lot for that :-)
>

Agreed! Thanks, Luca!

Christopher



>
> Cheers
> Bertrand
>
> > ---
> > .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 +++---
> > .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 +++---
> > 2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> > index 8381e44..5f43052 100644
> > ---
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> > +++
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> > @@ -1,8 +1,8 @@
> > # For a Xen-enabled distro on the Raspberry Pi, override the contents of
> cmdline.txt
> > # with Xen-on-ARM-specific command line options
> >
> > -KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
> > -KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> > -COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
> > +KBRANCH:raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
> > +KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> > +COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
> >
> > require linux-yocto_xen-rpi.inc
> > diff --git
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > index af92493..f279ef7 100644
> > ---
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > +++
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > @@ -1,6 +1,6 @@
> > # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
> > -KBRANCH_raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
> > -KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> > -COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
> > +KBRANCH:raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
> > +KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> > +COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
> >
> > require linux-yocto_xen-rpi.inc
> > --
> > 2.17.1
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>
> 
>
>

--000000000000d3a66105cd939fc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 8:03 AM Bertr=
and Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com">bertrand.marqui=
s@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Luca,<br>
<br>
&gt; On 30 Sep 2021, at 15:54, Luca Fancellu &lt;<a href=3D"mailto:Luca.Fan=
cellu@arm.com" target=3D"_blank">Luca.Fancellu@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Syntax conversion for bbappend linux-yocto_5.10<br>
&gt; and linux-yocto-dev inside the raspberrypi<br>
&gt; dynamic layer.<br>
&gt;<br>
&gt; Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.c=
om" target=3D"_blank">luca.fancellu@arm.com</a>&gt;<br></blockquote><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com" targe=
t=3D"_blank">diego.sueiro@arm.com</a>&gt;<br></blockquote><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.co=
m" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br></blockquote><div>=
<br></div><div>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:christo=
pher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div>Tes=
ted-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.c=
om">christopher.w.clark@gmail.com</a>&gt;</div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks a lot for that :-)<br></blockquote><div><br></div><div>Agreed! Thank=
s, Luca!</div><div><br></div><div>Christopher</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; ---<br>
&gt; .../recipes-kernel/linux/linux-yocto-dev.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
&gt; .../recipes-kernel/linux/linux-yocto_5.10.bbappend=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 6 +++---<br>
&gt; 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yoc=
to-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yoc=
to-dev.bbappend<br>
&gt; index 8381e44..5f43052 100644<br>
&gt; --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.=
bbappend<br>
&gt; +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.=
bbappend<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt; # For a Xen-enabled distro on the Raspberry Pi, override the contents =
of cmdline.txt<br>
&gt; # with Xen-on-ARM-specific command line options<br>
&gt;<br>
&gt; -KBRANCH_raspberrypi4-64 ?=3D &quot;standard/bcm-2xxx-rpi&quot;<br>
&gt; -KMACHINE_raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
&gt; -COMPATIBLE_MACHINE_raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
&gt; +KBRANCH:raspberrypi4-64 ?=3D &quot;standard/bcm-2xxx-rpi&quot;<br>
&gt; +KMACHINE:raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
&gt; +COMPATIBLE_MACHINE:raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
&gt;<br>
&gt; require linux-yocto_xen-rpi.inc<br>
&gt; diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yoc=
to_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yo=
cto_5.10.bbappend<br>
&gt; index af92493..f279ef7 100644<br>
&gt; --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10=
.bbappend<br>
&gt; +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10=
.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4<br>
&gt; -KBRANCH_raspberrypi4-64 ?=3D &quot;v5.10/standard/bcm-2xxx-rpi&quot;<=
br>
&gt; -KMACHINE_raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
&gt; -COMPATIBLE_MACHINE_raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
&gt; +KBRANCH:raspberrypi4-64 ?=3D &quot;v5.10/standard/bcm-2xxx-rpi&quot;<=
br>
&gt; +KMACHINE:raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
&gt; +COMPATIBLE_MACHINE:raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
&gt;<br>
&gt; require linux-yocto_xen-rpi.inc<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000d3a66105cd939fc2--

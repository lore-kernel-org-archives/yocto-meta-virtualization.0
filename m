Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF453C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:24:17 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.31171.1721687049508531305
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPakcezW;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-66493332ebfso43444067b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721687048; x=1722291848; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8w79qNJp9ZWCE6kwIsbKjb6+/Pr+6uk8CU0VhnOoTgg=;
        b=MPakcezWDE9T5nNcYWNbrFNNaN0HkNueffMrcG5n3wleE8e98u14FcwKSJEeMtIngv
         zzK9OAtuWpJ30X5zBFC+wvTRgvDk/n1wXgiN9Zr00FyAAKBcEKIziILM6yQr3Ses4rk5
         z8TKSK9nUEM3i4qgFgm6ggqsa4Uo4JYj+PgOHN/6FaQlhDhQ1AT69nTBWqM9PPAHU6Mw
         3qQGJXtwOzerpHPSCsCSqgqXmiNcQVsOF9nuIdtjdea2RjsIFZqGQ7gS5xObw7KH/MKO
         jS3rQYTi2w8IFFIN16B6aQmWroPneGD+9qVaf+HiGjrb2qMF+HoQbzW0PPa/XgVgHQR3
         zy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721687048; x=1722291848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8w79qNJp9ZWCE6kwIsbKjb6+/Pr+6uk8CU0VhnOoTgg=;
        b=WdnfY1hk4+8Zizri/TsjzhBnd5Dk00s92V+xvU65DX+qBb9eIl4SwlTpQ9DCyFlRTk
         3eLQT/OXzoavo4R3v/E8Y3MjSbsEcDpzn6xWxk5PeNDTDhX+NtzXbAih1bYrkrl5PY9o
         kLTNvHlHiqaAO6ScBcowDJsqFvqAusJUEEmr6Axl2JDKuPCZNXjxleLMQb0qRCUPmm49
         H44t6dQJUcn02gVPncCufIr5cUkuNfHzHrJxXHYwBjkI6wDSVr0Xgcr/r7UR3s4ZPWnv
         t5lavR1Bbos0PLceRAqe6WgMOFPZ6Xjd/tI0lJJ1u1sHGEiF9JsZcn+zvYcTdI+Q+HWc
         eadQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLT68YIL2LRUraakUjt35QDb83MInTqvlvIc0xyo5qyZQGf+3hiSGkDNennzqwriuxjGFDDQeI1axJnQzSjOWBD1LZvgDz1Oug5+ZOfDgt7fXPxxT7e+BPNy8=
X-Gm-Message-State: AOJu0YxLPLl9rhy5l/C8OmLRmswRXbGZn1eaXER+WWzktu4Lyom0SRQo
	dAfJn+wqIPY8XVEkrMMdFvYE+z6rzh8m9kFwS03AtpgwXAOU3CHFOYTFwzk9WTUIdAGluq5aujR
	sG7G/oAGiNqmXqxNXgOsGhD0pEq8=
X-Google-Smtp-Source: AGHT+IEbzt6zeNNu2zL7OqhJ0wBPjP6AIs6KCNsg0TWyGrtPnbk4qw4Z3gYVGMpmEr4NngADJ7qQmjtFneUvD6MYqgE=
X-Received: by 2002:a05:690c:4343:b0:64b:3246:cc24 with SMTP id
 00721157ae682-66a6a515d70mr93336127b3.29.1721687048545; Mon, 22 Jul 2024
 15:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240721061254.3674810-2-tim.orling@konsulko.com> <Zp7aZ7XA6Hly1evR@gmail.com>
In-Reply-To: <Zp7aZ7XA6Hly1evR@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 22 Jul 2024 15:23:56 -0700
Message-ID: <CANx9H-C0hwkqnpe9oVrrZ5wpd5J9Np87CZ5YvY=9bSwB3BBYGg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR ->
 UNPACKDIR transition
To: bruce.ashfield@gmail.com
Cc: tim.orling@konsulko.com, meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f16d88061ddd80ec"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8841

--000000000000f16d88061ddd80ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 3:17=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
> merged to mater-next
>
> I finally finished a week long battle with ceph, so I expect
> to get master-next -> master this week.
>

I finally got my yp-dev-day_virtualization CI up and sort of running again
(which is how I caught this):
https://gitlab.com/moto-timo/yp-dev-day_virtualization/-/pipelines

Onward and upwards!


>
> Bruce
>
> In message: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR ->
> UNPACKDIR transition
> on 20/07/2024 Tim Orling via lists.yoctoproject.org wrote:
>
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > Borrowed from Leon Anavi <leon.anavi@konsulko.com>
> > meta-raspberrypi: commit 434ed33c90b7659152b1e8d7c2d4d785db85105f
> >
> > and from Martin Jansa <martin.jansa@gmail.com>
> > meta-raspberrypi: commit c39c2b165e68388767f54dc86acf4595a33ee1e1
> >
> > This adapts to the oe-core rework to enforce a separate directory
> > for unpacking local sources (UNPACKDIR) instead of directly using
> > WORKDIR.
> >
> > Follows the preliminary guideline from:
> > https://lists.openembedded.org/g/openembedded-architecture/message/2007
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb     | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/
> xen-rpi-u-boot-scr.bb
> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/
> xen-rpi-u-boot-scr.bb
> > index 87619d01..3f83c7f8 100644
> > --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/
> xen-rpi-u-boot-scr.bb
> > +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/
> xen-rpi-u-boot-scr.bb
> > @@ -17,13 +17,16 @@ do_compile() {
> >          -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
> >          -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
> >          -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
> > -        "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
> > +        "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
> >
> >      mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d
> "${WORKDIR}/boot.cmd" boot.scr
> >  }
> >
> >  inherit kernel-arch deploy nopackages
> >
> > +S =3D "${WORKDIR}/sources"
> > +UNPACKDIR =3D "${S}"
> > +
> >  do_deploy() {
> >      install -d ${DEPLOYDIR}
> >      install -m 0644 boot.scr ${DEPLOYDIR}
> > --
> > 2.45.2
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8838):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8838
> Mute This Topic: https://lists.yoctoproject.org/mt/107463785/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f16d88061ddd80ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 3:17=E2=80=AF=
PM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">lists.yocto=
project.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoct=
oproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
merged to mater-next<br>
<br>
I finally finished a week long battle with ceph, so I expect<br>
to get master-next -&gt; master this week.<br></blockquote><div><br></div><=
div>I finally got my yp-dev-day_virtualization CI up and sort of running ag=
ain (which is how I caught this):</div><div><a href=3D"https://gitlab.com/m=
oto-timo/yp-dev-day_virtualization/-/pipelines">https://gitlab.com/moto-tim=
o/yp-dev-day_virtualization/-/pipelines</a></div><div><br></div><div>Onward=
 and upwards!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR -&gt; =
UNPACKDIR transition<br>
on 20/07/2024 Tim Orling via <a href=3D"http://lists.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; <br>
&gt; Borrowed from Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com=
" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; meta-raspberrypi: commit 434ed33c90b7659152b1e8d7c2d4d785db85105f<br>
&gt; <br>
&gt; and from Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; meta-raspberrypi: commit c39c2b165e68388767f54dc86acf4595a33ee1e1<br>
&gt; <br>
&gt; This adapts to the oe-core rework to enforce a separate directory<br>
&gt; for unpacking local sources (UNPACKDIR) instead of directly using<br>
&gt; WORKDIR.<br>
&gt; <br>
&gt; Follows the preliminary guideline from:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-architecture/=
message/2007" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-architecture/message/2007</a><br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-bsp/xen-rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-b=
oot-scr.bb" rel=3D"noreferrer" target=3D"_blank">xen-rpi-u-boot-scr.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr=
/<a href=3D"http://xen-rpi-u-boot-scr.bb" rel=3D"noreferrer" target=3D"_bla=
nk">xen-rpi-u-boot-scr.bb</a> b/dynamic-layers/raspberrypi/recipes-bsp/xen-=
rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-boot-scr.bb" rel=3D"noreferrer" =
target=3D"_blank">xen-rpi-u-boot-scr.bb</a><br>
&gt; index 87619d01..3f83c7f8 100644<br>
&gt; --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/<a hre=
f=3D"http://xen-rpi-u-boot-scr.bb" rel=3D"noreferrer" target=3D"_blank">xen=
-rpi-u-boot-scr.bb</a><br>
&gt; +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/<a hre=
f=3D"http://xen-rpi-u-boot-scr.bb" rel=3D"noreferrer" target=3D"_blank">xen=
-rpi-u-boot-scr.bb</a><br>
&gt; @@ -17,13 +17,16 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@KERNEL_BOOTCMD@@/${KERNE=
L_BOOTCMD}/&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@RPI_DOM0_MEM@@/${RPI_DOM=
0_MEM}/&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@RPI_DEBUG_XEN_ARGS@@/${R=
PI_DEBUG_XEN_ARGS}/&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${WORKDIR}/<a href=3D"http://boot.c=
md.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>&quot; &=
gt; &quot;${WORKDIR}/boot.cmd&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${UNPACKDIR}/<a href=3D"http://boot=
.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>&quot;=
 &gt; &quot;${WORKDIR}/boot.cmd&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkimage -A ${UBOOT_ARCH} -T script -C none -n &quo=
t;Boot script&quot; -d &quot;${WORKDIR}/boot.cmd&quot; boot.scr<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit kernel-arch deploy nopackages<br>
&gt;=C2=A0 <br>
&gt; +S =3D &quot;${WORKDIR}/sources&quot;<br>
&gt; +UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 boot.scr ${DEPLOYDIR}<br>
&gt; -- <br>
&gt; 2.45.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8838): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8838" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8838</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/107463785/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/107463785/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f16d88061ddd80ec--


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1144EE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 18:35:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.22194.1733337343642599800
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 10:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQRU0+aq;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215348d1977so321135ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733337343; x=1733942143; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8UmOvicjazSdS23v1A8EZchurZgqyLwWlrSae90Ex8=;
        b=dQRU0+aqx0HychXwlOD9Djwj6EAUJCdohReiLALKh8zKouwzjJW0V6mMdNVVaoFMjJ
         +2I9/mwayyW0qZA1PwWrpCYJG+1KelMaqnhtSUu2qW3eBpn+DqXoF98HSzkliOZtYVNx
         meKRcq67lkSA4tg+C1wQu/gIku74WPY4I5WMSHyPS/jXV5IXYFrtxmXpJGdn/LKUcFpf
         AK+GEn7WXFPAqN2DMCqerZBhdNUnefWzOvUxohkmu2t1/5uL2hF27CipMnDs8WK+t26C
         zTipc+sZFrT5N94Wdn3NNZG/iqLziEi1QeYYnuuIdG+jamSPm0YfW4NLg5Sm3rljiXZe
         a/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733337343; x=1733942143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8UmOvicjazSdS23v1A8EZchurZgqyLwWlrSae90Ex8=;
        b=bjZDvkmg4J2bwZVnC0XyZIkzJPZdUWeF8ZSo4P20CpzHc9by0ikL557VFlVwgfxUSI
         8hgIRpJxKeuvHlvzRFoup00dF9So04HRsapQZ+6EEvlSCE9lsAFirjNfVH7Ry7+BRi0l
         qyfmuq4PQZfCB4O62doB8wJaqvDcyVUZBS9T2KOX9paMCjIgTdl4Go4dwKgHgpgna+yx
         ENTd8XSbMWSoqei1dIrBvFd3q1pFw4Nlrd0Kfr/gSjrQ5CsAwj+WtivqA7qjrzhYurdp
         Qd7vRU2D0v9Niq6AYU4fkignoLmE1j7xn9t9v4BClm4nWd7jSOf6+QLzqRRhj+AKolvd
         /sVQ==
X-Gm-Message-State: AOJu0YwBrpBfBgwPbfOINpEwD2EH8CpzkebvMLCnt8iELqT387CWFWUZ
	3D9fr7sEazdc+UCrUGckOhrVH/xxSpDwJaRxMejHjSBf0MuUfhqnDN/9t5jNkX8OWIIsORsPcCR
	E42sa3mgXB2iITaYFgHzDC+fWKjw=
X-Gm-Gg: ASbGncsqJw4ciKIyhy818rXdtGpeCTJnI2uelrojzqpwQ6sg1iaF04qwGyer/BszY9F
	lFcPzsAtaHr6qrL5rTU3H7Ey1cOcMiX10
X-Google-Smtp-Source: AGHT+IHN3hRZmL+JyTtVu+Wv9/PGYjw0FwQtNzkk4OlN3kBdBXqyZiGKDg7o9WC4EUDDhFinByWiyOMgLYlxSOakcqQ=
X-Received: by 2002:a17:902:e5d1:b0:215:5ea2:6543 with SMTP id
 d9443c01a7336-215bd10fec1mr97883575ad.28.1733337342850; Wed, 04 Dec 2024
 10:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com> <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com>
In-Reply-To: <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Dec 2024 13:35:30 -0500
Message-ID: <CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com>
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6]
 Add bbclass for xen launch config variables
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000098bf4d0628760cee"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 18:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9039

--00000000000098bf4d0628760cee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 1:07=E2=80=AFPM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> Hi Bruce, Chris,
>
> Do you have any more comments on patches? If there are no comments can
> we get this patches merged?
>

I haven't reviewed them yet and probably won't until next week.

Generally speaking it isn't wise to attempt to rush a merge, in particular
when it has been 5 days with an extended weekend in the middle.

Cheers,

Bruce


>
> Thanks,
>
> Sandeep
>
> On 11/29/2024 3:29 PM, Sandeep Gundlupet Raju via lists.yoctoproject.org
> wrote:
> > Changes in v4:
> >     - Fix xen-boot-env.inc by inheriting xen-lauch-config bbclass
> >
> > Changes in v3:
> >     - Rename xen-u-boot-scr-configuration.bbclass to
> xen-launch-config.bbclass
> >       as suggested by Christopher Clark as this is not u-boot specific.
> >
> > Changes in V2:
> >     - Rename xen-u-boot-scr.bbclass to
> xen-u-boot-scr-configuration.bbclass
> >     - Add comment in u-boot-xlnx-scr.bbappend to specify where BOOTMODE
> >       variable is defined.
> >
> > 1. Add xen-lauch-config.bbclass for generic xen launch config
> >     variables use by any soc devices.
> > 2. Inherit xen-launch-config.bbclass in xen-rpi-u-boot-scr.
> > 3. Move xen variables to xen-boot-env.inc file in xilinx
> >     dynamic layers.
> > 4. Include xen-boot-env if BOOTMODE =3D "xen" switch is enabled.
> > 5. Add load address to boot.cmd.xen script echo messages.
> > 6. Inherit xen-launch-config bbclass in xen-boot-env.inc.
> > 7. If user brings in their own boot.cmd.xxx file they can just
> >     inherit xen-launch-config bbclass and use the generic
> >     xen boot script variables.
> >
> > Sandeep Gundlupet Raju (6):
> >    xen-launch-config: Add bbclass for xen launch config variables
> >    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
> >    xen-boot-env: Move xen variables to inc file
> >    u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
> >    boot.cmd.xen: Add load address to echo messages
> >    xen-boot-env.inc: Inherit xen-launch-config bbclass
> >
> >   classes-recipe/xen-launch-config.bbclass      | 43 ++++++++++++++++++=
+
> >   .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
> >   .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
> >   .../u-boot/u-boot-xlnx-scr.bbappend           | 13 +++++-
> >   .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
> >   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
> >   .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
> >   7 files changed, 103 insertions(+), 50 deletions(-)
> >   create mode 100644 classes-recipe/xen-launch-config.bbclass
> >   create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9026):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9026
> > Mute This Topic: https://lists.yoctoproject.org/mt/109841154/8188369
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [santraju@amd.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000098bf4d0628760cee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Dec 4, 2024 at 1:07=E2=80=AFPM Gundlupet Ra=
ju, Sandeep &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com">sandeep.g=
undlupet-raju@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Bruce, Chris,<br>
<br>
Do you have any more comments on patches? If there are no comments can <br>
we get this patches merged?<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I haven&#39;t reviewed them ye=
t and probably won&#39;t until next week.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Generally speaking it isn&#39;t wise to attempt to rush a =
merge, in particular when it has been 5 days with an extended weekend in th=
e middle.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Sandeep<br>
<br>
On 11/29/2024 3:29 PM, Sandeep Gundlupet Raju via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> <br>
wrote:<br>
&gt; Changes in v4:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Fix xen-boot-env.inc by inheriting xen-lauch-conf=
ig bbclass<br>
&gt;<br>
&gt; Changes in v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Rename xen-u-boot-scr-configuration.bbclass to xe=
n-launch-config.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0as suggested by Christopher Clark as this is=
 not u-boot specific.<br>
&gt;<br>
&gt; Changes in V2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Rename xen-u-boot-scr.bbclass to xen-u-boot-scr-c=
onfiguration.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Add comment in u-boot-xlnx-scr.bbappend to specif=
y where BOOTMODE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0variable is defined.<br>
&gt;<br>
&gt; 1. Add xen-lauch-config.bbclass for generic xen launch config<br>
&gt;=C2=A0 =C2=A0 =C2=A0variables use by any soc devices.<br>
&gt; 2. Inherit xen-launch-config.bbclass in xen-rpi-u-boot-scr.<br>
&gt; 3. Move xen variables to xen-boot-env.inc file in xilinx<br>
&gt;=C2=A0 =C2=A0 =C2=A0dynamic layers.<br>
&gt; 4. Include xen-boot-env if BOOTMODE =3D &quot;xen&quot; switch is enab=
led.<br>
&gt; 5. Add load address to boot.cmd.xen script echo messages.<br>
&gt; 6. Inherit xen-launch-config bbclass in xen-boot-env.inc.<br>
&gt; 7. If user brings in their own boot.cmd.xxx file they can just<br>
&gt;=C2=A0 =C2=A0 =C2=A0inherit xen-launch-config bbclass and use the gener=
ic<br>
&gt;=C2=A0 =C2=A0 =C2=A0xen boot script variables.<br>
&gt;<br>
&gt; Sandeep Gundlupet Raju (6):<br>
&gt;=C2=A0 =C2=A0 xen-launch-config: Add bbclass for xen launch config vari=
ables<br>
&gt;=C2=A0 =C2=A0 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass<br>
&gt;=C2=A0 =C2=A0 xen-boot-env: Move xen variables to inc file<br>
&gt;=C2=A0 =C2=A0 u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen<=
br>
&gt;=C2=A0 =C2=A0 boot.cmd.xen: Add load address to echo messages<br>
&gt;=C2=A0 =C2=A0 xen-boot-env.inc: Inherit xen-launch-config bbclass<br>
&gt;<br>
&gt;=C2=A0 =C2=A0classes-recipe/xen-launch-config.bbclass=C2=A0 =C2=A0 =C2=
=A0 | 43 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../xen-rpi-u-boot-scr/files/<a href=3D"http://boot.cmd.xe=
n.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0 | 10 +=
+---<br>
&gt;=C2=A0 =C2=A0.../xen-rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-boot-sc=
r.bb" rel=3D"noreferrer" target=3D"_blank">xen-rpi-u-boot-scr.bb</a>=C2=A0 =
| 13 +++---<br>
&gt;=C2=A0 =C2=A0.../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 13 +++++-<br>
&gt;=C2=A0 =C2=A0.../u-boot/u-boot-xlnx-scr/boot.cmd.xen=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++--<br>
&gt;=C2=A0 =C2=A0.../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 35 ---------------<br>
&gt;=C2=A0 =C2=A0.../recipes-bsp/u-boot/xen-boot-env.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 31 +++++++++++++<br>
&gt;=C2=A0 =C2=A07 files changed, 103 insertions(+), 50 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 classes-recipe/xen-launch-config.bbclas=
s<br>
&gt;=C2=A0 =C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boo=
t/xen-boot-env.inc<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9026): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9026" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9026</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10984115=
4/8188369" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/109841154/8188369</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:santraju@amd.com"=
 target=3D"_blank">santraju@amd.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000098bf4d0628760cee--


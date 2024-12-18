Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAFAE77184
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 00:06:31 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.95154.1734480386902155728
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 16:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JVBD9f9y;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-540201cfedbso5880923e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Dec 2024 16:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480385; x=1735085185; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J0zkLkIig/pR7lFN7ttIuDp1KZ1tHLwKyOxLclr9LoQ=;
        b=JVBD9f9y33Is763Ie74uPIz/DPwhP9/irUr5B2fcOwkwDP3rieqR7nF0Vm8QOyRLN4
         x+janA7a4tqiBPLP0dXKR9+tKOeUY9N+Kf+2+Fm+mlDMgb+WFJcAjCjyIBGqKSdxj9wW
         KT7xij6wGIk+vPLTqatV/9xds9ivpztlUPBqvTMj1iw2AYH0UWvuZ/qRgBqe3kMJI6r2
         3qQjC/HyJ1Q0cODrKVN/htM9qn2kA4h7OFYBsX3ANWfLFroflYmb2bjTukTf456JXRSt
         qlaQ8b4Jca/4A6ExxxzWn5Edz9AhmN2mQVCAm8vI7NsRNcThf542chJ9LHZk5XdDNiIX
         oFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480385; x=1735085185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0zkLkIig/pR7lFN7ttIuDp1KZ1tHLwKyOxLclr9LoQ=;
        b=W/gvK3mLJkRscJqptNj+Pq+iIBGYeFC4qQNDXuQOylLTssszNZZT/ncSJWRGXkt/ju
         Dn0rH2um/2C0NbnVT3Jguq9bdsMQEBVR5NmXhY4ZeqCuJ5kQJlMArLZEXVtL8Aoub2/j
         chNQteDgzCEdNaJW4W4mxgE+O3igDacTUFMSVhmWe5a/AH43s2XeN4sM5UnHuIiuXOXv
         39FkXFO4GYdxWztzqOcfeLzJlLbCKZwDkN7HytTHLePZqeCCDlkaBPy/XoR+t7ctcCF1
         6Rmz4jCW1lEUt/taumbzcxgmzL6XcR/kJOXJGmb82ClEEFS3VZ7IWqskBPGBdJoI3RH2
         WF9Q==
X-Gm-Message-State: AOJu0YynJRWRbntMO3uO5uuSsn4iuSXs6kP5ftUalyGlPb7WP0ilJztC
	/RX154u649uN68FUZpXX6maPOB85JALyaJ848UkiAYgQmkAW25ABfgF/6X7dfVH/m+MdjB+xCSm
	NiLZpSjzFVwUn5Y+JK/N4aa6UKTE=
X-Gm-Gg: ASbGncuLb81PhxxhTpO/SLDlPtmXdQgT4FNtqlCRN74Six7dqD7rsXSug233KEWd8iu
	NC8pAYrolOIBFC2JVbywG6dkgq8VzsXI18yO/6A==
X-Google-Smtp-Source: AGHT+IGixgTEU6SRH1Dtz7GewTpFWPXGHbuFjQ3IhpNi06svLyMYB4qWQxxq32yttGtdISdQdS4LOGGEWoQBspmjIaU=
X-Received: by 2002:a05:6512:ba4:b0:540:3530:5a63 with SMTP id
 2adb3069b0e04-541e673bea9mr259853e87.5.1734480384501; Tue, 17 Dec 2024
 16:06:24 -0800 (PST)
MIME-Version: 1.0
References: <180F89FA56BC204A.19074@lists.yoctoproject.org> <29aae416-4352-4fc9-ad55-32f76f69a555@amd.com>
In-Reply-To: <29aae416-4352-4fc9-ad55-32f76f69a555@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 18 Dec 2024 00:06:13 +0000
Message-ID: <CACMJ4GZGjm0MA1ewwB_1OeU2XJ6LBzduKUF6wSQ13HHSuiOSOA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 0/5] Add bbclass
 for xen launch config variables
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000030333c0629802f42"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Dec 2024 00:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9060

--00000000000030333c0629802f42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 5:53=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Hi Bruce, Chris,
>
> Any more comments on patches?


Sorry I haven=E2=80=99t had chance to look at this series again yet - am ai=
ming to
get to it before New Year. Thanks for iterating on the last feedback.

Christopher


>
> Thanks,
> Sandeep
>
> On 12/9/2024 7:54 AM, Sandeep Gundlupet Raju via lists.yoctoproject.org
> wrote:
> > Changes in v5:
> >     - Merge below 2 patches into single patch.
> >         - xen-boot-env: Move xen variables to inc file
> >         - u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
> >
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
> > Sandeep Gundlupet Raju (5):
> >    xen-launch-config: Add bbclass for xen launch config variables
> >    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
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
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9059):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9059
> Mute This Topic: https://lists.yoctoproject.org/mt/110006797/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000030333c0629802f42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 17, 2024 at 5:53=E2=80=AFPM Sandeep Gundlupet R=
aju via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@lists.yoctoproject=
.org">amd.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)">Hi Bruce, Chris,<br>
<br>
Any more comments on patches?</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Sorry I haven=E2=80=99t had chance to look at this series agai=
n yet - am aiming to get to it before New Year. Thanks for iterating on the=
 last feedback.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Christop=
her</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Thanks,<br>
Sandeep<br>
<br>
On 12/9/2024 7:54 AM, Sandeep Gundlupet Raju via <a href=3D"http://lists.yo=
ctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org=
</a> <br>
wrote:<br>
&gt; Changes in v5:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Merge below 2 patches into single patch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- xen-boot-env: Move xen variables to=
 inc file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- u-boot-xlnx-scr: Include xen-boot-e=
nv if BOOTMODE is xen<br>
&gt;<br>
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
&gt; Sandeep Gundlupet Raju (5):<br>
&gt;=C2=A0 =C2=A0 xen-launch-config: Add bbclass for xen launch config vari=
ables<br>
&gt;=C2=A0 =C2=A0 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass<br>
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
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9059): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9059" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9059</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110006797/361=
9037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110006797/3619037</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark@gm=
ail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000030333c0629802f42--


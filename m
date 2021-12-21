Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6CCC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 03:33:55 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.1746.1640057634680261511
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 19:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/C8JuB8;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id n7so21258579uaq.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 19:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tz0rr8LvNMify589K9hcoAaYxApsN5QTxJr+jX1zFKI=;
        b=Q/C8JuB8hdd203v8BHyGVgh/nPiKecYQmBoDOrx10WFHoy4lr0+nbXNb1ENWA365GP
         7k7m1iLKvw5cxia0AefTOLExnd8Xxn6/al45N14T5GnUiZr8qawl/H70B3vfIg63x7Ij
         wys9yd1wGy6x85qDh/6TdQY0skDpSeaFCWP1HtACc6Hw1ovVrAMZ7bqSBZsyGkUHlMnr
         rAkyVAFGzAV9cbmQpy/Trr4KKdc/Pk7ZHeTf8zB5dSFnIOgz7nAxUdx0NMhrogy4eOf6
         y451Y7chcEqM0wCoB/rdQybybDTIGxN3RztA9RmfLjXdwGB9tCq3o7yw7aEqyT9Ojvmz
         x5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tz0rr8LvNMify589K9hcoAaYxApsN5QTxJr+jX1zFKI=;
        b=knQMPinMX3K15Xgvmkd2yckDMrDaPRgANJyVxWDVsDrZ9sNDZdYqAHLwTDp+uhziYo
         liyXuViabX+LEXA3Nb6iJBTKjb93kecWs3Xhtfxam0F6smHs2ZnZVwaDvi48YPbKIAXE
         4ZprZrm7voSRaLNehoGzBrh8lB4bJ3GSpAefK4jn0v6oIuhrRYXSlvWhAR9wgsHy+Xq7
         b243bMzHMkORLhdxKzJ2+Iv1yyMDKTjRt/G4MNgYczk3zWDRh2syCLUl9oHJwUWg8gAw
         WJTU9hlXXn27ZdUVd8X9a3QbRnzkWNQGIyvXZzB/yzasRNddKR9a9VMYFGLagt+IXi25
         gLmA==
X-Gm-Message-State: AOAM530c0qHvppEQdA16qF1TnNusvmhbJl1lTWKOxWBZZyFhIkoEcnL0
	hPvMGt+erXU6nUe//DfD7mbUbXd0w6FsiqegMRs=
X-Google-Smtp-Source: 
 ABdhPJx3nPRKK79EoT0ZmRsfqfXrUqSIpAN8lrhkN80Ste09BGH9TC1TXjmLt4k/buKMSDB/Bp4zD/iFFY9fENb8Jfo=
X-Received: by 2002:a67:2e09:: with SMTP id u9mr406372vsu.77.1640057633743;
 Mon, 20 Dec 2021 19:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
 <CADkTA4MD816MbZi3=BmZQSwG6NMq2=zsFoPvsc0E180UCjBuWg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MD816MbZi3=BmZQSwG6NMq2=zsFoPvsc0E180UCjBuWg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 20 Dec 2021 19:33:42 -0800
Message-ID: 
 <CACMJ4Gaa=CeYUwSLmZcgH00xDnUbfyuAw_OPcnEEBkMo-+QQ7A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen-tools: Load xen related
 kernel modules during system boot
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Kamil Dziezyk <kamil.dziezyk@arm.com>,
 meta-virtualization@lists.yoctoproject.org,
	nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000aba6c705d39fac07"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Dec 2021 03:33:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6983

--000000000000aba6c705d39fac07
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 13, 2021 at 12:42 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> v2 looks good to me, but I'd like to get an Ack from Christopher before
> merging.
>

Ack, this looks good - thanks for making the change, Kamil.

Christopher


>
> Bruce
>
> On Thu, Dec 9, 2021 at 8:58 AM Kamil Dziezyk <kamil.dziezyk@arm.com>
> wrote:
> >
> > This patch changes the location of xen.conf file, that contains list of
> kernel
> > modules to be loaded during system boot, to "${nonarch_libdir}".
> >
> > Previous path based on "${systemd_unitdir}" was not considered by
> default by
> > systemd-modules-load.service.
> >
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> > ---
> >  recipes-extended/xen/xen-tools.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > index d831941..17ef0f7 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
> >      "
> >
> >  FILES:${PN}-xencommons += "\
> > +    ${nonarch_libdir}/modules-load.d/xen.conf \
> >      ${sysconfdir}/default/xencommons \
> >      ${sysconfdir}/init.d/xencommons \
> >      ${sysconfdir}/xen/scripts/launch-xenstore \
> > -    ${systemd_unitdir}/modules-load.d/xen.conf \
> >      ${systemd_unitdir}/system/proc-xen.mount \
> >      ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
> >      ${systemd_unitdir}/system/xenconsoled.service \
> > @@ -744,7 +744,7 @@ SYSTEMD_SERVICE:${PN}-xendomains =
> "xendomains.service"
> >
> >  EXTRA_OECONF += " \
> >      --with-systemd=${systemd_unitdir}/system \
> > -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> > +    --with-systemd-modules-load=${nonarch_libdir}/modules-load.d \
> >      --with-initddir=${INIT_D_DIR} \
> >      --with-sysconfig-leaf-dir=default \
> >      --with-system-qemu=${bindir}/qemu-system-i386 \
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#6972):
> https://lists.yoctoproject.org/g/meta-virtualization/message/6972
> > Mute This Topic: https://lists.yoctoproject.org/mt/87611978/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000aba6c705d39fac07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 13, 2021 at 12:42 PM Bruce As=
hfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">v2 looks good to me, but I&#39;d like to g=
et an Ack from Christopher before merging.<br></blockquote><div><br></div><=
div>Ack, this looks good - thanks for making the change, Kamil.</div><div><=
br></div><div>Christopher</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Bruce<br>
<br>
On Thu, Dec 9, 2021 at 8:58 AM Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dz=
iezyk@arm.com" target=3D"_blank">kamil.dziezyk@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch changes the location of xen.conf file, that contains list o=
f kernel<br>
&gt; modules to be loaded during system boot, to &quot;${nonarch_libdir}&qu=
ot;.<br>
&gt;<br>
&gt; Previous path based on &quot;${systemd_unitdir}&quot; was not consider=
ed by default by<br>
&gt; systemd-modules-load.service.<br>
&gt;<br>
&gt; Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.c=
om" target=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/xen/xen-tools.inc | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-tools.inc<br>
&gt; index d831941..17ef0f7 100644<br>
&gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN}-xencommons +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/default/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.d/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/xen/scripts/launch-xenstore \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/proc-xen.mount \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/xen-qemu-dom0-disk-backe=
nd.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/xenconsoled.service \<br=
>
&gt; @@ -744,7 +744,7 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D &quot;xendoma=
ins.service&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-systemd=3D${systemd_unitdir}/system \<br>
&gt; -=C2=A0 =C2=A0 --with-systemd-modules-load=3D${systemd_unitdir}/module=
s-load.d \<br>
&gt; +=C2=A0 =C2=A0 --with-systemd-modules-load=3D${nonarch_libdir}/modules=
-load.d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-initddir=3D${INIT_D_DIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-sysconfig-leaf-dir=3Ddefault \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-system-qemu=3D${bindir}/qemu-system-i386 \<=
br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#6972): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/6972" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/6972</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87611978=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/87611978/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000aba6c705d39fac07--


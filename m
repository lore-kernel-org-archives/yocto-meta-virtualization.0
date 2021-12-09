Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.6293.1639016657786070365
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 18:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdhUi+11;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso4779745otr.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Dec 2021 18:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/UMqhcOjfkFOQv9srUWKYCytRf5reEFCqcb92m0c44=;
        b=SdhUi+11Ik3h8Nob+QEINAdtL/SikLUmsSNtQ2XGatB2y/qCyFYM2dAjr22mgnZvz0
         mQNTgeGi2VPOJlEQa5/hx1IWNDJakjmQQ3s5fyir0pmUqn9Ns0k54+rKbMCl1h8x/b2m
         uR/o9DLrFDaRy7xupDSGakbYL4KRi8hsEyvFMwSETggE0J6H7Lv/coJssYqLoZFgeeOY
         v/xbsN+/fhYhXrVyHy4GnzE/wNjY6ErutYO/jNzSH4FCZeFq0cISvNf8CxOpCoNYeHnQ
         3x4Fao8Orl/Y3k4kGeEo2yd8C09NEZp8h0MAGKwz38/A13mzyOgN79/nCazIwTHnzJmR
         WGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/UMqhcOjfkFOQv9srUWKYCytRf5reEFCqcb92m0c44=;
        b=qCJkSU4OuB3g9+AXFjc/tNme03AncgBQNwRHKvMEVSpokqvB8At4CeoZRFiSFtYRaV
         txvHXYZEQaPD7qllQho7OwAPZbESxhyQrIXTXLQpj4K0xUJ6aoResuPuowwmBg2Zxtwd
         RbSYhnS2it0ADNyfICY4tdOtT5FZq7Lp3VKhpqmTkw5KvTQJG0kgp65ZaJ8X4712eL6u
         X7/Z3RkQqFK8DvPBY5c6BnKVepIOQyC4AfT5vIDxAIWem4ZSo+RbNmUXUlImyYymyO5S
         S4LGv/E2aO4nHZf9BvrkJXWc96tnponXEAVCXpAeiBOLy8O35N25DCENfwxnKgefZ+wK
         Hq7A==
X-Gm-Message-State: AOAM533M7iWi4PgNN0j8CVebtDGbmlRrDqcfRaA9dmxOLLxIgbfg23ax
	fPqDKAD3OZomyyIVQlB8IM0XWiGDWnTa9tfHOfo=
X-Google-Smtp-Source: ABdhPJyTryGmGIQSI5xf/rARw+eZzrqr1xlHCJU+K6edvv0X7opLJPzM0POaynF6058Pc3GOo42h00VN7JRcnZ4sn+8=
X-Received: by 2002:a05:6830:2431:: with SMTP id k17mr3118430ots.220.1639016657151;
 Wed, 08 Dec 2021 18:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20211208104458.28009-1-kamil.dziezyk@arm.com> <5968C1C2-BF9B-4EC5-AAA9-DCB01155EE3F@arm.com>
In-Reply-To: <5968C1C2-BF9B-4EC5-AAA9-DCB01155EE3F@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 8 Dec 2021 18:24:06 -0800
Message-ID: <CACMJ4GbUAUH2isseP_nUX8MEW3TVqRRQiS-J-6AMFpsVHLgPMA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen-tools: Load xen related kernel modules during system boot
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a16c9805d2ad4d37"

--000000000000a16c9805d2ad4d37
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 5:10 AM Bertrand Marquis <bertrand.marquis@arm.com>
wrote:

> Hi Kamil,
>
> > On 8 Dec 2021, at 10:44, Kamil Dziezyk via lists.yoctoproject.org
> <kamil.dziezyk=arm.com@lists.yoctoproject.org> wrote:
> >
> > This patch changes the location of xen.conf file, that contains list of
> kernel
> > modules to be loaded during system boot, to "${nonarch_libdir}". This is
> done
> > by removing '--with-systemd-modules-load=' flag from EXTRA_OECONF
> variable.
> >
> > Previous path based on "${systemd_unitdir}" was not considered by
> default by
> > systemd-modules-load.service.
>

ok, it does look like there's a fix that should be made here, thanks. It
took a bit of following to see what's involved, so:

There are two recipes in meta-openembedded that do use ${nonarch_libdir}
for this, but the systemd package itself doesn't: the recipe
has ${exec_prefix}/lib/modules-load.d instead, and there's a systemd patch
that applies ${exec_prefix}/lib/modules-load.d too; but then in oe-core,
bitbake.conf defines: nonarch_libdir = "${exec_prefix}/lib"
so the end result should work in the default configuration.

Khem: should the OE Core systemd recipe and patch be using
${nonarch_libdir} too? Or should the recipes that package modules.d config
files place them via ${exec_prefix}/lib ?

thanks

Christopher



> >
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Cheers
> Bertrand
>
> > ---
> > recipes-extended/xen/xen-tools.inc | 3 +--
> > 1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > index d831941..6b99040 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
> >     "
> >
> > FILES:${PN}-xencommons += "\
> > +    ${nonarch_libdir}/modules-load.d/xen.conf \
> >     ${sysconfdir}/default/xencommons \
> >     ${sysconfdir}/init.d/xencommons \
> >     ${sysconfdir}/xen/scripts/launch-xenstore \
> > -    ${systemd_unitdir}/modules-load.d/xen.conf \
> >     ${systemd_unitdir}/system/proc-xen.mount \
> >     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
> >     ${systemd_unitdir}/system/xenconsoled.service \
> > @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =
> "xendomains.service"
> >
> > EXTRA_OECONF += " \
> >     --with-systemd=${systemd_unitdir}/system \
> > -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> >     --with-initddir=${INIT_D_DIR} \
> >     --with-sysconfig-leaf-dir=default \
> >     --with-system-qemu=${bindir}/qemu-system-i386 \
> > --
> > 2.17.1
> >
> >
> >
> >
>
>
> 
>
>

--000000000000a16c9805d2ad4d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 8, 2021 at 5:10 AM Bertrand M=
arquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com">bertrand.marquis@arm=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Kamil,<br>
<br>
&gt; On 8 Dec 2021, at 10:44, Kamil Dziezyk via <a href=3D"http://lists.yoc=
toproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org<=
/a> &lt;kamil.dziezyk=3D<a href=3D"mailto:arm.com@lists.yoctoproject.org" t=
arget=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; This patch changes the location of xen.conf file, that contains list o=
f kernel<br>
&gt; modules to be loaded during system boot, to &quot;${nonarch_libdir}&qu=
ot;. This is done<br>
&gt; by removing &#39;--with-systemd-modules-load=3D&#39; flag from EXTRA_O=
ECONF variable.<br>
&gt; <br>
&gt; Previous path based on &quot;${systemd_unitdir}&quot; was not consider=
ed by default by<br>
&gt; systemd-modules-load.service.<br></blockquote><div><br></div><div>ok, =
it does look like there&#39;s a fix that should be made here, thanks. It to=
ok a bit of following to see what&#39;s involved, so:</div><div><br></div><=
div>There are two recipes in meta-openembedded that do use ${nonarch_libdir=
} for this, but the systemd package itself doesn&#39;t: the recipe has=C2=
=A0${exec_prefix}/lib/modules-load.d instead, and there&#39;s a systemd pat=
ch that applies=C2=A0${exec_prefix}/lib/modules-load.d too; but then in oe-=
core, bitbake.conf defines: nonarch_libdir =3D &quot;${exec_prefix}/lib&quo=
t;</div><div>so the end result should work in the default configuration.</d=
iv><div><br></div><div>Khem: should the OE Core systemd recipe and patch be=
 using ${nonarch_libdir} too? Or should the recipes that package modules.d =
config files place them via ${exec_prefix}/lib ?</div><div><br></div><div>t=
hanks</div><div><br></div><div>Christopher</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.c=
om" target=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br>
Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.co=
m" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; ---<br>
&gt; recipes-extended/xen/xen-tools.inc | 3 +--<br>
&gt; 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-tools.inc<br>
&gt; index d831941..6b99040 100644<br>
&gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; FILES:${PN}-xencommons +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/launch-xenstore \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/proc-xen.mount \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xen-qemu-dom0-disk-backen=
d.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xenconsoled.service \<br>
&gt; @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D &quot;xendoma=
ins.service&quot;<br>
&gt; <br>
&gt; EXTRA_OECONF +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-systemd=3D${systemd_unitdir}/system \<br>
&gt; -=C2=A0 =C2=A0 --with-systemd-modules-load=3D${systemd_unitdir}/module=
s-load.d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-initddir=3D${INIT_D_DIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-sysconfig-leaf-dir=3Ddefault \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-system-qemu=3D${bindir}/qemu-system-i386 \<b=
r>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000a16c9805d2ad4d37--

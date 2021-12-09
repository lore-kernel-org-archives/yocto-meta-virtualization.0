Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.6916.1639021399348570994
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 19:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qYeLqAzN;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso4890656ots.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Dec 2021 19:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDoqUVZhGeQja598tlrFjKVnOps1R8SgdDW5EyJACwE=;
        b=qYeLqAzN6CTr7FG5a7mhR4D8y9cAeDKFSfDtOysmJ26nIWRC2MMSU5hSqLzqMNGKZZ
         UZjRCwLRVhGmU1Vs7+aNzZ6jI8p7+4ch5qlrmvwGurgOhgVQnMxdl6bnvzAOecR0IpAq
         vsNs2BniGllyZcmbFzsMuYeNRuRHfnFB7V/wCyf0lo3P577t3hnJfAcn6qdU63GkobEU
         PP2TQYqvtZGrOn4R6TxRgeyYl66gntmU2A91/y3Fq4z428Xftwjy65EB7CCquDdFTGNI
         wYAat7VWIWNca1roLD890vbfomFQkd6GxxCqGZLZfwZo8Y4Mh0+6t4+EDrpIzlQmAWYU
         Ke5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDoqUVZhGeQja598tlrFjKVnOps1R8SgdDW5EyJACwE=;
        b=aaBqm0Sw2KNILUVQbRc3wuqsVIk0xqGz69HM26gXuxTzZtnK+19Yf41c9YM8F77X8Q
         VWjzEnKuzhrOLobTvcN2gNyGyeEnGdCZbapqwmcprNAWqdU1k6mYX43vww27OGtscvEH
         YklhXN3uL+WKp40B3c7mir0XJutcqRyqOVfzvjWdx9QUT5+hQpAtZBFhBslhvdyz7eJg
         Pl8hRCr+jkXbeosGaX7FiNDqeQ3Eakxl3MOAEkGZvxfVNgfk2wu8/RenSKOO3PwRxPK7
         xjDqOsGiu5ULl4pBYNECY+aATp0+C3cx219YtI/PkzM32ayhJI0PzAbwOR8fgdcRJja3
         bZvQ==
X-Gm-Message-State: AOAM530ZiBmhGUpLB/f8FjJSyYSqAgrOEyO2osl0NXMUca35hRii1FA7
	x2O2PAbwV6DitcPKTAroI+IH+qCX3m4gVUO+j2SehD4kvKA=
X-Google-Smtp-Source: ABdhPJzTWtxNsqBYKXD6PcW1T3VsrtPcB0qS+EdLXLlYA8WlXxVIyQVxYB1ITx/4OMb4voxNyKtX/qGu/S89Jty/xxE=
X-Received: by 2002:a05:6830:19c5:: with SMTP id p5mr3235415otp.195.1639021398535;
 Wed, 08 Dec 2021 19:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20211208104458.28009-1-kamil.dziezyk@arm.com> <5968C1C2-BF9B-4EC5-AAA9-DCB01155EE3F@arm.com>
 <CACMJ4GbUAUH2isseP_nUX8MEW3TVqRRQiS-J-6AMFpsVHLgPMA@mail.gmail.com> <CAMKF1so7v3mW3AOh-zmU-zcQxYaMHgbuPs+wpLwif25VJEtDeA@mail.gmail.com>
In-Reply-To: <CAMKF1so7v3mW3AOh-zmU-zcQxYaMHgbuPs+wpLwif25VJEtDeA@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 8 Dec 2021 19:43:06 -0800
Message-ID: <CACMJ4GaWgstGJ6dSL2bb7f8u3esuBf0eY2G0md37_-e3qRs4zg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen-tools: Load xen related kernel modules during system boot
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	=?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, nd <nd@arm.com>, Khem Raj <raj.khem@gmail.com>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="0000000000003d316205d2ae6805"

--0000000000003d316205d2ae6805
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 6:35 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> On Wed, Dec 8, 2021 at 6:24 PM Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
>
>> On Wed, Dec 8, 2021 at 5:10 AM Bertrand Marquis <bertrand.marquis@arm.com>
>> wrote:
>>
>>> Hi Kamil,
>>>
>>> > On 8 Dec 2021, at 10:44, Kamil Dziezyk via lists.yoctoproject.org
>>> <kamil.dziezyk=arm.com@lists.yoctoproject.org> wrote:
>>> >
>>> > This patch changes the location of xen.conf file, that contains list
>>> of kernel
>>> > modules to be loaded during system boot, to "${nonarch_libdir}". This
>>> is done
>>> > by removing '--with-systemd-modules-load=' flag from EXTRA_OECONF
>>> variable.
>>> >
>>> > Previous path based on "${systemd_unitdir}" was not considered by
>>> default by
>>> > systemd-modules-load.service.
>>>
>>
>> ok, it does look like there's a fix that should be made here, thanks. It
>> took a bit of following to see what's involved, so:
>>
>> There are two recipes in meta-openembedded that do use ${nonarch_libdir}
>> for this, but the systemd package itself doesn't: the recipe
>> has ${exec_prefix}/lib/modules-load.d instead, and there's a systemd patch
>> that applies ${exec_prefix}/lib/modules-load.d too; but then in oe-core,
>> bitbake.conf defines: nonarch_libdir = "${exec_prefix}/lib"
>> so the end result should work in the default configuration.
>>
>> Khem: should the OE Core systemd recipe and patch be using
>> ${nonarch_libdir} too? Or should the recipes that package modules.d config
>> files place them via ${exec_prefix}/lib ?
>>
>
> I think nonarch_libdir is right option here
>

Thanks, Khem.

Kamil: Is there any reason that you chose to drop specifying the install
directory via the flags passed to EXTRA_OECONF?
ie. An alternative would be: rather than remove the
"--with-systemd-modules-load" flag, you could update it to use the correct
location:
    ${nonarch_libdir}/modules-load.d
so that if exec_prefix or nonarch_libdir are ever overridden to a
non-default value, the config file will still be placed correctly.

Christopher




>
>> thanks
>>
>> Christopher
>>
>>
>>
>>> >
>>> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Cheers
>>> Bertrand
>>>
>>> > ---
>>> > recipes-extended/xen/xen-tools.inc | 3 +--
>>> > 1 file changed, 1 insertion(+), 2 deletions(-)
>>> >
>>> > diff --git a/recipes-extended/xen/xen-tools.inc
>>> b/recipes-extended/xen/xen-tools.inc
>>> > index d831941..6b99040 100644
>>> > --- a/recipes-extended/xen/xen-tools.inc
>>> > +++ b/recipes-extended/xen/xen-tools.inc
>>> > @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
>>> >     "
>>> >
>>> > FILES:${PN}-xencommons += "\
>>> > +    ${nonarch_libdir}/modules-load.d/xen.conf \
>>> >     ${sysconfdir}/default/xencommons \
>>> >     ${sysconfdir}/init.d/xencommons \
>>> >     ${sysconfdir}/xen/scripts/launch-xenstore \
>>> > -    ${systemd_unitdir}/modules-load.d/xen.conf \
>>> >     ${systemd_unitdir}/system/proc-xen.mount \
>>> >     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>>> >     ${systemd_unitdir}/system/xenconsoled.service \
>>> > @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =
>>> "xendomains.service"
>>> >
>>> > EXTRA_OECONF += " \
>>> >     --with-systemd=${systemd_unitdir}/system \
>>> > -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
>>> >     --with-initddir=${INIT_D_DIR} \
>>> >     --with-sysconfig-leaf-dir=default \
>>> >     --with-system-qemu=${bindir}/qemu-system-i386 \
>>> > --
>>> > 2.17.1
>>> >
>>> >
>>> >
>>> >
>>>
>>>
>>> 
>>>
>>>

--0000000000003d316205d2ae6805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 8, 2021 at 6:35 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Dec 8, 2021 at 6:24 PM Christopher Clark &lt;<=
a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christoph=
er.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 8, 2021 a=
t 5:10 AM Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com" =
target=3D"_blank">bertrand.marquis@arm.com</a>&gt; wrote:<br></div><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kam=
il,<br>
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
config files place them via ${exec_prefix}/lib ?</div></div></div></blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">I think nonarch_libdir is=
 right option here=C2=A0</div></div></div></blockquote><div><br></div><div>=
Thanks, Khem.</div><div><br></div><div>Kamil: Is there any reason that you =
chose=C2=A0to drop specifying the install directory via the flags passed to=
 EXTRA_OECONF?</div><div>ie. An alternative would be: rather than remove th=
e &quot;--with-systemd-modules-load&quot; flag, you could update it to use =
the correct location:</div><div>=C2=A0 =C2=A0 ${nonarch_libdir}/modules-loa=
d.d</div><div>so that if exec_prefix or nonarch_libdir are ever overridden =
to a non-default value, the config file will still be placed correctly.<br>=
</div><div><br></div><div>Christopher</div><div><br></div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"auto"></div><div><br><=
/div><div>thanks</div><div><br></div><div>Christopher</div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>
</blockquote></div></div>

--0000000000003d316205d2ae6805--

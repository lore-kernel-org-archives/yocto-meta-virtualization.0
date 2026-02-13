Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB55EF48C5
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 03:04:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62965.1770951862655511008
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 19:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAo36oBS;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35305538592so413001a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 19:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770951862; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbGlge5xALPEOvNPuWzBvTe2HtG30H2Y2pRZqKccIDU6ie8jP/LZyX2kszdX5cJtJA
         sangNGxkqr2Cm4ewVrSG7gRqJAw3lhyKc3wuv68rcWlO443y27USB8GHyBIhV/PqFtV7
         +Haj2dwfH6hIvf2n/nc59PgzEYUb3XoQZuR8hadZU5YbQ3ZUzDeCKbRg9E1TRBFV1Aef
         IDyywPgq+1fZB/VGFDnIGEmY7SKuks2uAbXt1PxDQgGbmXfPtoBxd8xge3N7gyELH55e
         oyAW0EbbiYg5xugV6Q2IFL4AJZk9vZOTGKeE/2cV28PR5FXiSd+qg0TrdvOoEGlN11RJ
         +PPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5C61lapJoLcTgzUI1KGKt2OpvK8Kz/buPKKQmYU/TO4=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=KHMgn/PRvJjAD0Twbfq1lqI9vL43+OEIwLyrnAqSfJTWvaxgJc4f7iN+C9z+k4lX+z
         tfy6SWBCIIlbrPslAfIU2OKOXFp1FsjbiDr1UaskmisAhjB05eVEe9zndTZBrcZkBXwJ
         5pfgMoDQLl905V2m+Rtk9MOVpTCGLP2XRciJPvHZh9rtHYDSkclxxHDZdXWyzEhsNAlI
         T18aoH0sV9j3nnHB87Svdd4r8CQfiCbEx3u7CxoDndp+HFV4XuwpnQSm8QehB9wzc4Mt
         PD4fKkzriWo3CitqBdZ+2OW31Z2UavlQ42bVzjWeKHSA1EMg1G+vPPNzFc067jmUYBuk
         gaIw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770951862; x=1771556662; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5C61lapJoLcTgzUI1KGKt2OpvK8Kz/buPKKQmYU/TO4=;
        b=TAo36oBSMma5CjRGkuJrU8NAEj3rmSTGDam1lX7+bV2blH6CvWjYIsNGW6qolY0FYZ
         8ohOolPC5JiF4eY+yjXx1jZPObrp0lg9V56PpQkrvcKIKI/xb2JsVwkCKH1h7AFU1V63
         udoL4qbYwsUOXRtI7FCgSfrJDiiuIjJw9m7jD7HZxpRA5/VDoHsKgd7nDjA8a+3BjqJ5
         GEjcnL+eeHezVvaHaXLZbtOnUeoc+RVy3lDk8lc/g71nMO+OPFh72y1LK9c9Sn/87d1V
         YoW8KwSbo8zMnwbdAwZ6rFYLZZs0BTg5n64HrHCA6x1Lt6o8/FcHaVHweHWzpMAul+jX
         o/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770951862; x=1771556662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5C61lapJoLcTgzUI1KGKt2OpvK8Kz/buPKKQmYU/TO4=;
        b=KDbd7S+x+S6DGoe7G80Kj9fB3aGW0IGFh+eZlLR6c4mIf0Rcmekf5MVMavy2Otxl1o
         KC4+DHKhxR4o/WTaalHpdY7FqwkPgs7ZuZfAuoUF4x8nzd0kTcG9KxX5SaAa8moJEF0d
         W4BgRjLq2XIMTOfuHYM8qerD+cExZQ9hzIyshpmlCMWlxLq906Hqw8560ipwp8pOa1/e
         ohk5VEaWHiY3B0CnvG1Em4TC7zStiVHyR43tJMunxXZUCJeaq7xi2Gvjvae/qDlDKSud
         /R1I/WOatdTUhLVELYzT9G/MSg/p9md6sUeBAL7JknCK+ozUxyT79UzuJoBAL5ctbJrj
         UBFQ==
X-Gm-Message-State: AOJu0YwPAD9rgEKAK23LAgilvi/YH++LtzV8n2dAI8ZskN8QcNzGMaT7
	5ehv1gjc6DqS/g73V2xp/5J2eR0+UE3pDzwShJLjl8/scAW/s/MY1tHwWIiMcobOaYra1f8Muog
	pZTT0JlXMjl3QpZiIy36WqaLxrJVuelG8o3cj
X-Gm-Gg: AZuq6aJAVNFgv20sbLopkFx1xV2sZyZdj4o+StcgOfcs9Ce8iB2OCG8HlrygUdzmJdl
	NYD5kYsKDtaTmzQLYT99A3UWcUY72sRWpsrVLhYIwhBxgB0neLb0SNOhFuEInmk6Kebo2/g9Pvk
	Kq/F+uTtEHYBYZtj2FHryIfAE3/MUlPXaIGpaBrutMWpJRvWj5q0s0bNYDKFBc/6DNdnCdfZFOD
	7QIRntD+D0Z81L2cejdAmSlyXkyNQNmf9KAb/K9HaNJe3f+MPMK+PGrhdhxnQ2PETIS+ciCFURe
	J7nGp7jY6pNRmaOAEn9nOl7EE6PVzWLgrb/MNQzI
X-Received: by 2002:a17:90b:4ad0:b0:32e:a5ae:d00 with SMTP id
 98e67ed59e1d1-356aabe97c9mr442939a91.13.1770951861762; Thu, 12 Feb 2026
 19:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20260212030943.15928-1-liuyd.fnst@fujitsu.com>
 <CADkTA4OJvf=TS9-UmrOd-cRLaGuDXT50f4oaCrNV41Ww5_kGgw@mail.gmail.com> <TY3PR01MB101102F37DBF9122612A15F009B61A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB101102F37DBF9122612A15F009B61A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Feb 2026 22:04:10 -0500
X-Gm-Features: AZwV_QgR-Mc5RGx7x_hKM_gPbcP_y1zmM-Q581CMTB6TADrbTiUVTbgLCBoMqN0
Message-ID: <CADkTA4NgjBZ6P4wogbaFi1UeynS6vMG1WRRFVGJ4JwvFPAfbvg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when
 sysvinit is used
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a27eb1064aabdc99"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 03:04:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9585

--000000000000a27eb1064aabdc99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 10:02=E2=80=AFPM Yiding Liu (Fujitsu) <
liuyd.fnst@fujitsu.com> wrote:

> Hi Bruce
>
>     I'm sorry to misunderstood your emails.
>
>     Now I will resend the v2 patch like following:
>
>    1. To use PACKAGECONFIG instead of EXTRA_OECONF
>
>      PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},syste=
md,"
>
>
>    2. Summarize what has changed in a v2 below the --- like
>    ......
>    Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>
> ---
> Changes in v2:
> - Improved commit message to explain the sysvinit case
> - Use PACKAGECONFIG instead of EXTRA_OECONF
>
>       Is that OK?
>
>
Yes, that's it!

Normally I would have just edited it myself, but I had to get to some other
reviews.

Thanks for the contribution, it is much appreciated.

Bruce



> Liu
>
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B42=E6=9C=8812=E6=97=
=A5 12:57
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: [meta-virtualization][PATCH v2] irqbalance: Fix=
 QA error when
> sysvinit is used
>
>
>
> On Wed, Feb 11, 2026 at 10:09=E2=80=AFPM Yiding Liu (Fujitsu) via
> lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
> wrote:
>
> irqbalance: correct to install /etc/default for sysvinit
>
> 1. This commit uses option --with-pkgconfdir to correct to install
> /etc/default when sysvinit is used.
>    Without this fix, there will show do_package QA Issue
>    ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance:
> Files/directories were installed but not shipped in any package:
>      /usr/etc
>      /usr/etc/default
>      /usr/etc/default/irqbalance.env
>
>   Previous PACKAGECONFIG[systemd] only works when systemd is used. When
> using sysvinit, --with-pkgconfdir=3D${sysconfdir} can't work, so making t=
his
> patch to fix it.
>
> 2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]
>
>
> You need to address my review comments directly.
>
> Also, summarize what has changed in a v2 below the --- in the patch itsel=
f.
>
> Cheers,
>
> Bruce
>
>
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/irqbalance/irqbalance.inc
> b/recipes-extended/irqbalance/irqbalance.inc
> index 35b6388e..b7b34a0b 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>                    "
>
>  DEPENDS =3D "glib-2.0"
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'system=
d',
> '', d)}"
>
>  INITSCRIPT_NAME =3D "irqbalanced"
>  INITSCRIPT_PARAMS =3D "defaults"
> @@ -25,6 +24,7 @@ SYSTEMD_PACKAGES =3D "irqbalance"
>  SYSTEMD_SERVICE:irqbalance =3D "irqbalance.service"
>
>  EXTRA_OECONF =3D "--program-transform-name=3D \
> +                --with-pkgconfdir=3D${sysconfdir} \
>                "
>
>  # let the recipes or appends define options
> @@ -34,7 +34,7 @@ PACKAGECONFIG ?=3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>  #
>  PACKAGECONFIG[numa] =3D "--enable-numa,--disable-numa,numactl,"
>  PACKAGECONFIG[libcap-ng] =3D
> "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
> -PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},,,"
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
>
>  do_install () {
>          oe_runmake 'DESTDIR=3D${D}' install
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9582):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9582
> Mute This Topic: https://lists.yoctoproject.org/mt/117769267/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a27eb1064aabdc99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 12, 2026 at 10:02=
=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg8970877586658246118">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Bruce=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 I&#39;m sorry to misunderstood your emails.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 Now I will resend the v2 patch like following:</div>
<ol style=3D"margin-top:0px;margin-bottom:0px;list-style-type:decimal" star=
t=3D"1">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">To use PACKAGECONFIG instead of EXTRA_OECONF</di=
v>
</li></ol>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG[systemd] =3D &quot;--with-systemd --with-=
pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},systemd,&quot;=
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<ol style=3D"margin-top:0px;margin-bottom:0px;list-style-type:decimal" star=
t=3D"2">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">Summarize what has changed in a v2 below the ---=
 like</div>
<div role=3D"presentation">......</div>
<div role=3D"presentation">Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:=
liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;</d=
iv>
</li></ol>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
---</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Changes in v2:</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- Improved commit message to explain the sysvinit case</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- Use PACKAGECONFIG instead of EXTRA_OECONF</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MS=
FontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 Is that OK?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Yes, that&#39;s it!<br><br>Normally I wo=
uld have just=C2=A0edited it myself, but I had to get to some other reviews=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Thanks for the contribu=
tion, it is=C2=A0much appreciated.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div class=3D"msg8970877586658246118"><div dir=3D"l=
tr"><div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Liu</div>
<div><br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_8970877586658246118divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02026=E5=B9=B42=E6=9C=8812=
=E6=97=A5 12:57<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>=C2=A0Liu, Yiding/=E5=88=98 =E4=B9=99=E4=
=B8=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuy=
d.fnst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b>=C2=A0<a href=3D"mailto:meta-virtualization@lists=
.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject=
.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" =
target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b>=C2=A0Re: [meta-virtualization][PATCH v2] irqbala=
nce: Fix QA error when sysvinit is used</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Wed, Feb 11, 2026 at 10:09=E2=80=AFPM Yidin=
g Liu (Fujitsu) via
<a id=3D"m_8970877586658246118OWA7834170b-f1d2-bf77-0962-311aef22823f" href=
=3D"http://lists.yoctoproject.org" target=3D"_blank">
lists.yoctoproject.org</a>=C2=A0&lt;liuyd.fnst=3D<a id=3D"m_897087758665824=
6118OWAf7b917bf-f4c3-6bb6-a51a-c2af4e2891bd" href=3D"mailto:fujitsu.com@lis=
ts.yoctoproject.org" target=3D"_blank">fujitsu.com@lists.yoctoproject.org</=
a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">irqbalance: correct to install /etc/default fo=
r sysvinit<br>
<br>
1. This commit uses option --with-pkgconfdir to correct to install /etc/def=
ault when sysvinit is used.<br>
=C2=A0 =C2=A0Without this fix, there will show do_package QA Issue<br>
=C2=A0 =C2=A0ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalanc=
e: Files/directories were installed but not shipped in any package:<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc/default<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc/default/irqbalance.env<br>
<br>
=C2=A0 Previous PACKAGECONFIG[systemd]=C2=A0only works when systemd is used=
. When using sysvinit, --with-pkgconfdir=3D${sysconfdir} can&#39;t work, so=
 making this patch to fix it.<br>
<br>
2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]<br>
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">You need to address my review=
 comments directly.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Also, summarize what has chan=
ged in a v2 below the --- in the patch itself.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Cheers,</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Bruce</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">Signed-off-by: Liu Yiding &lt;<a id=3D"m_89708=
77586658246118OWAb228d3f3-f82d-e232-2a05-1e1e0b5d4d3a" href=3D"mailto:liuyd=
.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/irqbalance/irqbalance.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/=
irqbalance/irqbalance.inc<br>
index 35b6388e..b7b34a0b 100644<br>
--- a/recipes-extended/irqbalance/irqbalance.inc<br>
+++ b/recipes-extended/irqbalance/irqbalance.inc<br>
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512=
a9ba36caa9b7df079bae19f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
-DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;irqbalanced&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
@@ -25,6 +24,7 @@ SYSTEMD_PACKAGES =3D &quot;irqbalance&quot;<br>
=C2=A0SYSTEMD_SERVICE:irqbalance =3D &quot;irqbalance.service&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--program-transform-name=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-pkgconfdir=
=3D${sysconfdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# let the recipes or appends define options<br>
@@ -34,7 +34,7 @@ PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;systemd&#39;, &#39;systemd&#39;,<br>
=C2=A0#<br>
=C2=A0PACKAGECONFIG[numa] =3D &quot;--enable-numa,--disable-numa,numactl,&q=
uot;<br>
=C2=A0PACKAGECONFIG[libcap-ng] =3D &quot;--with-libcap-ng,--without-libcap-=
ng,libcap-ng,&quot;<br>
-PACKAGECONFIG[systemd] =3D &quot;--with-systemd --with-pkgconfdir=3D${sysc=
onfdir},,,&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;--with-systemd,,systemd&quot;<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; insta=
ll<br>
--<br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9582): <a id=3D"m_8970877586658246118OWAcc53e277-11ca-e=
dd2-c858-a209ec706691" href=3D"https://lists.yoctoproject.org/g/meta-virtua=
lization/message/9582" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9582</a><br>
Mute This Topic: <a id=3D"m_8970877586658246118OWA2cbf9c37-4a99-0f8b-0099-d=
e540dc6c5a6" href=3D"https://lists.yoctoproject.org/mt/117769267/1050810" t=
arget=3D"_blank">
https://lists.yoctoproject.org/mt/117769267/1050810</a><br>
Group Owner: <a id=3D"m_8970877586658246118OWA7123d64e-0ea7-0498-089a-0e139=
c4c1efd" href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproject.org"=
 target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a id=3D"m_8970877586658246118OWA35d6f6c3-efb7-9311-d8e1-1f389=
d5bcbfd" href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub=
" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>=C2=A0[<a id=
=3D"m_8970877586658246118OWA289f4c28-ad8a-e39d-3919-05f9735dbfab" href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">--</div>
<div style=3D"direction:ltr">- Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000a27eb1064aabdc99--


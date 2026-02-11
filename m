Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD73E9E30F
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:12:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19777.1770819125852601134
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQYGqlYP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35658757f68so1261698a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 06:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770819125; cv=none;
        d=google.com; s=arc-20240605;
        b=kgRcX789EDSliSgPZ76vHmCs7/vSNsGIWL7joe9wEfuBwMM+BvvDHbNFOp6hXmH4nX
         KwQEKRdh8gfL9787c8+4Zt3uvcLlh2hRFAizVLGFJQ3fKBwi2M+4u/uRSeyVZxUkbWSY
         76XLHo0t8dsrkw2Gs9gMJkg84js04vY6DtaIjroS/gFEXleG8g6k/mu/7X0T6fZClJ/G
         1rIQyLimhvi1Vk+pLOdNuPk6mBCIBtZbkSkkjFnW8Ii+PnSF7meU0dUP4MVr/IcJkx5T
         requdP4l18vYUAy977f9NRoa9yCU6/Jo+ZhqxNPUWrLYfDPRLOimbUrmISPPD3Q5wqEf
         FpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pFSME6kAl6Jnm688kW5XZObIlrwePoE5yFjAx+VGtd0=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=gMvSLnrmr0LnvN28qmox7S4SaQf3dZNw7w2kfDlRPDybyeQZuXkIHLSij8EnVM9olK
         gjuZEuseZehuCnc/e7ZMXIh9HyM2pS9PokaOfioDuC7cjkW9LjBmSu4v7EV9unbWZgv5
         KOwKwf+wRKQaiRO9gzcTo7bL9PugJYscij73VSswwCXhr41oJ0tMDbXUK8+wGTbs53Z4
         KNoXHXikkG9n5PK5a4vuJFypP7i9pNQzuEaTzZHzg/hG0jMY6viJFe0L+DodJ+1ig7lX
         EY6zblHM0QaShNNOe45f6DokySmNgTjESkkvroPK4udAZUyBwNjqdcANKsX7bKgIxQfY
         vEzw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819125; x=1771423925; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFSME6kAl6Jnm688kW5XZObIlrwePoE5yFjAx+VGtd0=;
        b=fQYGqlYPKjo04z1DkRt559KTiAqK7cNA3ix7sdgwdPDA/cSlFPApMsJgw4MpdZC8rX
         WmwLXdrDvaFafFI67xzr6a+WZt5kf4pVV8ZslSnqmkCW3G6G21JBAUNVCshwkUXopzTt
         wp0PGz65KRroKDIpBHJ4CRKlghhPtarODvFbbo6UsJoHdI7EBt0ZEFldrOF9tz4JccOR
         fY343bBX6mbJMf6DppdVb8LHCzkVAJ7smQwZ7HbFCIw4kdatjYKNX92/WO/2Dv30Y3wD
         RlNeeyX9YJN/ugzpGnT6G2/BojM5AHQiiQxcFsjTcic0gc3PZnwAKSGJSuCQ6KN+uHpq
         khrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819125; x=1771423925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFSME6kAl6Jnm688kW5XZObIlrwePoE5yFjAx+VGtd0=;
        b=bDWuyvGuAXmCaSvyedf8yT5bNXla45Jbtvp3iOQ3nOqKWDKbS/vL/PQXAEs2X7JjJr
         vcPKRrgef+IzLtYyBS519AIs44/2N2t902GMEzqEWGL7Srkr2EM1uAoE3r/N1kjTQb5M
         PqJl0PBbpyaKiszQcgyfBR3ckyzOBUrblVh0t+fYBNeK6phKzel8CSy7Gz+bIVHzij/8
         GG6DvSXwZSzsqxBYBzKg0VpJqwTZgKFNqTYVh2rCJS4CFmr2xIwuv5ZiO99kBssuGLY6
         EdVllkK4uNc4tq3qsDRcoIcnTeADlqKKyoHA1Bpdc7dGpV48QxtMR7tCaP6TXww4SJcL
         Uonw==
X-Gm-Message-State: AOJu0Yx5Gi4pWlRLWIaGUXjEYXDk3BC4Wvi6Wc4BuxwTbWeAYKnu/40k
	Q8jcLRCvNLHAm2Z9jGvIvpIDMXn1JW9yZsKqNFWGB+5rJNjkCkTKL+jFwDxrLlmfvHHVLw9JhW2
	LCJzixSfw9b5ieB9KbhPk7rXnghvAxwcbB3KXJs0=
X-Gm-Gg: AZuq6aIFNUTHOkY4YK2cA6eUhtG2ibsoThHHjFzj8BtxSFC7ItUHV3/m50hJ5mPkLhW
	fULfi3E38cGwOs1XNF46ZYOS5vm80RZFAS242Wjp+Ztzu1mTzBDmsdRMm+L6RxdBRKUR7my7PVv
	IdAM8lXE5/bC+VuKFcIfIHuHxj3aT+u8fHoE1snIUzLfZfdLN+QR7j87OVBIa0Emd7TeAc0Uy28
	5T5S1KhElAOgAj8QCkLv5oRUF3Bh+qExD4wM7PIQvSHtWUyYnuvnrMoAO6zPbhsc0O7QM5RzcgV
	V0OK+B6urBx0orKohgIGYdxAxvt7xbN9955fssoI4WBzhi3ISPA=
X-Received: by 2002:a17:90b:3d8b:b0:352:f2a6:334 with SMTP id
 98e67ed59e1d1-3567b006342mr2873800a91.16.1770819124999; Wed, 11 Feb 2026
 06:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20260126034434.4242-1-liuyd.fnst@fujitsu.com> <CADkTA4OmUhcmcLHtCD8uGBA+u3UT4PtKx-BuuZryD6LAvUo2Bg@mail.gmail.com>
 <TY3PR01MB10110601F0DF398F5ABB600FA9B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110601F0DF398F5ABB600FA9B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Feb 2026 09:11:53 -0500
X-Gm-Features: AZwV_Qj6s9qPo2RV9zG-t5D0mq4mpeA4BJQDzCFqAiRq_e2_czuYCcDnKMDO1i8
Message-ID: <CADkTA4MrXa7_+AAtb+CaTFqf9w61exv4aLQcxF5T5CvaFkMFvQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd]
 parameter
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e8391f064a8cf4a9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9576

--000000000000e8391f064a8cf4a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 2:09=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

> Hi Bruce
>
> >Which is what that first field is trying to do. So is there an
> issue in the configure that isn't passing it through ? Is it
> the combination of that plus our EXTRA_OECONF ?
>
> There is no issue with "PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},,,"
>
> But it only works when using systemd, so in that condition, there is no
> do_package QA Issue about install path.
>
> When using sysvinit, PACKAGECONFIG[systemd] can't work, so I need to make
> this patch to fix it.
>
> I want to make "=E2=80=94with-pkgconfdir=3D${sysconfdir}" works for both =
systemd and
> sysvinit.
>


This is the information that needs to be in the commit message. The goal of
fixing the
QA error when sysvinit is used.

But since the packageconfig has a field for adding the options when the
packagconfig is
disabled, then we should be able to collapse everything to something like
this:

# when systemd is not enabled in PACKAGECONFiG, we just pass
--with-pkgconfdir for sysvinit
PACKAGECONFIG[systemd] =3D "--with-systemd
--with-pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},systemd=
,"

unless you have both sysvinit and systemd enabled at once.

Alternatively, we introduce a sysvinit PACKAGE config and pass the options
there.

The packageconfig is self documenting as to why we want the option passed,
versus
moving it to the EXTRA_OECONF.

Bruce





>
> Liu
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B42=E6=9C=885=E6=97=A5=
 09:50
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: [meta-virtualization][PATCH] irqbalance: Fix
> PACKAGECONFIG[systemd] parameter
>
> You don't often get email from bruce.ashfield@gmail.com. Learn why this
> is important <https://aka.ms/LearnAboutSenderIdentification>
>
>
> On Sun, Jan 25, 2026 at 10:44=E2=80=AFPM Yiding Liu (Fujitsu) via
> lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
> wrote:
>
> irqbalance: correct to install /etc/default for sysvinit
>
> 1. This commit uses option --with-pkgconfdir to correct to install
> /etc/default
>    Without this fix, there will show do_package QA Issue
>    ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance:
> Files/directories were installed but not shipped in any package:
>      /usr/etc
>      /usr/etc/default
>      /usr/etc/default/irqbalance.env
>
> 2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]
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
>
>
> We should explain this change more in the commit message.
> irqbalance uses autotools and that's one of the classes that
> is supposed to pick up PACKAGECONFIG_CONFARGS.
>
> Which is what that first field is trying to do. So is there an
> issue in the configure that isn't passing it through ? Is it
> the combination of that plus our EXTRA_OECONF ?
>
> Bruce
>
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
> View/Reply Online (#9552):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9552
> Mute This Topic: https://lists.yoctoproject.org/mt/117463389/1050810
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

--000000000000e8391f064a8cf4a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 2:09=
=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg900366946418763516">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">Hi </span><span style=3D"font-size:9.75pt">B=
ruce</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">&gt;</span><span style=3D"font-size:9.75pt">=
Which is what that first field is trying to do. So is there an</span></div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
issue in the configure that isn&#39;t passing it through ? Is it</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
the combination of that plus our EXTRA_OECONF ?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">There is no issue with &quot;</span><span st=
yle=3D"font-size:11pt">PACKAGECONFIG[systemd]=C2=A0=3D &quot;--with-systemd=
 --with-pkgconfdir=3D${sysconfdir},,,&quot;</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
But it only works when using systemd, so in that condition, there is no do_=
package QA Issue about install path.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
When using sysvinit, PACKAGECONFIG[systemd] can&#39;t work, so I need to ma=
ke this patch to fix it.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I want to make &quot;=E2=80=94with-pkgconfdir=3D${sysconfdir}&quot; works f=
or both systemd and sysvinit.</div></div></div></blockquote><div><br></div>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
This is the information that needs to be in the commit message. The goal of=
 fixing the</div><div class=3D"gmail_default" style=3D"font-size:small">QA =
error when sysvinit is used.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br>But since the packageconfig has a field for adding the op=
tions when the packagconfig is</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">disabled, then we should be able to collapse=C2=A0everythin=
g to something like this:</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
># when systemd is not enabled in PACKAGECONFiG, we just pass --with-pkgcon=
fdir for sysvinit</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">PACKAGECONFIG[systemd] =3D &quot;--with-systemd --with-pkgconfdir=3D${sy=
sconfdir},--with-pkgconfdir=3D${sysconfdir},systemd,&quot;</div></div><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">unles=
s you have both sysvinit and systemd enabled at once.</div></div><div><br><=
div class=3D"gmail_default" style=3D"font-size:small">Alternatively, we int=
roduce a sysvinit PACKAGE config and pass the options there.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br>The packageconfig is self=
 documenting as to why we want the option passed, versus</div><div class=3D=
"gmail_default" style=3D"font-size:small">moving it to the EXTRA_OECONF.<br=
><br>Bruce</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div class=3D"msg900366946418763516"><div dir=3D"ltr=
">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Liu</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_900366946418763516divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02026=E5=B9=B42=E6=9C=885=
=E6=97=A5 09:50<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>=C2=A0Liu, Yiding/=E5=88=98 =E4=B9=99=E4=
=B8=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuy=
d.fnst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b>=C2=A0<a href=3D"mailto:meta-virtualization@lists=
.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject=
.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" =
target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b>=C2=A0Re: [meta-virtualization][PATCH] irqbalance=
: Fix PACKAGECONFIG[systemd] parameter</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<table style=3D"direction:ltr;text-indent:revert;line-height:revert;white-s=
pace:revert;background-color:revert;display:table;margin:revert;width:100%;=
height:revert;table-layout:fixed;color:revert" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
<tbody>
<tr style=3D"background-color:revert">
<td style=3D"direction:ltr;text-indent:revert;line-height:revert;white-spac=
e:revert;border-width:revert;border-style:revert;border-color:revert;backgr=
ound-color:rgb(166,166,166);padding:7px 2px;word-break:revert;color:revert;=
width:0px;height:revert">
</td>
<td style=3D"direction:ltr;text-align:left;text-indent:revert;line-height:r=
evert;white-space:revert;border-width:revert;border-style:revert;border-col=
or:revert;background-color:rgb(234,234,234);padding:7px 5px 7px 15px;word-b=
reak:revert;color:rgb(33,33,33);width:100%;height:revert">
<div style=3D"direction:ltr;text-align:left;text-indent:revert;line-height:=
revert;white-space:revert;font-family:wf_segoe-ui_normal,&quot;Segoe UI&quo=
t;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:revert">
<span style=3D"letter-spacing:revert;background-color:revert;line-height:re=
vert">You don&#39;t often get email from <a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>.
<a style=3D"color:revert;display:revert;background-color:revert" id=3D"m_90=
0366946418763516OWA1bf47387-f701-5eb3-00b0-67e6b35adee0" href=3D"https://ak=
a.ms/LearnAboutSenderIdentification" target=3D"_blank">
Learn why this is important</a></span></div>
</td>
<td style=3D"direction:ltr;text-align:left;text-indent:revert;line-height:r=
evert;white-space:revert;border-width:revert;border-style:revert;border-col=
or:revert;background-color:rgb(234,234,234);padding:7px 5px;word-break:reve=
rt;color:rgb(33,33,33);width:75px;height:revert">
</td>
</tr>
</tbody>
</table>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Sun, Jan 25, 2026 at 10:44=E2=80=AFPM Yidin=
g Liu (Fujitsu) via
<a id=3D"m_900366946418763516OWA72ac139d-8a74-fcc7-c798-7bfce6da1936" href=
=3D"http://lists.yoctoproject.org" target=3D"_blank">
lists.yoctoproject.org</a>=C2=A0&lt;liuyd.fnst=3D<a id=3D"m_900366946418763=
516OWAa8278f66-4ede-8f41-8100-b8c7217f090b" href=3D"mailto:fujitsu.com@list=
s.yoctoproject.org" target=3D"_blank">fujitsu.com@lists.yoctoproject.org</a=
>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">irqbalance: correct to install /etc/default fo=
r sysvinit<br>
<br>
1. This commit uses option --with-pkgconfdir to correct to install /etc/def=
ault<br>
=C2=A0 =C2=A0Without this fix, there will show do_package QA Issue<br>
=C2=A0 =C2=A0ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalanc=
e: Files/directories were installed but not shipped in any package:<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc/default<br>
=C2=A0 =C2=A0 =C2=A0/usr/etc/default/irqbalance.env<br>
<br>
2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]<br>
<br>
Signed-off-by: Liu Yiding &lt;<a id=3D"m_900366946418763516OWA1147e713-1fd2=
-7c2e-299f-cbafda703fa2" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_=
blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
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
onfdir},,,&quot;</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">We should explain this change=
 more in the commit message.=C2=A0</div>
<div style=3D"direction:ltr;font-size:9.75pt">irqbalance uses autotools and=
 that&#39;s one of the classes that</div>
<div style=3D"direction:ltr;font-size:9.75pt">is supposed to pick up PACKAG=
ECONFIG_CONFARGS.=C2=A0</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Which is what that first fiel=
d is trying to do. So is there an</div>
<div style=3D"direction:ltr;font-size:9.75pt">issue in the configure that i=
sn&#39;t passing it through ? Is it</div>
<div style=3D"direction:ltr;font-size:9.75pt">the combination of that plus =
our EXTRA_OECONF ?</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Bruce</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">+PACKAGECONFIG[systemd] =3D &quot;--with-syste=
md,,systemd&quot;<br>
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
View/Reply Online (#9552): <a id=3D"m_900366946418763516OWA02d74841-a257-e5=
08-9b46-d541dcea9b24" href=3D"https://lists.yoctoproject.org/g/meta-virtual=
ization/message/9552" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9552</a><br>
Mute This Topic: <a id=3D"m_900366946418763516OWAe86fa9c5-db79-369c-93bf-ae=
b97244303a" href=3D"https://lists.yoctoproject.org/mt/117463389/1050810" ta=
rget=3D"_blank">
https://lists.yoctoproject.org/mt/117463389/1050810</a><br>
Group Owner: <a id=3D"m_900366946418763516OWAd5059716-6e38-593a-01c1-1de98a=
19cf64" href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproject.org" =
target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a id=3D"m_900366946418763516OWA516e5f3d-3625-17d5-4d64-f1e96e=
1eefbb" href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub"=
 target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>=C2=A0[<a id=
=3D"m_900366946418763516OWA4ea5fbd6-a4e1-4d03-9dde-a748fcefa4ef" href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>]<br>
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

--000000000000e8391f064a8cf4a9--


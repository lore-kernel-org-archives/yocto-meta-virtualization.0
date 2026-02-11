Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83631ECD6D0
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:35:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25044.1770831352738889995
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9cF+Fiz;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824a6f2d816so290571b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 09:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770831352; cv=none;
        d=google.com; s=arc-20240605;
        b=Oaj8DUhXKzfhHLqRYR+uWYsoP1RePtEtLWOl9taIHMThxe+As8av8BjdqBpkmiffnO
         olMFuwP2bJjuOxG9zC9LNz1HPLa5O2aMO9ISwI8J3FCrdHJcbe91HrBar1ehlLT/uKiW
         dTJkFUf1cGCidWf3/7DwFlnFYDfwQ4uFy5Ep2ivBAtc15ftAI1vtP4q6vec3kyqsRnLO
         KtwN+hqIoVPtFFpG8zgFiw2BEb4Pe5CsQA8S9upBL5lttoTNUY3rlj0GQ1MnNYl79KpH
         +1Me9bwPx2mQ9wYb2Tv8kwrfujKhOisvWVajlmSaitJ4zJvEQOojUNdhMocggN6RRueC
         d+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=knjDYOPL4o/6GDE5/GnDxQ+NvCwS/XurvMh8UMPHGBw=;
        fh=ElWWgB0vbEOyVorgThEM0Tnvq5FYowdI/qluCM/iTjI=;
        b=dRTCL2bzc+8iHrdanYRqamc6kNKWOQ8iC0UPLJKbR52YED3AZdPh7ur9WLercl98/E
         9e/gurwdDzX2z7tAwWgN9ZbEb+tXW6gJifM2KRhuIAfNR+84wJWSrmL++urgih9IjGbh
         l5hW/C4H3wbRYolGKKuKQQVrAWYgvCwS6KCwXy0jbr73Gp359pDUnoqUQe51euW4bO3q
         llsxHsSH7ppjXoAEA68v8eUZ0mpAZs61g+8JjPDUWtLHGc0simtz8EVX8JX0ueRX51b4
         GncBEC3yDJkTh0iDnQ+ZpxJcoYaOGpxnbEopRVMZt75FszgHMb2uxmQAoG+jBakWUQlQ
         dHPA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770831352; x=1771436152; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knjDYOPL4o/6GDE5/GnDxQ+NvCwS/XurvMh8UMPHGBw=;
        b=N9cF+FizT48Dvvhk0iU6ZH5it2YC6pZ0DoQKmKye9IYcAsXkgWTcWHJwSRfi0Y+Gnp
         +yA1jiYfa9vqM5/r5sbP9AzHBv1EJzHzVm1E9iXvNj17DH4mxd90IfpdhSYnSDS+5sDl
         vppcyv+sKmjAVvgt3JI8U9l83HhJ+kgGbLXPVfnfmH/62regG6h8bjjFstwuJzahrVKx
         WbPoOsH74N++cSXIMuWqEbKCDduAr7DnisqpPDlt97PGtasCAGzpKsjpzOdrGT4dBdcc
         72sBzDsziR7lIwz/+rHTMntQGFET9Kx7jWBfta3g6L9xHz5h2J7WHYezRDFM38q9CxbU
         tpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831352; x=1771436152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knjDYOPL4o/6GDE5/GnDxQ+NvCwS/XurvMh8UMPHGBw=;
        b=hGQQwtQBHQHa1sw7moOuqQPlMn1xdAkPrbvzkD20fS5dRLn1LaTl5YJqvIN4dUWqCc
         LrpWg0rlVp+Ym/X9C4v8nrhawdth36Pn8AbiuLpytb1C/9tlDzMQOlYhdQPimQWI6m+U
         C6UcrQywID3VeBJUI8l+7Pe8aKEB7YBQtuRSB1auuGsNB6jNaCF5q4W4qEM7YNYg1U7a
         jh+awey0XsT79P1g2l0q73lAcBUk+2VVKZXSx3tzX6u71m5Pa2ug2JI0sAH4d5yIH44v
         DZ8xNJxF/VJb6zC404A6NV4QT0Qfn4HJ8L8eXGaILp6ftG5l5jki8rGlA7L+CFZtBpWE
         NVkg==
X-Forwarded-Encrypted: i=1; AJvYcCUqjPYafxU4YiuEL232zJFJ3OCrDdr6Ws+4hC414+F6Pj52ImRwyH5oRTEePjdBrEmKoovcchS0MQ9dL+d6GMNcn9cy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxqaOO2BI3FU3RWPjFzhr1Kipr42lbHGgLduJ2M9XYqM5TAt1vU
	obpEkKxjTFxB5+fhRPVyalrSkM10fZFYHWGEK6zMzVp1v42sbD9EzpqeTuBBtqs1dcd8pjYqI+S
	3LovyLv3W1ziQ76T/KQIvEzH4z2FTwk8=
X-Gm-Gg: AZuq6aIHWZ5Caz1Eq7xByTontuKJ72fiqbPxzLo0TclwxO7RHXaW3/2jMqjWjPnvAXn
	RJiapPI462PWOUnWefPUHtdaQNMeCfNyRSd3QtNlVlCwVAeso1qb+5p5kyg3XoPYxwazW1otM0U
	Z+y1iUU3OUpwFJMZ3VwojsOHHmiGHwx6t9MRqZZAST8AZOtymG4GdGBYRXEZMSe+5U1oBNrUJo6
	jbVlVzRWryBoz1Jbd7xUfFF3XI4yrso5PI9MeVBEA6fWgxOOyVCpE7E7tDTEM/0VTz6oPlMxCP9
	322fnGqJyuFEsiDHzECI+zjLOKokI9GfKpgnnd1+
X-Received: by 2002:a17:90b:578c:b0:33b:bed8:891c with SMTP id
 98e67ed59e1d1-3568f8b88famr129349a91.23.1770831351898; Wed, 11 Feb 2026
 09:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20260126034434.4242-1-liuyd.fnst@fujitsu.com> <CADkTA4OmUhcmcLHtCD8uGBA+u3UT4PtKx-BuuZryD6LAvUo2Bg@mail.gmail.com>
 <TY3PR01MB10110601F0DF398F5ABB600FA9B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CADkTA4MrXa7_+AAtb+CaTFqf9w61exv4aLQcxF5T5CvaFkMFvQ@mail.gmail.com> <DB5PR02MB10213487F3C04A7F5A1806158EF63A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213487F3C04A7F5A1806158EF63A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Feb 2026 12:35:39 -0500
X-Gm-Features: AZwV_QhZV3aMsBju0NP1e2QmWjQEsQnm3r6VL9CSOuL4EvlP62SVJs4j-8f9J1I
Message-ID: <CADkTA4P5cGt5zHH5JJm35TEvj_J4cdkSPqG9-NJeCQ5U2S+Pyw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd]
 parameter
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000afe479064a8fcdb4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9579

--000000000000afe479064a8fcdb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We'll agree to disagree :)

Bruce

On Wed, Feb 11, 2026 at 10:58=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Umm, I would argue that the initially proposed patch is correct (except
> for a better explanation in the commit message). If the
> --with-pkgconfdir=3D${sysconfdir}" shall be set both with and without
> systemd enabled, then adding it to EXTRA_OECONF is the correct thing to
> do as it shall always be set regardless of any PACKAGECONFIG.
>
>
>
> //Peter
>
>
>
> *From:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Bruce Ashfield
> via lists.yoctoproject.org
> *Sent:* den 11 februari 2026 15:12
> *To:* Yiding Liu (Fujitsu) <liuyd.fnst@fujitsu.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization][PATCH] irqbalance: Fix
> PACKAGECONFIG[systemd] parameter
>
>
>
>
>
>
>
> On Wed, Feb 11, 2026 at 2:09=E2=80=AFAM Yiding Liu (Fujitsu) <
> liuyd.fnst@fujitsu.com> wrote:
>
> Hi Bruce
>
>
>
> >Which is what that first field is trying to do. So is there an
>
> issue in the configure that isn't passing it through ? Is it
>
> the combination of that plus our EXTRA_OECONF ?
>
>
>
> There is no issue with "PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},,,"
>
>
>
> But it only works when using systemd, so in that condition, there is no
> do_package QA Issue about install path.
>
>
>
> When using sysvinit, PACKAGECONFIG[systemd] can't work, so I need to make
> this patch to fix it.
>
>
>
> I want to make "=E2=80=94with-pkgconfdir=3D${sysconfdir}" works for both =
systemd and
> sysvinit.
>
>
>
>
>
> This is the information that needs to be in the commit message. The goal
> of fixing the
>
> QA error when sysvinit is used.
>
>
> But since the packageconfig has a field for adding the options when the
> packagconfig is
>
> disabled, then we should be able to collapse everything to something like
> this:
>
>
>
> # when systemd is not enabled in PACKAGECONFiG, we just pass
> --with-pkgconfdir for sysvinit
>
> PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},syste=
md,"
>
>
>
> unless you have both sysvinit and systemd enabled at once.
>
>
>
> Alternatively, we introduce a sysvinit PACKAGE config and pass the option=
s
> there.
>
>
> The packageconfig is self documenting as to why we want the option passed=
,
> versus
>
> moving it to the EXTRA_OECONF.
>
> Bruce
>
>
>
>
>
>
>
>
>
>
>
> Liu
>
>
> ------------------------------
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA**:* Bruce Ashfield <bruce.ashfield@gmail.com=
>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4**:* 2026=E5=B9=B42=E6=9C=885=E6=97=
=A5 09:50
> *=E6=94=B6=E4=BB=B6=E4=BA=BA**:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81=
 <liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81**:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB**=E9=A2=98**:* Re: [meta-virtualization][PATCH] irqbalance: Fi=
x
> PACKAGECONFIG[systemd] parameter
>
>
>
> You don't often get email from bruce.ashfield@gmail.com. Learn why this
> is important <https://aka.ms/LearnAboutSenderIdentification>
>
>
>
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
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', '', d)}"
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
> @@ -34,7 +34,7 @@ PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATUR=
ES',
> 'systemd', 'systemd',
>  #
>  PACKAGECONFIG[numa] =3D
> <$%7b@bb.utils.contains('DISTRO_FEATURES',%20'systemd',%20'systemd',%0b%C=
2%A0#+%C2%A0PACKAGECONFIG[numa]+=3D>
> "--enable-numa,--disable-numa,numactl,"
>  PACKAGECONFIG[libcap-ng] =3D
> "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
> -PACKAGECONFIG[systemd] =3D "--with-systemd
> --with-pkgconfdir=3D${sysconfdir},,,"
>
>
>
> We should explain this change more in the commit message.
>
> irqbalance uses autotools and that's one of the classes that
>
> is supposed to pick up PACKAGECONFIG_CONFARGS.
>
>
>
> Which is what that first field is trying to do. So is there an
>
> issue in the configure that isn't passing it through ? Is it
>
> the combination of that plus our EXTRA_OECONF ?
>
>
>
> Bruce
>
>
>
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
>
>  do_install () {
>          oe_runmake 'DESTDIR=3D${D}' install
> --
> 2.43.0
>
>
>
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000afe479064a8fcdb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">We&#39;ll agree to disagree :)</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 =
at 10:58=E2=80=AFAM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg1169981970747823=
848">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1169981970747823848WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">Umm, I would argue that the i=
nitially proposed patch is correct (except for a better explanation in the =
commit message).
 If the </span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Con=
solas;color:rgb(148,54,52)">--with-pkgconfdir=3D${sysconfdir}&quot;</span><=
span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(148,54,52)">
 shall be set both with and without </span><span lang=3D"EN-US" style=3D"fo=
nt-size:11pt;font-family:Consolas;color:rgb(148,54,52)">systemd</span><span=
 lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif;colo=
r:rgb(148,54,52)">
 enabled, then adding it to </span><span lang=3D"EN-US" style=3D"font-size:=
11pt;font-family:Consolas;color:rgb(148,54,52)">EXTRA_OECONF</span><span la=
ng=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:r=
gb(148,54,52)">
 is the correct thing to do as it shall always be set regardless of any </s=
pan><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;color=
:rgb(148,54,52)">PACKAGECONFIG</span><span lang=3D"EN-US" style=3D"font-siz=
e:11pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)">.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> <a href=3D"mailto:meta-virtu=
alization@lists.yoctoproject.org" target=3D"_blank">meta-virtualization@lis=
ts.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoc=
toproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org=
</a>&gt;
<b>On Behalf Of </b>Bruce Ashfield via <a href=3D"http://lists.yoctoproject=
.org" target=3D"_blank">lists.yoctoproject.org</a><br>
<b>Sent:</b> den 11 februari 2026 15:12<br>
<b>To:</b> Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECON=
FIG[systemd] parameter<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Feb 11, 2026 at 2:09<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>AM Yiding Liu (Fujitsu) &lt;<a href=3D=
"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Hi </span><span style=3D=
"font-size:10pt;color:black">Bruce</span><span style=3D"color:black"><u></u=
><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&gt;</span><span style=
=3D"font-size:10pt;color:black">Which is what that first field is trying to=
 do. So is there an</span><span style=3D"color:black"><u></u><u></u></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;color:black">issue in =
the configure that isn&#39;t passing it through ? Is it<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;color:black">the combi=
nation of that plus our EXTRA_OECONF ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">There is no issue with &=
quot;</span><span style=3D"font-size:11pt;color:black">PACKAGECONFIG[system=
d]=C2=A0=3D &quot;--with-systemd --with-pkgconfdir=3D${sysconfdir},,,&quot;=
</span><span style=3D"color:black"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black"><u></u>=
=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black">But it on=
ly works when using systemd, so in that condition, there is no do_package Q=
A Issue about install path.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black"><u></u>=
=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black">When usin=
g sysvinit, PACKAGECONFIG[systemd] can&#39;t work, so I need to make this p=
atch to fix it.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black"><u></u>=
=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black">I want to=
 make &quot;=E2=80=94with-pkgconfdir=3D${sysconfdir}&quot; works for both s=
ystemd and sysvinit.<u></u><u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">This is the information that needs to be in the comm=
it message. The goal of fixing the<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">QA error when sysvinit is used.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
But since the packageconfig has a field for adding the options when the pac=
kagconfig is<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">disabled, then we should be able to collapse=C2=A0ev=
erything to something like this:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"># when systemd is not enabled in PACKAGECONFiG, we j=
ust pass --with-pkgconfdir for sysvinit<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">PACKAGECONFIG[systemd] =3D &quot;--with-systemd --wi=
th-pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},systemd,&qu=
ot;<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">unless you have both sysvinit and systemd enabled at=
 once.<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Alternatively, we introduce a sysvinit PACKAGE confi=
g and pass the options there.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
The packageconfig is self documenting as to why we want the option passed, =
versus<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">moving it to the EXTRA_OECONF.<br>
<br>
Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black"><u></u>=
=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;color:black">Liu<u></u=
><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"m_1169981970747823848m_900366946418763516divRplyFwdMsg">
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;M=
icrosoft JhengHei&quot;,sans-serif;color:black">=E5=8F=91=E4=BB=B6=E4=BA=BA=
</span></b><b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:black">:</span></b><span style=3D"font-size:11pt;font-family:Calibri,=
sans-serif;color:black">=C2=A0Bruce
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:&quot;Microsoft JhengHe=
i&quot;,sans-serif;color:black">=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4</span>=
</b><b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:b=
lack">:</span></b><span style=3D"font-size:11pt;font-family:Calibri,sans-se=
rif;color:black">=C2=A02026</span><span style=3D"font-size:11pt;font-family=
:&quot;MS Gothic&quot;;color:black">=E5=B9=B4</span><span style=3D"font-siz=
e:11pt;font-family:Calibri,sans-serif;color:black">2</span><span style=3D"f=
ont-size:11pt;font-family:&quot;MS Gothic&quot;;color:black">=E6=9C=88</spa=
n><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:black"=
>5</span><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&quot;;co=
lor:black">=E6=97=A5</span><span style=3D"font-size:11pt;font-family:Calibr=
i,sans-serif;color:black">
 09:50<br>
</span><b><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&quot;;c=
olor:black">=E6=94=B6=E4=BB=B6=E4=BA=BA</span></b><b><span style=3D"font-si=
ze:11pt;font-family:Calibri,sans-serif;color:black">:</span></b><span style=
=3D"font-size:11pt;font-family:Calibri,sans-serif;color:black">=C2=A0Liu,
 Yiding/</span><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&qu=
ot;;color:black">=E5=88=98</span><span style=3D"font-size:11pt;font-family:=
Calibri,sans-serif;color:black">
</span><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&quot;;colo=
r:black">=E4=B9=99=E4=B8=81</span><span style=3D"font-size:11pt;font-family=
:Calibri,sans-serif;color:black"> &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.=
com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&quot;;c=
olor:black">=E6=8A=84=E9=80=81</span></b><b><span style=3D"font-size:11pt;f=
ont-family:Calibri,sans-serif;color:black">:</span></b><span style=3D"font-=
size:11pt;font-family:Calibri,sans-serif;color:black">=C2=A0<a href=3D"mail=
to:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">meta-virtu=
alization@lists.yoctoproject.org</a>
 &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=
=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:&quot;MS Gothic&quot;;c=
olor:black">=E4=B8=BB</span></b><b><span style=3D"font-size:11pt;font-famil=
y:&quot;Microsoft JhengHei&quot;,sans-serif;color:black">=E9=A2=98</span></=
b><b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:bla=
ck">:</span></b><span style=3D"font-size:11pt;font-family:Calibri,sans-seri=
f;color:black">=C2=A0Re:
 [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd] parame=
ter<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100%;text-indent:revert;line-height:revert;white-space:revert;ba=
ckground-color:revert;display:table;margin:revert;height:revert;color:rever=
t">
<tbody>
<tr style=3D"background-color:revert">
<td width=3D"0" style=3D"width:0.3pt;background:rgb(166,166,166);padding:5.=
25pt 1.5pt;text-indent:revert;line-height:revert;white-space:revert;border-=
width:revert;border-style:revert;border-color:revert;word-break:revert;colo=
r:revert;height:revert">
</td>
<td width=3D"100%" style=3D"width:100%;background:rgb(234,234,234);padding:=
5.25pt 3.75pt 5.25pt 11.25pt;text-indent:revert;line-height:revert;white-sp=
ace:revert;border-width:revert;border-style:revert;border-color:revert;word=
-break:revert;height:revert">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:rgb(33,33,33)">You don&#39;t often get email from
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>.
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" target=3D"_blank"=
>Learn why this is important</a><u></u><u></u></span></p>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:rgb(234,234,234);padding=
:5.25pt 3.75pt;text-indent:revert;line-height:revert;white-space:revert;bor=
der-width:revert;border-style:revert;border-color:revert;word-break:revert;=
height:revert">
</td>
</tr>
</tbody>
</table>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">On Sun, Jan 25, 2026 at 10:44<span style=3D"font-fam=
ily:Arial,sans-serif">=E2=80=AF</span>PM Yiding Liu (Fujitsu) via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a>=C2=A0&lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.yocto=
project.org" target=3D"_blank">fujitsu.com@lists.yoctoproject.org</a>&gt; w=
rote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal">irqbalance: correct to install /etc/default for sysv=
init<br>
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
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
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
-DEPENDS +=3D &quot;<a href=3D"mailto:$%7b@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;,%20&#39;systemd&#39;,%20&#39;systemd&#39;,%20&#39;&#39;,%20d)%7=
d" target=3D"_blank">${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;s=
ystemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}</a>&quot;<br>
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
@@ -34,7 +34,7 @@ PACKAGECONFIG ?=3D &quot;<a href=3D"mailto:$%7b@bb.utils.=
contains(&#39;DISTRO_FEATURES&#39;,%20&#39;systemd&#39;,%20&#39;systemd&#39=
;,%0b%C2%A0#+%C2%A0PACKAGECONFIG[numa]+=3D" target=3D"_blank">${@bb.utils.c=
ontains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;systemd&#39;,<br=
>
=C2=A0#<br>
=C2=A0PACKAGECONFIG[numa] =3D </a>&quot;--enable-numa,--disable-numa,numact=
l,&quot;<br>
=C2=A0PACKAGECONFIG[libcap-ng] =3D &quot;--with-libcap-ng,--without-libcap-=
ng,libcap-ng,&quot;<br>
-PACKAGECONFIG[systemd] =3D &quot;--with-systemd --with-pkgconfdir=3D${sysc=
onfdir},,,&quot;<u></u><u></u></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">We should explain thi=
s change more in the commit message.=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">irqbalance uses autot=
ools and that&#39;s one of the classes that<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">is supposed to pick u=
p PACKAGECONFIG_CONFARGS.=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">Which is what that fi=
rst field is trying to do. So is there an<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">issue in the configur=
e that isn&#39;t passing it through ? Is it<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">the combination of th=
at plus our EXTRA_OECONF ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt">Bruce<u></u><u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">+PACKAGECONFIG[systemd]=
 =3D &quot;--with-systemd,,systemd&quot;<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; insta=
ll<br>
--<br>
2.43.0<br>
<br>
<br>
<br>
<u></u><u></u></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">--<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_1169981970747823848gmailsignaturepr=
efix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000afe479064a8fcdb4--


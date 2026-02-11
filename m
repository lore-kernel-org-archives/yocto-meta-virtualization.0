Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED42ECD6D1
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:40:38 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25166.1770831629725717607
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmuhQBpQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2205810a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 09:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770831629; cv=none;
        d=google.com; s=arc-20240605;
        b=gGm8nuJyylGteX7e9sBXTWVQpUUXUgNmeWPDK/auRKVXXbBqsDQ+AgNMByajNn9Cbq
         /bG+eHR2+eVxxe9QF2Ma1aKEPQCUuqY0CWw5zYHFPTVtu6UPOl5eOHHZvzbw4giLDpAk
         y7yEvWHONwWljb1PI21R7DFfMt0HH1RKs3/HQFLC9gMdoJOpq0tcIEHY298+Zt60Zkrj
         Ojsm6oGQxXT13yKEEulImGSQxbK/fyXUK1PDh0d2ZAw47G7IxdguTvG93SqgQkDz0kMf
         WUSwq6ZVtvGuOF6D6Jo4+nwEsaqo0yPeO3/imdelS9B4THeiOWyVPQUkTSdtje/V4ZDu
         cKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PpPHPbTGjbXIPc+9uUAK70RFL9MaANYRIDUsweYmc+c=;
        fh=QDtyf62Y2styJv7atwi1VbtJZWV79E45pt/iuH2MoUQ=;
        b=YN5rvTCdVLCcDDyYJHCgu8e+p1K+WRFQ2A7jY96FpHZn/R6Llqn1EsM6Vs3w5fdNJS
         XUJ7DFyUGrbATptov1GLcmva1Vym+WOT2VEsAy9AgCxgls8qy9qGyuyoOFNHXy9Y5Law
         kam/fFFEgYPc9EukKZ8gSPtNr4KejaPGrYrnXBEom5OK0jSnFV0KC45Kw9lQq9AkXq92
         BASgP0kJt9lEiUdAqD6JoqqbzmM2v42qmfZZEA0JXtYGx1w/f8Z38lbUid/nvQ0unvRP
         Uhyctv8sossA6UH5pa15DCfShgxei6XFGh5M83+6wqslpY29sLsa2muX3iaVkFSYZe+z
         xSjQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770831629; x=1771436429; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpPHPbTGjbXIPc+9uUAK70RFL9MaANYRIDUsweYmc+c=;
        b=hmuhQBpQakyz3tD4fbXQiFnvtHlQZuX2mSMd/w7IoLaX2kAoDliPM1jCl66rzvf8ZL
         WbWwT1EqeCjusDtPdooWsTvD1qPHcDHPPaVpKK7Ltxr3Qwws9/PMrCZEQrVBLNvTDOs4
         k/pYxkjyL4QUucbw1pts2gRmMltGQzX7g4knFSCNmqmriFukcmDI/UwP7AvZ38Bii81v
         Y9J2KY6iQRcAckJWkttHb9otF2LIXhhAwpSF5zka3oEcm/cnUKK+nhfAhGEbbuiNMP19
         MPpczfw5Ul7VB1HwiB1+QEDcYIVAOMhwvvZZcfGLnneThj1+yMc/8L2ff1RFs5iEESBp
         K5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831629; x=1771436429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpPHPbTGjbXIPc+9uUAK70RFL9MaANYRIDUsweYmc+c=;
        b=IKX8Qnrjc+j4ez7oAY+wjuMKN042lqIu5ooCTTQKKuiU/Z5rN8nTSTWvSGgTq3uL+S
         mf81mf1VLvh0gly/Lhj0Wf4UGFHBCgp2oy6WraKdxjc+Kw5aYtoqo91f9DU0JF7nXakG
         E7V9BJPFkHvW2s7+yIj49zBGMbj97J0/Gf0AGvo2nOzQg2QD9YZiUBXdZf7giXlH2JvS
         yzYBRpzMKYZYfGH3cWGnFEYGyhDc2YJfiKn2KDrXRJQqy3rLCamo2bMvGGqidVHe/HLd
         yFz47g5UjHKrihqOxwD+akRfq98OGy2CaJzO+DAkEt7l9ESNQUX0ZtFoRDzd9SipoxHE
         dYag==
X-Forwarded-Encrypted: i=1; AJvYcCUlLA9kC8JbHuejA89u+oFRjhNFTJL7rnc/b1qdWbU07eY9xm2UH+ovVOhRSDU532//BcZ0TtrXQIkNHfdtTUy6LdrU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwsrRYQZ2BhzP5Rhuruye+a2VgdKu372t/zP1GIwYK/WaImYNSj
	I2bqJJhQ6bNAshhALsKyQHakGlO13YDkmhX4B3B7SdFdkHv9HMwn/93hKFEKyRNrSpy5aHdfboe
	cUwSXG2+r1Noe4QVA2/cuA7ww/mhwB84=
X-Gm-Gg: AZuq6aJm25PpKawnXwpsVomeXNnPEpFOV93wBbZwW/2or5/sGPopxkq8QJvXvUwyuhe
	Ehk532JtvnCXQWBYv0t/+7dNHwjj28Qb4mx3oDAKJliuK8xzpNMpVw0PrmfexWHRQvNJeO/El5j
	NwBmU77U8Em5R4bbIqdWV+XIK6ncauGNZ9P8oqkyM8M5MDNcjzwgQyj9ejiaWQc6by+WbedXajB
	xDTmGtp9n02hhiJz1NwVZS7KRAqMYMmJfRA1MdfSQ7HJ66syNxzWX8M4xQHWdHQ3Ei2byKJWqzn
	/kBv9TPWJFCj0H9aqTqhoBpungvcheR2zcepzHcx
X-Received: by 2002:a17:90b:3503:b0:352:c995:808a with SMTP id
 98e67ed59e1d1-3568f327382mr146431a91.14.1770831628992; Wed, 11 Feb 2026
 09:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20260126034434.4242-1-liuyd.fnst@fujitsu.com> <CADkTA4OmUhcmcLHtCD8uGBA+u3UT4PtKx-BuuZryD6LAvUo2Bg@mail.gmail.com>
 <TY3PR01MB10110601F0DF398F5ABB600FA9B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CADkTA4MrXa7_+AAtb+CaTFqf9w61exv4aLQcxF5T5CvaFkMFvQ@mail.gmail.com>
 <DB5PR02MB10213487F3C04A7F5A1806158EF63A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <189341BBB2E2D2DD.653184@lists.yoctoproject.org>
In-Reply-To: <189341BBB2E2D2DD.653184@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Feb 2026 12:40:17 -0500
X-Gm-Features: AZwV_QiGHYFu1NBR1nECEublPJfsn5gJL6AVz2a46iXKVmuRUZ3WjaOnjYHvIec
Message-ID: <CADkTA4MUSs21j0ML=ET6kw2j+4WOa7=SL12R5DmYQkj4=XGJfw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd]
 parameter
To: bruce.ashfield@gmail.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000340431064a8fdef7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:40:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9580

--000000000000340431064a8fdef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 12:35=E2=80=AFPM Bruce Ashfield via lists.yoctoproj=
ect.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

> We'll agree to disagree :)
>

I should add that I didn't dig into if the false case of the systemd
packageconfig runs when it isn't set.  If it doesn't then yes, obviously we
need it somewhere else.

I'd very much prefer a sysvinit package config if someone is enabling this,
and not using systemd.  So the false case doesn't really matter from that
point of view.

Bruce



>
> Bruce
>
> On Wed, Feb 11, 2026 at 10:58=E2=80=AFAM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> Umm, I would argue that the initially proposed patch is correct (except
>> for a better explanation in the commit message). If the
>> --with-pkgconfdir=3D${sysconfdir}" shall be set both with and without
>> systemd enabled, then adding it to EXTRA_OECONF is the correct thing to
>> do as it shall always be set regardless of any PACKAGECONFIG.
>>
>>
>>
>> //Peter
>>
>>
>>
>> *From:* meta-virtualization@lists.yoctoproject.org <
>> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Bruce
>> Ashfield via lists.yoctoproject.org
>> *Sent:* den 11 februari 2026 15:12
>> *To:* Yiding Liu (Fujitsu) <liuyd.fnst@fujitsu.com>
>> *Cc:* meta-virtualization@lists.yoctoproject.org
>> *Subject:* Re: [meta-virtualization][PATCH] irqbalance: Fix
>> PACKAGECONFIG[systemd] parameter
>>
>>
>>
>>
>>
>>
>>
>> On Wed, Feb 11, 2026 at 2:09=E2=80=AFAM Yiding Liu (Fujitsu) <
>> liuyd.fnst@fujitsu.com> wrote:
>>
>> Hi Bruce
>>
>>
>>
>> >Which is what that first field is trying to do. So is there an
>>
>> issue in the configure that isn't passing it through ? Is it
>>
>> the combination of that plus our EXTRA_OECONF ?
>>
>>
>>
>> There is no issue with "PACKAGECONFIG[systemd] =3D "--with-systemd
>> --with-pkgconfdir=3D${sysconfdir},,,"
>>
>>
>>
>> But it only works when using systemd, so in that condition, there is no
>> do_package QA Issue about install path.
>>
>>
>>
>> When using sysvinit, PACKAGECONFIG[systemd] can't work, so I need to mak=
e
>> this patch to fix it.
>>
>>
>>
>> I want to make "=E2=80=94with-pkgconfdir=3D${sysconfdir}" works for both=
 systemd
>> and sysvinit.
>>
>>
>>
>>
>>
>> This is the information that needs to be in the commit message. The goal
>> of fixing the
>>
>> QA error when sysvinit is used.
>>
>>
>> But since the packageconfig has a field for adding the options when the
>> packagconfig is
>>
>> disabled, then we should be able to collapse everything to something lik=
e
>> this:
>>
>>
>>
>> # when systemd is not enabled in PACKAGECONFiG, we just pass
>> --with-pkgconfdir for sysvinit
>>
>> PACKAGECONFIG[systemd] =3D "--with-systemd
>> --with-pkgconfdir=3D${sysconfdir},--with-pkgconfdir=3D${sysconfdir},syst=
emd,"
>>
>>
>>
>> unless you have both sysvinit and systemd enabled at once.
>>
>>
>>
>> Alternatively, we introduce a sysvinit PACKAGE config and pass the
>> options there.
>>
>>
>> The packageconfig is self documenting as to why we want the option
>> passed, versus
>>
>> moving it to the EXTRA_OECONF.
>>
>> Bruce
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> Liu
>>
>>
>> ------------------------------
>>
>> *=E5=8F=91=E4=BB=B6=E4=BA=BA**:* Bruce Ashfield <bruce.ashfield@gmail.co=
m>
>> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4**:* 2026=E5=B9=B42=E6=9C=885=E6=97=
=A5 09:50
>> *=E6=94=B6=E4=BB=B6=E4=BA=BA**:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=
=81 <liuyd.fnst@fujitsu.com>
>> *=E6=8A=84=E9=80=81**:* meta-virtualization@lists.yoctoproject.org <
>> meta-virtualization@lists.yoctoproject.org>
>> *=E4=B8=BB**=E9=A2=98**:* Re: [meta-virtualization][PATCH] irqbalance: F=
ix
>> PACKAGECONFIG[systemd] parameter
>>
>>
>>
>> You don't often get email from bruce.ashfield@gmail.com. Learn why this
>> is important <https://aka.ms/LearnAboutSenderIdentification>
>>
>>
>>
>>
>>
>> On Sun, Jan 25, 2026 at 10:44=E2=80=AFPM Yiding Liu (Fujitsu) via
>> lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
>> wrote:
>>
>> irqbalance: correct to install /etc/default for sysvinit
>>
>> 1. This commit uses option --with-pkgconfdir to correct to install
>> /etc/default
>>    Without this fix, there will show do_package QA Issue
>>    ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance:
>> Files/directories were installed but not shipped in any package:
>>      /usr/etc
>>      /usr/etc/default
>>      /usr/etc/default/irqbalance.env
>>
>> 2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]
>>
>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>> ---
>>  recipes-extended/irqbalance/irqbalance.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-extended/irqbalance/irqbalance.inc
>> b/recipes-extended/irqbalance/irqbalance.inc
>> index 35b6388e..b7b34a0b 100644
>> --- a/recipes-extended/irqbalance/irqbalance.inc
>> +++ b/recipes-extended/irqbalance/irqbalance.inc
>> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>>                    "
>>
>>  DEPENDS =3D "glib-2.0"
>> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>> 'systemd', '', d)}"
>>
>>  INITSCRIPT_NAME =3D "irqbalanced"
>>  INITSCRIPT_PARAMS =3D "defaults"
>> @@ -25,6 +24,7 @@ SYSTEMD_PACKAGES =3D "irqbalance"
>>  SYSTEMD_SERVICE:irqbalance =3D "irqbalance.service"
>>
>>  EXTRA_OECONF =3D "--program-transform-name=3D \
>> +                --with-pkgconfdir=3D${sysconfdir} \
>>                "
>>
>>  # let the recipes or appends define options
>> @@ -34,7 +34,7 @@ PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATU=
RES',
>> 'systemd', 'systemd',
>>  #
>>  PACKAGECONFIG[numa] =3D
>> <$%7b@bb.utils.contains('DISTRO_FEATURES',%20'systemd',%20'systemd',%0b%=
C2%A0#+%C2%A0PACKAGECONFIG[numa]+=3D>
>> "--enable-numa,--disable-numa,numactl,"
>>  PACKAGECONFIG[libcap-ng] =3D
>> "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
>> -PACKAGECONFIG[systemd] =3D "--with-systemd
>> --with-pkgconfdir=3D${sysconfdir},,,"
>>
>>
>>
>> We should explain this change more in the commit message.
>>
>> irqbalance uses autotools and that's one of the classes that
>>
>> is supposed to pick up PACKAGECONFIG_CONFARGS.
>>
>>
>>
>> Which is what that first field is trying to do. So is there an
>>
>> issue in the configure that isn't passing it through ? Is it
>>
>> the combination of that plus our EXTRA_OECONF ?
>>
>>
>>
>> Bruce
>>
>>
>>
>> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
>>
>>  do_install () {
>>          oe_runmake 'DESTDIR=3D${D}' install
>> --
>> 2.43.0
>>
>>
>>
>>
>>
>>
>>
>> --
>>
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>>
>> --
>>
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9579):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9579
> Mute This Topic: https://lists.yoctoproject.org/mt/117756607/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000340431064a8fdef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 12:35=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small">We&#39;ll agree to disagree :)=
</div></div></div></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I should add that I didn&#39;t dig into if t=
he false case of the systemd packageconfig runs when it isn&#39;t set.=C2=
=A0 If it doesn&#39;t then yes, obviously we need it somewhere=C2=A0else.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I&#39;d very much prefer a=
 sysvinit package config if someone is enabling=C2=A0this, and not using sy=
stemd.=C2=A0 So the false case doesn&#39;t really matter from that point of=
 view.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div><div =
style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 10:58=E2=80=AF=
AM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" ta=
rget=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>





<div lang=3D"SV">
<div>
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
<div id=3D"m_2032840586552836071m_1169981970747823848m_900366946418763516di=
vRplyFwdMsg">
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
<p class=3D"MsoNormal"><span>-- </span><u></u><u></u></p>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9579): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9579" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9579</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117756607/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117756607/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000340431064a8fdef7--


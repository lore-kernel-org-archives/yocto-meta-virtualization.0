Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379CBEDF033
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:58:12 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38626.1770872291308522503
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PrnHUa74;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3566af9900eso1402766a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770872291; cv=none;
        d=google.com; s=arc-20240605;
        b=HYhBLkjy1fWkuri44OIR0XNiHGck7RELtQnX7NIoxtSGcalWfRo5yw3WY1CFKi0nqM
         DjWx8Dw4JNQDqJpef0XX/OBsun1+dgIIr1MvLsE1/XdHUmesXQ6eYOLdUc3NPS3E7AVM
         iRUQfTjyWPLInXLDbiFlLCk0gTSSJVQWmJt6+5lTaDdlJz4n3t9vcI0hHL8/1LRC4xic
         MDPhMmBMCo3IWQnO+OfE+wPimdS0vAW6oDndqmePIs2k3w+4IaKQA94DOg5uSP63aHZx
         7YAiCih7z8SssYygHBDAfpgfNFyZi9QDt0v5i5t/gQGu+JW/LgxyYws/1jXXd0tv9p9y
         pjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r5qbNrx4jVk9l1tJE6vOEhIpMK0TcabZGlfwa70qsSI=;
        fh=AM0Lh1mhShPEq+MJz0fQHTFj3HBz41gIBrERNtzZEzc=;
        b=KYMcHSWxh0b0/zPcn6tMcQaVugsDsOa2Wq5E+AxjYntkMaz7jhpL2b/azAWbgbNHzu
         VZnVrIWUgGKqBIPTfL0EXzFeHSsnOCTTvTpR/09UyC3q1JbJxNRylLjkmkCpi98N7p+P
         BaQhXi5Q6caMrO+DE4UBlo7uOm5Iu52fAwJx1NxMXEuw+cn7Q8OcCV6U8aEMBSKH3ruL
         G2JBuMJZFIor+lNJAojBJ1+AeXzpGndj38ItDcplf18PBSPdp/hbVtE3hN20sBc/EsU9
         yA0fFmEGPmE5MzD7kbZ3BpMWNf2Ck68misuC5GgHfZQT+41XdKC1KssV6XiOaIX7bOJg
         cQHg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770872291; x=1771477091; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5qbNrx4jVk9l1tJE6vOEhIpMK0TcabZGlfwa70qsSI=;
        b=PrnHUa74hY1G620rDB4VKLPVnL/ZPKsBXcv3ecsGrSO+wubVrRlMlAuUchCoakHhUf
         rvu5xCSkWjjdz0yd0JwYToUogs6G6GWSJ2H+83ASg3Qdebe/kfCNGTo/BNTh3tbjlLyb
         VD5psMzdxss4ShCSGqT/4op8ttylt0Q0gIS+B5DyUyqAfK0ggLWm+zXzEztuZd2u9nZy
         VL2q8zNuP4TEfvmhIXYa8QvI+rXTBPPgrfTDIUUmsYR/4Rjl6iDgmUzz11MPZh8ihxbQ
         Geui8ZPcp8lE266T68Fyco+11Gy5P/ZPRAL8GbcEbfGO2LB7S2Du8uEI6FXibJwf0EMR
         W3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770872291; x=1771477091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5qbNrx4jVk9l1tJE6vOEhIpMK0TcabZGlfwa70qsSI=;
        b=kAYP6xgipLBPAa9/GknkPhQo0KnHH4t/u/HsGiSQV/9qhN0U4AeHCpRZWo2rxPjsGV
         sjZqTWeFxLorileGjwiELhex7it483w9d6vpfDRD8jiiiPNlhe02oXH25zQBniEkYg+A
         nlkmbeA0a5mUg9FZZ4OAwGZHhbT/RG8aVRt6RfevTPoCPKUv2XZtELtwVJtFMP6Bhmuq
         KlRvIyTpByMvkd2e0Gsa1QB99icCLMAmyYNs9uytKl0dc7GYQ+DLjQ4lqrlxgV1AQQEe
         kQDL2QczchdLVBYgngpyBwEB521k0BXhB0BJ/jCKxV0T/aSNzFmyUGgrMTpPazdH0U87
         yoXQ==
X-Gm-Message-State: AOJu0YziyxJWV/di/3UuFN+gT+MokU1LWJKnMbcqFYvp9nZsRTHQpKiJ
	EF4ZROpeTfOmWjFi1/BuwsuRVZ8e6Fb92rwKtCmYLDGhg8cWNQ+5ya+vEpQVwzbWlwemdIN6py6
	v2EZ4gfzUEDZIYyVqVPMuBDeGh6Jg/mw=
X-Gm-Gg: AZuq6aJ2Yl2pLWg4HyNlRYUrLNWQyUyct7SwSYge0OVZ3HCY2bP3y06q1Ea0HayukaQ
	hQin5UoXHVYdB5mQV09xGRY6jZhvueOrmEP5d6ItvGNU50xi8xj3UVvvFKhWKFUXGyYVMYJiC7L
	/pzBouhqIjg9DTEdxSiKZ3WoSmRr2SB9fwWufDSHEun0Z+Y8r8R3VU/LPc5//LNlh0KKTPrx+9g
	8hrUcH1gTx1tXwisYpHeJsyNEd3k4jwF0ufBzulkcR/xQ5M/N/hJdQex5DJL7W3maowyeLXw1pu
	rygZ3/ePeD/hVJ2tP9bThQqx4UN4LBp8jFQQIXA7
X-Received: by 2002:a17:90b:2f04:b0:356:2bdb:a375 with SMTP id
 98e67ed59e1d1-35693ccf0admr881602a91.14.1770872290508; Wed, 11 Feb 2026
 20:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20260212030943.15928-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260212030943.15928-1-liuyd.fnst@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Feb 2026 23:57:59 -0500
X-Gm-Features: AZwV_QjUTjYnnviT9rhQPtXwdE-GsvnBwZTIv6LfgKIRnGlKIP7jr_1JEqrWzdA
Message-ID: <CADkTA4OJvf=TS9-UmrOd-cRLaGuDXT50f4oaCrNV41Ww5_kGgw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when
 sysvinit is used
To: liuyd.fnst@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d18418064a9955a9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9583

--000000000000d18418064a9955a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 10:09=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
wrote:

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
You need to address my review comments directly.

Also, summarize what has changed in a v2 below the --- in the patch itself.

Cheers,

Bruce



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

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d18418064a9955a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 10:09=
=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.yoctoproject.o=
rg">lists.yoctoproject.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.c=
om@lists.yoctoproject.org">fujitsu.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">irqbalance: co=
rrect to install /etc/default for sysvinit<br>
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
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">You need to address my review comments directly.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Also, summarize what has changed i=
n a v2 below the --- in the patch itself.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
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
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9582): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9582" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9582</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117769267/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117769267/1050810</a><br>
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

--000000000000d18418064a9955a9--


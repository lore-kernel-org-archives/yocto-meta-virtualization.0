Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C087DEA7952
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 01:51:16 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11457.1770256269611036606
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 17:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrZRgvrW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c718c5481so192870a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 17:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770256269; cv=none;
        d=google.com; s=arc-20240605;
        b=WmW7sRSCJnkKttnUBKkhJ5PumRuKdCJJ6V0yDz8vvbJLIA8vrlnESmfwIO0SOBEZmA
         bKdMugF033Q0Nw9G+UmhfXA9r5EIo/4yArL6q/BxDgy8djMAOFUHTtZOWYzKZxUOXru7
         COGl4LxCYWnp7O7ssXrWOR/hdrvtgkcCp7S/5nZHiHFuvohOORKF8WyzhUNrALW9E3UU
         RC7r03o3BvjomW0S4guub7PrwOTCkIE+NlGF/eD3IGFBtHXMnsmKr2anlkEOZ+ikgbDt
         e9wt31EDFQEpI7pjI28+EQt2vQI2LegSEd8ptzL6/FaSFs5bmF2nPsMfXD7bwDrrR8/1
         gdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Xdxzt/JsCps2BFG9ucoQq0zfeILOhfFyjCQKzUKm64=;
        fh=AM0Lh1mhShPEq+MJz0fQHTFj3HBz41gIBrERNtzZEzc=;
        b=fMBBDUToqvVM5Bf/mxAZXhC1KA/Ii/kAdnu7q/jBPop3Pc8fENFK2ejJVwhdAWsmco
         3hpMDWWKd2oYMD5kdDhqXN0kFZxrtmIvFpAPtqesTDxDsczEG9/lERw69TMB9WP7AbUg
         3Nh1DqTOGnIx/qdsphCc2+w75N3jDUCbGuFywUCXYvDaEKugAXi7/ApvpgFOGIjyEMcn
         sY93I7E81I6FeSivumOSDFV1L2VzVL+39jwbxX9X6k8hcBKKFAedwaHAhgkIuWlHN54a
         3XAk6jQNwV2gZey3pTTdZUL3/lxw88uEiwrQN6wmuKh9Zx7TeNy9BJ7sLvvvyM0Dl1FT
         1muw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770256269; x=1770861069; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Xdxzt/JsCps2BFG9ucoQq0zfeILOhfFyjCQKzUKm64=;
        b=JrZRgvrWeB6Ol/VrUjuVc/14JyBqsN6mBs9yItouUr2qJvbIEUAiuIQw19dcVE+67l
         ceVne8zDvQkML4aUXFbVEo9KGRJpmPLsM2SGl31QIIlNK3rWqXIyj/dybq+c4FR9YL/t
         kjg0VWqXxe3wQPNhEu44eMrtE5vQ+03+Q0yvD1ghXYgQcYmzAdo1GwbsyNQ6Rnnp78kK
         D4tSNtIKUojCxM7p/8gE3ImlSw8zHNJ3U69GXomEwoeGyCa7IdKOQjvoPTN3XZ1clKF6
         vpyi8XcKvXwJ7ehTaSELt19miW9dLXz1hUhgHiBbGntNt1I3HM7AtzUoh8OCf/lJjtpf
         siSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770256269; x=1770861069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Xdxzt/JsCps2BFG9ucoQq0zfeILOhfFyjCQKzUKm64=;
        b=qD8PRLxOHKihWbP0QA8QRWm6GmaBPpTxyIDtk9BqBpa8NiIuVagE9ZxZ1lUVW8u5EX
         hnYCrokLLkjVMYT45HRwpxJmVw+y7a3nz4+kvyCjnm4ZQ0YUxNZSHY1F3mX/f8r/w9ix
         QQg87oUn+wTcz7+rTCJhS9SVBhPvCzyaK3bYyl8D3Nzo0RKf+eDhULNGTx+x7jyOJn3I
         febbcHBXmOH3SB+42nKky82c4VXlSpMH9RMDsTGzpooIJ651lCCKDbxV10YBexEdba8P
         O+7R0SfpClxpOFDU3xRQLCAW2kB7vu8rw/LY1VxpWCk7broH4xE1JIcee+pNKBlTG20/
         67bQ==
X-Gm-Message-State: AOJu0Yw3L8cDczBioV9AUAZ4bfi2EowVFYnyxpPWjtwOFjyzGJCIpWa2
	+Bz1hpReMK/OGN1hcD3mklLgVrfGV/UTA91CJtQ/8P9WyjYXMZ27YwguWN88o8OxmGqY2PHE1uW
	2fihlMQPLoU3vHGhkQah+k7eQfnxuw/k=
X-Gm-Gg: AZuq6aK3DbEA+0FwKsDXlJewGxsGegCUacaBVBMQdVDz/2EU2FbugXi8e9LMCqkRFdb
	75udD0iTI4TvOGrXxacX25YulLWnN0Ez2xElHBMefeLSUyOyUCTZKcrvNUjy/fhTL5wh/8AJqij
	TLIHIjHQtCpCIVjsvtbkdsSEn8E9kJbOSiT3+neIHLiKMaKpEka2/YnsZ6q+yqMz9KNUGAfz8dz
	BxnWFZZDCNI+Bi+hYh58u7/MPgHGVTqhS4QuXwkJ1TEloW6fhT2dYeBomQbyQUImTW/Quovs3f4
	DdXbpJ78HfiR5TyrtjQvMjClkRCW
X-Received: by 2002:a17:90b:5870:b0:33b:a906:e40 with SMTP id
 98e67ed59e1d1-354870a5b6fmr4254200a91.2.1770256268864; Wed, 04 Feb 2026
 17:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20260126034434.4242-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260126034434.4242-1-liuyd.fnst@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 20:50:57 -0500
X-Gm-Features: AZwV_QjpsSEnxeXEd5qq3lWzP7TRJ39f9HD7Klv6qfzEaLxSy8xYl32hONQQ6oo
Message-ID: <CADkTA4OmUhcmcLHtCD8uGBA+u3UT4PtKx-BuuZryD6LAvUo2Bg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd]
 parameter
To: liuyd.fnst@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000011304f064a09e898"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Feb 2026 01:51:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9559

--00000000000011304f064a09e898
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 10:44=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
wrote:

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

We should explain this change more in the commit message.
irqbalance uses autotools and that's one of the classes that
is supposed to pick up PACKAGECONFIG_CONFARGS.

Which is what that first field is trying to do. So is there an
issue in the configure that isn't passing it through ? Is it
the combination of that plus our EXTRA_OECONF ?

Bruce

+PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
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

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000011304f064a09e898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 25, 2026 at 10:44=
=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.yoctoproject.o=
rg">lists.yoctoproject.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.c=
om@lists.yoctoproject.org">fujitsu.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">irqbalance: co=
rrect to install /etc/default for sysvinit<br>
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
onfdir},,,&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">We should explain this change more in the =
commit message.=C2=A0</div></div><div class=3D"gmail_default" style=3D"font=
-size:small">irqbalance uses autotools and that&#39;s one of the classes th=
at</div><div class=3D"gmail_default" style=3D"font-size:small">is supposed =
to pick up PACKAGECONFIG_CONFARGS.=C2=A0</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Which is what that first field is trying to do. So is there=
 an</div><div class=3D"gmail_default" style=3D"font-size:small">issue in th=
e configure that isn&#39;t passing it through ? Is it</div><div class=3D"gm=
ail_default" style=3D"font-size:small">the combination of that plus our EXT=
RA_OECONF ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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
View/Reply Online (#9552): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9552" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9552</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117463389/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117463389/1050810</a><br>
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

--00000000000011304f064a09e898--


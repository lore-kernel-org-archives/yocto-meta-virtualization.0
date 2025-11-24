Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A34CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 00:03:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5344.1763942633049588817
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Nov 2025 16:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYZUkdL4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34585428e33so3685598a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Nov 2025 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763942632; x=1764547432; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JCySKyvKogaOHIuwLU4j9szzkv58PXQV/b+fS0XssU4=;
        b=fYZUkdL4YxxXRa5N446DQtJXX9v/mrtbtXp2t7QiS8fF2rQRBUdRrYPT0KPPb0MqMw
         fyh7gN2TOPtZmuK0gabqTaxZj8/2ZCsFnmgkYTwsQOitLfOGUSik3MoWcchrqJCBwx4h
         k0QpxVQI5YZFdZbBA69bOvKLw9engaW7VuZIeaj/UOY47aKYOMLwh9bZF49Oi6M5vgqZ
         G+chQXNFrIEwL8Q4O8qXdEufO8V5WlZLU5r1ZJFLVjlxw0/4FhU6k6U3phBcZm2+KLQ8
         jniEP+MjkSFiwmCFt7Z1cInDN43poiHgQeOausZ4eIi0Sj/QzvENG7CyfWz0pIIN6ugN
         r9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763942632; x=1764547432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCySKyvKogaOHIuwLU4j9szzkv58PXQV/b+fS0XssU4=;
        b=XtYJDYBh66FlnVCq5K3iYBjuOIlSL7eIHEOaSlbbQ4/Hw5HUbIIS8apWoAk08ARS9V
         LSm/CzwxgElUmKtEe5iqqTk1Pvzxs7MNC+omAVdw/Rkli8wqr6oT5XtURfgLswH3IqQJ
         jkUgdgvQavwbwwBV0WZV5mgEBkrcARH2dHKILF2qiVuIzPEcg5aTGHmT+58m7d7PrMQE
         GBp18Gl9SYqon+L5YR1NK5HY6pe30fPL6/IU46DDvEZcfe22QpFVd6xbr2WIs8hDck+5
         9D45ZxCKaobL9w+zUrwcQ3ba5lMrBs94CvdmYurHmH8qnOzmRD9qmI/qiOJDCRWozt4o
         DuQw==
X-Gm-Message-State: AOJu0Ywqz/89kQ+jthakglI7NYJ3k4PJaCS4Nornsr6GIgyzF8UeNJVz
	hQyEW98iIHF9CcOzdsBgM6lKUaIYVTIniwh9rpcpSaof4bL7s5wxO/LumtVneIo3MH5W9u7+OqA
	lY4nin0ABcc3awz7wfLqITDPKcqe8cw2yQYhW
X-Gm-Gg: ASbGncvLulsfT/K4UTi/HkZmlKMO/roy/1k7jwCR8ve2+FxogWfb8foQ0w4VQp1MnTm
	9Wxru5gZwKWOyO1vOKvt1dTXyu1DM5lBVJHCIrOhhr69pn8Ceo+L3I8gOZcNO0yetAJD54C/ol8
	CWAYTJ13juUVQtim8GKjTxHYKnLuTuHTpHJhlJi23mSJoPeBhGMoRUAruLbSiWO5K06hQ7vgWqI
	/ag9tDV9W/PV/46ng26iMC3DAMza8EfuACjOVB7W+0NCmyeAerT+ymhpikBn4m+SzHDiw6U
X-Google-Smtp-Source: AGHT+IGJi3qZCRQKJjXW7toVYi2EoA0TJbqO9E/NsR1dy+tSakn9WNuESZnf66finPiMghERlYHz5ieERONDKd8PP5g=
X-Received: by 2002:a17:90b:4c48:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-34733f3f6d5mr8583646a91.36.1763942632246; Sun, 23 Nov 2025
 16:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20251123164444.3343229-1-kai.kang@windriver.com>
In-Reply-To: <20251123164444.3343229-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 23 Nov 2025 19:03:40 -0500
X-Gm-Features: AWmQ_bmstXkkhENtpOa2FDIqPS2uF9XJ5TE7G9DS79gzCwQA2NEPfcfjYiCY3JQ
Message-ID: <CADkTA4Px0_OGgvGk+kmnHMxf57z=sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: rdepends on iproute2-tc
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ffd1d906444be548"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Nov 2025 00:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9455

--000000000000ffd1d906444be548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 11:44=E2=80=AFAM Kai Kang via lists.yoctoproject.or=
g
<kai.kang=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> When nftables exists, libvirt uses it as default firewall backend. Then
> it requires command `tc` to start default network interface:
>
> libvirtd[653]: Cannot find 'tc' in path: No such file or directory
>

Which implies that the dependency should be conditional.



>
> And tweak formats at same time, including replace tab with spaces for
> indent and remove trailing whitespaces.
>

When you write a commit message like that, you can probably guess
what I will say.

Keep the whitespace patch separate, and chances are, that I'd rather
just leave it as-is, since it makes git blame annoying to diagnose
issues.

Bruce



>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_git.bb
> b/recipes-extended/libvirt/libvirt_git.bb
> index 681ceade..552c5ffe 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION =3D "A toolkit to interact with the virtualization capabilit=
ies
> of recent versions of Linux."
> +DESCRIPTION =3D "A toolkit to interact with the virtualization capabilit=
ies
> of recent versions of Linux."
>  HOMEPAGE =3D "http://libvirt.org"
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> @@ -6,16 +6,16 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>  SECTION =3D "console/tools"
>
>  DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
> -          iptables dnsmasq readline libtasn1 libxslt-native acl
> libdevmapper libtirpc \
> +           iptables dnsmasq readline libtasn1 libxslt-native acl
> libdevmapper libtirpc \
>             python3-docutils-native \
> -          ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> 'shadow-native', '', d)} \
> -          ${@bb.utils.contains('PACKAGECONFIG', 'gnutls',
> 'gnutls-native', '', d)}"
> +           ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> 'shadow-native', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'gnutls',
> 'gnutls-native', '', d)}"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
>  RDEPENDS:${PN} =3D "gettext-runtime"
>
> -RDEPENDS:libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
> netcat-openbsd ebtables"
> +RDEPENDS:libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
> netcat-openbsd ebtables iproute2-tc"
>  RDEPENDS:libvirt-libvirtd:append:x86-64 =3D " dmidecode"
>  RDEPENDS:libvirt-libvirtd:append:x86 =3D " dmidecode"
>  RDEPENDS:libvirt-libvirtd:append:arm =3D " dmidecode"
> @@ -232,7 +232,7 @@ do_install:append() {
>                    ${D}/${systemd_system_unitdir}/libvirtd.service
>         fi
>
> -       # The /run/libvirt directories created by the Makefile are
> +       # The /run/libvirt directories created by the Makefile are
>         # wiped out in volatile, we need to create these at boot.
>         rm -rf ${D}/run
>         install -d ${D}${sysconfdir}/default/volatiles
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9454):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9454
> Mute This Topic: https://lists.yoctoproject.org/mt/116438591/1050810
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

--000000000000ffd1d906444be548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 23, 2025 at 11:44=
=E2=80=AFAM Kai Kang via <a href=3D"http://lists.yoctoproject.org">lists.yo=
ctoproject.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.com@lists.yoc=
toproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a hr=
ef=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.c=
om</a>&gt;<br>
<br>
When nftables exists, libvirt uses it as default firewall backend. Then<br>
it requires command `tc` to start default network interface:<br>
<br>
libvirtd[653]: Cannot find &#39;tc&#39; in path: No such file or directory<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Which implies that the dependency should be conditional.</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
And tweak formats at same time, including replace tab with spaces for<br>
indent and remove trailing whitespaces.<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">When you write a co=
mmit message like that, you can probably guess</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">what I will say.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Keep the whitespace patch separate, and chances are=
, that I&#39;d rather</div><div class=3D"gmail_default" style=3D"font-size:=
small">just leave it as-is, since it makes git blame annoying to diagnose</=
div><div class=3D"gmail_default" style=3D"font-size:small">issues.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a> | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> b/recipes-extended/lib=
virt/<a href=3D"http://libvirt_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>libvirt_git.bb</a><br>
index 681ceade..552c5ffe 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
@@ -1,4 +1,4 @@<br>
-DESCRIPTION =3D &quot;A toolkit to interact with the virtualization capabi=
lities of recent versions of Linux.&quot; <br>
+DESCRIPTION =3D &quot;A toolkit to interact with the virtualization capabi=
lities of recent versions of Linux.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://libvirt.org" rel=3D"noreferrer" =
target=3D"_blank">http://libvirt.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \<br>
@@ -6,16 +6,16 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted curl =
libpcap util-linux e2fsprogs pm-utils \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libtasn1 libx=
slt-native acl libdevmapper libtirpc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iptables dnsmasq readline libtasn=
1 libxslt-native acl libdevmapper libtirpc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-docutils-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;polkit&#39;, &#39;shadow-native&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gnutls&#39;, &#39;gnutls-native&#39;, &#39;&#39;, d)}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;polkit&#39;, &#39;shadow-native&#39;, &#39;&#39;, d)} \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;gnutls&#39;, &#39;gnutls-native&#39;, &#39;&#39;, d)}&quo=
t;<br>
<br>
=C2=A0# libvirt-guests.sh needs gettext.sh<br>
=C2=A0#<br>
=C2=A0RDEPENDS:${PN} =3D &quot;gettext-runtime&quot;<br>
<br>
-RDEPENDS:libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils dnsmas=
q netcat-openbsd ebtables&quot;<br>
+RDEPENDS:libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils dnsmas=
q netcat-openbsd ebtables iproute2-tc&quot;<br>
=C2=A0RDEPENDS:libvirt-libvirtd:append:x86-64 =3D &quot; dmidecode&quot;<br=
>
=C2=A0RDEPENDS:libvirt-libvirtd:append:x86 =3D &quot; dmidecode&quot;<br>
=C2=A0RDEPENDS:libvirt-libvirtd:append:arm =3D &quot; dmidecode&quot;<br>
@@ -232,7 +232,7 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/$=
{systemd_system_unitdir}/libvirtd.service<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# The /run/libvirt directories created by the M=
akefile are <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# The /run/libvirt directories created by the M=
akefile are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # wiped out in volatile, we need to create thes=
e at boot.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}/run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default/volatiles<=
br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9454): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9454" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9454</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116438591/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/116438591/1050810</a><br>
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

--000000000000ffd1d906444be548--


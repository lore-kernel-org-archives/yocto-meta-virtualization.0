Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F90C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:56:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.723.1739310991899548359
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 13:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIHjSlST;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so8409242a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 13:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739310991; x=1739915791; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t9IsFXdFGcbHLwDIz01cpV5tH5V6vhhtbv4Q3smcR2w=;
        b=XIHjSlSTfM52pVMK4uWaF5xMQ92LzPJIQkf3HMgIiIYinLy9jQVmm0gu4jrHpTV09G
         P5Qg0K2hgEoamYCuuXBqGFDc/kxCyPpymWsKsoiCUtj3pFXXMgxjTb/K6MC874RFectZ
         Z9KVVjlhZRiIoNT+lf5HMg9q5l7ubqgFU7rDThkEgIa1amS1c6KG1htJK1G61tlrOUjt
         Km05An0HX5wMx/EB5qoePplhwEz1BHQYCA4lyaD0XnnS6aYkZyCdVJHZ18zG1iN1zaBa
         rhrzLJiE71v3w548iCWCWozrY7wTl3cACfnPl73BHl3xj+5jwaGTLaU//cF7mqJSlf9k
         6oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739310991; x=1739915791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9IsFXdFGcbHLwDIz01cpV5tH5V6vhhtbv4Q3smcR2w=;
        b=Qd51cr4PpuELSpyvuanEQpBkIk0m+X/JP/3HtDyeJySmoFAVCIHY9UHEHnw05gPQcp
         tsaAqSkV9rKzv4r6Xj5DIFjvmP3uWFTm4bcUFR6sVE0bsRW/DRNhS/bzBE4oEwZK7lcP
         EJbNLNySeUtubWDMP7vGeOuM4ZFeGToKg8/10Bf8YbRhIbMUwpY4m3xiDZM2QbthXjMw
         2O/Mny15EhiWs4AVGXAVxXzd6Zp9Ro41VU/dW6cuHM0pcqhb0ilhNBWtDzvvOb2gqalQ
         xaNh6biGe6pYb+TCqVmDAxCVHUAd34PzqDXCZYANIGi7AqUb/JhqlmP4rQJqwgYH6aQA
         g2yQ==
X-Gm-Message-State: AOJu0YysQLMxVmcw2HZtyOl5DmDN1tmQ2vfT4XcXDS72CeNWVRRUXiuh
	H/rz26JERk+ARnSq0SAscahFqn1Tgl4U3luo5H1pRMA4WKZWcWrUHtoNG9lmdUzHSKdMXV6CKZi
	lUoUtvJnKJViqS6mfcGceF69YnjA=
X-Gm-Gg: ASbGncs66IT6gayYKsCD5sctjJzxiQJD7VtyIdQTZ0jUk8aiw0sIzsvYVdFu8WHxibV
	tyJe9MTVP9eWoA0JnCQhSjhCIFDJitasWeaTFBhGSL9xEP6SIzoivDiRSBqexc/DkcC6bAe9y
X-Google-Smtp-Source: AGHT+IFtiPxxAU1e8rrl4HLzWmb7E0oKzC784LlzYDm6+S8gDEv2xvkHMfiZQCedHk/1udY9JIxxcWJgWmrbXX8/qfQ=
X-Received: by 2002:a17:90a:e185:b0:2ee:8430:b831 with SMTP id
 98e67ed59e1d1-2fbf5bc0249mr1232375a91.2.1739310991159; Tue, 11 Feb 2025
 13:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20250211210418.3463657-1-troth@openavr.org>
In-Reply-To: <20250211210418.3463657-1-troth@openavr.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2025 16:56:21 -0500
X-Gm-Features: AWEUYZmQccoB22voxU_bku58wvxdK-JwN5j3aUzII2jhac1d0FFjEFUNbwJkddc
Message-ID: <CADkTA4PiSSq8QeYT1asw9p_SvwQoLbzGeWNZsjtvgytvLE38YQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kernel: Remove linux-yocto_6.6 files
To: troth@openavr.org
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000c837aa062de4e57b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 21:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9137

--000000000000c837aa062de4e57b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already have this commit prepared, as I was the one that removed the 6.6
kernel :)

I just didn't realize it had been merged yet.

Bruce

On Tue, Feb 11, 2025 at 4:04=E2=80=AFPM Theodore A. Roth via lists.yoctopro=
ject.org
<troth=3Dopenavr.org@lists.yoctoproject.org> wrote:

> Upstream poky has dropped support for v6.6 kernels which causes rpi
> builds to fail:
>
>   ERROR: No recipes in default available for:
>
> meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel/linux/linux=
-yocto_6.6.bbappend
>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
>  ...6.6.bbappend =3D> linux-yocto_6.12.bbappend} |  2 +-
>  .../linux/linux-yocto_6.6_virtualization.inc  |  4 --
>  .../linux/yocto-cfg-fragments-6.6.bb          | 37 -------------------
>  3 files changed, 1 insertion(+), 42 deletions(-)
>  rename
> dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6.6.bbappend
> =3D> linux-yocto_6.12.bbappend} (77%)
>  delete mode 100644 recipes-kernel/linux/linux-yocto_6.6_virtualization.i=
nc
>  delete mode 100644 recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>
> diff --git
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappen=
d
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappe=
nd
> similarity index 77%
> rename from
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend
> rename to
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappend
> index 2e2f92b6..9d1d49f4 100644
> ---
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappen=
d
> +++
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappe=
nd
> @@ -1,5 +1,5 @@
>  # Enable use of the linux-yocto kernel for the Raspberry Pi 4
> -KBRANCH:raspberrypi4-64 ?=3D "v6.6/standard/bcm-2xxx-rpi"
> +KBRANCH:raspberrypi4-64 ?=3D "v6.12/standard/bcm-2xxx-rpi"
>  KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>  COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>
> diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> b/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> deleted file mode 100644
> index 59311487..00000000
> --- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# include the baseline meta virtualization configuration options
> -# after this include, we can do version specific things
> -
> -include linux-yocto_virtualization.inc
> diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
> b/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
> deleted file mode 100644
> index 6bdc0d03..00000000
> --- a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -HOMEPAGE =3D "
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/"
> -SUMMARY =3D "Kernel configuration fragments"
> -DESCRIPTION =3D "Typically used as part of a kernel clone, this is the
> standalone \
> -fragment repository. Making it available to other fragment management
> schemes \
> -"
> -SECTION =3D "devel"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
> -
> -do_configure[noexec] =3D "1"
> -do_compile[noexec] =3D "1"
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -LINUX_VERSION ?=3D "6.6"
> -PV =3D "v${LINUX_VERSION}+git${SRCREV}"
> -
> -SRCREV =3D "4a494b202029e94a72ebb3c3966d9f1d249900f3"
> -SRC_URI =3D "\
> -        git://
> git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-${LINUX_VERSION}
> <http://git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-$%7BLINUX_=
VERSION%7D>
> \
> -        "
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -    install -d ${D}${base_prefix}/kcfg
> -
> -    # copy the configuration fragments over to the native deploy
> -    cp -r ${S}/* ${D}${base_prefix}/kcfg
> -    # scripts bring in a bash dependency we don't want
> -    rm -rf ${D}${base_prefix}/kcfg/scripts
> -}
> -
> -FILES:${PN} +=3D "kcfg/"
> -SYSROOT_DIRS +=3D "${base_prefix}/kcfg"
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9136):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9136
> Mute This Topic: https://lists.yoctoproject.org/mt/111131116/1050810
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

--000000000000c837aa062de4e57b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I already have this commit prepared, as I was the one that re=
moved the 6.6 kernel :)</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
 just didn&#39;t realize it had been merged yet.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 20=
25 at 4:04=E2=80=AFPM Theodore A. Roth via <a href=3D"http://lists.yoctopro=
ject.org">lists.yoctoproject.org</a> &lt;troth=3D<a href=3D"mailto:openavr.=
org@lists.yoctoproject.org">openavr.org@lists.yoctoproject.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream poky=
 has dropped support for v6.6 kernels which causes rpi<br>
builds to fail:<br>
<br>
=C2=A0 ERROR: No recipes in default available for:<br>
=C2=A0 =C2=A0 meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel=
/linux/linux-yocto_6.6.bbappend<br>
<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:theodore_roth@trimble=
.com" target=3D"_blank">theodore_roth@trimble.com</a>&gt;<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org" ta=
rget=3D"_blank">troth@openavr.org</a>&gt;<br>
---<br>
=C2=A0...6.6.bbappend =3D&gt; linux-yocto_6.12.bbappend} |=C2=A0 2 +-<br>
=C2=A0.../linux/linux-yocto_6.6_virtualization.inc=C2=A0 |=C2=A0 4 --<br>
=C2=A0.../linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 37 -------------------<br>
=C2=A03 files changed, 1 insertion(+), 42 deletions(-)<br>
=C2=A0rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6=
.6.bbappend =3D&gt; linux-yocto_6.12.bbappend} (77%)<br>
=C2=A0delete mode 100644 recipes-kernel/linux/linux-yocto_6.6_virtualizatio=
n.inc<br>
=C2=A0delete mode 100644 recipes-kernel/linux/<a href=3D"http://yocto-cfg-f=
ragments-6.6.bb" rel=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6=
.6.bb</a><br>
<br>
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.=
6.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.=
12.bbappend<br>
similarity index 77%<br>
rename from dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6=
.bbappend<br>
rename to dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.=
bbappend<br>
index 2e2f92b6..9d1d49f4 100644<br>
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbapp=
end<br>
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbap=
pend<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Enable use of the linux-yocto kernel for the Raspberry Pi 4<br>
-KBRANCH:raspberrypi4-64 ?=3D &quot;v6.6/standard/bcm-2xxx-rpi&quot;<br>
+KBRANCH:raspberrypi4-64 ?=3D &quot;v6.12/standard/bcm-2xxx-rpi&quot;<br>
=C2=A0KMACHINE:raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
=C2=A0COMPATIBLE_MACHINE:raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc b/reci=
pes-kernel/linux/linux-yocto_6.6_virtualization.inc<br>
deleted file mode 100644<br>
index 59311487..00000000<br>
--- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-# include the baseline meta virtualization configuration options<br>
-# after this include, we can do version specific things<br>
-<br>
-include linux-yocto_virtualization.inc<br>
diff --git a/recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a> b/=
recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a><br>
deleted file mode 100644<br>
index 6bdc0d03..00000000<br>
--- a/recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" re=
l=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a><br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/y=
octo-kernel-cache/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-kernel-cache/</a>&quot;<br>
-SUMMARY =3D &quot;Kernel configuration fragments&quot;<br>
-DESCRIPTION =3D &quot;Typically used as part of a kernel clone, this is th=
e standalone \<br>
-fragment repository. Making it available to other fragment management sche=
mes \<br>
-&quot;<br>
-SECTION =3D &quot;devel&quot;<br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING.MIT;md5=3D3da9cfbcb788c80a038436=
1b4de20420&quot;<br>
-<br>
-do_configure[noexec] =3D &quot;1&quot;<br>
-do_compile[noexec] =3D &quot;1&quot;<br>
-INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
-<br>
-LINUX_VERSION ?=3D &quot;6.6&quot;<br>
-PV =3D &quot;v${LINUX_VERSION}+git${SRCREV}&quot;<br>
-<br>
-SRCREV =3D &quot;4a494b202029e94a72ebb3c3966d9f1d249900f3&quot;<br>
-SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yoctoproject.org/y=
octo-kernel-cache;branch=3Dyocto-$%7BLINUX_VERSION%7D" rel=3D"noreferrer" t=
arget=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-${L=
INUX_VERSION}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 install -d ${D}${base_prefix}/kcfg<br>
-<br>
-=C2=A0 =C2=A0 # copy the configuration fragments over to the native deploy=
<br>
-=C2=A0 =C2=A0 cp -r ${S}/* ${D}${base_prefix}/kcfg<br>
-=C2=A0 =C2=A0 # scripts bring in a bash dependency we don&#39;t want<br>
-=C2=A0 =C2=A0 rm -rf ${D}${base_prefix}/kcfg/scripts<br>
-}<br>
-<br>
-FILES:${PN} +=3D &quot;kcfg/&quot;<br>
-SYSROOT_DIRS +=3D &quot;${base_prefix}/kcfg&quot;<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9136): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9136" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9136</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111131116/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111131116/1050810</a><br>
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

--000000000000c837aa062de4e57b--


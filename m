Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE09CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:18:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16499.1762438726536458764
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RAtcKyH0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso931826a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 06:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762438726; x=1763043526; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YqM/tPEoba4PM9eanIXVoWobXjFBGw+nmx1D2Azi3Vc=;
        b=RAtcKyH0Lf4Hn/Vkpf6LI7SRX1O7Fo2dBUJeiq0u9XOMESjBFpOMXE05HZO6HGLD+6
         U+Ds/laYuUNKceUIp5xqbzJEtOw7WkK6YystosqsVXwZIfYtK7gCngA1v4d/c8a9NBp4
         Pj8H3GTRA64LcDLbUwD8iu0/GaQbLoZgiGs20mXj/1hhusfRTdXb2m09x0uPVAbMkT68
         J9eLe8vF4zLtuhlUvRah+04MnsuA5T95H+4kMiCk/4mshbcIVA2TCwMC54G+GGKSyZP3
         T3jmEKHjO5mOX+dp0DYYCUXLxl8CuEXschMm59g3seZodOxdbmxUfoGx2y3XplymnSW+
         2wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438726; x=1763043526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqM/tPEoba4PM9eanIXVoWobXjFBGw+nmx1D2Azi3Vc=;
        b=QMS262S/1OKaVq2PXBj8X5Hbe3jq1MdVzqkJZ0A44mSMZuUu078OX7H/DaKL9eQrAa
         l/sGyyORoPAyyNtMQbYuUj9ZPwHi3bgYO2pHz4fIjyOH0cINoE9UUWZJibh8keuPD4qO
         FNHbArFjAniymPn+NQUEcUlVZv/ZzFuWpQiWAdQpinZwISB82Eng/coJKJq+I4ztDS6C
         poswkhZ7LxUHRDrE4wQwQzHsbs/ZBPX2YOycxy3lHIB/7KAbRrf5dQpYgryrSJmDvoOH
         6vf+ZZeB/XN9JVP7KIUjRH3iNSFOTDtub0mf8aA5kEIa2eBm6O3M2dL8GUDuuIUEUkrZ
         31UA==
X-Gm-Message-State: AOJu0YyC3RXYAo0yjty2FJwq7KaX9OsiUz7rItrsRhBymOky2eWAZYTi
	wjvlmI+sPUKsc+YzK8+bdOARiwG+m66vvVJMWOpIz74PBk47VMTSp1F8PhzLPlsCcGxSSy7MONs
	Sbv3Z/oSlxPA3YH6/DRQLUmCUMn94iINI4joZ
X-Gm-Gg: ASbGnctvskjIwFVTGkYa2s++1aQD2QWXwXJmyAvEAoeER9X18BR7FYrKar9+SjS1OMS
	kp/507nlr9QJhKH70UAnVMUUB4AsGAQLeJOmrmIjCBKOTnEwVXYq6vMHpVdmLOXTbIaXB7PNRx0
	0UNU4XoDlBeic+J+ngfuwZtCs6gck+iAGwh9xw9dokeEp4J1yNr0zMslEkONumK1BWJmisqBaGW
	PKBvkP9sicblMFejK4MLVMnhBf2sZb6rr08lF1wT5opHE9r9ccYkQNE8FGGSw==
X-Google-Smtp-Source: AGHT+IE+jK24kR5LULmsToKonapSf2yhR3FIKyPhRR//q/xDkij2d3IcF+Lgx6Yd4bBcKIItAUA2SAtcBvMSZDvupuI=
X-Received: by 2002:a17:90b:4c49:b0:340:bfcd:6afa with SMTP id
 98e67ed59e1d1-341a6c41841mr9726807a91.8.1762438725694; Thu, 06 Nov 2025
 06:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20251106131437.589960-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20251106131437.589960-1-tom.hochstein@oss.nxp.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Nov 2025 09:18:33 -0500
X-Gm-Features: AWmQ_bl2xpVJaAwOd5UKx2krTmY0irTIeihAyks4PRpFyvOA3_A8emriEC8r2xE
Message-ID: <CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJfhVKj5a3xUekJQCm4Wg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] libvirt: Fix missing libvirt-python
To: tom.hochstein@oss.nxp.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002ef8200642edbec0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:18:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9431

--0000000000002ef8200642edbec0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 8:15=E2=80=AFAM Tom Hochstein via lists.yoctoproject=
.org
<tom.hochstein=3Doss.nxp.com@lists.yoctoproject.org> wrote:

> From: Tom Hochstein <tom.hochstein@oss.nxp.com>
>
> The do_rootfs task for an image that includes libvirt-python fails.
> ```
>   - nothing provides libvirt-python needed by
> packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from oe-repo
> ```
>
> The log shows that the do_compile:append() from libvirt-python.inc is
> failing but not reporting the failure.
> ```
> 174: cd: can't cd to
> /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8.=
0
> ```
>
> The root cause is the archive folder format is changed from
> libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile
> and do_install tasks are hard-coded to the old format.
>
> Fix the root cause by encoding the archive folder name in a common
> variable. Also, fix the build and install commands so the cd failure is
> not ignored.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index c430ffe5..0a99296a 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES:${PN}-python =3D "${bindir}/* ${libdir}/*
> ${libdir}/${PYTHON_DIR}/*"
>  # Currently the libvirt-python debug libraries contain buildpaths
>  INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
>
> -SRC_URI +=3D "
> http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VERSION}.tar.gz=
;name=3Dlibvirt_python;subdir=3D${BP}
> "
> -
> +SRC_URI +=3D "
> http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;n=
ame=3Dlibvirt_python;subdir=3D${BP}
> "
> +LIBVIRT_PYTHON_ARCHIVE_NAME =3D "${BPN}_python-${LIBVIRT_VERSION}"
>  SRC_URI[libvirt_python.sha256sum] =3D
> "5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0e6f0ca83c"
>
>  export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
> @@ -46,8 +46,8 @@ do_compile:append() {
>                 # the syroot staged pkgconfig entries. So we clear the
> sysroot
>                 # for just this portion.
>                 export PKG_CONFIG_SYSROOT_DIR=3D
> -               cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &&=
 \
> -                 ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
> build
> +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py
> build
>                 cd -
>         fi
>  }
> @@ -58,9 +58,9 @@ do_install:append() {
>                 # the syroot staged pkgconfig entries. So we clear the
> sysroot
>                 # for just this portion.
>                 export PKG_CONFIG_SYSROOT_DIR=3D
> -               cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &&=
 \
> -                 ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
> install \
> -                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
> ${LIBVIRT_INSTALL_ARGS}
> +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>

As I hinted at in my other reply just a minute ago, I'd actually prefer
that if we are
changing this to fail on the directory not existing (which really has only
happened
once in the decade or so this exists), then we should put a test for the
directory
and output a clearer error message. Otherwise, someone getting that failed
cd will have no idea why it happened.

Bruce



> +               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py
> install \
> +                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
> ${LIBVIRT_INSTALL_ARGS}
>                 cd -
>         fi
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9429):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9429
> Mute This Topic: https://lists.yoctoproject.org/mt/116152179/1050810
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

--0000000000002ef8200642edbec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at 8:15=
=E2=80=AFAM Tom Hochstein via <a href=3D"http://lists.yoctoproject.org">lis=
ts.yoctoproject.org</a> &lt;tom.hochstein=3D<a href=3D"mailto:oss.nxp.com@l=
ists.yoctoproject.org">oss.nxp.com@lists.yoctoproject.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Tom Hochstei=
n &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.com" target=3D"_blank">tom.ho=
chstein@oss.nxp.com</a>&gt;<br>
<br>
The do_rootfs task for an image that includes libvirt-python fails.<br>
```<br>
=C2=A0 - nothing provides libvirt-python needed by packagegroup-fsl-virtual=
ization-1.0-r0.ls1012afrwy from oe-repo<br>
```<br>
<br>
The log shows that the do_compile:append() from libvirt-python.inc is<br>
failing but not reporting the failure.<br>
```<br>
174: cd: can&#39;t cd to /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+g=
it/libvirt-python-11.8.0<br>
```<br>
<br>
The root cause is the archive folder format is changed from<br>
libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile<br>
and do_install tasks are hard-coded to the old format.<br>
<br>
Fix the root cause by encoding the archive folder name in a common<br>
variable. Also, fix the build and install commands so the cd failure is<br>
not ignored.<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.co=
m" target=3D"_blank">tom.hochstein@oss.nxp.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index c430ffe5..0a99296a 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -18,8 +18,8 @@ FILES:${PN}-python =3D &quot;${bindir}/* ${libdir}/* ${li=
bdir}/${PYTHON_DIR}/*&quot;<br>
=C2=A0# Currently the libvirt-python debug libraries contain buildpaths<br>
=C2=A0INSANE_SKIP:${PN}-dbg +=3D &quot;buildpaths&quot;<br>
<br>
-SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/$%7BBPN%7D=
_python-$%7BLIBVIRT_VERSION%7D.tar.gz;name=3Dlibvirt_python;subdir=3D$%7BBP=
%7D" rel=3D"noreferrer" target=3D"_blank">http://libvirt.org/sources/python=
/${BPN}_python-${LIBVIRT_VERSION}.tar.gz;name=3Dlibvirt_python;subdir=3D${B=
P}</a>&quot;<br>
-<br>
+SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/$%7BLIBVIR=
T_PYTHON_ARCHIVE_NAME%7D.tar.gz;name=3Dlibvirt_python;subdir=3D$%7BBP%7D" r=
el=3D"noreferrer" target=3D"_blank">http://libvirt.org/sources/python/${LIB=
VIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=3Dlibvirt_python;subdir=3D${BP}</a>&q=
uot;<br>
+LIBVIRT_PYTHON_ARCHIVE_NAME =3D &quot;${BPN}_python-${LIBVIRT_VERSION}&quo=
t;<br>
=C2=A0SRC_URI[libvirt_python.sha256sum] =3D &quot;5d80e13e0cfb96dd254d765ee=
60e77e5f9b6925172540056cec0aa0e6f0ca83c&quot;<br>
<br>
=C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api.xml&quot;<br>
@@ -46,8 +46,8 @@ do_compile:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the syroot staged=
 pkgconfig entries. So we clear the sysroot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for just this por=
tion.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PKG_CONFIG_S=
YSROOT_DIR=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${UNPACKDIR}/${B=
P}/${BPN}-python-${LIBVIRT_VERSION} &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BI=
NDIR_NATIVE}/python3-native/python3 setup.py build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${UNPACKDIR}/${B=
P}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NA=
TIVE}/python3-native/python3 setup.py build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
@@ -58,9 +58,9 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the syroot staged=
 pkgconfig entries. So we clear the sysroot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for just this por=
tion.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PKG_CONFIG_S=
YSROOT_DIR=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${UNPACKDIR}/${B=
P}/${BPN}-python-${LIBVIRT_VERSION} &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BI=
NDIR_NATIVE}/python3-native/python3 setup.py install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL=
_ARGS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${UNPACKDIR}/${B=
P}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">As I hinted at in my othe=
r reply just a minute ago, I&#39;d actually prefer that if we are</div><div=
 class=3D"gmail_default" style=3D"font-size:small">changing this to fail on=
 the directory not existing (which really has only happened</div><div class=
=3D"gmail_default" style=3D"font-size:small">once in the decade or so this =
exists), then we should put a test for the directory</div><div class=3D"gma=
il_default" style=3D"font-size:small">and output a clearer error message. O=
therwise, someone getting that failed</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">cd will have no idea why it happened.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NA=
TIVE}/python3-native/python3 setup.py install \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL=
_ARGS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9429): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9429" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9429</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116152179/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/116152179/1050810</a><br>
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

--0000000000002ef8200642edbec0--


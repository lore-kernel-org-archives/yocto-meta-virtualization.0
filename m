Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B0A1E00C75; Wed, 30 May 2018 05:53:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16F39E00C72
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 05:53:38 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id y20-v6so4110297lfy.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jKKM0iPjO31UoxNuwvNnjleFW2P7tbtKhz/K8VCyTAw=;
	b=VjEwH3qKELsObo/a5mzTgEsOvnUCxmcAkNcHnGwcPOlsNlDOc4xtXxsibNM4vfGuAX
	piMpqFdXPqQLtXqofVxkM//jvBFse5cGVxACs+YtwCR88C5S8uXrEeHlxOOEIpy/PTCh
	wzks01aEn8IkVrreKn8Msjes4jLOyIRQKTRdWZQRn5/X7V69lD5bqVrCObnxFbRM2g+w
	qSejXno2spZ9WtyPaz6FoDFi9fNQRJ4tgzM8uB0HBF6uBWYkKA/LcznmckoBmWJz2JIl
	DNbTWDLJPgOkcdkvc5H6sDOyksSTGTiW9bY8ZCz5sjc64QgugUQpwMr3/33L5NIJz0+o
	eImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jKKM0iPjO31UoxNuwvNnjleFW2P7tbtKhz/K8VCyTAw=;
	b=JOPuCfpN+ej6HDkP0gvc9xDfgfri8Jli4CuLI/zf4C0P+kdm1qMfIGYbiJ0Lfl14bp
	zQrxufEbjz4PXyS37aQFJU0H73x0pH6ow1xTdM2ATWGR/DSqnBM8sCMFMsvkqhEyn3P5
	Wy3w7Tr/9Xc9t8IPlE1hjz2ML101zcbc0Tbvx34J3Qfu/JBfgHGIV+lPuc0H9DlEarIz
	UWsvnVC65F+2WttSu1uw2TlHy7Jj5NRsGJqqnzQsue5lQblo+yzeYRA7B2nY7xOVG5hj
	AaJlH/vwSdH+83pyflZ2VeoIOVMf4GzaPih4DJ/gHCj7oTQhmO5qMwaikse9uNABGaZF
	DaFQ==
X-Gm-Message-State: ALKqPweBSQJaT/0AKkwFJ1/UEGdax4E8PxL0CuWYs2AOY+ArSfUL+qGR
	PrZBaYOpH7j7uTdm11NN2/eQr5jdkRNcCKg02G4=
X-Google-Smtp-Source: ADUXVKKJcLqfJaj9z4gfl0f43g+RS2N7GS/vEnRnegn1Uo2KJhg3JcwIjPhZW54UCcYH3YUSCuM5NDwYYut2CueStAg=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr2068357ljh.142.1527684817819; 
	Wed, 30 May 2018 05:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Wed, 30 May 2018 05:53:37
	-0700 (PDT)
In-Reply-To: <20180530091759.23186-1-pascal.bach@siemens.com>
References: <20180530091759.23186-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 May 2018 08:53:37 -0400
Message-ID: <CADkTA4N-1bby3xesKA0cLnFxyT_zgZLhydHKDX642=TVW8-_AQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] tini: add version 0.18.0 as docker-init provider
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 12:53:41 -0000
Content-Type: multipart/alternative; boundary="000000000000e51c64056d6bd6b3"

--000000000000e51c64056d6bd6b3
Content-Type: text/plain; charset="UTF-8"

merged!

Bruce

On Wed, May 30, 2018 at 5:17 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> This removes the warning that docker can't find docker-init
> in PATH.
>
> This recipe is based on the recipe from meta-resin.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker_git.bb            |  2 +-
>  ...p-the-output-binary-allow-yocto-to-do-thi.patch | 28
> +++++++++++++++++++
>  recipes-containers/tini/tini_0.18.0.bb             | 32
> ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/tini/tini/
> 0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
>  create mode 100644 recipes-containers/tini/tini_0.18.0.bb
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 790170e..73e0120 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -74,7 +74,7 @@ RDEPENDS_${PN} = "util-linux iptables \
>                   "
>  RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>
> -RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat
> docker-init"
>  RSUGGESTS_${PN} = "lxc rt-tests"
>  DOCKER_PKG="github.com/docker/docker"
>
> diff --git a/recipes-containers/tini/tini/0001-Do-not-strip-the-
> output-binary-allow-yocto-to-do-thi.patch b/recipes-containers/tini/
> tini/0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
> new file mode 100644
> index 0000000..6797720
> --- /dev/null
> +++ b/recipes-containers/tini/tini/0001-Do-not-strip-the-
> output-binary-allow-yocto-to-do-thi.patch
> @@ -0,0 +1,28 @@
> +From b99ef9954a34cffd85a5cc09922b201ae11b494d Mon Sep 17 00:00:00 2001
> +From: Theodor Gherzan <theodor@resin.io>
> +Date: Mon, 5 Jun 2017 18:16:56 +0200
> +Subject: [PATCH] Do not strip the output binary, allow yocto to do this
> +
> +Upstream-Status: Inappropriate [configuration specific]
> +
> +Signed-off-by: Theodor Gherzan <theodor@resin.io>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b5b93ba..c2907e2 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -54,7 +54,7 @@ if(NOT HAS_BUILTIN_FORTIFY)
> + endif()
> +
> + set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -Werror -Wextra -Wall
> -pedantic-errors -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat")
> +-set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-s")
> ++set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,-Bsymbolic-functions -Wl,-z,relro")
> +
> + # Build
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/tini/tini_0.18.0.bb
> b/recipes-containers/tini/tini_0.18.0.bb
> new file mode 100644
> index 0000000..7c124a8
> --- /dev/null
> +++ b/recipes-containers/tini/tini_0.18.0.bb
> @@ -0,0 +1,32 @@
> +HOMEPAGE = "http://github.com/krallin/tini"
> +SUMMARY = "Minimal init for containers"
> +DESCRIPTION = "Tini is the simplest init you could think of. All Tini
> does is \
> +spawn a single child (Tini is meant to be run in a container), and wait
> for \
> +it to exit all the while reaping zombies and performing signal
> forwarding. "
> +
> +SRCREV = "fec3683b971d9c3ef73f284f176672c44b448662"
> +SRC_URI = " \
> +  git://github.com/krallin/tini.git \
> +  file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
> \
> +  "
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ffc9091894702bc5dcf4cc0085561ef5"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native"
> +
> +# tini links with -static, so no PIE for us
> +SECURITY_CFLAGS_pn-${PN} = "${SECURITY_NO_PIE_CFLAGS}"
> +
> +inherit cmake
> +
> +do_install() {
> +  mkdir -p ${D}/${bindir}
> +  install -m 0755 ${B}/tini-static ${D}/${bindir}/docker-init
> +}
> +
> +# Tini is the currently the provider for docker-init
> +PROVIDES += "docker-init"
> +RPROVIDES_${PN} = "docker-init"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000e51c64056d6bd6b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged!<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 30, 2018 at 5:17 AM=
, Pascal Bach <span dir=3D"ltr">&lt;<a href=3D"mailto:pascal.bach@siemens.c=
om" target=3D"_blank">pascal.bach@siemens.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">This removes the warning that docker can&#39;t f=
ind docker-init<br>
in PATH.<br>
<br>
This recipe is based on the recipe from meta-resin.<br>
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0...p-the-output-binary-allow-<wbr>yocto-to-do-thi.patch | 28 ++++++++=
+++++++++++<br>
=C2=A0recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini_<wbr>0.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++++++++++++++++++++<br>
=C2=A03 files changed, 61 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 recipes-containers/tini/tini/<wbr>0001-Do-not-stri=
p-the-output-<wbr>binary-allow-yocto-to-do-thi.<wbr>patch<br>
=C2=A0create mode 100644 recipes-containers/tini/<a href=3D"http://tini_0.1=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">tini_<wbr>0.18.0.bb</a><br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 790170e..73e0120 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -74,7 +74,7 @@ RDEPENDS_${PN} =3D &quot;util-linux iptables \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;virtual/containerd virtual/runc&quot;<br>
<br>
-RRECOMMENDS_${PN} =3D &quot;kernel-module-dm-thin-pool kernel-module-nf-na=
t&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;kernel-module-dm-thin-pool kernel-module-nf-na=
t docker-init&quot;<br>
=C2=A0RSUGGESTS_${PN} =3D &quot;lxc rt-tests&quot;<br>
=C2=A0DOCKER_PKG=3D&quot;<a href=3D"http://github.com/docker/docker" rel=3D=
"noreferrer" target=3D"_blank">github.com/docker/<wbr>docker</a>&quot;<br>
<br>
diff --git a/recipes-containers/tini/<wbr>tini/0001-Do-not-strip-the-<wbr>o=
utput-binary-allow-yocto-to-<wbr>do-thi.patch b/recipes-containers/tini/<wb=
r>tini/0001-Do-not-strip-the-<wbr>output-binary-allow-yocto-to-<wbr>do-thi.=
patch<br>
new file mode 100644<br>
index 0000000..6797720<br>
--- /dev/null<br>
+++ b/recipes-containers/tini/<wbr>tini/0001-Do-not-strip-the-<wbr>output-b=
inary-allow-yocto-to-<wbr>do-thi.patch<br>
@@ -0,0 +1,28 @@<br>
+From b99ef9954a34cffd85a5cc09922b20<wbr>1ae11b494d Mon Sep 17 00:00:00 200=
1<br>
+From: Theodor Gherzan &lt;<a href=3D"mailto:theodor@resin.io">theodor@resi=
n.io</a>&gt;<br>
+Date: Mon, 5 Jun 2017 18:16:56 +0200<br>
+Subject: [PATCH] Do not strip the output binary, allow yocto to do this<br=
>
+<br>
+Upstream-Status: Inappropriate [configuration specific]<br>
+<br>
+Signed-off-by: Theodor Gherzan &lt;<a href=3D"mailto:theodor@resin.io">the=
odor@resin.io</a>&gt;<br>
+---<br>
+ CMakeLists.txt | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index b5b93ba..c2907e2 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -54,7 +54,7 @@ if(NOT HAS_BUILTIN_FORTIFY)<br>
+ endif()<br>
+ <br>
+ set (CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -std=3Dgnu99 -Werror -Wextra -W=
all -pedantic-errors -O2 -fstack-protector --param=3Dssp-buffer-size=3D4 -W=
format&quot;)<br>
+-set (CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FLAGS} -Wl,-Bsymboli=
c-functions -Wl,-z,relro -Wl,-s&quot;)<br>
++set (CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FLAGS} -Wl,-Bsymboli=
c-functions -Wl,-z,relro&quot;)<br>
+ <br>
+ # Build<br>
+ <br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tini<wbr>_0.18.0.bb</a> b/recipes-contain=
ers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">tini<wbr>_0.18.0.bb</a><br>
new file mode 100644<br>
index 0000000..7c124a8<br>
--- /dev/null<br>
+++ b/recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini<wbr>_0.18.0.bb</a><br>
@@ -0,0 +1,32 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"http://github.com/krallin/tini" rel=3D"noref=
errer" target=3D"_blank">http://github.com/krallin/<wbr>tini</a>&quot;<br>
+SUMMARY =3D &quot;Minimal init for containers&quot;<br>
+DESCRIPTION =3D &quot;Tini is the simplest init you could think of. All Ti=
ni does is \<br>
+spawn a single child (Tini is meant to be run in a container), and wait fo=
r \<br>
+it to exit all the while reaping zombies and performing signal forwarding.=
 &quot;<br>
+<br>
+SRCREV =3D &quot;<wbr>fec3683b971d9c3ef73f284f176672<wbr>c44b448662&quot;<=
br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 git://<a href=3D"http://github.com/krallin/tini.git" rel=3D"norefer=
rer" target=3D"_blank">github.com/krallin/tini.<wbr>git</a> \<br>
+=C2=A0 file://0001-Do-not-strip-the-<wbr>output-binary-allow-yocto-to-<wbr=
>do-thi.patch \<br>
+=C2=A0 &quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>ffc9091894702bc5dcf4c=
c0085561e<wbr>f5&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+# tini links with -static, so no PIE for us<br>
+SECURITY_CFLAGS_pn-${PN} =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+do_install() {<br>
+=C2=A0 mkdir -p ${D}/${bindir}<br>
+=C2=A0 install -m 0755 ${B}/tini-static ${D}/${bindir}/docker-init<br>
+}<br>
+<br>
+# Tini is the currently the provider for docker-init<br>
+PROVIDES +=3D &quot;docker-init&quot;<br>
+RPROVIDES_${PN} =3D &quot;docker-init&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000e51c64056d6bd6b3--

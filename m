Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0D82E006EA; Sat, 14 Jan 2017 16:26:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2ED01E00563
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:26:51 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id u25so12036121qki.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WQ1YixXms3BFHuoyBuGBiB9ADDw0tlQ+xZQf8k/Rl4A=;
	b=LTbOFGdfNoh7y05obLHU9Ijk2f0696iPnyvLNwOE4PvmqUuMTlUq8Lxs63ut4f78WR
	lxfPaxwgSF27O43k1Dr3my0YrlwB1/tbZ/jA9Hdf1ArdpcUANpT7ysprsogZfK+QAyxM
	Rc3pmQYJi+sobGgJ07q54ZDLYk9QbyzVJwIjmysbAAhyjqXHxLGdh325KZzxpGIqTwuM
	fYCns+v5y0mMmYZXg9Ek0SZlwK4TdLwaHRT+E/6pf5ayTEdWyo81jRnITZYx34OwZEmj
	aZEIEf+hheMgJ+U5CgIRzdj7LKCPqZSxuZXh51LEW3RDjShmHrSLPvGMwncQo6trJ8kW
	y3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WQ1YixXms3BFHuoyBuGBiB9ADDw0tlQ+xZQf8k/Rl4A=;
	b=ccESsAFDV4kvWxZ+oSv6vxuWTvth0GrhvXoroz0WUW2cXonhRELHDKNFdAs3BYp9ZX
	ZoizsWP6JA+sux9OaYpnXCvXx8SZTWmZcBUfOMpQfVvjPpawKrj7rLRjfHxFMNUd+ql5
	iDoohjWlZSdXufNYvUk52PaHDm7BbiM3db/aDUHqnFCQCaTwmaZ7ef3YnC5ysUO5mg8c
	L8QCvjMCW6WGLcGnjt9xbbSsxSlZNvvhUdJ1ZETlAbYr4Qb1hYYH0du7d8cGf/P/G8/u
	1SxKc/0xEsA0+ikzF/A8Nxi387NDs+H6hGzAk1hMi4FCJiQ59N3gTwMpFszA/Wh/zKmX
	LhQA==
X-Gm-Message-State: AIkVDXL9GKs0hurJB2rKML0kHeDL91nZV05rdDGkISqbbHllA5+gk41Fpqf2DU5KrE9TFBRLy1YFO3TfWmFUtg==
X-Received: by 10.55.169.216 with SMTP id s207mr24200826qke.211.1484440011055; 
	Sat, 14 Jan 2017 16:26:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Sat, 14 Jan 2017 16:26:50 -0800 (PST)
In-Reply-To: <1484344196-30775-1-git-send-email-mark.asselstine@windriver.com>
References: <1484344196-30775-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Jan 2017 19:26:50 -0500
Message-ID: <CADkTA4N417J0hOxP_WC4mgUExyjEQ1VpL2bQomN8_vx+FROdzA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: fix build host contamination
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
X-List-Received-Date: Sun, 15 Jan 2017 00:26:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c0544d28cc2c50546171f29

--94eb2c0544d28cc2c50546171f29
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Jan 13, 2017 at 4:49 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> There is only a single PYTHON variable for configure and yet python is
> used for the build as well as scripts installed on the target. If we
> set a path in PYTHON as we had we end up using this same path during
> the build and since it isn't to the sysroot we end up with host
> contamination (as demonstrated by python failing to import 'six' on
> build hosts without python-six installed.
>
> The best approach is to set PYTHON to "python" when calling configure,
> ie. without a path. This will use 'python' from the path during build
> time and by ensuring all the installed scripts use '/usr/bin/env' we
> can ensure python will be found on the target when the scripts are
> run.
>
> Since 'six' is used as part of the build we have to ensure it is
> -native'ly buildable and we set all the required build and runtime
> dependencies.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-six_1.10.0.bb       |  2 +
>  ...on-make-remaining-scripts-use-usr-bin-env.patch | 53
> ++++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch.inc     | 10 ++--
>  recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
>  4 files changed, 61 insertions(+), 5 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
>
> diff --git a/recipes-devtools/python/python-six_1.10.0.bb
> b/recipes-devtools/python/python-six_1.10.0.bb
> index a84a4c4..c279f9f 100644
> --- a/recipes-devtools/python/python-six_1.10.0.bb
> +++ b/recipes-devtools/python/python-six_1.10.0.bb
> @@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef0
> 4d3cc10104f1980f54d57b2ce73a
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
> +
> +BBCLASSEXTEND = "native"
> \ No newline at end of file
> diff --git a/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch b/recipes-networking/
> openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> new file mode 100644
> index 0000000..6091930
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
> @@ -0,0 +1,53 @@
> +From 33769657e951da855b9258eb91fa9838373023ad Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Fri, 13 Jan 2017 16:12:55 -0500
> +Subject: [PATCH] python: make remaining scripts use /usr/bin/env
> +
> +Unfortunately there is no concept of a host python vs. target python
> +to facilitate cross compilation. There is only one PYTHON variable and
> +this is used during building and in the header of python scripts after
> +installation. The best approach for cross compilation is to thus to
> +ensure python is in the path and avoid passing a path as part of
> +PYTHON. To make this function smoothly all installed scripts should
> +make use of /usr/bin/env to increase the chances of finding python.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + ovsdb/ovsdb-dot.in               | 2 +-
> + ovsdb/ovsdb-idlc.in              | 2 +-
> + utilities/bugtool/ovs-bugtool.in | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
> +index 134ce22..893c408 100755
> +--- a/ovsdb/ovsdb-dot.in
> ++++ b/ovsdb/ovsdb-dot.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#! /usr/bin/env @PYTHON@
> +
> + from datetime import date
> + import ovs.db.error
> +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> +index cd4532e..dceb02f 100755
> +--- a/ovsdb/ovsdb-idlc.in
> ++++ b/ovsdb/ovsdb-idlc.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#! /usr/bin/env @PYTHON@
> +
> + import getopt
> + import os
> +diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-
> bugtool.in
> +index bb771b0..152d171 100755
> +--- a/utilities/bugtool/ovs-bugtool.in
> ++++ b/utilities/bugtool/ovs-bugtool.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#! /usr/bin/env @PYTHON@
> +
> + # This library is free software; you can redistribute it and/or
> + # modify it under the terms of version 2.1 of the GNU Lesser General
> Public
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index ab1f8fe..71c746f 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -11,11 +11,11 @@ HOMEPAGE = "http://openvswitch.org/"
>  SECTION = "networking"
>  LICENSE = "Apache-2"
>
> -DEPENDS += "bridge-utils openssl python perl"
> +DEPENDS += "bridge-utils openssl python perl python-six-native"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>         python perl perl-module-strict ${PN}-switch \
> -        bash python-twisted"
> +        bash python-twisted python-six"
>  RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
> @@ -34,8 +34,8 @@ SRC_URI = "\
>         "
>
>  EXTRA_OECONF += "\
> -       PYTHON=${bindir}/python \
> -       PYTHON3=${bindir}/python3 \
> +       PYTHON=python \
> +       PYTHON3=python3 \
>         PERL=${bindir}/perl \
>         "
>  CONFIGUREOPT_DEPTRACK = ""
> @@ -70,7 +70,7 @@ FILES_${PN} += "${datadir}/ovsdbmonitor"
>  FILES_${PN} += "/run"
>
>  FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
> -inherit autotools update-rc.d systemd python-dir
> +inherit autotools update-rc.d systemd pythonnative
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
>  SYSTEMD_SERVICE_${PN}-switch = " \
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 55e3a9a..455fab0 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -24,6 +24,7 @@ SRC_URI += "\
>         file://disable_m4_check.patch \
>         file://kernel_module.patch \
>         file://openvswitch-ptest-Fix-python-path.patch \
> +       file://python-make-remaining-scripts-use-usr-bin-env.patch \
>         "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
> --
> 2.7.4
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

--94eb2c0544d28cc2c50546171f29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 13, 2017 at 4:49 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">There is only a single PYTHON va=
riable for configure and yet python is<br>
used for the build as well as scripts installed on the target. If we<br>
set a path in PYTHON as we had we end up using this same path during<br>
the build and since it isn&#39;t to the sysroot we end up with host<br>
contamination (as demonstrated by python failing to import &#39;six&#39; on=
<br>
build hosts without python-six installed.<br>
<br>
The best approach is to set PYTHON to &quot;python&quot; when calling confi=
gure,<br>
ie. without a path. This will use &#39;python&#39; from the path during bui=
ld<br>
time and by ensuring all the installed scripts use &#39;/usr/bin/env&#39; w=
e<br>
can ensure python will be found on the target when the scripts are<br>
run.<br>
<br>
Since &#39;six&#39; is used as part of the build we have to ensure it is<br=
>
-native&#39;ly buildable and we set all the required build and runtime<br>
dependencies.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-six_1.10.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0...on-make-remaining-scripts-<wbr>use-usr-bin-env.patch | 53 ++++++++=
++++++++++++++<br>
=C2=A0recipes-networking/<wbr>openvswitch/openvswitch.inc=C2=A0 =C2=A0 =C2=
=A0| 10 ++--<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=
=A0 1 +<br>
=C2=A04 files changed, 61 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 recipes-networking/<wbr>openvswitch/files/python-m=
ake-<wbr>remaining-scripts-use-usr-bin-<wbr>env.patch<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb=
" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a> b/reci=
pes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=3D"noreferr=
er" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a><br>
index a84a4c4..c279f9f 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a><br>
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] =3D &quot;<wbr>105f8d68616f8248e24bf0e=
9372ef0<wbr>4d3cc10104f1980f54d57b2ce73a<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
=C2=A0inherit setuptools<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
\ No newline at end of file<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>rem=
aining-scripts-use-usr-bin-<wbr>env.patch b/recipes-networking/<wbr>openvsw=
itch/files/python-make-<wbr>remaining-scripts-use-usr-bin-<wbr>env.patch<br=
>
new file mode 100644<br>
index 0000000..6091930<br>
--- /dev/null<br>
+++ b/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>remaining-=
scripts-use-usr-bin-<wbr>env.patch<br>
@@ -0,0 +1,53 @@<br>
+From 33769657e951da855b9258eb91fa98<wbr>38373023ad Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Fri, 13 Jan 2017 16:12:55 -0500<br>
+Subject: [PATCH] python: make remaining scripts use /usr/bin/env<br>
+<br>
+Unfortunately there is no concept of a host python vs. target python<br>
+to facilitate cross compilation. There is only one PYTHON variable and<br>
+this is used during building and in the header of python scripts after<br>
+installation. The best approach for cross compilation is to thus to<br>
+ensure python is in the path and avoid passing a path as part of<br>
+PYTHON. To make this function smoothly all installed scripts should<br>
+make use of /usr/bin/env to increase the chances of finding python.<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=3D"_blank=
">ovsdb-dot.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
+ ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" target=3D"_blan=
k">ovsdb-idlc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-=
<br>
+ utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferrer" ta=
rget=3D"_blank">ovs-bugtool.<wbr>in</a> | 2 +-<br>
+ 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" targ=
et=3D"_blank">ovsdb-dot.in</a> b/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=
=3D"noreferrer" target=3D"_blank">ovsdb-dot.in</a><br>
+index 134ce22..893c408 100755<br>
+--- a/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=3D"_=
blank">ovsdb-dot.in</a><br>
++++ b/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=3D"_=
blank">ovsdb-dot.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#! /usr/bin/env @PYTHON@<br>
+<br>
+ from datetime import date<br>
+ import ovs.db.error<br>
+diff --git a/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovsdb-idlc.in</a> b/ovsdb/<a href=3D"http://ovsdb-idlc.in" r=
el=3D"noreferrer" target=3D"_blank">ovsdb-idlc.in</a><br>
+index cd4532e..dceb02f 100755<br>
+--- a/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" target=3D"=
_blank">ovsdb-idlc.in</a><br>
++++ b/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" target=3D"=
_blank">ovsdb-idlc.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#! /usr/bin/env @PYTHON@<br>
+<br>
+ import getopt<br>
+ import os<br>
+diff --git a/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"no=
referrer" target=3D"_blank">ovs-<wbr>bugtool.in</a> b/utilities/bugtool/<a =
href=3D"http://ovs-bugtool.in" rel=3D"noreferrer" target=3D"_blank">ovs-<wb=
r>bugtool.in</a><br>
+index bb771b0..152d171 100755<br>
+--- a/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-<wbr>bugtool.in</a><br>
++++ b/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-<wbr>bugtool.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#! /usr/bin/env @PYTHON@<br>
+<br>
+ # This library is free software; you can redistribute it and/or<br>
+ # modify it under the terms of version 2.1 of the GNU Lesser General Publ=
ic<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/recipes-=
networking/<wbr>openvswitch/openvswitch.inc<br>
index ab1f8fe..71c746f 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
@@ -11,11 +11,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://openvswitch.org/" =
rel=3D"noreferrer" target=3D"_blank">http://openvswitch.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;networking&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
<br>
-DEPENDS +=3D &quot;bridge-utils openssl python perl&quot;<br>
+DEPENDS +=3D &quot;bridge-utils openssl python perl python-six-native&quot=
;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid coreu=
tils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python perl perl-module-strict ${PN}-switch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash python-twisted&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash python-twisted python-six&quot;<br>
=C2=A0RDEPENDS_${PN}-testcontroller =3D &quot;${PN} lsb ${PN}-pki&quot;<br>
=C2=A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidg=
en&quot;<br>
=C2=A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
@@ -34,8 +34,8 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON=3D${bindir}/python \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON3=3D${bindir}/python3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON=3Dpython \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON3=3Dpython3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PERL=3D${bindir}/perl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0CONFIGUREOPT_DEPTRACK =3D &quot;&quot;<br>
@@ -70,7 +70,7 @@ FILES_${PN} +=3D &quot;${datadir}/ovsdbmonitor&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;/run&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python${PYTHON_<wbr>BASEVERSION}/&qu=
ot;<br>
-inherit autotools update-rc.d systemd python-dir<br>
+inherit autotools update-rc.d systemd pythonnative<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-switch&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-switch =3D &quot; \<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index 55e3a9a..455fab0 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -24,6 +24,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_m4_check.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://kernel_module.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-ptest-Fix-<wbr>python-path.p=
atch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://python-make-remaining-<wbr>scripts-use-u=
sr-bin-env.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
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

--94eb2c0544d28cc2c50546171f29--

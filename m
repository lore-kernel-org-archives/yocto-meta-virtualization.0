Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2303E00DE5; Sun, 31 Jul 2016 19:56:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72CC0E00CAB
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 19:56:40 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id s186so4974436qkb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 19:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ol813C0voK9aid3dVL28Gb/7aE6IhzFax/rFkF95OAo=;
	b=Yv0gLPA34eQj9rL6iy9z1WRn3+DfUoBRBOp06s1WHRRL3wEAs9tc27S2f5+MyKfFMe
	Hk/OjA5KHWEkr07NfgMpolPpQ2dB7/zQGw0tuGFX3/Qp5RMebWtt3NOYtrQYRK/r/EQ+
	t7bUyuP/0hvtjClgeXiL0nZ+BFd/jDoNIP9peP5JT0MFZmJn7+N73snQ9lY5zYKqBpVV
	Xa0MikMEMjYtbV5vfiUEnNzMkZ5GVTMtFbzzqvW2MOxMZ5+icmGi37+tlxuFFEk2P4qc
	dpCuZNqG0Gg76kvrlFtRshsuWN7v99kmyPcF6ERV/ej0iNFpgNNXZ+KNMotJckQ6gphw
	zE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ol813C0voK9aid3dVL28Gb/7aE6IhzFax/rFkF95OAo=;
	b=Xp9k1iLXi5W07WtU9uNqEjScUCbaEujl27pb+fth+11M8vq7MDD4bVvYpt/eqlygJj
	aq/xWVofB/hoD9LY6dxcuUwd64c6bwY07+RRsO8tbRUx9I71Up6Pn+hFNBm0zzQ33f1t
	zsh6gwHb/w0Pk9JtrIhP44qy881+07TF06sAYjBnkoXYkVG13mb2ynPuBYVvsSKeBH3W
	u9kD52iWItU1bQ4OOVfS3Hwld6ywusamks0RtXrd3qt1RzlBuL61CvnVrslOmxBw3/4q
	Pblxtdm3+KRnYbeM9x9DmRfSX6IzC587pOKV3bYvVBsNE2HV3u4U7G8in0zyHso6unuP
	P+Yg==
X-Gm-Message-State: AEkoouvUKKn5NhciuVxj+0aG9Gcz/0aJJAXhDzgt7VYwsQyLjvc9GljicuxMzqGenSbSrPn64QLI7RLpT7vnzQ==
X-Received: by 10.55.36.73 with SMTP id w70mr19044253qkg.109.1470020200385;
	Sun, 31 Jul 2016 19:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Sun, 31 Jul 2016 19:56:39 -0700 (PDT)
In-Reply-To: <1469651442-26772-1-git-send-email-cjp256@gmail.com>
References: <1469651442-26772-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 31 Jul 2016 22:56:39 -0400
Message-ID: <CADkTA4NW3kxCYk6hn8g8R_USr=VXj+ryy4W2b04hsM4mB++AEw@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: uprev to 4.7.0
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
X-List-Received-Date: Mon, 01 Aug 2016 02:56:43 -0000
Content-Type: multipart/alternative; boundary=001a11450cb0db50c60538f9bf5a

--001a11450cb0db50c60538f9bf5a
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 27, 2016 at 4:30 PM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> - update packages and add additional ones for new binaries
>   (cpuid and livepatch)
> - update xen_git to point to 4.7, make branch= fully variable,
>   and remove assumed .0 from release version
> - add patch to fix compilation of xen with gcc 6 on arm/aarch64
>
> Build tested x86_64 and aarch64 targets.
>

It's been 4 days, and no comments, so I've pushed this patch. If anyone has
issues or comments, we can do incremental patches.

Bruce


>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  ...l-compilation-warning-fix-for-arm-aarch64.patch | 58
> ++++++++++++++++++++++
>  recipes-extended/xen/xen.inc                       | 19 ++++++-
>  recipes-extended/xen/xen_4.6.1.bb                  | 10 ----
>  recipes-extended/xen/xen_4.7.0.bb                  | 11 ++++
>  recipes-extended/xen/xen_git.bb                    |  9 ++--
>  5 files changed, 92 insertions(+), 15 deletions(-)
>  create mode 100644
> recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
>  delete mode 100644 recipes-extended/xen/xen_4.6.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.7.0.bb
>
> diff --git
> a/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
> b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
> new file mode 100644
> index 0000000..baab928
> --- /dev/null
> +++
> b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
> @@ -0,0 +1,58 @@
> +Upstream-Status: Submitted
> +
> +From 3716a7faf98e1e126d47fe1596593917c27ee1bd Mon Sep 17 00:00:00 2001
> +From: Chris Patterson <pattersonc@ainfosec.com>
> +Date: Tue, 26 Jul 2016 16:01:47 -0400
> +Subject: [PATCH] libxl: compilation warning fix for arm & aarch64
> +
> +GCC 6 will warn on unused static const variables in c modules:
> +https://gcc.gnu.org/ml/gcc-patches/2015-09/msg00847.html
> +
> +When compiling with LIBXL_HAVE_NO_SUSPEND_RESUME set (arm & aarch64),
> +the compiler emits the following errors:
> +  xl_cmdimpl.c:101:19: error: 'migrate_report'
> +      defined but not used [-Werror=unused-const-variable=]
> +  xl_cmdimpl.c:99:19: error: 'migrate_permission_to_go'
> +      defined but not used [-Werror=unused-const-variable=]
> +  xl_cmdimpl.c:97:19: error: 'migrate_receiver_ready'
> +      defined but not used [-Werror=unused-const-variable=]
> +  xl_cmdimpl.c:95:19: error: 'migrate_receiver_banner'
> +      defined but not used [-Werror=unused-const-variable=]
> +
> +These unused const variables are only used in functions which exist
> between
> +the ifndef block:
> +   #ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
> +   ...
> +   #endif
> +
> +Wrap the same ifndef around these variables.
> +
> +Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> +---
> + tools/libxl/xl_cmdimpl.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/tools/libxl/xl_cmdimpl.c b/tools/libxl/xl_cmdimpl.c
> +index d1fcfa4..ada8178 100644
> +--- a/tools/libxl/xl_cmdimpl.c
> ++++ b/tools/libxl/xl_cmdimpl.c
> +@@ -92,6 +92,7 @@ static int fd_lock = -1;
> + static const char savefileheader_magic[32]=
> +     "Xen saved domain, xl format\n \0 \r";
> +
> ++#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
> + static const char migrate_receiver_banner[]=
> +     "xl migration receiver ready, send binary domain data.\n";
> + static const char migrate_receiver_ready[]=
> +@@ -100,6 +101,8 @@ static const char migrate_permission_to_go[]=
> +     "domain is yours, you are cleared to unpause";
> + static const char migrate_report[]=
> +     "my copy unpause results are as follows";
> ++#endif
> ++
> +   /* followed by one byte:
> +    *     0: everything went well, domain is running
> +    *            next thing is we all exit
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index de8c168..e911415 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,6 +151,7 @@ PACKAGES = "\
>      ${PN}-base \
>      ${PN}-blktap \
>      ${PN}-console \
> +    ${PN}-cpuid \
>      ${PN}-dbg \
>      ${PN}-dev \
>      ${PN}-devd \
> @@ -196,6 +197,7 @@ PACKAGES = "\
>      ${PN}-libxenvchan-dev \
>      ${PN}-libxlutil \
>      ${PN}-libxlutil-dev \
> +    ${PN}-livepatch \
>      ${PN}-misc \
>      ${PN}-pygrub \
>      ${PN}-python \
> @@ -369,6 +371,10 @@ FILES_${PN}-console = "\
>      ${sbindir}/xenconsoled \
>      "
>
> +FILES_${PN}-cpuid = "\
> +    ${bindir}/xen-cpuid \
> +    "
> +
>  FILES_${PN}-devd = "\
>      ${sysconfdir}/init.d/xendriverdomain \
>      "
> @@ -399,6 +405,10 @@ FILES_${PN}-kdd = "\
>      ${sbindir}/kdd \
>      "
>
> +FILES_${PN}-livepatch += " \
> +    ${sbindir}/xen-livepatch \
> +    "
> +
>  FILES_${PN}-misc = "\
>      ${bindir}/xencons \
>      ${bindir}/xencov_split \
> @@ -527,6 +537,7 @@ FILES_${PN}-remus = "\
>      "
>
>  FILES_${PN}-scripts-network = " \
> +    ${sysconfdir}/xen/scripts/colo-proxy-setup \
>      ${sysconfdir}/xen/scripts/network-bridge \
>      ${sysconfdir}/xen/scripts/network-nat \
>      ${sysconfdir}/xen/scripts/network-route \
> @@ -544,6 +555,7 @@ FILES_${PN}-scripts-block = " \
>      ${sysconfdir}/xen/scripts/blktap \
>      ${sysconfdir}/xen/scripts/block \
>      ${sysconfdir}/xen/scripts/block-common.sh \
> +    ${sysconfdir}/xen/scripts/block-dummy \
>      ${sysconfdir}/xen/scripts/block-enbd \
>      ${sysconfdir}/xen/scripts/block-iscsi \
>      ${sysconfdir}/xen/scripts/block-nbd \
> @@ -744,9 +756,11 @@ export XEN_OS = "Linux"
>
>  # this is used for the header (#!${bindir}/python) of the install python
> scripts
>  export PYTHONPATH="${bindir}/python"
> +export ac_cv_path_PYTHONPATH="${bindir}/python"
>
> -# seabios forcefully sets HOSTCC to CC - fixup to allow it to build
> native conf executable
> +# xen and seabios require HOSTCC and HOSTCXX set to cross-compile
>  export HOSTCC="${BUILD_CC}"
> +export HOSTCXX="${BUILD_CXX}"
>
>  # make xen requires CROSS_COMPILE set by hand as it does not abide by
> ./configure
>  export CROSS_COMPILE="${TARGET_PREFIX}"
> @@ -837,6 +851,9 @@ do_configure() {
>  }
>
>  do_compile() {
> +    # workaround for build bug when CFLAGS is exported
> +    # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
> +    unset CFLAGS
>      oe_runmake
>  }
>
> diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/
> xen_4.6.1.bb
> deleted file mode 100644
> index 0adf8ad..0000000
> --- a/recipes-extended/xen/xen_4.6.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require xen.inc
> -
> -SRC_URI = " \
> -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> -    "
> -
> -SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
> -SRC_URI[sha256sum] =
> "44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589"
> -
> -S = "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/
> xen_4.7.0.bb
> new file mode 100644
> index 0000000..adb5c36
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.7.0.bb
> @@ -0,0 +1,11 @@
> +require xen.inc
> +
> +SRC_URI = " \
> +    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> +    file://libxl-compilation-warning-fix-for-arm-aarch64.patch \
> +    "
> +
> +SRC_URI[md5sum] = "3aa4e01bf37a3a5bc8572907cb88e649"
> +SRC_URI[sha256sum] =
> "be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623"
> +
> +S = "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> index a86a501..e10d669 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,15 +1,16 @@
>  require xen.inc
>
> -SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
> +SRCREV ?= "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"
>
> -XEN_REL="4.6"
> +XEN_REL ?= "4.7"
> +XEN_BRANCH ?= "staging-${XEN_REL}"
>
> -PV = "${XEN_REL}.0+git${SRCPV}"
> +PV = "${XEN_REL}+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
>  SRC_URI = " \
> -    git://xenbits.xen.org/xen.git;branch=staging-${XEN_REL} \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      "
>
>  DEFAULT_PREFERENCE = "-1"
> --
> 2.1.4
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

--001a11450cb0db50c60538f9bf5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 27, 2016 at 4:30 PM, Chris Patterson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chris Patterson &=
lt;<a href=3D"mailto:pattersonc@ainfosec.com">pattersonc@ainfosec.com</a>&g=
t;<br>
<br>
- update packages and add additional ones for new binaries<br>
=C2=A0 (cpuid and livepatch)<br>
- update xen_git to point to 4.7, make branch=3D fully variable,<br>
=C2=A0 and remove assumed .0 from release version<br>
- add patch to fix compilation of xen with gcc 6 on arm/aarch64<br>
<br>
Build tested x86_64 and aarch64 targets.<br></blockquote><div><br></div><di=
v>It&#39;s been 4 days, and no comments, so I&#39;ve pushed this patch. If =
anyone has issues or comments, we can do incremental patches.</div><div><br=
></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0...l-compilation-warning-fix-for-arm-aarch64.patch | 58 +++++++++++++=
+++++++++<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.7.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++--<br>
=C2=A05 files changed, 92 insertions(+), 15 deletions(-)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/libxl-compilation-warni=
ng-fix-for-arm-aarch64.patch<br>
=C2=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.6.1.b=
b" rel=3D"noreferrer" target=3D"_blank">xen_4.6.1.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.7.0.b=
b" rel=3D"noreferrer" target=3D"_blank">xen_4.7.0.bb</a><br>
<br>
diff --git a/recipes-extended/xen/files/libxl-compilation-warning-fix-for-a=
rm-aarch64.patch b/recipes-extended/xen/files/libxl-compilation-warning-fix=
-for-arm-aarch64.patch<br>
new file mode 100644<br>
index 0000000..baab928<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarc=
h64.patch<br>
@@ -0,0 +1,58 @@<br>
+Upstream-Status: Submitted<br>
+<br>
+From 3716a7faf98e1e126d47fe1596593917c27ee1bd Mon Sep 17 00:00:00 2001<br>
+From: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.com">patte=
rsonc@ainfosec.com</a>&gt;<br>
+Date: Tue, 26 Jul 2016 16:01:47 -0400<br>
+Subject: [PATCH] libxl: compilation warning fix for arm &amp; aarch64<br>
+<br>
+GCC 6 will warn on unused static const variables in c modules:<br>
+<a href=3D"https://gcc.gnu.org/ml/gcc-patches/2015-09/msg00847.html" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/ml/gcc-patches/2015-0=
9/msg00847.html</a><br>
+<br>
+When compiling with LIBXL_HAVE_NO_SUSPEND_RESUME set (arm &amp; aarch64),<=
br>
+the compiler emits the following errors:<br>
+=C2=A0 xl_cmdimpl.c:101:19: error: &#39;migrate_report&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 defined but not used [-Werror=3Dunused-const-variable=
=3D]<br>
+=C2=A0 xl_cmdimpl.c:99:19: error: &#39;migrate_permission_to_go&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 defined but not used [-Werror=3Dunused-const-variable=
=3D]<br>
+=C2=A0 xl_cmdimpl.c:97:19: error: &#39;migrate_receiver_ready&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 defined but not used [-Werror=3Dunused-const-variable=
=3D]<br>
+=C2=A0 xl_cmdimpl.c:95:19: error: &#39;migrate_receiver_banner&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 defined but not used [-Werror=3Dunused-const-variable=
=3D]<br>
+<br>
+These unused const variables are only used in functions which exist betwee=
n<br>
+the ifndef block:<br>
+=C2=A0 =C2=A0#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME<br>
+=C2=A0 =C2=A0...<br>
+=C2=A0 =C2=A0#endif<br>
+<br>
+Wrap the same ifndef around these variables.<br>
+<br>
+Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.c=
om">pattersonc@ainfosec.com</a>&gt;<br>
+---<br>
+ tools/libxl/xl_cmdimpl.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/tools/libxl/xl_cmdimpl.c b/tools/libxl/xl_cmdimpl.c<br>
+index d1fcfa4..ada8178 100644<br>
+--- a/tools/libxl/xl_cmdimpl.c<br>
++++ b/tools/libxl/xl_cmdimpl.c<br>
+@@ -92,6 +92,7 @@ static int fd_lock =3D -1;<br>
+ static const char savefileheader_magic[32]=3D<br>
+=C2=A0 =C2=A0 =C2=A0&quot;Xen saved domain, xl format\n \0 \r&quot;;<br>
+<br>
++#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME<br>
+ static const char migrate_receiver_banner[]=3D<br>
+=C2=A0 =C2=A0 =C2=A0&quot;xl migration receiver ready, send binary domain =
data.\n&quot;;<br>
+ static const char migrate_receiver_ready[]=3D<br>
+@@ -100,6 +101,8 @@ static const char migrate_permission_to_go[]=3D<br>
+=C2=A0 =C2=A0 =C2=A0&quot;domain is yours, you are cleared to unpause&quot=
;;<br>
+ static const char migrate_report[]=3D<br>
+=C2=A0 =C2=A0 =C2=A0&quot;my copy unpause results are as follows&quot;;<br=
>
++#endif<br>
++<br>
+=C2=A0 =C2=A0/* followed by one byte:<br>
+=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A00: everything went well, domain is runn=
ing<br>
+=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next thing is we =
all exit<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index de8c168..e911415 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -151,6 +151,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-base \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-blktap \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-console \<br>
+=C2=A0 =C2=A0 ${PN}-cpuid \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-dbg \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-dev \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-devd \<br>
@@ -196,6 +197,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-libxenvchan-dev \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-libxlutil \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-libxlutil-dev \<br>
+=C2=A0 =C2=A0 ${PN}-livepatch \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-misc \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-pygrub \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-python \<br>
@@ -369,6 +371,10 @@ FILES_${PN}-console =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenconsoled \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+FILES_${PN}-cpuid =3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/xen-cpuid \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0FILES_${PN}-devd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xendriverdomain \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -399,6 +405,10 @@ FILES_${PN}-kdd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/kdd \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+FILES_${PN}-livepatch +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${sbindir}/xen-livepatch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0FILES_${PN}-misc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xencons \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xencov_split \<br>
@@ -527,6 +537,7 @@ FILES_${PN}-remus =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-scripts-network =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/xen/scripts/colo-proxy-setup \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-bridge \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-nat \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-route \<br>
@@ -544,6 +555,7 @@ FILES_${PN}-scripts-block =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/blktap \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block-common.sh \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/xen/scripts/block-dummy \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block-enbd \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block-iscsi \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block-nbd \<br>
@@ -744,9 +756,11 @@ export XEN_OS =3D &quot;Linux&quot;<br>
<br>
=C2=A0# this is used for the header (#!${bindir}/python) of the install pyt=
hon scripts<br>
=C2=A0export PYTHONPATH=3D&quot;${bindir}/python&quot;<br>
+export ac_cv_path_PYTHONPATH=3D&quot;${bindir}/python&quot;<br>
<br>
-# seabios forcefully sets HOSTCC to CC - fixup to allow it to build native=
 conf executable<br>
+# xen and seabios require HOSTCC and HOSTCXX set to cross-compile<br>
=C2=A0export HOSTCC=3D&quot;${BUILD_CC}&quot;<br>
+export HOSTCXX=3D&quot;${BUILD_CXX}&quot;<br>
<br>
=C2=A0# make xen requires CROSS_COMPILE set by hand as it does not abide by=
 ./configure<br>
=C2=A0export CROSS_COMPILE=3D&quot;${TARGET_PREFIX}&quot;<br>
@@ -837,6 +851,9 @@ do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
+=C2=A0 =C2=A0 # workaround for build bug when CFLAGS is exported<br>
+=C2=A0 =C2=A0 # <a href=3D"https://www.mail-archive.com/xen-devel@lists.xe=
n.org/msg67822.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-=
archive.com/xen-devel@lists.xen.org/msg67822.html</a><br>
+=C2=A0 =C2=A0 unset CFLAGS<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake<br>
=C2=A0}<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"no=
referrer" target=3D"_blank">xen_4.6.1.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.6.1.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.6.1.bb<=
/a><br>
deleted file mode 100644<br>
index 0adf8ad..0000000<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.1.bb</a><br>
+++ /dev/null<br>
@@ -1,10 +0,0 @@<br>
-require xen.inc<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://bits.xensource.com/oss-xen/release/${PV}/x=
en-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://bits.xensource=
.com/oss-xen/release/${PV}/xen-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;df2d854c3c90ffeefaf71e7f868fb326&quot;<br>
-SRC_URI[sha256sum] =3D &quot;44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3=
e9a9226da88ddb5f589&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">xen_4.7.0.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.7.0.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.7.0.bb<=
/a><br>
new file mode 100644<br>
index 0000000..adb5c36<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.7.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.7.0.bb</a><br>
@@ -0,0 +1,11 @@<br>
+require xen.inc<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"http://bits.xensource.com/oss-xen/release/${PV}/x=
en-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://bits.xensource=
.com/oss-xen/release/${PV}/xen-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 file://libxl-compilation-warning-fix-for-arm-aarch64.patch \=
<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;3aa4e01bf37a3a5bc8572907cb88e649&quot;<br>
+SRC_URI[sha256sum] =3D &quot;be5876144d49729572ae06142e0bb93f1c1f269557814=
1eff2931995add24623&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a href=3D"=
http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xen_git.bb</a><br>
index a86a501..e10d669 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
@@ -1,15 +1,16 @@<br>
=C2=A0require xen.inc<br>
<br>
-SRCREV =3D &quot;1fd615aa0108490ffc558d27627f509183cbfdaf&quot;<br>
+SRCREV ?=3D &quot;9a6cc4f5c14b3d7542b7523f88a1b65464733d3a&quot;<br>
<br>
-XEN_REL=3D&quot;4.6&quot;<br>
+XEN_REL ?=3D &quot;4.7&quot;<br>
+XEN_BRANCH ?=3D &quot;staging-${XEN_REL}&quot;<br>
<br>
-PV =3D &quot;${XEN_REL}.0+git${SRCPV}&quot;<br>
+PV =3D &quot;${XEN_REL}+git${SRCPV}&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.git;branch=3Dsta=
ging-${XEN_REL}" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/xen.g=
it;branch=3Dstaging-${XEN_REL}</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.git;branch=3D${X=
EN_BRANCH}" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/xen.git;br=
anch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a11450cb0db50c60538f9bf5a--

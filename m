Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 924CEE005B9; Wed, 20 May 2015 05:15:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FD24E0027F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 May 2015 05:15:22 -0700 (PDT)
Received: by yked142 with SMTP id d142so4365294yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 May 2015 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IIgzQ8bBwwCYT23lo/PqOJbn+hx9h6dR931ocdyyX3A=;
	b=H3eOMIZhR2xLGW3LSArXAyUnadTWWIS1RRZKRtpTkJUS6ayOaucgUhuCLbyNCrxd0A
	lgrUlAt4y/ETh/SuFNzKWKd8eUlvLBzwc+L7Z2AC0EmbVFz7wcJd2LZeO9OvDKxbls1r
	sD9CQeNHO5Of23ZeJKh2nU5kUpdIuXsmCd7vYqMuGJhMgzT+Px9bQb6d5qiNURZ9c5Wm
	/X5dNe/dGNoBbv/ZBN8Co1qB+NI0Ck+RM44SblO2hOPq9odqqWjv840bmH0kUwxB57Uu
	afZ9xXzlsPzsq5qucjgEQ3302MnrZF2u+pe9P9HDiWfSSZPLSi4LlGe6FD6vrZuxQUF3
	YArQ==
MIME-Version: 1.0
X-Received: by 10.170.134.12 with SMTP id a12mr35215887ykc.54.1432124121976;
	Wed, 20 May 2015 05:15:21 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 20 May 2015 05:15:21 -0700 (PDT)
In-Reply-To: <1431653089-19771-1-git-send-email-rongqing.li@windriver.com>
References: <1431653089-19771-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 20 May 2015 08:15:21 -0400
Message-ID: <CADkTA4N1a_7Yxx5EqOAHMag4fnmP0CRQ6gQPi3jOXeBYjyJrZg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: rongqing.li@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH][meta-virt] libvirt: upgrade to 1.2.15
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
X-List-Received-Date: Wed, 20 May 2015 12:15:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 14, 2015 at 9:24 PM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Remove libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch, since
> rules for install *.xml are changed, the race issue does not exist.
>

Thanks Roy. The changes have been merged.

Bruce

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc        |  4 +--
>  ...virt-Fix-cannot-symlink-cpu_map.xml-error.patch | 34 ----------------------
>  .../{libvirt_1.2.12.bb => libvirt_1.2.15.bb}       |  7 ++---
>  3 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
>  rename recipes-extended/libvirt/{libvirt_1.2.12.bb => libvirt_1.2.15.bb} (97%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 21cfa55..550236a 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "4255f2bfece23aacbc8d94256598b302"
> -SRC_URI[libvirt_python.sha256sum] = "432f438f9759e216424490f51a8804398b70fb1b2f2211f45fb05f72f5ad849f"
> +SRC_URI[libvirt_python.md5sum] = "f13b566b54fe71ec0f26992aee11dd09"
> +SRC_URI[libvirt_python.sha256sum] = "9a6dfbd487d49f887a41aca4bfb1b4e043fd9fbdfc041252cae84023f5c387ba"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
> deleted file mode 100644
> index 090bc6e..0000000
> --- a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory'
> -
> -In some very rare circumstances, libvirt's compile will try to create the
> -symlink for cpu_map.xml before creating the directory $(abs_builddir)/cpu.
> -
> -Add a test to create this directory if it hasn't already been created.
> -
> -Signed-off-by: Amy Fong <amy.fong@windriver.com>
> -
> ----
> - src/Makefile.am |    1 +
> - src/Makefile.in |    1 +
> - 2 files changed, 2 insertions(+)
> -
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -1053,6 +1053,7 @@
> - libvirt_cpu_la_DEPENDENCIES = $(abs_builddir)/cpu/cpu_map.xml
> -
> - $(abs_builddir)/cpu/cpu_map.xml:
> -+      if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
> -       $(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
> -
> - if WITH_VMX
> ---- a/src/Makefile.in
> -+++ b/src/Makefile.in
> -@@ -10338,6 +10338,7 @@
> -         $(srcdir)/lxc/lxc_controller_dispatch.h
> -
> - $(abs_builddir)/cpu/cpu_map.xml:
> -+      if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
> -       $(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
> -
> - %protocol.c: %protocol.x %protocol.h $(srcdir)/rpc/genprotocol.pl
> diff --git a/recipes-extended/libvirt/libvirt_1.2.12.bb b/recipes-extended/libvirt/libvirt_1.2.15.bb
> similarity index 97%
> rename from recipes-extended/libvirt/libvirt_1.2.12.bb
> rename to recipes-extended/libvirt/libvirt_1.2.15.bb
> index 298da2b..8abd41e 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.12.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.15.bb
> @@ -30,12 +30,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://runptest.patch \
>             file://run-ptest \
>             file://tests-allow-separated-src-and-build-dirs.patch \
> -           file://libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch \
>             file://libvirt-use-pkg-config-to-locate-libcap.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "2ae99535265ce4687d8718d744024c27"
> -SRC_URI[libvirt.sha256sum] = "eff5227f774560d97f0b44402a444e821c51e8cd44add89f74bc3c1f4dede66a"
> +SRC_URI[libvirt.md5sum] = "08c2ea825d076ee67b1bbc600c220b97"
> +SRC_URI[libvirt.sha256sum] = "5f88041b8c212f8f687c672fe583108833240d6175b512ce4de92ab6660194c6"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest
>
> @@ -102,7 +101,7 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
>         ${sysconfdir}/sysctl.d \
>         ${sysconfdir}/logrotate.d \
>         ${sysconfdir}/libvirt/libvirtd.conf \
> -        /usr/lib/sysctl.d/libvirtd.conf \
> +        /usr/lib/sysctl.d/60-libvirtd.conf \
>         ${sbindir}/libvirtd"
>
>  FILES_${PN}-virsh = "${bindir}/virsh"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


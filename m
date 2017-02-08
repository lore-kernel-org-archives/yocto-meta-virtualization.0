Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89194E00655; Wed,  8 Feb 2017 10:38:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65C01E004D8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 10:38:13 -0800 (PST)
Received: by mail-yb0-f193.google.com with SMTP id j82so6464138ybg.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Feb 2017 10:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZrAHG8KFmmUgezS1JJsm3u4hJJvI8kKYgkPtGdrwgGA=;
	b=tJccOHDsKyXJw3VB6JyfRBhl1WVRyUniZFkU4OY0R7Sn7x3ydulLoCfz4oKUYTIR3i
	phqiGNsYtjCGi5rT7zw4/40u3Q4AnlXuezDBpH1MkTe0esqN2GRipddJyoW3Mi8ttIwP
	tt7N/rbUgYdTV4qZXI7or1mnbtTtiH67oA/puoOOCRzl8xsv/A2R/Dc1ZrVGJm+3LxFY
	rqIGk2SvgOb5XI/NUU+b2sPwRtaw/uR9+RLKMQ++8GfK671cbA2x1qCCJP/J4l8UhO5N
	KD2+EpdYQgaoOlF1O9wpxeE78oEaGQwftpcghjuRqF1FgBXjVZQ+tI0IEBXhaMMz6SIc
	1+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=ZrAHG8KFmmUgezS1JJsm3u4hJJvI8kKYgkPtGdrwgGA=;
	b=S79MfUpzTvkvhpB/cVMw1DhF9kmh8Z6i9fFLOXM3/124YLffrv9wBWF1ZqobYwxOEN
	0fjh/MseCXWNiy+AuR/VI26LtCl5kavoHNx6di5dQMwGvvvT5ueop+ozU5lovu+E7TDW
	pbfNTlxvxW0EdgMGV2YCzNaoKpJlXj672RLXLS/jPUotkHEFoyVlYjNrrsF46BAo+SMW
	3mMlduY2ApYV3T/vWcoeRpOPRl31x5GN6YqSLbPaGor61PIZPHzl3C3ngdldKDaapieZ
	bvwNlnfppx+EIHsrknhXSdxhPQOXYA3Va2ziPRG/65AlMrqwgvlYqL1D1qV8d4bU1gVt
	y6Fg==
X-Gm-Message-State: AMke39nJgkOas+Lo7UCiCRYweTmyM2XsbpWtojSC3PLri+JhTzqeJMMX3b320GL6Wp/M7qwtlcc0Qoo+Wf2lBQ==
X-Received: by 10.37.177.167 with SMTP id h39mr16050313ybj.110.1486579092240; 
	Wed, 08 Feb 2017 10:38:12 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Wed, 8 Feb 2017 10:38:11 -0800 (PST)
In-Reply-To: <1486573071-2022-1-git-send-email-amarnath.valluri@intel.com>
References: <1486573071-2022-1-git-send-email-amarnath.valluri@intel.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 8 Feb 2017 13:38:11 -0500
X-Google-Sender-Auth: KJopA3UgaEg4mC6QcLLw2jim94I
Message-ID: <CAPuovEJ5aUwU6TUzJc6KZUxcQnEKwew4-XikKTRu+QW54kNcBA@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] libvirt: Place systemd units at appropriate location.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2017 18:38:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 11:57 AM, Amarnath Valluri
<amarnath.valluri@intel.com> wrote:
> Systemd untis should be placed as per ${systemd_system_unitdir}.
>
> Patched the source code to support configure variable to set the systemd units
> directory.
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---

Thanks for making the change, these are good updates.

Mark

>  ...gure-variable-for-placing-systemd-untis-l.patch | 55 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.3.5.bb          |  3 +-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
>
> diff --git a/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch b/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
> new file mode 100644
> index 0000000..a64739c
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
> @@ -0,0 +1,55 @@
> +From 531178d7fbb5d4b3404766cfd0fc999398cccd58 Mon Sep 17 00:00:00 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Wed, 8 Feb 2017 18:39:48 +0200
> +Subject: [PATCH] Added configure variable for placing systemd untis location
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac       | 3 +++
> + daemon/Makefile.am | 1 -
> + tools/Makefile.am  | 1 -
> + 3 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0e5b8e3..5a6408c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2687,6 +2687,9 @@ AC_DEFINE_UNQUOTED([isbase64],[libvirt_gl_isbase64],[Hack to avoid symbol clash]
> + AC_DEFINE_UNQUOTED([base64_encode],[libvirt_gl_base64_encode],[Hack to avoid symbol clash])
> + AC_DEFINE_UNQUOTED([base64_encode_alloc],[libvirt_gl_base64_encode_alloc],[Hack to avoid symbol clash])
> +
> ++AC_ARG_VAR(SYSTEMD_UNIT_DIR, 'location for systemd units, defautls to /lib/systemd/system')
> ++AS_IF([test "x$SYSTEMD_UNIT_DIR" = "x"], [SYSTEMD_UNIT_DIR="/lib/systemd/system"])
> ++
> + AC_CONFIG_FILES([run],
> +                 [chmod +x,-w run])
> + AC_CONFIG_FILES([\
> +diff --git a/daemon/Makefile.am b/daemon/Makefile.am
> +index edb75e8..2ab42a6 100644
> +--- a/daemon/Makefile.am
> ++++ b/daemon/Makefile.am
> +@@ -449,7 +449,6 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
> +
> + if LIBVIRT_INIT_SCRIPT_SYSTEMD
> +
> +-SYSTEMD_UNIT_DIR = /lib/systemd/system
> + BUILT_SOURCES += libvirtd.service
> +
> + install-init-systemd: install-sysconfig libvirtd.service
> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> +index 27ecbf1..8cefe1a 100644
> +--- a/tools/Makefile.am
> ++++ b/tools/Makefile.am
> +@@ -380,7 +380,6 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
> +
> +
> + EXTRA_DIST += libvirt-guests.service.in
> +-SYSTEMD_UNIT_DIR = /lib/systemd/system
> +
> + if LIBVIRT_INIT_SCRIPT_SYSTEMD
> + install-systemd: libvirt-guests.service install-sysconfig libvirt-guests.sh
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index c848c99..152130d 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
>             file://0001-ptest-add-missing-test_helper-files.patch \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
> +          file://0001-Added-configure-variable-for-placing-systemd-untis-l.patch \
>            "
>
>  SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
> @@ -264,7 +265,7 @@ EXTRA_OECONF += " \
>      --with-init-script=systemd \
>      "
>
> -EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
> +EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
>
>  do_compile_ptest() {
>         oe_runmake -C tests buildtest-TESTS
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3A92E00D17; Mon,  6 Nov 2017 05:52:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16514E00D03
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 05:52:58 -0800 (PST)
Received: by mail-qt0-f194.google.com with SMTP id v41so10915390qtv.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 05:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QP/nqkmGP+8glmwAtR7TgqzaDgU/+jvWxu+BktHL/wY=;
	b=nqgybEkWskyNAQ0xH0SyIoJHEsVQAxxtmn7TIKPWVrm3c7dIurZqQIOkt6DIFzNmK1
	9Kxm8PpY/zDlXKliFcoFQ9HCAZlIRvfcSlxsOD1qeS6nUQTewda+nJWarZT4C6+eGd3g
	71zqT6gJ85FPXrm8/O/kAtQIFuevdBc83RHceFy64+J5+2kZ6fwG6azmBimO1/lRUIbb
	yJgGHFOZzkB6NZFMORu7c8Vfl7GrxkIJ8LqnddBhcHgW2Szl4EIey9pTTrnfp3j3x+Xl
	qRur+rXWNk5ubK3csinzzf+rYXF92Z2odnMo7KzU146EhvTk4zwwYUlyGLLbWiTfBMVT
	zmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QP/nqkmGP+8glmwAtR7TgqzaDgU/+jvWxu+BktHL/wY=;
	b=Hdbjv1NvqCwA4znFe3DfgkOvV+3DAkWaDtMNNI5D4zQyg2B6KT5npYqL85aGRnczqx
	qrj/amyysWflukliVzccPI6B7gRXMmy2PW+9HFOBs8wAQwy6Zn02vFOcFDeb6HLNPrVn
	LNOJPYPoQPLlO5+wiZe+5Gvql+UZ6AMN9kg5UR6oQwQQQ4qEnG3156tJl2QNRlxY2z6r
	EZ4B6KWV1KjcM9Ut7Z+o3RgKRIVOmlrVgzFH0MyLOhDmpn/OOUPktb5iyRD/nfrqOzt/
	B3YQbTTq4QT0w/lvbDd5F/sN6JDQ1V6UEcId0839i49MQpOWkwYBDs7qnuI8VJS+N7hm
	GH3w==
X-Gm-Message-State: AMCzsaUZr6+FWyoZIiIp0fgjA1Yud2wT+81iMR2OGmgN/S1p4VfczrHa
	TcUJnSV/lj4I6yCrEb2rfvSqKGQhyLijeYJoO5ZQsA==
X-Google-Smtp-Source: ABhQp+RCX5pu3umK7EBNVDbzoCMpNyilW7C7/Cc+HQasW0CSXCQpi6L1trQjguscEXpr8xXA6QujE+ol7+vaGss77j4=
X-Received: by 10.200.48.171 with SMTP id v40mr22523351qta.120.1509976378143; 
	Mon, 06 Nov 2017 05:52:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Mon, 6 Nov 2017 05:52:57 -0800 (PST)
In-Reply-To: <20171105121541.10625-1-dariusz.pelowski@gmail.com>
References: <20171105121541.10625-1-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2017 08:52:57 -0500
Message-ID: <CADkTA4OCtLDZbwquHADbcHmdV2N9oGZeUnQogE0jGM6mRegfag@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] kvmtool: fix compilation errors
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
X-List-Received-Date: Mon, 06 Nov 2017 13:52:59 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sun, Nov 5, 2017 at 7:15 AM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> Fixed issues:
> Usage of makedev requires including <sys/sysmacros.h> otherwise
> the error is raised due to multiple definition in <sys/types.h>.
>
> Add include path to kernel headers required to get kvmtool
> compilatioin successful.
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> ---
>  .../0001-kvmtool-9p-fixed-compilation-error.patch  | 27 ++++++++++++++++++++
>  .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29 ++++++++++++++++++++++
>  recipes-extended/kvmtool/kvmtool.bb                |  7 +++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
>  create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
>
> diff --git a/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch b/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
> new file mode 100644
> index 0000000..63911fc
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
> @@ -0,0 +1,27 @@
> +From bcd954ffdb9383030e02d356b51e09e4e2a7105a Mon Sep 17 00:00:00 2001
> +From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> +Date: Sun, 5 Nov 2017 12:39:52 +0100
> +Subject: [PATCH 1/2] kvmtool: 9p: fixed compilation error
> +
> +makedev is defined in sys/sysmacros.h
> +
> +Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> +---
> + virtio/9p.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/virtio/9p.c b/virtio/9p.c
> +index 6acbfdd..1dee2c2 100644
> +--- a/virtio/9p.c
> ++++ b/virtio/9p.c
> +@@ -15,6 +15,7 @@
> + #include <string.h>
> + #include <errno.h>
> + #include <sys/vfs.h>
> ++#include <sys/sysmacros.h>
> +
> + #include <linux/virtio_ring.h>
> + #include <linux/virtio_9p.h>
> +--
> +2.15.0
> +
> diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
> new file mode 100644
> index 0000000..262531c
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
> @@ -0,0 +1,29 @@
> +From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 2001
> +From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> +Date: Sun, 5 Nov 2017 12:39:21 +0100
> +Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
> +
> +to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
> +for setting via command argument
> +
> +Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> +---
> + Makefile | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 64a0a16..bca1b26 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,6 +2,8 @@
> + # Define WERROR=0 to disable -Werror.
> + #
> +
> ++CFLAGS += $(EXTRA_CFLAGS)
> ++
> + ifeq ($(strip $(V)),)
> +       E = @echo
> +       Q = @
> +--
> +2.15.0
> +
> diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
> index b3bf202..33fec31 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -5,10 +5,15 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>
>  DEPENDS = "dtc libaio zlib"
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +
> +inherit kernel-arch
>
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
>             file://external-crosscompiler.patch \
>             file://0001-Avoid-pointers-for-address-of-packed-members.patch \
> +           file://0001-kvmtool-9p-fixed-compilation-error.patch \
> +           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
>             "
>
>  SRCREV = "3fea89a924511f9f8fe05a892098fad77c1eca0d"
> @@ -16,7 +21,7 @@ PV = "3.18.0+git${SRCREV}"
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE='ARCH="${TARGET_ARCH}" V=1'
> +EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_DIR}/arch/${ARCH}/include -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated/"'
>
>  do_install() {
>      install -d ${D}${bindir}
> --
> 2.15.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


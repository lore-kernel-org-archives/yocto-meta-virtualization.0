Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1347.1596414246784420273
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 02 Aug 2020 17:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pn+mGOf/;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2F0AE01F71; Sun,  2 Aug 2020 17:24:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.193 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89FCEE01F6F
	for <meta-virtualization@yoctoproject.org>; Sun,  2 Aug 2020 17:24:04 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id b14so32100175qkn.4
        for <meta-virtualization@yoctoproject.org>; Sun, 02 Aug 2020 17:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=sX6WfxUn5RFzvxgja/jAQfGDq/ZWX8RaOJhyr9jHnsU=;
        b=Pn+mGOf/soXQll6rkrEfFlpTd0Ya7FcpZMHLxtEqhO4EGbN1oLzaRzoMlVesE0zB0m
         SmGLiAv7nLuBjixHiZNLkrJu27xPhLuFAov3pI1WP7dF2EaixJpXCgzYFVCamRez2mPS
         yrV89rOaAWqJ05g+RvPpWi8wkad5uV/+Ll8onmTxysdy4jl7memuVhCnOEzktb6Q95Mg
         FTmgIsWR4xFrllYDGXti18Ktclbqqd40guKV680o0gsslZtzSuwBSWvWM74FnJK9r5Yh
         S2XUtqPRiSa/cDLM5wJ/ly3YDUWWPU1y7k4cYF7COWBh+7/3X2jXKwR+Ej8F/uZHeY9E
         Gyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sX6WfxUn5RFzvxgja/jAQfGDq/ZWX8RaOJhyr9jHnsU=;
        b=WPZFF7YpUxSmLkGZdONpvdi8RoT7/pKRgRsoRjOpLcF757I2sjpQFJDPp4VH4bNcD8
         7yi0KgAqkU0laj6yE6kCo0xBE8jo3nPAdukaC7+PXWo+MrApVsLkwMvRCcDj3ANp9Jyz
         A4B827oBFNHMJSlgpxWAYu5nRRT3y9anG1xOOmmzZ+EyeAR4eQswuQltjJFCcuD/Yrhm
         vtnKcA/wQk8/VePGA4CkZ9c+4ZT7iQAPkofaxb0zdFUN84oOHJUmY7u3ulS8SSEQjkHt
         afBLxld/ww28/lwDsWoYYBdMCN3qXS4AvzIPqHInfZPAjDFwBH1UevahFHMtrhwrWU3Y
         l7hA==
X-Gm-Message-State: AOAM532kS0DjEu9R20+z0fQktfbpyW+xZXXrkgIWGQ5FrDlbKKO+C3PM
	RjQO1VRwdCm/enV0bZlGLfo=
X-Google-Smtp-Source: ABdhPJw/7sFoyEXlAS+FDTaupxYSxE4FhBP6rRZDLocggz+Ztj+WeVszHUq4WAQ2tAhI/DirC3orNQ==
X-Received: by 2002:a37:48ce:: with SMTP id v197mr7059622qka.458.1596414243489;
        Sun, 02 Aug 2020 17:24:03 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n85sm18718658qkn.80.2020.08.02.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 17:24:02 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:24:01 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH 1/3] xen: upgrade to Xen 4.14 as default and advance the git recipe version
Message-ID: <20200803002356.GA7925@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200730172041.32126-2-christopher.w.clark@gmail.com>
 <20200730172041.32126-3-christopher.w.clark@gmail.com>
 <20200730172041.32126-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks!

These are now merged.

Bruce

In message: [meta-virtualization][PATCH 1/3] xen: upgrade to Xen 4.14 as default and advance the git recipe version
on 30/07/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> Release announcement for Xen 4.14:
> https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01263.html
> 
> Make the 4.14 recipe the default preference and advance the git recipe
> onto the current 4.15 development branch. Retire the patches for the
> earlier versions.
> 
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch | 64 -------------------
>  ...xen-build-temporarily-inhibit-Werror.patch | 42 ------------
>  .../files/xen-tools-kdd-fix-build-again.patch | 39 -----------
>  ...g-0-arrays-to-access-packet-contents.patch | 60 -----------------
>  recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
>  recipes-extended/xen/xen-tools_git.bb         | 16 ++---
>  recipes-extended/xen/xen_4.14.bb              |  4 +-
>  recipes-extended/xen/xen_git.bb               | 10 +--
>  8 files changed, 16 insertions(+), 223 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
>  delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
> 
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> deleted file mode 100644
> index 96e907d..0000000
> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -Date: Fri, 19 Oct 2018 11:01:37 +0200
> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
> -
> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> -as well as other parameters set by the OpenEmbedded build system.
> -This is especially useful when the target libdir is not the default one
> -(/usr/lib), but for example /usr/lib64.
> -
> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -
> -Forward-ported to Xen 4.12.0
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Modified to support pygrub installation with python 3
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> -index 3063c49..513314b 100644
> ---- a/tools/pygrub/Makefile
> -+++ b/tools/pygrub/Makefile
> -@@ -10,14 +10,17 @@ INSTALL_LOG = build/installed_files.txt
> - all: build
> - .PHONY: build
> - build:
> --	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> -+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> - 
> - .PHONY: install
> - install: all
> - 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
> - 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> - 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> --		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
> -+		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force \
> -+		 $(DISTUTILS_INSTALL_ARGS)
> -+	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> -+	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> - 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
> - 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
> - 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> -diff --git a/tools/python/Makefile b/tools/python/Makefile
> -index 541858e..4d4a344 100644
> ---- a/tools/python/Makefile
> -+++ b/tools/python/Makefile
> -@@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
> - 
> - .PHONY: build
> - build:
> --	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
> -+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> - 
> - .PHONY: install
> - install:
> -@@ -18,7 +18,7 @@ install:
> - 
> - 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> - 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> --		--root="$(DESTDIR)" --force
> -+		--root="$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
> - 
> - 	$(INSTALL_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
> - 	$(INSTALL_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
> diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
> deleted file mode 100644
> index ba97c4b..0000000
> --- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Thu, 18 Jun 2020 09:05:22 -0400
> -Subject: [PATCH] xen/build: temporarily inhibit Werror
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Rebased on Xen 4.13:
> -Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ----
> - tools/libxl/Makefile | 2 +-
> - xen/Rules.mk         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> -index 6da342ed61..c67560e269 100644
> ---- a/tools/libxl/Makefile
> -+++ b/tools/libxl/Makefile
> -@@ -14,7 +14,7 @@ MINOR = 0
> - XLUMAJOR = 4.13
> - XLUMINOR = 0
> - 
> --CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
> -+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> - 	-Wno-declaration-after-statement -Wformat-nonliteral
> - CFLAGS += -I. -fPIC
> - 
> -diff --git a/xen/Rules.mk b/xen/Rules.mk
> -index a151b3f625..a05ceec1e5 100644
> ---- a/xen/Rules.mk
> -+++ b/xen/Rules.mk
> -@@ -54,7 +54,7 @@ CFLAGS += -fomit-frame-pointer
> - endif
> - 
> - CFLAGS += -nostdinc -fno-builtin -fno-common
> --CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> -+CFLAGS += -Wredundant-decls -Wno-pointer-arith
> - $(call cc-option-add,CFLAGS,CC,-Wvla)
> - CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
> - CFLAGS-$(CONFIG_DEBUG_INFO) += -g
> --- 
> -2.19.1
> -
> diff --git a/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch b/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
> deleted file mode 100644
> index 6122999..0000000
> --- a/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From d44cbbe0f3243afcc56e47dcfa97bbfe23e46fbb Mon Sep 17 00:00:00 2001
> -From: Wei Liu <wl@xen.org>
> -Date: Fri, 3 Jul 2020 20:10:01 +0000
> -Subject: [PATCH] kdd: fix build again
> -
> -Restore Tim's patch. The one that was committed was recreated by me
> -because git didn't accept my saved copy. I made some mistakes while
> -recreating that patch and here we are.
> -
> -Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
> -Reported-by: Michael Young <m.a.young@durham.ac.uk>
> -Signed-off-by: Wei Liu <wl@xen.org>
> -Reviewed-by: Tim Deegan <tim@xen.org>
> -Release-acked-by: Paul Durrant <paul@xen.org>
> ----
> - tools/debugger/kdd/kdd.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> -index 866532f0c7..a7d0976ea4 100644
> ---- a/tools/debugger/kdd/kdd.c
> -+++ b/tools/debugger/kdd/kdd.c
> -@@ -79,11 +79,11 @@ typedef struct {
> - /* State of the debugger stub */
> - typedef struct {
> -     union {
> --        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> -+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
> -         kdd_pkt txp;                 /* Also readable as a packet structure */
> -     };
> -     union {
> --        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
> -+        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
> -         kdd_pkt rxp;                 /* Also readable as a packet structure */
> -     };
> -     unsigned int cur;       /* Offset into rx where we'll put the next byte */
> --- 
> -2.17.1
> -
> diff --git a/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch b/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
> deleted file mode 100644
> index c1b110d..0000000
> --- a/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 3471cafbdda35eacf04670881dd2aee2558b4f08 Mon Sep 17 00:00:00 2001
> -From: Tim Deegan <tim@xen.org>
> -Date: Fri, 26 Jun 2020 10:40:44 +0000
> -Subject: [PATCH] kdd: stop using [0] arrays to access packet contents
> -
> -GCC 10 is unhappy about this, and we already use 64k buffers
> -in the only places where packets are allocated, so move the
> -64k size into the packet definition.
> -
> -Reported-by: Olaf Hering <olaf@aepfle.de>
> -Signed-off-by: Tim Deegan <tim@xen.org>
> -Acked-by: Wei Liu <wl@xen.org>
> -Release-acked-by: Paul Durrant <paul@xen.org>
> ----
> - tools/debugger/kdd/kdd.c | 4 ++--
> - tools/debugger/kdd/kdd.h | 3 +--
> - 2 files changed, 3 insertions(+), 4 deletions(-)
> -
> -diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> -index 3ebda9b12c..866532f0c7 100644
> ---- a/tools/debugger/kdd/kdd.c
> -+++ b/tools/debugger/kdd/kdd.c
> -@@ -79,11 +79,11 @@ typedef struct {
> - /* State of the debugger stub */
> - typedef struct {
> -     union {
> --        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
> -+        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> -         kdd_pkt txp;                 /* Also readable as a packet structure */
> -     };
> -     union {
> --        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for rx */
> -+        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
> -         kdd_pkt rxp;                 /* Also readable as a packet structure */
> -     };
> -     unsigned int cur;       /* Offset into rx where we'll put the next byte */
> -diff --git a/tools/debugger/kdd/kdd.h b/tools/debugger/kdd/kdd.h
> -index bfb00ba5c5..b9a17440df 100644
> ---- a/tools/debugger/kdd/kdd.h
> -+++ b/tools/debugger/kdd/kdd.h
> -@@ -68,7 +68,6 @@ typedef struct {
> -     uint16_t len;     /* Payload length, excl. header and trailing byte */
> -     uint32_t id;      /* Echoed in responses */
> -     uint32_t sum;     /* Unsigned sum of all payload bytes */
> --    uint8_t payload[0];
> - } PACKED kdd_hdr;
> - 
> - #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
> -@@ -323,7 +322,7 @@ typedef struct {
> -         kdd_msg msg;
> -         kdd_reg reg;
> -         kdd_stc stc;
> --        uint8_t payload[0];
> -+        uint8_t payload[65536];
> -     };
> - } PACKED kdd_pkt;
> - 
> --- 
> -2.17.1
> -
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
> index ef40c85..4119190 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
> +SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>  
>  XEN_REL ?= "4.14"
>  XEN_BRANCH ?= "stable-${XEN_REL}"
> @@ -15,7 +15,5 @@ PV = "${XEN_REL}+stable${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -DEFAULT_PREFERENCE ??= "-1"
> -
>  require xen.inc
>  require xen-tools.inc
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index 679feb1..71aeeed 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,21 +1,21 @@
> -SRCREV ?= "9f7e8bac4ca279b3bfccb5f3730fb2e5398c95ab"
> +SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>  
> -XEN_REL ?= "4.13"
> -XEN_BRANCH ?= "stable-${XEN_REL}"
> +XEN_REL ?= "4.15"
> +XEN_BRANCH ?= "master"
>  
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
> -    file://0001-xen-build-temporarily-inhibit-Werror.patch \
> -    file://xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch \
> -    file://xen-tools-kdd-fix-build-again.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> +    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
>      "
>  
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
>  
>  PV = "${XEN_REL}+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> +DEFAULT_PREFERENCE ??= "-1"
> +
>  require xen.inc
>  require xen-tools.inc
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
> index 02af2a7..0413bee 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
> +SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>  
>  XEN_REL ?= "4.14"
>  XEN_BRANCH ?= "stable-${XEN_REL}"
> @@ -14,7 +14,5 @@ PV = "${XEN_REL}+stable${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -DEFAULT_PREFERENCE ??= "-1"
> -
>  require xen.inc
>  require xen-hypervisor.inc
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 7765ed7..408bc3b 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,18 +1,20 @@
> -SRCREV ?= "9f7e8bac4ca279b3bfccb5f3730fb2e5398c95ab"
> +SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>  
> -XEN_REL ?= "4.13"
> -XEN_BRANCH ?= "stable-${XEN_REL}"
> +XEN_REL ?= "4.15"
> +XEN_BRANCH ?= "master"
>  
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>      "
>  
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
>  
>  PV = "${XEN_REL}+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> +DEFAULT_PREFERENCE ??= "-1"
> +
>  require xen.inc
>  require xen-hypervisor.inc
> -- 
> 2.17.1
> 

In message: [meta-virtualization][PATCH 3/3] xen, xen-tools: move tools-specific EXTRA_OECONF to xen-tools.inc
on 30/07/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> Since the hypervisor recipe does not install init scripts, it does not
> include update-rc.d.bbclass, which defines INIT_D_DIR; so move the use
> of that and systemd and qemu tools-specific configure settings over into
> the tools include file. Fix a hardcoded bindir while at it.
> 
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 8 ++++++++
>  recipes-extended/xen/xen.inc       | 5 -----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 99e7e0b..ace1a01 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -730,6 +730,14 @@ ADD_SYSROOT32_CFLAGS_x86-64 = \
>  # This x86-64 override is never intended for native use, so clear that.
>  ADD_SYSROOT32_CFLAGS_class-native = ""
>  
> +EXTRA_OECONF += " \
> +    --with-systemd=${systemd_unitdir}/system \
> +    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> +    --with-initddir=${INIT_D_DIR} \
> +    --with-sysconfig-leaf-dir=default \
> +    --with-system-qemu=${bindir}/qemu-system-i386 \
> +    "
> +
>  do_configure() {
>      do_configure_common
>  
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 3c1e3b9..9e8fcad 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -118,17 +118,12 @@ EXTRA_OECONF += " \
>      --exec-prefix=${prefix} \
>      --prefix=${prefix} \
>      --host=${HOST_SYS} \
> -    --with-systemd=${systemd_unitdir}/system \
> -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
>      --disable-stubdom \
>      --disable-ioemu-stubdom \
>      --disable-pv-grub \
>      --disable-xenstore-stubdom \
>      --disable-rombios \
>      --disable-ocamltools \
> -    --with-initddir=${INIT_D_DIR} \
> -    --with-sysconfig-leaf-dir=default \
> -    --with-system-qemu=/usr/bin/qemu-system-i386 \
>      --disable-qemu-traditional \
>      "
>  
> -- 
> 2.17.1
> 

In message: [meta-virtualization][PATCH 2/3] ipxe: fix build with gcc 10.1.0
on 30/07/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> Apply two upstream patches to fix compiler warnings.
> 
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  ...it-type-casts-for-nodnic_queue_pair_.patch | 43 +++++++++
>  ...-spurious-compiler-warning-on-GCC-10.patch | 89 +++++++++++++++++++
>  recipes-extended/ipxe/ipxe_git.bb             |  2 +
>  3 files changed, 134 insertions(+)
>  create mode 100644 recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
>  create mode 100644 recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch
> 
> diff --git a/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch b/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
> new file mode 100644
> index 0000000..62e8e9d
> --- /dev/null
> +++ b/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
> @@ -0,0 +1,43 @@
> +From 8a1d66c7aec020f3e90254ed2fa55ecd9494fcc3 Mon Sep 17 00:00:00 2001
> +From: Michael Brown <mcb30@ipxe.org>
> +Date: Sat, 27 Jun 2020 20:43:32 +0100
> +Subject: [PATCH] [golan] Add explicit type casts for nodnic_queue_pair_type
> +
> +GCC 10 emits warnings for implicit conversions of enumerated types.
> +
> +The flexboot_nodnic code defines nodnic_queue_pair_type with values
> +identical to those of ib_queue_pair_type, and implicitly casts between
> +them.  Add an explicit cast to fix the warning.
> +
> +Signed-off-by: Michael Brown <mcb30@ipxe.org>
> +---
> + src/drivers/infiniband/flexboot_nodnic.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/drivers/infiniband/flexboot_nodnic.c b/src/drivers/infiniband/flexboot_nodnic.c
> +index 93bb0544..7d039fff 100644
> +--- a/drivers/infiniband/flexboot_nodnic.c
> ++++ b/drivers/infiniband/flexboot_nodnic.c
> +@@ -365,7 +365,8 @@ static int flexboot_nodnic_create_qp ( struct ib_device *ibdev,
> + 		goto qp_alloc_err;
> + 	}
> + 
> +-	status = nodnic_port_create_qp(&port->port_priv, qp->type,
> ++	status = nodnic_port_create_qp(&port->port_priv,
> ++			(nodnic_queue_pair_type) qp->type,
> + 			qp->send.num_wqes * sizeof(struct nodnic_send_wqbb),
> + 			qp->send.num_wqes,
> + 			qp->recv.num_wqes * sizeof(struct nodnic_recv_wqe),
> +@@ -406,7 +407,8 @@ static void flexboot_nodnic_destroy_qp ( struct ib_device *ibdev,
> + 	struct flexboot_nodnic_port *port = &flexboot_nodnic->port[ibdev->port - 1];
> + 	struct flexboot_nodnic_queue_pair *flexboot_nodnic_qp = ib_qp_get_drvdata ( qp );
> + 
> +-	nodnic_port_destroy_qp(&port->port_priv, qp->type,
> ++	nodnic_port_destroy_qp(&port->port_priv,
> ++			(nodnic_queue_pair_type) qp->type,
> + 			flexboot_nodnic_qp->nodnic_queue_pair);
> + 
> + 	free(flexboot_nodnic_qp);
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch b/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch
> new file mode 100644
> index 0000000..e424d22
> --- /dev/null
> +++ b/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch
> @@ -0,0 +1,89 @@
> +From 28cf9806d1632d378485005babec295da0c77fcf Mon Sep 17 00:00:00 2001
> +From: Michael Brown <mcb30@ipxe.org>
> +Date: Sat, 27 Jun 2020 20:21:11 +0100
> +Subject: [PATCH] [intel] Avoid spurious compiler warning on GCC 10
> +
> +GCC 10 produces a spurious warning about an out-of-bounds array access
> +for the unsized raw dword array in union intelvf_msg.
> +
> +Avoid the warning by embedding the zero-length array within a struct.
> +
> +Signed-off-by: Michael Brown <mcb30@ipxe.org>
> +---
> + src/drivers/net/intelvf.c | 18 ++++++++++--------
> + src/drivers/net/intelvf.h |  8 +++++++-
> + 2 files changed, 17 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/drivers/net/intelvf.c b/src/drivers/net/intelvf.c
> +index ac6fea74..0d48b417 100644
> +--- a/drivers/net/intelvf.c
> ++++ b/drivers/net/intelvf.c
> +@@ -52,14 +52,15 @@ FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );
> +  */
> + static void intelvf_mbox_write ( struct intel_nic *intel,
> + 				 const union intelvf_msg *msg ) {
> ++	const struct intelvf_msg_raw *raw = &msg->raw;
> + 	unsigned int i;
> + 
> + 	/* Write message */
> + 	DBGC2 ( intel, "INTEL %p sending message", intel );
> +-	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( msg->dword[0] ) ) ; i++){
> +-		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), msg->dword[i] );
> +-		writel ( msg->dword[i], ( intel->regs + intel->mbox.mem +
> +-					  ( i * sizeof ( msg->dword[0] ) ) ) );
> ++	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( raw->dword[0] ) ) ; i++){
> ++		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), raw->dword[i] );
> ++		writel ( raw->dword[i], ( intel->regs + intel->mbox.mem +
> ++					  ( i * sizeof ( raw->dword[0] ) ) ) );
> + 	}
> + 	DBGC2 ( intel, "\n" );
> + }
> +@@ -72,14 +73,15 @@ static void intelvf_mbox_write ( struct intel_nic *intel,
> +  */
> + static void intelvf_mbox_read ( struct intel_nic *intel,
> + 				union intelvf_msg *msg ) {
> ++	struct intelvf_msg_raw *raw = &msg->raw;
> + 	unsigned int i;
> + 
> + 	/* Read message */
> + 	DBGC2 ( intel, "INTEL %p received message", intel );
> +-	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( msg->dword[0] ) ) ; i++){
> +-		msg->dword[i] = readl ( intel->regs + intel->mbox.mem +
> +-					( i * sizeof ( msg->dword[0] ) ) );
> +-		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), msg->dword[i] );
> ++	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( raw->dword[0] ) ) ; i++){
> ++		raw->dword[i] = readl ( intel->regs + intel->mbox.mem +
> ++					( i * sizeof ( raw->dword[0] ) ) );
> ++		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), raw->dword[i] );
> + 	}
> + 	DBGC2 ( intel, "\n" );
> + }
> +diff --git a/src/drivers/net/intelvf.h b/src/drivers/net/intelvf.h
> +index ab404698..ffb18e04 100644
> +--- a/drivers/net/intelvf.h
> ++++ b/drivers/net/intelvf.h
> +@@ -119,6 +119,12 @@ struct intelvf_msg_queues {
> + 	uint32_t dflt;
> + } __attribute__ (( packed ));
> + 
> ++/** Raw mailbox message */
> ++struct intelvf_msg_raw {
> ++	/** Raw dwords */
> ++	uint32_t dword[0];
> ++} __attribute__ (( packed ));
> ++
> + /** Mailbox message */
> + union intelvf_msg {
> + 	/** Message header */
> +@@ -132,7 +138,7 @@ union intelvf_msg {
> + 	/** Queue configuration message */
> + 	struct intelvf_msg_queues queues;
> + 	/** Raw dwords */
> +-	uint32_t dword[0];
> ++	struct intelvf_msg_raw raw;
> + };
> + 
> + /** Maximum time to wait for mailbox message
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
> index 47c5b7a..fbaad30 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -13,6 +13,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  SRC_URI = " \
>      git://git.ipxe.org/ipxe.git;protocol=https \
>      file://ipxe-fix-hostcc-nopie-cflags.patch \
> +    file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
> +    file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch \
>      "
>  
>  FILES_${PN} = "/usr/share/firmware/*.rom"
> -- 
> 2.17.1
> 


Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1546.1596129664671710345
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 10:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJ0mvNRj;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 385B1E01F52; Thu, 30 Jul 2020 10:21:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9030FE01F50
	for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:02 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id j187so26266785qke.11
        for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/e8Wxn7ONLV4oZlZM9wxT1C3/mMkYREL0sIH8CvEggw=;
        b=QJ0mvNRjPsUNTqrVK/sjF+5hXdzwlF9BFA41izMqMLTkzk2CGNKE2JAEC11N5Rmz+x
         gpVA0II/uCaJDeyHqVUDr3w3M1A2hOevKjsRM3ZtWoQU/EpuUMpMqImNmVcMw4erXQSi
         IFcwJHQCOwBiaSdfgjoQ45ouJP4mayxhWHcD00iEmyDM8pz6ZQfi23nK5leoiQRKUDSI
         h/FEUCesJ+Rkg/yX2VMBsI88msdzNWUmwldPippOc60Kc4nD2Bc5Nershw7YS/DBoDue
         HgfA1TZwWqyZjwEuCbeLpLDXFiNP4yIxH1h1yFFLDBHYESjWaGTq/E/MojCCMPP6q9qI
         8e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/e8Wxn7ONLV4oZlZM9wxT1C3/mMkYREL0sIH8CvEggw=;
        b=YbpJ2Ts2Ybq6eSc2W8flOgbdkoqLNeW1kcVhmCcpkgBNqHPOrOocq7CMCuPAgaqQUa
         EbXCk1wisNoR+O+7xU7GMhdLchmeEYb8DTEmjcN0XE+VOrnFi5ea8nix0Iot1Qhli++L
         BsKG/hBol65eY4i8vAwjf5Yew0gs4CAd72iSZ+BCuNmPkYwPKOYw+tjPm3rEyedUYlDI
         jy//GDfSkf1FF7WUKPECk3vsSBzYO7wWno4csZjDSad/VRqgkjC02uKiRsh8PYPH5s+O
         DbCCfPyTRjuTidlNAwfbHMBlkxaftS22vxQzKX6TjdR2F66q4a9Hb19TqS3QjifEnr1l
         svzg==
X-Gm-Message-State: AOAM532yHjVOrPMJkOwGm075gUmRRnGBaLBxH6pYhzJFuhDfPhUJEb84
	7NVYX8YSh70osK+BFgesugl1YwMs
X-Google-Smtp-Source: ABdhPJyG7kS3uRR/zh7TW7hrggtVPsmOfvfEElIKIfWhHnfIV5+LcuskAxSleS/dRiKCeTubXQIp7Q==
X-Received: by 2002:a05:620a:914:: with SMTP id v20mr239381qkv.336.1596129661248;
        Thu, 30 Jul 2020 10:21:01 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-187-239.mycingular.net. [166.176.187.239])
        by smtp.gmail.com with ESMTPSA id g3sm1279073qtq.70.2020.07.30.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:21:00 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 1/3] xen: upgrade to Xen 4.14 as default and advance the git recipe version
Date: Thu, 30 Jul 2020 10:20:39 -0700
Message-Id: <20200730172041.32126-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

Release announcement for Xen 4.14:
https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01263.html

Make the 4.14 recipe the default preference and advance the git recipe
onto the current 4.15 development branch. Retire the patches for the
earlier versions.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch | 64 -------------------
 ...xen-build-temporarily-inhibit-Werror.patch | 42 ------------
 .../files/xen-tools-kdd-fix-build-again.patch | 39 -----------
 ...g-0-arrays-to-access-packet-contents.patch | 60 -----------------
 recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
 recipes-extended/xen/xen-tools_git.bb         | 16 ++---
 recipes-extended/xen/xen_4.14.bb              |  4 +-
 recipes-extended/xen/xen_git.bb               | 10 +--
 8 files changed, 16 insertions(+), 223 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
 delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
deleted file mode 100644
index 96e907d..0000000
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
-From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-Date: Fri, 19 Oct 2018 11:01:37 +0200
-Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
-
-Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
-as well as other parameters set by the OpenEmbedded build system.
-This is especially useful when the target libdir is not the default one
-(/usr/lib), but for example /usr/lib64.
-
-Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-
-Forward-ported to Xen 4.12.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Modified to support pygrub installation with python 3
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
-index 3063c49..513314b 100644
---- a/tools/pygrub/Makefile
-+++ b/tools/pygrub/Makefile
-@@ -10,14 +10,17 @@ INSTALL_LOG = build/installed_files.txt
- all: build
- .PHONY: build
- build:
--	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
-+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
- 
- .PHONY: install
- install: all
- 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
- 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
- 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
--		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
-+		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force \
-+		 $(DISTUTILS_INSTALL_ARGS)
-+	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
-+	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
- 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
- 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
- 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
-diff --git a/tools/python/Makefile b/tools/python/Makefile
-index 541858e..4d4a344 100644
---- a/tools/python/Makefile
-+++ b/tools/python/Makefile
-@@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
- 
- .PHONY: build
- build:
--	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
-+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
- 
- .PHONY: install
- install:
-@@ -18,7 +18,7 @@ install:
- 
- 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
- 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
--		--root="$(DESTDIR)" --force
-+		--root="$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
- 
- 	$(INSTALL_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
- 	$(INSTALL_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
deleted file mode 100644
index ba97c4b..0000000
--- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 18 Jun 2020 09:05:22 -0400
-Subject: [PATCH] xen/build: temporarily inhibit Werror
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-Rebased on Xen 4.13:
-Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
----
- tools/libxl/Makefile | 2 +-
- xen/Rules.mk         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
-index 6da342ed61..c67560e269 100644
---- a/tools/libxl/Makefile
-+++ b/tools/libxl/Makefile
-@@ -14,7 +14,7 @@ MINOR = 0
- XLUMAJOR = 4.13
- XLUMINOR = 0
- 
--CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
-+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
- 	-Wno-declaration-after-statement -Wformat-nonliteral
- CFLAGS += -I. -fPIC
- 
-diff --git a/xen/Rules.mk b/xen/Rules.mk
-index a151b3f625..a05ceec1e5 100644
---- a/xen/Rules.mk
-+++ b/xen/Rules.mk
-@@ -54,7 +54,7 @@ CFLAGS += -fomit-frame-pointer
- endif
- 
- CFLAGS += -nostdinc -fno-builtin -fno-common
--CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
-+CFLAGS += -Wredundant-decls -Wno-pointer-arith
- $(call cc-option-add,CFLAGS,CC,-Wvla)
- CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
- CFLAGS-$(CONFIG_DEBUG_INFO) += -g
--- 
-2.19.1
-
diff --git a/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch b/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
deleted file mode 100644
index 6122999..0000000
--- a/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d44cbbe0f3243afcc56e47dcfa97bbfe23e46fbb Mon Sep 17 00:00:00 2001
-From: Wei Liu <wl@xen.org>
-Date: Fri, 3 Jul 2020 20:10:01 +0000
-Subject: [PATCH] kdd: fix build again
-
-Restore Tim's patch. The one that was committed was recreated by me
-because git didn't accept my saved copy. I made some mistakes while
-recreating that patch and here we are.
-
-Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
-Reported-by: Michael Young <m.a.young@durham.ac.uk>
-Signed-off-by: Wei Liu <wl@xen.org>
-Reviewed-by: Tim Deegan <tim@xen.org>
-Release-acked-by: Paul Durrant <paul@xen.org>
----
- tools/debugger/kdd/kdd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
-index 866532f0c7..a7d0976ea4 100644
---- a/tools/debugger/kdd/kdd.c
-+++ b/tools/debugger/kdd/kdd.c
-@@ -79,11 +79,11 @@ typedef struct {
- /* State of the debugger stub */
- typedef struct {
-     union {
--        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
-+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
-         kdd_pkt txp;                 /* Also readable as a packet structure */
-     };
-     union {
--        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
-+        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
-         kdd_pkt rxp;                 /* Also readable as a packet structure */
-     };
-     unsigned int cur;       /* Offset into rx where we'll put the next byte */
--- 
-2.17.1
-
diff --git a/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch b/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
deleted file mode 100644
index c1b110d..0000000
--- a/recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 3471cafbdda35eacf04670881dd2aee2558b4f08 Mon Sep 17 00:00:00 2001
-From: Tim Deegan <tim@xen.org>
-Date: Fri, 26 Jun 2020 10:40:44 +0000
-Subject: [PATCH] kdd: stop using [0] arrays to access packet contents
-
-GCC 10 is unhappy about this, and we already use 64k buffers
-in the only places where packets are allocated, so move the
-64k size into the packet definition.
-
-Reported-by: Olaf Hering <olaf@aepfle.de>
-Signed-off-by: Tim Deegan <tim@xen.org>
-Acked-by: Wei Liu <wl@xen.org>
-Release-acked-by: Paul Durrant <paul@xen.org>
----
- tools/debugger/kdd/kdd.c | 4 ++--
- tools/debugger/kdd/kdd.h | 3 +--
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
-index 3ebda9b12c..866532f0c7 100644
---- a/tools/debugger/kdd/kdd.c
-+++ b/tools/debugger/kdd/kdd.c
-@@ -79,11 +79,11 @@ typedef struct {
- /* State of the debugger stub */
- typedef struct {
-     union {
--        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
-+        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
-         kdd_pkt txp;                 /* Also readable as a packet structure */
-     };
-     union {
--        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for rx */
-+        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
-         kdd_pkt rxp;                 /* Also readable as a packet structure */
-     };
-     unsigned int cur;       /* Offset into rx where we'll put the next byte */
-diff --git a/tools/debugger/kdd/kdd.h b/tools/debugger/kdd/kdd.h
-index bfb00ba5c5..b9a17440df 100644
---- a/tools/debugger/kdd/kdd.h
-+++ b/tools/debugger/kdd/kdd.h
-@@ -68,7 +68,6 @@ typedef struct {
-     uint16_t len;     /* Payload length, excl. header and trailing byte */
-     uint32_t id;      /* Echoed in responses */
-     uint32_t sum;     /* Unsigned sum of all payload bytes */
--    uint8_t payload[0];
- } PACKED kdd_hdr;
- 
- #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
-@@ -323,7 +322,7 @@ typedef struct {
-         kdd_msg msg;
-         kdd_reg reg;
-         kdd_stc stc;
--        uint8_t payload[0];
-+        uint8_t payload[65536];
-     };
- } PACKED kdd_pkt;
- 
--- 
-2.17.1
-
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
index ef40c85..4119190 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -1,4 +1,4 @@
-SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
+SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
 
 XEN_REL ?= "4.14"
 XEN_BRANCH ?= "stable-${XEN_REL}"
@@ -15,7 +15,5 @@ PV = "${XEN_REL}+stable${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEFAULT_PREFERENCE ??= "-1"
-
 require xen.inc
 require xen-tools.inc
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 679feb1..71aeeed 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,21 +1,21 @@
-SRCREV ?= "9f7e8bac4ca279b3bfccb5f3730fb2e5398c95ab"
+SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
 
-XEN_REL ?= "4.13"
-XEN_BRANCH ?= "stable-${XEN_REL}"
+XEN_REL ?= "4.15"
+XEN_BRANCH ?= "master"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
-    file://0001-xen-build-temporarily-inhibit-Werror.patch \
-    file://xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch \
-    file://xen-tools-kdd-fix-build-again.patch \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
+    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
     "
 
-LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
 
 PV = "${XEN_REL}+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+DEFAULT_PREFERENCE ??= "-1"
+
 require xen.inc
 require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 02af2a7..0413bee 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -1,4 +1,4 @@
-SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
+SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
 
 XEN_REL ?= "4.14"
 XEN_BRANCH ?= "stable-${XEN_REL}"
@@ -14,7 +14,5 @@ PV = "${XEN_REL}+stable${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEFAULT_PREFERENCE ??= "-1"
-
 require xen.inc
 require xen-hypervisor.inc
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 7765ed7..408bc3b 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,18 +1,20 @@
-SRCREV ?= "9f7e8bac4ca279b3bfccb5f3730fb2e5398c95ab"
+SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
 
-XEN_REL ?= "4.13"
-XEN_BRANCH ?= "stable-${XEN_REL}"
+XEN_REL ?= "4.15"
+XEN_BRANCH ?= "master"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     "
 
-LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
 
 PV = "${XEN_REL}+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+DEFAULT_PREFERENCE ??= "-1"
+
 require xen.inc
 require xen-hypervisor.inc
-- 
2.17.1


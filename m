Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2352.1595019856588629015
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 14:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b5oHx3Up;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D50EE01EAD; Fri, 17 Jul 2020 14:04:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7503E01EAA
	for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:14 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id g13so8710598qtv.8
        for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MyUcuKmRu15g8wjngMWt/IDKM3fXmDAnFXCqHlA7MJU=;
        b=b5oHx3UpJxMmIkujjN570lVZtqOhugCnvxK5gVjzH/hRZtLSR8e/+Sj60MqPzV+5BZ
         w2q59U7sh+KJYlxIIUsQt6EGPooyClMLcTci4sWOCWDvtfQkJZPL6+J83d4mKdacaVHC
         xxXq8Ko8P9LRnPTEQE3/7tksemJ5epvo1fkI7E6ZoOTCwwIWkrGIzRkwDjTobkLeK7cA
         fNky79JGTB5k7EyUa/D+b2CWLP51DlNZTPf8yxjBJEoNisjPMy9fnykwjM3tTXwB/Z9j
         6mf/UanBtIZ/c7hU+T4RcqLRnRDNKC/X6eXzC4g7+oiCU/vNVhRqduWJz3G8Q5Ugg/as
         b4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MyUcuKmRu15g8wjngMWt/IDKM3fXmDAnFXCqHlA7MJU=;
        b=LsiQCu9GaBQGVJeBHxZPaEewtFHOn0vzKJ0LDaBe/U8az8/tWyeIf2erV4w/o8Ja/m
         1QqGTEDS12XeR1CrINBzd3DqDVMQIDKFvX7keCGOGa77dgpMRnrsOOjpUfQzgZFfQm4R
         Gu1qLD0H4QMJN/nM78z6FAMq2h+p0H6+/w+7xsY0spHko6XDh8s6OCbMSxYfhqROmffk
         9XL5mQp+fZhTb2f8t1kHAeqj+2KFhHUZHAws93hrYy1JDbvm8Bq3wPSsbs3B9kmDy1wJ
         igy7EafaOzhFdAiRmAgU+RUwaPiGITDFLNnEkXn/w1UvmWeT4+fLKWOZ4U9k6c+2tObo
         t0OQ==
X-Gm-Message-State: AOAM533s2+J93p5o/vCbNm1HKyyRHEhtS7qFVFAlzkTToVQJzBfxhMRp
	YZJZ/Brqd4TKyJb1nHzwjik5iNWN
X-Google-Smtp-Source: ABdhPJx4J1n7V4mT0ehekQgsusn5GyNu8W3TletrXR8ZOHSNErRRno1xdTKiKU1VUNtA2X9u7Z2yDA==
X-Received: by 2002:ac8:957:: with SMTP id z23mr12611277qth.68.1595019853476;
        Fri, 17 Jul 2020 14:04:13 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-137-177-108.mycingular.net. [166.137.177.108])
        by smtp.gmail.com with ESMTPSA id y45sm12819387qtk.19.2020.07.17.14.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 14:04:13 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	Christopher Clark <christopher.w.clark@gmail.com>,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 2/4] xen, xen-tools: add recipes for Xen 4.14
Date: Fri, 17 Jul 2020 14:03:47 -0700
Message-Id: <20200717210349.16459-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717210349.16459-1-christopher.w.clark@gmail.com>
References: <20200717210349.16459-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Add a versioned-suffix pair of recipes for Xen 4.14, allowing selection
of which Xen version to build via setting PREFERRED_VERSION.

4.14 is currently still pre-release, so the new recipes for it set
DEFAULT_PREFERENCE to -1, and the default for now remains the existing
stable version. Forward ports of patches needed for 4.14 are included.

Implementation note: since both this version and the git recipe are
built from git branches -- important for Xen since significant updates
are made available there inbetween point releases -- the recipe includes
'stable' as a string in PV so as to distinguish it from 'git' in the git
recipe, and thereby allow PREFERRED_VERSION to select the correct recipe
in the situation where both happen to be configured with the same XEN_REL.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 +++++++++++++++++++
 ...uild-temporarily-inhibit-Werror-4.14.patch | 26 ++++++++
 recipes-extended/xen/xen-tools_4.14.bb        | 21 ++++++
 recipes-extended/xen/xen_4.14.bb              | 20 ++++++
 4 files changed, 133 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
 create mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror-4.14.patch
 create mode 100644 recipes-extended/xen/xen-tools_4.14.bb
 create mode 100644 recipes-extended/xen/xen_4.14.bb

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
new file mode 100644
index 0000000..f0688fd
--- /dev/null
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
@@ -0,0 +1,66 @@
+From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
+From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
+Date: Fri, 19 Oct 2018 11:01:37 +0200
+Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
+
+Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
+as well as other parameters set by the OpenEmbedded build system.
+This is especially useful when the target libdir is not the default one
+(/usr/lib), but for example /usr/lib64.
+
+Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
+
+Forward-ported to Xen 4.12.0
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+
+Modified to support pygrub installation with python 3
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+
+Forward-ported to Xen 4.14.0
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
+index 3063c49..513314b 100644
+--- a/tools/pygrub/Makefile
++++ b/tools/pygrub/Makefile
+@@ -10,14 +10,17 @@ INSTALL_LOG = build/installed_files.txt
+ all: build
+ .PHONY: build
+ build:
+-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
++	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
+ 
+ .PHONY: install
+ install: all
+ 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
+ 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
+ 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+-		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
++		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force \
++		 $(DISTUTILS_INSTALL_ARGS)
++	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
++	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
+ 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
+ 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
+ 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
+diff --git a/tools/python/Makefile b/tools/python/Makefile
+index 541858e..4d4a344 100644
+--- a/tools/python/Makefile
++++ b/tools/python/Makefile
+@@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
+ 
+ .PHONY: build
+ build:
+-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
++	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
+ 
+ .PHONY: install
+ install:
+@@ -18,7 +18,7 @@ install:
+ 
+ 	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
+ 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+-		--root="$(DESTDIR)" --force
++		--root="$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
+ 
+ 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
+ 	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror-4.14.patch
new file mode 100644
index 0000000..0e0a3dc
--- /dev/null
+++ b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror-4.14.patch
@@ -0,0 +1,26 @@
+From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 18 Jun 2020 09:05:22 -0400
+Subject: [PATCH] xen/build: temporarily inhibit Werror
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+Rebased on Xen 4.14:
+Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
+---
+ tools/libxl/Makefile | 2 +-
+ xen/Rules.mk         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
+index 6da342ed61..c67560e269 100644
+--- a/tools/libxl/Makefile
++++ b/tools/libxl/Makefile
+@@ -11,7 +11,7 @@ MINOR = 0
+ XLUMAJOR = 4.14
+ XLUMINOR = 0
+ 
+-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
++CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+ 	-Wno-declaration-after-statement -Wformat-nonliteral
+ CFLAGS += -I. -fPIC
+ 
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
new file mode 100644
index 0000000..ef40c85
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -0,0 +1,21 @@
+SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
+
+XEN_REL ?= "4.14"
+XEN_BRANCH ?= "stable-${XEN_REL}"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
+    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
+    "
+
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
+
+PV = "${XEN_REL}+stable${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE ??= "-1"
+
+require xen.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
new file mode 100644
index 0000000..02af2a7
--- /dev/null
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -0,0 +1,20 @@
+SRCREV ?= "02d69864b51a4302a148c28d6d391238a6778b4b"
+
+XEN_REL ?= "4.14"
+XEN_BRANCH ?= "stable-${XEN_REL}"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://xen-arm64-implement-atomic-fetch-add.patch \
+    "
+
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
+
+PV = "${XEN_REL}+stable${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE ??= "-1"
+
+require xen.inc
+require xen-hypervisor.inc
-- 
2.17.1


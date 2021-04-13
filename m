Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.3804.1618283424357486046
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 20:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k86T/JiK;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id dp18so2794346qvb.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Apr 2021 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C4LvpOumvubIYBzNX7yEiylhEmYIyDN+5RuW3fsEo3A=;
        b=k86T/JiK26xwOVY8ldaPZ5TNtUDVpoJXqI3jYIiOmU3xvy4lvtrzNLXFcgDCJxwYbh
         6P/2yIxDT9IRvlbQxZw3BrY0IKudtQ9BuoLm8VLI8VkRQmtGm2x+DbvaqSeU7CTfVIzz
         wYcem5XuFItHok7PdIivPYUXoxlB69RNjKw2u93ZtsWTKjXoHu9QJo5czBt8Uq9+fIXm
         4lUTl/zIHlDvY9Khgnkw7JCteSYhbgqMl3mnjftW5sLzX6JA42A8WImSJE9eRFWKf/8R
         iRKBGclgQqsOyvoW983eg6nD67oEhf0+CgvMfQvGscNx4BWniYNsFIvcpSMs64nrngt1
         DsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4LvpOumvubIYBzNX7yEiylhEmYIyDN+5RuW3fsEo3A=;
        b=UXFbOlGK+s3pSKI4EurUhIbSY/ssiNGSbb6o8Ut6ykLX0FMKdN7fGCe/p2FVYgnl4Z
         asJ5x1VkWPuHZw91q5ijyEPt5OUj7vBzTAzJDsrFPq1QDbsYZjpOmX/GnOAAM6CTIDFV
         ele+YK/DQprDZMa03toEHRg4S4suMq486w7rW8rEhOOSqOzCXBBK5xcznkKTGUAGb+Bi
         ngBT1Ulh5LUB66SR+Kp7qqBP5Abnh6OyVmlW3JkCx9qVMdKXCLRaTE3jJcxf8yqnEIds
         Y2hU2YPFx0Znp7z3HpBdW1ojoZe2l4sleLQ6egz8ggPnW7Jeli/0ztchEr+dnWiCboxQ
         RD9g==
X-Gm-Message-State: AOAM531sd9IyTtUI3hpskoARjPnA0fe5pgB5ulu2ph/g19TXEQuKqvNR
	YsdTkbbbdoXAEp5qSubhgEyWSXiBZ1Q=
X-Google-Smtp-Source: ABdhPJz97vNYEvWPoivJ3tg/ttLJd0ouwUYJKCRfTvOXczUF15D0qMfFNMY/U7WG/61D2LISiUao/w==
X-Received: by 2002:a0c:d7d2:: with SMTP id g18mr30754140qvj.42.1618283423381;
        Mon, 12 Apr 2021 20:10:23 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-62.mycingular.net. [166.176.187.62])
        by smtp.gmail.com with ESMTPSA id i21sm561873qtr.94.2021.04.12.20.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:10:23 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
Date: Mon, 12 Apr 2021 20:09:51 -0700
Message-Id: <20210413030951.40543-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413030951.40543-1-christopher.w.clark@gmail.com>
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the git recipes revision to the recent master branch point for
starting 4.16 development.

Remove the xen-tools python patch for 4.14.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -------------------
 .../{xen-tools_4.14.bb => xen-tools_4.15.bb}  |  6 +-
 recipes-extended/xen/xen-tools_git.bb         |  4 +-
 .../xen/{xen_4.14.bb => xen_4.15.bb}          |  4 +-
 recipes-extended/xen/xen_git.bb               |  4 +-
 5 files changed, 9 insertions(+), 75 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
 rename recipes-extended/xen/{xen-tools_4.14.bb => xen-tools_4.15.bb} (68%)
 rename recipes-extended/xen/{xen_4.14.bb => xen_4.15.bb} (85%)

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
deleted file mode 100644
index f0688fd..0000000
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
+++ /dev/null
@@ -1,66 +0,0 @@
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
-Forward-ported to Xen 4.14.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
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
- 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
- 	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.15.bb
similarity index 68%
rename from recipes-extended/xen/xen-tools_4.14.bb
rename to recipes-extended/xen/xen-tools_4.15.bb
index a79b41d..314dc52 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -1,11 +1,11 @@
-SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
+SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
 
-XEN_REL ?= "4.14"
+XEN_REL ?= "4.15"
 XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 71850ee..0188bdd 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.15.bb
similarity index 85%
rename from recipes-extended/xen/xen_4.14.bb
rename to recipes-extended/xen/xen_4.15.bb
index 653e3b6..2842c0a 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
+SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
 
-XEN_REL ?= "4.14"
+XEN_REL ?= "4.15"
 XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 2b62c5c..eaf3956 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
-- 
2.25.1


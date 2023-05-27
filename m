Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0286BC77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:48:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.17770.1685220485366246154
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 13:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rybscSSt;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b01d3bb571so8987365ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685220484; x=1687812484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1wLu9zkTm0C2X+xDG7oH0pWcFpFS3Tk4C9tu2o7g9s=;
        b=rybscSStvtIB37oP4bfX3VfoYLhGFR6WsIN2n/qqWOJIykaxMjwk+pi9ZqUy7RQPat
         pxM1qvmEZtcxyaEl7+PiPJrbVz5r5DF27Z1ImX62mZ/Q2PXu/1Mwi3nxKxJt3tEVzkCl
         ExGPXgOIP7j9nQPx7KkT9rQRAMTr/jClBa2/T5K6ejuK/Xv0j1PWlWB8j9Zaboi0R3Ly
         Kp13jlPLvAS6kYIJUAYMcByCqUwUwdxVUqnEl2FBKxpTMXPNrdJNwJxF9BHcYf56kiPZ
         ag8/TlxPaV95lo//sokrcPa4JLpyZsZtbt+aC5gwQ7qVl6YQQzE33CN9kGorVSkplCoC
         FLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685220484; x=1687812484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1wLu9zkTm0C2X+xDG7oH0pWcFpFS3Tk4C9tu2o7g9s=;
        b=evA/UAASz40+Yxyst1ZY2oeH7/tYDUPnzfT8+G7S82AdVFFq0Acy/PaeA51l9Tg7Rn
         fgNqECM9ss5EbjBKPOW43YchunsS3E7a9XRJFZmsXYZF/4lNb2j7H+BUGcoU9NAHiLFU
         u1lYg/sKKy+1lZDmSWN57wX7WkPL+MYNLRnCYhawPRRwX71MpTTxiZ7KIouIQnUfqfTo
         VudyPLWr84xKoRLDk9iAJT3fiWcagdTvvV8TcTq/ITkQ8ezI7JwylhicKDo15UEXX1W0
         6xiLpGFGU3cJbuJ8ch2Zd64D8K+QOlvsXw7raPWjSMF2beHDlccx7Mw1MIvfgPMm2n9z
         1PtQ==
X-Gm-Message-State: AC+VfDwo1ByiyITCYozb6gLSdiZqiqMtkC3iCiUzJ116W5tLkpeY2GUm
	g2rDLs0nRa6rAGazD8RX9TZNMZ9UC4o=
X-Google-Smtp-Source: ACHHUZ6yC6sDTRjH7lFnB+rocrzUvO7uyjgdWUOZLMME3I2zfHx3D5VgEunyhkMiVlAYPMLDTl5H7Q==
X-Received: by 2002:a17:902:c246:b0:1ab:1bdd:b307 with SMTP id 6-20020a170902c24600b001ab1bddb307mr6122977plg.51.1685220484384;
        Sat, 27 May 2023 13:48:04 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id jd15-20020a170903260f00b001b02881081fsm1507870plb.156.2023.05.27.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 13:48:03 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 3/3] xen, xen-tools: Update git recipe revision for gcc 13 compatibility
Date: Sat, 27 May 2023 13:47:53 -0700
Message-Id: <20230527204753.1385743-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
References: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 20:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8082

Adds an update for the python/pygrub environment patch for the current
Xen 4.18 development tree.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
Compile tested for qemux86-64 and raspberrypi4-64;
posted to fix the build with the new gcc.

 ...ython-pygrub-pass-DISTUTILS-xen-4.18.patch | 41 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |  7 ++--
 recipes-extended/xen/xen_git.bb               |  4 +-
 3 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch
new file mode 100644
index 0000000..3c7a97d
--- /dev/null
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch
@@ -0,0 +1,41 @@
+diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
+index 4963bc89c6..c1c05eb421 100644
+--- a/tools/pygrub/Makefile
++++ b/tools/pygrub/Makefile
+@@ -13,14 +13,14 @@ setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLA
+ all: build
+ .PHONY: build
+ build:
+-	$(setup.py) build
++	$(setup.py) build $(DISTUTILS_BUILD_ARGS)
+ 
+ .PHONY: install
+ install: all
+ 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
+ 	$(INSTALL_DIR) $(DESTDIR)/$(LIBEXEC_BIN)
+ 	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+-		--root="$(DESTDIR)" --force
++		--root="$(DESTDIR)" --force  $(DISTUTILS_INSTALL_ARGS)
+ 	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
+ 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
+ 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
+diff --git a/tools/python/Makefile b/tools/python/Makefile
+index 437431c48e..0a99c2067e 100644
+--- a/tools/python/Makefile
++++ b/tools/python/Makefile
+@@ -16,13 +16,13 @@ setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLA
+ 
+ .PHONY: build
+ build:
+-	$(setup.py) build
++	$(setup.py) build $(DISTUTILS_BUILD_ARGS)
+ 
+ .PHONY: install
+ install:
+ 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+ 	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+-		--root="$(DESTDIR)" --force
++		--root="$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
+ 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
+ 	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
+ 
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 7557081..a71157a 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,13 +1,12 @@
-# master status on 2022-12-29
-SRCREV ?= "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
+# master status on 2023-05-26
+SRCREV ?= "380c6c170393c48852d4f2b1ea97125a399cfc61"
 
 XEN_REL ?= "4.18"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
-    file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 9949006..7ed8977 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,5 +1,5 @@
-# master status on 2022-12-29
-SRCREV ?= "e4a5fb9227889bec99ab212b839680f4d5b51e60"
+# master status on 2023-05-26
+SRCREV ?= "380c6c170393c48852d4f2b1ea97125a399cfc61"
 
 XEN_REL ?= "4.18"
 XEN_BRANCH ?= "master"
-- 
2.25.1



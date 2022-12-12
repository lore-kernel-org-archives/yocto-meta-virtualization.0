Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98456C2D0CB
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.37858.1670831994396282937
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPPjXerM;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id m18so25784455eji.5
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3/+wUy68E3KfTO73GH5khOIQlYxjSLFHR93pxSXBlI=;
        b=hPPjXerM/QnJLn/RQlUUT2IIJoJl+hICsdgFiNFkBoUbdBmM6zaN7PSSEcgRhrHmCw
         ZdZWIX3ywBNX1tAPhyEJiPiCINUZgiMB0qznAUSbhcHAa0PAQp6ScAM0r6tkIsCKd9v2
         GT4FF3ZZTreseC+9Ln6vVhstFWT/JgCW98iIgnKLZ6/MCO+d6lgYbNY+M8HWCAw5VM3G
         0aTWvE1ldzAmA63dxpKKay3TaOPewjtyaJCPMNTV4mPo3aTKX93dmHPb3ccyZfykzp2h
         47E5Zk7SIYvE6pHfLSIL3jSLIaqrePuHeRf6ZEP2Fu+E5o81aw2HA63gvPEbOcXBKqdo
         zfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3/+wUy68E3KfTO73GH5khOIQlYxjSLFHR93pxSXBlI=;
        b=RkweOzBLOyjIfmQazDckkKta7Mua6yN0Sp/iFoLj/3ESDPe/u+gVNmMYX8EsH7rY9M
         C8UauxAlY6T9WnwM1mb3ox53wwENz+twvmdZNikyeL43ZguOXCI6R4gF7T89TYwHV53a
         IcnBqhHqFczxQa83t9/h0sUoGBLDwuktP0+AbYR8NvS5+YYs3n3ZFrpAcFZWTPihufjB
         LUsc7yhB0m2d0ll7soDT+g6a3u1OJN5Mwv35MG89uG54br0XkZ1UbK5uOcSgczWUssGO
         u4+1e9WojtPou8nGVY+9bmjq30JMr5yReUMYdKyUY0GUrNFNb35152/l5B0hfK+0Cb7h
         kpRA==
X-Gm-Message-State: ANoB5plOSzeGzjWOf3kXpk/hWtWmmx0bIZM3JLUJOmWLnEEzckVTMH9L
	Oh2hYWp8m53q6nIq6+1FxRQtjbhuW/E=
X-Google-Smtp-Source: AA0mqf6137Ptu78Snf5LnXo+DJb+yQdbdq67hlLR2P8fr74pXjOuFKGlwUCsc6MgD8CV6zfU5U0/hw==
X-Received: by 2002:a17:906:3c15:b0:7c1:4d21:abb7 with SMTP id h21-20020a1709063c1500b007c14d21abb7mr7084493ejg.54.1670831992552;
        Sun, 11 Dec 2022 23:59:52 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 11/21] containerd: improve reproducibility
Date: Mon, 12 Dec 2022 08:58:47 +0100
Message-Id: <20221212075857.1065221-12-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7764

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We get the following QA warning on build:

WARNING: containerd-opencontainers-v1.6.8+gitAUTOINC+579a6380ec-r0 do_package_qa: QA Issue: File /usr/bin/containerd-shim-runc-v2 in package containerd-opencontainers contains reference to TMPDIR
File /usr/bin/containerd-ctr in package containerd-opencontainers contains reference to TMPDIR
File /usr/bin/containerd-shim-runc-v1 in package containerd-opencontainers contains reference to TMPDIR
File /usr/bin/containerd in package containerd-opencontainers contains reference to TMPDIR
File /usr/bin/containerd-shim in package containerd-opencontainers contains reference to TMPDIR [buildpaths]

This is the first step in fixing the QA warning, by dropping our
debug patch, passing -trimpath and not defining GO_DEBUG.

This leaves a final reference similar to:

path _/opt/poky/build/tmp/work/core2-64-poky-linux/containerd-opencontainers/v1.6.8+gitAUTOINC+579a6380ec-r0/git/src/import/cmd/ctr

That is being stored in the .rodata of the binaries.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../0001-Add-build-option-GODEBUG-1.patch     | 32 -------------------
 ...don-t-use-gcflags-to-define-trimpath.patch | 30 +++++++++++++++++
 .../containerd-opencontainers_git.bb          |  6 ++--
 3 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
deleted file mode 100644
index 8b43c8a..0000000
--- a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 84874e47aa2025b8e73df0286c44f3b8a1d9fdb2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 2 Sep 2019 16:20:07 +0800
-Subject: [PATCH] Add build option "GODEBUG=1"
-
-Make will generate GDB friendly binary with this build option.
-
-Signed-off-by: Hui Zhu <teawater@hyper.sh>
-
-Upstream-Status: Backport [c5a0c7f491b435e4eb45972903b00e2d8ed46495]
-
-Partly backport and refresh to v1.2.7
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/import/Makefile | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-Index: git/src/import/Makefile
-===================================================================
---- git.orig/src/import/Makefile	2020-10-12 08:09:41.638977052 -0700
-+++ git/src/import/Makefile	2020-10-12 08:10:49.783074373 -0700
-@@ -72,6 +72,10 @@
- COMMANDS=ctr containerd containerd-stress
- MANPAGES=ctr.8 containerd.8 containerd-config.8 containerd-config.toml.5
- 
-+ifndef GODEBUG
-+   EXTRA_LDFLAGS += -s -w
-+endif
-+
- ifdef BUILDTAGS
-     GO_BUILDTAGS = ${BUILDTAGS}
- endif
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
new file mode 100644
index 0000000..f1dea5a
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
@@ -0,0 +1,30 @@
+From 9174091fa1624dbb09ce812792a4102dff693541 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 12 Sep 2022 15:40:08 -0400
+Subject: [PATCH] build: don't use gcflags to define trimpath
+
+We can pass trimpath in via environment variables. The gcflags
+definition of trimpath is for older go versions and is using the
+complete path for trimming. If the variable is captured in the
+resulting binary, we have a reproducibility and QA issue.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git git.orig/src/import/Makefile git.orig/src/import/Makefile
+index 4a6c13042..debb57925 100644
+--- git.orig/src/import/Makefile
++++ git.orig/src/import/Makefile
+@@ -130,7 +130,6 @@ TESTFLAGS_RACE=
+ # See Golang issue re: '-trimpath': https://github.com/golang/go/issues/13809
+ GO_GCFLAGS=$(shell				\
+ 	set -- ${GOPATHS};			\
+-	echo "-gcflags=-trimpath=$${1}/src";	\
+ 	)
+ 
+ BINARIES=$(addprefix bin/,$(COMMANDS))
+-- 
+2.19.1
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index af91a22..edc3a5c 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -7,8 +7,8 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
 
 SRCREV = "579a6380ec93ab92a6e7f26167fe4f18dfcf2a4b"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
-           file://0001-Add-build-option-GODEBUG-1.patch \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
+           file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
           "
 
 # Apache-2.0 for containerd
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d
 CONTAINERD_VERSION = "v1.6.8"
 CVE_VERSION = "1.6.8"
 
-EXTRA_OEMAKE += "GODEBUG=1"
+# EXTRA_OEMAKE += "GODEBUG=1"
 
 PROVIDES += "virtual/containerd"
 RPROVIDES:${PN} = "virtual-containerd"
@@ -84,7 +84,7 @@ do_compile() {
     # cannot find package runtime/cgo (using -importcfg)
     #        ... recipe-sysroot-native/usr/lib/aarch64-poky-linux/go/pkg/tool/linux_amd64/link:
     #        cannot open file : open : no such file or directory
-    export GO_BUILD_FLAGS="-a -pkgdir dontusecurrentpkgs"
+    export GO_BUILD_FLAGS="-trimpath -a -pkgdir dontusecurrentpkgs"
     export GO111MODULE=off
 
     cd ${S}/src/import
-- 
2.38.1



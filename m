Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA32BC25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 06:28:08 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9805.1716532080913640497
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/iFpvte;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so139283a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 23:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716532079; x=1717136879; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+GqoWwYG88CdsnCSfwVyhu9CgrQAKU9ERuskq5WQuk=;
        b=Y/iFpvted/mHtsk9HYimDlw4F4BOzjsdPFNwZwycPkZ0T11z9NiGsqRGszADsZ+iQz
         29gN3v//lP47pvABiXe8039VwUM2fxqfwmeikp3rfteAH3UdzXIlgdsD8LNQG0LqWhlQ
         YFtSmwkX4/g/uZCjMm/ikRIV5wfpe8Rxtf52PoWclpeejG8IH+shHU+kUsaFvkta9jrd
         g488gvpcgz/X7JrCqlmIpk/MRxsrtg61tWEY4F0jZyTWSpByTkjZjpcE1AjEMv1EvgDB
         U5cqBb0kgCfGVg5+LV5dDfXFzhScj8aElpUIrGWSm51DbClSSSNZpxGxKkbbeaiIlUnW
         IMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716532079; x=1717136879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+GqoWwYG88CdsnCSfwVyhu9CgrQAKU9ERuskq5WQuk=;
        b=qUPs998eFO8/sXTuUl35rFIa0QaO2F7RGy3+QZ93rmR6xfcQ9z6s2cxFe/SLhJ/qUr
         mQFDDKqWe0arK2xtXrBbDgy1yA0JPbx8azuA051IsDLZ9fN5xbzEWhMXPgiGJTnl/pGh
         MnSdDUgCOx/is87a0o5egM/Uo+SxNyOJ6HSaoLP6ZXUeIp364vsGz1zc2amftgWFnVau
         DGtI5VIn6rVQDMPDKepMpwdYj2etCY7PW4j8K47ZfmuImYC6Z/H6sSqAEUDtllQ4u/P8
         PfHhj7u6IxnbomX8hOoLlnHfOx3lOlIyHphMfiTJslxDQ15iblZ0IPTAho2WaMcdRdF4
         SIJw==
X-Gm-Message-State: AOJu0Yxw7qOYPbHniiCsp9aQ6JHCrzYamo/ppduV5bC54Vv/vw0ErJ6r
	sVolgP54tcK/3hKBafjv0JuBg5QzwRYmn1JQm5S07mLzjVPiov8tPjmJiA==
X-Google-Smtp-Source: AGHT+IEv+zxy9WI6wKpddeqgV3jlz2y96RoJ7viMX7DSxnUDNaNaagBeJjkbxXgWg4ju40XL5wG7pQ==
X-Received: by 2002:a50:ab4a:0:b0:578:3357:51c0 with SMTP id 4fb4d7f45d1cf-578519007d6mr772329a12.1.1716532078872;
        Thu, 23 May 2024 23:27:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524b9e80sm1028584a12.85.2024.05.23.23.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 23:27:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [RFC][PATCH 3/4] runc: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 08:27:45 +0200
Message-ID: <20240524062746.232409-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524062746.232409-1-martin.jansa@gmail.com>
References: <20240524062746.232409-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 06:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8747

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  and
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* the files are now unpacked in different directory and paths in patches
  no longer match.

* WIP started by me and finished by Theodore, thank you!

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772681/

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...spect-GOBUILDFLAGS-for-runc-and-remove-re.patch |  6 +++---
 .../0001-runc-Add-console-socket-dev-null.patch    |  4 ++--
 .../0001-runc-docker-SIGUSR1-daemonize.patch       |  8 ++++----
 recipes-containers/runc/runc-docker_git.bb         |  8 ++++----
 recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
 recipes-containers/runc/runc.inc                   | 14 +++++++-------
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
index 9e5a8313..30332114 100644
--- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
@@ -13,10 +13,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-Index: git/src/import/Makefile
+Index: Makefile
 ===================================================================
---- git.orig/src/import/Makefile
-+++ git/src/import/Makefile
+--- a/Makefile
++++ b/Makefile
 @@ -24,7 +24,7 @@
  		GO_BUILDMODE := "-buildmode=pie"
  	endif
diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
index cb0ddc37..91d56e7b 100644
--- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
+++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
@@ -16,8 +16,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
 Index: git/src/import/utils_linux.go
 ===================================================================
---- git.orig/src/import/utils_linux.go
-+++ git/src/import/utils_linux.go
+--- a/utils_linux.go
++++ b/utils_linux.go
 @@ -267,6 +267,11 @@
  }
  
diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
index d3d1134b..bcf0cb27 100644
--- a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
+++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
@@ -33,8 +33,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
 Index: git/src/import/signals.go
 ===================================================================
---- git.orig/src/import/signals.go
-+++ git/src/import/signals.go
+--- a/signals.go
++++ b/signals.go
 @@ -5,7 +5,9 @@
  import (
  	"os"
@@ -120,8 +120,8 @@ Index: git/src/import/signals.go
  	_ = tty.resize()
 Index: git/src/import/utils_linux.go
 ===================================================================
---- git.orig/src/import/utils_linux.go
-+++ git/src/import/utils_linux.go
+--- a/utils_linux.go
++++ b/utils_linux.go
 @@ -345,7 +345,7 @@
  	if err != nil {
  		r.terminate(process)
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 8d078e85..21291c7e 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -3,10 +3,10 @@ include runc.inc
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
 SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
-SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
-           file://0001-runc-Add-console-socket-dev-null.patch \
-           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
-           file://0001-runc-docker-SIGUSR1-daemonize.patch \
+SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}  \
+           file://0001-runc-Add-console-socket-dev-null.patch;patchdir=${GO_SRCURI_DESTSUFFIX} \
+           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=${GO_SRCURI_DESTSUFFIX} \
+           file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=${GO_SRCURI_DESTSUFFIX} \
           "
 
 RUNC_VERSION = "1.1.12"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 188b8440..aba59ea1 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -2,8 +2,8 @@ include runc.inc
 
 SRCREV = "a9833ff391a71b30069a6c3f816db113379a4346"
 SRC_URI = " \
-    git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
-    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
+    git://github.com/opencontainers/runc;branch=release-1.1;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=${GO_SRCURI_DESTSUFFIX} \
     "
 RUNC_VERSION = "1.1.12"
 
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index c8e74273..3e7a9712 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -4,9 +4,9 @@ DESCRIPTION = "runc is a CLI tool for spawning and running containers according
 
 # Apache-2.0 for containerd
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
+LIC_FILES_CHKSUM = "file://${GO_SRCURI_DESTSUFFIX}/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}"
 
 PV = "${RUNC_VERSION}+git${SRCPV}"
 
@@ -44,18 +44,18 @@ do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
-	cd ${S}/src/import
+	cd ${S}/${GO_SRCURI_DESTSUFFIX}
 	rm -rf .gopath
 	dname=`dirname "${LIBCONTAINER_PACKAGE}"`
 	bname=`basename "${LIBCONTAINER_PACKAGE}"`
 	mkdir -p .gopath/src/${dname}
 
 	(cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
-	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOPATH="${S}/${GO_SRCURI_DESTSUFFIX}/.gopath:${S}/${GO_SRCURI_DESTSUFFIX}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 
 	# Fix up symlink for go-cross compiler
-	rm -f ${S}/src/import/vendor/src
-	ln -sf ./ ${S}/src/import/vendor/src
+	rm -f ${S}/${GO_SRCURI_DESTSUFFIX}/vendor/src
+	ln -sf ./ ${S}/${GO_SRCURI_DESTSUFFIX}/vendor/src
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -77,7 +77,7 @@ do_compile() {
 do_install() {
 	mkdir -p ${D}/${bindir}
 
-	cp ${S}/src/import/runc ${D}/${bindir}/runc
+	cp ${S}/${GO_SRCURI_DESTSUFFIX}/runc ${D}/${bindir}/runc
 	ln -sf runc ${D}/${bindir}/docker-runc
 }
 
-- 
2.45.1



Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AACC25B04
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.37856.1670831988598671637
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BTig9sFM;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so25754218ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY4TJxDiS66E+p13AdhD4k5ki3OT8HAZaHXfgPXRXHQ=;
        b=BTig9sFMzJtEX5dAXTq2jFTeGZQhjvFwLBsdqnVgxT6u53x13vOdkQbF0sRFrLqxao
         dp1LVhNKpgeiL80FjgeSLDlex93J3vkm5DMZY2qBRHxVOi03rTxo3yx0M7lHA4BPDW6t
         OBjIKbNNe8xQzGj9/UODQSUpqxWRf6RpjmqfxZVnifUQxBO1esqBSpsp0PCdASxsYU8e
         G2ImvdgYioeB8oxswlDnmmr3XMeplGeigtyZl/yAZGb4SgCPgkil+n0aM93hliur7PRy
         KubiEK5fIx9R65cHFww+k+ymvo/AB5NgttJgD54pRqnoqr7wA1rL2/SOIoIqlnDMXTYz
         JDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wY4TJxDiS66E+p13AdhD4k5ki3OT8HAZaHXfgPXRXHQ=;
        b=Q7B34GcsE8KOyD66B3XnvqGsxiBXl78TTQEKu3COya0QMLfaK8tJyh9mUpNRV2rQiH
         0hGM1Yodnk72MxZxW0rJ6cxDVzKZwOzMS+VFUsIs5iN3H0myrUEWqVTQUqkzMiSoCq4W
         GFBwdlrGxqj5qoGd4DH0uXLUMkDT+pIteeoUIhguaOu4QK5YXGZ728FRsd/3yvxCfV/e
         fbgasixYsjlxU52FIZ/DYenGbXnGCfNZOJwUDyWNzg9cfxaT2RIUeoqrZkwb5c7nDkCm
         ZNNEDlHurC6L/mBcfvC9O88WbNCz7AC1bymLPbR5oHG9z7cdeKzkEalUlOyURmQe6e0X
         wauA==
X-Gm-Message-State: ANoB5pnYNvYwqhAdFSpErCcWdEQS6tczfF6z/LNy5ssiY5d4BC+Vj0gV
	7btjLH3/isVQd2v+DSzewReGnYkgFcE=
X-Google-Smtp-Source: AA0mqf7cfpmar13IsFui2JZOYdrF7+8c0CTHuRD18gKxP/NEiVkqRJRNxnNJtoMVi6vXo5EldezQIA==
X-Received: by 2002:a17:906:b181:b0:7c1:65f7:18d8 with SMTP id w1-20020a170906b18100b007c165f718d8mr4552208ejy.60.1670831994133;
        Sun, 11 Dec 2022 23:59:54 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 13/21] containerd: fix final TMDIR references
Date: Mon, 12 Dec 2022 08:58:49 +0100
Message-Id: <20221212075857.1065221-14-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7765

From: Bruce Ashfield <bruce.ashfield@gmail.com>

restructure the containerd source layout to avoid symlinking vendor
dependencies. This avoid go recording paths in the final binaries.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...O_BUILD_FLAGS-to-be-externally-speci.patch |  6 +--
 ...don-t-use-gcflags-to-define-trimpath.patch |  6 +--
 .../containerd-opencontainers_git.bb          | 50 +++++--------------
 ...1-build-use-oe-provided-GO-and-flags.patch |  6 +--
 4 files changed, 21 insertions(+), 47 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
index 7f4d751..0ef0d38 100644
--- a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
@@ -19,10 +19,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git git.orig/src/import/Makefile  git.orig/src/import/Makefile
+diff --git git.orig/Makefile  git.orig/Makefile
 index c61418e60..54a10eb42 100644
---- git.orig/src/import/Makefile
-+++ git.orig/src/import/Makefile
+--- git.orig/Makefile
++++ git.orig/Makefile
 @@ -112,7 +112,8 @@ endif
  GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
  
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
index f1dea5a..b499de5 100644
--- a/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
@@ -13,10 +13,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  Makefile | 1 -
  1 file changed, 1 deletion(-)
 
-diff --git git.orig/src/import/Makefile git.orig/src/import/Makefile
+diff --git git.orig/Makefile git.orig/Makefile
 index 4a6c13042..debb57925 100644
---- git.orig/src/import/Makefile
-+++ git.orig/src/import/Makefile
+--- git.orig/Makefile
++++ git.orig/Makefile
 @@ -130,7 +130,6 @@ TESTFLAGS_RACE=
  # See Golang issue re: '-trimpath': https://github.com/golang/go/issues/13809
  GO_GCFLAGS=$(shell				\
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index edc3a5c..8847f31 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -6,14 +6,14 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
 
 
 SRCREV = "579a6380ec93ab92a6e7f26167fe4f18dfcf2a4b"
-SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
+SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
           "
 
 # Apache-2.0 for containerd
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
 CONTAINERD_VERSION = "v1.6.8"
 CVE_VERSION = "1.6.8"
@@ -23,7 +23,7 @@ CVE_VERSION = "1.6.8"
 PROVIDES += "virtual/containerd"
 RPROVIDES:${PN} = "virtual-containerd"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/src/github.com/containerd/containerd"
 
 PV = "${CONTAINERD_VERSION}+git${SRCPV}"
 
@@ -41,34 +41,7 @@ do_configure[noexec] = "1"
 do_compile() {
     export GOARCH="${TARGET_GOARCH}"
 
-    # link fixups for compilation
-    rm -f ${S}/src/import/vendor/src
-    ln -sf ./ ${S}/src/import/vendor/src
-
-    mkdir -p ${S}/src/import/vendor/src/github.com/containerd/containerd/
-    mkdir -p ${S}/src/import/vendor/src/github.com/containerd/containerd/pkg/
-    mkdir -p ${S}/src/import/vendor/src/github.com/containerd/containerd/contrib/
-    # without this, the stress test parts of the build fail
-    cp ${S}/src/import/*.go ${S}/src/import/vendor/src/github.com/containerd/containerd
-
-    for c in content timeout ttrpcutil oom stdio process errdefs fs images mount snapshots linux api runtimes defaults progress \
-		     protobuf reference diff platforms runtime remotes version archive dialer gc metadata \
-		     metrics filters identifiers labels leases plugin server services \
-		     cmd cio containers namespaces oci events log reaper sys rootfs nvidia seed apparmor seccomp \
-		     cap cri userns atomic ioutil os registrar seutil runtimeoptions netns \
-                     shutdown schedcore tracing kmutex; do
-        if [ -d ${S}/src/import/${c} ]; then
-	    ln -sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com/containerd/containerd/${c}
-        fi
-        if [ -d ${S}/src/import/pkg/${c} ]; then
-            ln -sfn ${S}/src/import/pkg/${c} ${S}/src/import/vendor/github.com/containerd/containerd/pkg/${c}
-        fi
-        if [ -d ${S}/src/import/contrib/${c} ]; then
-            ln -sfn ${S}/src/import/contrib/${c} ${S}/src/import/vendor/github.com/containerd/containerd/contrib/${c}
-        fi
-    done
-
-    export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+    export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go:${WORKDIR}/git/"
     export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 
     # Pass the needed cflags/ldflags so that cgo
@@ -87,7 +60,8 @@ do_compile() {
     export GO_BUILD_FLAGS="-trimpath -a -pkgdir dontusecurrentpkgs"
     export GO111MODULE=off
 
-    cd ${S}/src/import
+    cd ${S}
+
     oe_runmake binaries
 }
 
@@ -98,11 +72,11 @@ SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','conta
 do_install() {
 	mkdir -p ${D}/${bindir}
 
-	cp ${S}/src/import/bin/containerd ${D}/${bindir}/containerd
-	cp ${S}/src/import/bin/containerd-shim ${D}/${bindir}/containerd-shim
-	cp ${S}/src/import/bin/containerd-shim-runc-v1 ${D}/${bindir}/containerd-shim-runc-v1
-	cp ${S}/src/import/bin/containerd-shim-runc-v2 ${D}/${bindir}/containerd-shim-runc-v2
-	cp ${S}/src/import/bin/ctr ${D}/${bindir}/containerd-ctr
+	cp ${S}/bin/containerd ${D}/${bindir}/containerd
+	cp ${S}/bin/containerd-shim ${D}/${bindir}/containerd-shim
+	cp ${S}/bin/containerd-shim-runc-v1 ${D}/${bindir}/containerd-shim-runc-v1
+	cp ${S}/bin/containerd-shim-runc-v2 ${D}/${bindir}/containerd-shim-runc-v2
+	cp ${S}/bin/ctr ${D}/${bindir}/containerd-ctr
 
 	ln -sf containerd ${D}/${bindir}/docker-containerd
 	ln -sf containerd-shim ${D}/${bindir}/docker-containerd-shim
@@ -112,7 +86,7 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
-		install -m 644 ${S}/src/import/containerd.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/containerd.service ${D}/${systemd_unitdir}/system
 	        # adjust from /usr/local/bin to /usr/bin/
 		sed -e "s:/usr/local/bin/containerd:${bindir}/containerd:g" -i ${D}/${systemd_unitdir}/system/containerd.service
 	fi
diff --git a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
index 544881e..95f2317 100644
--- a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
+++ b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
@@ -12,10 +12,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  Makefile | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: git/src/import/Makefile
+Index: git/Makefile
 ===================================================================
---- git.orig/src/import/Makefile
-+++ git/src/import/Makefile
+--- git.orig/Makefile
++++ git/Makefile
 @@ -121,7 +121,7 @@
  TESTFLAGS_PARALLEL ?= 8
  
-- 
2.38.1



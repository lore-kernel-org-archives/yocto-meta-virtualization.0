Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7337C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:31 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155209.1783358064460350379
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YAqUQO4O;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847968ca62fso3403576b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358064; x=1783962864; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbOvbmb1Wb1+bfp8O9ypQUF+008D1R7p9TC16K8LLNA=;
        b=YAqUQO4OkuNEeBeRO736oJJoK/vDNuQRpsdSgadOtEClm9c3rr5Pg7u83fv3fz31Ab
         IUZG71BI0KIArTb1b8POx7+P03SGcpmxCv4lMFfyRLZlXaYYwzEnOshNxrob6Ae/zG+W
         KEmBUT5BNsiRdy7bxDffH8AGc2fSGIzQueNe+UW5R3zeXouM873Z6OnQJfPu+GikI10l
         3f9GRqvsJC4OotSQ5BTpMXBkhcqAl3Psxe2uVxI155PaJOZvyiJfNY03tbNdp0VcwWH5
         qhpU4d6IBxOXrQxa9tPXtVtrVkqtKJbEndIjhL2YVI0wC362XiqTKpbvGu+GzM2cfu+P
         XZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358064; x=1783962864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbOvbmb1Wb1+bfp8O9ypQUF+008D1R7p9TC16K8LLNA=;
        b=L+uvfjkbG6q2qrREG7FFbhLuaywbyteHLLM6zvsBxRTo4MmWsOKgCIL8rMPGG+QejW
         CA9CzSZ9uy0HvinQJIGh0Q3EFhlvngCfJQcPkb8aytyOCgrWY4FVf9rFAuNtHMqhgco+
         /jx6PYa5AxTUgEPt9X28vJF7/408iUuu+MmZ2MPOrvyD54T0iqTCAZkWphRxd8ktvScP
         5j9fNxT9aaJrZqZ28Cjx4o1Wkk84+tnwwh4ENCe/Su8hQ5ISHGx2AFrgtAeamONYp4CE
         2ttZIXqgU803wnSRdjiiGUsi2Kw00rHGCcVr5SaeeGchbgptH3Sbxx9jKaV8HZunwFd0
         w36w==
X-Gm-Message-State: AOJu0YzFuxfCyVA0bb9GsC3z1y1pyqBD7yIwQgDex+d1Y0X2fyoYau44
	n6sygfLRbN+SGu4zPtpNXOsDq14JQMm21/7nVx6Hokka8BTk3EJKXXLnR9poYg==
X-Gm-Gg: AfdE7cn0aAJ/18Ow33RfNGp8N1DpC0TCthec+dWm5V0KMpvGcHleipUc+qasgcMrbpD
	knCbPP4AkpqfbleycQIrnvtwzZZeBvpLZvGSUBhMXfb5XJlizSz3n/E9Py+ZMOOuyKvnoefmy6B
	o7PFTwvUzpMe0P+96qProailiDF4+9byP5xgxZr+cqu2Wjry+4ru8pgppzxiRTeCr9fLGX0oKAe
	Nm/X0jmlFzw773BlW4VLVpqCGUQ7XpgHbave4mPbdHjUO32pKkHP61DxEtHED8zCo8CQtDGFjf6
	KhynTZGbWZQVppDFEcRqA+5wMt7uhUZCLrsszl4ymYVV7GtWICjZ+8fgE6UsgxfqSBrdtumxe/p
	vnAf7HzcihB4BB97h2wcSRfLbRaZg0I5c18/6q1lHMWrUm1syortfyAvkcA6JemwTNs7O2+O1Sy
	3lv4TKeiXLQ0vLdagfIq0CIVjkgDcsa6JXV320i9EPABHcwZJ+WQhtMqfNCQtKPQAjpeM+TJBb0
	ZCoBgECttiM
X-Received: by 2002:a05:6a00:3a13:b0:845:e1a3:1080 with SMTP id d2e1a72fcca58-84826d81a1amr1581038b3a.55.1783358063762;
        Mon, 06 Jul 2026 10:14:23 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.20
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:21 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 11/13] app-container-curl: use multilayer mode; container-nonroot-user
Date: Mon,  6 Jul 2026 10:12:46 -0700
Message-ID: <b400060011a465a2e7bcab6c0a3f4e1f04021646.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9935

From: Tim Orling <ticotimo@gmail.com>

* Move to recipes-containers/images to show maintenance intent
* Switch to multilayer mode to more like the other "library"/"official"
  container recipes.
* Change OCI_IMAGE_TAG to "latest" for similar reasons.
* Change OCI_IMAGE_ENTRYPOINT_ARGS to "--help" to be more like upstream
  containers.
* Install ca-certificates to enable handling https:// sites
* Inherit container-nonroot-user to run as 'nonroot' with UID 65532 by
  default.
* Inherit container-volatile-fixup to fix 'log' and 'tmp' in
  /var/volatile.
* Inherit container-dev-mode to optionally build a "-dev" image.
  Set PACKAGECONFIG:pn-app-container-curl = "dev" in local.conf or
  distro/image config to run as `root` and include a CONTAINER_SHELL.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-curl.bb              | 39 ++++++++++++++++
 recipes-demo/images/app-container-curl.bb     | 46 -------------------
 2 files changed, 39 insertions(+), 46 deletions(-)
 create mode 100644 recipes-containers/images/app-container-curl.bb
 delete mode 100644 recipes-demo/images/app-container-curl.bb

diff --git a/recipes-containers/images/app-container-curl.bb b/recipes-containers/images/app-container-curl.bb
new file mode 100644
index 00000000..bfa3e708
--- /dev/null
+++ b/recipes-containers/images/app-container-curl.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Curl Application container image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - adds a shell to the container
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-curl = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+inherit container-dev-mode
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
+    curl:packages:curl+ca-certificates \
+"
+
+IMAGE_FSTYPES = "container oci"
+inherit image
+inherit image-oci
+inherit container-nonroot-user
+inherit container-volatile-fixup
+
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+NO_RECOMMENDATIONS = "1"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
+OCI_IMAGE_ENTRYPOINT = "curl"
+OCI_IMAGE_TAG = "latest"
+OCI_IMAGE_ENTRYPOINT_ARGS = "--help"
diff --git a/recipes-demo/images/app-container-curl.bb b/recipes-demo/images/app-container-curl.bb
deleted file mode 100644
index ddeb3022..00000000
--- a/recipes-demo/images/app-container-curl.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Curl Application container image"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-IMAGE_FSTYPES = "container oci"
-inherit image
-inherit image-oci
-
-IMAGE_FEATURES = ""
-IMAGE_LINGUAS = ""
-NO_RECOMMENDATIONS = "1"
-
-IMAGE_INSTALL = " \
-       base-files \
-       base-passwd \
-       netbase \
-       ${CONTAINER_SHELL} \
-"
-
-# If the following is configured in local.conf (or the distro):
-#      PACKAGE_EXTRA_ARCHS:append = " container-dummy-provides"
-# 
-# it has been explicitly # indicated that we don't want or need a shell, so we'll
-# add the dummy provides.
-# 
-# This is required, since there are postinstall scripts in base-files and base-passwd
-# that reference /bin/sh and we'll get a rootfs error if there's no shell or no dummy
-# provider.
-CONTAINER_SHELL ?= "${@bb.utils.contains('PACKAGE_EXTRA_ARCHS', 'container-dummy-provides', 'container-dummy-provides', 'busybox', d)}"
-
-# Allow build with or without a specific kernel
-IMAGE_CONTAINER_NO_DUMMY = "1"
-
-# Workaround /var/volatile for now
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
-rootfs_fixup_var_volatile () {
-    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
-    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
-}
-
-OCI_IMAGE_ENTRYPOINT = "curl"
-OCI_IMAGE_TAG = "easy"
-OCI_IMAGE_ENTRYPOINT_ARGS = "http://localhost:80"
-CONTAINER_SHELL = "busybox"
-
-IMAGE_INSTALL:append = " curl"
-- 
2.54.0



Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6458ACD6E51
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:32:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2373.1780104714619840730
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ktVu6djo;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7840407a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104714; x=1780709514; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjARWlUZ957yiW7+2Woam54S9zZlxWlATiyvOyvpijI=;
        b=ktVu6djouZhKRB4KvrKmWliBbqJsEmT66ZOafquS5seeYFmVMHz07NXRaIzbf+OQZ9
         gzoqZtJu6eJv9wPVhcphrtlD03J5SuhkCMXFPhy0CpBTN+2tNWpCcKpdaiAGy6wM5q3T
         gNfa294sF21rYBUTtYEOqVHi3TWd9IIuMK752RTuyNQQy6l1zPMbdHMVjBwS55ZpHdH6
         jElntP8nkBSShticEvVBJnj6unEdjQdFzXTHiwsidH2lNL0KzHUm9A/rzcgJhdA7Qp5E
         sxzgysD1v1vIHoqIr4vaXjI2ald8HlNmS7IJ+K14Rp8zYO63WLoQTcuW6l9iA/CgF7We
         4O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104714; x=1780709514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RjARWlUZ957yiW7+2Woam54S9zZlxWlATiyvOyvpijI=;
        b=S8htTVK7Cfp3zi/kuEBruuj6W4Ml3SbQM51gT8dOPZNW6HWGNrxSFGccVSUZc/M7lx
         jfLbWrkqHKsjrVZJjBMGbn2JNko1vRPL/9hK5NkEEptsZlRnHpEOm8k2033MQeUvxabb
         cti0sXOJablHo9V6sqBTubRgWMhRYR/3oYLLmI4YyUltZRh1V+3G5fceM/Yg1ZTIPZSK
         zg5GUYuonp1eQMlEouq3QuwD5OJZBk07BHY5zsjwrBmevosLqcRBmQD9IoAtbuucuOMx
         ykSqzgvhN6KUrXEbscDnLKwGZrxPdbNuob3RXwUZc8wIPZg+YRKRV8FCoiU7UUqBJDOa
         U+9A==
X-Gm-Message-State: AOJu0Yz4gVhGx8h8f1qEZJjWJheVVZf+3KjaAa5ivhSCnsOsBjfIl6UF
	NuzDcpWG3g7/XvKzLTl6U5zFtepmkPLkZFrJFrDfTh7SwiIUwFnaYg/Sw61yNw==
X-Gm-Gg: Acq92OHGWFpST/+JEZkaQz+N9qalZ8Ji6U+Zl6DnK33zX4AXXgidUR7TgjlzyRFlohH
	+6+UgroKEocISNFGFYTEpe//xVE7PJrI8T9tEMBr5uE/+vKUcsgU7jSRoO85xZWErSUXNU98ZET
	VWu1iB6BCxwybZMwP5Dqj07yBAbHa1pUJwiVmgKk+xlQXzetESDrotJysxeyiBsXFtK6jL/NvW+
	XhGeXrvNSoW6J1+3LXObTwzk//M0zghH6gMJfdHj6lsw8cImAIStISXc4zd7+Onz1wPC0Jsdqhj
	ahvaekHbkf6Hrf6uxZtXABVLIQA3/niawrs6ikKnP3q/JszMP0l9E2tIpMuwABwfrLtZy8LQFYM
	S6275CzFZ9tySIVsrmgQO7O2J4K1KokMZ1FYghxlwbrg9QXHPOmvaTBRJa9Jo06UYk1gAB4Obi+
	2e3GUjdU3nJJzwVVLgWCc4o5cZxu1UjsyxnFBVdORxHBOUXhbxr353gmavjiKkTEwnsYET4CrpQ
	44zogsKpoiFKnIkxuVEW3Kt+ERzVO3R4A==
X-Received: by 2002:a17:903:240e:b0:2ae:450c:951e with SMTP id d9443c01a7336-2bf367f27dcmr25454245ad.17.1780104713990;
        Fri, 29 May 2026 18:31:53 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.52
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 7/7] app-container-curl: use multilayer mode; container-nonroot-user
Date: Fri, 29 May 2026 18:31:08 -0700
Message-ID: <f3106949b40e31f8a993419a0fd8c463ed7a642c.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9833

* Move to recipes-containers/images to show maintenance intent
* Switch to multilayer mode to more like the other "library"/"official"
  container recipes.
* Change OCI_IMAGE_TAG to "latest" for similar reasons.
* Change OCI_IMAGE_ENTRYPOINT_ARGS to "--help" to be more like upstream
  containers.
* Install ca-certificates to enable handling https:// sites
* Inherit container-nonroot-user to run as 'nonroot' with UID 65532 by
  default. Set PACKAGECONFIG:pn-app-container-curl = "dev" in local.conf
  or distro/image config to run as `root` and include a CONTAINER_SHELL.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-curl.bb              | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)
 rename {recipes-demo => recipes-containers}/images/app-container-curl.bb (58%)

diff --git a/recipes-demo/images/app-container-curl.bb b/recipes-containers/images/app-container-curl.bb
similarity index 58%
rename from recipes-demo/images/app-container-curl.bb
rename to recipes-containers/images/app-container-curl.bb
index ddeb3022..34204fb9 100644
--- a/recipes-demo/images/app-container-curl.bb
+++ b/recipes-containers/images/app-container-curl.bb
@@ -2,9 +2,31 @@ SUMMARY = "Curl Application container image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-curl = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
+    curl:packages:curl+ca-certificates \
+"
+
+# In 'dev' mode, override the nonroot UID inherited from container-nonroot-user
+# so the container runs as root.
+OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0', '${NONROOT_UID}', d)}"
+
 IMAGE_FSTYPES = "container oci"
 inherit image
 inherit image-oci
+inherit container-nonroot-user
 
 IMAGE_FEATURES = ""
 IMAGE_LINGUAS = ""
@@ -39,8 +61,7 @@ rootfs_fixup_var_volatile () {
 }
 
 OCI_IMAGE_ENTRYPOINT = "curl"
-OCI_IMAGE_TAG = "easy"
-OCI_IMAGE_ENTRYPOINT_ARGS = "http://localhost:80"
-CONTAINER_SHELL = "busybox"
+OCI_IMAGE_TAG = "latest"
+OCI_IMAGE_ENTRYPOINT_ARGS = "--help"
 
-IMAGE_INSTALL:append = " curl"
+IMAGE_INSTALL:append = " curl ca-certificates"
-- 
2.54.0



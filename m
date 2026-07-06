Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B48EC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156207.1783358038710399803
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D6RlOUVj;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8471013fac2so3594158b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358038; x=1783962838; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUpRTYY1MyHNTYwAdc0aCjiyoYJKGorC23jfMHiuGS4=;
        b=D6RlOUVjD3oW5BW8lZrrclFKGzkxCaz6lJgz8Okuz9v+QH/hbJqTfaGlZD6xYdHLJS
         jj8L3AKgq60XAtsOoAB5GsuOJEyD+dab/r3a96NgNg6pBmizfZeMWRNIfi+xQLYF9D7Z
         HYt7bhra+ObulDi6wT6LNcifVMcCDP6DO0cTNlUsSnl0MFCOGYpyMTxbJeTNTxOngpiZ
         uTgPEbBLKzpdpsntn6PNIv95BSL7tu4y0yEc+B95XBATtv4Pq2UEJD9NmuyxUm7xd81I
         3FmdBPyqbdTdtwHiFK/guaWiYjxIJmHUaR4Vb6RufpzSYFoHZOXrjCnigmZDrpdxikHi
         Badg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358038; x=1783962838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUpRTYY1MyHNTYwAdc0aCjiyoYJKGorC23jfMHiuGS4=;
        b=H+EbN+XsH/xkZZpQ8/QHWIWO2v8QsulM82r8is10hTSRQO7WCZ8uPUVmJ4NVbMvhoz
         kLZGwUg9vdzJC/MfMYrcKMmbOuqtJTmsd/nuosoB5NADaOYaD8/KDuAIKe+IfktXZOVA
         ri+D+yEK2SeuWtT/4jrPTe23N9n4g4S9wNjR8aKpJEdhhNmyEUbHub1H5+WgqTAiNufd
         zte0NSa0SAg2dhbx6ccFkc+oM7pWL1tf3URQqn+z4vCuxdrWSNXgYbVC71YheHYfLSZT
         +BJOgNMocGAz8IGCb7RwIb5H/w67trOsVQ42ezP+P7RVcRTF2OqU5Z4oJCn5xTT3VZfh
         hSUg==
X-Gm-Message-State: AOJu0YyyVDV5qf7Cd8iiB85HNV7zHPPzzu6EqtHEzcK8+MUrw0w8Bxv7
	naG+6yFoixo6KoF2+KZokMk6KK6/toCOT8g2Qdo/FV5SCbBJfNrVRwbUHapo2A==
X-Gm-Gg: AfdE7cneiTZJeXR8yI0HY7IeaaTHDagra/L1gQZf1ZFlHJYt9hoQVgNu2SOTMYkAfHT
	VS993kN1A++fOSZDz42VVpGso/rmqVPjqzbYphdRj9DKuLdCaIbHy3vGU4vTI4FZJny6G2Iv4+k
	G1aQQMAIoAhKWq8Oaq+5H8SscZS1FXEb7AnYTL7uIiMXQgBLmKDStMqODVOB2Eb54LW6LMFmPtc
	jI4CmmHUcrGSwvFQ0xx9LzlmiPx47qPZOQ5VQqBsPLW2cqqtpgOa6S8nS1Q7/iWtgzxCrBz57zn
	BXQdr4gq0Vfwl/OfWEqa1r+jooF8LLCpUGxgNaWZa2eQ/8+hrSdBnrznj5ts75Usv2wyqry46+8
	xO2gQHxD/YQeWkN2kASJpWwIDHr2yzuWSME8OpvKogoliGQuOzFgFmneWyAPoFU08MWdDi5R26k
	7vmY6oCGmGVIxOTzl+CPggr3deGpnAz5XPMI4952Febsl+b9l0pWFQvbyn3ZyUy4MkryXLyyrwF
	oDYPvhth/hT
X-Received: by 2002:a05:6a00:a93:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84826da6f65mr1436767b3a.55.1783358037994;
        Mon, 06 Jul 2026 10:13:57 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.55
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:55 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 06/13] recipes-containers/images: add app-container-mosquitto
Date: Mon,  6 Jul 2026 10:12:41 -0700
Message-ID: <f31bea9b4352294d132525cbf4894afa142ccfe3.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9930

Add OCI container image recipe for the Eclipse Mosquitto MQTT broker.
The image uses multi-layer mode with separate base and mosquitto layers,
exposes standard MQTT (1883) and WebSocket (9001) ports, and launches
mosquitto with its default config file as the entrypoint.

Inherit container-nonroot-user to run as 'nonroot' with UID 65532.

Inherit container-volatile-fixup to fix 'log' and 'tmp' in
/var/volatile.

Inherit container-dev-mode to optionally run as UID '0' root user
and provide a shell.

Relies on image-oci to auto-derive IMAGE_INSTALL from OCI_LAYERS
packages: layers.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-mosquitto.bb         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-containers/images/app-container-mosquitto.bb

diff --git a/recipes-containers/images/app-container-mosquitto.bb b/recipes-containers/images/app-container-mosquitto.bb
new file mode 100644
index 00000000..9a74dcd8
--- /dev/null
+++ b/recipes-containers/images/app-container-mosquitto.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Mosquitto MQTT broker container image"
+DESCRIPTION = "OCI container running the Eclipse Mosquitto MQTT broker \
+with standard MQTT (1883) and WebSocket (9001) listeners enabled."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - adds a shell to the container
+#   - adds python3-pip to the python layer (enables `pip install` at runtime)
+#   - runs the container as root (UID 0) so pip can write to site-packages
+# Enable with: PACKAGECONFIG:pn-app-container-python = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+inherit container-dev-mode
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
+    mosquitto:packages:mosquitto \
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
+OCI_IMAGE_ENTRYPOINT = "${sbindir}/mosquitto"
+OCI_IMAGE_ENTRYPOINT_ARGS = "-c '${sysconfdir}/mosquitto/mosquitto.conf'"
+OCI_IMAGE_PORTS = "1883/tcp 9001/tcp"
+OCI_IMAGE_TAG = "latest"
-- 
2.54.0



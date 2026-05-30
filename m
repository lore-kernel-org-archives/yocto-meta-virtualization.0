Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C702CD6E51
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2369.1780104702941359890
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F/5UCj6r;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf1f074a12so14314045ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104702; x=1780709502; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFOfhvyPpJ6mNV6NwpQsmq+e69TG6b1TgEoa37sgjGs=;
        b=F/5UCj6rsCWGc+nvx7H5erKZg2tCNNN24OASxVSkDzA7MVgM0/TN4/KjWWzBhzQ6NJ
         3ddOxknrmcysvziRqRGKkeY6ERvN3dK4JtGFKgPAPUycirAcPyuNLC4exwRrV6ufq0Kz
         x90f5HhafFoeEq3ThKlm2Onwd7+XufMJOEN4B46uB2TjLVxEKIMAf2VMX0xOR+O2tW6T
         x6OV18N742VX3XMR/ll5vMOnvPHd9ahOdzKFDglSoRsbxc0NfqeCWziKx3BltCValCST
         Rs36/jCANyb1TBJPz7BH59mK8KhqUYFFKJxeQc/yGfaOTD+r1D0POpVXFHno61FuQ+OY
         yXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104702; x=1780709502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bFOfhvyPpJ6mNV6NwpQsmq+e69TG6b1TgEoa37sgjGs=;
        b=JZSAsO9ygkjAXtthjqiHE1B6K78hkExdKvrIScdYqiLpqQ23F0ywbodoccrh4IxNoh
         dmVyuDVGEb8EOCKpBjQiimwfFgCpFCd/EbCOYRuB72RopW3ZSPJ0hoYfx3QESLr72APv
         dibW8SE95JQMqJtMl336NW6V8vAQGIwgrH2eVHBrgxgi/GFQUhDMgTPLyy84akEQHA4X
         0S+QbWkECyG3gRRNACVugIgRro4JExTgeskz6jUfcnAp3DwvJM+CObFV6MLDcev35yOg
         FH0a4g0K5oCc/Y4wnqT40XgL4LESFk20PQvDYcrRFQWVFyvvbti2RU8oB1nONqCRGoRR
         joYg==
X-Gm-Message-State: AOJu0YxDuyRKWuSqxcR64dllSd37PpbgtRQVP2VYyOE8+CCkQ32p91QA
	lj6v65gz0Ugr+DbHS272igHer6O8GycSNd7/gk1cDXGJpn0Wr/tlNveR1abFqA==
X-Gm-Gg: Acq92OFMKie8BSdQ6QaI0d2zvj4TGgwr42EQjpwwt4CW45UpziP9YhyzvgVQEreMDxt
	2+6CaJ4F/uYsbl5zCdTZ6rGOqIA0qqNu1EywfVtmEJzzG+yTzI8VBEORD3SCj8BUw2otmmUROH9
	eSrgPt5//pql7XN3DnSLsUZd020glYlLIfyzGUHFedR543V9mnChq5YePc9+U4kf5YqwyJa1fJg
	E9WY/RptUjPcP4sJqjZhlpZ52rAG00j0txKxTkBtml0zFWcNjhJnJVx4zRvW43lMblcZA/noC17
	ZWMYEy8WoU9cK0uJ4o3JRXN+20lbQTuuPElPpJQRGRY23zeLwk/1c7OfkI1oSjJsa6UtpdEWIfQ
	YiCPHda+WG+tHatZ21ZrJTkkKlbE04gPSuC/X4Y1wYMHEN6E2kt0MscD36o8CI3o7y+iISAmUc3
	22p4jouCijIsuhNdyIUEJT76Lo92ABAnb6cjLEGLyujRw4bgkDqfMyyuoNTxB/f1vI74WiVDQ+f
	V4bOi8VMvNr67LotteCho9rxQyAbHfDuQ==
X-Received: by 2002:a17:903:b84:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bf367b161cmr24588285ad.1.1780104702337;
        Fri, 29 May 2026 18:31:42 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.41
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/7] recipes-containers/images: add app-container-mosquitto
Date: Fri, 29 May 2026 18:31:04 -0700
Message-ID: <8e68815affff4412c88b8a1139d6f916074bb3d1.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9829

Add OCI container image recipe for the Eclipse Mosquitto MQTT broker.
The image uses multi-layer mode with separate base and mosquitto layers,
exposes standard MQTT (1883) and WebSocket (9001) ports, and launches
mosquitto with its default config file as the entrypoint.

Inherit container-nonroot-user to run as 'nonroot' with UID 65532.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-mosquitto.bb         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-containers/images/app-container-mosquitto.bb

diff --git a/recipes-containers/images/app-container-mosquitto.bb b/recipes-containers/images/app-container-mosquitto.bb
new file mode 100644
index 00000000..37e34a47
--- /dev/null
+++ b/recipes-containers/images/app-container-mosquitto.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Mosquitto MQTT broker container image"
+DESCRIPTION = "OCI container running the Eclipse Mosquitto MQTT broker \
+with standard MQTT (1883) and WebSocket (9001) listeners enabled."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    mosquitto:packages:mosquitto \
+"
+
+IMAGE_FSTYPES = "container oci"
+inherit image
+inherit image-oci
+inherit container-nonroot-user
+
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+NO_RECOMMENDATIONS = "1"
+
+IMAGE_INSTALL = " \
+    base-files \
+    base-passwd \
+    netbase \
+    mosquitto \
+"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
+# Workaround /var/volatile for now
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
+rootfs_fixup_var_volatile () {
+    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
+}
+
+OCI_IMAGE_ENTRYPOINT = "${sbindir}/mosquitto"
+OCI_IMAGE_ENTRYPOINT_ARGS = "-c '${sysconfdir}/mosquitto/mosquitto.conf'"
+OCI_IMAGE_PORTS = "1883/tcp 9001/tcp"
+OCI_IMAGE_TAG = "latest"
-- 
2.54.0



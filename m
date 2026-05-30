Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7016BCD6E51
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2247.1780104705156950610
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LuMSHyWy;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba856db1c0so104532535ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104704; x=1780709504; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTiqRQFSp/hsfCuv03JyxczlIhlU7V9LIfZxm1f2lmA=;
        b=LuMSHyWyW7gplahGyon2SPXG8uvbkBDQ8s1WBCn96wcQCr4HAnUu5NlRGqmCWCGbQA
         ULBdw3nprM+82YWGAVE4vLlDv9An2oZxp5YJLjy1dej0RCLLCl2NFYfDWKrcL54LKH//
         uoMUCsSr8uCBcJhNIrJPzxB25u23iAhnYlMVZAvCALIqJMkkHnf8mo82AnSRGVL4pfym
         H0Ss81IEyC/2WjkTVXJ8xriivv/artidxIngu1R6JWy4BWN73QalDEDDMTDRxIWZBmwn
         L3d0P4eJgLfqaG8yW2MkYTyiKOfrc0eNkjdm0bMpQbQep2eYqlx3QiIANQAebP9QHx7C
         1dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104704; x=1780709504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTiqRQFSp/hsfCuv03JyxczlIhlU7V9LIfZxm1f2lmA=;
        b=VPY03yypnuMIymJXb2+6rgAtQ7kYLIW2GzNUeMdYrrCU2Wg1HlaEyyVg0+HSJ8furn
         dN7xJTs4g5DPl5WrUVAnvP+V/zPg2EHrF/7E3w1nb+LR5E5+DdOQ7KV3abI4T+GGtKmI
         18uWYO54VRzOqtTtVQHmZ59dsQx961Ra7DMq2eE7uM/xzAXyLSjKje1KcE5VP0imTQqU
         b3g9Ck+FyPlSjhaj5sgJwHJvHg26Kthsl31S5NMzZbUd36OGiYy+cHqZcTzltHT4Geko
         TOG4tKBaD/HWYIMzqCA5Gwmh5xs0WSrHST1CKrQ6KTPhUyl7FVVkW7vjZltKNL13BOdy
         mPPw==
X-Gm-Message-State: AOJu0YxQFLK6huZHYX0Vi2KGEV2ea18TxFANjkSqNq2MC3ThqHPQ/aXc
	8CRmu5muqiVNRmj1tgG5a62+07Jx3KVttX2sqsglaLQkVJHlGSmapZ1BQgTmNw==
X-Gm-Gg: Acq92OGZj1ZQvnwoCapyHhgLd3i9Dw3AhW40R71i3JhYNUdHCPdM7GM6pXxLLWioKXn
	z/SfTTA4CMal3CIO8mU+gSJNHwKma/JY6tpuOT2HY8TV1CAvbb2Qv7QJPZA9hn1SuHHLugE9UZ1
	9iSBq/xsfr1P3ppTeU1eZiXu83S0jLFTgiqvp2eoKhMfp3wnnyLuvsE07VTchD2TP3ZfGQwmfQd
	rIJAjwpy522/sN7uh5sFTjs2+IgY6S69SvahS5cE3tyLbirk4lVVAY3/6E4alwnv6J483Z83Ykp
	yyTGldmHTxWYGUoc+I4r8bDiFgpj9KtXbuHHt6lWYFs1bQ+OjNqDm1bKtC4zdyL+vnf7UExm1LP
	Tp6nP6sIQFvms8+UHRWXucpF/zfwYNK/j6evm7xG3G1mcV2SLF29GzCJnyGB7cisl9SvhoCwjOR
	CuOC875Nl0dZu32ciZpAOnNYtGKQhug2i0zfzvpBWPrEubJAA/At3gFYOqel7yZGv8SYqsfPE/q
	hBTqP3HMPLkcFNCsexXXRJwuTG4U+Adtw==
X-Received: by 2002:a17:903:41c2:b0:2b2:6df1:1112 with SMTP id d9443c01a7336-2bf368d1b92mr24472645ad.40.1780104704512;
        Fri, 29 May 2026 18:31:44 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.43
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:43 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/7] recipes-containers/images: add app-container-valkey
Date: Fri, 29 May 2026 18:31:05 -0700
Message-ID: <5539c6da7c7fc8b6d180c2d038986f2bf1f9ecf0.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9830

Add OCI container image recipe for the Valkey in-memory key-value
datastore. The image uses multi-layer mode with separate base and
valkey layers, exposes the standard Valkey port (6379), and launches
valkey-server with its default config file as the entrypoint.

The stock valkey.conf shipped by meta-oe is tuned for a host install
(daemonize yes, syslog-enabled yes, bind 127.0.0.1). Override those at
launch so the server stays in the foreground as PID 1, logs to stdout,
and is reachable from outside the container.

Inherit container-nonroot-user to run as 'nonroot' with UID 65532 by
default. Can optionally set PACKAGECONFIG:pn-app-container-valkey = "dev"
in local.conf or a distro/image config to run as root.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-valkey.bb            | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 recipes-containers/images/app-container-valkey.bb

diff --git a/recipes-containers/images/app-container-valkey.bb b/recipes-containers/images/app-container-valkey.bb
new file mode 100644
index 00000000..b3da2efd
--- /dev/null
+++ b/recipes-containers/images/app-container-valkey.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Valkey key-value store container image"
+DESCRIPTION = "OCI container running the Valkey in-memory key-value \
+datastore, a flexible distributed datastore that supports both caching \
+and beyond caching workloads."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-valkey = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    valkey:packages:valkey \
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
+    valkey \
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
+OCI_IMAGE_ENTRYPOINT = "${bindir}/valkey-server"
+# The stock valkey.conf shipped by meta-oe is tuned for a host install
+# (daemonize yes, syslog-enabled yes, bind 127.0.0.1). Override those at
+# launch so the server stays in the foreground as PID 1, logs to stdout,
+# and is reachable from outside the container.
+OCI_IMAGE_ENTRYPOINT_ARGS = "'${sysconfdir}/valkey/valkey.conf' \
+    --daemonize no \
+    --syslog-enabled no \
+    --bind '0.0.0.0 -::*' \
+    --protected-mode no"
+OCI_IMAGE_PORTS = "6379/tcp"
+OCI_IMAGE_TAG = "latest"
-- 
2.54.0



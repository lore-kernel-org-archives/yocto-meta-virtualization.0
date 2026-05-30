Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582A1CD6E52
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:53 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2250.1780104707918819949
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A8TDLDQT;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bc85eda6b6so73416215ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104707; x=1780709507; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvgUMScfspriBCOjjmV6QvX06HUcIdWiZP0WL2Ta0rI=;
        b=A8TDLDQTAsdOfyoyGD5z/3AoEBcJq2WupRHjWSRp7VEHTJf+UBFmM86ZV6DOuR2ele
         nSjSJKQQM9PCCFfZdDufHPCPiHfGuTyAtJZbm8XTCDcWWWHw21fvaf7fE1+fID1z3fq6
         U42v31S+eKkZ8F5S8elnG1whOQCbnA+x3HlKE/gZc93uX9hj5a1oI1HcoE4/rbkOW0qD
         F1KpvdMa+vdU2laUDxjzjCkYuZFdHRZjk6bsqY6PWPHx8YemfmEojVGhPewTn/g2mJGg
         DzevPA3TDNXM1dd4C+KwnJJp1JWokYJGzaEzyYJPTgzoZzuEss3TeuSwlU9EV8j/tOoc
         n6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104707; x=1780709507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WvgUMScfspriBCOjjmV6QvX06HUcIdWiZP0WL2Ta0rI=;
        b=XYZMmSbJJbiWU0Aqtd+HH/zaIGPcoOZ//4z4K8pue40oDY0KDMAAMcj7KJo62tqbeo
         Prh0JfrAwI8hZo4PPV3LtqWXP4KspkpPGyKDbWn502CO7w1YJePVTYC7FKo9yJ8nHXJk
         wZnWUfgoFNvAAQpu/s/seLXNrtQY5PhDMqoWuXywzESenD8uLLIIsIQZrpdCmU2WPzOP
         FTgb1IFsGwgW8LV49QE6yO7tG+TvwghdIl4Xc7OAFHm5MspfWO2jzpFMOjnJP2LFt6j4
         OozyZbqeYA6b4Cml61ZBYegd3NqmXTGfDqyRXz3yRoToinEUwjFctEZ3seUTTzAXRay6
         c4iw==
X-Gm-Message-State: AOJu0Yz0+gs1NKevT6PtkC/m1oL2T5ujZ5/SIJeiHCNk48lvDXFZPkaJ
	kvu18gcMWB+yh0N0xxJWBX2YCmbNV8mSBAz49Z56ELl22I5Za3opLLXMOF1N8w==
X-Gm-Gg: Acq92OGd67nz6lUCkmit3HwwjXveI8Hp4adINFAMSRir1SKg4c4QIVjUmT5JSbtka1f
	bVKggYTWbR31CKylzWHmVgwBnFyXIir38xwQJ8SBMvWabnHHcsVuvmg1LiVRP9zaBVaXwPKwwuW
	Z3PzwI8sl0W+wXRQ3PXSKBsZUBliA0PYEZReJyoMCnXBafKlZmkGPPkc8fL2GK+l5zyLwfTOG4l
	LNhmuDdD7fplveLMD+9sAXt1DWwdqjSM4R4uqz3ix9GdSXioQ3xeq1myykXAi6E56etVOJTTL5S
	yih7NaQtTcFAVq6VzITmDf/ffb0VFOsrQur5RAPUxGmEYWO3rxsvK6Ly+gFaCHZteUUXvuAa4wP
	Ofu7yW858Q8fQ2Prktx4E/tp6yCKuk7xBqGDGq3Re/YQYzdQO3KQkNA4QiQkVAoYRFD7wc7Trbe
	KCno2MzvS9c3hSEKawhDIeQRGl5xWqbgp8IaFZxYVf1rgsR47j1Th4eR4/jctsLs2MbBqNMIX/S
	qWWzn7qVKAlZkHhTvyykyLSAzc7gZU6puAoDgx6uEyi
X-Received: by 2002:a17:902:fc84:b0:2bd:9803:9304 with SMTP id d9443c01a7336-2bf3687bb6amr25731975ad.39.1780104707212;
        Fri, 29 May 2026 18:31:47 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.45
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:45 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 5/7] recipes-containers/images: add app-container-nginx
Date: Fri, 29 May 2026 18:31:06 -0700
Message-ID: <4b1e72e8de33b35f7e8b8c66bc0ef8820c722db1.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9831

Add OCI container image recipe for the NGINX web server. The image
uses multi-layer mode with separate base, nginx packages, nginx
runtime directories, and nginx log file layers. Exposes the standard
HTTP port (80) and launches nginx with 'daemon off' so it stays in
the foreground as PID 1 and logs to stderr.

Add ROOTFS_POSTPROCESS fixups to create the runtime directories
nginx expects: /var/volatile/{tmp,log}, /var/log/nginx (resolved
explicitly to guarantee inclusion in the container layer regardless
of /var/log symlink ordering), and /run/nginx for nginx's compiled-in
temp paths (client_body_temp, proxy_temp, etc.) which are not created
by any package. Also create empty /var/log/nginx/{access,error}.log
to avoid do_image_oci warnings.

Inherit container-nonroot-user with NONROOT_USER = "nginx" to run with
UID 65532 by default. Set PACKAGECONFIG:pn-app-container-nginx = "dev"
in local.conf or distro/image config to run as 'root'.

Add SKIP_RECIPE and comment to layer.conf since nginx requires
meta-webserver.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/layer.conf                               |  1 +
 .../images/app-container-nginx.bb             | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 recipes-containers/images/app-container-nginx.bb

diff --git a/conf/layer.conf b/conf/layer.conf
index 2a4a4c91..6ea8ccf8 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -33,6 +33,7 @@ LAYERDEPENDS_virtualization-layer = " \
 # webserver:
 # - naigos requires apache2
 # - cockpit-machines requires cockpit
+# - app-container-nginx requires nginx
 LAYERRECOMMENDS_virtualization-layer = " \
     webserver \
     selinux \
diff --git a/recipes-containers/images/app-container-nginx.bb b/recipes-containers/images/app-container-nginx.bb
new file mode 100644
index 00000000..09844376
--- /dev/null
+++ b/recipes-containers/images/app-container-nginx.bb
@@ -0,0 +1,77 @@
+SUMMARY = "Base NGINX container image for development"
+DESCRIPTION = "OCI container with NGINX web server."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-nginx = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+NONROOT_USER = "nginx"
+
+OCI_IMAGE_APP_RECIPE = "nginx"
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    nginx:packages:nginx \
+    nginx-dirs:directories:${localstatedir}/log/nginx+/run/nginx+${localstatedir}/volatile/tmp+${localstatedir}/volatile/log \
+    nginx-files:files:${localstatedir}/log/nginx/access.log+${localstatedir}/log/nginx/error.log \
+"
+# Use CMD so `docker run image /bin/sh` works as expected
+OCI_IMAGE_CMD = ""
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
+       base-files \
+       base-passwd \
+       netbase \
+       nginx \
+"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
+# Workaround /var/volatile for now
+ROOTFS_POSTPROCESS_COMMAND:append = " rootfs_fixup_var_volatile ; "
+rootfs_fixup_var_volatile () {
+    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log/nginx
+
+    # Fix do_image_oci warnings
+    # OCI: File not found in IMAGE_ROOTFS: /var/log/nginx/access.log
+    touch ${IMAGE_ROOTFS}/${localstatedir}/volatile/log/nginx/access.log
+    touch ${IMAGE_ROOTFS}/${localstatedir}/volatile/log/nginx/error.log
+
+    # nginx opens the compiled-in error_log path before reading -c config.
+    # /var/log is typically a symlink to /var/volatile/log in a Yocto rootfs,
+    # so create the target path explicitly to guarantee the directory lands in
+    # the container layer regardless of symlink resolution order.
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/log/nginx
+
+    # nginx's compiled-in temp paths (client_body_temp, proxy_temp, etc.) all
+    # live under /run/nginx, which is not created by any package.
+    install -m 755 -d ${IMAGE_ROOTFS}/run/nginx
+}
+
+OCI_IMAGE_ENTRYPOINT = "/usr/sbin/nginx"
+OCI_IMAGE_ENTRYPOINT_ARGS = "-g 'daemon off; error_log stderr notice;'"
+OCI_IMAGE_PORTS = "80/tcp"
+OCI_IMAGE_TAG = "latest"
+
+SKIP_RECIPE[app-container-nginx] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on meta-webserver which is not included', d)}"
-- 
2.54.0



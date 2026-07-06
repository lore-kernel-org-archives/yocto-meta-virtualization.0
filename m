Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB719C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155203.1783358047913823799
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ntl5j4ys;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847921eed4aso4507111b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358047; x=1783962847; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7BcCukE5vosWbwSqzSMVqE57TNPZ8uSJDibEC2M2hA=;
        b=Ntl5j4ysalAQMGsQoLX6h0xer+eJ6xHFQT4Nbkvwcc6XwTWzCzqpvd2BPPX9HYPpkD
         wj8NIxdmjHm2GpZpGMZNkZs+GiFfuc5DAHN4Cq3Qod4W+HvIWEslyrGfS9oZjdrjO2+Z
         oH53Rl3oQIvjmaSjCh5LCsn5KXfnP5nlWGa/NMOK8nf8cg3GiHUlluu8Vq4TRzPZJAeK
         JKoD8/CM4Nf++SzvakoMbvduA605F2rPbYil5uzUqXiKT56SnHTq5P47e9DFHiDKiM8k
         zwyOeIm/5gDwaqYP9cy7UFvgE543rofbZYHwUV0TdnC8COVt4ebGT0MHsR1mBVNh8Rki
         ZimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358047; x=1783962847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+7BcCukE5vosWbwSqzSMVqE57TNPZ8uSJDibEC2M2hA=;
        b=iQxM5BLG7yN41D9uI01XIewrleiLI53nV+wgQGBSzJgb8bF4nPncpdKcCuZBg8ceEo
         C7TmFZxqTwKum7v8wR6/yXIq5Oce7yu3ZlNDaVccAu4lWxNZocc2yIHDOzr0+ViJqwnQ
         h+BBrkXkW9HVVa4Ef1LWQs99TtEuLfQq10M2qtnVbAZhZzTlUTKPtvo4B3aEHLdt03FK
         Y8wkDC+jL2GgykxeQerdvlRBouSnPSwR5irny3dA+OgpSIcqdz80u/bBgbM/pOWXUzsA
         wrzCmxWkmo6vyNixmtCha7jGR/F/pNcn+EQl3xme4R6Qhj3Tw4qxvAbt8nKbPMiTEJ5Y
         wMOw==
X-Gm-Message-State: AOJu0Yz3nIQa+Icqk93iuQZdi80r+hWmK1B2sA9faOV9RdbwHVj0GEEN
	hkUFEKKcuFQzzs9rYgJQV8XVJlnSKTubCAmcD7fJZqQA0tH3woALQRqpbjdOqg==
X-Gm-Gg: AfdE7cl5T8FeGDF06rqPupH7eSAZdzckWSAlcopCjTML4u4QjJZj2I4qYDHAhmFhMhe
	KI3tctlMD8gmIWTEChK8iOtnk7RsObkjoFRn/pdRV2tqK+mIvQUX+fhFI40Om7T2LjkASeV2dI8
	AxB+orS1TW7/YS7zlxs+ydpj+kBAQ8dgW3/TwIzeZxG2zMgCIQrrKRE6xP9h3lPCFzGRzPWe9OU
	d2kkGTxULENqVW5QEJpHEx9S+iB+2aUdKzhblH53QnFsxXXjMaAmTt+dHoqTcCFgpmpL8cyLJch
	JtdDvDJ0fvN6NqJDO1TXIqZ5jn5uMt25bh3R8f3y0pMx1Y8+bUJ0IooQMM50xRlcz7GDBm3klDL
	JHSICaOWb4IJJYQd/JZxOUg1vUQQKyRHmbBD9cIzBA3R1jDUqohie+ia1pcDzcd3q5zvgwRjGTL
	ED83zQJUrpOJAAHFQcqzih2P0ojjGhQlcNnv2gxtwUlyxyba+e51+8CxzrjiTi/OC5O7y+Bx5U2
	aAowqmd0lWL
X-Received: by 2002:a05:6a00:2e23:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-84826e37c82mr1608167b3a.55.1783358047206;
        Mon, 06 Jul 2026 10:14:07 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.04
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 09/13] recipes-containers/images: add app-container-nginx
Date: Mon,  6 Jul 2026 10:12:44 -0700
Message-ID: <e88468d2cf1383b327c8222cae56574eac362748.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9933

From: Tim Orling <ticotimo@gmail.com>

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

Since nginx uses user 'nginx' by name and not UID, we also need to
change ownership of several files/directories for the container to be
functional.

Inherit container-nonroot-user with NONROOT_USER = "nginx" to run with
UID 65532 by default. Set PACKAGECONFIG:pn-app-container-nginx = "dev"
in local.conf or distro/image config to run as 'root'.

Add NONROOT_OWNED_DIRS = "/run/nginx, /var/log/nginx, /var/cache/nginx,
/usr/share/nginx/html" as the 'nonroot' user needs permissions on these
directories.

Inherit container-volatile-fixup to fix 'log' and 'tmp' in
/var/volatile.

Relies on image-oci to auto-derive IMAGE_INSTALL from OCI_LAYERS
:packages: layers.

Inherit container-dev-mode to optionally run as UID '0' root user
and provide a shell.

Add SKIP_RECIPE and comment to layer.conf since nginx requires
meta-webserver.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/layer.conf                               |  1 +
 .../images/app-container-nginx.bb             | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
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
index 00000000..f57c7887
--- /dev/null
+++ b/recipes-containers/images/app-container-nginx.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Base NGINX container image for development"
+DESCRIPTION = "OCI container with NGINX web server."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - adds a shell to the container
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-nginx = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+inherit container-dev-mode
+NONROOT_USER = "nginx"
+
+OCI_IMAGE_APP_RECIPE = "nginx"
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
+    nginx:packages:nginx \
+    nginx-dirs:directories:${localstatedir}/log/nginx+/run/nginx+${localstatedir}/volatile/tmp+${localstatedir}/volatile/log \
+"
+
+# nginx runs as the nonroot user (uid 65532) and must own the dirs it writes.
+# The OCI_LAYERS 'directories:'/'files:' types create paths but drop ownership
+# (cp -a --no-preserve=ownership), so they land root-owned and nginx can't
+# write them. NONROOT_OWNED_DIRS re-creates them in the nonroot raw layer with
+# correct ownership. Mirrors dhi.io/nginx (debian-13/stable.yaml): run, log,
+# cache and the default html dir.
+NONROOT_OWNED_DIRS = "\
+    /run/nginx \
+    ${localstatedir}/log/nginx \
+    ${localstatedir}/cache/nginx \
+    ${datadir}/nginx/html \
+"
+# Use CMD so `docker run image /bin/sh` works as expected
+OCI_IMAGE_CMD = ""
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
+OCI_IMAGE_ENTRYPOINT = "/usr/sbin/nginx"
+OCI_IMAGE_ENTRYPOINT_ARGS = "-g 'daemon off; error_log stderr notice;'"
+OCI_IMAGE_PORTS = "80/tcp"
+OCI_IMAGE_TAG = "latest"
+
+SKIP_RECIPE[app-container-nginx] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on meta-webserver which is not included', d)}"
-- 
2.54.0



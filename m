Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3ADC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:52:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8178.1707749568486409557
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 06:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kp6CzPfJ;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso26131725e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 06:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707749567; x=1708354367; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8SYFFsvJQnaOpJE9NGUwuLhkQEQ2Gck3RSWrdXAUSI=;
        b=Kp6CzPfJx5Fg0h7MZic9gWkvzA+d60R5amWWyo7v2J0CZ59m65XjD+RAb/EZLcrWbE
         jtdx24PccvY9hDY9L9bQENeRoAaqHknNA8cpWsyI89ndBbryzXPPe8zuNI9NFGfgVX4o
         Lq8xx8Gz9d5CFDkiNYY/TZj4EwkrPZeizEfsPOb7unNvzTB+5vOOz6wuvUCT+QVJwt2R
         b3MExJ6F0B6l9wvOp0QCDesDka8V5MTwaDFMCyDyJaxRKEjvpOVpa4OB0XRMSk5oyGag
         vjievc0iP7P0/F3/NAGHgnPdqijOeMKFEDVg7plKqTohGZqwyHlGGCmoFd4GxJa9zb4d
         R18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707749567; x=1708354367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8SYFFsvJQnaOpJE9NGUwuLhkQEQ2Gck3RSWrdXAUSI=;
        b=tVZG4ypmqK+/ET+hzFl8Fv5dz0ejHkhStjlVenxJOFyT/d323VkmOJUYueglJNIwN+
         i6yNsfy5idE+5/nqCxOBgLB8bR6Rg9Doy3OsRuzzNONwc8ATi2dWUxUTA/WKH+zU+JaU
         nXbRKBMYAyTRf4LC8VwzzKgtTRufmacLEdvgdrXD2plyL9nG2jJePDgVhfYA+x3aSQQH
         aeidQkS1RWCty1FbYbr+iCroxDfw5IXcr1xSMl2pMWWR+GWd5pdZsEExYGhmfA5vpp9d
         2Dwq3o+x/FL0vP5EQv5uAn4tHraW88MJVpJGwZsV/vKg3kf2rGdr6yt6S3aY3q2wdaId
         2+/w==
X-Gm-Message-State: AOJu0YypBP7k6726VJ6j9kjUMVWAmveGQ87N/n8x1NFYePw01q/MmArw
	cHxFyr6s7nkdmfng3fS/J4dw+ESNQzoFYrA3frcsScZ65bV0WCdh1GwSBmgLAnBhXHdYZr3vc46
	4NTlSMw==
X-Google-Smtp-Source: AGHT+IHpwpZpuNHWqLNyJtH+HwvxOly5ebKOvPRsgnu6OuPNaKBtjeEf/TVJuxmwf+kX6/pa8hTfmg==
X-Received: by 2002:a05:600c:3495:b0:410:cdda:a6e5 with SMTP id a21-20020a05600c349500b00410cddaa6e5mr2816716wmq.6.1707749566685;
        Mon, 12 Feb 2024 06:52:46 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id e27-20020a5d595b000000b0033b80a0d002sm3662095wri.57.2024.02.12.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:52:46 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-virtualization][PATCH] upx: bump to 4.2.2 release
Date: Mon, 12 Feb 2024 15:52:43 +0100
Message-ID: <20240212145243.35052-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 14:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8563

Update upx recipe from 3.96 to 4.2.2 release.
Use the released tarball instead of git repositories.
Rewrite the recipe, simplified by using the latest released tarball.
Update the homepage.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-extended/upx/upx_4.2.2.bb | 14 ++++++++++
 recipes-extended/upx/upx_git.bb   | 45 -------------------------------
 2 files changed, 14 insertions(+), 45 deletions(-)
 create mode 100644 recipes-extended/upx/upx_4.2.2.bb
 delete mode 100644 recipes-extended/upx/upx_git.bb

diff --git a/recipes-extended/upx/upx_4.2.2.bb b/recipes-extended/upx/upx_4.2.2.bb
new file mode 100644
index 00000000..cb46d19c
--- /dev/null
+++ b/recipes-extended/upx/upx_4.2.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Ultimate executable compressor."
+HOMEPAGE = "https://upx.github.io/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
+DEPENDS = "libucl zlib xz"
+
+SRC_URI = "https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-src.tar.xz"
+SRC_URI[sha256sum] = "42ee0455eea610ef7ee732aa1f657b34a351ebcfa64a24c1e2a7aaec74c1e038"
+
+S = "${WORKDIR}/upx-${PV}-src"
+
+inherit pkgconfig cmake
+
+BBCLASSEXTEND = "native"
diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
deleted file mode 100644
index 2a5f08be..00000000
--- a/recipes-extended/upx/upx_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-HOMEPAGE = "http://upx.sourceforge.net"
-SUMMARY = "Ultimate executable compressor."
-
-SRCREV_upx = "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
-SRCREV_vendor_doctest = "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
-SRCREV_vendor_lzma_sdk = "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
-SRCREV_vendor_ucl = "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
-SRCREV_vendor_zlib = "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
-SRCREV_FORMAT = "upx"
-SRC_URI = "git://github.com/upx/upx;name=upx;branch=devel;protocol=https \
-           git://github.com/upx/upx-vendor-doctest;name=vendor_doctest;subdir=git/vendor/doctest;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-lzma-sdk;name=vendor_lzma_sdk;subdir=git/vendor/lzma-sdk;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-ucl;name=vendor_ucl;subdir=git/vendor/ucl;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-zlib;name=vendor_zlib;subdir=git/vendor/zlib;branch=upx-vendor;protocol=https \
-"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
-
-DEPENDS = "zlib libucl xz cmake-native"
-
-# inherit cmake
-
-S = "${WORKDIR}/git"
-
-PV = "3.96+"
-
-EXTRA_OEMAKE += " \
-    UPX_UCLDIR=${STAGING_DIR_TARGET} \
-    UPX_LZMADIR=${STAGING_DIR_TARGET} \
-"
-
-# FIXME: The build fails if security flags are enabled
-SECURITY_CFLAGS = ""
-
-do_compile() {
-    oe_runmake -C src all
-}
-
-do_install:append() {
-    install -d ${D}${bindir}
-    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
-}
-
-BBCLASSEXTEND = "native"
-- 
2.43.0



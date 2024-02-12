Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0902FC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 19:06:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.15302.1707764781285269275
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 11:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kZqHPMBZ;
 spf=pass (domain: linaro.org, ip: 209.85.128.44, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-411a5a86078so3763165e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707764779; x=1708369579; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGXAaZ41TBr0yYJcOgTd7v7aI1ohchxdzMLZI6qFDOk=;
        b=kZqHPMBZWgvC4RhbYjmnTy50P3/eLPfMZQp0vT7Mwm+NxWxCB4WJ32iixr+UGSYkTm
         TXSJd3Ldjxhc/+XF8I37ZMIyiMjCpygbOKClTvKagkHa7p0reblG1b5JldvqTzL6/tAj
         A+JstH4mFVU9Dg759ul6hSocDxHA3X4noszMrD95/9v7QDrlFM9bURf1j7lOtjXp58W9
         RramussxoWx4sYhzJyamuOrmr7Z9nrDtiOV3KzbGb73YyDUq7kgjA2OHPnQLNLRX0F6i
         vjxKu32lTxB0Mtr+9po2Z/fuR0HrhY+XLqRHXPMlo/MVglR+k3ZDgJ50fN25X2d6UNRc
         lkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764779; x=1708369579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGXAaZ41TBr0yYJcOgTd7v7aI1ohchxdzMLZI6qFDOk=;
        b=WUe8sS+vCniuuZ2qJ6OpuCbgbYH2gLItcIl2hwHKfvoSWc67G84o+oFSoFlTqhQ+TC
         KXz0yaolQnwV6bx8iSMr/e96OpDyuI891IV1bdTCyFJQZjkDF7dAWunI4n3BydvAGIIy
         lW9nThsDxYFL3U3luTUq7ucnWFVGO+LPixLBAAwyHoR9fE3IM3jaeWEwA784Y3Yw4C5/
         mdNFNoxKAc0HIYPvs+hEBzGcTjfeQ4i5ekr5yY1vvVgvbaCkhBhI5uuHyvF6IlEyLS+K
         HaxY7DXsvEDv4kkUq86mWhlXcq/cuqA3ffWlNnXzB7JrTe7CZBh5jLg4PbtEtEZ10meR
         qhEg==
X-Gm-Message-State: AOJu0Yxj37+cjLrUVlUga9jHF3MdFAd/MlhO4nTZCVe1wPFIUn065wd3
	11n/3cu0LUV7K2j/7cC/PWCe7M23u+EC5cClM4OXw3VxGLrNbZPxsdiJljmfnhoMiinBpuCqbTG
	f8yy+8A==
X-Google-Smtp-Source: AGHT+IFcbqwbOaoZiiw4RRLihiTUIVEegmDS231p9Ga3E96N9nSvww97UQ+RExseOEvc4+l70i0VVg==
X-Received: by 2002:a05:600c:4f91:b0:410:eba0:6d9a with SMTP id n17-20020a05600c4f9100b00410eba06d9amr1902025wmq.11.1707764778919;
        Mon, 12 Feb 2024 11:06:18 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b0040f0219c371sm9566244wmq.19.2024.02.12.11.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 11:06:18 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-virtualization][PATCH v2] upx: bump to 4.2.2 release
Date: Mon, 12 Feb 2024 20:06:15 +0100
Message-ID: <20240212190615.846212-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 19:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8567

Update upx recipe from 3.96 to 4.2.2 release:
 * Use the gitsm fetcher to get the source code.
 * Add a note to keep using the git repository.
 * Update the homepage.
 * Drop the build dependencies as they're useless. UPX builds using the
   vendor subdirectory, statically linking the libraries.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---

Changes since v1:
 * use the git repository instead of the released tarball
 * drop the build dependencies as they're useless

 recipes-extended/upx/upx_git.bb | 43 ++++++---------------------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index 2a5f08be..02e70ffe 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -1,45 +1,16 @@
-HOMEPAGE = "http://upx.sourceforge.net"
 SUMMARY = "Ultimate executable compressor."
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
+HOMEPAGE = "https://upx.github.io/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
+SRCREV_upx = "099c3d829e80488af7395a4242b318877e980da4"
+PV = "4.2.2+git${SRCPV}"
 
-DEPENDS = "zlib libucl xz cmake-native"
-
-# inherit cmake
+# Note: DO NOT use released tarball in favor of the git repository with submodules.
+# it makes maintenance easier for CVEs or other issues.
+SRC_URI = "gitsm://github.com/upx/upx;protocol=https;;name=upx;branch=devel"
 
 S = "${WORKDIR}/git"
 
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
+inherit pkgconfig cmake
 
 BBCLASSEXTEND = "native"
-- 
2.43.0



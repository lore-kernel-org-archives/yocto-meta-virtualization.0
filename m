Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.2726.1618873757476205832
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 16:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N+iOCfoT;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id dp18so13124036qvb.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Apr 2021 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9e4koaHyZD6z5kkKw5vwj4M6O+WdFswlWGoQRkwtlA=;
        b=N+iOCfoTi6hKZrr9py+kD/LGOk4jhA6IZTKdsSISZ6iyGnEXpcxqiM1OGsSZJmQbh1
         CbTqsQjHHrogUg3KoqEBHra+lOPR+IyX5y4hAOlq2FQIEuTnnKO3DivXh9A1sU6gEtxL
         jB5pQReORqP2b0368Kha1H/AekNOIbUrVqK5kbTvPMG2tUq6M52Sxs76oH4TkAmp9joz
         UBtoYmxYuXGLpc/YcDSqxhR+CB5sxACiCkNAHNJmyfYUPfl1fQ5nCjvI7zODWfCRd10y
         IFKGF5Zt3vwD80Y89APonf5LA2lDg5+hM6StVpFYo9oyFgf+LaNV2artN6prSip4mMPu
         m16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9e4koaHyZD6z5kkKw5vwj4M6O+WdFswlWGoQRkwtlA=;
        b=OIhzRs9PaJqeNjbJtXw3CPirw4C8egm+tAbeDU4bSoLdcjuv1Tp7bR9Mlx2GVFanhC
         2A8pUQV1dbnEGKUj1T8Nw4xV5kwY94O3QsikayQ9IVEEkEnuQIUcMoXV/XGiTIcT9dAr
         lzxHXuLbEDTvkPpwJBUG4EzjLtShH8C5vgi06jQ+vHL/W/dtgUXSJOjKxJmFm2TK+hqJ
         BiX6ZEANIVYEzV3T2V3TTpMJrPtxy1jPdh9JDO6MYCFY4UARc5C2sISDIg+/w80Jo65q
         NnxJ2M4O2YEgDJW0ivlfjks9xmTsXYqUoorU7j6do2KAxoWClOoLIOvRmz2u5u9tAD1Y
         Rbdg==
X-Gm-Message-State: AOAM533XjkrGzFuBPzYwulw6P6ez7LZSPosNF/+h9sujx5urT+52GxUe
	7hsK7FyaXS1XfN+hWORkzLCqI5VGeDw=
X-Google-Smtp-Source: ABdhPJzDBIAFDJp4P4WpMhZM/8kttzHfpc1DCD6e1uXFfHGFTzhhr2yOsdNPnswR50Ra+X552/f0Dw==
X-Received: by 2002:ad4:5242:: with SMTP id s2mr23877883qvq.31.1618873756530;
        Mon, 19 Apr 2021 16:09:16 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-64.mycingular.net. [166.176.187.64])
        by smtp.gmail.com with ESMTPSA id m2sm10893995qkc.14.2021.04.19.16.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 16:09:16 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	andrew.cooper3@citrix.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 3/3] xtf: update SRCREV and remove multilib dependency
Date: Mon, 19 Apr 2021 16:08:54 -0700
Message-Id: <20210419230854.121217-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419230854.121217-1-christopher.w.clark@gmail.com>
References: <20210419230854.121217-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest Xen Test Framework has removed the gcc-multilib dependency.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xtf_git.bb | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
index db08643..3580324 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 # https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
 
 SRC_URI = "git://xenbits.xen.org/xtf"
-SRCREV = "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
+SRCREV = "b0bc49846c154b79243f39d461a4515804bcaf53"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
@@ -18,23 +18,6 @@ S = "${WORKDIR}/git"
 
 inherit python3native
 
-# To build 32-bit binaries some files from 32-bit glibc are needed.
-# To enable multilib, please add the following to your local.conf -:
-#
-#    require conf/multilib.conf
-#    MULTILIBS = "multilib:lib32"
-#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-
-# Use this multilib prefix for x86 32-bit to match local.conf:
-MLPREFIX32 = "lib32-"
-# Add the multilib 32-bit glibc to DEPENDS only when necessary:
-# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
-# This x86-64 override is never intended for native use, so clear that.
-GLIBC32 = ""
-GLIBC32_x86-64 = "${MLPREFIX32}glibc"
-GLIBC32_class-native = ""
-DEPENDS += "${GLIBC32}"
-
 PACKAGES = "${PN}"
 
 FILES_${PN} = " \
@@ -47,7 +30,7 @@ RDEPENDS_${PN} = " \
     "
 
 do_compile() {
-    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIPE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
+    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
                CPP="${CPP}" \
                OBJCOPY="${OBJCOPY}" \
                PYTHON="${PYTHON}"
-- 
2.25.1


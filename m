Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.2648.1618873755829362169
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 16:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sW/Fven9;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id h3so16972964qve.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Apr 2021 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1EoGSQFWpziOhsybqv4wuoK1iH7+UQWGB2Ym1qyPJrA=;
        b=sW/Fven91vbiQFusqjwcxqOQG4zV8/nvGgYdajvrY5eXnn2ohBX7o0XJhFjFAFfgO/
         fCvMwERfUsileijUy9BXpqx/DrrjWJHFYQpL4QWvPN1QvRZBdu2OLDuBD/sRS+lRZ13v
         2TTWTPeL3NMV04APe+SJzXHTwnVsPAt5nGx0TaCVEyDlWd6I6v8rnS06OcEuZ6F8I3Mm
         CS4uUWPkhTfB2knUAn2br+mmPJ6tM3+I6P+oa16MivlM3cl/ice2Dg+1ByJV5c9Wvqi/
         Mw/O8Rb+/HoEJmzFPKohW/zuTnPKGZ+Qz4Fvy9iUGZ0C6sGFPlnOWfjmzCxWJ8tc+OgB
         q0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1EoGSQFWpziOhsybqv4wuoK1iH7+UQWGB2Ym1qyPJrA=;
        b=LI5VIa8pawAxamt9Eh1U40ZMR1USYosUNC65ihjVuwlW4bjmaFdIZBFUQshkXQbcOJ
         rhYwsUVcIr1jjChzUmTTU/2VkpCuxmWFJkN6HdYUV3TlDonbOo64JAR44eylFrciuQPQ
         3AfA6fj1pGAdLzKKQwR75kvefbn03JktYU+EeOXNUNnYxFTo+5LMSRTY01MZEr4M6Gb7
         1alDKzFJvYfumKdOfYVjL4Yvq/dMuvNuUazDYYqMAQ0+1M4tfr4ViQGiw27QpPjdVRXT
         36aL5ObyhoRVlidAxKNjwHzdxvBcil38zWj/Nfl5wyqU0e3bl7RHVAaSjoKysFOmwt5V
         mAYQ==
X-Gm-Message-State: AOAM5323yyX5Wd80CHEv26QaEUY1GFuq9hu7UfV8URX6B1nJr5pJWmJS
	bRxsQQknXCVN5NWsxtYzSn+Dh/hLeaI=
X-Google-Smtp-Source: ABdhPJwkM9QG35P7EPR87IF94qSi1Mk0VCqPxODmoy2xU3KThjefB0vo3EhjsqeXTUb1S00cAAe9qg==
X-Received: by 2002:a0c:e14e:: with SMTP id c14mr24127909qvl.36.1618873754670;
        Mon, 19 Apr 2021 16:09:14 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-64.mycingular.net. [166.176.187.64])
        by smtp.gmail.com with ESMTPSA id m2sm10893995qkc.14.2021.04.19.16.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 16:09:14 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 2/3] xen-tools: remove multilib build requirement for x86-64
Date: Mon, 19 Apr 2021 16:08:53 -0700
Message-Id: <20210419230854.121217-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419230854.121217-1-christopher.w.clark@gmail.com>
References: <20210419230854.121217-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen 4.15 added support for standalone x86-64 hvmloader build and
previous commit provided Xen 4.14 backports.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools.inc | 37 ------------------------------
 1 file changed, 37 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 722c503..3560e79 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -6,29 +6,6 @@ COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
-# To build hvmloader, which is needed on x86-64 targets when 'hvm' is enabled
-# in PACKAGECONFIG, to support running HVM-mode guest VMs, some files from
-# 32-bit glibc are needed.
-# Add the multilib 32-bit glibc to DEPENDS only when necessary.
-#
-# To enable multilib, please add the following to your local.conf -:
-#
-#    require conf/multilib.conf
-#    MULTILIBS = "multilib:lib32"
-#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-
-# Use this multilib prefix for x86 32-bit to match local.conf:
-MLPREFIX32 = "lib32-"
-
-# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
-# and 'hvm' is enabled in PACKAGECONFIG.
-# This x86-64 override is never intended for native use, so clear that.
-GLIBC32 = ""
-GLIBC32_x86-64 = \
-    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', '${MLPREFIX32}glibc', '', d)}"
-GLIBC32_class-native = ""
-DEPENDS += "${GLIBC32}"
-
 RDEPENDS_${PN} = "\
     bash perl xz \
     ${PN}-console \
@@ -736,16 +713,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
     "
 SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
 
-# To build hvmloader, which is needed on x86-64 targets when 'hvm' is enabled
-# in PACKAGECONFIG, additional CFLAGS are needed to set the 32-bit sysroot.
-RECIPE_SYSROOT32 = "${WORKDIR}/${MLPREFIX32}recipe-sysroot"
-ADD_SYSROOT32_CFLAGS = ""
-ADD_SYSROOT32_CFLAGS_x86-64 = \
-    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', \
-        'CFLAGS += "--sysroot=${RECIPE_SYSROOT32}"', '', d)}"
-# This x86-64 override is never intended for native use, so clear that.
-ADD_SYSROOT32_CFLAGS_class-native = ""
-
 EXTRA_OECONF += " \
     --with-systemd=${systemd_unitdir}/system \
     --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
@@ -756,10 +723,6 @@ EXTRA_OECONF += " \
 
 do_configure() {
     do_configure_common
-
-    if [ -n '${ADD_SYSROOT32_CFLAGS}' ] ; then
-        echo '${ADD_SYSROOT32_CFLAGS}' >>"${S}/tools/firmware/Rules.mk"
-    fi
 }
 
 do_compile() {
-- 
2.25.1


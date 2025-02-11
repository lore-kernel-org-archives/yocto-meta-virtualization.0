Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C184C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:04:38 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.4843.1739307874732913183
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 13:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=UmbP6Q4s;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.51, mailfrom: troth@openavr.org)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-855353491d7so62191439f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 13:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1739307873; x=1739912673; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pj3xyZVnxx48Nul/orR9likJuxJHg260FC97vATh2o=;
        b=UmbP6Q4smYVoTB1lM/JgkfmNwapQcqDPQUX5VhLxYx08Ul833T60IPEmbqJIqbvteC
         krr89zmp/W64RdeKGJlsenQhpwMQx/shgdWMbOzgImsnxMSp/C62ZtLDBO37pC1RtxZw
         a/LCSuXQjV3dZgD9A8RibMtqFiCifFWSPGqUuYyM92s6gt7GQdi2GSsobjVBbM1+wGkY
         +feYNArLldToZrFKhNDrJ4NjBRkVgvHANADF6MPcbGieY7naaEoq00CZocfCDs6xbkwo
         ZR8IgVBPY1s2DdkmOIrCZUZUzbMRnKxdh8KOaFJs7m+GO/HK1eOOYULBCUNLukhbO25M
         VVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307873; x=1739912673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Pj3xyZVnxx48Nul/orR9likJuxJHg260FC97vATh2o=;
        b=md6zQbM9zneexHaMvmUlzS4R6lVRJVesKeysNsoYschgvlYwHBkvKW7kKZ8xpeRu/Q
         lyqeOdnpCXXJ41OKwTaf8aV8GogBFXqs7j/JdJqkwNed+nVmD16sH05yBHB9gf1zFoeZ
         Dt8zaJ+NNk5DFKLsbaMu5ZHI73EGH1/ytmZx36qkZhQRmkXRp8HjBEKORQzhKyrIoDap
         im86sReBNINsFlpQsnbby/LwxM6PJe0aDnDhyaddnhm3LiZDr0EDfl93Sava6+TkNXmO
         hdMR1Hyim4LROccSd61d7miaDeMHDMVWVJ6cbpFZksyMr4qmoLj9nYx5URcMbgGovZJH
         oiFg==
X-Gm-Message-State: AOJu0YxzqtH6iv7xHFpoCUlAlHHU7R5tOfLXuZ64CH5nPKoD/zyY16ak
	enUgmXmg4UeQ6CYT0amWlENUzKIextOUfr81BRED8oPAenDC3nn2zNREoaeCGKJUCyplX9z7Aqv
	e
X-Gm-Gg: ASbGncvtL2RrFyClERDGdhqZqM/QHBBIYhugF+TO0SLFoFSmNy5CVYb9YWxcGTWvar8
	91+O/MuhGRvzBgLnzH5kvVOmiy9f4ZFbco2il42XHJOyvP0TwlEcl96Lvujmf/mMkkSnrrP6bzX
	vfMR2qvMsylikb8dsmQSMyTZJ8eaC+yyHxS9RjcTobrk+UEkP+6JQfUsROAWB3VeFtSJgroHzdX
	uGgknc+Wgry0FoImIhT0U7oYWQ+bJ1EAjMWDHdK5s5s+UOo78ntiNd5SUV3ctS7t+BP+ugKm/kF
	ftPhxGHcxrpQ4YKspAEhIzyxnMmDLV08Tw==
X-Google-Smtp-Source: AGHT+IHe7pZhzpnYZYe8gqS0529AFaiLSh7puh179PYis86qdk4h6eWekZQXRpZtNPbM+0GYcL6rMA==
X-Received: by 2002:a05:6e02:12cf:b0:3d0:17d2:a02c with SMTP id e9e14a558f8ab-3d17bffcc50mr10805035ab.20.1739307873198;
        Tue, 11 Feb 2025 13:04:33 -0800 (PST)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d1584d7e24sm16128935ab.24.2025.02.11.13.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:04:32 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [meta-virtualization][PATCH] kernel: Remove linux-yocto_6.6 files
Date: Tue, 11 Feb 2025 14:04:18 -0700
Message-Id: <20250211210418.3463657-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 21:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9136

Upstream poky has dropped support for v6.6 kernels which causes rpi
builds to fail:

  ERROR: No recipes in default available for:
    meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 ...6.6.bbappend => linux-yocto_6.12.bbappend} |  2 +-
 .../linux/linux-yocto_6.6_virtualization.inc  |  4 --
 .../linux/yocto-cfg-fragments-6.6.bb          | 37 -------------------
 3 files changed, 1 insertion(+), 42 deletions(-)
 rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6.6.bbappend => linux-yocto_6.12.bbappend} (77%)
 delete mode 100644 recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
 delete mode 100644 recipes-kernel/linux/yocto-cfg-fragments-6.6.bb

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappend
similarity index 77%
rename from dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend
rename to dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappend
index 2e2f92b6..9d1d49f4 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappend
@@ -1,5 +1,5 @@
 # Enable use of the linux-yocto kernel for the Raspberry Pi 4
-KBRANCH:raspberrypi4-64 ?= "v6.6/standard/bcm-2xxx-rpi"
+KBRANCH:raspberrypi4-64 ?= "v6.12/standard/bcm-2xxx-rpi"
 KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
 COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
 
diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc b/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
deleted file mode 100644
index 59311487..00000000
--- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# include the baseline meta virtualization configuration options
-# after this include, we can do version specific things
-
-include linux-yocto_virtualization.inc
diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb b/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
deleted file mode 100644
index 6bdc0d03..00000000
--- a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/"
-SUMMARY = "Kernel configuration fragments"
-DESCRIPTION = "Typically used as part of a kernel clone, this is the standalone \
-fragment repository. Making it available to other fragment management schemes \
-"
-SECTION = "devel"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-INHIBIT_DEFAULT_DEPS = "1"
-
-LINUX_VERSION ?= "6.6"
-PV = "v${LINUX_VERSION}+git${SRCREV}"
-
-SRCREV = "4a494b202029e94a72ebb3c3966d9f1d249900f3"
-SRC_URI = "\
-        git://git.yoctoproject.org/yocto-kernel-cache;branch=yocto-${LINUX_VERSION} \
-        "
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}${base_prefix}/kcfg
-
-    # copy the configuration fragments over to the native deploy
-    cp -r ${S}/* ${D}${base_prefix}/kcfg
-    # scripts bring in a bash dependency we don't want
-    rm -rf ${D}${base_prefix}/kcfg/scripts
-}
-
-FILES:${PN} += "kcfg/"
-SYSROOT_DIRS += "${base_prefix}/kcfg"
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.34.1



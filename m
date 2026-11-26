Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13460.1795698648097623714
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 05:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Nz3MPQlU;
 spf=pass (domain: baylibre.com, ip: 209.85.217.43, mailfrom: hfranco@baylibre.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso4230077137.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795698647; x=1796303447; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqXMIhtStIeZqX+J2jXloyVezZ3XxjYN3kTQJG2HCpY=;
        b=Nz3MPQlUK6zlSJLf/ixFdnomDBOF8zIAUEAQPDAX55ypx6xS0pg/gEiTEJAwng2WRv
         cIqxqKcJbPj4CJk/NY1Wl0UlvI8ORkzimmCP7bovSt/uODpwvgVXz19Jv+kmQq3Ilblq
         HLWpwJSdHymch0PZcpBsA1/o8S4M0LWFQQxPK2qdOHW3Sa8uls5vuC//dMHkpcaALj0W
         G0NyujKk0fOA8pA0od+tbtOYAdc3AsK5UM7Z+mtkxgM1eVtl9ODHIoABof3axd3iKjs5
         9JduGvkj1I/siJsVcll9AiLGHBUWy3jKRzDTgJDzrrMAWvqJyG70ObtgGhxXdukhnV9a
         QrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698647; x=1796303447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqXMIhtStIeZqX+J2jXloyVezZ3XxjYN3kTQJG2HCpY=;
        b=UlzNT64M6Ei5t0CF9iLDa3EZEWrOBhBnsLy3OwBnF102FswwFfIsZZiSbI+iXophek
         PK/8RieD9k0EIcGHZmZAQ2SGTavJAipzsOQOP9mGN1LRB2P13oXL1n3vneg3yFHq+LSZ
         mbtLKzQ0SY71UgEUQ76fFWxBokoxweRR/UW+CxtnODBh0R1HUCRK3k5czqhYnylKha2p
         lKSGjeoJ33RgGhR48AxACgGO4ubYqAAUWVWon8IwgnRo0XlcD95kIFG9MT8+WNLrNtbm
         545WSA8enPn7uMotbTaBp1IXmjoTIUIAbPqf0Qqz+0NilhOhwWGy4ob9G7I6UksrKZCn
         hSVw==
X-Gm-Message-State: APuU4Z8IypEQDkRVQ1eGC+/dfwTHivryogOPVYDGjWxedc/RKvcdLR5d
	evJzvJnEcgLtVSLgyh8kKnfPzjkammXoTRVjPIrZXsyQmxw4hYSyOb/pzCJSy3uuMI6lMOuSeC+
	7XfjZ
X-Gm-Gg: AZFdTZe3fSCFN1p48+qNV/YUhXrvhneLnTJLDRfsFjeFkxIljIHdV8e7AG+FG+wOBI6
	I4kzgqjVDc01fc1NYCWdekmbXVPxTFbsoFpIQ4onD/nHvWZjH7LSSf0+igdn1CgPg7NQ3FGkhTI
	BkRO/QG2bujjonErwMJjeo+3GrpuSyhMjuAwu2P19+bdlW9hR+Y4xq9Cae7JI9bWh/XJ+L/APG7
	BYB7QLOm1BAafJZM2reG9LpjYt0jaYEZSwJU7y/PVAwDEpU+9Tk+OJj45KyX2t35ksWvPM7dmS6
	GkCPpIeFTkbaMyhQnGpDXgl1nWZbL2Oj0ioj7/Ounfogr+WVZatcBI9WL2DVFHRDZnWlH1tGH9n
	XdB2U76D/EWCwLFV8hFGnJGHeF0CiW6gv+OtMhe06yZlJvKE97391qjnPVSTThrzMcYrmt/f4pk
	HBlAcy2Ah+53C8OqYDKrIWwT0eMu9LoKambJ240gIHq0xrn77YpclvxMxAW/ZeQmLfzTpsXrFgk
	C7k9pKuWKNgtYrQIXXzrFqcmAMgnR19KQ+f2/+MzRa80RRHLcSQmkw0vkfBrakd+zDqFUwrPH+e
	wCiWUu0iGIv/JzYOxQsu70OFscN2HX7GcM5UMVYOPH1a6sSAGtNLUP2nvfCWGp2r7/YrCzkFV78
	npt1dALFaQgLuyiZxQjdhOxmi
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr12606108137.20.1795698646977;
        Thu, 26 Nov 2026 05:10:46 -0800 (PST)
Return-Path: <hfranco@baylibre.com>
Received: from localhost.localdomain ([2804:14c:4c5:8bf0:325b:43b7:3a65:88e0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm21844220137.7.2026.11.26.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:10:45 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ronaldo Nunez <rnunez@baylibre.com>,
	Hiago De Franco <hfranco@baylibre.com>
Subject: [meta-virtualization][PATCH] xen: add initial riscv64 support
Date: Thu, 26 Nov 2026 10:10:35 -0300
Message-ID: <20261126131035.73287-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 13:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10192
Content-Type: text/plain; charset="utf-8"

Add riscv64 to the Xen architecture mapping and allow the Xen hypervisor
recipe to build for it.

Xen sets its own -march and -mabi flags for RISC-V, so clear TUNE_CCARGS
for riscv64 in the same way as is already done for aarch64.

The Xen tools do not support riscv64 yet, so skip the xen-tools deploy
dependencies on that architecture.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 recipes-extended/xen/xen-arch.inc       |  1 +
 recipes-extended/xen/xen-hypervisor.inc | 22 ++++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
index fb0093e3..8c505396 100644
--- a/recipes-extended/xen/xen-arch.inc
+++ b/recipes-extended/xen/xen-arch.inc
@@ -2,6 +2,7 @@
 valid_xen_archs = " \
         x86_64 x86_32 \
         arm32 arm64 \
+        riscv64 \
         "
 
 def map_xen_arch(a, d):
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index f448564d..fe987a08 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "The Xen hypervisor"
 # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
 
 # The Xen hypervisor has a narrower compatible platform range than the Xen tools
-COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
+COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|riscv64.*-linux'
 
 inherit deploy python3native cml1
 
@@ -94,12 +94,17 @@ do_deploy() {
 # - add the task before do_build to ensure that deployment has completed when
 #   the recipe build done stamp is written
 addtask deploy after do_compile do_populate_sysroot before do_build
-# To ensure that a deployed hypervisor has matching tools, add a dependency to
-# make sure that the tools have built and been staged:
-do_deploy[depends] += "xen-tools:do_populate_sysroot"
-# Also ensure anything that the tools recipe needs to deploy, such as a
-# XSM policy file, has been deployed first:
-do_deploy[depends] += "xen-tools:do_deploy"
+# To ensure that a deployed hypervisor has matching tools, add dependencies to
+# make sure that the tools have built and been staged, and that anything the
+# tools recipe needs to deploy, such as a XSM policy file, has been deployed
+# first.
+XEN_TOOLS_DEPLOY_DEPENDS = " \
+    xen-tools:do_populate_sysroot \
+    xen-tools:do_deploy \
+    "
+# xen-tools is not yet buildable for riscv64.
+XEN_TOOLS_DEPLOY_DEPENDS:riscv64 = ""
+do_deploy[depends] += "${XEN_TOOLS_DEPLOY_DEPENDS}"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
 do_devshell[depends] += "ncurses-native:do_populate_sysroot"
@@ -113,5 +118,6 @@ CROSS_CURSES_LIB += "-L${STAGING_LIBDIR_NATIVE}"
 KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
 
 # Xen is setting all CC flags on its own. Make sure that they are not modified
-# for aarch64, e.g. with architecture-specific optimizations.
+# for aarch64 and riscv64, e.g. with architecture-specific optimizations.
 TUNE_CCARGS:aarch64 = ""
+TUNE_CCARGS:riscv64 = ""
-- 
2.47.3


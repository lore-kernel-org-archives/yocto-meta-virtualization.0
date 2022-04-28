Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A53C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:06:21 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.4253.1651104379939857123
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mvybkSTi;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso6266413pjb.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lh/wyUSqc26YCdkPkU4pMimbUEop5iBgKMJ/COFiSc4=;
        b=mvybkSTifZ7BF1I5oao8I7WEkfIR6gAexXBn0OaSBnS7bJ4gVRd5+kBDJlw/fV69+7
         B8Wufyz83y47bwTBWZc7skHK9n7cDKSzzRNkkf+A3qxAsayHVhT98lIZwByXo2isRLeY
         vOP90bYWP1r5mrf3HpdooEW24c947GK99J/L8TJWOFjks50UYB6HFRxp0aYTyPgTnGUn
         PFBUjtDi9v0a94cN1ms6hFNXTHN0JO7W3VmCQe/eJ/GU1e1kgzL5Ld9D/s7eItUTyErr
         uzgoFyMi+91mY9KmPcoNGlL6uRGSUuOXu7/oPG44GgEzFlrp9UryUn9HWrY3udLycrvN
         ZtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Lh/wyUSqc26YCdkPkU4pMimbUEop5iBgKMJ/COFiSc4=;
        b=oA9ljv7nWGlSIeD9Swxt45DLO1EO3zd4LfBzQg/EQ/2r9qfReGSjBfvi3RGly5OaRa
         qpqfKlEhUNqx2iTgq5o3HU07NZIShTnjWCqUIjPr1kU9QCw45MZR44gaVpON9rsB4WNn
         nYLNgmDrreWuJTxI06IzrjF2AhF6eWLrueNrMVc6bxRYm9MHohXCJm7Qmr1OItIWRI2b
         3xhAOARovOr4ysxPjLyhvTSvcnn8uqJdbLhIfQf2P6ZJFmRMEBv9Ssk3tF0t6VbjcNg1
         R1rr9428N6QFL+AAEOHnqw9uJE/3d3aRMRs4mssgkY1jRFpuMzX8N3mBrlPqYn7JZdBI
         19HQ==
X-Gm-Message-State: AOAM530idfHMRMDwXvQlzmFrUXStGKssPDOs1/hmoBT4gVIRxuBmBzk4
	1W7+D/o8+Z0yBwUH6G8/xngR8EnECa4wXg==
X-Google-Smtp-Source: 
 ABdhPJzfXl6FSkZFPIfmpYigbtocw9jnh6xaAQUa0AgrdjvBedgqO+Oee5SqKjIka4xiJq2GK52Zyw==
X-Received: by 2002:a17:902:704b:b0:15c:42fb:e5b with SMTP id
 h11-20020a170902704b00b0015c42fb0e5bmr28719661plt.79.1651104379337;
        Wed, 27 Apr 2022 17:06:19 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b001cd4989ff4asm4268239pjc.17.2022.04.27.17.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 17:06:18 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	dpsmith@apertussolutions.com,
	scott.davis@starlab.io,
	Diego.Sueiro@arm.com,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH v2 1/3] xen,
 xen-tools: add recommendation for Qemu for non-hvm x86
Date: Wed, 27 Apr 2022 17:06:07 -0700
Message-Id: <20220428000609.26814-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428000609.26814-1-christopher.w.clark@gmail.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:06:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7226

The Spectre and Meltdown mitigations for Xen run PV guests within
HVM virtual machines, so Qemu is no longer only needed for systems
configured to run HVM guests.

With the split xen hypervisor and tools recipes, the bios dependencies
belong in the tools recipe, so move them and replace the hvm
PACKAGECONFIG option with the recommendation based on target arch.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
Unchanged since v1

 recipes-extended/xen/xen-tools.inc | 9 ++-------
 recipes-extended/xen/xen.inc       | 6 +++---
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 6bbc8cd..54bc477 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -30,14 +30,9 @@ RDEPENDS:${PN} = "\
 
 RDEPENDS:${PN}-dev = ""
 
-# Qemu is necessary on ARM platforms, and to support HVM guests on x86
-QEMU = "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}"
-QEMU:arm = "qemu"
-QEMU:aarch64 = "qemu"
-
 RRECOMMENDS:${PN} = " \
-    ${QEMU} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
+    qemu \
+    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vgabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
     ${PN}-hvmloader \
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 8b86de5..4c38ccf 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -9,13 +9,11 @@ require xen-arch.inc
 PACKAGECONFIG ??= " \
     sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
     "
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
-PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
 PACKAGECONFIG[externalblktap] = ",,,"
 
 DEPENDS = " \
@@ -132,7 +130,9 @@ EXTRA_OECONF += " \
     --disable-rombios \
     --disable-ocamltools \
     --disable-qemu-traditional \
-    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim', '--disable-pvshim', d)} \
+    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
+        '--enable-pvshim --with-system-seabios="/usr/share/firmware/bios.bin"', \
+        '--disable-pvshim --disable-seabios', d)} \
     "
 
 EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
-- 
2.25.1



Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C820C4167E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:54 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1532.1650653640331280431
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 11:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mB6EZFP4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c1so2259436pfo.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmAv+I2ULSVpGusd//wDOlKSYPbiO43vNIraZb0mE6E=;
        b=mB6EZFP4h8m8rBCaWxEQ9Ws0wV4L88b88R7l7OeRsbZAMz3wEh1YMVmoELuPmGuRJO
         NPYyyytTOsf/7A59ti31oQSUKsPSOnJKWKJqrTHVKMmVnCiLbDUbIzrtu0P+uOeHm0nu
         VbYqmaPulrjO3OQLDK6+IMYKnNQgUNuebyM72FUTGzbTXf05JNeLrVz4B1VDMRpcGN2d
         +j4Hl7aCT6L50lQhGiYkNd28NeJTgFRIn0rU/fND77q6Wbde5SLipGcs6gE31iMzdFQN
         ehkAxq14xjytdeoE5fRx/KrMZ04IgDsppK9HefZ1pywaevRc4PRRO8QSbz5W11Dsnl4o
         KsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=xmAv+I2ULSVpGusd//wDOlKSYPbiO43vNIraZb0mE6E=;
        b=hofPvmBiWM7Iju/c+H9lC8AaY3cLvWq1YQ4GIu0vLUlU8bzqZ76kM8kp5LOV4qXaTy
         BDZag4FNKnf09bLj3yTZmTKPuEFBfEx10LYqkd33krRuHWPReXAnceoCZ5XidUMMY04I
         pDyNWLCjV9nv9j89JfbEnKK7qdrNA5L1/elBKYRdbXzzwkK7jbrwV4AMy2ZdU+lZoY3R
         z7hTK7g5oEjB9yOiztLGbmVCkplYIst71Sa9ltF/vM+QuNtZL4gvjTXNdskgy3ZPQxCV
         JFgW3ymDWRfKwyNnwEtBqG2DIanCwtIfRJJNF1UPLDssnUpLWnbJ707kKBZxgAgy1b0c
         L65g==
X-Gm-Message-State: AOAM532flRWSeB0vpWgKgnNEO1xvQtmW4CU/GaBPj7ZeMkfzlchcdAQi
	KQK7W1o9ui4Z0Uryqd9iDXl5VsxbCittFA==
X-Google-Smtp-Source: 
 ABdhPJy32rCeumvnVCF+SN+8aQ+wRPqahPb9/bI1Xy9BwlDF1PNgzqgFKuvCrrZjbIxsa6Lhn9Kn0g==
X-Received: by 2002:a65:6a45:0:b0:3aa:69df:3b62 with SMTP id
 o5-20020a656a45000000b003aa69df3b62mr5111272pgu.394.1650653639447;
        Fri, 22 Apr 2022 11:53:59 -0700 (PDT)
Received: from cog-dev.ice.pyrology.org ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a6550cb000000b0039daee7ed0fsm2712163pgp.19.2022.04.22.11.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 11:53:59 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	dpsmith@apertussolutions.com
Subject: [meta-virtualization][PATCH] xen,
 xen-tools: add recommendation for Qemu for non-hvm x86
Date: Fri, 22 Apr 2022 11:53:56 -0700
Message-Id: <20220422185356.59217-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:12:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7214

The Spectre and Meltdown mitigations for Xen run PV guests within
HVM virtual machines, so Qemu is no longer only needed for systems
configured to run HVM guests.

With the split xen hypervisor and tools recipes, the bios dependencies
belong in the tools recipe, so move them and replace the hvm
PACKAGECONFIG option with the recommendation based on target arch.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
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
2.20.1



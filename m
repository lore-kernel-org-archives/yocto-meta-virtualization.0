Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.90.1600803948426190582
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jv56fO+Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id p65so16621264qtd.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zYY73axWE4mtsvzxDzvtr/eCbuzRYRmYW87catSPKxI=;
        b=jv56fO+Qlw8EyUo4ac20JnUO+zur3k4fPo3JZmKxOLSK32ttja/1Te8bBrjAneI5Bt
         VCaQnEnsDkXepEEJHN9w2caVWbX4HtVNXJVKCvCdEkhUNzMI4gemlRpUolHIHNbVKijH
         7TXyG8qOD1pDwLfNM+s+k4VvEhRnpqf+82M0jBe/LhpDIHS3dAAIiEXt2fSHMNMz+Zcq
         +52l9lDY147PsN1R2vCXVOBq3u+S2LJf/mgIcLD+aTZKym874LYgP6iKVIRr12pnRqDs
         pczdHwtypm7i0T/DXu4ozGSf7RVYhfxyryin4MmUMR27k7cbrc4xhjXAm+zCmttCvaaK
         6NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zYY73axWE4mtsvzxDzvtr/eCbuzRYRmYW87catSPKxI=;
        b=ICUOJNNxkXObHj6AUuBxCm19FiQpHNScfhOw5rNYmikGWAVBkJeH0pZdkzpnna0DHL
         oJSZcKFyzeAkveg8MUmi25c9M5YAok6noSsiAl0ndC9yrCeI4VojJlOjYEGKXv12Q1wq
         PEEwVryOZ1klat86adTvuMIOkvQYSvSlz6lPeoZa/p8dmVu5MrVanioqC+7drozMsRvD
         WW9f2j12EhYqlaAV03lqxOaV72pp7YtOvzn89icj4bxTXRYNWLvtHdlwDyyAvWaiMFPM
         foVMoqbEn9wzNprECC65E6ZPBVyqoWflXnoDKxkK3ygTgnaSn9VUcfMeIvW5LCnfsrlc
         WO5w==
X-Gm-Message-State: AOAM533QVekORgOfCpj/PFroM56n2zk4Hutmyqm5tYzU7AQ5IEfFyKvA
	IK48QIYz27i5Ve8qP1VOWBFzn/FPoiSs5cwF
X-Google-Smtp-Source: ABdhPJw94Yn9ZVgxcsk1HlNtILj1v/8wFJvFbbG5onC+xiDfyvwb7PH0ITFMZJRnI3oMwTqeFrIRow==
X-Received: by 2002:ac8:157:: with SMTP id f23mr6314405qtg.273.1600803947303;
        Tue, 22 Sep 2020 12:45:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.46
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:46 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 2/7] xen: make kernel modules an override possible variable
Date: Tue, 22 Sep 2020 15:45:34 -0400
Message-Id: <20200922194539.51933-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200922194539.51933-1-bruce.ashfield@gmail.com>
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

Sometimes Xen is built with different mixes of kernel modules and
built-in values. If we put our expected/default modules in a
variable, they can be overriden by a different kernel provider
as required

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 1b45397..6733801 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -2,16 +2,16 @@ DESCRIPTION = "A minimal xen image"
 
 INITRD_IMAGE = "core-image-minimal-initramfs"
 
+XEN_KERNEL_MODULES ?= "kernel-module-xen-blkback kernel-module-xen-gntalloc \
+                       kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt \
+                       ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
+                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
+                      "
+
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
-    kernel-module-xen-blkback \
-    kernel-module-xen-gntalloc \
-    kernel-module-xen-gntdev \
-    kernel-module-xen-netback \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
-    kernel-module-xen-wdt \
+    ${XEN_KERNEL_MODULES} \
     xen-tools \
     qemu \
     "
-- 
2.19.1


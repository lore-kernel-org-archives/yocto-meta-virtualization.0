Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73838C4332F
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.8879.1653159901387111636
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WFvC2jhk;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 31so10365647pgp.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TLbe5LjpDgfL7TNW/iqsZiG7SGNpLaUfxhd9BOaaiG0=;
        b=WFvC2jhkGIzgmiuEPSuWXd0jyjCyEsd+yEpD5lpbrbdSQKW/7BsiQ3petArHq1cY8f
         7c4B2dkQvBZ7eHHtyUjgmamH4pjwms58NQbtyjpSMRL099qL4/fzh3ilS5JmkzLstV95
         Hts0sku7BUHYfUTgTQURCrdL+Q2tbl+nNFEyRsGCynYOCUJyAeJapAgnSNKpPrywtoUu
         eRp3z85ZzSUDC8VEV3n0WdPdRkEeXS9y3CNFDepbXix5V4+rGW9ALaACflK7JJ1WEfp4
         YZ++QgG/vWR+Ncrjse0a4uETatAOUFpXG0ZiOodAiqH1h2uAfFpUoNwZOTzr9CiHbDR4
         sjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TLbe5LjpDgfL7TNW/iqsZiG7SGNpLaUfxhd9BOaaiG0=;
        b=JL6RTAgrs53Nt7OfwTrZTG6ieOstQrfkcnqQLqyl++bMl7qrwxsHuSeEh3cMTQBwum
         b11AT9BmYX/Sy0/dn0c0x98TU5dU2MvPEvMeb3kOGK2iI77Hx2rjsa8vBKNrRfZ4aaDZ
         V/sICsYruQn03UdtK/PqNuqLxmUo+tK1J35jykEjrydO4ptqtVKS8XsIFWE05mVEA4/3
         CeqTkrCckwPFaR+pA9Uky2DVClQzYn+1QuWK4RkBJy5S7lVdOV+wY1mMKeQR6pmWt73W
         u6yYP47C+q6ZRkDIJmunl1vroxlgvMTOxqvD8s2PS0Uq/WoSZjICZnbbs3+v9OOE7I7C
         IU0g==
X-Gm-Message-State: AOAM5307J9+f0IynRAj2mDW56alxE7ZsVu+CRiD7+ARKHIkE1fuAN1DB
	a+ROCVV2nLINo/14Lcm51+eM4RGXBQA=
X-Google-Smtp-Source: 
 ABdhPJzSRNAX+nGt5aFxbuD72XwsP6QPBw7Bm3yYJ9u4uFetJDee1mECKBeu8wfe3qoQCpE8i/+EkA==
X-Received: by 2002:a63:5063:0:b0:3f6:a3e:ad37 with SMTP id
 q35-20020a635063000000b003f60a3ead37mr13825049pgl.451.1653159900729;
        Sat, 21 May 2022 12:05:00 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:05:00 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][honister][PATCH 3/3] xen: fix boot on the
 Raspberry Pi 4 with Xen 4.14
Date: Sat, 21 May 2022 12:04:45 -0700
Message-Id: <20220521190447.135705-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 21 May 2022 19:05:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7307

Apply the patch from Xen to fix device tree parsing in newer kernels.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...issing-device_type-property-in-pci-p.patch | 91 +++++++++++++++++++
 recipes-extended/xen/xen_4.14.bb              |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch

diff --git a/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch b/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch
new file mode 100644
index 0000000..09a461b
--- /dev/null
+++ b/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch
@@ -0,0 +1,91 @@
+From 5a4087004d1adbbb223925f3306db0e5824a2bdc Mon Sep 17 00:00:00 2001
+From: Stefano Stabellini <sstabellini@kernel.org>
+Date: Tue, 9 Feb 2021 11:53:34 -0800
+Subject: [PATCH] xen: workaround missing device_type property in pci/pcie
+ nodes
+
+PCI buses differ from default buses in a few important ways, so it is
+important to detect them properly. Normally, PCI buses are expected to
+have the following property:
+
+    device_type = "pci"
+
+In reality, it is not always the case. To handle PCI bus nodes that
+don't have the device_type property, also consider the node name: if the
+node name is "pcie" or "pci" then consider the bus as a PCI bus.
+
+This commit is based on the Linux kernel commit
+d1ac0002dd29 "of: address: Work around missing device_type property in
+pcie nodes".
+
+This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
+on their device trees:
+
+&pcie0 {
+	pci@1,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		reg = <0 0 0 0 0>;
+
+		usb@1,0 {
+			reg = <0x10000 0 0 0 0>;
+			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
+		};
+	};
+};
+
+The pci@1,0 node is a PCI bus. If we parse the node and its children as
+a default bus, the reg property under usb@1,0 would have to be
+interpreted as an address range mappable by the CPU, which is not the
+case and would break.
+
+Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/
+[fix style on commit]
+Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
+Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
+Tested-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Julien Grall <jgrall@amazon.com>
+---
+ xen/common/device_tree.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
+index 18825e333e..03d25a81ce 100644
+--- a/xen/common/device_tree.c
++++ b/xen/common/device_tree.c
+@@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
+  * PCI bus specific translator
+  */
+ 
++static bool dt_node_is_pci(const struct dt_device_node *np)
++{
++    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
++
++    if ( is_pci )
++        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
++
++    return is_pci;
++}
++
+ static bool_t dt_bus_pci_match(const struct dt_device_node *np)
+ {
+     /*
+      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
+      * powermacs "ht" is hypertransport
++     *
++     * If none of the device_type match, and that the node name is
++     * "pcie" or "pci", accept the device as PCI (with a warning).
+      */
+     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
+-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
++        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
++        dt_node_is_pci(np);
+ }
+ 
+ static void dt_bus_pci_count_cells(const struct dt_device_node *np,
+-- 
+2.25.1
+
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 267db16..c0fa938 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-xen-workaround-missing-device_type-property-in-pci-p.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.25.1



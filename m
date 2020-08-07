Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1417.1596783924915998497
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbWbP3f9;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3979E01FA6; Fri,  7 Aug 2020 00:05:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48B15E01FA4
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:24 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id 77so894754qkm.5
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rVubcRHz4DSXmhPIZ6tp0g0RsUIVPUXuuYb4gWcO4BE=;
        b=PbWbP3f9UAr3C7OMfoiJ+4TxHHLTTI1tG3Jg5GgU5hbQ903Gvnbl01TCODhY0whTnJ
         a2n6dLuDRr26breDmlfI5MDrduy1idKHchi1FGezNY8lPWArGtSCH/QDlwclCYTvGhCP
         YZKa4v1MiVKizRTuYnNdrIG3uo2JS5j8uxvkzSeqj35svtjNmINkgm2eMLUNbl5JSXuq
         TTQ4wnFrM5lyEoYfotb/EloRMmK2Wo0xfDCO9zSp1T3XgTxVN9e4tsqAC85FwSyteqPf
         Kb6zYb3y/vgNp3m1ceyBp7Y1ZprqFjzycLmwjxS50P+h6IJp7p9rdoRPRFm0865V5huq
         Okag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rVubcRHz4DSXmhPIZ6tp0g0RsUIVPUXuuYb4gWcO4BE=;
        b=GKryeYZxAn0VkcidjxnvkZkJpSe3k2flZPLIZpWHnO+6+hbA0qFev6tcqXGzGnyo4m
         uI4MLbMgmPGgSihMbvB5zVGrKoPmz8KsSp75Ngn+kOW9poHnuP5Putv8LGMPteunWFoP
         TcC0Zm5j6dZqjbQ6r0VPooEDq87zxSVcOK9x8mX4cmtYmEtv77rFyA1CoeMDQfArrbhH
         mtR/wmlNiLuvWp/dL0wIdqrcLoqiKUl2XkbgsvqJrww3QCq5PXjyGgBLxhmX4tX6iWoh
         XSMNprNz76uHebVejo11A8Vd5q2lNvNfEjvZP9XzsJh1dcTU1yqACjWUpYxMVfPQEyx+
         FPAA==
X-Gm-Message-State: AOAM533TqLex2nbttTunhRohtZ4D8Ikgp66RLFcerWhXPm0y4SkskGHO
	reaPwCDPpVaYI/Jy7CGUtQT7v+g/9Zs=
X-Google-Smtp-Source: ABdhPJweWes+4K3DA6t6lHjjW5v1aHs1k5saU8RXJARSuRUdY0cREB0lwP8PLqAxWcoOBsLFfvMMjQ==
X-Received: by 2002:a37:96c5:: with SMTP id y188mr11972618qkd.412.1596783923367;
        Fri, 07 Aug 2020 00:05:23 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:22 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 2/5] xen, raspberrypi: bugfix early boot messages: use earlycon=xenboot
Date: Fri,  7 Aug 2020 00:05:00 -0700
Message-Id: <20200807070503.30777-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>

Replaces the prior use of earlyprintk which is an x86-specific option.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in            | 2 +-
 .../recipes-kernel/linux/linux-raspberrypi_%.bbappend           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
index 6c38d7d..84d533a 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -14,7 +14,7 @@ echo Add boot arguments for Xen
 fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
 
 echo Add boot arguments for dom0
-setenv dom0_bootargs "console=hvc0 earlyprintk=xen debug root=/dev/mmcblk0p2 rootwait"
+setenv dom0_bootargs "console=hvc0 earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
 fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
 
 echo Add a dom0 node to chosen to put Linux boot information in
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
index 25979e2..bead4aa 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
@@ -1,5 +1,5 @@
 # For a Xen-enabled distro, override the contents of cmdline.txt
 
 DEFAULT_CMDLINE := "${CMDLINE}"
-XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlyprintk=xen debug root=/dev/mmcblk0p2 rootwait"
+XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
 CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
-- 
2.17.1


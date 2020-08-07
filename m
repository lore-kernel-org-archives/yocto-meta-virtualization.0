Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1375.1596783934468194412
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QsFZ6hcW;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5696FE01FA6; Fri,  7 Aug 2020 00:05:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3C32E01FA5
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:31 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id x69so907893qkb.1
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iLhWsaEH1sdRIaPqhIiGENhr8JUaXQoxAZ1Tf/uSiQE=;
        b=QsFZ6hcW27ZKCRf8XOqPF0bLrc7Ml8YJua5l1VZ9zv5aUjyC4jpZXRjgs2EgidDAjb
         m6aIlBF7+uQ738rviWx4KgoIbNfDjbEd9JIA+FNSSAigFuNNi4Z6pGVgMK25Kyvjz4Dh
         VEK8tTAiV87zPFPnPV5SD+1Ky+pxc6bY/u+mhLzzppf7O3w2vUOZyiVycVXGKO8obbvE
         mTP+t5IbxG1iEYql2l7/g8oY1/CXZt1hmV/iZoXWS4klMU1Dq+3Ku5TzlwMtUI038cPU
         H88tIg1b0kg3quMO4wR8bS3hDACeKiMnR9AF1Wyv0tig+VL7GjgMYtDjywbwzthlSqF1
         fayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iLhWsaEH1sdRIaPqhIiGENhr8JUaXQoxAZ1Tf/uSiQE=;
        b=IOnALfcL2kkr9bnrRafjxHyUwz0ySvFPgJ948aKFCr6Nv0ZAw3q0ysdLDb07GcrUIc
         yngvNh3ItDRt26JY3S2ljBbq7TSKDJBrg1LLHzMOzDpe4+B0iUK2dRklI8OaDmr/w4L1
         phNkjCmFZKDqbA3tJqDJbe+YL0tFwW1aQsvJuj3rQCi4/1r7vvyRI40VNPK10Q5RLt0G
         6FNrTxHJwtIM8pwhXFccUVzAsqZV1D7Cu4Lcjjf11hfrXaKk1uvElyxTApQqwzNWe1Gy
         Cj+MUV7m/L426rQvPBGCRg5mZjjZUmMc+HaRp41s0t33GwmVEsN0c7QctDZqobFfKPc3
         F6Iw==
X-Gm-Message-State: AOAM531teE1Wmd5lr0xCNrCXQx723binvu088RcOxwSE3YsVPsA9IfFZ
	5JB978SdmPvLWVCm/xGhInqQsN+bwSM=
X-Google-Smtp-Source: ABdhPJzEwEGDEZaGVSVRXemFplM8hP1wmUR+DxVzijOmwuneuAca1UUhWyRqqV/g9DxgqG4vuAZGmQ==
X-Received: by 2002:a37:ef13:: with SMTP id j19mr12419386qkk.184.1596783930883;
        Fri, 07 Aug 2020 00:05:30 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:29 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 5/5] xen, raspi4, linux-yocto-dev: Enable Xen on Raspberry Pi 4
Date: Fri,  7 Aug 2020 00:05:03 -0700
Message-Id: <20200807070503.30777-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>

Enable linux-yocto-dev as the Linux kernel for Xen on the
Raspberry Pi 4, with the bcm-2xxx-rpi4 KMACHINE and KBRANCH.

Set a Raspberry Pi SD card variable to increase the size of the boot
partition to accommodate both the kernel and the Xen hypervisor.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
Please note: There are currently in-flight dependencies for this
awaiting review: linux-yocto series, needed for Xen support:
https://lists.yoctoproject.org/g/linux-yocto/topic/linux_yocto_dev_kernel/76044154
and a Yocto kernel bugfix:
https://lists.yoctoproject.org/g/linux-yocto/message/8922

 conf/distro/include/meta-virt-xen.inc                  |  4 ++++
 .../recipes-kernel/linux/linux-yocto-dev.bbappend      | 10 ++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 0a91ef9..44853d9 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -17,3 +17,7 @@ RPI_SDIMG_EXTRA_DEPENDS_append_raspberrypi4-64 = " xen:do_deploy"
 DEPLOYPAYLOAD_raspberrypi4-64 = "xen-${MACHINE}:xen"
 # We need the GIC enabled for Xen to work
 RPI_EXTRA_CONFIG_append_raspberrypi4-64  = "\nenable_gic=1"
+# Increase boot partition for space for kernel and Xen
+BOOT_SPACE_raspberrypi4-64 = "61440"
+# Override the meta-raspberrypi default kernel preference
+PREFERRED_PROVIDER_virtual/kernel_raspberrypi4-64 = "linux-yocto-dev"
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
new file mode 100644
index 0000000..85d6feb
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -0,0 +1,10 @@
+# For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
+# with Xen-on-ARM-specific command line options
+
+DEFAULT_CMDLINE := "${CMDLINE}"
+XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
+CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
+
+KBRANCH_raspberrypi4-64 = "standard/bcm-2xxx-rpi"
+KMACHINE_raspberrypi4-64 = "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
-- 
2.17.1


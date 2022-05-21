Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F5BC433FE
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.8688.1653159897648556760
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DZAnLIsp;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c14so10362327pfn.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WtGfmP22cgUrprWRjFQZbz+UzTuD91zTdVrJKWNLgXI=;
        b=DZAnLIsp1AGy0TKT2IxpxyyjcMGcmGfCDiymzWiXb7wMlJL1Z1b34DyKqiB435CL3b
         sQ8RoO8J5KfU+K3CO9X8rksV2oOiqtTmr+rnDkj/ewg3MxzjoP6frD20e7nDmmOOkehk
         aUoo7Pcu/KRLo1cNyytoxpLaFVYU6flT+LyBoTPvYKau4/JQFxFWGg2D5e2bjl13IrpH
         v3eYJLfRlITswafArp3RAb1Q+mdmL8/jnEmXOh08jzEcMTPUIH40Wu2zNUxF9kQjO2T0
         Ikd7N3BSQUBLo1LgvH2MhneyFfh7ktI/91BE+GR8pEU8MuuAqtKKwq+RellQf1B24Y4e
         gk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtGfmP22cgUrprWRjFQZbz+UzTuD91zTdVrJKWNLgXI=;
        b=51uiuLYWft7JXl8NS+v+aiVnkVsElc8gVnOA9e+BkY5kyf1DE8P6YzVrCt+BEcgUbC
         1C+ID8isNOLadGBDQwJvl4SUogdNQP+GBd/N8WYLNzgs/OAuFPauPtI7MWscfLpNhcCn
         oeXhhT6aQ9BN3ejfjnr22G8tKY6tQiEkrUWvC9OKaEbiLgr7s1z6+njH7YJc82wNVy20
         3JDQaW1fOdNkMJ9cN/tEwPWaSxFk3r9DSByPQWOr1eYYarnARcHJO50TBPpsbnl9u0j6
         cTgBV9As2dPIag7wXhsi/sfdEvHMOcOrWVGEnyjKFVTsO2cYJ1JMJp2YEFH3GVZqtH2J
         NDTA==
X-Gm-Message-State: AOAM531VJ18JcC2aVYD5RsJfU/2ZFW13lOkjZzjLrENafGOTFA44O5oA
	cKxY3vuSbz/nb/KsnqplMiQWQ0Shoug=
X-Google-Smtp-Source: 
 ABdhPJw7XvsFi3LUSdisHVsXgwZtyjvXzH57+ewWQp9Zt9aZE2obgsm6oKQ2Hy4d3HnxEp59nRKVOg==
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id
 l14-20020a056a00140e00b004e1c81a625cmr16067208pfu.39.1653159901474;
        Sat, 21 May 2022 12:05:01 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:05:01 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][kirkstone][PATCH] xen,
 raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
Date: Sat, 21 May 2022 12:04:46 -0700
Message-Id: <20220521190447.135705-11-christopher.w.clark@gmail.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7308

The default preferred Linux kernel for Xen on the Raspberry Pi 4 in this
branch is linux-yocto. The alternative provided option is
linux-yocto-dev, but this is unintentionally a branch tracking configuration
rather than a fixed revision so not appropriate for a stable branch.

Remove the linux-yocto-dev in favour of the linux-yocto kernel version
5.15 which has been tested and verified working on the board.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 --------
 .../recipes-kernel/linux/linux-yocto_5.15.bbappend        | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
deleted file mode 100644
index 5f43052..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
-# with Xen-on-ARM-specific command line options
-
-KBRANCH:raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
-KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
-COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
-
-require linux-yocto_xen-rpi.inc
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
new file mode 100644
index 0000000..572f7ec
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -0,0 +1,6 @@
+# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4
+KBRANCH:raspberrypi4-64 ?= "v5.15/standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
-- 
2.25.1



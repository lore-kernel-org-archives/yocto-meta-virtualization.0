Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.4208.1619253088522037480
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBV+A564;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id s4so10302138qtw.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNQMtwHn3xbHQia7pdLPb3eTtK/fXwjFE97Q8AixKeA=;
        b=dBV+A564q/OsqsavAs8jKDfA/IK3RR+eK/BE+yEwFK4SlNGFRxGTf3tBKiv6amh7ah
         SliWy9BtGEaXi7JuKCMOztJERLOZgxWmrxldJlj1EN7mRoRWaLJ52vm9f2Akglcc2JQ2
         HbKaZ7IvN+m4T1mK0ZHHUj3iJ5NbLo+ZEoQdZGjqrqDVFcy72kASyLUip8Vta8XIGN8b
         dYAkZm4xs+rHGbS9JatG3RFcSJ3VQLQy1gTKozNY2j5/A7Y6UBycYl4clQTjO7A2rcrF
         brUT8zkGNpUFx/pp4NGI2OFNl7vh+xyG/AnHtwmMYNj8CUPVsLkby24t7CftxK/j3mk+
         R5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNQMtwHn3xbHQia7pdLPb3eTtK/fXwjFE97Q8AixKeA=;
        b=Qm/YuR7M8dJ7Xtkkn8oYizGLwXJoRcp3Mr9Ah7Orqr4xQVqWEWhAPsSOTaXhcM+R/w
         wbogRHfnVFEw4qso2r8L4vLdhoUOO8BCXutFz9xSoMYTHMXfczLrdIHRUf8r43AwS5aP
         fifHa6z3GoRglB/Lngz0BYQ/ngB0hK9Mv09kWOxcPcB6ZYZqeQrGkl1SX7Bea5pc/EJC
         tFiOHol92L78/fKak1/X8ZpPeItkpmXbSCpm98CrTKaIi/seoanVlUWy+5tQdQkB1qfs
         7+Af7y0gtgCFvuDMCB6c8J1r+slmhl8k8t4zj05KgYzOwECqdo0D6dUzx2YjqciFBV5Q
         HbLQ==
X-Gm-Message-State: AOAM533Cv3Ar4oazvA0fdejeE7Wb7eKJ70sm63QZN11bfw71cIOw8S8/
	mpQ1MIZj8cjegUiGwrBr0eoTnqMSH6k=
X-Google-Smtp-Source: ABdhPJy4M+XBWW+JxszkQyrTm4vSuX74mF3pIRpdU3N1s5FSgzWn78gClBRlqsq+ykMCx5cwT66+JA==
X-Received: by 2002:ac8:7f41:: with SMTP id g1mr7568346qtk.72.1619253087528;
        Sat, 24 Apr 2021 01:31:27 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:27 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 3/8] xen, rpi4, linux-yocto: enable linux-yocto 5.10 for RPi4
Date: Sat, 24 Apr 2021 01:30:58 -0700
Message-Id: <20210424083103.202107-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added to the raspberrypi dynamic layer for use with Xen as
preparation for switching to it as the default preference.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 ++----
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 ++++++
 .../recipes-kernel/linux/linux-yocto_xen-rpi.inc            | 6 ++++++
 3 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
index 2a0416f..8381e44 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -1,10 +1,8 @@
 # For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
 # with Xen-on-ARM-specific command line options
 
-DEFAULT_CMDLINE := "${CMDLINE}"
-XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
-CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
-
 KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
 KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
 COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
new file mode 100644
index 0000000..af92493
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -0,0 +1,6 @@
+# Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
+KBRANCH_raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
+KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc
new file mode 100644
index 0000000..e8c120d
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc
@@ -0,0 +1,6 @@
+# For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
+# with Xen-on-ARM-specific command line options
+
+DEFAULT_CMDLINE := "${CMDLINE}"
+XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
+CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
-- 
2.25.1


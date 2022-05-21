Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B056C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.8846.1653159902575587765
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AJukUadv;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id p8so10325523pfh.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XfsULKG1t+GP1Hxl6asl4ecr5fuyEhOb51Z4Srn0kBI=;
        b=AJukUadvxiJxy3ngKYfm1SvtZ/nWFNtd3XQdtIETcAq8fqBSG/iRWNWHc3zuvlly97
         X4ST7bZxzzUEwDs1IvwUGG/JrxQyO3TdFbK4AuaG/6+iPiEZRx5agYHL2nKYy2Co1uAf
         VQNV8HkURnf9r03p5HbHh56g2jyrYo5qBnYgpszp/a3XKZ4VG103ghwSiYtC4NutNDTd
         W0F/EWB0sm9NyXw1lTQnT4NfLcYtnCiDEqPab1UXPG94efxfr/APAg6OdS72MMLNMuzB
         Q7qqsC7WFxkEbKQ5vwEm6VhR8Qj1NzIvu6hEYB9MFxTQpsaKcPbh1BN657gU7bIvQF7X
         BugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XfsULKG1t+GP1Hxl6asl4ecr5fuyEhOb51Z4Srn0kBI=;
        b=ROe2T6yEwET9M5AZs/WepCow6OpMq+bM9Nu+TTXNnMggERCJCq0FNXUAZ+IB2IBlYw
         DwamYvIVEhhJu5DHWT3G+QQ9HkGIiEfnC+18qWt3ImHDV9EL9vo1hPmbX8VvBmPa+MbM
         nD6vFG6wXLyFGT+3eEbixZ4RSgAowob0dW8MAzycIIPlCAUu6VpAYmGrpMF2NARlLf8J
         jivS5xfoUUWAnHRqKAwlnPifZ5ILw0tBntTA+HPlY8va+1EdvXa229odZhqjRJHcQJoj
         OlvCsmVSHnwKrCp9mmLs7JcKQxyf+MLeJxdrVcuj94zm7JnJqyxWq0yrLgkoECmzmDeH
         oS4g==
X-Gm-Message-State: AOAM530vz+kCrD3K9srKZZXfDwTssgNxdNmm6tzbdr1Zz7oW2EzpZoLb
	bt+TfE9SvP/ag9Pg7Io0lU2FFC+kzzE=
X-Google-Smtp-Source: 
 ABdhPJzY3nTzRu86dpTonc0kdYasW0oU0slwztPVeoE19xuixDszkJlyG79mwmOSkjiu5mnYkUsYQg==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr16200735pfj.32.1653159902041;
        Sat, 21 May 2022 12:05:02 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:05:01 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH] xen,
 raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
Date: Sat, 21 May 2022 12:04:47 -0700
Message-Id: <20220521190447.135705-12-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 21 May 2022 19:05:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7309

The default preferred Linux kernel for Xen on the Raspberry Pi 4 is
linux-yocto. The alternative provided option is linux-yocto-dev, but
this is unintentionally a branch tracking configuration rather than a
fixed revision.

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



Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734AEC433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.8665.1653159899929305921
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VXCjgb0d;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gg20so10652531pjb.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhCZQr4CWHpi2a3Wx8N2+KnqpGdJvF8/b7vz9QMlars=;
        b=VXCjgb0dUi+hg9ejtkj1Y6sntUCE4v9/lqF5ZS1bB18pZ3uHgICXmgjOPrPKyekcVD
         IvyVG5cO0/8Qq4kJGuQ4R8mJQT4UXqL34s36F9S/KEOtyVDmkdHWyKB/gwecZNbLhNaB
         D0DklWmeaQuGeK7FOU/79qU5UNj44WXoa4wOv4utE593mt4RyNlH1Z05Xwpp9/W9de4j
         Ik54uxoOOwq8ktaH3Bm817qdtJfGe7IJ98j/SrlsXebZb9sbyBIb8M7ZV0gGrn3jUpQU
         RpA7947izLXVECGk5olgl2ycDCuoJK/mtD0IVB3xhWYhWFuc4jezsA0tHq8Z38GqERZ3
         VF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhCZQr4CWHpi2a3Wx8N2+KnqpGdJvF8/b7vz9QMlars=;
        b=8PV3ukGVnOq0EaBIdbCgTx5L7CGu53Xk5cr4mNUAUKn5yEavDo0h0/1DfIqnCYu2ja
         bNywdoB94q4Ce9Ak/SaXzwQ13r/rZprrdzvLhgTMoqxW3UzJyaxSZVQgpczc9US+FHnl
         LS8l7xydXuurczaogHoIeAUYlRhYttjGzVnN0oaew+Y+Uxk1OAkTgS1cnauiyj23Bxv3
         ZCYiiszK1jc99g4QfGOXmr1ttR4XldpkCtcUUuNsZv8GVB8jOeNxfVQ5awUMS4YNq3Kt
         rlmlKwz0yQI0hhHiyjiZZuQB0ZqEnz2BLrSrhHzuRtCLo8nydgcSPtcdbovmRYtC846z
         k3NQ==
X-Gm-Message-State: AOAM532u9VZDo/5o8hCpGHX+jEGTSGaEE3/V1wflPglOdVr4ibKeSgFb
	tnEe/u+5fE5J9kD9tAeb6wNFpV80tHE=
X-Google-Smtp-Source: 
 ABdhPJxt/52OU73/KNg5eCbj6UdNk1axFJigKNTNVGekX6351vDaJMhb0Mg4YvxVS+4CtZkPU7Ph+Q==
X-Received: by 2002:a17:90b:2189:b0:1df:7963:3315 with SMTP id
 ku9-20020a17090b218900b001df79633315mr18414726pjb.68.1653159899331;
        Sat, 21 May 2022 12:04:59 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:59 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][honister][PATCH 1/3] linux-yocto-dev, xen,
 raspberrypi: remove tracking bbappend
Date: Sat, 21 May 2022 12:04:43 -0700
Message-Id: <20220521190447.135705-8-christopher.w.clark@gmail.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7305

The default preferred Linux kernel for Xen on the Raspberry Pi 4 in this
branch is linux-yocto. The alternative provided option is
linux-yocto-dev, but this is unintentionally a branch tracking configuration
rather than a fixed revision so not appropriate for a stable branch.

Remove the linux-yocto-dev in favour of the linux-yocto kernel, which
has been tested and verified working on the board.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend

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
-- 
2.25.1



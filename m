Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4917.1608771806288831927
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 17:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EMtZvuDu;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: christopher.w.clark@gmail.com)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5798D38C143D
	for <meta-virtualization@yoctoproject.org>; Thu, 24 Dec 2020 01:03:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id f9so387797pfc.11
        for <meta-virtualization@yoctoproject.org>; Wed, 23 Dec 2020 17:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oUp+kXORZTTQSyScNub1WYtxAApg9r3MjxjGAGP1CTA=;
        b=EMtZvuDuRBQ6E2Fv/zgvZybDia/+JT3mPEDnxnVxgL6UPXMqcUAhJ/YH5ZLWjBOKzY
         9F0VxjtknvfeoAY+6NWqX+XOlkCKj/UaUlbHdCyAm1xUaTVAopbLB4RwEs8nugfNa23N
         4/jwKlydZA134ht+ZUj6Kb2e/shH1HoGxp8EqFbk3Ol224EAb8fwkdGaPDyi3wLU+9N+
         R/iqX0GgfiWkSgAZ+38lyz3xzN93C8kS0Bez3F9AC8/fNTvjIA/5UT30pc8le562dRvb
         ms/zCY3EOhxPv9KOOlz7jwsjHqRS2vnFjWC2zdufETqcQIHQ/OQ25W0YkZqPDa5Q7zlB
         e+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oUp+kXORZTTQSyScNub1WYtxAApg9r3MjxjGAGP1CTA=;
        b=MQJOOApP+RqA9I1QI+mOnr0N1fxdz/j15H0xSvr2kuAnTeKLOa4f6xjQTi6Gy5Vz1J
         TBI3Z3ix1L20LTGH+dbHYWeG7qHGFHwJ51f9dYbrfU2Klvcz5rU089CuuA/nJ2JkEsRu
         d8X7Xtr45SzGkymCbySb9F8ny1135rZ7AJO+7bzahiH2Hsh/Oc6978kMX1fAlbY4LX22
         MAwNndtkDoBj+kJg4MNV7OHF+7Jmf3x3wYcs/56uwN1CKk51tj5bLpbzD0skHazMxylZ
         QHDS6C6pfkrPmyCaIYZFNhVddAwVcFLjaFMETnv+h+Uy5adEGnLegcklgsNYjYFWDfhm
         01+g==
X-Gm-Message-State: AOAM532xaZScaOQa1hRd7G9E4ARck+4BGKswR2KJiteYnz8VLf8HM6yH
	jykS/eu19ObDfazNB5HgUNvR379aA7axaQ==
X-Google-Smtp-Source: ABdhPJy8GXi8W5EaC7ygICH5suHCmVKbFe3igyaIRIyQMfohIUXdj0trOqKleQhePT10gWxsUcOP6Q==
X-Received: by 2002:a63:4301:: with SMTP id q1mr3252941pga.430.1608771804553;
        Wed, 23 Dec 2020 17:03:24 -0800 (PST)
Received: from walnut.ice.pyrology.org ([2600:380:8045:497a:a192:9459:4a40:ed16])
        by smtp.gmail.com with ESMTPSA id 22sm705965pjw.19.2020.12.23.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 17:03:23 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com
Subject: [PATCH] xen, linux-yocto-dev, RPi4: weaker assign for KBRANCH and KMACHINE
Date: Wed, 23 Dec 2020 17:03:10 -0800
Message-Id: <20201224010310.13962-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

Switch to use ?= to set KBRANCH_raspberrypi4-64 to make it easier to
override elsewhere when needed for switching to a different kernel branch.
Also make the same change for KMACHINE_raspberrypi4-64 to match how it is
assigned in the meta-yocto-bsp layer.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
index 85d6feb..2a0416f 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -5,6 +5,6 @@ DEFAULT_CMDLINE := "${CMDLINE}"
 XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
 CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
 
-KBRANCH_raspberrypi4-64 = "standard/bcm-2xxx-rpi"
-KMACHINE_raspberrypi4-64 = "bcm-2xxx-rpi4"
+KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
+KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
 COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
-- 
2.17.1


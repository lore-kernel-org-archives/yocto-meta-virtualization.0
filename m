Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2471.1795643606768597563
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 13:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EYeYi0WL;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso3997858a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643606; x=1796248406; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXrerSuHaibtJGbeKyBclH4zhyOxzX7IygStJbbHQqM=;
        b=EYeYi0WLAagjrQyFheYgGz0/7n4fAdy0h+MZnQ6NKTA3eeOHoxtD4+l64LzjN2m9QJ
         kcof75m80b8Kg+zPgFOEErZ1kq36zAHHA8/JhYgUdBIxj9hgsR2kmo/mp6vl7VW2XigE
         1E/Yq70ccfK1NmKOucFHVnx/oab+1dX999AundPgscOrfgTL9bhCiVrEBNvxzf2nDn5t
         v7snDmhn5E3Yz43RyGO9bGn7pIf/JcQGcl1uptqOmZVmPuUGdPJoo8aqHT+3xZ/VqZx0
         5OqLdcumqtte0wHcKfKpit5uyIXFw+EP7UT8CIPZ+4qbTJrLSUkp4Ehojs5vgF8/nv2D
         mGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643606; x=1796248406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXrerSuHaibtJGbeKyBclH4zhyOxzX7IygStJbbHQqM=;
        b=VKVieGlV6DGFbW9bQjhU2VYbHXI4I2SaknBC4R6UlAzCTeg3didl2BLEqx/X46toCI
         HVtTUJKI0Ra4XGwXXg6NCpWxoRqRCRZkaIYKqBw3sSQozd4zXkizzuqfVF/mBlIth8qs
         /bRnyrQHwrJ52k1/Yn8tmBE5sdO2xebn04LD8BMK7lFP/eef2oZOTwJn4JqIEUN+T1yD
         Sf0EFJC7Y8qPJmXaKCR/vLMHy/P9mU7IcmBIjueHuUVIjvpdP6joqj6PmGs4dACrKbbn
         3t5VNj7uGx6gWi/4NjZN5YT1fg3FWX+M6HZI5DuWUS51ow5Q+5aoNPyK9BBxo20LxMiW
         HiHg==
X-Gm-Message-State: APuU4Z/UGUc7qM8BS3Znv7e7ANVom2mm3iII4s72kRnZi2wZOGz5UzGF
	oP77NisyvxnSEbdySBBWO3L3SWj4kxjEVs6c5uxK1Y84RcBMm0klsGV0R26FOYyO
X-Gm-Gg: AZFdTZdb2c6rxu1bXTv7msdYWmyIuPCgf0rHt/oGKnTrYp0yYY68nuRned1rpVMTCxz
	8HVMhHrCoNUKO9dJZIff22Q/SaaBr3eciA94Pw5EeJ7YjcLLGu+s5qDKAKZaWvdYvZa9bJdsgp4
	uv4w4hayK1OGrfimTVFSclllLIWuyAWW0CoS/+bb9t31ZUueNJ9M2/tzeWxrdQGVV85fnbH0Wl0
	WTm3ICLggKDshJ/1BLqzRi/krSLcWHBEFJIW8ZV/8Jtl61/6p2fH2lOKXTPrxDjKT3HQrYPBSJF
	dkLBgxmSVh+DjLBNkyJHjygtEwywyZ1zZETkyRry4AntaO1cNc8ShzubnTFZnjzGfr5BWJDydXd
	CyLr5eWZCHPYK9AHfLvhYb+OIziwcfcFyJv/ZOUCfus2fue1GY8xY9Wzq01iMyh0AeH2ivSPidN
	Zipu5rCN/znkWDYM/Jzj5te+j5IhNzXQiGIn36rscNElbWDmyidbOgLfe5qBrH11oKpGTslHSjy
	rIIhNyO0V+8A3oAsidncJZpoeorIbXm+0iZEWRWP5q2VD07ClUkXCzb44wl5GTD9X0CUFonMjWV
	63bGmK+KnDUp6CMjeDIBf7bYffM8QfyLHgMe3bokqxkfpGK9hE7NPJuLBosnEu8/Jy8ccA0ghzj
	05O9e2TRfd9oVmwduHZuxh+mr
X-Received: by 2002:a17:90b:2701:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b41c8d9224mr17885307a91.10.1795643606019;
        Wed, 25 Nov 2026 13:53:26 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm13834120a91.0.2026.11.25.13.53.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 13:53:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 2/2] xen-rpi-u-boot-scr: replace UBOOT_ARCH
Date: Wed, 25 Nov 2026 13:53:07 -0800
Message-ID: <20261125215307.73937-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125215307.73937-1-tim.orling@konsulko.com>
References: <20261125215307.73937-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 21:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10185
Content-Type: text/plain; charset="utf-8"

Since oe-core:
bdcd04bbc5 "kernel-arch: Drop UBOOT_ARCH", we should just use the
oe.kernel.map_uboot_arch(d) call directly. This was the only
reason for inheriting kernel-arch, so we can drop it.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index e25963ad..7e7b2f6a 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -19,10 +19,10 @@ do_compile() {
         -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
         "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
 
-    mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
+    mkimage -A ${@oe.kernel.map_uboot_arch(d)} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
 }
 
-inherit kernel-arch deploy nopackages
+inherit deploy nopackages
 
 S = "${UNPACKDIR}"
 
-- 
2.56.1


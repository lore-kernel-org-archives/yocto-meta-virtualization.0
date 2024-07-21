Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEC6C3DA5D
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 06:13:39 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.20567.1721542408248288842
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Jul 2024 23:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=spQgXcmM;
 spf=pass (domain: konsulko.com, ip: 209.85.161.44, mailfrom: tim.orling@konsulko.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ce74defe43so1726809eaf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Jul 2024 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1721542407; x=1722147207; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJxHAA/dYrsIq0PvADzmWq5nwThtEQXNBmYu3QzbwOA=;
        b=spQgXcmMr+RIvJqEE9CbSPaBHBJtub5RRjMDRqev0aplMGcm1vvKd0hV1wwvC0ZOpS
         o1IRROaQEyFbO8Nwpr28V1M1jrRodW4pVU6kT0voe9sC4RhxOLAiAvvDCw/znYPo275x
         Z+9TfC4+OyDq5OQndzPizV8S2wF3OrXA1W3c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721542407; x=1722147207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJxHAA/dYrsIq0PvADzmWq5nwThtEQXNBmYu3QzbwOA=;
        b=n7MHNs0s7R6NLsdoIzTNOKrCU5gwvayfMtQQiBJg/zX73keWqThTwmPNQJkHvo9oib
         f2s8Uqa6WeUAt194hLe+aEUkr01hO2zbkH2QpRkMEFqWsk4cvo7g3Waq4V31m5Jhhw3q
         OvqQRv4a718GCKlfFVijujvUmnYmmeS7kONd4dfPKvUWtqEBPM8TO2zmnKL5W5AWvfFQ
         0hZyy3xFj2x0S6vGYQI3HwYlG0O2qSBF5mQkBwCtFyXCJ7rqgJa7CSzv7NOaxPUt1Tpi
         9U1vvnZOnHiszxLJrhZRljjDAbIA7MSq+OfeuUJuI9SABLEyf7T/MtdZpwwC8Z54Dhjg
         bbIw==
X-Gm-Message-State: AOJu0YzghXoAtEweQee+yVqbn0HJ6kb9eq2pLiU7ixs5o/UFgcwI6G/9
	ygMK9Elz8ErBMbWnh7TZtXcWpo6e70bmiHLo7Zpjm8YaWI6yhL+jhW182hZK3b2636+230RLWWZ
	8FQY=
X-Google-Smtp-Source: AGHT+IELxSgEnWMtKQnP+F+YDWw8aXOW8pLmDDlGEAGQ8UYPZ/6f4TNpLmfF2H/7PVC3wu3E9EbX4g==
X-Received: by 2002:a05:6358:3a0f:b0:1ab:86f1:25bb with SMTP id e5c5f4694b2df-1acc5c8041fmr451003355d.27.1721542406737;
        Sat, 20 Jul 2024 23:13:26 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0a3debc1sm2762194a12.7.2024.07.20.23.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 23:13:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR -> UNPACKDIR transition
Date: Sat, 20 Jul 2024 23:12:55 -0700
Message-ID: <20240721061254.3674810-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Jul 2024 06:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8837

From: Tim Orling <tim.orling@konsulko.com>

Borrowed from Leon Anavi <leon.anavi@konsulko.com>
meta-raspberrypi: commit 434ed33c90b7659152b1e8d7c2d4d785db85105f

and from Martin Jansa <martin.jansa@gmail.com>
meta-raspberrypi: commit c39c2b165e68388767f54dc86acf4595a33ee1e1

This adapts to the oe-core rework to enforce a separate directory
for unpacking local sources (UNPACKDIR) instead of directly using
WORKDIR.

Follows the preliminary guideline from:
https://lists.openembedded.org/g/openembedded-architecture/message/2007

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index 87619d01..3f83c7f8 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -17,13 +17,16 @@ do_compile() {
         -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
         -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
         -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
-        "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
+        "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
 
     mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
 }
 
 inherit kernel-arch deploy nopackages
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_deploy() {
     install -d ${DEPLOYDIR}
     install -m 0644 boot.scr ${DEPLOYDIR}
-- 
2.45.2



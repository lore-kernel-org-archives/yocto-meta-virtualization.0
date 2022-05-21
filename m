Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9083BC46467
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.8842.1653159895532352928
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHrRPt0u;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m12so9876060plb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aehRls5w0b4FrTLSX7Rx7gwrcqNN2yR2DXcTXggZIUw=;
        b=QHrRPt0uNLHG2iv+U4mlC8HFq8MyfWDIOW4S+g9cO3/GPDXw1EXwQN/BXmeygCRBjq
         P6RHxwA4KAO9M+pMHOW/cR1cQWLG1z/6sIVFWBng4lbJCCTwDMk8Qsm5fGVw4W+h9w41
         vqm7CsCsQMXpKYkbpGhxjL7gLr+x8qHSPw0rhZTZqCLOFmTwxbfC5RJjZxSNV4ooL8TZ
         g3f2j64ZsZBgjLOiCm25DpeNqty5jQtK2EIJ64U6udW4vBifhlKxIab+DzPpx4xbnFI6
         H+Q80x81Qttvj3RDRmmALo5HPVk3V9aHUKSN8QNZyvtGITUAs+BYQV3g/3zLH67YOLRp
         1BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aehRls5w0b4FrTLSX7Rx7gwrcqNN2yR2DXcTXggZIUw=;
        b=I0LUjYqz6D11bQqEtPoLACF5dDVVZGVzr1RzAJgRLQqHDsiBTT/NlwaZ0VGgRtvyDO
         BIOmVpFfSox5AdIQcuZPXhp8Whi+HoYYH7Y/nq/pn5bwPRTZO4e5jL6qTzu312LjX5cR
         unDpUVIq0mJ9xZjdhm5rJzVomI4YiW++qdvrRc3yphqbgT7sGw/jL3OPukytsgaP1vtw
         meEIAZUBgUMRQSTPdnHC9T2ukOFW5SaiDYDiDhoATQQZLRDu8f4p0NUuOEcXCISuy3VU
         2OwkPGQ92kGVpM6SaAjFmThxQY0u8dHRDs9zE7Z3nkjIfwksAzJHYFtrtVdZrTUaKDrM
         gIrw==
X-Gm-Message-State: AOAM531TmzveJDxTXMMMrlYPYVwaOKKEAvGCghNYAC3oSDOdW+mhyQ2h
	TlsEZN0BWsWKHF13KIri46ivfYaNuFI=
X-Google-Smtp-Source: 
 ABdhPJzU7mh50T/DSyOqlAqhJTff/l+xdh2N/6z58NCc9j/4l0KcPKuf166ZnoLOnzdSae9/2LILIA==
X-Received: by 2002:a17:902:e2d2:b0:161:a6d8:3a0e with SMTP id
 l18-20020a170902e2d200b00161a6d83a0emr15032079plc.79.1653159894845;
        Sat, 21 May 2022 12:04:54 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:54 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][gatesgarth][PATCH 1/3] linux-yocto-dev,
 raspberrypi: apply fixed revision to kernel
Date: Sat, 21 May 2022 12:04:37 -0700
Message-Id: <20220521190447.135705-2-christopher.w.clark@gmail.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7299

The default preferred Linux kernel for Xen on the Raspberry Pi 4
board in this branch is linux-yocto-dev, which unfortunately results
in a branch tracking configuration rather than a fixed revision.

Apply a specified revision from the 5.10/standard/bcm-2xxx-rpi
branch, per the kernel version for this release, and disable tracking.
Revision is the current tip of v5.10/standard/bcm-2xxx-rpi branch,
tested and verified working on the board.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
index 85d6feb..9f5677f 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -5,6 +5,12 @@ DEFAULT_CMDLINE := "${CMDLINE}"
 XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
 CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
 
-KBRANCH_raspberrypi4-64 = "standard/bcm-2xxx-rpi"
+KBRANCH_raspberrypi4-64 = "v5.10/standard/bcm-2xxx-rpi"
 KMACHINE_raspberrypi4-64 = "bcm-2xxx-rpi4"
 COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+
+# Tip of v5.10/standard/bcm-2xxx-rpi
+SRCREV_machine_raspberrypi4-64 = "d172dd50154d2849e87d8acdedd073cf36ebde0b"
+
+# Tip of master:
+SRCREV_meta_raspberrypi4-64 = "942a3a2cc192a8b2e38a7fef4a40249c79f5c9f5"
-- 
2.25.1



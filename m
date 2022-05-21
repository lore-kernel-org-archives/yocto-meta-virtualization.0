Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE5C43219
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.8688.1653159897648556760
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GqsLiX9W;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c14so10362327pfn.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8ScAK+5KQdoMz/zcy1OanNmZYfaERFlOMEKOv2pFo8=;
        b=GqsLiX9WEN6nCdLB3NpTp6le2khOgwhErduUSokNmGyWeYwSl0z0zw0euR9u7Z2Xiu
         N5qWDyJx/iJpuwaJOqkiDgCrIYnXLptptbikFzknq9CgusOmH3Ko6AzO4fuvciRD3F2b
         h90+yy3/IFK18o3w0ZQSfFMVV2SjR/+3DHp8ARTc5hbye/cM+1+cn3UDqJjbjPbTK+cr
         Sug1kMVyHvEny9u5tmMLJZ8ur/QHIszhWUEFCuRAPrRd1CJ2/SSHuOm56py94q6j8faI
         n2fr5FTTwp1p4orhzgYYeoeA2Jjz7UetvgC1j83RP+9PErLtt3PtwQ1boquO2Bi2BjUq
         ViZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8ScAK+5KQdoMz/zcy1OanNmZYfaERFlOMEKOv2pFo8=;
        b=PiqnYK/WY9X3zJiD+06Wu0ezETLrPvue1QtqOnl8G+Wvk1aUGfnvoaapM8mJYzcDnu
         QjvMrBdQrGfaas4mSX1gmsOr9OprkqSmNfn51Wwi8r6QgxpI9s4/0xAPcHBcbG4sVDhX
         IBEUsYJCXIcGfs8tsOdRXwzyfr14EUC3++Lvu/zs6ncG+Kuie+CBNp1aKkT1hk9kjujw
         lfGNvHgeNvdr/aDKe3+r76bTJblxrUt3Rx9IbOX3ipq/YtfKsjCm6dJvNn3WCoaSPmMQ
         S8Jgq3KZC9nQ2qp9IhKLXptlJztSbh7UIHACt332bCVDIBfqh0SiugNGIo192nq7spYG
         e3eQ==
X-Gm-Message-State: AOAM5303UL2JZIMSd0NAkddI6/W9h9tqKfPVhThCg63Zz6TyXT4Iw46/
	Uf5XrxUG/Rdia9SpKKXFoFMqNSUFO+U=
X-Google-Smtp-Source: 
 ABdhPJxuj97GSXwpIVpi55myoj1dYql9p/35diGbKPpWwpVDKlWtwctePA7GAoWl9lOfpod2+L8Aeg==
X-Received: by 2002:a63:7d3:0:b0:3f6:885:cd22 with SMTP id
 202-20020a6307d3000000b003f60885cd22mr13901286pgh.143.1653159896967;
        Sat, 21 May 2022 12:04:56 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:56 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][hardknott][PATCH 1/3] linux-yocto-dev,
 raspberrypi: apply fixed revision to kernel
Date: Sat, 21 May 2022 12:04:40 -0700
Message-Id: <20220521190447.135705-5-christopher.w.clark@gmail.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7302

The default preferred Linux kernel for Xen on the Raspberry Pi 4
board in this branch is linux-yocto-dev, which unfortunately results
in a branch tracking configuration rather than a fixed revision.

Apply a specified revision from the 5.12/standard/bcm-2xxx-rpi
branch, per the kernel version for this release, and disable tracking.
Revision is the current tip of v5.12/standard/bcm-2xxx-rpi branch,
tested and verified working on the board.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
index 2a0416f..91558b3 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -5,6 +5,12 @@ DEFAULT_CMDLINE := "${CMDLINE}"
 XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
 CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
 
-KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
+KBRANCH_raspberrypi4-64 ?= "v5.12/standard/bcm-2xxx-rpi"
 KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
 COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+
+# Tip of v5.12/standard/bcm-2xxx-rpi
+SRCREV_machine_raspberrypi4-64 = "f48ad8b95fdcc48a3defe5d085cfd8c5390826b8"
+
+# Tip of master:
+SRCREV_meta_raspberrypi4-64 = "942a3a2cc192a8b2e38a7fef4a40249c79f5c9f5"
-- 
2.25.1



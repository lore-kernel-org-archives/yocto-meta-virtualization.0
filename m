Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0147C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:27:12 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.17434.1685219231060056939
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 13:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g1M7m1WU;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso1611361b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685219230; x=1687811230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aQMSZhGXezIERU9AC+4mg/TBeTK3R3LzJgYabXo6eVU=;
        b=g1M7m1WUEsPBUqilrFgctnRhPbRIQ7LJ5P1qJkq74oy3hQVcavQPdpw+Agrv4EbV5u
         KHlTRlC/ODc5/oFC6GHLxH58NaAG/S2CmuqY+mqF+ZKaVux9JlDOx4FlPOaPEJ+FTSiZ
         VMLRjJb0mlyJyKYHCflLq3zb81N+BQsQ0iiOwFMIfp2hm5dESc9qWW2eiphzY2Q/kxjl
         eO+VAh5D3bSrGBDRTo2ft0FOvP0cIc6kiMWg+L1Iy1mVaX/96J53Q0crdLKhpqlpwutt
         DX5pTxGnjLAbZhSfHGGYX64aHgFe1aGYVwiTV6L8wsr+DTwXUl9Pkyo34l6XJIs58Apj
         aV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685219230; x=1687811230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQMSZhGXezIERU9AC+4mg/TBeTK3R3LzJgYabXo6eVU=;
        b=GdO2rScsh9kAPSDPZxte5QLO/9SPZzkcSXy+zU3zi5MiKBoAjqU9JE8gcWmwj1rNu7
         edNCqH5VSXGI5G7RscxpLnVoj1sXFz9H4yQZfjNmsP0Sxj9SBuzcBI2mT/4e7k3LUPi/
         FEa3fQdTN6wLwWHRexrOuQySOq6K8+ne4eXHRlnzD2PltHFoN7njrzab9CpZ3Zf/212O
         eCoR66hOtoMf07YcBC/xc3aFbw0Xd1OzeVASmiYbI0FgkkbAqmzLqEZ4yj5HPEQRwC5L
         OC/SshBaIDvufP5V1nH7yqbXMZD8Nffz8YzZ571Z9lJ7uqBb+F2gPfR3nDnQXwTmbJpH
         Eaew==
X-Gm-Message-State: AC+VfDyA0x0l52K/MSlenvHtPuIbZkERbfF1qNhekfPDXO0TrJg1V6nI
	GST1JQLLc9uEqO9ITXbcRZZiByFhyM4=
X-Google-Smtp-Source: ACHHUZ69vXgxyekG/kN4JRcgeAK78afCisBncmcl0v7Z/8IDVlF8YFsAneKwAFfEjK7d1uv1p2Z7eg==
X-Received: by 2002:a05:6a20:5486:b0:10b:6698:769d with SMTP id i6-20020a056a20548600b0010b6698769dmr4336438pzk.11.1685219229679;
        Sat, 27 May 2023 13:27:09 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id t13-20020a6549cd000000b0051b9e82d6d6sm4141418pgs.40.2023.05.27.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 13:27:09 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4
Date: Sat, 27 May 2023 13:27:06 -0700
Message-Id: <20230527202706.1233092-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 20:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8078

Added to the raspberrypi dynamic layer for use with Xen as
the default preference for Linux kernel.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.1.bbappend           | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend
new file mode 100644
index 0000000..dd7edea
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend
@@ -0,0 +1,6 @@
+# Enable use of the linux-yocto kernel for the Raspberry Pi 4
+KBRANCH:raspberrypi4-64 ?= "v6.1/standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
-- 
2.25.1



Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E9AC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 08:25:24 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.8406.1660292720282484369
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 01:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IFnVkClR;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id s11so425738edd.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nEBprr2CQKVDAYy4/OUitlM2bOrklKSQcM8oxfTp6dE=;
        b=IFnVkClRylfEvgKJtIUi9JQ8bZ3Ns/d7gEN9P06tl/F3ucPSB6TLuuQRuDbHXilkjg
         4ki2bbrtUs8kJbzmc/SSHfFnS9UwtccdC8R9MD9nafCmex/0OOclpaduLiOOR7XxFger
         YC8lALmQhXN9KTxQoucZp/odGq5OVxyoGO2eeND+XCekSMgSonH4VW/+r1B2Y3YKJXpo
         0B/r7eXhmXihSlMCqbedmRskvXWeKW+W+xp5oDRNm3EgHt2NuzbCBH7pQZS+Q5CwHqXJ
         semXM1CrI05YolmT7HAZXRtD0M69PQHpT7p+c4EbPH/2K1nXJ0YynBWMt00QyIfGpLSq
         SRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nEBprr2CQKVDAYy4/OUitlM2bOrklKSQcM8oxfTp6dE=;
        b=7nLRXe/Tl7LW0n0l8HZblDVWHF+PHSyRYdzVIi8K/ldrYX9Wrsawc0qLmESCmy3jAR
         mkKOY/WWYX3mpX0zoouqEAZvf0JJBUyS3SwI41w0vUSzhEZsWs1IbtyIn6/M3Y3Q0Q79
         C3M/UyBU8CwBBwiYozBxUDgMu54Nv06UETcnHeK5mxEYpGIVtDbEtiECOQlOoR/YoQUO
         EPv0/9y6nhFfvxyHbAvycXxwCywr4upOakO3XJQtOhFnsQjHE+Sx7Z/vp7MmCneNI7aR
         QY9EtxpOIWLgR3dZpA3gi6QthhJ84W3fCTEz5PPJsjFH+CUcOS2MCrcnAF9MtWtLeNtg
         mlow==
X-Gm-Message-State: ACgBeo3tb7w0NXSnS8/ErY/9VP5cQAnMAq1m0yUxwaqM1akB2USbcAs+
	K6LCteSKxcHHnhww7jPRCII7llnqI6k=
X-Google-Smtp-Source: 
 AA6agR5XW0z5Ch8nuVqaiAgaK21ADw+IgwmLMqGqmvkfJeVdrmZJht4CRK4+YVBZfd0HVoNlnFPCVg==
X-Received: by 2002:a50:ff13:0:b0:43e:76d3:63e1 with SMTP id
 a19-20020a50ff13000000b0043e76d363e1mr2532773edu.271.1660292718731;
        Fri, 12 Aug 2022 01:25:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a170906341500b00730cc173c6asm544190ejb.43.2022.08.12.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:25:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] dynamic-layers/raspberrypi: drop linux-yocto 5.10 bbappend
Date: Fri, 12 Aug 2022 10:24:35 +0200
Message-Id: <20220812082435.99083-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Aug 2022 08:25:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7520

* the inc file was dropped in:
  58f5ac6 kernel: drop 5.10 .inc
  but this .bbappend still causes parsing error, because 5.10 recipes
  were removed from oe-core
---
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
deleted file mode 100644
index f279ef7..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
-KBRANCH:raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
-KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
-COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
-
-require linux-yocto_xen-rpi.inc
-- 
2.35.1



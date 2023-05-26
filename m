Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BAAC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 17:36:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.251.1685122606204499593
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 May 2023 10:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KMl0HbU8;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so7632885e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 May 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685122604; x=1687714604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ00DSanXNsnGGAj5sm9tJiHvWwmVpprRKGvjz4koec=;
        b=KMl0HbU8WyJnJyvcY2iUssC2qPyVtNHAd06R/ZybjwmSNqpUYt4WJXLRDEDQInWgjp
         RLyqVBsISx/i6RpOFo6K0wASzq1cDvhs5u28D17tpsVf8M3VJPDTcvqrtsPNfOdp1tfO
         7RxcWfNWkkXtgA18B0bG8x3TNUpSTAovdDfI3ztTs/aBRJOhoUIGVVj1qavZ4Qkg3JVU
         U1NPTZh96IwSzyGRmT9Vj50j7WREI9eyc8vc8gGs8fu29XZNBQzJpb/d91Yv868FY98K
         sV+QIzcmXD4eJk9tO8xR0Dh6W93duPYMoV17QX9ljHAgm713/WlpLATQbfshaq0qX7Pl
         kfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685122604; x=1687714604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ00DSanXNsnGGAj5sm9tJiHvWwmVpprRKGvjz4koec=;
        b=hxoA17i5xChJhlby89zI0qi8iSwvMSIj6It1Ukjyjk+rbrTqsl9+7OO+SoalkcU/7p
         uIohZAJQKMomIKszfhwtvztw+xJo/Wli/g5Y0Y0d6mEox34btMF+Qylmr3Jc+mNaXjeQ
         Ro5ptvN8U7vikyTgAAM6N2gqdAKIPEA4wRsfUhnYeflgoP4+TyrrI6Nb61vjsPUFdOj2
         uPR4RawoSzadOosGP1aImzZ+e8JaNmUIGY2XIQF4UyFKpeYRhI75vOG8HDA12qJ52Xwk
         aTA/Y1dj4GnkCVDnXBrJ9pg1i7rclg7vmMfRzeeQpF7a0zGO7K9OlzQdLI//ttKXDn8X
         vDLA==
X-Gm-Message-State: AC+VfDxkEPwdt3NHYBzGdPVDFoS2maxVBotWkbR+fBkcotDVdjswJ9Cx
	xcnalMCkjYXwylxemJ3X7PAeJAsFzsU=
X-Google-Smtp-Source: ACHHUZ6owVbox6NxRcfO6mTnAnEqjUvQXDR1LJ2BbFs+9bphOj8W5lZPsWLGLc7kJrk28QJtEAmFwg==
X-Received: by 2002:a7b:c448:0:b0:3f6:4cfc:79cb with SMTP id l8-20020a7bc448000000b003f64cfc79cbmr1935945wmi.31.1685122604437;
        Fri, 26 May 2023 10:36:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b00306299be5a2sm5706779wrs.72.2023.05.26.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:36:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] rpi: linux-yocto: drop 5.15 bbappend
Date: Fri, 26 May 2023 19:36:36 +0200
Message-Id: <20230526173636.3039823-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 May 2023 17:36:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8076

* 5.15 recipe was dropped from oe-core in:
  https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=e30b37776d16cfd4ce7f79746427ccd95b306059
---
 .../recipes-kernel/linux/linux-yocto_5.15.bbappend          | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
deleted file mode 100644
index 572f7ec..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4
-KBRANCH:raspberrypi4-64 ?= "v5.15/standard/bcm-2xxx-rpi"
-KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
-COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
-
-require linux-yocto_xen-rpi.inc
-- 
2.40.1



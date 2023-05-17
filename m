Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3905CC77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 03:33:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.41531.1684294419908093371
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 May 2023 20:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RbtCEd+W;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1aaff9c93a5so2880835ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 May 2023 20:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684294419; x=1686886419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eNrbMd+d/Zgc4umltyABl3amBzmX6ugnNQF7rDhp8Gc=;
        b=RbtCEd+WcFIpsYxu2VrgXxwhRSXt96JkRPbWL9xUuvK4VtyYOaOn9/sqyDVWKRfgKu
         gyjiJc8ovUr1a78PE5orJy/8o+b17IpzbOGKNIJ17McYvtwMcVmJgR8gB9BuRnJubpRa
         tZUa8gvW531YrYjD14w+ainl56Jw3oJ3umTng2YDsXBt4rmiHqU5J3px9mswTbAVHuaB
         hmcZBvBpPNg8rhGyhXWv3Azm7L92awn7pYWJ7DSWXWPuL7g79iURsQJWc5rfvl6LfM4c
         ENSeSwwIrT4C0nvwC4Ee7+mcmaSsfMyHZDpz5B7ofYI6ylzEA79wtLaQm4sOfqJUhBS5
         u4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684294419; x=1686886419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNrbMd+d/Zgc4umltyABl3amBzmX6ugnNQF7rDhp8Gc=;
        b=GBQTaNQnju2k8VPfWcM4cNsX5+Sfys2EZTgyLREJhjL3/vDd5EKkiaQheR3W7v6Sbp
         WpGO00q7KTvqHzk1EuQoXjBd+xV0tHcbaKJ3N0rDvzu1Qyq2tYyKsImTcrwwjbfTtQe5
         JlJ/mQorU2YYXPCqinLNgMrO5gh6EwqnB1Rr5CuxT4tJnFVPxOttyi/I0DUDukxrCOIo
         Cyk0GXJi2r3Qv3FipOjYxBCK3DNc/+3YPE/y6eoEu3XdiJirom3bEPvsLK4itamtSYMZ
         LCcAJQ7nBZtk5qHTUZFNXlUt5OLoAorNfdTBM1cCrfQl+FJRJWfKLHE2kwEJN8CBz9kY
         pdOw==
X-Gm-Message-State: AC+VfDywMHSvTyLyE8fSEhD06/4tqua4wPza4m7FQ+IWIjfhS/n3Likb
	Q9fWKnp0vxl1PNjIobQqJ0jLUlINXOA=
X-Google-Smtp-Source: ACHHUZ5SIZlfOKRacjzEMzbnDJdplTGRs2hyRbKu68vfYgCjJqmPslK9zGM4syUMDYC87HLly6CyCA==
X-Received: by 2002:a17:902:c945:b0:1a9:546c:1593 with SMTP id i5-20020a170902c94500b001a9546c1593mr50812480pla.14.1684294418877;
        Tue, 16 May 2023 20:33:38 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001a6f7744a27sm16332827plg.87.2023.05.16.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:33:38 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] xtf: Supply DEBUG_PREFIX_MAP to the compiler flags
Date: Tue, 16 May 2023 20:33:31 -0700
Message-Id: <20230517033331.3565724-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 03:33:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8059

Fixes the QA warnings about package contains reference to TMPDIR.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xtf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
index 537abc3..59f1cad 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -30,7 +30,7 @@ RDEPENDS:${PN} = " \
     "
 
 do_compile() {
-    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
+    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" \
                CPP="${CPP}" \
                LD="${LD}" \
                OBJCOPY="${OBJCOPY}" \
-- 
2.25.1



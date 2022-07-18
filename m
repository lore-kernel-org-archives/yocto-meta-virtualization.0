Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3126AC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 23:15:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.34556.1658186151822113199
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 16:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g2SrN0r6;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id z1so10404242plb.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bi8Nllm0VJjI9mxKwR8gBrDZ/9oNK253ZUGG/SUv920=;
        b=g2SrN0r6AfX/nKRKu1fT30daMBnxIUlLtWS9Z/iQ8JIoxk/MXBna3V8m40G3+SY/Mf
         ip0+cHbm7RrbkClCQO9BG8NjXZx/X+p2c0nec81GPU908RL7f6EAb+CKPGjqJCGD5bfz
         XT+VYeXXbaXIh6ftKO8EQ3+QCE66T36S+N3On6mDBGluD9D5AhQleDme4c1OAFrXQyGq
         GimltwsBR+Z+puSWe0bPUjAd4U2rPAG/QX+7qXFMdb6bdagXj6dsUuoymVhbiVWk5S18
         uSrAiAbRKcXy5rjDIAtMu0G/5um1r5OQ2IIf+fitisyhSTZR/hC06aO6vJtBaoaZfCP7
         vnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bi8Nllm0VJjI9mxKwR8gBrDZ/9oNK253ZUGG/SUv920=;
        b=rqPlbp5W5kCoE+zvWpWNDyAOr+niAkGfXQleu04DCCx9FCX/OTgxpyrD5bDKdmfntx
         gFECzMj610kPHNh7NtJbGcXwthSPLJBG5RyMY27BaRGh6Mda/iO9KlY9g91dXNIpxywd
         v+oNnMbwIA5QDpCrMssMyll+chwguXgb73Njl98g16nWAmYzmNRzkgdVNksCnHmv9nPa
         FF5IuxDRwL28QWuLyt9hIAXDGr8lqHQzBmODek1ylDSFnD36HJSpJ7V59Vma85Ze4+Vi
         7KJBkECSCdraIcYwZ2BUmRN7gRXNDe/2aL7/7KH6yTVJFqj6/UipzwexVYgAIJLgXwj3
         6cKg==
X-Gm-Message-State: AJIora++iii923ilNjXJmFgD1yghjiRWe5Ws+hmQvsBbALJXRHUyfO0Y
	IeWT2/SYNS/QrusPsR0354gtJGXVJn4=
X-Google-Smtp-Source: 
 AGRyM1vOG/5xYTxy4ju62QFJVb2Qvah4hnKuHgDjKgsZOqvOm6q6YUTif/Ar4c+CCNDfqf2BcAXXwA==
X-Received: by 2002:a17:902:ea03:b0:16c:b3e8:b494 with SMTP id
 s3-20020a170902ea0300b0016cb3e8b494mr10727024plg.95.1658186151068;
        Mon, 18 Jul 2022 16:15:51 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 t11-20020a1709027fcb00b0016cb873fe6fsm9381976plb.183.2022.07.18.16.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 16:15:50 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH] xen-image-minimal: reduce the x86 wic
 build dependencies
Date: Mon, 18 Jul 2022 16:15:47 -0700
Message-Id: <20220718231547.4571-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Jul 2022 23:15:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7469

The Xen image recipe provides a default WKS_FILE for x86 builds to enable
booting the image either in qemu or directly on hardware. Add settings
for WKS_FILE_DEFAULT_DEPENDS that specify the wic image build
dependencies, which are lower than the defaults used without it.

This change reduces the amount of build resources required for CI of
this image and images that are derived from it.

Since WKS_FILE is specified separately for x86-64 and qemux86-64
overrides, do the same for WKS_FILE_DEFAULT_DEPENDS, even though the
dependencies for the two separate WKS_FILEs are currently the same.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index a8e72d1..ec0f2f5 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -79,7 +79,9 @@ build_syslinux_cfg () {
 
 # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
 WKS_FILE:x86-64 = "directdisk-xen.wks"
+WKS_FILE_DEPENDS_DEFAULT:x86-64 = "syslinux-native"
 WKS_FILE:qemux86-64 = "qemuboot-xen-x86-64.wks"
+WKS_FILE_DEPENDS_DEFAULT:qemux86-64 = "syslinux-native"
 QB_MEM ?= "-m 400"
 QB_DEFAULT_KERNEL ?= "none"
 QB_DEFAULT_FSTYPE ?= "wic"
-- 
2.25.1



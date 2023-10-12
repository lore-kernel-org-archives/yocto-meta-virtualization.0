Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA14CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 16:52:03 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.17314.1697129520386021085
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 09:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MnsbL1Vp;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c4fc2ce697so803180a34.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697129519; x=1697734319; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgAK8Tg4H8D3+nxqCsx/RnB6saf1ZInMeSsdrVFTzAI=;
        b=MnsbL1Vp+QdSD6xZcv7JhAR+iUsWe0gtmV1hWeiuMkaZkH5fCUlKMtIWdF29aT9AVV
         3mFpRUPS+C55x/ugJiSRfm2VqO1Y79S8QKzigppHZRULLVM3GAC5hldutIb3iv6vwXOu
         tEoigsjl29GfsszhPf0RybuHvnjmlpCY5WRXY8FxOSP6qk6nGMJX51qz9dVVk9g9BE3K
         FAsa0+9bWcbq8Z8EHscLbf4TO13+4M2G7uIRyW1CqpSGEMhANyaVFamj8R2kfBnVoS9x
         /L+PpOOuMlMFOGRgB9dfk5VOzG/5uWa29bRWS3WuBjNPJgOckgiBGTxHUuNkjLKIpBXU
         e9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697129519; x=1697734319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgAK8Tg4H8D3+nxqCsx/RnB6saf1ZInMeSsdrVFTzAI=;
        b=b/N9C1eaVVm/UMHJKjMhj/8CrGhesikHFS/VrH16a6Ys+yU8Y6a36s/qDjXL75KQ9J
         OZpB15X3+kZEbleQVx44L7waDBFVM7jWrGT2xw82m7ltgHfs/TWMP6xh4BuATVPB3VLn
         sTtWQ0rQd1izFrz8EohIfN03KvwQUv1jjKw81G8WhlOS1XZILJPBGOixYbV32vSy0D9Q
         /iI2H1OtElltxBFOCJVpnaDa8+9zh/EpFHeidMecXcfOOZYGr7eDnpixRzgIKmumADPn
         G72KsI10BdsMohu/Qb5A//utbotVyuhIekTN04/WHm27G9ugrKbt1R6DsiK6DOQgeG+Z
         20mQ==
X-Gm-Message-State: AOJu0YypRue0dbDtrzrBhby/JwivfvAdk/JFAhPelA2sJIOTCWMjehSh
	T/D2F5LL5t2pz2qK/xsYzzfEg93+uJQ=
X-Google-Smtp-Source: AGHT+IHnMIwYoP+xqBcuuLWM4naugN1XTLtXI/wcUjGj9nZWsaMhE4nxbRwSrCtgi6q3twBVbnuoIQ==
X-Received: by 2002:a05:6830:1459:b0:6b9:3f64:4e8c with SMTP id w25-20020a056830145900b006b93f644e8cmr27798314otp.9.1697129519072;
        Thu, 12 Oct 2023 09:51:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8282])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d6acf000000b006b92509e76esm362710otq.32.2023.10.12.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:51:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
Date: Thu, 12 Oct 2023 10:51:56 -0600
Message-Id: <20231012165156.357269-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 16:52:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8353

The "entrypoint arguments" (command) is allowed to be a list of
arguments to pass to the entrypoint. However, the current
OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In order to
maintain backward compatibility, a new variable has to be introduced to
that can be split into the multiple arguments required

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 3 +++
 classes/image-oci.bbclass   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 6c7f244..da93570 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
     if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
 	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
     fi
+    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
+	umoci config --image $image_name:${OCI_IMAGE_TAG} ${@" ".join("--config.cmd %s" % s for s in d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").split())}
+    fi
     umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMAGE_AUTHOR_EMAIL}
 
     # make a tar version of the image direcotry
diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 9ddb88b..68045ad 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?= "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE
 
 OCI_IMAGE_ENTRYPOINT ?= "sh"
 OCI_IMAGE_ENTRYPOINT_ARGS ?= ""
+OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=""
 OCI_IMAGE_WORKINGDIR ?= ""
 OCI_IMAGE_STOPSIGNAL ?= ""
 
-- 
2.34.1



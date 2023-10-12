Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2340ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 16:25:53 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.16549.1697127952547216239
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 09:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJ8ppJTN;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c7b3adbeb6so794458a34.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127951; x=1697732751; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKwgB4tBwMyux0YX4yR+UngpzRCfuw+0mB/2ML6Cs/I=;
        b=hJ8ppJTN0dBNTn+KNkj7cC5YSR3hvfBtEGYASWvGR4RENIvtw2Dhlyh7IR6UFaI3Ep
         Gn+7rPmBG8/OabUBm4WcXnygoNd5NBE0Kly/AFy+n+BoaxVAaa0fXEV8vwUabY1JuKs0
         0eh9Uef5BQNyc2wNb7vo7SpWNVP9PfsuAecCCx4oULw4HKAE+H7cNrRvRUSfdrBw6UC7
         otyslCqb9ephOYYGEqF2pwpLzte9daEqQwpB3UJmODznk9UK8oYVsm4KBc+6XWBttRUF
         5DWTp9qLoRljHaAweO/1Y2uztpzSax0a+75Vs9H6BkuKz6cAqBJVS8L9MmkPT/IdKKCK
         IfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127951; x=1697732751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKwgB4tBwMyux0YX4yR+UngpzRCfuw+0mB/2ML6Cs/I=;
        b=e1pCiq4xztSj30+w5uxllB3Gd7wXiySrBoFbHCbCCqx/yMMheXCqxXfZO9I/B6pCma
         KqEOq2TERe+ggozkUgdBcm0Hkc9jhE/N13ZwXNg1h4HSasDAuR1QNV7dZoJ9eJzG6QwA
         iuUd0SjteVHtXP76a7LBTlfdB4fsR4YyhGUrOERT3dN82q9jZzASD81GMAIlPzcUwpyd
         DdGGJMN6nGjGhIoqN5s88CMnQdBPOyOlBeDGxLuKQDJ5XCGcup2u8aLsAyDBHWqT3yGX
         IUiUTld/s6u3iIPZGSCWRPPxvCsmVO25ZeM4szMZnPhwgnfQJ7I09ocTfaN6npoPB6+H
         44qA==
X-Gm-Message-State: AOJu0Yy1H01lwTxW7hWg9gt54uBd/pIbYMRxbAtg3IhqLT3iv+Zelo+J
	xP4ovJizq6cUR0T8UaOVj0qIicUqWA0=
X-Google-Smtp-Source: AGHT+IGf+cyWfxsmWsG73U302lCk6MOe2DAPARZMmFVCHFCVr8pX+HbNQvg8n1xml1mPTfEdmsl3DA==
X-Received: by 2002:a9d:6194:0:b0:6b5:ee8f:73af with SMTP id g20-20020a9d6194000000b006b5ee8f73afmr28372219otk.5.1697127951092;
        Thu, 12 Oct 2023 09:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8282])
        by smtp.gmail.com with ESMTPSA id p26-20020a056830131a00b006b87f593877sm353297otq.37.2023.10.12.09.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:25:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci-umoci: Handle mutliple entrypoint arguments
Date: Thu, 12 Oct 2023 10:25:48 -0600
Message-Id: <20231012162548.329780-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 16:25:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8352

The entrypoint to a container is actually an array of the command with
arguments to run, not just as single scalar. To handle this in umoci,
the --config.entrypoint is passed multiple times in a single invocation,
so implement that in the image class

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..6c7f244 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -99,7 +99,7 @@ IMAGE_CMD:oci() {
 	bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but umoci does not"
 	bbnote "     expose variants. use sloci instead if this is important"
     fi
-    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
+    umoci config --image $image_name:${OCI_IMAGE_TAG} ${@" ".join("--config.entrypoint %s" % s for s in d.getVar("OCI_IMAGE_ENTRYPOINT").split())}
     if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
 	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
     fi
-- 
2.34.1



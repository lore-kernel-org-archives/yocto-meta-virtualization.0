Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44664C54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:41:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.82232.1674758511543501987
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oim+xF7t;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m7so2702961wru.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Mp0rGWZA1Byh4pzWXzczo1JE7IdDXYZCj6xhLEEYgw=;
        b=Oim+xF7t8/U7pKDZH82C8mTgKGERWPKhJVGa1/wrFN0CGsMMF4jE4GmIJghYtfojXm
         hzkZ6i8lMDLQSbf/1mBBDjbMYnjY8b0zZ0zqkFbLPFL8vMvHlYlC5BA/LM3KNZ5tjPQg
         t9gdBHgzPH7Xzr1Bltiq0VOrkLilW9YJ+a/PWeQWVDceRPiVsQmfRd+JgQYDygHAAE2y
         NHeoQy9v4z0M6sAghgPxugLTN1HIgul3H1vrwABJ8DGnluvsIS9sH5DCmeH/zfCO9QTv
         HAxyK1dKZcBxeHORXyNrXeuSNohc2IxmaGMhwEAFgLkl+s/HXyF23cW4V/nOLYrKY0w4
         uv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Mp0rGWZA1Byh4pzWXzczo1JE7IdDXYZCj6xhLEEYgw=;
        b=3XkSna79p9ePRCIxmJSuqfm9UD4anF0knubW0sgFps3h97X2Tta9OWyelt9jE+Wssf
         EhXyoHneLJmn771+CZJUmzUMc+hwELFsiYkRRwq6PwkLZ5RBzQEY0xfEOk+sN6ZUkbMj
         DswYCS87JY6ZQTfBGjDJe/VlkGTiN9Bq2oFtV3pKiyMu8jAp/DrK4h4G9CvYu9TYeHH7
         or43ghwvP9vR1lIYuWF8KN3TOpMpXL4z+0m6JgXkS3EhAEx2MWrRYfSVELdA5MjMgxX/
         DwOb5E2s/Asc1rvTZebXlCu3QeaeSXPN4l+oSb4vA7iRWpX3X89z8vpqz6rpSt9yvKFG
         K5BA==
X-Gm-Message-State: AO0yUKWlE3hnzhiBM7NAoIrDpXBN8vNMUNOW7Vgf8D95WSMVmLxFLX4G
	FWrngsvca2tKwFrA25rjjXHek+VTuJM=
X-Google-Smtp-Source: AK7set86m6CN+/29Kmet0+paVMGutJn3LvPaj3UITbF2wgADAnU05K5mabttXpm6veL+0kRKlAwO+w==
X-Received: by 2002:adf:ea01:0:b0:2bf:b35d:2797 with SMTP id q1-20020adfea01000000b002bfb35d2797mr9140859wrm.11.1674758509702;
        Thu, 26 Jan 2023 10:41:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b11-20020adfd1cb000000b002bcaa47bf78sm2252624wrd.26.2023.01.26.10.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 10:41:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] containerd-opencontainers: fix Upstream-Status format
Date: Thu, 26 Jan 2023 19:41:46 +0100
Message-Id: <20230126184146.881118-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 18:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7834

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
index 0ef0d38..32da401 100644
--- a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
@@ -12,7 +12,7 @@ packages, we end up with errors like:
          recipe-sysroot-native/usr/lib/aarch64-poky-linux/go/pkg/tool/linux_amd64/link:
          cannot open file : open : no such file or directory
 
-Upstream-Status: Inappropriate: specific to OE go configuration and build
+Upstream-Status: Inappropriate [specific to OE go configuration and build]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
-- 
2.39.1



Return-Path: <lukasz.czechowski@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046C9D15DA9
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:02:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.48221.1729522957788281417
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 08:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=GVgxK5NE;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.52, mailfrom: lukasz.czechowski@thaumatec.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so2133041a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1729522955; x=1730127755; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5ChLt2zFQGWruBK62dMd9czrrdIB4pYeKamVyWuJEI=;
        b=GVgxK5NE/0WtVu0BPRGX6p+CN7s3O0a4jPLVBb6C02GV6g5Q1NOhwKGhK9O2X+/G96
         FlHWx3OrlrOZd8TWXnHgE7tJy0qatM4x9CZvnM7vm+Ij1unt9lzVU/fGAzpu25RjKr1q
         HO02bBDglIM5vzR5JcKDPITjBdDmrFzRf4hqdNnmDdWHVZc+wjJ2n5m+QPqQjVNW2BJB
         7lZrP8ADWJCnmz+OQnlj+KWM9ku13hlVY1dO2UFqCKybv+4/vTXBsGxleQjlJ2TtuVvL
         yzJAUnjJ5V2pVMJVitdHuwIOv/H4kRJsghdMpIVWQHcbpgWSb08e18ytILb3gvFhZyyF
         PTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522955; x=1730127755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5ChLt2zFQGWruBK62dMd9czrrdIB4pYeKamVyWuJEI=;
        b=r5V/H7nz4pDWx22pXmj2joSYCammZ2xmZHtYOCPnv4kuRzubRVZ1S1neErG84bmqYq
         UqdUp4KqX54XKdr/0jpuWkqYcL/TJMSGe52M1/7RkNGd+LyGCB/05Z+JwXnxVc8VhOm6
         dNQQH9VdJTWS0e+wmnYKaLIekdcY8OaxVN4d13J/9bLJXNkRT/JVKZwMcQNXWk6IZJ+b
         btPuO4w1PrxsCeZYS/TmA2FgQC4cuNDDaQowdweZs9lnCHNmgPLwVR7JBUSOZW/WuGDR
         kr6cxzrXOvvdIrE+Oo0XxJvMEvm2Yis+I3DOPyVitPePGcqfgFptx5MQMhDlvgqvJcOG
         +kbw==
X-Gm-Message-State: AOJu0Yytn4gxTAm08ioga+bU6KgCIseOMXAUNR0orXPU4egSnoCO3Ju0
	om+YnnkdbcljgaLS9/W4UeO/yU6PQe2JlHxSOr4szLxYvJ2tNN6gAlSDRmQg+DBC5mKS9TJhRY9
	g
X-Google-Smtp-Source: AGHT+IEL7luwkhx6M11numYbLpodbb0us5157TNMMn8SfZzBmOwQxkxcKRpLZAVnkZtjUjmFIedvRg==
X-Received: by 2002:a05:6402:5110:b0:5c9:367a:68d9 with SMTP id 4fb4d7f45d1cf-5ca0ac6043fmr7422711a12.15.1729522955359;
        Mon, 21 Oct 2024 08:02:35 -0700 (PDT)
Received: from localhost.localdomain (178-37-182-94.dynamic.inetia.pl. [178.37.182.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6d798sm2101035a12.50.2024.10.21.08.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:02:35 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [meta-virtualization][PATCH] container-host-config: Remove centos registry
Date: Mon, 21 Oct 2024 17:02:31 +0200
Message-ID: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 15:02:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8934

Update registry list by removing 'registry.centos.org' entry.
This registry is no longer available.
Decommissioning of the registry was announced in the thread:
https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/thread/EHGCQUHLDQ6LI474ZAB7MPRZFJD77P3S/

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 .../container-host-config/container-host-config/registries.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/container-host-config/container-host-config/registries.conf b/recipes-containers/container-host-config/container-host-config/registries.conf
index ba6c3f6e..926d8c36 100644
--- a/recipes-containers/container-host-config/container-host-config/registries.conf
+++ b/recipes-containers/container-host-config/container-host-config/registries.conf
@@ -9,7 +9,7 @@
 # and 'registries.block'.
 
 [registries.search]
-registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
+registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com']
 
 # If you need to access insecure registries, add the registry's fully-qualified name.
 # An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
-- 
2.43.0



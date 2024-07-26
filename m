Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEC1C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 10:41:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.58156.1721990480148870417
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 03:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXomntLn;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so10987995e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jul 2024 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721990478; x=1722595278; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwTjtuacle6gm5RfvFzKmEmf3rYDQrzyylxAefA8Po0=;
        b=jXomntLn9ro/077owllT2DF/Jpj7l/YqQ8GJc058ffFT/bWXhCVtq5NNEhflkd4dEm
         LATJXd3+AQwGFBWW71e6J7UG46TaPP1Ib0C8aJr6AkY04NIdM5THmVoSbw3siUqMJulK
         m4Z65pr6YaM634QliXCkaNRc+bk4aPgE+F0OKkncGbhqJlZGJ4F8kBoYLPmPwyMPRgQM
         1smE1ZpcPiwhKkfQy+b+Y1jNIrKeex4G0UHjBLK1qVhcZVtkj2O9J9dORF89/aTDTKiB
         xU4slBYJwrATeXLLcOZcK+9ucaKfrjfj+VnwtMb6Ty758Y0/+JCYMpJnOwpBaxLyn3Ji
         DCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721990478; x=1722595278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwTjtuacle6gm5RfvFzKmEmf3rYDQrzyylxAefA8Po0=;
        b=Cm51kJyQKr4QlXOHY/sZJAuPwvG4truZQ5H/ybCXmR0DglG9YMXXJwM9jWqAMNUlCW
         VwmTm1aOZI/31aBorF0u0zlO7GrK1SG+Jc2Hy+sj3g8NNlaQx4+vbbqt9JfrhHDcNqJD
         1g1vFFvfaYNsdSgH9v3dv5E6uLuite5OHW1ncKFullrjpxawoJ1b9sor2r9XnEWU0clI
         XwGFX2+DnHouyeFAKDZhLI++vUgvpzHMjDgQwzHG9eNV5MKrED/LT6ixb0k8WMmqskGZ
         GtMEzyD/AFk7imFGqcLzdbIfCX6q05Alzv/E2P+OoijrKRKzeWzXo76psq1/FZngprlQ
         oLIg==
X-Gm-Message-State: AOJu0Yz8/jL5wM1l6IfmoSC66htL5fz6hxPrX8cjXqanK49aNXMYWS9A
	VccbxfhqEmvThL0lBb2P2RfpS3O1zJ50pkcmFStRoOcrF3P6ymBBIq+VTg==
X-Google-Smtp-Source: AGHT+IERVPFRWyLfpndHP/pjWmJpfADh4sgIOfCEMOLw8FZmpOqu7yVr4mroGKoilyINUo2X3vgDHw==
X-Received: by 2002:a05:6000:544:b0:367:9792:8bd4 with SMTP id ffacd0b85a97d-36b31a790e3mr3923877f8f.43.1721990477916;
        Fri, 26 Jul 2024 03:41:17 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857f23sm4734556f8f.78.2024.07.26.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 03:41:17 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH] docker-compose: drop SRCREV_FORMAT
Date: Fri, 26 Jul 2024 11:41:09 +0100
Message-ID: <20240726104109.1729821-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jul 2024 10:41:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8845

We currently only fetch from one SRC_URI so we can drop
the SRCREV_FORMAT and covert from the named SRCREV_compose

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 8bab3fb6..dd2b131b 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -7,11 +7,9 @@ DEPENDS = " \
     rsync-native \
 "
 
-# Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="compose_survey"
-SRCREV_compose = "f79c28168bf6a95ea0cbd1c298f4a0ff4c3ac36b"
+SRCREV = "3371227794f5f3645f4f19829c60a741635ed329"
 
-SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
+SRC_URI = "git://github.com/docker/compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 include src_uri.inc
 
-- 
2.45.2



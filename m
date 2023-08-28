Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2B7C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 22:07:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.4530.1693260444954925949
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 15:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I1yS1kYD;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so56857341fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693260443; x=1693865243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vAf2/tJL9Lq2C+8ZvVXSBpqgeQxSa6uxPI/9SbQox0=;
        b=I1yS1kYDEja4toY9zZbhuy1cupFXgNTw9p/i71lmMKvqq5w4mUZviV0uaPaEVPx0Zh
         wqo9+mgqPFtS7Ewks4EG7kCJtjNuVbP0ecAVN46PE699Wz0H1OJpgO559dx+/O1k7a1L
         eY1uz5LdBr4+wOmHCoky2DIgzLxHUFh83SH/g22Iav9Oksahx2l6OTAFHF640Fp+D2LR
         LRvsIu0bfWtHB63kwzy+Wvh8KHWJvXNtsFOgcytFLitWHl/3gvM2kVpXYwEcf0tHEItA
         2/XzblR0JhJmEdNSJ/hgP1Ts/RDFVOKreUJPGlynEKIvMdDOVPKTgzZuZ5yeqK0kdvO4
         zq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693260443; x=1693865243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vAf2/tJL9Lq2C+8ZvVXSBpqgeQxSa6uxPI/9SbQox0=;
        b=RCjX/0/CGQ1J2/mWYibOq6SiASk2ctV5N7twqAHcMvdPfGLSO/JMEAmXhwa/Fp9zYO
         /duzMIXIDgp5esiKUYY+YXQgp4dt1rjCj8EcY8xxFCy/aQanC96M1/c18C/EBBMpJU74
         spL631uK/6AZxp8qE3uSzwpUke/GuTL18FROLju93bJfuodegN51T21GJpFPXD5k3QWT
         ooSe7my0peZYXO7d6XBVAhRFng84aanBN2UI9K4jCcexx9I2I9y+FJ4VD+En/68P2Z3l
         BLv4C84n+uFEAZ7dN215a1VZZdmU/1AuLzpUoaqtVk9zVz6S9xmEALV26iBvi889V5SS
         zwYA==
X-Gm-Message-State: AOJu0YySq58XnJLO9oBVOf2M8D+vTATBeWw5wtY2pH1I9o1IIPU9Fbif
	RSn9J3GSRPzuQ9SeQhzO97TPnphF0LE=
X-Google-Smtp-Source: AGHT+IH3FUYEyY+eHOsRzy4G5jUvn/U75s7fQEzxqAyui+v0eV7sHB6LXbdXOwqm375NSYw75T30/A==
X-Received: by 2002:a05:651c:1027:b0:2b6:bc30:7254 with SMTP id w7-20020a05651c102700b002b6bc307254mr18866262ljm.13.1693260442968;
        Mon, 28 Aug 2023 15:07:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z6-20020a170906814600b00992d70f8078sm5157946ejw.106.2023.08.28.15.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 15:07:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] go-mux: Switch to main branch
Date: Tue, 29 Aug 2023 00:07:10 +0200
Message-ID: <20230828220710.2689454-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 22:07:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8251

The project has renamed the master branch to main.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/go/go-mux_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index 3f939f4..fb4502b 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "mux"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
 
-- 
2.42.0



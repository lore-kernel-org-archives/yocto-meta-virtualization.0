Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DB7C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:24:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.81935.1674757491355773792
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 10:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ucdb8Eex;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso3783266wmn.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 10:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7kndLirAXHiv7sHUUsa5sAUUswmP7yuFZvxI+Y+AU8=;
        b=Ucdb8EexLheNsjRzRVu0UgjTpNB8FgE/ynmU+kJte1Wx+MDKosLzf8AJ+nTvPjXA98
         cLoqqdBmQrTJisIg4xgSluB4X9euNVqGC0xXsglMNvgXjik7KIx07JUF/XkGaLaHdTM+
         nG76CwRCQLFwklDaby2vo7T9SFfmRsO6y9G4vZ+aHwAPx21xod3VPe6b0d983cc61Ast
         BSOTRxh5myPj+v1mfFs5aSMKhoi7PdEf+lFKBxHLlrmeyhzuMmqnJhUrWrWMhoNuGWJ+
         KVXqmdNr92fHINeTnI9SHA7kezc5G1vOTdA6gGM5uM1lKZ315Yd0B72v0NzSMPdJU9bP
         zd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7kndLirAXHiv7sHUUsa5sAUUswmP7yuFZvxI+Y+AU8=;
        b=hnM5ot4BInMmJPl5RFyxPx5mt6T994x1U9r/mq/zx4xWV7lKyUsZpAHVR4CwbNgWvV
         QpwKuh9JIN+hx7LIcLAP5yJ7yB6wXuym4c/bYVY684y7CiCFwUUbu8Joh6wUNk/1bewO
         W/AZGNCIrvRUmxocm7F9qCGq4VgbzPbFSDjWwPze/SaGq2yMvUFH6o3PFD4Sk/rHuVDI
         1jssrMoJ2LHS6Ts52AFlk95z0x7kRnyzo7OxUH89TIBunLe9xkJc5G2BKe5RkjNsCqP7
         QurEwt8sMsxzLMlQIS1W97l8bVLvPQgN06Rk4tIQfDrEaHJc+WQwvLo9if98Q5YwgiXG
         4eqw==
X-Gm-Message-State: AFqh2kpuuAcN3Rh6FGyfvgSCUtImjf5ix7OszqVvE4SfK08srCjh+6WG
	gjkEm2ECJOpLN9UTORxq3sWV46N94Kw=
X-Google-Smtp-Source: AMrXdXsFgdhNjVTGbcrO9EtOmKMz7FIahbZ6+kDxrEX+KabhiQ5r3Sg+QlHrArlFGM640To7183ueg==
X-Received: by 2002:a05:600c:3c92:b0:3d5:365b:773e with SMTP id bg18-20020a05600c3c9200b003d5365b773emr37847594wmb.39.1674757489756;
        Thu, 26 Jan 2023 10:24:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b003d1d5a83b2esm5263384wmb.35.2023.01.26.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 10:24:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] tiny: fix typo in Upstream-Status
Date: Thu, 26 Jan 2023 19:24:47 +0100
Message-Id: <20230126182447.184405-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 18:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7833

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-tini.c-a-function-declaration-without-a-prototype-is.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
index 96f3625..8834f17 100644
--- a/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
+++ b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
@@ -22,7 +22,7 @@ Subject: [PATCH] tini.c: a function declaration without a prototype is
 |                    void
 | 4 errors generated.
 
-:Upstream-Status: Submitted [https://github.com/krallin/tini/pull/198]
+Upstream-Status: Submitted [https://github.com/krallin/tini/pull/198]
 
 Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
-- 
2.39.1



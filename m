Return-Path: <vishal.bhoj@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E734BC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 11:22:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.5902.1642159360688094952
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 03:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eXt27kBw;
 spf=pass (domain: linaro.org, ip: 209.85.210.180,
 mailfrom: vishal.bhoj@linaro.org)
Received: by mail-pf1-f180.google.com with SMTP id m21so2485589pfd.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 03:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXoOeEYtMPSkA+vXPaFQASqGnKTHI8iLHcQozppCWqY=;
        b=eXt27kBwvKd0F4N3qDkeS9SoKPBLB3vkQ2w0dI4/JQ4ljpjkHKLFxsLUlQlpXkbF7/
         f+E7C8xoq+yNv7poyX0g3IRrDNPQUQfn1aie9QUKe8OVTP8G5+GBdMro+8Z+rJPdYQ6A
         z3cEFdGo13p8vHyudISZJNp2TenTI1g5P1F1eoNEMNeG+xLiv39K5gQzoZW+iLJ/l0sT
         VEm6kyTj3fVUOmQiiBQwwGFG84FFQYVqAPM97coLzCZifSKRsfpbbfF2Ub4TvSQy2Yfi
         Gr/oTTxUBQ6qUoBaZTaxn+jpyYkytGHSPY7X8caodM2blNCF0hIaQJTIunsebg2dQsSa
         LMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXoOeEYtMPSkA+vXPaFQASqGnKTHI8iLHcQozppCWqY=;
        b=QQdKFzh9g3XGT0+xcnnM4G/ijjF1dCcCX5vKGpdH2TvcI13n97bCujeipjMCZUo1Bj
         BF7jEyGrojR9sVDpec+eIEYZI8THCo42wUtvYoI3QCuaddW9cQcvp0dWR0CFjqHpNd/A
         cO+klUk5jTywnuEiuIxvrGlf/Dkm6AzcV+6n1KEv96029BSStRknOTsbrKegCg6KxvSr
         yBvmeOSgUcbmaEyNNtLM54fnrfHyCR+cro8oRVx4MTAxTZcPLbMN5cI/5gXPTR7pQKL3
         HfNwAHZ37zlhhqtx1LODN5MB6I7QRuHm9vKo3ec2ewJ93WWFp7GFoXRQ8kONUx7qhADZ
         EW1Q==
X-Gm-Message-State: AOAM533Z9kyL0QvMsBmr11h5mXeC/g8+mXrK8jabEAY6sEEOVUsag0Mq
	6ubNQV9kV0dbO+XDsHYqTJGP9o14ECXRkA==
X-Google-Smtp-Source: 
 ABdhPJzdIaTynsWMGTSFjLsNalEPSVt4MSzS+kCTFv/dw+NEv6kaNHAcpsRfEbtLGId/dD0wizqZ5A==
X-Received: by 2002:a63:2023:: with SMTP id g35mr7767496pgg.432.1642159359674;
        Fri, 14 Jan 2022 03:22:39 -0800 (PST)
Received: from pop-os.. ([122.167.127.160])
        by smtp.gmail.com with ESMTPSA id
 v4sm4811470pjk.38.2022.01.14.03.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 03:22:39 -0800 (PST)
From: Vishal Bhoj <vishal.bhoj@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: patches@linaro.org,
	Vishal Bhoj <vishal.bhoj@linaro.org>
Subject: [meta-virtualization][PATCH] go-fsnotify: switch to main branch
Date: Fri, 14 Jan 2022 16:52:31 +0530
Message-Id: <20220114112231.476679-1-vishal.bhoj@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Jan 2022 11:22:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7002

The maintainer has migrated from master branch to main
branch and hence fetch is failing without this patch

Signed-off-by: Vishal Bhoj <vishal.bhoj@linaro.org>
---
 recipes-devtools/go/go-fsnotify_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index 8aa1c76..85350b0 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
 SRCNAME = "fsnotify"
 
 PKG_NAME = "github.com/fsnotify/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
 PV = "1.2.11+git${SRCPV}"
-- 
2.34.1



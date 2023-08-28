Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89057C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 20:29:05 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.2183.1693254536496280097
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 13:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cMYh7hNO;
 spf=pass (domain: linaro.org, ip: 209.85.217.67, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f67.google.com with SMTP id ada2fe7eead31-44d58933a17so1197390137.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 13:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693254535; x=1693859335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGpU45JC6NuuaBCwIaNWHhv1FVAlTNOq04ciuLdrZ48=;
        b=cMYh7hNOGvwcWF7jKF6H/hkchMFOhHhOEHOCoY5Y18anIMW1RhYoVJm/hGbOOm76ay
         c5ruAbyyjF0Mf1jymmStmgOUsPv4E0VQlc12Gfp6KEFnwl0d3WbY57aYp66yw75w4SZw
         FQhBYPoeCH4RLua23lu0esyYbck2TKbhu4zaKxzmzGh8GHtV6NzuFDv9AVlSlltcsV2W
         21u5MZCSI7FdJkt7IYEMI+BYiPvNoyziewpVIAmxdb4Rr5ciZQMQMkZifMlwcHmLDkJG
         zC74JkvnpFawCnHvwuyK4J1KQCBin+i1azwVb70IomS0ILXDYeMeFTQ7tea/FW4XB1Jj
         uI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254535; x=1693859335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGpU45JC6NuuaBCwIaNWHhv1FVAlTNOq04ciuLdrZ48=;
        b=joEeulv9qThhptQstumDtKMvOD1Q003jJXWHWnALfV0yza/nJHvfNNeWMvzS4Oui4I
         8LDoXIRIWjMvlcM2pTS1xyLGXEj9WuwQAnhv4j8+/G7TWrWbD0mLRCMhRU0qWxt4/k3x
         n/xR/vRDcyf2rTRluxfpIkn1kEsqmI5H9X+tA4B/6nD0Bk8wrOQxg3J5LYwcymolYJq3
         RoNRE/D1TgKp8bc/2t0BuMcSTsKGew4sk5M9oM2h5jN5UIW7fJE0L6BDnYfo6vCa+Whi
         UvvMlEBAOFmbH7IZ9goE1gxt7VgmBumVLTyP1HGFY0fDT8olCMUDCxGnMnbfJOmns1+1
         5CMg==
X-Gm-Message-State: AOJu0YxEm6gx2x3pecfcPhF/bvIfTd0tFdaKZPye9eTCTACqk7prtW6m
	UfbyutG2Z+lA8ZTa3jDyRIkQ/OyuS7SSdw9f+zHV4Djn
X-Google-Smtp-Source: AGHT+IE8YBbxzKE+bUbKfFtD+grIAMd9vU7VlKUFi+iBLZIFr4HDb3OabWPNLi7SCsN2ZnufK7snLQ==
X-Received: by 2002:a05:6102:3bc4:b0:44d:4aa1:9d3e with SMTP id a4-20020a0561023bc400b0044d4aa19d3emr20571066vsv.0.1693254535333;
        Mon, 28 Aug 2023 13:28:55 -0700 (PDT)
Received: from jetm-rog-x670e-gene.ftth.telecablecr.com ([190.171.102.33])
        by smtp.gmail.com with ESMTPSA id u25-20020ab057d9000000b00789c56e2259sm1316343uac.20.2023.08.28.13.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:28:54 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] go-build: add SRCREV_FORMAT
Date: Mon, 28 Aug 2023 14:28:34 -0600
Message-ID: <20230828202834.2981605-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 20:29:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8250

Recipes that use multiple SCMs in the SRC_URI, must supply SRCREV_FORMAT
to avoid an expansion error.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 recipes-devtools/go/go-build_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
index 2337c9e1..2a78be01 100644
--- a/recipes-devtools/go/go-build_git.bb
+++ b/recipes-devtools/go/go-build_git.bb
@@ -4,12 +4,12 @@ DESCRIPTION = "Xen Runtime for OCI"
 
 SRCREV_runx = "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
 SRCREV_runc = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
-
+SRCREV_FORMAT = "runx"
 SRC_URI = "\
-	  git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
-          git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc \
-          file://0001-build-use-instead-of-go.patch \
-	  "
+    git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
+    git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc \
+    file://0001-build-use-instead-of-go.patch \
+"
 SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
 SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
 
-- 
2.42.0



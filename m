Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E5DC76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 12:15:28 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.19325.1680351324623384298
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Apr 2023 05:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=A7ZtMfSN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id ew6so99860065edb.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680351323; x=1682943323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wO8iFiHraAFKEI/PcF2ZUm//iCvir6MpcUveVMWnG5Q=;
        b=A7ZtMfSNh4Dc9R6PreO2vM3AX/aDKl37s/mOgQW322Hynta1kEeyENSir+0NhDSbhU
         HMjco7EWvIi/9TsBtSA9K/zExd/g8YZbas0rNV67/hbBD/GM3HLsWJjXF/tHW3jm4Jsv
         Rx9Qw2+Y1PpHeKxYvGpqDbZHnd0rF0OH6k4ft1ecCeKPei0o982OEexkczfoXFiulL2n
         9ZMZOaPWFyqS1aByMOSgtFunBES0U3Lp8erY2f6orZB/hEfNCjQ2KzUmGC37yFoe7Oi0
         GqYrXFtTqIJMrUB6qbNNs5A6snQBqK5PEcVGRqCtEwMM0r+cYU2NgvDUnc9fS8dGky2h
         tWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680351323; x=1682943323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wO8iFiHraAFKEI/PcF2ZUm//iCvir6MpcUveVMWnG5Q=;
        b=UeymnPdkAPWRTXjv0Q5m8X2ugWyhrVGKqbqBV9AXP+FiTWHGn6H/a3Cdz5uBoMh85M
         bsQYZkt1qwqL6KUkNMB2n63spOngHGUjSSajIncMUZTt9F3BGgm2cAt/wSn2Tm1Pry1U
         WD24S8vbYzshElmYXjIV2cy7b39DpSEGtmovfSA56JPqnMnJCjVuAKU80ahQ+JeoNmFf
         iRsPAWShY+PqeyPvjpvfdfrK5Wn+PNhW6JhyXrdF0hlM7wJp2tA7E3pzwnFEpKWIQ5XI
         GD2fidVMQ+ARNXtGjW353kaV0Pu+9HgpwRr5ZTztr2rdVYHkg9tl7NS/ruoCxPI4l14U
         chiw==
X-Gm-Message-State: AAQBX9d/9ZEIkuj8SjqZFhZ9Ll7uFQwpLtj8ZiatuLuI1jLIUJt3yn6k
	fIMP9LUSeqnjAkEHgLe8neXVI6ixdYQ=
X-Google-Smtp-Source: AKy350Yf4hhMu30t4Z4VY3iiv7b7KqiXW4id/sz4A26lVWGfLiUzZRbNPSw8EIJNqW+e2LlLeASGlw==
X-Received: by 2002:a17:907:a4c7:b0:947:80a4:5cce with SMTP id vq7-20020a170907a4c700b0094780a45ccemr7719328ejc.65.1680351322780;
        Sat, 01 Apr 2023 05:15:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906d18a00b00923f05b2931sm2016278ejz.118.2023.04.01.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 05:15:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] buildah: add seccomp and ipv6 to REQUIRED_DISTRO_FEATURES
Date: Sat,  1 Apr 2023 14:15:13 +0200
Message-Id: <20230401121513.3779028-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 12:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7976

* because it rdepends on podman with the same restriction

* BTW: .gitignore has:
  build*/
  which gets triggered for buildah as well:
  meta-virtualization $ git add ./recipes-containers/buildah/buildah_git.bb
  The following paths are ignored by one of your .gitignore files:
  recipes-containers/buildah

  I've adjusted it to /build*/ only.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .gitignore                                | 2 +-
 recipes-containers/buildah/buildah_git.bb | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index a61332e..daeb43d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,4 @@
-build*/
+/build*/
 pyshtables.py
 *.swp
 *.orig
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 3c17c98..8c6b8f3 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -16,6 +16,10 @@ inherit go
 inherit goarch
 inherit pkgconfig
 
+# Rdepends on podman which needs seccomp and ipv6
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
+
 GO_IMPORT = "github.com/containers/buildah"
 GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
-- 
2.40.0



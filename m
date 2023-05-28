Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EAFC7EE2C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 09:20:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.25825.1685265621767570472
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 May 2023 02:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=p+fCNj86;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5147f7d045bso2748960a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 May 2023 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685265620; x=1687857620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oesP67w5Nc1ndnBysGvfRkafOJgLHL8YCqz99waBN/g=;
        b=p+fCNj86F8Bmi3JQlds/9AM4ZPJi4Y0GOT4wnFCiI9WXmRvlJUjNNiR/NeXpqtiXaJ
         rMXC3gw1FkkuNi+RvyYEMFMfeTbEKtNFoF9QPVZQRyfod+mXhGTq4pGL3CMDUF7XGz2p
         3+APLIbaUCi1nF+eVdRTAT4HSsdOwaWwrfk3iJTGtitzSGub4wCjYOTZb3uncNkyvKV/
         Y1ogvfY7JFjCD/3JzB18J9nvMF4U/ypuqivTKuCTZoiZCCckN822JT8lTUCVWRK9BnZs
         j0fhBbb4yu8tm1SSI1Za7ddMoOqASWpjb1MooqF4+dVCcqYqTQ+AjaDBWo0Dkvq5P4nB
         nxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685265620; x=1687857620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oesP67w5Nc1ndnBysGvfRkafOJgLHL8YCqz99waBN/g=;
        b=lZNXOCidI+Q58hYHKkMQsCVB9UOomhN7pLJcM1egB/4nvrRGHmDLQxJrFyItCLh/d+
         Xdc8PIY+TSiLIETYiAyBeUTfbRdKWFD5cR/eJ5RVXj/wq3zr0LEUntJjdhc7nY2vUHhJ
         bvLPMy/fr3heCGB8c8YGRCsq3uy/Px96HsE5S3KChxXl7Ym2rnNVnon/NN2b9IMJMy1x
         i5TzhOkHzlDfQFCMLcJ0MrSeOwFrzE11wePuOFQr2Bilqrw7WKE1LOahFfEs1pWdEnfG
         CwQivQvekPkxKe+wqsFSEa5GjNNw+MnDuSTmqJjGKQT/yjlY21RuPgdRKzGCB51CahNe
         GoHQ==
X-Gm-Message-State: AC+VfDxaDzWLqztz3dgbQI9NH1obzVmXW7rFfCz1Rnlhklih9FzRLyTX
	WR6cFZ58bhulhvLvZkXLtmc6fwTg2EU=
X-Google-Smtp-Source: ACHHUZ5b/10tDgcsBbyCtX7Or+FMg4NpbDb/q/BhVdFN2lcgeDiE2fHGkNmtg6rZxzWyONByvdgrCQ==
X-Received: by 2002:aa7:d593:0:b0:514:9497:1bf6 with SMTP id r19-20020aa7d593000000b0051494971bf6mr2594746edq.2.1685265619976;
        Sun, 28 May 2023 02:20:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c787000000b0050bc6c04a66sm1851455eds.40.2023.05.28.02.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 02:20:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] Revert "yq: Redefine do_compile"
Date: Sun, 28 May 2023 11:20:09 +0200
Message-Id: <20230528092009.3593904-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 28 May 2023 09:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8084

This reverts commit 49a6827cbdb6e00d3af5e5c4a4479c47573a4533.

This fixed https://lists.yoctoproject.org/g/meta-virtualization/message/8047
and now can be reverted again in master as go was upgraded in
https://git.openembedded.org/openembedded-core/commit/?id=e043bfb42156c59c93c6a4816528a63cfdaccc3e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/yq/yq_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index bd474a7..45f2f97 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
 
 inherit go ptest
 
-do_compile() {
+do_compile:prepend() {
     # arrange for some of the golang built ins to be found
     (
 	cd ${WORKDIR}/build/src/
@@ -60,7 +60,6 @@ do_compile() {
     # arrange for the fetched dependencies to be found
     export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
     export GO111MODULE=off
-    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
 }
 
 do_install:append() {
-- 
2.40.1



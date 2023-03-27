Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745EBC77B62
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:21:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.29768.1679905271671602623
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 01:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QaTfm9hR;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id p34so4505750wms.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679905270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcCmBEU0muMxYYSWS7b0T3veC/pEw/+MgMRF6QE/iWE=;
        b=QaTfm9hRqoB3p3RSgZg4+WLHHoC3RyGBQejI40MQpztDRD9DSamxYBso7JOPoZms3f
         bMmgDkpHtHjLKr24MXUivE78xOL8i92uo/KZX1KzPZjnPz50fG4xyHqGVx379+SlZb0h
         PZa3BD/Cr4YXHLxis7pOdKp5GegvV0agJiNmBY2RGNSyTrTSnCcpRhVQJQUamNtYGS/p
         2YRgigUgasG5nIRBTyTmQqwNsVG0tqJ20K8CNt6LGvDJ0Fq93rWnW36RwrRDJvLPPAzE
         cVvrlpSdOJLfJFkHMiEB2U83Q8j0uOrmdjexdjn+Gloe4y9r61wpqHr+1UhssCZP0IeR
         jvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679905270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcCmBEU0muMxYYSWS7b0T3veC/pEw/+MgMRF6QE/iWE=;
        b=KRSxadeKoBsM1NCaJAnK30tLql51cXpob63MdZ6dSmouA4+IZRUYVMlz1AVYRwy2gM
         5m3YmaqrEz6iZF6xE/VY2dtwoECQksLV/mn0utppvBYBr7oPFXIwjzP34cWYf2/pY6Io
         GOTwWGbwwUBsTl69oyCmo0DPFajKEUEpSgdcOT38+KMBGX6csBvS7DTDgjWQO8830h6H
         komUbbC2T4jMiO1hP4jtsRqPi/L3UMCf/jJGmU18fM4se8sNE22vG127or/0j5n4Yb1S
         wnf8r2TnW9nKUVDQxBaaEM7uxnTXc8HJKVeS2JPKhDylR0y5hX2qrClwiQM2y21yLgm4
         DVJw==
X-Gm-Message-State: AO0yUKUg7iENEWgGo7Q7M7rYR6PNdTpUasLWYMSWUPIPNLxLlSwXA3L+
	Jh9IgiZ8e5jM2wwiDtlZlmfN0u6wtAk=
X-Google-Smtp-Source: AK7set8j7eOsmxzLkd9/IUJW9uKiMUe5q2dtzKo0OtCihfS/flvdhR7aOdhSh9xEE6UqY7QXKRM+rg==
X-Received: by 2002:a05:600c:b54:b0:3ed:b6ad:54d with SMTP id k20-20020a05600c0b5400b003edb6ad054dmr8478574wmr.18.1679905269798;
        Mon, 27 Mar 2023 01:21:09 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003ef4cd057f5sm8002842wmp.4.2023.03.27.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:21:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH 1/2] Revert "yq: drop {LINKSHARED}"
Date: Mon, 27 Mar 2023 08:20:36 +0000
Message-Id: <20230327082037.3173653-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7956

This reverts commit d2a630ce6cf67a145f218012fbf02e4d0d9648df.

The linkshared is fixed upstream and backported in oe-core.
https://git.yoctoproject.org/poky/commit/?id=d5c79ca6a77af1a04992fff4300333e02d94d84d

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
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
2.34.1



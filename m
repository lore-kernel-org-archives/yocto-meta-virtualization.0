Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9852C4167B
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 14:05:32 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.30371.1699193122150742197
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Nov 2023 06:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=pywnTP6m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202311051405208af293f5897af7850e-4ufay0@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202311051405208af293f5897af7850e
        for <meta-virtualization@lists.yoctoproject.org>;
        Sun, 05 Nov 2023 15:05:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/Updru3zuNCEpdsCV/YTaz6wYnC9VqMQiNUDMHbexGY=;
 b=pywnTP6mKc7la0VipPEFLrdCPYFVFmu4wpk03BtK2RcC4MxNfKeV9lBpd3W9FgqUGzWIs2
 FtOem0M/9XSuKz6klg8sjORNe1s41d/8wIvH6h+Ax/zAyC9XJp50eCYU8ARaSFZBOCRdpmuk
 Ltg/3O1x9fLWUGu+6f7DPsKtHZuBY=;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH 2/2] grpc-go: Upgrade 1.41.0 -> 1.59.0
Date: Sun,  5 Nov 2023 15:04:29 +0100
Message-Id: <20231105140429.1973258-2-peter.marko@siemens.com>
In-Reply-To: <20231105140429.1973258-1-peter.marko@siemens.com>
References: <20231105140429.1973258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 05 Nov 2023 14:05:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8423

From: Peter Marko <peter.marko@siemens.com>

CVE: CVE-2023-44487

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-devtools/go/grpc-go_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index b3b58ed4..8fe0875d 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3b83ef96387f14655fc854ddc
 SRCNAME = "grpc-go"
 
 PKG_NAME = "google.golang.org/grpc"
-SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=${BRANCH};protocol=https"
 
-SRCREV = "5d8e5aad40bedb696205b96b786f1d0e1326b3f8"
-PV = "1.41.0+git"
+SRCREV = "7765221f4bf6104973db7946d56936cf838cad46"
+BRANCH = "v1.59.x"
+PV = "1.59.0+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2



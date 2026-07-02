Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD5BC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 07:44:34 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63993.1782978273032087269
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 00:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 2 Jul 2026 16:44:29 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO jenkins-X670-AORUS-ELITE-AX..) (10.177.121.125)
	by 156.147.1.126 with ESMTP; 2 Jul 2026 16:44:29 +0900
X-Original-SENDERIP: 10.177.121.125
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-virtualization][PATCH] docker-compose: add CVE_PRODUCT and CVE_STATUS for CVE-2025-62725
Date: Thu,  2 Jul 2026 16:44:27 +0900
Message-Id: <20260702074427.263216-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jul 2026 07:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9909

From: "mark.yang" <mark.yang@lge.com>

Add CVE_PRODUCT to docker-compose that matches CPE.
<vendor>:<product> must be set to docker:compose for proper matching.

CVE-2025-62725 was fixed in 2.40.2, but its record encodes the range as
a plain "< 2.40.2" version string that automated version comparison
cannot use, so mark it as fixed-version.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index d3798e35..5526912b 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -33,6 +33,10 @@ GO_IMPORT = "import"
 
 PV = "5.1.4"
 
+CVE_PRODUCT = "docker:compose"
+
+CVE_STATUS[CVE-2025-62725] = "fixed-version: fixed in 2.40.2"
+
 COMPOSE_PKG = "github.com/docker/compose/v2"
 
 # go-mod-discovery configuration


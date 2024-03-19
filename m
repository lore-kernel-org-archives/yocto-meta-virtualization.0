Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CDFCD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:54:40 +0000 (UTC)
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de [134.119.228.104])
 by mx.groups.io with SMTP id smtpd.web10.19458.1710863675567335349
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 134.119.228.104, mailfrom: ts@ferncast.de)
Received: from [84.44.156.224] (helo=ferncast-thomas.fritz.box)
	by smtprelay07.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <ts@ferncast.de>)
	id 1rmbnN-000000002Jq-3FKW;
	Tue, 19 Mar 2024 16:54:33 +0100
From: Thomas Schlien <ts@ferncast.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Thomas Schlien <ts@ferncast.de>
Subject: [meta-virtualization][PATCH] Update runc-opencontainers to 1.1.12 since old versions have a severe security issue
Date: Tue, 19 Mar 2024 16:54:32 +0100
Message-Id: <20240319155432.2263227-1-ts@ferncast.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8646

CVE-2024-21626 https://github.com/opencontainers/runc/security/advisories/GHSA-xr7r-f8xq-vfvv
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 61e7cfa6..88964276 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
 
-SRCREV = "f3446b1e5fe75bf419c808d8705c899ab4968b6e"
+SRCREV = "51d5e94601ceffbbd85688df1c928ecccbfa4685"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.10"
+RUNC_VERSION = "1.1.12"
 
 CVE_PRODUCT = "runc"
 
-- 
2.40.1



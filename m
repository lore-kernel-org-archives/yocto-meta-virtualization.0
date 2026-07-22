Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12071C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:17:22 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42032.1784701041208485270
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 23:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 22 Jul 2026 15:17:19 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.126 with ESMTP; 22 Jul 2026 15:17:19 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-virtualization][PATCH] python3-dotenv: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 15:17:17 +0900
Message-ID: <20260722061717.336055-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jul 2026 06:17:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9976

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:python_dotenv matches nothing; NVD
tracks python-dotenv as saurabh-kumar:python-dotenv and the GitHub
CNA uses theskumar:python-dotenv, so set both vendor:product pairs.

The only existing CVE (CVE-2026-28684) is fixed in 1.2.2, the
version we ship, so it resolves as not affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 recipes-devtools/python/python3-dotenv_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python3-dotenv_1.2.2.bb b/recipes-devtools/python/python3-dotenv_1.2.2.bb
index a112ae95..c3d5d9c6 100644
--- a/recipes-devtools/python/python3-dotenv_1.2.2.bb
+++ b/recipes-devtools/python/python3-dotenv_1.2.2.bb
@@ -11,3 +11,5 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 SRC_URI[sha256sum] = "2c371a91fbd7ba082c2c1dc1f8bf89ca22564a087c2c287cd9b662adde799cf3"
 
 inherit pypi python_setuptools_build_meta
+
+CVE_PRODUCT = "saurabh-kumar:python-dotenv theskumar:python-dotenv"


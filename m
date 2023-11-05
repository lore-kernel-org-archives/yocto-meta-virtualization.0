Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8350C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 14:05:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.30501.1699193114592227877
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Nov 2023 06:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Owt+x3dd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20231105140510c166fabe7dfdf8e2c3-6fg1z8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20231105140510c166fabe7dfdf8e2c3
        for <meta-virtualization@lists.yoctoproject.org>;
        Sun, 05 Nov 2023 15:05:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=arUHKvEkjQv6qqrBn1tuF90Xtkbjlm0Z2qYIuFxF1eQ=;
 b=Owt+x3dd/lxoC0XjVFhBfpRO/9gV7yXOhNov+MbY31I0H9rxR/N17nrI6tgXketKHJvG13
 F5jLlz0RoRL81zsKBoXQmPAE1fllfm4XL6r0V58i8J5064do1hUwDqYQK+ERN50QO+6aSH8W
 3A4/CtSFym6pFRrpLW4oMEByq6P40=;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH 1/2] grpc-go: add grpc to CVE_PRODUCT
Date: Sun,  5 Nov 2023 15:04:28 +0100
Message-Id: <20231105140429.1973258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 05 Nov 2023 14:05:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8422

From: Peter Marko <peter.marko@siemens.com>

Some cves are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
See https://nvd.nist.gov/vuln/detail/CVE-2023-44487

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-devtools/go/grpc-go_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index d5bfaab9..b3b58ed4 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -39,3 +39,7 @@ go_grpc_sysroot_preprocess () {
 FILES:${PN} += " \
     ${prefix}/local/go/src/${PKG_NAME}/* \
 "
+
+# some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
+# it's better to have false positives than false negatives
+CVE_PRODUCT += "grpc"
-- 
2.30.2



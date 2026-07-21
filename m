Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A63C4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:12:57 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28287.1784653972855746585
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 10:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OElIbHJb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026072117124962cf219e730002073d-rqresy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026072117124962cf219e730002073d
        for <meta-virtualization@lists.yoctoproject.org>;
        Tue, 21 Jul 2026 19:12:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2EUjhpjwbQ9qsLZq9aey+xLBDBybfkdXLilhMjyYmic=;
 b=OElIbHJb6S0FqBd9Nl2MjS4oJf1vDHlBPZmDtqXIeqa2i52uWQm9KQJ4Q+hHlQaiHFIb+I
 9qCxCYdvjVX+c+hnoT1L5MfH/CzW2akXIqjijn66tsCAyTO6jr9S2ClicZDiiIsrfWZL9k5U
 1b2CvJig9BLHj6w0fQCj6Xls6JpsPkzGT77sWzy+oSS5s1lBqKOwHB66orFIsBmCT+8FqfEV
 yDEbm8Z+8R39GBZ5FEqDDMh5RIdDST6QH7vY3js2brst2RyugSNvDRTx47R//jA+XEGcCuSD
 93A220y3ivyD4kCxKM6I578iIIr8YpH+/mIO400+ql3Ec9qhWkpNZoUQ==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH] podman: set status for CVE-2019-10152 and CVE-2020-1726
Date: Tue, 21 Jul 2026 19:12:38 +0200
Message-ID: <20260721171238.42383-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2026 17:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9975

From: Peter Marko <peter.marko@siemens.com>

"Fixed in" can be checked in [1] and [2] for these historical CVEs which
are wrongly reported as open in current cve-metrics.

[1] https://nvd.nist.gov/vuln/detail/CVE-2019-10152
[2] https://security-tracker.debian.org/tracker/CVE-2020-1726

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 36c80c0e..4c8b98ed 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -29,6 +29,8 @@ GO_IMPORT = "import"
 
 PV = "6.0.0-dev"
 
+CVE_STATUS[CVE-2019-10152] = "fixed-version: fixed since v1.4.0"
+CVE_STATUS[CVE-2020-1726] = "fixed-version: fixed since v1.8.1"
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
 


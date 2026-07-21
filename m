Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A37C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:12:57 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28263.1784653973429733493
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 10:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k77+U9Jx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202607211712511cd0a05c7100020777-325iz_@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202607211712511cd0a05c7100020777
        for <meta-virtualization@lists.yoctoproject.org>;
        Tue, 21 Jul 2026 19:12:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fCjv+EEUAdABQB/KnQe6MXrSKk2bwKqMdaGDvt22bdg=;
 b=k77+U9JxBhWJQULq0HS64K5YzWqVrlOw0CXe4NWBGQAS7rdFPPntJXdQmuca7hGGimAAPp
 1nT+5LMImp2PHws6DwKihGrfWjcOTwHX3fP/B32OgvvVCv5dAxPUErlpfehgSD/TG93VYuc1
 Bv/gMKNOCDzgv25+Y377EgpgTYtbHFstpmik3IPMDXj1ox7qG5Up1YLD2+4qpsQfJ3WlB9ea
 9+gPPkP23m8RvSVG29YzbhqKdSYJFvkwLZURe+UQq1H6soRc/yCMWh24+x8IDDMcJYEVW+u+
 4kMUT0wp6h1e1vgmvR6td+Yc+J5bq1RUxTh4kNjwwrpkDy4ZFOx2UNPA==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][wrynose][PATCH] podman: set status for CVE-2019-10152 and CVE-2020-1726
Date: Tue, 21 Jul 2026 19:12:24 +0200
Message-ID: <20260721171224.42368-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2026 17:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9974

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
index 886d6e90..c2254eff 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -29,6 +29,8 @@ GO_IMPORT = "import"
 
 PV = "5.8.3-dev"
 
+CVE_STATUS[CVE-2019-10152] = "fixed-version: fixed since v1.4.0"
+CVE_STATUS[CVE-2020-1726] = "fixed-version: fixed since v1.8.1"
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
 


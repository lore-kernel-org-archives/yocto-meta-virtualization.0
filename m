Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1172BC44520
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 20:49:36 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3290.1784494171800804807
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jul 2026 13:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XTNR4ECs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260719204928bf1e3155590002078d-ochtcz@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260719204928bf1e3155590002078d
        for <meta-virtualization@lists.yoctoproject.org>;
        Sun, 19 Jul 2026 22:49:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=91jAs5yUdZWLZZnn45KW9RS7IeSG2YUdf8M2ZyJHzuc=;
 b=XTNR4ECsk+Juq57/7JvSDPekXvItb0TK8b1AqgNtHtZP/bg0QcV14n+lFctHeKXOQbleCf
 jEfljQ7dKF+qTTNfgKa4j5jc0WFEyjbxb1B/9dsYOA75pAIPLvKVXUDTr5WANvqFZ2sIqYWn
 xy24uJehYgGE7H/YaAITq9pUTwtaSLhb35+cqrMaV3okgTUcXHAoi37rv9DAJCwRnRu/9/mn
 BgDP6YiN2pK0TEV5VX8hsJaDLjug0ixHSMhwkQi71tP0psY6C+KwRKkJMu8Yh0tC3Eb9UT7i
 JQnpZBH7Jq5GvBG2l7Od9jhZUrv9BWTK31F8sQmpHFUR5BPqMCr/lEvw==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH] crun: set status for CVE-2025-24965
Date: Sun, 19 Jul 2026 22:48:12 +0200
Message-ID: <20260719204812.449816-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Jul 2026 20:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9957

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.20.
This is mentione in NVD report description [1] and github advisory [2].
Explicitly set CVE_STATUS because cve-check still reports it as open.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-24965
[2] https://github.com/containers/crun/security/advisories/GHSA-f42g-r5jj-qh4j

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-containers/crun/crun_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 1fa9f886..1b0443f1 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -67,3 +67,5 @@ RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC') else ''}"
 REQUIRED_DISTRO_FEATURES:class-native ?= ""
 DEPENDS:class-native += "yajl libcap go-md2man m4 libseccomp"
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-24965] = "fixed-version: Fixed since 1.20"


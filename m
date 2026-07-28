Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B03C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 19:36:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4630.1785267372183642099
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 12:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PKwOT+Fn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260728193608f29617b2ff000207ff-neucjn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260728193608f29617b2ff000207ff
        for <meta-virtualization@lists.yoctoproject.org>;
        Tue, 28 Jul 2026 21:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q25GI5Of1zyhVh4SYn9XpGUFo9IizsiAvjdg9LhrfYA=;
 b=PKwOT+FnG7zsOfdtPDubW3zqv0WUUmVo67uHcPy/xYHrNPFkEtAoDA33y2s9ZWOLlfHCBj
 FEIsEIy2ehHIit8e1vjq2VU7HA3R++KMjxmuIZMzlWRpWVmqyhwiZ5MbQGJbj4D5tkiCA2Rg
 sNhPhhhyfaVMPys241MAWabOaY6DeNdGPFFiksJleOhpG1Sk8MFhtC/77ATP7rl/c4odw7b8
 RbLl2fSruEJwazeevHS9oFZ8hwcjfSy/HyQMa9YtiI+RSkdMpjB0/wjUkMVfVOeYtnPgRL/N
 Dk645a7SwtTLXtAeSRcVWjI6mU53kg1FgHKtsiuhtgqZvCmTYAsUiawg==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][wrynose][PATCH] crun: set status for CVE-2025-24965
Date: Tue, 28 Jul 2026 21:36:01 +0200
Message-ID: <20260728193602.18644-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 19:36:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10010

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
index d2f7b63b..ea14e8ec 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -67,3 +67,5 @@ RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC') else ''}"
 REQUIRED_DISTRO_FEATURES:class-native ?= ""
 DEPENDS:class-native += "yajl libcap go-md2man m4 libseccomp"
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-24965] = "fixed-version: Fixed since 1.20"


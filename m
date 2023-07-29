Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A4DC00528
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 21:25:56 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.61907.1690665951671156586
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 29 Jul 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SaQsaT7X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20230729212549d896ec56c29a933439-1xx_zc@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230729212549d896ec56c29a933439
        for <meta-virtualization@lists.yoctoproject.org>;
        Sat, 29 Jul 2023 23:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bXzGqWBrO6Yk0U5yIWL9xklaJLje/hFPIng66Fi+LCI=;
 b=SaQsaT7X+M13VZp3b2z6G3Y0ukrWTdpCZEcSpXlRR7ZCKhGx/aIWyAGXBS/GlB/4J8lCJj
 nHb6mumqOfvBpo3jXaAEfewkidxIB5+hKDI/CJdHFi4B5c8MEHuIn8gCQSIrV0jl9OQecOCL
 AdYQ9vViucjwazzzmUnOsc/U8Bq5c=;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH] skopeo: convert CVE_CHECK_IGNORE to new CVE_STATUS format
Date: Sat, 29 Jul 2023 23:25:13 +0200
Message-Id: <20230729212513.1528311-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 29 Jul 2023 21:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8151

From: Peter Marko <peter.marko@siemens.com>

See https://git.openembedded.org/openembedded-core/commit/?id=34f682a24b7075b12ec308154b937ad118d69fe5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index e00fcc7..feff9df 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -35,11 +35,9 @@ inherit pkgconfig
 
 inherit container-host
 
-# This CVE was fixed in the container image go library skopeo is using.
-# See:
 # https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
 # https://github.com/containers/image/issues/654
-CVE_CHECK_IGNORE += "CVE-2019-10214"
+CVE_STATUS[CVE-2019-10214] = "fixed-version: This CVE was fixed in the container image go library skopeo is using."
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-- 
2.30.2



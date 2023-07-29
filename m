Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C83CC0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 21:25:16 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.62496.1690665907979925482
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 29 Jul 2023 14:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eZjEB52u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202307292125049b9be01c47aae454c9-t_kk44@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202307292125049b9be01c47aae454c9
        for <meta-virtualization@lists.yoctoproject.org>;
        Sat, 29 Jul 2023 23:25:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vaAZREUp1FgCXWXzj8AoF/oT6hSkONP4OKFlIqeBoRA=;
 b=eZjEB52ubuNLgBtIXTG7eWrCq/tOP+ny3HL7UldQu2AIv05LElE6291a1Czgkgoi1vQNPe
 zOvw2dkZXvjHn92ZsQECWDgb2820i534Cs5kFY5lRokduLfVBI+8kTKuNCAGqQmMxjtn8Kax
 hKIZN2GmLMMN2gZxq9hf615AmbSOw=;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][PATCH] podman: ignore CVE-2022-2989 and CVE-2023-0778
Date: Sat, 29 Jul 2023 23:24:28 +0200
Message-Id: <20230729212428.1528245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 29 Jul 2023 21:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8150

From: Peter Marko <peter.marko@siemens.com>

NVD shows only redhat links and does not mention fixed-in release
se these CVEs will show-up in reports indefinitely.
They are already fixed in current version, so ignore them.

CVE-2022-2989
* https://github.com/advisories/GHSA-4wjj-jwc9-2x96
* https://github.com/containers/podman/pull/15618
* commit d82a41687e614d9ac8b2d169dee47fe226835e4c Add container GID to additional groups

CVE-2023-0778
* https://github.com/advisories/GHSA-qwqv-rqgf-8qh8
* https://github.com/containers/podman/pull/17528
* commit 6ca857feb07a5fdc96fd947afef03916291673d8 volume,container: chroot to source before exporting content

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 145b46f..9060e85 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -34,6 +34,9 @@ S = "${WORKDIR}/git"
 
 PV = "4.6.0-rc1+git${SRCPV}"
 
+CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
+CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
+
 PACKAGES =+ "${PN}-contrib"
 
 PODMAN_PKG = "github.com/containers/libpod"
-- 
2.30.2



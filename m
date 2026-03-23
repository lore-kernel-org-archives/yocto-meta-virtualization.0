Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D80F483DD
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 18:11:30 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1506.1774289488681434666
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=V8my2I+k;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260323181125ffbeb7e1f700020795-34rckv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260323181125ffbeb7e1f700020795
        for <meta-virtualization@lists.yoctoproject.org>;
        Mon, 23 Mar 2026 19:11:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vZtCw9T4PrPJB/jnHylia60U+nwxsJLJ0j5d6UOOsK4=;
 b=V8my2I+keJqvxAwiGUXZffvCq8OY94/5PfIGrzF/zvGyIxdPnYpBms70JAVW/f8/7y+CgB
 SI9erHzjftKepXxxC4b3uq1rjvjsgt0R8JazaF+8AuIyAnCbGsTnYedvPfQ766pRtfw5ZgsN
 buiWA0MbG7EOY6Mq0krVLwJVsuadZgQugYN2Zqf3QJafzrxc2zyxrM+bYsVaOYNBR+opva8+
 CbOCjPJD62IyITz0q4IjEBV2kXZeTs9ehurbOf1su/CJOfN6GYD+CdD+oD1nCMPhEGsruVdt
 sppZewrJdNmjMv3yx5j+/6ff9OTft+CO+nWnOmHHo/xZGZPpEOmo5Bsw==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
Date: Mon, 23 Mar 2026 19:11:02 +0100
Message-Id: <20260323181103.10030-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 18:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9672

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline ee1542e1532e6a7f266b8b6118973ab3b10a8bb5..944fa94090e1fd1312232cbc0e6b43585553d824
944fa94 (tag: v1.3.3) v1.3.3
0422b01 CI: bump up deps
019cd5a bump libslirp to v4.9.1
1bdd0db Merge pull request #355 from takumin/ci-build-provenance-attestations
bf1c767 CI: Enable actions/attest-build-provenance@v2
9996a4e Merge pull request #353 from AkihiroSuda/dev
4523924 v1.3.2+dev
0f13345 (tag: v1.3.2) v1.3.2
6c9d461 Merge pull request #352 from AkihiroSuda/dev
ead6f78 CI: update deps
d6b8b5f Merge pull request #351 from AkihiroSuda/dev
e859823 bump libslirp to v4.9.0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-networking/slirp4netns/slirp4netns_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
index d245324c..62b14a2c 100644
--- a/recipes-networking/slirp4netns/slirp4netns_git.bb
+++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
@@ -6,10 +6,10 @@ network namespace to the usermode TCP/IP stack ("slirp")."
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e2efd29c201480c6be2744d9edade26"
 
-SRCREV = "ee1542e1532e6a7f266b8b6118973ab3b10a8bb5"
-SRC_URI = "git://github.com/rootless-containers/slirp4netns.git;nobranch=1;protocol=https"
+SRCREV = "944fa94090e1fd1312232cbc0e6b43585553d824"
+SRC_URI = "git://github.com/rootless-containers/slirp4netns.git;nobranch=1;protocol=https;tag=v${PV}"
 
-PV = "1.3.1+git"
+PV = "1.3.3"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"


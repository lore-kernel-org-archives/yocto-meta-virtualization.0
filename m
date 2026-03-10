Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835E7FCC9D6
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 07:28:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34824.1773127685603303306
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 00:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fJuSZs7D;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773127685; x=1804663685;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gfOqEtk7i7jV1I9pdQsegC+xg9+4eiBWGhByekRlELM=;
  b=fJuSZs7D8/NKd079PQkLna32UstfwUU6NsJK8Pevb9/wW+5OXK8TIcmJ
   BbOELOHeBjqZGOhs0tGCp9g7WVv22T8+ah8wknKr7/qfeJZD5L1SgAxH0
   qKqA2cIN2aLNOUfM54pz8nyiObgjS8gJGMNzmClciXvoGq2BmJ7zqFAML
   mH7UcM3LBVGZDR89sx/a9esjRTThDQYIvPbaIhLPCZr8j9uy3G7AgqxoK
   gLzjOSRiLQ0+NXMya7bjJGIKZKJ3at5/zXVUjsMalxCeEOhQ8XOqtPwUS
   qr0zAyZ6Y9iok6ViPHjB74ioQJUjfGrQBZxejf9WGwwMU2Q6HjJqsg0Yu
   w==;
X-CSE-ConnectionGUID: CYCeJpyvQp2VlZWnXdXueQ==
X-CSE-MsgGUID: ZtV+KlfYQyKzNsru+blCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="236911366"
X-IronPort-AV: E=Sophos;i="6.23,111,1770562800"; 
   d="scan'208";a="236911366"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 16:28:04 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E4D5C1000359
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:28:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9197E1802AC7
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:28:03 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 416CD1000590
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:28:00 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] podman: Use packageconfig to control fuse-overlayfs depend
Date: Tue, 10 Mar 2026 15:27:53 +0800
Message-ID: <20260310072754.663-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9631

The RDEPEND fuse-overlayfs is an Optional package so use packageconfig to control it.

Refer to https://podman.io/docs/installation

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 recipes-containers/podman/podman_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 53b9b6a0..4495d2d9 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -68,7 +68,8 @@ EXTRA_OEMAKE = " \
 PODMAN_FEATURES ?= "docker"
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[rootless] = ",,,fuse-overlayfs slirp4netns,,"
+PACKAGECONFIG[rootless] = ",,,slirp4netns,,"
+PACKAGECONFIG[fuse] = ",,,fuse-overlayfs,,"
 
 do_compile() {
 	cd ${S}/src
-- 
2.43.0



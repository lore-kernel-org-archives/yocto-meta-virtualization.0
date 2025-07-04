Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A25C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 00:12:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.1899.1751587937408991356
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 17:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=omcyEO4I;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751587937; x=1783123937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tbB/1Q977fRJAvvNicoXIYMwATjx99EpHWZ11wxO558=;
  b=omcyEO4Iw1ViVm/S8yNvEDbQ0AuIiry429pbQJdkvV/kE6PNoMo78ZuI
   OFF9C+WTTuOFRbQskaF1eIwc/cYlhip16KXPdPGNGoiK/NeUrBsMSmfof
   rv7TrR8BSJikVxbOSkTG4AQ11iK8J067hCVEUI95JJvBwQHLkzkj3qRWY
   GYunBey07GYIoWNqSmUayVol8Fp6Z0otzlqlY5X9+okJ6ZzTPW1e951gd
   XxYf7Rm9N99cJ2fZcC5DAQ8EhgKolSCLYyBDSTCHee4BIGwgYqWnzpPOm
   QFFOl+pPRkfIAub2IZiAAgIU1oZkjDakNlEqUW4pnE1qCGc3ZRi8RJQvA
   Q==;
X-CSE-ConnectionGUID: 9YO7UoEARaCXPOjyby86xA==
X-CSE-MsgGUID: /7f3uPUIQGKGZ4zloKC4HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="208357128"
X-IronPort-AV: E=Sophos;i="6.16,285,1744038000"; 
   d="scan'208";a="208357128"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:12:15 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5AB8821E6
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:15 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id D25D2100046E
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4630FBF3CB
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 09:12:13 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEB451A0071;
	Fri,  4 Jul 2025 08:12:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 2/4] nerdctl: drop unneeded S assignment
Date: Fri,  4 Jul 2025 08:12:05 +0800
Message-ID: <20250704001207.250-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250704001207.250-1-wangmy@fujitsu.com>
References: <20250704001207.250-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 00:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9289

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 536c470b..3f87e564 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -28,8 +28,6 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd
 
 GO_IMPORT = "import"
 
-S = "${WORKDIR}/git"
-
 PV = "v2.0.3"
 
 NERDCTL_PKG = "github.com/containerd/nerdctl"
-- 
2.43.0



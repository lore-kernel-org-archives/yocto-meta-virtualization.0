Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B31C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:40:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.44078.1744022435956532218
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 03:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bbmimeN/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744022436; x=1775558436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YH5ZV4RJZlDwWfunrt2j113oVqXRwx966S/thXfgdDo=;
  b=bbmimeN/xKIQXBr3oLarMkLN1PIIbsXhewhYl0LJYcfI2cJwcWIsZXa5
   QlvaihX9tayz2Pm5dNnSxuZGlPAC5H+FI0sDNmLLK72AtMmnboQvrX94X
   918DVxo/1aTe3B6jiJOzCu4kxDgWkCVEUBS7u5+yS38c2Ya2iiMxnvqjj
   WsevMIeJr1y98wV4z31G/dM0HqusBrcMR4tvIyR35LD6uHjbpeNYlViTO
   UDgEYQXKdRfQUr/Ahs+y6K8erlnqgUSmQjrKfJAO8DxhcqHGFF7s7k8gx
   OYQoeXJYXVvxP3nTw6tCaFwQ8T3Dz8RmeHUbtG6Ch+dbqTVoIjthK+8tl
   w==;
X-CSE-ConnectionGUID: xPhqpGXNTYy2H5SS3rmJqA==
X-CSE-MsgGUID: pOjYmgyiRreVn7KYOHyZMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195993875"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195993875"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:40:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E97CBE8525
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA261D50B2
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:30 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03A201A0078;
	Mon,  7 Apr 2025 18:40:29 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@lists.yoctoproject.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/3] open-iscsi-user: Update the Upstream-Status accordingly
Date: Mon,  7 Apr 2025 18:40:23 +0800
Message-Id: <20250407104025.2468-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Apr 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9203

Fix the "QA Issue: Missing Upstream-Status in patch"

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch           | 1 +
 .../files/0001-Makefile-Fix-build-error-of-cross-build.patch     | 1 +
 ...01-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch | 1 +
 .../open-iscsi/files/0001-fix-build-error-of-cross-build.patch   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
index ef11366b..437c876a 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
@@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Wed, 18 May 2022 11:32:29 +0900
 Subject: [PATCH] Fix /usr/bin/sed to sed.
 
+Upstream-Status: Pending
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  doc/Makefile   | 2 +-
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
index bdb9e45f..facca528 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
@@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Wed, 18 May 2022 10:28:53 +0900
 Subject: [PATCH] Makefile: Fix build error of cross build.
 
+Upstream-Status: Pending
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  Makefile | 2 +-
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
index 8cea597e..aa1b5a30 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
@@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 20 May 2022 17:59:03 +0900
 Subject: [PATCH] Modified path of systemd service from /usr/lib to /lib.
 
+Upstream-Status: Pending
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  etc/Makefile | 2 +-
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
index 8eec2dc5..ee1edead 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
@@ -7,6 +7,7 @@ The error likes as following
 | configure: error: cannot run C compiled programs.
 | If you meant to cross compile, use `--host'.
 
+Upstream-Status: Pending
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  Makefile | 2 +-
-- 
2.43.0



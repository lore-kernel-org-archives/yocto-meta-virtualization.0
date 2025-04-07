Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995EDC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:40:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.43466.1744022436446854283
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 03:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oGV5WxNX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744022436; x=1775558436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3XvIcErKN7mBRUN5Tu4pagfdW8NJN5eYo/eRDDU1DSg=;
  b=oGV5WxNXUII+y2UO+N2+O/f1F4eEHb03J6TFfLsHEpEQqhTeKxbhAepw
   z6Mwy3oKSy5abyVLLSoA0UmJoN1Xe+ziX9iuuXiM8w552ctOWGP3My98C
   xRhs0aEezacZwnnTemwaTztYF8EhaRG4nLGSg43v93jyFhZ9+gS/V7eEy
   XwGpCKuZPRYqvnyDKvRzYflZ22yhvsOly1uMKKL2nuvULULQWI6yiZCgw
   Z6FqopVNwnTOigwB9tyOBAydKMvViCYx71sV96TYZtWrGhC/41PnKSFvb
   B5FGwddw6FXWAM6MYu99f6Zbcl/zdoqs3NAIQcQRgI6Kx/62vfsqcIDSW
   A==;
X-CSE-ConnectionGUID: 7Pyw+eUMSEClgNYNGjoVQg==
X-CSE-MsgGUID: ppTDcn49SnS0DwN2zMJ02w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="183640097"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="183640097"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:40:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A4A9CE8521
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67D3A10285
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:31 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D92F41A0078;
	Mon,  7 Apr 2025 18:40:30 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@lists.yoctoproject.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization][m-c-s][PATCH 3/3] open-iscsi-user: fix calloc-transposed-args issue
Date: Mon,  7 Apr 2025 18:40:25 +0800
Message-Id: <20250407104025.2468-3-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250407104025.2468-1-leimaohui@fujitsu.com>
References: <20250407104025.2468-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Apr 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9205

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...Fix-the-calloc-transposed-args-issue.patch | 32 +++++++++++++++++++
 .../open-iscsi/open-iscsi-user_2.1.7.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-the-calloc-transposed-args-issue.patch

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-the-calloc-transposed-args-issue.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-the-calloc-transposed-args-issue.patch
new file mode 100644
index 00000000..3b4acd8d
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-the-calloc-transposed-args-issue.patch
@@ -0,0 +1,32 @@
+From 5a16752432b486b8e1d299142723ded284b81984 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Mon, 7 Apr 2025 06:47:46 +0000
+Subject: [PATCH] Fix the calloc-transposed-args issue
+
+| fwparam_ppc.c:349:45: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+|   349 |                         dev = calloc(sizeof(struct ofw_dev), 1);
+|       |                                             ^~~~~~
+| fwparam_ppc.c:349:45: note: earlier argument should specify number of elements, later size of each element
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/open-iscsi/pull/504]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ usr/fwparam_ibft/fwparam_ppc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/fwparam_ibft/fwparam_ppc.c b/usr/fwparam_ibft/fwparam_ppc.c
+index 7013d6c..74df13d 100644
+--- a/usr/fwparam_ibft/fwparam_ppc.c
++++ b/usr/fwparam_ibft/fwparam_ppc.c
+@@ -346,7 +346,7 @@ static int find_initiator(const char *fpath,
+ 				      "/aliases/iscsi-disk"))) {
+ 
+ 		if (dev_count < OFWDEV_MAX) {
+-			dev = calloc(sizeof(struct ofw_dev), 1);
++			dev = calloc(1, sizeof(struct ofw_dev));
+ 			if (!dev)
+ 				return -ENOMEM;
+ 
+-- 
+2.43.0
+
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
index 8d13ea44..d92404ac 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=mast
            file://0001-Makefile-Fix-build-error-of-cross-build.patch \
            file://0001-Fix-usr-bin-sed-to-sed.patch \
            file://0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch \
+           file://0001-Fix-the-calloc-transposed-args-issue.patch \
            "
 
 SRCREV = "7b53fcc502da8617110fd64d675b476772c28a6f"
-- 
2.43.0



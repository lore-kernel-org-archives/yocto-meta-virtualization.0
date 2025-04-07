Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFA8C369A2
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:40:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.44079.1744022436116769276
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 03:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=knhSpqCm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744022436; x=1775558436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rX2DKeV+7cio0MhsdhGw8SUq+ajvSsglGnWslEPnOA8=;
  b=knhSpqCmUjCf8Qb6lN5Xmsu6RGnsh80dTOlJ0p3BPPIhvWINwF/oOmXO
   S5P0wTaJlnGhCe4A9wct7tjCR686KtYkyBTIEAVyxf3vMyqXDXsRbNnDN
   9E10F3JKAgDUJ/aI04ykcElCZBcYxlDvQJAjKk2KkKHWpS4XdHGQ7tbHL
   ciqLXGWInmLX8+PwUqht90BXn7MC4A5hTPuqR7gYRe5Kkv9vyfpk6ZQAq
   oKdIpp2duQ4WhoCVhhiabjFX7MeWVipqVi+JGfia6OMwiA8XHmkJUpRvR
   PnmOOdwyYbpMzjZxtpFg3UO7AhLpqSFTWuXxwO6yL3fheRWIOxQtSYb4v
   Q==;
X-CSE-ConnectionGUID: ImkhToytR8uNZpCrU9D5gg==
X-CSE-MsgGUID: ZVVmTVQlSTGUm4zQovG7gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195646686"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195646686"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:40:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B3F7D6EA5
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1345710285
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  7 Apr 2025 19:40:31 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 798801A0071;
	Mon,  7 Apr 2025 18:40:30 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@lists.yoctoproject.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization][m-c-s][PATCH 2/3] open-iscsi-user: fix "no configure script found at ./configure"
Date: Mon,  7 Apr 2025 18:40:24 +0800
Message-Id: <20250407104025.2468-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250407104025.2468-1-leimaohui@fujitsu.com>
References: <20250407104025.2468-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Apr 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9204

1. open-iscsi's configure file is under iscsiuio/configure
2. according to open-iscsi repo README, need "autoreconf --install" when configure

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
index 1f84508f..8d13ea44 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
@@ -44,6 +44,10 @@ FILES:${PN} += " \
     ${systemd_unitdir}/system-generators/ibft-rule-generator \
 "
 
+do_configure() {
+    cd ${S}/iscsiuio; autoreconf --install
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D} prefix=${exec_prefix} LIBDIR=${libdir} sbindir=${sbindir} SBINDIR=${sbindir} systemddir=${systemd_unitdir}
 }
-- 
2.43.0



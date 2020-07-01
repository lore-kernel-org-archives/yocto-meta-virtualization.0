Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.16158.1593586810165156319
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 00:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616567"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 14:59:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EA4A94CE4BDF
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  1 Jul 2020 14:49:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 14:59:56 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] lxc: upgrade 4.0.2 > 4.0.3
Date: Wed, 1 Jul 2020 14:59:50 +0800
Message-ID: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: EA4A94CE4BDF.A6FD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 recipes-containers/lxc/{lxc_4.0.2.bb => lxc_4.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_4.0.2.bb => lxc_4.0.3.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.3.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_4.0.2.bb
rename to recipes-containers/lxc/lxc_4.0.3.bb
index d0ead81..f0fd4b9 100644
--- a/recipes-containers/lxc/lxc_4.0.2.bb
+++ b/recipes-containers/lxc/lxc_4.0.3.bb
@@ -51,8 +51,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "cc62e734c900f39d770f0de51c868aac"
-SRC_URI[sha256sum] = "ca336dcdf303fea5ff231d89a9b6278b061c4cffb14f0db0a71a15bdd95a5cb0"
+SRC_URI[md5sum] = "7d86ddf9fcb5f78ac5ae0380fbbfb690"
+SRC_URI[sha256sum] = "d56d91d772449c57e9a67b770dab8967e412051d8d6246ce56c63264671672e5"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.17.1




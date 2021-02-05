Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2777.1612492206255021888
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AB5B238C0868
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:30:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222162"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:30:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C1614CE6D8A
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:29:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:30:01 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-kafka: upgrade 2.0.1 ->2.0.2
Date: Fri, 5 Feb 2021 10:29:44 +0800
Message-ID: <1612492185-33353-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 7C1614CE6D8A.A485B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python3-kafka_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-kafka_git.bb b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
index 4fa5c2f4..e4aed01b 100644
--- a/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/mumrah/kafka-python"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 
-PV = "2.0.1+git${SRCPV}"
-SRCREV = "fcc9a30c62662cee7aa2c1f69c0d06a9741e2700"
+PV = "2.0.2+git${SRCPV}"
+SRCREV = "5bb126bf20bbb5baeb4e9afc48008dbe411631bc"
 
 SRCNAME = "kafka-python"
 
-- 
2.25.1




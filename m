Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4236.1607403577133275765
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id A013938C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 04:59:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163487"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 12:59:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 902EF4CE6000
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 12:59:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 12:59:35 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-barbicanclient: upgrade 5.0.0 -> 5.0.1
Date: Tue, 8 Dec 2020 12:59:30 +0800
Message-ID: <1607403570-56215-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 902EF4CE6000.A69F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-barbicanclient_git.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb
index 8e99a9f8..8b34708e 100644
--- a/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://github.com/openstack/python-barbicanclient.git \
 	"
 
-PV = "5.0.0+git${SRCPV}"
-SRCREV = "904fd44ca34bea7d67c203b006443af95d4fa596"
+PV = "5.0.1+git${SRCPV}"
+SRCREV = "1f0feb30ccd3b19bc23453d85d3266c85fcf04d6"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1




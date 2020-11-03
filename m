Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1046.1604389450199367684
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AB17238C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:44:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859418"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:44:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A4E54CE38AC
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:44:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:44:04 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-automaton: upgrade 0.8.0 -> 2.2.0
Date: Tue, 3 Nov 2020 15:44:00 +0800
Message-ID: <1604389440-98490-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2A4E54CE38AC.A8A26
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...{python3-automaton_0.8.0.bb => python3-automaton_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-automaton_0.8.0.bb => python3-automaton_2.2.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb b/meta-openstack/recipes-devtools/python/python3-automaton_2.2.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-automaton_2.2.0.bb
index 86be7ca..7278dcc 100644
--- a/meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-automaton_2.2.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "230a7bd8bb9a4bc9ba5a3faf0de12c90"
-SRC_URI[sha256sum] = "ca8bfbea03b9f39a536b4b261d90fbe8b1b0e1766bff5d8222e35691f8e11910"
+SRC_URI[md5sum] = "00a1c07d012dfa228ce003d7527e4a7d"
+SRC_URI[sha256sum] = "88144e0ec07c40edcb70a547ea74ca5718994e7a0694b6c4cb6679e57eb26095"
 
 inherit setuptools3 pypi
 
-- 
2.25.1




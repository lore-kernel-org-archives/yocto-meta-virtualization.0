Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1109.1604389560269463218
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C0E9838C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:45:59 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859556"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:45:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E82C4CE34F9
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:45:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:45:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-futurist: upgrade 2.2.0 -> 2.3.0
Date: Tue, 3 Nov 2020 15:45:52 +0800
Message-ID: <1604389552-98703-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4E82C4CE34F9.A798C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-futurist_2.2.0.bb => python3-futurist_2.3.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-futurist_2.2.0.bb => python3-futurist_2.3.0.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
index 4788fb2..2e63d90 100644
--- a/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "708ae19b7e3bef70b47166da1e72392c"
-SRC_URI[sha256sum] = "3601ea64e3423b169683cffff58939ecee5cd5268834b20bf2da071c2563a43c"
+SRC_URI[md5sum] = "4d642f5825a516d676356094179c6d27"
+SRC_URI[sha256sum] = "174ea146adf303d7e5d7d6d34e3a01f4abf0382b03a6f9309bac2e2d54ffbed6"
 
 inherit setuptools3 pypi
 
@@ -20,5 +20,6 @@ RDEPENDS_${PN} += " \
         python3-monotonic \
         python3-contextlib2 \
         python3-prettytable \
+        python3-multiprocessing \
         "
 
-- 
2.25.1




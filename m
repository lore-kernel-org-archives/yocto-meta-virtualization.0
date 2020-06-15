Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9736.1592190669167991635
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 20:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94485812"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 11:11:05 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B648A4CE2818
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 11:11:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 11:10:28 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-nose-exclude: change python to python3
Date: Mon, 15 Jun 2020 11:07:52 +0800
Message-ID: <1592190472-47315-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B648A4CE2818.A320D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 0.2.0 -> 0.5.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ose-exclude_0.2.0.bb => python3-nose-exclude_0.5.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-nose-exclude_0.2.0.bb => python3-nose-exclude_0.5.0.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb b/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
index 0a674c6..e07cfbf 100644
--- a/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
@@ -7,16 +7,16 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 
-SRC_URI[md5sum] = "c8d798c3e29ac82dd5c7bf98a99404af"
-SRC_URI[sha256sum] = "27babdc53e0741ed09d21b7fdb5d244aabb1679f67ef81289f0f34e50aca51c9"
+SRC_URI[md5sum] = "072f72e782f28a9c42356976f8ec22d9"
+SRC_URI[sha256sum] = "f78fa8b41eeb815f0486414f710f1eea0949e346cfb11d59ba6295ed69e84304"
 
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-nose \
+        python3-nose \
         "
 
-- 
2.17.1




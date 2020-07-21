Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.13367.1595311098148476928
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 22:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683131"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 13:58:12 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E3E054CE505C
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:58:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 13:58:09 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python3-oslo.rootwrap: Change python to python3
Date: Tue, 21 Jul 2020 13:58:10 +0800
Message-ID: <1595311098-1934-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E3E054CE505C.A4CD7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 6.1.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...rap_git.bb => python3-oslo.rootwrap_git.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.rootwrap_git.bb => python3-oslo.rootwrap_git.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.rootwrap_git.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.rootwrap_git.bb
index a7d2a22..2d311b5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.rootwrap_git.bb
@@ -4,30 +4,30 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PV = "5.9.0+git${SRCPV}"
-SRCREV = "b7b63e2ecb50ba66a1f152ae6f71dd208326fbee"
+PV = "6.1.0+git${SRCPV}"
+SRCREV = "ff61e1577c3aaec6242951876263108559d1a203"
 
 SRCNAME = "oslo.rootwrap"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
-        python-pip \
-        python-pbr \
+        python3-pip \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
+        python3-pbr \
+        python3-six \
         "
-- 
2.25.1




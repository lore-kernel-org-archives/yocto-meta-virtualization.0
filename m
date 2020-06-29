Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.11573.1593401888679739932
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 20:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95462000"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 11:38:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EC8264CE49DC
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 11:27:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 11:38:00 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-oslotest: Change python to python3
Date: Mon, 29 Jun 2020 11:37:48 +0800
Message-ID: <1593401871-17345-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: EC8264CE49DC.A4872
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 2.17.0 -> 2.17.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...slotest_git.bb => python3-oslotest_git.bb} | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslotest_git.bb => python3-oslotest_git.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb b/meta-openstack/recipes-devtools/python/python3-oslotest_git.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-oslotest_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslotest_git.bb
index 7505100..ecc0672 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslotest_git.bb
@@ -6,8 +6,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "2.17.0+git${SRCPV}"
-SRCREV = "aea2b5cfd6442195f7ee479e21664631825af924"
+PV = "2.17.2+git${SRCPV}"
+SRCREV = "54ac29c3edd46530c1ee90eb860a7e686d9a3740"
 
 SRCNAME = "oslotest"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
@@ -17,23 +17,23 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 
 DEPENDS += "\
-    python-pbr \
+    python3-pbr \
     "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
 	"
 
-RDEPENDS_${PN} = "python-fixtures \
-                  python-subunit \
-                  python-six \
-                  python-testrepository \
-                  python-testtools \
-                  python-mock \
-                  python-mox3 \
-                  python-os-client-config \
-                  python-debtcollector \
+RDEPENDS_${PN} = "python3-fixtures \
+                  python3-subunit \
+                  python3-six \
+                  python3-testrepository \
+                  python3-testtools \
+                  python3-mock \
+                  python3-mox3 \
+                  python3-os-client-config \
+                  python3-debtcollector \
                   bash \
 "
 	
-- 
2.17.1




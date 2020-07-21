Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.13187.1595311099997904247
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 22:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683139"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 13:58:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 19EFD4CE5446
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:58:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 13:58:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 1/6] python3-oslo.log: Change python to python3
Date: Tue, 21 Jul 2020 13:58:13 +0800
Message-ID: <1595311098-1934-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 19EFD4CE5446.A45F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.30.3

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...slo.log_git.bb => python3-oslo.log_git.bb} | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.log_git.bb => python3-oslo.log_git.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.log_git.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.log_git.bb
index 091ae36..308b39e 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.log_git.bb
@@ -7,35 +7,35 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 SRCNAME = "oslo.log"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "3.30.0+git${SRCPV}"
-SRCREV = "ad776e84b51223b85b7dfa85a7e77bb2f3848f4b"
+PV = "3.30.3+git${SRCPV}"
+SRCREV = "76d1dee7b80c62172ea3900b75a47edf5b64cab4"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
 DEPENDS += " \
-        python-pip \
-        python-babel \
-        python-pbr \
+        python3-pip \
+        python3-babel \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         bash \
-        python-pbr \
-        python-six \
-        python-oslo.config \
-        python-oslo.context \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-oslo.serialization \
-        python-pyinotify \
-        python-debtcollector \
-        python-dateutil \
-        python-monotonic \
+        python3-pbr \
+        python3-six \
+        python3-oslo.config \
+        python3-oslo.context \
+        python3-oslo.i18n \
+        python3-oslo.utils \
+        python3-oslo.serialization \
+        python3-pyinotify \
+        python3-debtcollector \
+        python3-dateutil \
+        python3-monotonic \
         "
-- 
2.17.1




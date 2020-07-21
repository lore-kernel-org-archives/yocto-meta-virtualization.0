Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.13220.1595311299154305133
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 23:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683363"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 14:01:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D7304CE506F
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 14:01:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 14:01:36 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 5/6] python-oslo.policy: Change python to python3
Date: Tue, 21 Jul 2020 14:01:47 +0800
Message-ID: <1595311307-2096-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 5D7304CE506F.A289A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.3.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...licy_git.bb => python3-oslo.policy_git.bb} | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.policy_git.bb => python3-oslo.policy_git.bb} (54%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.policy_git.bb
similarity index 54%
rename from meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.policy_git.bb
index 638399a..b317444 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.policy_git.bb
@@ -5,32 +5,32 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.25.1+git${SRCPV}"
-SRCREV = "cb9ab34cd40a7cd9eff0e40ccc2df4ee88edae4e"
+PV = "3.3.0+git${SRCPV}"
+SRCREV = "cab28649c689067970a51a2f9b329bdd6a0f0501"
 
 SRCNAME = "oslo.policy"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
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
 
 RDEPENDS_${PN} += " \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-six \
-        python-pyyaml \
-        python-requests \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-six \
+        python3-pyyaml \
+        python3-requests \
 "
-- 
2.25.1




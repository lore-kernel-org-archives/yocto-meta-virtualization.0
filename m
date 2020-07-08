Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.6776.1594198477558416245
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 01:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925633"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:54:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F37749B1116
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  8 Jul 2020 16:54:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:54:25 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-falcon: Change python to python3
Date: Wed, 8 Jul 2020 16:54:20 +0800
Message-ID: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 6F37749B1116.A3BBA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 0.2 -> 2.0.0

python-mimeparse is only for Python 2, so remove it.

content of README.rst is changed.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ython-falcon_0.2.bb => python3-falcon_2.0.0.bb} | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-falcon_0.2.bb => python3-falcon_2.0.0.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
index b014a72..648a7dd 100644
--- a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "An unladen web framework for building APIs and app backends."
 HOMEPAGE = "http://falconframework.org"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=2bf705a48be7b7799862ffe602c94b87"
+LIC_FILES_CHKSUM = "file://README.rst;md5=a0c7260e38287caff6c266d1f287e962"
 
-SRC_URI[md5sum] = "bf9e8bdd20700f1ff7ce6397cd441fbd"
-SRC_URI[sha256sum] = "92bb899bf6e58e2299e3b1de1e628b90c38544ba3354a0141d108318b50c3402"
+SRC_URI[md5sum] = "77c52c144dd284e6259d257c6f008072"
+SRC_URI[sha256sum] = "eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6c3d5fc"
 
 inherit setuptools3 pypi
 
@@ -15,10 +15,12 @@ do_install_append() {
 }
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-six \
-        python-mimeparse \
+        python3-six \
+        python3-json \
+        python3-xml \
+        python3-netserver \
         "
-- 
2.17.1




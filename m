Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9715.1592190550967625560
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 20:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94485726"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 11:09:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A29004CE281B
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 11:09:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 11:08:35 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-futurist: Change python to python3
Date: Mon, 15 Jun 2020 11:07:50 +0800
Message-ID: <1592190472-47315-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A29004CE281B.A34A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 1.10.0 -> 2.2.0

python-futures is only for Python 2, so remove it.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-futurist_1.10.0.bb          | 25 -------------------
 .../python/python3-futurist_2.2.0.bb          | 24 ++++++++++++++++++
 2 files changed, 24 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
deleted file mode 100644
index 4996072..0000000
--- a/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Useful additions to futures, from the future"
-HOMEPAGE = "https://pypi.python.org/pypi/futurist"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "d7f98e9a5cb09fe9706e4afcbeab1552"
-SRC_URI[sha256sum] = "139d223503d47275636285ae98e7b470085b2b3b6fb2fc9a0d04a76de4b3d30e"
-
-inherit setuptools3 pypi
-
-DEPENDS += " \
-        python-pip \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-monotonic \
-        python-futures \
-        python-contextlib2 \
-        python-prettytable \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
new file mode 100644
index 0000000..4788fb2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Useful additions to futures, from the future"
+HOMEPAGE = "https://pypi.python.org/pypi/futurist"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "708ae19b7e3bef70b47166da1e72392c"
+SRC_URI[sha256sum] = "3601ea64e3423b169683cffff58939ecee5cd5268834b20bf2da071c2563a43c"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-six \
+        python3-monotonic \
+        python3-contextlib2 \
+        python3-prettytable \
+        "
+
-- 
2.17.1




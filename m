Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.12959.1592209793696116490
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 01:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,514,1583164800"; 
   d="scan'208";a="94502389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 16:29:48 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 727D94CE2E87
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 16:29:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 16:29:49 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-osc-lib: upgrade 1.13.0 -> 2.1.0
Date: Mon, 15 Jun 2020 16:29:39 +0800
Message-ID: <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 727D94CE2E87.A5A0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-osc-lib_1.14.1.bb        | 2 --
 .../recipes-devtools/python/python3-osc-lib_1.13.0.bb       | 2 --
 .../python/{python-osc-lib.inc => python3-osc-lib_2.1.0.bb} | 6 +++---
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
 rename meta-openstack/recipes-devtools/python/{python-osc-lib.inc => python3-osc-lib_2.1.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
deleted file mode 100644
index 256c286..0000000
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-osc-lib.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
deleted file mode 100644
index 256c286..0000000
--- a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-osc-lib.inc
diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-osc-lib.inc
rename to meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
index 1767b43..db1ba03 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
+++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "240d3debc1b6eaadf5e8838f5f2d06fb"
-SRC_URI[sha256sum] = "3467a1edf62946f1b67724fa7f9c699b5e31d80b111ed9e4c7aec21633a3e30d"
+SRC_URI[md5sum] = "62d32a59bf4447191b957c6a65eff47f"
+SRC_URI[sha256sum] = "697d08204a59933035ac246fbc8c8e5453b846b4a8875ed7a9e9caba769b1b57"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-- 
2.17.1




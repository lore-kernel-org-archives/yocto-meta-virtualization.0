Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.30467.1595214846360312586
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jul 2020 20:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CB8AE01EC7; Sun, 19 Jul 2020 20:14:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA880E01EC9
	for <meta-virtualization@yoctoproject.org>; Sun, 19 Jul 2020 20:14:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96593019"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 11:13:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8D10F4CE5073
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:13:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 11:13:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-designateclient: Change to python3
Date: Mon, 20 Jul 2020 22:36:55 +0800
Message-ID: <1595255817-77606-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8D10F4CE5073.A2431
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-designateclient_git.bb      | 37 -------------------
 .../python/python3-designateclient_4.0.0.bb   | 34 +++++++++++++++++
 2 files changed, 34 insertions(+), 37 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-designateclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
deleted file mode 100644
index fdc92c2..0000000
--- a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Python bindings to the Designate API"
-HOMEPAGE = "https://github.com/openstack/python-designateclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-cliff \
-        python-jsonschema \
-        python-osc-lib \
-        python-oslo.utils \
-        python-pbr \
-        python-keystoneauth1 \
-        python-requests \
-        python-six \
-        python-stevedore \
-        python-debtcollector \
-        "
-
-SRCNAME = "designateclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
-
-PV = "3.0.0+git${SRCPV}"
-SRCREV = "093d8d7170cbf6ef8c7a7c0ff2a4dcd7ecd6361b"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb b/meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb
new file mode 100644
index 0000000..9079c87
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Python bindings to the Designate API"
+HOMEPAGE = "https://github.com/openstack/python-designateclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+SRC_URI[md5sum] = "ad4ca221c5209261cf0eaf2824b07b55"
+SRC_URI[sha256sum] = "d61e7999f0cbb55d2b6e7dec7a6232389d3034de27c1e80b7d5c69d60dd58dbf"
+
+RDEPENDS_${PN} += " \
+        python3-cliff \
+        python3-jsonschema \
+        python3-osc-lib \
+        python3-oslo.utils \
+        python3-pbr \
+        python3-keystoneauth1 \
+        python3-requests \
+        python3-six \
+        python3-stevedore \
+        python3-debtcollector \
+        "
+
+PYPI_PACKAGE = "python-designateclient"
+
+inherit setuptools3 pypi
-- 
2.25.1




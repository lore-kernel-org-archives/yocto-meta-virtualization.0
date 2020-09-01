Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3904.1598925474190455826
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 18:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12393E020F0; Mon, 31 Aug 2020 18:57:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41496E020ED
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 18:57:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98753872"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 09:57:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id ABF9E48990DE
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 09:57:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 09:57:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 1/2] python3-castellan: Change to python3
Date: Tue, 1 Sep 2020 09:57:44 +0800
Message-ID: <1598925465-78006-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598925465-78006-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598925465-78006-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ABF9E48990DE.A5DEB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3
version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-castellan_git.bb            | 40 -------------------
 .../python/python3-castellan_3.4.0.bb         | 33 +++++++++++++++
 2 files changed, 33 insertions(+), 40 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-castellan_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-castellan_git.bb b/meta-openstack/recipes-devtools/python/python-castellan_git.bb
deleted file mode 100644
index 9cc56d7..0000000
--- a/meta-openstack/recipes-devtools/python/python-castellan_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "Generic Key Manager interface for OpenStack"
-HOMEPAGE = "https://github.com/openstack/castellan"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRCNAME = "castellan"
-
-SRC_URI = "\
-	git://git.openstack.org/openstack/${SRCNAME}.git;branch=stable/pike \
-	"
-
-PV="0.12.1+git${SRCPV}"
-SRCREV="124e9296fe79412b510c73b35936a6be91267d18"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
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
-        python-pbr \
-        python-babel \
-        python-cryptography \
-        python-barbicanclient \
-        python-oslo.config \
-        python-oslo.context \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-oslo.utils \
-        python-keystoneauth1 \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb
new file mode 100644
index 0000000..062d375
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Generic Key Manager interface for OpenStack"
+HOMEPAGE = "https://github.com/openstack/castellan"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[sha256sum] = "53d39a4ae93c48d26f904f36ae2f3dedde6ad40d34b5f031c23055fff2a1d7f6"
+
+inherit setuptools3 pypi
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
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-babel \
+        python3-cryptography \
+        python3-barbicanclient \
+        python3-oslo.config \
+        python3-oslo.context \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-keystoneauth1 \
+	bash \
+        "
-- 
2.25.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4620.1598928412754911021
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97364E020F0; Mon, 31 Aug 2020 19:46:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD15CE020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:46:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755770"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:46:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 95DCC48990DB
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:46:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:46:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-django-openstack-auth: Change to python3
Date: Tue, 1 Sep 2020 10:46:45 +0800
Message-ID: <1598928405-124353-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 95DCC48990DB.AA408
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of
the recipe and change to python3.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python-django-openstack-auth_git.bb       | 32 -------------------
 .../python3-django-openstack-auth_3.6.1.bb    | 26 +++++++++++++++
 2 files changed, 26 insertions(+), 32 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-django-openstack-auth_3.6.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
deleted file mode 100644
index 75c26b0..0000000
--- a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "A Django authentication backend for use with the OpenStack Keystone backend."
-HOMEPAGE = "http://django_openstack_auth.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRCNAME = "django_openstack_auth"
-
-PV = "3.5.0+git${SRCPV}"
-SRCREV = "9e108ed426a5a1e5c9dd394b197c27d046754d0c"
-
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
-"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3 
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-django \
-        python-oslo.config \
-        python-oslo.policy \
-        python-keystoneclient \
-        python-keystoneauth1 \
-        python-six \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-django-openstack-auth_3.6.1.bb b/meta-openstack/recipes-devtools/python/python3-django-openstack-auth_3.6.1.bb
new file mode 100644
index 0000000..4e6c2d2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-django-openstack-auth_3.6.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A Django authentication backend for use with the OpenStack Keystone backend."
+HOMEPAGE = "http://django_openstack_auth.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PYPI_PACKAGE = "django_openstack_auth"
+
+SRC_URI[sha256sum] = "9a441fdea3f662fd727f020f479b3e89c96a2cc442c49539634c996a967dd378"
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
+        python3-django \
+        python3-oslo.config \
+        python3-oslo.policy \
+        python3-keystoneclient \
+        python3-keystoneauth1 \
+        python3-six \
+        "
-- 
2.25.1




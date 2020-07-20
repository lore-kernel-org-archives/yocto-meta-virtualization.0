Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.30540.1595214845824249742
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jul 2020 20:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACC7DE01ECB; Sun, 19 Jul 2020 20:14:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7EB5E01EC8
	for <meta-virtualization@yoctoproject.org>; Sun, 19 Jul 2020 20:14:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96593020"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 11:13:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 359FC4CE5075
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:13:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 11:14:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-django-appconf: upgrade 1.0.1 -> 1.0.4
Date: Mon, 20 Jul 2020 22:36:56 +0800
Message-ID: <1595255817-77606-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 359FC4CE5075.A3881
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-django-appconf_1.0.1.bb             |  2 --
 .../python/python3-django-appconf_1.0.1.bb            |  2 --
 ...go-appconf.inc => python3-django-appconf_1.0.4.bb} | 11 ++++++-----
 3 files changed, 6 insertions(+), 9 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.1.bb
 rename meta-openstack/recipes-devtools/python/{python-django-appconf.inc => python3-django-appconf_1.0.4.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
deleted file mode 100644
index 6cc57ba..0000000
--- a/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-django-appconf.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.1.bb
deleted file mode 100644
index 6cc57ba..0000000
--- a/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-django-appconf.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf.inc b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-django-appconf.inc
rename to meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
index 00f2e3e..0fb09e1 100644
--- a/meta-openstack/recipes-devtools/python/python-django-appconf.inc
+++ b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
@@ -4,10 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f34b9b2f6413fd5f91869fa7e992457"
 
-SRC_URI[md5sum] = "29c87a00f0d098b90f3ac6113ae6e52d"
-SRC_URI[sha256sum] = "ba1375fb1024e8e91547504d4392321795c989fde500b96ebc7c93884f786e60"
+SRC_URI[md5sum] = "da4a355140acaa3eeb236987ab174e9d"
+SRC_URI[sha256sum] = "be58deb54a43d77d2e1621fe59f787681376d3cd0b8bd8e4758ef6c3a6453380"
 
-inherit pypi
+inherit setuptools3 pypi
 
-#RDEPENDS_${PN} += "${PYTHON_PN}-six \
-#	"
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-django \
+	"
-- 
2.25.1




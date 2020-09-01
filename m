Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3885.1598925420265450385
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 18:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3020E020EF; Mon, 31 Aug 2020 18:56:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1717CE020ED
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 18:56:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98753834"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 09:56:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DF0E848990DC
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 09:56:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 09:56:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-django: Remove recipe
Date: Tue, 1 Sep 2020 09:56:50 +0800
Message-ID: <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DF0E848990DC.A3CA2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of the recipe.
The python3 version already exists, located at:
meta-openembedded/meta-python/recipes-devtools/python/python3-django_2.2.13.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-django_git.bb               | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-django_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-django_git.bb b/meta-openstack/recipes-devtools/python/python-django_git.bb
deleted file mode 100644
index 2008604..0000000
--- a/meta-openstack/recipes-devtools/python/python-django_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "A high-level Python Web framework"
-HOMEPAGE = "http://www.djangoproject.com/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
-
-SRCNAME = "Django"
-
-PV = "1.8.6"
-SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
-
-SRC_URI = " \
-    git://github.com/django/django.git;branch=stable/1.8.x \
-    "
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-FILES_${PN} += "${datadir}/django/*"
-
-- 
2.25.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.30927.1595214845913227122
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jul 2020 20:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC502E01EC8; Sun, 19 Jul 2020 20:14:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E243E01EC7
	for <meta-virtualization@yoctoproject.org>; Sun, 19 Jul 2020 20:14:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96593018"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 11:13:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E103F4CE5070
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:13:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 11:14:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-django-babel: Change to python3
Date: Mon, 20 Jul 2020 22:36:57 +0800
Message-ID: <1595255817-77606-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E103F4CE5070.A1474
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...l_git.bb => python3-django-babel_0.6.2.bb} | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-babel_git.bb => python3-django-babel_0.6.2.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-babel_git.bb b/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-django-babel_git.bb
rename to meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
index 3f4f9e3..80c5405 100644
--- a/meta-openstack/recipes-devtools/python/python-django-babel_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
@@ -4,24 +4,17 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ae97ab65116b8d7890c59de57577b46"
 
-SRCNAME = "django-babel"
+inherit setuptools3 pypi
 
-PV = "0.5.1+git${SRCPV}"
-SRCREV = "88b389381c0e269605311ae07029555b65a86bc5"
-
-SRC_URI = "git://github.com/python-babel/${SRCNAME}.git \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
+SRC_URI[md5sum] = "a5483952426d1cd749e7204902b34d63"
+SRC_URI[sha256sum] = "1e621b198e1f98ae4f93e43463cf78cbedbace475eb6e0853ba1e2567f3b8119"
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-django \
-        python-babel \
+        python3-django \
+        python3-babel \
         "
 
-- 
2.25.1




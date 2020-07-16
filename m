Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.11203.1594887217706205933
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B17BE01E8C; Thu, 16 Jul 2020 01:13:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E735CE01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:13:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:13:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D00C94CE2808
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:13:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:13:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ceilcmeterclient: Remove this recipe
Date: Fri, 17 Jul 2020 03:40:16 +0800
Message-ID: <1594928416-4078-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D00C94CE2808.A20CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

This project is no longer maintained.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-ceilometerclient_git.bb     | 51 -------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
deleted file mode 100644
index 5e5e43e..0000000
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "CLI and python client library for OpenStack Ceilometer"
-HOMEPAGE = "https://launchpad.net/ceilometer"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
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
-        python-iso8601 \
-        python-keystoneauth1 \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-prettytable \
-        python-requests \
-        python-six \
-        python-stevedore \
-        bash \
-        "
-
-SRC_URI = "\
-	git://github.com/openstack/python-ceilometerclient.git;branch=stable/pike \
-	"
-
-PV = "2.9.1"
-SRCREV = "4ee321feeef39fa2a297ad8e58e931b8a03d8f14"
-S = "${WORKDIR}/git"
-
-inherit setuptools3 rmargparse
-
-
-PACKAGECONFIG ?= "bash-completion"
-PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/bash_completion.d
-	install -m 664 ${S}/tools/ceilometer.bash_completion ${D}/${sysconfdir}/bash_completion.d
-}
-
-PACKAGES =+ "${BPN}-bash-completion"
-FILES_${BPN}-bash-completion = "${sysconfdir}/bash_completion.d/*"
-- 
2.25.1




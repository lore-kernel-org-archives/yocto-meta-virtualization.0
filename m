Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.3581.1605586516546028491
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 20:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0F6F838C0836
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 04:15:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,484,1596470400"; 
   d="scan'208";a="101443880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Nov 2020 12:15:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 338594CE5059
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 12:15:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Nov 2020 12:15:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-futures: Remove recipe
Date: Wed, 18 Nov 2020 00:15:09 +0800
Message-ID: <1605629709-107584-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 338594CE5059.AEBD3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

| This backport is meant only for Python 2.
| It does not work on Python 3, and Python 3 users do not need it as the concurrent.futures package is available in the standard library.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-futures_git.bb              | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-futures_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-futures_git.bb b/meta-openstack/recipes-devtools/python/python-futures_git.bb
deleted file mode 100644
index 493aef17..00000000
--- a/meta-openstack/recipes-devtools/python/python-futures_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Backport of the concurrent.futures package from Python 3.2"
-HOMEPAGE = "https://github.com/agronholm/pythonfutures"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd6708d05936d3f6c4e20ed14c87b5e3"
-
-PV = "3.3.0+git${SRCPV}"
-SRCREV = "ec78e222ece60721fc92a6c650df3116cb15d24e"
-
-SRCNAME = "futures"
-SRC_URI = "git://github.com/agronholm/python${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
-- 
2.25.1




Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.11487.1603164593140306439
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 20:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9EAC938C0853
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 20:29:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316569"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:29:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8711548990FF
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 11:29:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:29:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-rickshaw: change to python3
Date: Tue, 20 Oct 2020 11:29:46 +0800
Message-ID: <1603164586-37810-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8711548990FF.A130E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...haw_1.5.0.0.bb => python3-xstatic-rickshaw_1.5.1.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-rickshaw_1.5.0.0.bb => python3-xstatic-rickshaw_1.5.1.0.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-rickshaw_1.5.1.0.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-rickshaw_1.5.1.0.bb
index f3698bf..d95a982 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-rickshaw_1.5.1.0.bb
@@ -2,19 +2,19 @@ DESCRIPTION = "Rickshaw JavaScript library packaged for setuptools3"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Rickshaw"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af85a1450add1a38e6ff5ca1384cc1b6"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0048c87aa2dfc6c21a4516c06867ad67"
 
 PYPI_PACKAGE = "XStatic-Rickshaw"
 
-SRC_URI[md5sum] = "789fffdced10e93e10f75ce1ade6fc6c"
-SRC_URI[sha256sum] = "147574228757254442700a9eea5150f14acb1224ef0612f896b663ab58406de8"
+SRC_URI[md5sum] = "aef17022c8a0ea3d9e2da6237d5175ef"
+SRC_URI[sha256sum] = "cf278d4bd4e974ddcf7170d20bbb706cc34f93cf61658f2f68f3138374178564"
 
 inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1




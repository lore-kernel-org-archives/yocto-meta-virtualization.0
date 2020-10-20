Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.11494.1603164611357719965
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 20:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C4EE838C0853
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 20:30:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316582"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:30:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 40BE048990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 11:30:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:30:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-spin: change to python3
Date: Tue, 20 Oct 2020 11:30:00 +0800
Message-ID: <1603164600-37872-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 40BE048990CC.A097E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ic-spin_1.2.5.2.bb => python3-xstatic-spin_1.2.5.3.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-spin_1.2.5.2.bb => python3-xstatic-spin_1.2.5.3.bb} (58%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
index 4060bd9..66bd986 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
@@ -2,19 +2,19 @@ DESCRIPTION = "Spin JavaScript library packaged for setuptools3"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Spin"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=322c2399a1682aaec2f4e5fff4be5726"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=45c30e2aa7df682a626f8e3629b8f7ee"
 
 PYPI_PACKAGE = "XStatic-Spin"
 
-SRC_URI[md5sum] = "df83f80fd0b11545b64497112996e49e"
-SRC_URI[sha256sum] = "7f46ef0e45e047019ba6eda22c432fb96f681b97bbe7f1749aa9209e07727192"
+SRC_URI[md5sum] = "d0cad2593c74eec38dbeed5161eab462"
+SRC_URI[sha256sum] = "06e889cf3318f08ce74ef888b45d9f1e09017bb8e6d519a299c10a9e6b542642"
 
 inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1




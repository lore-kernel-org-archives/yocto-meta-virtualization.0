Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1633.1603176116848428165
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7808138C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:41:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100321971"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:41:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B52C48990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:41:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:41:48 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.privsep: change to python3
Date: Tue, 20 Oct 2020 14:41:36 +0800
Message-ID: <1603176096-40364-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5B52C48990D3.A5486
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...sep_git.bb => python3-oslo.privsep_git.bb} | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.privsep_git.bb => python3-oslo.privsep_git.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.privsep_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.privsep_git.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-oslo.privsep_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.privsep_git.bb
index 463f95e..27da695 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.privsep_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.privsep_git.bb
@@ -5,32 +5,31 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "oslo.privsep"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "1.22.1+git${SRCPV}"
-SRCREV = "d27bb5371c90e0f8b1bdf1bc24f16e1532b3e595"
+PV = "2.4.0+git${SRCPV}"
+SRCREV = "512b5d9f6b79b798474d8bb2dac2462b0f705cb9"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
 DEPENDS += " \
-        python-pbr \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 # RDEPENDS_default:
 RDEPENDS_${PN} += " \
-        python-oslo.log \
-        python-oslo.i18n \
-        python-oslo.config \
-        python-oslo.utils \
-        python-enum34 \
-        python-cffi \
-        python-eventlet \
-        python-greenlet \
-        python-msgpack \
+        python3-oslo.log \
+        python3-oslo.i18n \
+        python3-oslo.config \
+        python3-oslo.utils \
+        python3-cffi \
+        python3-eventlet \
+        python3-greenlet \
+        python3-msgpack \
         "
-- 
2.25.1




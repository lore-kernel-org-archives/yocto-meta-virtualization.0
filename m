Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1068.1596528748982776552
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 01:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4763E01F80; Tue,  4 Aug 2020 01:12:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D043DE01F7C
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 01:12:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; 
   d="scan'208";a="97579917"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 16:12:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A7E414CE5447
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 16:12:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 16:12:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-sysv-ipc: upgrade 0.6.8 -> 1.0.1
Date: Wed, 5 Aug 2020 01:12:21 +0800
Message-ID: <1596561141-7862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A7E414CE5447.A8E66
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../recipes-devtools/python/python-sysv-ipc_0.6.8.bb   |  2 --
 .../recipes-devtools/python/python3-sysv-ipc_0.6.8.bb  |  2 --
 .../{python-sysv-ipc.inc => python3-sysv-ipc_1.0.1.bb} | 10 ++++------
 3 files changed, 4 insertions(+), 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
 rename meta-openstack/recipes-devtools/python/{python-sysv-ipc.inc => python3-sysv-ipc_1.0.1.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
deleted file mode 100644
index 0e3dcd1..0000000
--- a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-sysv-ipc.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
deleted file mode 100644
index 0e3dcd1..0000000
--- a/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-sysv-ipc.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_1.0.1.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
rename to meta-openstack/recipes-devtools/python/python3-sysv-ipc_1.0.1.bb
index 47ecf2c..ac5931f 100644
--- a/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
+++ b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_1.0.1.bb
@@ -2,16 +2,14 @@ DESCRIPTION = "System V IPC primitives (semaphores, shared memory and message qu
 HOMEPAGE = "http://semanchuk.com/philip/sysv_ipc/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9d6e34e7b47096d7c19c1e3be707374e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4f09db8030b38bf57a442088a5a521ff"
 
 PYPI_PACKAGE = "sysv_ipc"
 
-SRC_URI[md5sum] = "c6cf5b4aa7cd3e07fd4b5661530eca8c"
-SRC_URI[sha256sum] = "0af73375a85c5d9d487c2f14f208812600bd81e4046437ebaf55746b3aade00e"
+SRC_URI[md5sum] = "9ef5167ed58a5a09e637cdfaeb8099d7"
+SRC_URI[sha256sum] = "8eff10dd17789ddf21b422ce46ae0f6420088902a88e4296cb805cf2fde8b4dc"
 
-inherit pypi
-
-# DEPENDS_default: python-pip
+inherit setuptools3 pypi
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
-- 
2.25.1




Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1615.1603176728899421325
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6810438C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:52:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322422"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:52:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 95DB248990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:51:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:51:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-singledispatch: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:51:54 +0800
Message-ID: <1603176714-40980-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 95DB248990D3.A14DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-singledispatch.inc                 | 10 ----------
 .../python/python3-singledispatch_3.4.0.3.bb         | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-singledispatch.inc

diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch.inc b/meta-openstack/recipes-devtools/python/python-singledispatch.inc
deleted file mode 100644
index 3ea5026..0000000
--- a/meta-openstack/recipes-devtools/python/python-singledispatch.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "functools.singledispatch from Python 3.4 to Python 2.6"
-HOMEPAGE = "https://pypi.python.org/pypi/singledistpatch"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
-
-SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
-SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
index 0f4b483..975d308 100644
--- a/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
@@ -1,2 +1,10 @@
-require python-singledispatch.inc
-inherit setuptools3
+DESCRIPTION = "functools.singledispatch from Python 3.4 to Python 2.6"
+HOMEPAGE = "https://pypi.python.org/pypi/singledistpatch"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
+
+SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
+SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
+
+inherit setuptools3 pypi
-- 
2.25.1




Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.30278.1606108247939849419
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6711A38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:10:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:10:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8A9804CE546D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:10:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:10:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 2/5] python3-munch: Add recipe
Date: Mon, 23 Nov 2020 22:51:41 +0800
Message-ID: <1606143101-96777-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8A9804CE546D.A1DD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Append python3-munch because it is dependent on python3-openstacksdk runtime.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-munch_2.5.0.bb             | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-munch_2.5.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python3-munch_2.5.0.bb b/meta-openstack/recipes-devtools/python/python3-munch_2.5.0.bb
new file mode 100644
index 00000000..58f40d00
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-munch_2.5.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "munch is a fork of David Schoonover's Bunch package, providing similar functionality"
+HOMEPAGE = "https://pypi.org/project/munch/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0291cd32b2d6a91d9b19970c94d0a46"
+
+SRC_URI[md5sum] = "ed84c3718416c8d4d03d0a6ef46e8e0c"
+SRC_URI[sha256sum] = "2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-pbr-native \
+"
+
+RDEPENDS_${PN} += " \
+	python3-pkg-resources \
+	python3-six \
+"
-- 
2.25.1




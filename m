Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30532.1606108435158707731
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id A43D638C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:13:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644561"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:13:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DDCB94CE5464
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:13:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:13:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 4/5] python3-os-service-types: Add recipe
Date: Mon, 23 Nov 2020 22:54:53 +0800
Message-ID: <1606143293-97302-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DDCB94CE5464.A32BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Append python3-os-service-types because it is dependent on python3-openstacksdk runtime.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-os-service-types_1.7.0.bb    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-service-types_1.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python3-os-service-types_1.7.0.bb b/meta-openstack/recipes-devtools/python/python3-os-service-types_1.7.0.bb
new file mode 100644
index 00000000..a686d6aa
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-service-types_1.7.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python library for consuming OpenStack sevice-types-authority data"
+HOMEPAGE = "https://pypi.org/project/os-service-types/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[sha256sum] = "31800299a82239363995b91f1ebf9106ac7758542a1e4ef6dc737a5932878c6c"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+	python3-pbr \
+	"
-- 
2.25.1




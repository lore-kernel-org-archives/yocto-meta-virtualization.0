Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8821.1604911603326452114
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 00:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AE1D938C0883
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 00:46:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; 
   d="scan'208";a="101087707"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 16:46:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B386D4CE3A62
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 16:46:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 16:46:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 1/2] python3-backlash: Add recipe
Date: Mon, 9 Nov 2020 16:46:06 +0800
Message-ID: <1604911566-65656-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B386D4CE3A62.A23D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Append python3-backlash because it is dependent on python3-pecan
runtime.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-backlash_0.3.1.bb          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-backlash_0.3.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python3-backlash_0.3.1.bb b/meta-openstack/recipes-devtools/python/python3-backlash_0.3.1.bb
new file mode 100644
index 00000000..b83a23f9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-backlash_0.3.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "backlash is a swiss army knife for web applications debugging"
+HOMEPAGE = "https://pypi.org/project/backlash/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ca5c23eefc8077a81d9c7b5384f38be8"
+
+SRC_URI[md5sum] = "c80c065e33b6891c5e5ac70ac3a2551c"
+SRC_URI[sha256sum] = "ddf6e1d59ce30deb190478c98ade84557ee9333435fbd377c011588c71f862a0"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+	python3-netclient \
+	python3-netserver \
+	python3-json \
+	python3-webob \
+	python3-threading \
+	python3-logging \
+"
-- 
2.25.1




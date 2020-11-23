Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.30293.1606108356891733000
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5187C38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:12:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:12:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CA0E4CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:12:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:12:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 3/5] python3-jmespath: Add recipe
Date: Mon, 23 Nov 2020 22:53:37 +0800
Message-ID: <1606143217-97140-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6CA0E4CE1505.A10DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Append python3-jmespath because it is dependent on python3-openstacksdk runtime.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-jmespath_0.10.0.bb            | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-jmespath_0.10.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python3-jmespath_0.10.0.bb b/meta-openstack/recipes-devtools/python/python3-jmespath_0.10.0.bb
new file mode 100644
index 00000000..3a9a8e6f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-jmespath_0.10.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "JSON Matching Expressions"
+HOMEPAGE = "https://pypi.org/project/jmespath/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2683790f5fabb41a3f75b70558799eb4"
+
+SRC_URI[md5sum] = "65bdcb5fa5bcf1cc710ffa508e78e408"
+SRC_URI[sha256sum] = "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+	python3-math \
+	python3-json \
+	python3-numbers \
+"
-- 
2.25.1




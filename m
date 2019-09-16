Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91762E00D33; Sun, 15 Sep 2019 19:39:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A086FE007C9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 19:39:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75502076"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 10:39:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D70A84CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 10:39:04 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 10:39:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 10:39:11 +0800
Message-ID: <20190916023911.2653-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D70A84CE14E1.A9778
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-amqplib: Add python3 version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2019 02:39:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-amqplib.inc          | 16 ++++++++++++++++
 .../recipes-devtools/python/python-amqplib_1.0.2.bb     | 17 +----------------
 .../recipes-devtools/python/python3-amqplib_1.0.2.bb    |  2 ++
 3 files changed, 19 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-amqplib.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-amqplib.inc b/meta-openstack/recipes-devtools/python/python-amqplib.inc
new file mode 100644
index 0000000..d9f22cb
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-amqplib.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
+HOMEPAGE = "http://code.google.com/p/py-amqplib/"
+SECTION = "devel/python"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
+
+PR = "r1"
+SRCNAME = "amqplib"
+
+SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
+SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
+
+S = "${WORKDIR}/py-amqplib-${PV}"
+
diff --git a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
index 1afc76e..a39284a 100644
--- a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
-HOMEPAGE = "http://code.google.com/p/py-amqplib/"
-SECTION = "devel/python"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
-
-PR = "r1"
-SRCNAME = "amqplib"
-
-SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
-
-SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
-SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
-
-S = "${WORKDIR}/py-amqplib-${PV}"
-
 inherit setuptools
+require python-amqplib.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
new file mode 100644
index 0000000..7623d17
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-amqplib.inc
-- 
2.7.4





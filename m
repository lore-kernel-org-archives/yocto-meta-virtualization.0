Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32B79E00DE3; Tue,  3 Sep 2019 19:46:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2615E00DFB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 19:46:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="74794970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 10:46:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5DE494CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 10:46:21 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019 10:46:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Sep 2019 10:45:49 +0800
Message-ID: <20190904024549.2526-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5DE494CE14E1.A9B23
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-eventlet: Add python3 version
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
X-List-Received-Date: Wed, 04 Sep 2019 02:46:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-eventlet.inc   | 10 ++++++++++
 .../recipes-devtools/python/python-eventlet_0.25.1.bb        | 12 ++----------
 .../recipes-devtools/python/python3-eventlet_0.25.1.bb       |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-eventlet.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet.inc b/meta-openstack/recipes-devtools/python/python-eventlet.inc
new file mode 100644
index 0000000..fd1bf39
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-eventlet.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Highly concurrent networking library"
+HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
+
+SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
+SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
index d2878b6..d9c9383 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
@@ -1,10 +1,2 @@
-DESCRIPTION = "Highly concurrent networking library"
-HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
-
-SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
-SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
-
-inherit setuptools pypi
+inherit setuptools
+require python-eventlet.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb b/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb
new file mode 100644
index 0000000..c5fe598
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-eventlet_0.25.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-eventlet.inc
-- 
2.7.4





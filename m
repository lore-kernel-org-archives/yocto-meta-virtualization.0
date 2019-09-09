Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC29AE00DCE; Mon,  9 Sep 2019 00:43:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8471BE00DAA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 00:43:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,484,1559491200"; d="scan'208";a="75157547"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 15:43:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 233474CE14F3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 15:43:42 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 15:43:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 15:43:16 +0800
Message-ID: <20190909074316.14023-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 233474CE14F3.A5AC6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-statsd: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 07:43:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-statsd.inc  | 13 +++++++++++++
 .../recipes-devtools/python/python-statsd_3.3.0.bb        | 15 +--------------
 .../recipes-devtools/python/python3-statsd_3.3.0.bb       |  2 ++
 3 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-statsd.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-statsd.inc b/meta-openstack/recipes-devtools/python/python-statsd.inc
new file mode 100644
index 0000000..33257b9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-statsd.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "A simple statsd client."
+HOMEPAGE = "https://github.com/jsocol/pystatsd"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
+
+inherit pypi
+
+SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
+SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
index 7400129..51b179b 100644
--- a/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
@@ -1,15 +1,2 @@
-DESCRIPTION = "A simple statsd client."
-HOMEPAGE = "https://github.com/jsocol/pystatsd"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
-
-inherit pypi
-
-SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
-SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
-
 inherit setuptools
-
-RDEPENDS_${PN} += " \
-        "
+require python-statsd.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
new file mode 100644
index 0000000..51b179b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-statsd.inc
-- 
2.7.4





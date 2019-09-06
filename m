Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04F88E00E39; Thu,  5 Sep 2019 22:44:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C53E00D83
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 22:44:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,472,1559491200"; d="scan'208";a="74927611"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2019 13:44:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 33D5F4CDE64D
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Sep 2019 13:44:15 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019 13:44:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 6 Sep 2019 13:43:44 +0800
Message-ID: <20190906054344.19107-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 33D5F4CDE64D.AA54A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-waitress: Add python3 version
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
X-List-Received-Date: Fri, 06 Sep 2019 05:44:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-waitress.inc   | 10 ++++++++++
 .../recipes-devtools/python/python-waitress_1.3.1.bb         | 12 ++----------
 .../recipes-devtools/python/python3-waitress_1.3.1.bb        |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-waitress.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-waitress.inc b/meta-openstack/recipes-devtools/python/python-waitress.inc
new file mode 100644
index 0000000..1053983
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-waitress.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Waitress WSGI server"
+HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
+SECTION = "devel/python"
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
+
+SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
+SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
index 78af225..ecce64c 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
@@ -1,10 +1,2 @@
-DESCRIPTION = "Waitress WSGI server"
-HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
-SECTION = "devel/python"
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
-
-SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
-SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
-
-inherit setuptools pypi
+inherit setuptools
+require python-waitress.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
new file mode 100644
index 0000000..89e8208
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-waitress.inc
-- 
2.7.4





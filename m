Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D291E00E01; Thu, 29 Aug 2019 23:33:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B39CE009EA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 23:33:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,446,1559491200"; d="scan'208";a="74571534"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 14:33:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5525A4CE089F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 14:33:02 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 30 Aug 2019 14:33:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 14:32:28 +0800
Message-ID: <20190830063228.19117-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5525A4CE089F.A8FB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-netifaces: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 06:33:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-netifaces.inc  | 10 ++++++++++
 .../recipes-devtools/python/python-netifaces_0.10.9.bb       | 12 ++----------
 .../recipes-devtools/python/python3-netifaces_0.10.9.bb      |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-netifaces.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb

diff --git a/meta-openstack/recipes-devtools/python/python-netifaces.inc b/meta-openstack/recipes-devtools/python/python-netifaces.inc
new file mode 100644
index 0000000..b1b1ed5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-netifaces.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Portable network interface information."
+HOMEPAGE = "http://alastairs-place.net/netifaces"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
+SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
index 05f5f4a..aa9760b 100644
--- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -1,10 +1,2 @@
-DESCRIPTION = "Portable network interface information."
-HOMEPAGE = "http://alastairs-place.net/netifaces"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
-SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
-
-inherit setuptools pypi
+inherit setuptools
+require python-netifaces.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
new file mode 100644
index 0000000..a46326f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-netifaces.inc
-- 
2.7.4





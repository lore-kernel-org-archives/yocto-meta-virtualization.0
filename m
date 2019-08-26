Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD3A6E00D5F; Mon, 26 Aug 2019 00:38:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34DCAE00D4F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 00:38:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74283025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 15:38:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 58E834CE0457
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 15:37:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 15:38:08 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 15:37:57 +0800
Message-ID: <1566805077-116548-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 58E834CE0457.A6F40
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
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
X-List-Received-Date: Mon, 26 Aug 2019 07:38:07 -0000
Content-Type: text/plain

Providing a python3 version of python-netifaces.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-netifaces.inc     | 10 ++++++++++
 .../python/python-netifaces_0.10.9.bb                | 12 ++----------
 .../python/python3-netifaces_0.10.9.bb               |  2 ++
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
2.17.1





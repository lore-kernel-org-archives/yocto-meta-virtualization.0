Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99CE1E00DED; Wed,  4 Sep 2019 20:48:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CD80E00C46
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 20:48:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74870415"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 11:48:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AE72A4CE042F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 11:48:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 11:48:11 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 5 Sep 2019 12:47:46 +0900
Message-ID: <20190905034746.40089-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: AE72A4CE042F.A19D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-pastedeploy: upgrade 1.5.2 -> 2.0.1
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
X-List-Received-Date: Thu, 05 Sep 2019 03:48:14 -0000
Content-Type: text/plain

License File docs/license.txt lost, use PKG-INFO instead.

Add dependency on python-pytest-runner-native.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/python-pastedeploy_1.5.2.bb           | 14 --------------
 .../python/python-pastedeploy_2.0.1.bb           | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
deleted file mode 100644
index c908ccd..0000000
--- a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
-HOMEPAGE = "http://pythonpaste.org/deploy/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
-
-PYPI_PACKAGE = "PasteDeploy"
-
-SRC_URI[md5sum] = "352b7205c78c8de4987578d19431af3b"
-SRC_URI[sha256sum] = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += "python-paste"
diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
new file mode 100644
index 0000000..65668fa
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "http://pythonpaste.org/deploy/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d6c3089319205d7e6129f0213b7e949f"
+
+PYPI_PACKAGE = "PasteDeploy"
+
+SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
+SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
+
+inherit setuptools pypi
+
+DEPENDS += "python-pytest-runner-native"
+
+RDEPENDS_${PN} += "python-paste"
-- 
2.17.1





Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D80E1E00D19; Fri,  1 Dec 2017 12:19:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37F79E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:48 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB1KJmcF028337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:48 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:36 -0500
Message-ID: <1512159582-6858-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/7] python-sqlparse: uprev to v0.2.4
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
X-List-Received-Date: Fri, 01 Dec 2017 20:19:49 -0000
Content-Type: text/plain

This update is required to support the stable/pike version of
python-glance.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-sqlparse_0.1.16.bb               | 22 ----------------------
 .../python/python-sqlparse_0.2.4.bb                | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
deleted file mode 100644
index 93f7210..0000000
--- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Non-validating SQL parser module"
-HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
-
-SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
-SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
-
-export BUILD_SYS
-export HOST_SYS
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb
new file mode 100644
index 0000000..b253af4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Non-validating SQL parser module"
+HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
+
+SRC_URI[md5sum] = "8f753105167f35ea94ae6387e8af152f"
+SRC_URI[sha256sum] = "ce028444cfab83be538752a2ffdb56bc417b7784ff35bb9a3062413717807dec"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.7.4



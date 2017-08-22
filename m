Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F9C8E00DEA; Tue, 22 Aug 2017 10:01:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3D27E00CF5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:01:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7MH15fc003194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:01:06 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 10:01:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 13:00:57 -0400
Message-ID: <1503421257-21181-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-positional: use archived tarball
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
X-List-Received-Date: Tue, 22 Aug 2017 17:01:08 -0000
Content-Type: text/plain

The upstream project has been discontinued as you can see from the
comment from the developer in response to another pkg which used
positional:
https://github.com/conda-forge/positional-feedstock/issues/7

In addition to discontinuing the project the developer removed the
repository, so we need to use the version archived via pypi. We can't
simply drop the package as it is used by python-nova and other
openstack components.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-positional_1.1.1.bb              | 22 ++++++++++++++++++++++
 .../python/python-positional_git.bb                | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-positional_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
new file mode 100644
index 0000000..c2dc44c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Library to enforce positional or key-word arguments"
+HOMEPAGE = "https://github.com/morganfainberg/positional"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
+
+SRCNAME = "positional"
+SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
+SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    python-wrapt \
+"
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python-positional_git.bb b/meta-openstack/recipes-devtools/python/python-positional_git.bb
deleted file mode 100644
index 821d704..0000000
--- a/meta-openstack/recipes-devtools/python/python-positional_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Library to enforce positional or key-word arguments"
-HOMEPAGE = "https://github.com/morganfainberg/positional"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
-
-SRCNAME = "positional"
-SRC_URI = "git://github.com/morganfainberg/positional \
-"
-
-PV = "1.1.1+git${SRCPV}"
-SRCREV = "1f5e9fc0f50e9e774fc4db27f97f9acae5f0c29f"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-CLEANBROKEN = "1"
-
-RDEPENDS_${PN} += " \
-    python-wrapt \
-"
\ No newline at end of file
-- 
2.7.4



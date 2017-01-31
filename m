Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08DCBE0082A; Mon, 30 Jan 2017 19:16:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50986E0071C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 19:16:22 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0V3GLi3010819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 19:16:21 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 19:16:20 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 30 Jan 2017 22:16:17 -0500
Message-ID: <1485832577-30236-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-alembic: uprev to 0.8.10
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
X-List-Received-Date: Tue, 31 Jan 2017 03:16:26 -0000
Content-Type: text/plain

This uprev is required to support python-oslo.db uprev to
stable/newton. The license is still MIT though the md5sum required
being updated. Runtime dependencies were updated based on
requires.txt.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-alembic_0.8.10.bb                | 23 ++++++++++++++++++++++
 .../python/python-alembic_0.8.3.bb                 | 22 ---------------------
 2 files changed, 23 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
new file mode 100644
index 0000000..69fa495
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A database migration tool for SQLAlchemy."
+HOMEPAGE = "http://bitbucket.org/zzzeek/alembic"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d07407716fd24408b5747b0fa2262775"
+
+SRCNAME = "alembic"
+
+SRC_URI = "https://pypi.io/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "21b344a70ce637699c18bf074a080649"
+SRC_URI[sha256sum] = "0e3b50e96218283ec7443fb661199f5a81f5879f766967a8a2d25e8f9d4e7919"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools 
+
+RDEPENDS_${PN} += " \
+    python-sqlalchemy \
+    python-mako \
+    python-python-editor \
+    "
+
diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb
deleted file mode 100644
index 01214e4..0000000
--- a/meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "A database migration tool for SQLAlchemy."
-HOMEPAGE = "http://bitbucket.org/zzzeek/alembic"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8faea05c89b6ff4ad5a9fa082f540719"
-
-SRCNAME = "alembic"
-
-SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "2e4ef17675316af9f09d749b0aee390e"
-SRC_URI[sha256sum] = "eeac36589c1bf393e2040de01514a0d101ef17039957300209b0b44f3ddffce9"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools 
-
-RDEPENDS_${PN} += " \
-    python-sqlalchemy \
-    python-python-editor \
-    "
-
-- 
2.7.4



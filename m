Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18348E0098A; Wed, 18 Jan 2017 00:37:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 887D3E00942
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 00:36:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14872371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2017 16:36:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 62DEC47D1541
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 16:36:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 18 Jan 2017 16:36:55 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 18 Jan 2017 16:36:48 +0800
Message-ID: <1484728608-28908-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 62DEC47D1541.A6C95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] python-sqlalchemy: 1.0.9 -> 1.1.5
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
X-List-Received-Date: Wed, 18 Jan 2017 08:37:00 -0000
Content-Type: text/plain

1) Upgrade python-sqlalchemy from 1.0.9 to 1.1.5.
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-devtools/python/python-sqlalchemy_1.0.9.bb | 16 ----------------
 recipes-devtools/python/python-sqlalchemy_1.1.5.bb | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 recipes-devtools/python/python-sqlalchemy_1.0.9.bb
 create mode 100644 recipes-devtools/python/python-sqlalchemy_1.1.5.bb

diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
deleted file mode 100644
index 01c94a5..0000000
--- a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cf755cb27ad4331d45dbb4db5172fd33"
-RDEPENDS_${PN} += "python-numbers"
-
-SRCNAME = "SQLAlchemy"
-SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
-SRC_URI[sha256sum] = "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
new file mode 100644
index 0000000..63caeb4
--- /dev/null
+++ b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
+RDEPENDS_${PN} += "python-numbers"
+
+SRCNAME = "SQLAlchemy"
+SRC_URI = "https://pypi.python.org/packages/da/04/8048a5075d6e29235bbd6f1ea092a38dbe2630c670e73d4aa923a4e5521c/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
+SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.7.4





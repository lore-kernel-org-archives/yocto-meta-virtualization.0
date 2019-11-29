Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5031.1575005460325412842
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 21:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DABD1E010B5; Thu, 28 Nov 2019 21:30:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38F13E010B1
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 21:30:58 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,256,1571673600"; 
   d="scan'208";a="79253403"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 13:30:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0AAB74CE1BED
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 13:22:34 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 13:30:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-i18n: Add python3 version
Date: Fri, 29 Nov 2019 13:31:45 +0800
Message-ID: <20191129053145.23536-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0AAB74CE1BED.AE4D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-i18n.inc   | 23 +++++++++++++++++
 .../python/python-i18n_0.3.1.bb               | 25 ++-----------------
 .../python/python3-i18n_0.3.1.bb              |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-i18n.in=
c
 create mode 100644 meta-openstack/recipes-devtools/python/python3-i18n_0=
.3.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-i18n.inc b/met=
a-openstack/recipes-devtools/python/python-i18n.inc
new file mode 100644
index 0000000..74200e7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-i18n.inc
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "Translation library for Python"
+HOMEPAGE =3D "https://github.com/tuvistavie/python-i18n"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://README.md;md5=3D7624ac071dec291ca8ef74e62e5=
36a7a"
+
+PYPI_PACKAGE =3D "python-i18n"
+
+SRC_URI[md5sum] =3D "08b8c247add9f90806c4742a685fdb88"
+SRC_URI[sha256sum] =3D "e1d832ff7d1d39ce593793cc709b2344aa8fdf321cf70708=
1335f146160d9f20"
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default:=20
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-pyyaml \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb =
b/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
index f14e7a8..3e0acdd 100644
--- a/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
@@ -1,23 +1,2 @@
-DESCRIPTION =3D "Translation library for Python"
-HOMEPAGE =3D "https://github.com/tuvistavie/python-i18n"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.md;md5=3D7624ac071dec291ca8ef74e62e5=
36a7a"
-
-PYPI_PACKAGE =3D "python-i18n"
-
-SRC_URI[md5sum] =3D "08b8c247add9f90806c4742a685fdb88"
-SRC_URI[sha256sum] =3D "e1d832ff7d1d39ce593793cc709b2344aa8fdf321cf70708=
1335f146160d9f20"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        python-pyyaml \
-        "
+require python-i18n.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb=
 b/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb
new file mode 100644
index 0000000..8e98d13
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb
@@ -0,0 +1,2 @@
+require python-i18n.inc
+inherit setuptools3
--=20
2.20.1




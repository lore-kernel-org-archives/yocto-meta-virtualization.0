Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2898.1575431081366736490
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 19:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA655E010AE; Tue,  3 Dec 2019 19:44:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71839E010AA
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 19:44:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,275,1571673600"; 
   d="scan'208";a="79555699"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 11:44:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 026D84CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 11:36:05 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 11:44:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-lesscpy: Add python3 version
Date: Wed, 4 Dec 2019 11:45:22 +0800
Message-ID: <20191204034522.9783-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 026D84CE1A0C.A0093
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-lesscpy.inc                 | 18 +++++++++++++++++
 .../python/python-lesscpy_0.10.2.bb           | 20 ++-----------------
 .../python/python3-lesscpy_0.10.2.bb          |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-lesscp=
y_0.10.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy.inc b/=
meta-openstack/recipes-devtools/python/python-lesscpy.inc
new file mode 100644
index 0000000..c10b0b8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-lesscpy.inc
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "Python lesscpy: Python LESS Compiler"
+HOMEPAGE =3D "https://pypi.python.org/pypi/lesscpy"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da01aae31681ac25b4c46f98d627b9=
b5d"
+
+DEPENDS +=3D "${PYTHON_PN}-ply"
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-ply"
+
+SRC_URI[md5sum] =3D "fedbad1f4eb19c3af37f09560156246d"
+SRC_URI[sha256sum] =3D "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f=
1541859318ed9055"
+
+inherit pypi
+
+DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
+    --prefix=3D${prefix} \
+    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=3D${datadir}"
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2=
.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
index ca27cb5..43d7ff8 100644
--- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
@@ -1,18 +1,2 @@
-DESCRIPTION =3D "Python lesscpy: Python LESS Compiler"
-HOMEPAGE =3D "https://pypi.python.org/pypi/lesscpy"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da01aae31681ac25b4c46f98d627b9=
b5d"
-
-DEPENDS +=3D "python-ply"
-RDEPENDS_${PN} +=3D "python-ply"
-
-SRC_URI[md5sum] =3D "fedbad1f4eb19c3af37f09560156246d"
-SRC_URI[sha256sum] =3D "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f=
1541859318ed9055"
-
-inherit setuptools pypi
-
-DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
-    --prefix=3D${prefix} \
-    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=3D${datadir}"
+require python-lesscpy.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.=
2.bb b/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb
new file mode 100644
index 0000000..167b970
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb
@@ -0,0 +1,2 @@
+require python-lesscpy.inc
+inherit setuptools3
--=20
2.20.1




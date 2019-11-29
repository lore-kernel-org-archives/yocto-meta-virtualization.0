Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4216.1574996669302013825
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 19:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7F6DE010B0; Thu, 28 Nov 2019 19:04:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33A4AE00EC7
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 19:04:27 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79247597"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 11:04:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1ECB1406AB15
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:56:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 11:04:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-ecdsa: Add python3 version
Date: Fri, 29 Nov 2019 11:05:11 +0800
Message-ID: <20191129030511.4099-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1ECB1406AB15.A8D7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-ecdsa.inc  | 20 +++++++++++++++++
 .../python/python-ecdsa_0.13.bb               | 22 ++-----------------
 .../python/python3-ecdsa_0.13.bb              |  2 ++
 3 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-ecdsa.i=
nc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-ecdsa_=
0.13.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ecdsa.inc b/me=
ta-openstack/recipes-devtools/python/python-ecdsa.inc
new file mode 100644
index 0000000..b7c8356
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-ecdsa.inc
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "ECDSA cryptographic signature library"
+HOMEPAGE =3D "https://github.com/warner/python-ecdsa"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] =3D "1f60eda9cb5c46722856db41a3ae6670"
+SRC_URI[sha256sum] =3D "64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac=
223d57ad800c43fa"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# RDEPENDS_default:
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb =
b/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
index 8fe492c..f5785b3 100644
--- a/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
+++ b/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
@@ -1,20 +1,2 @@
-DESCRIPTION =3D "ECDSA cryptographic signature library"
-HOMEPAGE =3D "https://github.com/warner/python-ecdsa"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] =3D "1f60eda9cb5c46722856db41a3ae6670"
-SRC_URI[sha256sum] =3D "64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac=
223d57ad800c43fa"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        python-pbr \
-        "
-
-# RDEPENDS_default:
-RDEPENDS_${PN} +=3D " \
-        python-pbr \
-        "
+require python-ecdsa.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb=
 b/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb
new file mode 100644
index 0000000..13366f4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb
@@ -0,0 +1,2 @@
+require python-ecdsa.inc
+inherit setuptools3
--=20
2.20.1




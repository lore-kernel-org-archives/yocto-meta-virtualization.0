Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.750.1575444464760813271
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 23:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50064E00ED3; Tue,  3 Dec 2019 23:27:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6811BE0083D
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 23:27:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79569274"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 15:27:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CC4AD4CE1C0D
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 15:19:13 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 15:27:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pysnmp: Add python3 version
Date: Wed, 4 Dec 2019 15:28:31 +0800
Message-ID: <20191204072831.16645-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CC4AD4CE1C0D.ACC70
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pysnmp.inc    | 14 ++++++++++++++
 .../python/python-pysnmp_4.2.5.bb                | 16 ++--------------
 .../python/python3-pysnmp_4.2.5.bb               |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pysnmp.=
inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp=
_4.2.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp.inc b/m=
eta-openstack/recipes-devtools/python/python-pysnmp.inc
new file mode 100644
index 0000000..1a9ca0f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pysnmp.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "A pure-Python SNMPv1/v2c/v3 library"
+HOMEPAGE =3D "https://pypi.python.org/pypi/pysnmp"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae098273b2cf8b4af164ac20e32bd=
df7"
+
+SRC_URI[md5sum] =3D "1f75d3e392a050e84348904fc1be3212"
+SRC_URI[sha256sum] =3D "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b=
4b4d897150f7077f"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-pycrypto \
+                   ${PYTHON_PN}-pyasn1 \
+"
diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.b=
b b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
index dc2f5bf..2c41514 100644
--- a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
@@ -1,14 +1,2 @@
-DESCRIPTION =3D "A pure-Python SNMPv1/v2c/v3 library"
-HOMEPAGE =3D "https://pypi.python.org/pypi/pysnmp"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae098273b2cf8b4af164ac20e32bd=
df7"
-
-SRC_URI[md5sum] =3D "1f75d3e392a050e84348904fc1be3212"
-SRC_URI[sha256sum] =3D "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b=
4b4d897150f7077f"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-pycrypto \
-                   python-pyasn1 \
-"
+require python-pysnmp.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.=
bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
new file mode 100644
index 0000000..b31eb5a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
@@ -0,0 +1,2 @@
+require python-pysnmp.inc
+inherit setuptools3
--=20
2.20.1




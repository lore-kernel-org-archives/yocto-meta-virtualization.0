Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5047.1578970407381736932
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7B37E01406; Mon, 13 Jan 2020 18:53:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8E33E01387
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:53:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81776353"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:53:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2DD874CE20C4
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 10:44:15 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:53:18 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:53:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-wsgiref: Add python3 version
Date: Tue, 14 Jan 2020 10:54:47 +0800
Message-ID: <20200114025447.31975-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2DD874CE20C4.AC4EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-wsgiref.inc                 | 23 +++++++++++++++++
 .../python/python-wsgiref_0.1.2.bb            | 25 ++-----------------
 .../python/python3-wsgiref_0.1.2.bb           |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-wsgiref=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-wsgire=
f_0.1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wsgiref.inc b/=
meta-openstack/recipes-devtools/python/python-wsgiref.inc
new file mode 100644
index 0000000..1449bea
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-wsgiref.inc
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "WSGI (PEP 333) Reference Library"
+HOMEPAGE =3D "http://cheeseshop.python.org/pypi/wsgiref"
+SECTION =3D "devel/python"
+LICENSE =3D "PSF"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Dfe761dfec1d54629c6b9a3bbc7b1=
baf5"
+
+# Archived version so we need to overwrite what the pypi class will deri=
ve
+PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/w/wsgiref/wsgi=
ref-${PV}.zip"
+
+SRC_URI[md5sum] =3D "29b146e6ebd0f9fb119fe321f7bcf6cb"
+SRC_URI[sha256sum] =3D "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349=
e57c1f7cabf40e79"
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
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.=
bb b/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
index dc02a44..3ec8264 100644
--- a/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
@@ -1,23 +1,2 @@
-DESCRIPTION =3D "WSGI (PEP 333) Reference Library"
-HOMEPAGE =3D "http://cheeseshop.python.org/pypi/wsgiref"
-SECTION =3D "devel/python"
-LICENSE =3D "PSF"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Dfe761dfec1d54629c6b9a3bbc7b1=
baf5"
-
-# Archived version so we need to overwrite what the pypi class will deri=
ve
-PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/w/wsgiref/wsgi=
ref-${PV}.zip"
-
-SRC_URI[md5sum] =3D "29b146e6ebd0f9fb119fe321f7bcf6cb"
-SRC_URI[sha256sum] =3D "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349=
e57c1f7cabf40e79"
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
-        "
+require python-wsgiref.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2=
.bb b/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb
new file mode 100644
index 0000000..0fa887a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb
@@ -0,0 +1,2 @@
+require python-wsgiref.inc
+inherit setuptools3
--=20
2.20.1




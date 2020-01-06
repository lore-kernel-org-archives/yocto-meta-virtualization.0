Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1132.1578299371030757963
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 00:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0113E01454; Mon,  6 Jan 2020 00:29:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C58F9E01252
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 00:29:29 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81368237"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 16:29:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C38D49E932A
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 16:20:24 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 16:29:22 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 16:29:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-hogan: Add python3 version
Date: Mon, 6 Jan 2020 16:30:40 +0800
Message-ID: <20200106083040.17250-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7C38D49E932A.AB181
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-hogan.inc           | 22 +++++++++++++++++
 .../python/python-xstatic-hogan_2.0.0.2.bb    | 24 ++-----------------
 .../python/python3-xstatic-hogan_2.0.0.2.bb   |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-hogan.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-hogan_2.0.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-hogan.=
inc b/meta-openstack/recipes-devtools/python/python-xstatic-hogan.inc
new file mode 100644
index 0000000..deeeae1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-hogan.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Hogan JavaScript library packaged for setuptools"
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Hogan"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D18dc983faa3113478ed59ae157a9=
85d5"
+
+PYPI_PACKAGE =3D "XStatic-Hogan"
+
+SRC_URI[md5sum] =3D "1c1de09c4813e8568aab98fa5270d6a0"
+SRC_URI[sha256sum] =3D "5941bc7fb2a09916b8837848e6fc2a13b2dfc271811e9b52=
2c61e1337d5fc2bd"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_=
2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-hogan_=
2.0.0.2.bb
index aef5706..9d571c5 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2=
.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2=
.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "Hogan JavaScript library packaged for setuptools"
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Hogan"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D18dc983faa3113478ed59ae157a9=
85d5"
-
-PYPI_PACKAGE =3D "XStatic-Hogan"
-
-SRC_URI[md5sum] =3D "1c1de09c4813e8568aab98fa5270d6a0"
-SRC_URI[sha256sum] =3D "5941bc7fb2a09916b8837848e6fc2a13b2dfc271811e9b52=
2c61e1337d5fc2bd"
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
+require python-xstatic-hogan.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-hogan=
_2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-hoga=
n_2.0.0.2.bb
new file mode 100644
index 0000000..bdd3c27
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.=
2.bb
@@ -0,0 +1,2 @@
+require python-xstatic-hogan.inc
+inherit setuptools3
--=20
2.20.1




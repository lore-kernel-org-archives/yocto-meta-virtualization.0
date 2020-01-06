Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.469.1578293146997442581
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 22:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95EC9E01348; Sun,  5 Jan 2020 22:45:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9A61E0093B
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 22:45:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81347429"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 14:45:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3703949E933D
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 14:36:46 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 14:45:44 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 14:45:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-angular-cookies: Add python3 version
Date: Mon, 6 Jan 2020 14:47:02 +0800
Message-ID: <20200106064702.2620-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3703949E933D.A709E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-angular-cookies.inc | 22 +++++++++++++++++
 .../python-xstatic-angular-cookies_1.2.1.1.bb | 24 ++-----------------
 ...python3-xstatic-angular-cookies_1.2.1.1.bb |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-angular-cookies.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-angular-cookies_1.2.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-cookies.inc b/meta-openstack/recipes-devtools/python/python-xstatic-ang=
ular-cookies.inc
new file mode 100644
index 0000000..bc3923b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cooki=
es.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Angular-Cookies JavaScript library packaged for setupto=
ols"
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D70856f1d03d62a3e0c0cb1b7f8c7=
fd00"
+
+PYPI_PACKAGE =3D "XStatic-Angular-Cookies"
+
+SRC_URI[md5sum] =3D "a67066fac5dfe9774ab163d44e5a896a"
+SRC_URI[sha256sum] =3D "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89=
256e7ec71fce0b4c"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xsta=
tic-angular-cookies_1.2.1.1.bb
index 8c9b55f..0cf5aac 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cooki=
es_1.2.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cooki=
es_1.2.1.1.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "Angular-Cookies JavaScript library packaged for setupto=
ols"
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D70856f1d03d62a3e0c0cb1b7f8c7=
fd00"
-
-PYPI_PACKAGE =3D "XStatic-Angular-Cookies"
-
-SRC_URI[md5sum] =3D "a67066fac5dfe9774ab163d44e5a896a"
-SRC_URI[sha256sum] =3D "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89=
256e7ec71fce0b4c"
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
+require python-xstatic-angular-cookies.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angul=
ar-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xs=
tatic-angular-cookies_1.2.1.1.bb
new file mode 100644
index 0000000..ee9591a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cook=
ies_1.2.1.1.bb
@@ -0,0 +1,2 @@
+require python-xstatic-angular-cookies.inc
+inherit setuptools3
--=20
2.20.1




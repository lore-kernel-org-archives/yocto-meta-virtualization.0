Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.948.1578297667323316749
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 00:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB1B1E01455; Mon,  6 Jan 2020 00:01:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CF12E01450
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 00:01:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81364470"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 16:01:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 35D0E49E932A
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 15:52:05 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 16:01:01 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 16:01:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-angular-gettext: Add python3 version
Date: Mon, 6 Jan 2020 16:02:17 +0800
Message-ID: <20200106080217.15273-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 35D0E49E932A.A8116
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-angular-gettext.inc | 19 +++++++++++++++++
 .../python-xstatic-angular-gettext_2.3.8.0.bb | 21 ++-----------------
 ...python3-xstatic-angular-gettext_2.3.8.0.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-angular-gettext.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-angular-gettext_2.3.8.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-gettext.inc b/meta-openstack/recipes-devtools/python/python-xstatic-ang=
ular-gettext.inc
new file mode 100644
index 0000000..be9cce3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-gette=
xt.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Angular-Gettext javascript library packaged for setupto=
ols (easy_install) / pip."
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Gettext"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+PYPI_PACKAGE =3D "XStatic-Angular-Gettext"
+
+SRC_URI[md5sum] =3D "de55242cf5dc5fa712ac7e4a53aeb12b"
+SRC_URI[sha256sum] =3D "18db14dccaae5d64a9b66d08d0134b6c154fc1fb1e216964=
bba8e403e03c870e"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-gettext_2.3.8.0.bb b/meta-openstack/recipes-devtools/python/python-xsta=
tic-angular-gettext_2.3.8.0.bb
index d9c14a2..63aa60d 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gette=
xt_2.3.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-gette=
xt_2.3.8.0.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "Angular-Gettext javascript library packaged for setupto=
ols (easy_install) / pip."
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Gettext"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-PYPI_PACKAGE =3D "XStatic-Angular-Gettext"
-
-SRC_URI[md5sum] =3D "de55242cf5dc5fa712ac7e4a53aeb12b"
-SRC_URI[sha256sum] =3D "18db14dccaae5d64a9b66d08d0134b6c154fc1fb1e216964=
bba8e403e03c870e"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-angular-gettext.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angul=
ar-gettext_2.3.8.0.bb b/meta-openstack/recipes-devtools/python/python3-xs=
tatic-angular-gettext_2.3.8.0.bb
new file mode 100644
index 0000000..48b75aa
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gett=
ext_2.3.8.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-angular-gettext.inc
+inherit setuptools3
--=20
2.20.1




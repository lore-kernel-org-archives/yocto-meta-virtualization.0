Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2018.1578288142027543729
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 21:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84EDAE0144E; Sun,  5 Jan 2020 21:22:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 096FEE012F5
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 21:22:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81333503"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 13:22:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D521849E9335
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 13:13:16 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 13:22:15 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 13:22:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-bootstrap-datepicker: Add python3 version
Date: Mon, 6 Jan 2020 13:23:33 +0800
Message-ID: <20200106052333.14816-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D521849E9335.A8061
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-bootstrap-datepicker.inc   | 19 +++++++++++++++++
 ...on-xstatic-bootstrap-datepicker_1.3.1.0.bb | 21 ++-----------------
 ...n3-xstatic-bootstrap-datepicker_1.3.1.0.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-bootstrap-datepicker.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-bootstrap-datepicker_1.3.1.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootst=
rap-datepicker.inc b/meta-openstack/recipes-devtools/python/python-xstati=
c-bootstrap-datepicker.inc
new file mode 100644
index 0000000..4988539
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-dat=
epicker.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Bootstrap-Datepicker JavaScript library packaged for se=
tuptools (easy_install) / pip."
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D97d9c60d3a8c5fccccb317f94468=
8479"
+
+PYPI_PACKAGE =3D "XStatic-Bootstrap-Datepicker"
+
+SRC_URI[md5sum] =3D "c2f5c58a7b41162923eca5a36b29b8b2"
+SRC_URI[sha256sum] =3D "9edc9b77501001fcee9fbf4bf0a722c263efd928ef928b40=
081a8269fdd9a944"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootst=
rap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/python=
-xstatic-bootstrap-datepicker_1.3.1.0.bb
index ff491a2..0bea3f0 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-dat=
epicker_1.3.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-dat=
epicker_1.3.1.0.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "Bootstrap-Datepicker JavaScript library packaged for se=
tuptools (easy_install) / pip."
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D97d9c60d3a8c5fccccb317f94468=
8479"
-
-PYPI_PACKAGE =3D "XStatic-Bootstrap-Datepicker"
-
-SRC_URI[md5sum] =3D "c2f5c58a7b41162923eca5a36b29b8b2"
-SRC_URI[sha256sum] =3D "9edc9b77501001fcee9fbf4bf0a722c263efd928ef928b40=
081a8269fdd9a944"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-bootstrap-datepicker.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-boots=
trap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/pytho=
n3-xstatic-bootstrap-datepicker_1.3.1.0.bb
new file mode 100644
index 0000000..9e9db89
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-da=
tepicker_1.3.1.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-bootstrap-datepicker.inc
+inherit setuptools3
--=20
2.20.1




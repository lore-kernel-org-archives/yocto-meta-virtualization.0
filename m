Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1253.1578301244537966425
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 01:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2175DE01455; Mon,  6 Jan 2020 01:00:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0FC9E01252
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 01:00:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81371061"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:00:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 80D4649E932B
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 16:51:38 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:00:38 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:00:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-jquery-migrate: Add python3 version
Date: Mon, 6 Jan 2020 17:01:53 +0800
Message-ID: <20200106090153.23602-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 80D4649E932B.A7B84
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-jquery-migrate.inc  | 22 +++++++++++++++++
 .../python-xstatic-jquery-migrate_1.2.1.1.bb  | 24 ++-----------------
 .../python3-xstatic-jquery-migrate_1.2.1.1.bb |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-jquery-migrate.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-jquery-migrate_1.2.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery=
-migrate.inc b/meta-openstack/recipes-devtools/python/python-xstatic-jque=
ry-migrate.inc
new file mode 100644
index 0000000..b5c1332
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrat=
e.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "JQuery-Migrate JavaScript library packaged for setuptoo=
ls"
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-JQuery-Migrate"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D2bbd78dd61f7b4f2fb6b3e31e4d7=
a26b"
+
+PYPI_PACKAGE =3D "XStatic-JQuery-Migrate"
+
+SRC_URI[md5sum] =3D "2dd39f9d6351aeaf129b33d4134ac6a7"
+SRC_URI[sha256sum] =3D "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993=
d7264731a750900e"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery=
-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstat=
ic-jquery-migrate_1.2.1.1.bb
index 432b11e..f3a6146 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrat=
e_1.2.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrat=
e_1.2.1.1.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "JQuery-Migrate JavaScript library packaged for setuptoo=
ls"
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-JQuery-Migrate"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D2bbd78dd61f7b4f2fb6b3e31e4d7=
a26b"
-
-PYPI_PACKAGE =3D "XStatic-JQuery-Migrate"
-
-SRC_URI[md5sum] =3D "2dd39f9d6351aeaf129b33d4134ac6a7"
-SRC_URI[sha256sum] =3D "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993=
d7264731a750900e"
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
+require python-xstatic-jquery-migrate.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquer=
y-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xst=
atic-jquery-migrate_1.2.1.1.bb
new file mode 100644
index 0000000..2dab32f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migra=
te_1.2.1.1.bb
@@ -0,0 +1,2 @@
+require python-xstatic-jquery-migrate.inc
+inherit setuptools3
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.667.1575443892585595898
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 23:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2030AE010B0; Tue,  3 Dec 2019 23:18:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D40BE00EC7
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 23:18:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79568774"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 15:18:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1EE7D4CE1646
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 15:09:34 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 15:18:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pyflakes: Add python3 version
Date: Wed, 4 Dec 2019 15:18:51 +0800
Message-ID: <20191204071851.31039-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1EE7D4CE1646.A8553
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pyflakes.inc  | 14 ++++++++++++++
 .../python/python-pyflakes_0.7.3.bb              | 16 ++--------------
 .../python/python3-pyflakes_0.7.3.bb             |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pyflake=
s.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pyflak=
es_0.7.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes.inc b=
/meta-openstack/recipes-devtools/python/python-pyflakes.inc
new file mode 100644
index 0000000..df92d80
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pyflakes.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "passive checker of Python programs"
+HOMEPAGE =3D "https://github.com/dreamhost/cliff"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://README.rst;md5=3D1815018ebbbfc8659a9df33681=
a0936e"
+
+SRC_URI[md5sum] =3D "ec94ac11cb110e6e72cca23c104b66b1"
+SRC_URI[sha256sum] =3D "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b=
66aa624097d9b5e3"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing"
diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3=
.bb b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
index 81bca36..78a2e09 100644
--- a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
@@ -1,14 +1,2 @@
-DESCRIPTION =3D "passive checker of Python programs"
-HOMEPAGE =3D "https://github.com/dreamhost/cliff"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://README.rst;md5=3D1815018ebbbfc8659a9df33681=
a0936e"
-
-SRC_URI[md5sum] =3D "ec94ac11cb110e6e72cca23c104b66b1"
-SRC_URI[sha256sum] =3D "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b=
66aa624097d9b5e3"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-prettytable \
-            python-cmd2 \
-            python-pyparsing"
\ No newline at end of file
+require python-pyflakes.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.=
3.bb b/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
new file mode 100644
index 0000000..cc9e864
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
@@ -0,0 +1,2 @@
+require python-pyflakes.inc
+inherit setuptools3
--=20
2.20.1




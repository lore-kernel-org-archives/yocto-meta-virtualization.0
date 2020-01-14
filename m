Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4778.1578968914394990762
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50A0EE01528; Mon, 13 Jan 2020 18:28:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3F64E01383
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:28:31 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81773334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:28:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B74334CE20C0
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 10:19:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:28:23 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:28:23 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-virtualenv: Add python3 version
Date: Tue, 14 Jan 2020 10:29:50 +0800
Message-ID: <20200114022950.27444-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B74334CE20C0.A883D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-virtualenv.inc              | 18 +++++++++++++++++
 .../python/python-virtualenv_1.11.4.bb        | 20 ++-----------------
 .../python/python3-virtualenv_1.11.4.bb       |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-virtual=
env.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-virtua=
lenv_1.11.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-virtualenv.inc=
 b/meta-openstack/recipes-devtools/python/python-virtualenv.inc
new file mode 100644
index 0000000..79b9451
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-virtualenv.inc
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "Virtual Python Environment builder"
+HOMEPAGE =3D "https://pypi.python.org/pypi/virtualenv"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D53df9f8889d6a5fba83f425ab=
e3b1568"
+
+SRC_URI[md5sum] =3D "9accc2d3f0ec1da479ce2c3d1fdff06e"
+SRC_URI[sha256sum] =3D "cf3d958f28eb7470bd04262ef397580a2e57407f2ee2c88e=
9b2892218eb0465a"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-dateutil \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-virtualenv_1.1=
1.4.bb b/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.=
bb
index ebe2cec..f8b9d1c 100644
--- a/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb
@@ -1,18 +1,2 @@
-DESCRIPTION =3D "Virtual Python Environment builder"
-HOMEPAGE =3D "https://pypi.python.org/pypi/virtualenv"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D53df9f8889d6a5fba83f425ab=
e3b1568"
-
-SRC_URI[md5sum] =3D "9accc2d3f0ec1da479ce2c3d1fdff06e"
-SRC_URI[sha256sum] =3D "cf3d958f28eb7470bd04262ef397580a2e57407f2ee2c88e=
9b2892218eb0465a"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-dateutil \
-        "
+require python-virtualenv.inc
+inherit setuptools=20
diff --git a/meta-openstack/recipes-devtools/python/python3-virtualenv_1.=
11.4.bb b/meta-openstack/recipes-devtools/python/python3-virtualenv_1.11.=
4.bb
new file mode 100644
index 0000000..f053af7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-virtualenv_1.11.4.bb
@@ -0,0 +1,2 @@
+require python-virtualenv.inc
+inherit setuptools3
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.24.1578289065330469943
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 21:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D98E1E01450; Sun,  5 Jan 2020 21:37:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30561E013BB
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 21:37:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81334883"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 13:37:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AF813406AB15
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 13:28:36 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 13:37:37 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 13:37:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-bootstrap-scss: Add python3 version
Date: Mon, 6 Jan 2020 13:38:52 +0800
Message-ID: <20200106053852.16311-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AF813406AB15.AA86F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-bootstrap-scss.inc  | 22 +++++++++++++++++
 .../python-xstatic-bootstrap-scss_3.3.7.1.bb  | 24 ++-----------------
 .../python3-xstatic-bootstrap-scss_3.3.7.1.bb |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-bootstrap-scss.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-bootstrap-scss_3.3.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootst=
rap-scss.inc b/meta-openstack/recipes-devtools/python/python-xstatic-boot=
strap-scss.inc
new file mode 100644
index 0000000..2987919
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scs=
s.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "%DESCRIPTION%"
+HOMEPAGE =3D "%URL%"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+PYPI_PACKAGE =3D "XStatic-Bootstrap-SCSS"
+
+SRC_URI[md5sum] =3D "cc0d26647d10e1de84ba6649d3264f77"
+SRC_URI[sha256sum] =3D "4d388df037293163bf3242e0b60c79d06e1f743af8b0be84=
73f92676340e5acd"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootst=
rap-scss_3.3.7.1.bb b/meta-openstack/recipes-devtools/python/python-xstat=
ic-bootstrap-scss_3.3.7.1.bb
index b5d714e..314e25c 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scs=
s_3.3.7.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scs=
s_3.3.7.1.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "%DESCRIPTION%"
-HOMEPAGE =3D "%URL%"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-PYPI_PACKAGE =3D "XStatic-Bootstrap-SCSS"
-
-SRC_URI[md5sum] =3D "cc0d26647d10e1de84ba6649d3264f77"
-SRC_URI[sha256sum] =3D "4d388df037293163bf3242e0b60c79d06e1f743af8b0be84=
73f92676340e5acd"
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
+require python-xstatic-bootstrap-scss.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-boots=
trap-scss_3.3.7.1.bb b/meta-openstack/recipes-devtools/python/python3-xst=
atic-bootstrap-scss_3.3.7.1.bb
new file mode 100644
index 0000000..20eab88
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-sc=
ss_3.3.7.1.bb
@@ -0,0 +1,2 @@
+require python-xstatic-bootstrap-scss.inc
+inherit setuptools3
--=20
2.20.1




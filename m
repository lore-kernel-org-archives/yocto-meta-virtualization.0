Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2017.1578287502014205672
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 21:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95792E0144E; Sun,  5 Jan 2020 21:11:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7559E01348
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 21:11:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81332515"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 13:11:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F21FE49E9334
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 13:02:34 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 13:11:34 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 13:11:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-angular-bootstrap: Add python3 version
Date: Mon, 6 Jan 2020 13:12:50 +0800
Message-ID: <20200106051250.13469-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F21FE49E9334.ABF1F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-bootstrap.inc      | 19 +++++++++++++++++
 ...ython-xstatic-angular-bootstrap_2.2.0.0.bb | 21 ++-----------------
 ...thon3-xstatic-angular-bootstrap_2.2.0.0.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-angular-bootstrap.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-angular-bootstrap_2.2.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-bootstrap.inc b/meta-openstack/recipes-devtools/python/python-xstatic-a=
ngular-bootstrap.inc
new file mode 100644
index 0000000..1a38067
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-boots=
trap.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Angular JavaScript library packaged for setuptools"
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Bootstrap"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+PYPI_PACKAGE =3D "XStatic-Angular-Bootstrap"
+
+SRC_URI[md5sum] =3D "1d7d02580f022c36628f99fbf40e39c9"
+SRC_URI[sha256sum] =3D "61b0a86aad66bf0d333ed24496f51d77cb20ad5bf664140d=
86e880b15a231166"
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
r-bootstrap_2.2.0.0.bb b/meta-openstack/recipes-devtools/python/python-xs=
tatic-angular-bootstrap_2.2.0.0.bb
index 1265e4b..414bfa8 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-boots=
trap_2.2.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-boots=
trap_2.2.0.0.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "Angular JavaScript library packaged for setuptools"
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Bootstrap"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-PYPI_PACKAGE =3D "XStatic-Angular-Bootstrap"
-
-SRC_URI[md5sum] =3D "1d7d02580f022c36628f99fbf40e39c9"
-SRC_URI[sha256sum] =3D "61b0a86aad66bf0d333ed24496f51d77cb20ad5bf664140d=
86e880b15a231166"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-angular-bootstrap.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angul=
ar-bootstrap_2.2.0.0.bb b/meta-openstack/recipes-devtools/python/python3-=
xstatic-angular-bootstrap_2.2.0.0.bb
new file mode 100644
index 0000000..622f152
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-boot=
strap_2.2.0.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-angular-bootstrap.inc
+inherit setuptools3
--=20
2.20.1




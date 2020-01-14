Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3771.1578965188703781885
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 17:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51E28E01528; Mon, 13 Jan 2020 17:26:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3800E00BD2
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 17:26:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,430,1571673600"; 
   d="scan'208";a="81767970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 09:26:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C9274CE1CB8
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 09:17:16 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 09:26:18 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 09:26:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-semantic-version: Add python3 version
Date: Tue, 14 Jan 2020 09:27:45 +0800
Message-ID: <20200114012745.9584-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0C9274CE1CB8.AF8E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-semantic-version.inc        | 24 +++++++++++++++++
 .../python/python-semantic-version_2.4.2.bb   | 26 ++-----------------
 .../python/python3-semantic-version_2.4.2.bb  |  2 ++
 3 files changed, 28 insertions(+), 24 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-semanti=
c-version.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-semant=
ic-version_2.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-semantic-versi=
on.inc b/meta-openstack/recipes-devtools/python/python-semantic-version.i=
nc
new file mode 100644
index 0000000..e003c0c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-semantic-version.inc
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "A library which provides a few tools to handle SemVer i=
n Python."
+HOMEPAGE =3D "http://pypi.python.org/pypi/semantic_version"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da7dcaa0740d59f8f13ef05a3d0ed7=
313"
+
+PYPI_PACKAGE =3D "semantic_version"
+
+SRC_URI[md5sum] =3D "fd7d5ade76e78d8540b9a4044496a57c"
+SRC_URI[sha256sum] =3D "7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516=
425f475d5d6932d2"
+
+#export BUILD_SYS
+#export HOST_SYS
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS +=3D " \
+        "
+
+# RDEPENDS_default:=20
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-semantic-versi=
on_2.4.2.bb b/meta-openstack/recipes-devtools/python/python-semantic-vers=
ion_2.4.2.bb
index a038abb..2ca2d92 100644
--- a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.=
2.bb
+++ b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.=
2.bb
@@ -1,24 +1,2 @@
-DESCRIPTION =3D "A library which provides a few tools to handle SemVer i=
n Python."
-HOMEPAGE =3D "http://pypi.python.org/pypi/semantic_version"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da7dcaa0740d59f8f13ef05a3d0ed7=
313"
-
-PYPI_PACKAGE =3D "semantic_version"
-
-SRC_URI[md5sum] =3D "fd7d5ade76e78d8540b9a4044496a57c"
-SRC_URI[sha256sum] =3D "7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516=
425f475d5d6932d2"
-
-#export BUILD_SYS
-#export HOST_SYS
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
+require python-semantic-version.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-semantic-vers=
ion_2.4.2.bb b/meta-openstack/recipes-devtools/python/python3-semantic-ve=
rsion_2.4.2.bb
new file mode 100644
index 0000000..f4191f5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-semantic-version_2.4=
.2.bb
@@ -0,0 +1,2 @@
+require python-semantic-version.inc
+inherit setuptools3
--=20
2.20.1




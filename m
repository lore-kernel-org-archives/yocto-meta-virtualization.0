Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1058.1575447141621572351
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 00:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2298E010AF; Wed,  4 Dec 2019 00:12:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC0CEE00EC7
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 00:12:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79571838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:12:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 59FBD4CE1646
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 16:03:46 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:12:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-repoze.who: Add python3 version
Date: Wed, 4 Dec 2019 16:13:04 +0800
Message-ID: <20191204081304.6241-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 59FBD4CE1646.AA6CB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-repoze.who.inc              | 22 +++++++++++++++++
 .../python/python-repoze.who_2.2.bb           | 24 ++-----------------
 .../python/python3-repoze.who_2.2.bb          |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.=
who.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-repoze=
.who_2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who.inc=
 b/meta-openstack/recipes-devtools/python/python-repoze.who.inc
new file mode 100644
index 0000000..1981e03
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-repoze.who.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "An identification and authentication framework for WSGI=
"
+HOMEPAGE =3D "http://repoze.org/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-Modification"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2c33cdbc6bc9ae6e5d64152fd=
b754292"
+
+SRC_URI[md5sum] =3D "c677ac4d4a32b6f6880a8f9cf20adffb"
+SRC_URI[sha256sum] =3D "322629ec7c779dce4700e8f3ba531002b724d2429178c1cb=
b0dc169255dc9a8b"
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
+    ${PYTHON_PN}-pip \
+    ${PYTHON_PN}-zopeinterface \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2=
.bb b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
index 3ee8f25..236b8f9 100644
--- a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "An identification and authentication framework for WSGI=
"
-HOMEPAGE =3D "http://repoze.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-Modification"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2c33cdbc6bc9ae6e5d64152fd=
b754292"
-
-SRC_URI[md5sum] =3D "c677ac4d4a32b6f6880a8f9cf20adffb"
-SRC_URI[sha256sum] =3D "322629ec7c779dce4700e8f3ba531002b724d2429178c1cb=
b0dc169255dc9a8b"
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
-    python-pip \
-    python-zopeinterface \
-    "
+require python-repoze.who.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.who_2.=
2.bb b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
new file mode 100644
index 0000000..ee7c23d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
@@ -0,0 +1,2 @@
+require python-repoze.who.inc
+inherit setuptools3
--=20
2.20.1




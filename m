Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4325.1574931733215449395
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 01:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18031E0108B; Thu, 28 Nov 2019 01:02:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8BD8E00E82
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 01:02:11 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; 
   d="scan'208";a="79213762"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 17:02:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AFD884CE1C07
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 16:53:42 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 28 Nov 2019 17:02:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-babel: Add python3 version
Date: Thu, 28 Nov 2019 17:02:52 +0800
Message-ID: <20191128090252.27458-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AFD884CE1C07.A9BCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-babel.inc  | 18 +++++++++++++++++
 .../python/python-babel_2.3.4.bb              | 20 ++-----------------
 .../python/python3-babel_2.3.4.bb             |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-babel.i=
nc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-babel_=
2.3.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-babel.inc b/me=
ta-openstack/recipes-devtools/python/python-babel.inc
new file mode 100644
index 0000000..5e133a1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-babel.inc
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "A collection of tools for internationalizing Python app=
lications"
+HOMEPAGE =3D "http://babel.edgewall.org/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6eeaabc92cfc2d03f53e789324d7=
292"
+
+PYPI_PACKAGE =3D "Babel"
+
+SRC_URI[md5sum] =3D "afa20bc55b0e991833030129ad498f35"
+SRC_URI[sha256sum] =3D "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8=
a5b497c131c62875"
+
+inherit pypi
+
+CLEANBROKEN =3D "1"
+
+RDEPENDS_${PN} +=3D " \
+    ${PYTHON_PN}-pytz \
+"
diff --git a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb=
 b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
index e4c0884..74952d1 100644
--- a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
@@ -1,18 +1,2 @@
-DESCRIPTION =3D "A collection of tools for internationalizing Python app=
lications"
-HOMEPAGE =3D "http://babel.edgewall.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6eeaabc92cfc2d03f53e789324d7=
292"
-
-PYPI_PACKAGE =3D "Babel"
-
-SRC_URI[md5sum] =3D "afa20bc55b0e991833030129ad498f35"
-SRC_URI[sha256sum] =3D "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8=
a5b497c131c62875"
-
-inherit setuptools pypi
-
-CLEANBROKEN =3D "1"
-
-RDEPENDS_${PN} +=3D " \
-    python-pytz \
-"
\ No newline at end of file
+require python-babel.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.b=
b b/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
new file mode 100644
index 0000000..42b0008
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
@@ -0,0 +1,2 @@
+require python-babel.inc
+inherit setuptools3
--=20
2.20.1




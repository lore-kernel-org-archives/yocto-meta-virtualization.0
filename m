Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4904.1575004274907666289
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 21:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79312E010B4; Thu, 28 Nov 2019 21:11:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9AF3E00EC3
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 21:11:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,256,1571673600"; 
   d="scan'208";a="79252672"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 13:11:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E4F44CE1BED
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 13:02:45 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 13:11:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-hgtools: Add python3 version
Date: Fri, 29 Nov 2019 13:11:52 +0800
Message-ID: <20191129051152.13854-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7E4F44CE1BED.AA281
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-hgtools.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-hgtools_6.3.bb | 15 ++-------------
 .../python/python3-hgtools_6.3.bb                 |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-hgtools=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-hgtool=
s_6.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-hgtools.inc b/=
meta-openstack/recipes-devtools/python/python-hgtools.inc
new file mode 100644
index 0000000..561df3d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-hgtools.inc
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Classes and setuptools plugin for Mercurial repositorie=
s"
+HOMEPAGE =3D "https://pypi.python.org/pypi/hgtools"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da428d7abf1504d4dfeb4cbde155ba=
484"
+
+PYPI_PACKAGE_EXT =3D "zip"
+
+SRC_URI[md5sum] =3D "584d74b81b1efae3604c53086d1a3acb"
+SRC_URI[sha256sum] =3D "1d0ef6ceaba1673e6923b17d7f09c5ae2f4394d16ef80562=
812987a27e7836ff"
+
+inherit pypi
+
diff --git a/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb=
 b/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
index 1df77b2..9390c5d 100644
--- a/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
@@ -1,13 +1,2 @@
-DESCRIPTION =3D "Classes and setuptools plugin for Mercurial repositorie=
s"
-HOMEPAGE =3D "https://pypi.python.org/pypi/hgtools"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da428d7abf1504d4dfeb4cbde155ba=
484"
-
-PYPI_PACKAGE_EXT =3D "zip"
-
-SRC_URI[md5sum] =3D "584d74b81b1efae3604c53086d1a3acb"
-SRC_URI[sha256sum] =3D "1d0ef6ceaba1673e6923b17d7f09c5ae2f4394d16ef80562=
812987a27e7836ff"
-
-inherit setuptools pypi
-
+require python-hgtools.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.b=
b b/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb
new file mode 100644
index 0000000..51a488f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb
@@ -0,0 +1,2 @@
+require python-hgtools.inc
+inherit setuptools3
--=20
2.20.1




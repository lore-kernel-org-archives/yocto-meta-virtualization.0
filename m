Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3610.1574991265855010722
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 17:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2FF8E010AC; Thu, 28 Nov 2019 17:34:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72520E007D4
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 17:34:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79241043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 09:34:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1A2DA406AB15
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 09:25:55 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 09:34:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-beautifulsoup4: Add python3 version
Date: Fri, 29 Nov 2019 09:35:06 +0800
Message-ID: <20191129013506.10578-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1A2DA406AB15.AA59E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-beautifulsoup4.inc           | 16 ++++++++++++++++
 .../python/python-beautifulsoup4_4.4.1.bb      | 18 ++----------------
 .../python/python3-beautifulsoup4_4.4.1.bb     |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-beautif=
ulsoup4.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-beauti=
fulsoup4_4.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4=
.inc b/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
new file mode 100644
index 0000000..4ff500b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Screen-scraping library"
+HOMEPAGE =3D "https://pypi.python.org/pypi/beautifulsoup4/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D39dacabe5494f61c8680f6fa7=
323b596"
+
+SRC_URI[md5sum] =3D "8fbd9a7cac0704645fa20d1419036815"
+SRC_URI[sha256sum] =3D "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d=
39744f7709a366b4"
+
+inherit pypi
+
+# avoid "error: option --single-version-externally-managed not recognize=
d"
+DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
+    --prefix=3D${prefix} \
+    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=3D${datadir}"
diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4=
_4.4.1.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_=
4.4.1.bb
index cb72f87..595fe5f 100644
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.=
bb
+++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.=
bb
@@ -1,16 +1,2 @@
-DESCRIPTION =3D "Screen-scraping library"
-HOMEPAGE =3D "https://pypi.python.org/pypi/beautifulsoup4/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D39dacabe5494f61c8680f6fa7=
323b596"
-
-SRC_URI[md5sum] =3D "8fbd9a7cac0704645fa20d1419036815"
-SRC_URI[sha256sum] =3D "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d=
39744f7709a366b4"
-
-inherit setuptools pypi
-
-# avoid "error: option --single-version-externally-managed not recognize=
d"
-DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
-    --prefix=3D${prefix} \
-    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=3D${datadir}"
+require python-beautifulsoup4.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-beautifulsoup=
4_4.4.1.bb b/meta-openstack/recipes-devtools/python/python3-beautifulsoup=
4_4.4.1.bb
new file mode 100644
index 0000000..3bc9066
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1=
.bb
@@ -0,0 +1,2 @@
+require python-beautifulsoup4.inc
+inherit setuptools3
--=20
2.20.1




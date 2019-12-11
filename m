Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1180.1576029191381945984
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40FFAE01146; Tue, 10 Dec 2019 17:53:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57329E01140
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:53:08 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79989293"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 09:53:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1A8E24CE1C0F
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 09:44:31 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 09:53:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-beautifulsoup4: Remove the recipe
Date: Wed, 11 Dec 2019 09:54:05 +0800
Message-ID: <20191211015405.22539-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1A8E24CE1C0F.A869C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions in meta-openembedded, Remove the recipe=
.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-beautifulsoup4.inc             | 16 ----------------
 .../python/python-beautifulsoup4_4.4.1.bb        |  2 --
 .../python/python3-beautifulsoup4_4.4.1.bb       |  2 --
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-beautif=
ulsoup4.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-beautif=
ulsoup4_4.4.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-beauti=
fulsoup4_4.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4=
.inc b/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
deleted file mode 100644
index 4ff500b..0000000
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
+++ /dev/null
@@ -1,16 +0,0 @@
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
-inherit pypi
-
-# avoid "error: option --single-version-externally-managed not recognize=
d"
-DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
-    --prefix=3D${prefix} \
-    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=3D${datadir}"
diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4=
_4.4.1.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_=
4.4.1.bb
deleted file mode 100644
index 595fe5f..0000000
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.=
bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-beautifulsoup4.inc
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-beautifulsoup=
4_4.4.1.bb b/meta-openstack/recipes-devtools/python/python3-beautifulsoup=
4_4.4.1.bb
deleted file mode 100644
index 3bc9066..0000000
--- a/meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1=
.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-beautifulsoup4.inc
-inherit setuptools3
--=20
2.20.1




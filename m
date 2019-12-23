Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5229.1577065666900980705
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B155E01300; Sun, 22 Dec 2019 17:47:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B618E01164
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:47:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80610024"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:47:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FCE84B3ED8D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:38:58 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:47:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-sqlparse: Remove the recipe
Date: Mon, 23 Dec 2019 09:48:49 +0800
Message-ID: <20191223014849.361-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2FCE84B3ED8D.AC770
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-sqlparse.inc                | 22 -------------------
 .../python/python-sqlparse_0.3.0.bb           |  2 --
 .../python/python3-sqlparse_0.3.0.bb          |  2 --
 3 files changed, 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlpars=
e.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlpars=
e_0.3.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-sqlpar=
se_0.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse.inc b=
/meta-openstack/recipes-devtools/python/python-sqlparse.inc
deleted file mode 100644
index cc55ff7..0000000
--- a/meta-openstack/recipes-devtools/python/python-sqlparse.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Non-validating SQL parser module"
-HOMEPAGE =3D "http://pypi.python.org/pypi/sqlparse"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b136f573f5386001ea3b7b901622=
2fc"
-
-SRC_URI[md5sum] =3D "2ce34181d6b7b234c9f3c0ecd1ffb93e"
-SRC_URI[sha256sum] =3D "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd=
8797d8eb52cdb873"
-
-export BUILD_SYS
-export HOST_SYS
-
-inherit pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0=
.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
deleted file mode 100644
index 2b7773f..0000000
--- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-sqlparse.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.=
0.bb b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
deleted file mode 100644
index 7b3bcf6..0000000
--- a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-sqlparse.inc
--=20
2.20.1




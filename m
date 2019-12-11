Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1158.1576029030694756463
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FCF9E01147; Tue, 10 Dec 2019 17:50:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A841E01145
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:50:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79989155"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 09:50:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 29E1D4B6EC71
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 09:41:49 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 09:50:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-babel: Remove the recipe
Date: Wed, 11 Dec 2019 09:51:23 +0800
Message-ID: <20191211015123.22351-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 29E1D4B6EC71.A8D84
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions in meta-openembedded, Remove the recipe=
.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-babel.inc   | 18 ------------------
 .../python/python-babel_2.3.4.bb               |  2 --
 .../python/python3-babel_2.3.4.bb              |  2 --
 3 files changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-babel.i=
nc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-babel_2=
.3.4.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-babel_=
2.3.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-babel.inc b/me=
ta-openstack/recipes-devtools/python/python-babel.inc
deleted file mode 100644
index 5e133a1..0000000
--- a/meta-openstack/recipes-devtools/python/python-babel.inc
+++ /dev/null
@@ -1,18 +0,0 @@
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
-inherit pypi
-
-CLEANBROKEN =3D "1"
-
-RDEPENDS_${PN} +=3D " \
-    ${PYTHON_PN}-pytz \
-"
diff --git a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb=
 b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
deleted file mode 100644
index 74952d1..0000000
--- a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-babel.inc
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.b=
b b/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
deleted file mode 100644
index 42b0008..0000000
--- a/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-babel.inc
-inherit setuptools3
--=20
2.20.1




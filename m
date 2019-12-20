Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4208.1576807896898262882
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 18:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C04E9E011BD; Thu, 19 Dec 2019 18:11:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB53E011B6
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 18:11:35 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; 
   d="scan'208";a="80550925"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 10:11:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CB324CE1C86
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 10:02:48 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 10:11:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-py: Remove the recipe
Date: Fri, 20 Dec 2019 10:12:35 +0800
Message-ID: <20191220021235.7246-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6CB324CE1C86.A9889
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-py_1.4.26.bb                 | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-py_1.4.=
26.bb

diff --git a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb b=
/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
deleted file mode 100644
index 1ecc092..0000000
--- a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "library with cross-python path, ini-parsing, io, code, =
log facilities"
-HOMEPAGE =3D " http://pylib.org"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479=
de9"
-
-SRC_URI[md5sum] =3D "30c3fd92a53f1a5ed6f3591c1fe75c0e"
-SRC_URI[sha256sum] =3D "28dd0b90d29b386afb552efc4e355c889f4639ce93658a78=
72a2150ece28bb89"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-virtualenv \
-        "
--=20
2.20.1




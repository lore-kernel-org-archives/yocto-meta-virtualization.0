Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4229.1576807281814019272
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 18:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6741DE01235; Thu, 19 Dec 2019 18:01:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BB9BE007DA
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 18:01:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; 
   d="scan'208";a="80550479"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 10:01:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 269A4406AB15
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 09:52:32 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 10:01:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pint: Remove the recipe
Date: Fri, 20 Dec 2019 10:02:18 +0800
Message-ID: <20191220020218.6514-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 269A4406AB15.A70E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pint_0.6.bb                 | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pint_0.=
6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb b/=
meta-openstack/recipes-devtools/python/python-pint_0.6.bb
deleted file mode 100644
index 0e987b5..0000000
--- a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION =3D "Physical quantities module"
-HOMEPAGE =3D "https://pypi.python.org/pypi/Pint"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbccf824202692270a1e0829a62e3f=
47b"
-
-PYPI_PACKAGE =3D "Pint"
-
-# Archived version so we have to overwrite what the pypi class will deri=
ve
-PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/P/${PYPI_PACKA=
GE}/${PYPI_PACKAGE}-${PV}.zip"
-
-SRC_URI[md5sum] =3D "88aa0918019071546b10c5fbdc91ae5e"
-SRC_URI[sha256sum] =3D "b1ab3b589ca4d78689233a007abd5a7eec4ea65302cabaed=
06932d20f2a9e748"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "gmp"
-
-FILES_${PN} +=3D "${datadir}/*"
--=20
2.20.1




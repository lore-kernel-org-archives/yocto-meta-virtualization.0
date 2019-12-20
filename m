Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4587.1576809355916436223
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 18:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70239E011C2; Thu, 19 Dec 2019 18:35:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B67EFE00D00
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 18:35:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; 
   d="scan'208";a="80551699"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 10:35:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 582964CE1A00
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 10:27:06 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 10:35:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pyasn1-modules: Remove the recipe
Date: Fri, 20 Dec 2019 10:36:52 +0800
Message-ID: <20191220023652.7733-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 582964CE1A00.A6E37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pyasn1-modules_0.2.1.bb         | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyasn1-=
modules_0.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pyasn1-modules=
_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-pyasn1-modules_=
0.2.1.bb
deleted file mode 100644
index c812fe6..0000000
--- a/meta-openstack/recipes-devtools/python/python-pyasn1-modules_0.2.1.=
bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "A collection of ASN.1-based protocols modules."
-HOMEPAGE =3D "https://pypi.python.org/pypi/pyasn1-modules/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D280606d9c18f200e03e0c247a=
c61475a"
-
-SRC_URI[md5sum] =3D "ff938698590f314ff9b3d5c48737d899"
-SRC_URI[sha256sum] =3D "af00ea8f2022b6287dc375b2c70f31ab5af83989fc6fe9ea=
cd4976ce26cd7ccc"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-        python-pyasn1 \
-        "
-=09
\ No newline at end of file
--=20
2.20.1




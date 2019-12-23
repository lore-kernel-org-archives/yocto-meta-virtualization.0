Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5107.1577064832595123500
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 258CDE0122B; Sun, 22 Dec 2019 17:33:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9822E00839
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:33:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80609062"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:33:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EEAF74CE1CBA
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:25:00 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:33:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pytest: Remove the recipe
Date: Mon, 23 Dec 2019 09:34:51 +0800
Message-ID: <20191223013451.32146-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: EEAF74CE1CBA.ACC1D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pytest_2.7.0.bb               | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pytest_=
2.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.b=
b b/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
deleted file mode 100644
index 55c784b..0000000
--- a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "pytest: simple powerful testing with Python"
-HOMEPAGE =3D " http://pytest.org"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479=
de9"
-
-SRC_URI[md5sum] =3D "14cde91b1106c937c48497728ea37dc6"
-SRC_URI[sha256sum] =3D "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c5=
3b49cb8d045519d6"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
--=20
2.20.1




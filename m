Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2169.1576035053389079777
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02AF3E01148; Tue, 10 Dec 2019 19:30:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B00DE010D9
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:30:52 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79995663"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:30:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 15E7B4B3ED8D
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:22:12 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:30:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-jinja2: Remove the recipe
Date: Wed, 11 Dec 2019 11:31:46 +0800
Message-ID: <20191211033146.24683-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 15E7B4B3ED8D.AC455
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-jinja2_2.7.3.bb             | 26 -------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jinja2_=
2.7.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.b=
b b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
deleted file mode 100644
index 4ffa968..0000000
--- a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "Python Jinja2: A small but fast and easy to use stand-a=
lone template engine written in pure python."
-HOMEPAGE =3D "https://pypi.python.org/pypi/Jinja2"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20c831f91dd3bd486020f672ba2be=
386"
-
-PYPI_PACKAGE =3D "Jinja2"
-
-SRC_URI[md5sum] =3D "b9dffd2f3b43d673802fe857c8445b1a"
-SRC_URI[sha256sum] =3D "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c=
0d82f8879d4f8fdb"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-io \
-                   python-pickle \
-                   python-crypt \
-                   python-math \
-                   python-netclient \
-                   python-re \
-                   python-textutils \
-                   python-lang \
-                   python-pprint \
-                   python-shell \
-                   python-markupsafe"
-
-CLEANBROKEN =3D "1"
--=20
2.20.1




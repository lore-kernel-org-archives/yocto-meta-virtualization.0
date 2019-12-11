Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2308.1576036192598091574
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75020E010D9; Tue, 10 Dec 2019 19:49:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C83B1E010D9
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:49:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79997731"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:49:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6B0C74CE1A05
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:41:11 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:49:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-lxml: Remove the recipe
Date: Wed, 11 Dec 2019 11:50:46 +0800
Message-ID: <20191211035046.25261-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6B0C74CE1A05.A72B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-lxml_3.3.5.bb               | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lxml_3.=
3.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb =
b/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
deleted file mode 100644
index 0e7dde4..0000000
--- a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Powerful and Pythonic XML processing library combining =
libxml2/libxslt with the ElementTree API."
-HOMEPAGE =3D "http://lxml.de/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df9f1dc24f720c143c2240df41=
fe5073b"
-
-SRC_URI[md5sum] =3D "88c75f4c73fc8f59c9ebb17495044f2f"
-SRC_URI[sha256sum] =3D "6ad6949dc7eea744a30fba77a968dd5910f545220e58bcc8=
13b9df5c793e318a"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        python-beautifulsoup4 \
-        python-cssselect \
-        "
--=20
2.20.1




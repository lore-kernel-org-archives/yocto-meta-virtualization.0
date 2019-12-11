Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2123.1576034159897294076
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BECE2E01147; Tue, 10 Dec 2019 19:15:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 111A8E00E37
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:15:58 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79994845"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:15:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 168124CE20C2
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:07:22 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:15:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cmd2: Remove the recipe
Date: Wed, 11 Dec 2019 11:16:57 +0800
Message-ID: <20191211031657.23664-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 168124CE20C2.AA052
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cmd2_0.6.8.bb     | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cmd2_0.=
6.8.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb =
b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
deleted file mode 100644
index 6e8949d..0000000
--- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "Extra features for standard library's cmd module"
-HOMEPAGE =3D "http://packages.python.org/cmd2/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D21;endline=3D21;md5=3D=
a00047b7e92e0781452d0beba4e7b44e"
-
-SRC_URI[md5sum] =3D "c32c9a897e010c977b50c1ddc13f09fe"
-SRC_URI[sha256sum] =3D "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb16=
7f8819d2d83764a8"
-
-inherit setuptools  pypi
-
-RDEPENDS_${PN} +=3D "python-pyparsing"
--=20
2.20.1




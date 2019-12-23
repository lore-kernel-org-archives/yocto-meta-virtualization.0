Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4982.1577064167885034010
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC754E01300; Sun, 22 Dec 2019 17:22:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D9D9E01162
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:22:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80608055"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:22:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F1FF64CE1BED
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:13:56 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:22:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pymongo: Remove the recipe
Date: Mon, 23 Dec 2019 09:23:47 +0800
Message-ID: <20191223012347.31854-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F1FF64CE1BED.AD7D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pymongo_3.4.0.bb    | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pymongo=
_3.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.=
bb b/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
deleted file mode 100644
index 34dc076..0000000
--- a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Python driver for MongoDB"
-HOMEPAGE =3D "https://pypi.python.org/pypi/pymongo/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a944942e1496af1886903d274ded=
b13"
-=20
-SRC_URI[md5sum] =3D "aa77f88e51e281c9f328cea701bb6f3e"
-SRC_URI[sha256sum] =3D "d359349c6c9ff9f482805f89e66e476846317dc7b1eea979=
d7da9c0857ee2721"
-
-inherit setuptools pypi
--=20
2.20.1




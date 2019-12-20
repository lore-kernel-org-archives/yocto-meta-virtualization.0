Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4421.1576808035885080447
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 18:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8C62E01235; Thu, 19 Dec 2019 18:13:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3E6EE011BD
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 18:13:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; 
   d="scan'208";a="80551029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 10:13:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 849154CE1C93
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 10:05:09 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 10:13:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pyasn1: Remove the recipe
Date: Fri, 20 Dec 2019 10:14:56 +0800
Message-ID: <20191220021456.7410-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 849154CE1C93.A8A28
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pyasn1_0.1.7.bb     | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyasn1_=
0.1.7.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.b=
b b/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
deleted file mode 100644
index 972290d..0000000
--- a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "ASN.1 types and codecs"
-HOMEPAGE =3D "http://sourceforge.net/projects/pyasn1/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae098273b2cf8b4af164ac20e32bd=
df7"
-
-SRC_URI[md5sum] =3D "2cbd80fcd4c7b1c82180d3d76fee18c8"
-SRC_URI[sha256sum] =3D "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7=
ad8f98b25c101eab"
-
-inherit setuptools pypi
--=20
2.20.1




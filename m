Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4238.1576806717866435307
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 17:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5581E011BD; Thu, 19 Dec 2019 17:51:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBFBAE0082A
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 17:51:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; 
   d="scan'208";a="80550069"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 09:51:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7430D4CE1C91
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 09:43:11 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 09:51:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-passlib: Remove the recipe
Date: Fri, 20 Dec 2019 09:52:56 +0800
Message-ID: <20191220015256.5888-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7430D4CE1C91.A7FE1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-passlib_1.6.2.bb    | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-passlib=
_1.6.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.=
bb b/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
deleted file mode 100644
index 78f9b01..0000000
--- a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "comprehensive password hashing framework supporting ove=
r 30 schemes"
-HOMEPAGE =3D "http://passlib.googlecode.com"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dec76a9db3f987418e132c0f0210e5=
ab1"
-
-SRC_URI[md5sum] =3D "2f872ae7c72ca338634c618f2cff5863"
-SRC_URI[sha256sum] =3D "e987f6000d16272f75314c7147eb015727e8532a3b747b1a=
8fb58e154c68392d"
-
-inherit setuptools pypi
--=20
2.20.1




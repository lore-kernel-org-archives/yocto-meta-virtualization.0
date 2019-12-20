Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4268.1576806957427094707
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 17:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 018FCE01235; Thu, 19 Dec 2019 17:55:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50742E011B6
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 17:55:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; 
   d="scan'208";a="80550262"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 09:55:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A9314CE1C97
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 09:47:09 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 09:55:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pexpect: Remove the recipe
Date: Fri, 20 Dec 2019 09:56:55 +0800
Message-ID: <20191220015655.6078-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2A9314CE1C97.A93BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pexpect_3.3.bb                | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pexpect=
_3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb=
 b/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
deleted file mode 100644
index 8b93fdf..0000000
--- a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "A Pure Python Expect like Module for Python"
-SECTION =3D "devel/python"
-LICENSE =3D "PSF"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25d9a0770ba69a9965acc894e9f3=
644"
-
-inherit distutils pypi
-
-RDEPENDS_${PN} =3D "\
-    python-core \
-    python-io \
-    python-terminal \
-    python-resource \
-    python-fcntl \
-"
-
-SRC_URI[md5sum] =3D "0de72541d3f1374b795472fed841dce8"
-SRC_URI[sha256sum] =3D "dfea618d43e83cfff21504f18f98019ba520f330e4142e51=
85ef7c73527de5ba"
--=20
2.20.1




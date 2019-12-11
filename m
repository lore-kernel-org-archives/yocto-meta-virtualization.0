Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2456.1576036430096389493
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4F53E01147; Tue, 10 Dec 2019 19:53:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE2C4E010D7
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:53:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79997876"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:53:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B920D4B6EC71
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:45:11 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:53:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-markupsafe: Remove the recipe
Date: Wed, 11 Dec 2019 11:54:47 +0800
Message-ID: <20191211035447.25435-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B920D4B6EC71.A7761
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-markupsafe_0.18.bb              | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-markups=
afe_0.18.bb

diff --git a/meta-openstack/recipes-devtools/python/python-markupsafe_0.1=
8.bb b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
deleted file mode 100644
index 4551d46..0000000
--- a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "Implements a XML/HTML/XHTML Markup safe string for Pyth=
on"
-HOMEPAGE =3D "http://github.com/mitsuhiko/markupsafe"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc6d1adcf45d69359f256c1cea3254=
127"
-
-PYPI_PACKAGE =3D "MarkupSafe"
-
-SRC_URI[md5sum] =3D "f8d252fd05371e51dec2fe9a36890687"
-SRC_URI[sha256sum] =3D "b7d5d688bdd345bfa897777d297756688cf02e1b3742c568=
85e2e5c2b996ff82"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-re"
-
--=20
2.20.1




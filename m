Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.7855.1575876067211613313
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Dec 2019 23:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6D96E010AA; Sun,  8 Dec 2019 23:21:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59CC5E00571
	for <meta-virtualization@yoctoproject.org>; Sun,  8 Dec 2019 23:21:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; 
   d="scan'208";a="79859890"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Dec 2019 15:21:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3ED954CE1C9E
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Dec 2019 15:12:29 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 9 Dec 2019 15:21:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-greenlet: Remove the recipe
Date: Mon, 9 Dec 2019 15:21:53 +0800
Message-ID: <20191209072153.5389-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3ED954CE1C9E.AC554
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-oe,I want =
to remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-greenlet_0.4.5.bb               | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-greenle=
t_0.4.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5=
.bb b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
deleted file mode 100644
index 2f5824f..0000000
--- a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Python lightweight in-process concurrent programming"
-HOMEPAGE =3D "http://pypi.python.org/pypi/greenlet"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT & PSF"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D03143d7a1a9f5d8a0fee825f24ca9=
c36 \
-                    file://LICENSE.PSF;md5=3Dc106931d9429eda0492617f037b=
8f69a"
-
-# Archived version so we have to overwrite what the pypi class will deri=
ve
-PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/g/greenlet/gre=
enlet-${PV}.zip"
-
-SRC_URI[md5sum] =3D "ce383f6475e6311cf8932ea779938703"
-SRC_URI[sha256sum] =3D "b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c0=
34d1d8cbf08e2dbe"
-
-inherit distutils pypi
-
--=20
2.20.1




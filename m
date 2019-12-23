Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5288.1577066036985111416
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58F3EE01300; Sun, 22 Dec 2019 17:53:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89BE3E01164
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:53:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80610244"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:53:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 56BC94B6EC6D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:45:07 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:53:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-waitress: Remove the recipe
Date: Mon, 23 Dec 2019 09:54:57 +0800
Message-ID: <20191223015457.969-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 56BC94B6EC6D.AA77B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-waitress.inc        | 10 ----------
 .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 --
 .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 --
 3 files changed, 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-waitres=
s.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-waitres=
s_1.3.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-waitre=
ss_1.3.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-waitress.inc b=
/meta-openstack/recipes-devtools/python/python-waitress.inc
deleted file mode 100644
index 1053983..0000000
--- a/meta-openstack/recipes-devtools/python/python-waitress.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Waitress WSGI server"
-HOMEPAGE =3D "https://pypi.python.org/pypi/waitress/"
-SECTION =3D "devel/python"
-LICENSE =3D "ZPL-2.1"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27=
a6966b2"
-
-SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
-SRC_URI[sha256sum] =3D "278e09d6849acc1365404bbf7d790d0423b159802e850c72=
6e8cd0a126a2dac7"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1=
.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
deleted file mode 100644
index ecce64c..0000000
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-waitress.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.=
1.bb b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
deleted file mode 100644
index 89e8208..0000000
--- a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-waitress.inc
--=20
2.20.1




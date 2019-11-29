Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4153.1574996150175889099
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 18:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3B49E010B0; Thu, 28 Nov 2019 18:55:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B0A0E010AC
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:55:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79247150"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 10:55:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B8F0406AB15
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:47:20 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 10:55:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-dogpile.core: Add python3 version
Date: Fri, 29 Nov 2019 10:56:31 +0800
Message-ID: <20191129025631.445-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1B8F0406AB15.A739C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-dogpile.core.inc  | 12 ++++++++++++
 .../python/python-dogpile.core_0.4.1.bb              | 12 ++----------
 .../python/python3-dogpile.core_0.4.1.bb             |  4 ++++
 3 files changed, 18 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-dogpile=
.core.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-dogpil=
e.core_0.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core.i=
nc b/meta-openstack/recipes-devtools/python/python-dogpile.core.inc
new file mode 100644
index 0000000..9824321
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.core.inc
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Python Dogpile Core: Dogpile is basically the locking c=
ode extracted from the Beaker package, for simple and generic usage."
+HOMEPAGE =3D "https://pypi.python.org/pypi/dogpile.core"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0401fd56584d7b3d4be91690672ec=
433"
+
+SRC_URI[md5sum] =3D "01cb19f52bba3e95c9b560f39341f045"
+SRC_URI[sha256sum] =3D "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3=
743a863cc9dbed76"
+
+inherit pypi
+
+
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core_0=
.4.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.=
1.bb
index 9e36074..7af5cc8 100644
--- a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
@@ -1,12 +1,4 @@
-DESCRIPTION =3D "Python Dogpile Core: Dogpile is basically the locking c=
ode extracted from the Beaker package, for simple and generic usage."
-HOMEPAGE =3D "https://pypi.python.org/pypi/dogpile.core"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0401fd56584d7b3d4be91690672ec=
433"
-
-SRC_URI[md5sum] =3D "01cb19f52bba3e95c9b560f39341f045"
-SRC_URI[sha256sum] =3D "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3=
743a863cc9dbed76"
-
-inherit setuptools pypi
+require python-dogpile.core.inc
+inherit setuptools
=20
=20
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.core_=
0.4.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.=
4.1.bb
new file mode 100644
index 0000000..d81698f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.4.1.b=
b
@@ -0,0 +1,4 @@
+require python-dogpile.core.inc
+inherit setuptools3
+
+
--=20
2.20.1




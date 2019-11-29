Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4104.1574995705069218915
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 18:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B26DE010B0; Thu, 28 Nov 2019 18:48:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C639CE010AC
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:48:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79246880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 10:48:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 337D94CE1BF0
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:39:55 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 10:48:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-deprecation: Add python3 version
Date: Fri, 29 Nov 2019 10:49:06 +0800
Message-ID: <20191129024906.31642-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 337D94CE1BF0.AA55C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-deprecation.inc   | 10 ++++++++++
 .../python/python-deprecation_1.0.1.bb               | 12 ++----------
 .../python/python3-deprecation_1.0.1.bb              |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-depreca=
tion.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-deprec=
ation_1.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-deprecation.in=
c b/meta-openstack/recipes-devtools/python/python-deprecation.inc
new file mode 100644
index 0000000..eec4dd1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-deprecation.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "A library to handle automated deprecations"
+HOMEPAGE =3D "http://deprecation.readthedocs.io/en/latest/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3De3fc50a88d0a364313df4b21=
ef20c29e"
+
+SRC_URI[md5sum] =3D "d8a318c66d442dc4b900e070267ed9aa"
+SRC_URI[sha256sum] =3D "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbf=
c16076b14b3ad935"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-deprecation_1.=
0.1.bb b/meta-openstack/recipes-devtools/python/python-deprecation_1.0.1.=
bb
index 53e3665..9f155a2 100644
--- a/meta-openstack/recipes-devtools/python/python-deprecation_1.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-deprecation_1.0.1.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "A library to handle automated deprecations"
-HOMEPAGE =3D "http://deprecation.readthedocs.io/en/latest/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3De3fc50a88d0a364313df4b21=
ef20c29e"
-
-SRC_URI[md5sum] =3D "d8a318c66d442dc4b900e070267ed9aa"
-SRC_URI[sha256sum] =3D "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbf=
c16076b14b3ad935"
-
-inherit setuptools pypi
+require python-deprecation.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-deprecation_1=
.0.1.bb b/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.=
1.bb
new file mode 100644
index 0000000..d2e0f1c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
@@ -0,0 +1,2 @@
+require python-deprecation.inc
+inherit setuptools3
--=20
2.20.1




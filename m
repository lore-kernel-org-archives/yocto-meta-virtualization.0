Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2462.1575508305084718539
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 17:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61122E00F08; Wed,  4 Dec 2019 17:11:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76A89E00F04
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 17:11:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; 
   d="scan'208";a="79609089"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 09:11:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 96D0F4CE1C0D
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 09:03:10 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 09:11:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-rjsmin: Add python3 version
Date: Thu, 5 Dec 2019 09:12:29 +0800
Message-ID: <20191205011229.12675-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 96D0F4CE1C0D.AAB38
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-rjsmin.inc   | 15 +++++++++++++++
 .../python/python-rjsmin_1.0.12.bb              | 17 ++---------------
 .../python/python3-rjsmin_1.0.12.bb             |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rjsmin.=
inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rjsmin=
_1.0.12.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin.inc b/m=
eta-openstack/recipes-devtools/python/python-rjsmin.inc
new file mode 100644
index 0000000..0305a33
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rjsmin.inc
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "rJSmin is a javascript minifier written in python."
+HOMEPAGE =3D "http://opensource.perlig.de/rjsmin/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
+
+SRC_URI[md5sum] =3D "9f67e133c88df5497d3da847603da9bf"
+SRC_URI[sha256sum] =3D "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e5=
0c7c02e4401386f1"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D " \
+        "
+
+CLEANBROKEN =3D "1"
diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.=
bb b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
index 508390a..528c4a0 100644
--- a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
+++ b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
@@ -1,15 +1,2 @@
-DESCRIPTION =3D "rJSmin is a javascript minifier written in python."
-HOMEPAGE =3D "http://opensource.perlig.de/rjsmin/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
-
-SRC_URI[md5sum] =3D "9f67e133c88df5497d3da847603da9bf"
-SRC_URI[sha256sum] =3D "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e5=
0c7c02e4401386f1"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-        "
-
-CLEANBROKEN =3D "1"
+require python-rjsmin.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12=
.bb b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
new file mode 100644
index 0000000..9890e14
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
@@ -0,0 +1,2 @@
+require python-rjsmin.inc
+inherit setuptools3
--=20
2.20.1




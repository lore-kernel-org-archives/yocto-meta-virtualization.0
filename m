Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4741.1578969277193332547
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89295E01528; Mon, 13 Jan 2020 18:34:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D427E01383
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:34:34 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81773744"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:34:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A94434CE1CBB
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 10:25:28 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:34:32 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:34:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-voluptuous: Add python3 version
Date: Tue, 14 Jan 2020 10:36:01 +0800
Message-ID: <20200114023601.29016-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A94434CE1CBB.AD351
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-voluptuous.inc | 13 +++++++++++++
 .../python/python-voluptuous_0.10.5.bb            | 15 ++-------------
 .../python/python3-voluptuous_0.10.5.bb           |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-voluptu=
ous.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-volupt=
uous_0.10.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-voluptuous.inc=
 b/meta-openstack/recipes-devtools/python/python-voluptuous.inc
new file mode 100644
index 0000000..7537aee
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-voluptuous.inc
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Voluptuous is a Python data validation library"
+HOMEPAGE =3D "https://pypi.python.org/pypi/voluptuous/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9855ba150f2edb00d8e7a41554896=
ffb"
+
+SRC_URI[md5sum] =3D "e3fc99b75618d384cad63bc71b6507bc"
+SRC_URI[sha256sum] =3D "7a7466f8dc3666a292d186d1d871a47bf2120836ccb900d5=
ba904674957a2396"
+
+inherit pypi
+
+RDEPENDS_${PN} =3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-voluptuous_0.1=
0.5.bb b/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.=
bb
index 0ad4e05..d1970fb 100644
--- a/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb
@@ -1,13 +1,2 @@
-DESCRIPTION =3D "Voluptuous is a Python data validation library"
-HOMEPAGE =3D "https://pypi.python.org/pypi/voluptuous/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9855ba150f2edb00d8e7a41554896=
ffb"
-
-SRC_URI[md5sum] =3D "e3fc99b75618d384cad63bc71b6507bc"
-SRC_URI[sha256sum] =3D "7a7466f8dc3666a292d186d1d871a47bf2120836ccb900d5=
ba904674957a2396"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} =3D " \
-        "
+require python-voluptuous.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-voluptuous_0.=
10.5.bb b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.=
5.bb
new file mode 100644
index 0000000..a869608
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.5.bb
@@ -0,0 +1,2 @@
+require python-voluptuous.inc
+inherit setuptools3
--=20
2.20.1




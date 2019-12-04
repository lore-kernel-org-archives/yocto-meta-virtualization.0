Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1105.1575447626252130373
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 00:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE932E010AF; Wed,  4 Dec 2019 00:20:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 588FFE00736
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 00:20:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79572289"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:20:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B56AF4CE1C11
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 16:11:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:20:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-retrying: Add python3 version
Date: Wed, 4 Dec 2019 16:21:11 +0800
Message-ID: <20191204082111.7582-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B56AF4CE1C11.A99FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-retrying.inc                | 20 +++++++++++++++++
 .../python/python-retrying_1.3.3.bb           | 22 ++-----------------
 .../python/python3-retrying_1.3.3.bb          |  2 ++
 3 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-retryin=
g.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-retryi=
ng_1.3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-retrying.inc b=
/meta-openstack/recipes-devtools/python/python-retrying.inc
new file mode 100644
index 0000000..b33dc90
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-retrying.inc
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Retrying"
+HOMEPAGE =3D "https://github.com/rholder/retrying"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D175792518e4ac015ab6696d16c4f6=
07e"
+
+SRC_URI[md5sum] =3D "2a126aeef8b21324ecdeac15ff46ef17"
+SRC_URI[sha256sum] =3D "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24=
b37367b0bb41973b"
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default:=20
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3=
.bb b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
index 55c94d9..19bf62c 100644
--- a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
@@ -1,20 +1,2 @@
-DESCRIPTION =3D "Retrying"
-HOMEPAGE =3D "https://github.com/rholder/retrying"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D175792518e4ac015ab6696d16c4f6=
07e"
-
-SRC_URI[md5sum] =3D "2a126aeef8b21324ecdeac15ff46ef17"
-SRC_URI[sha256sum] =3D "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24=
b37367b0bb41973b"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
+require python-retrying.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-retrying_1.3.=
3.bb b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
new file mode 100644
index 0000000..9f001fe
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
@@ -0,0 +1,2 @@
+require python-retrying.inc
+inherit setuptools3
--=20
2.20.1




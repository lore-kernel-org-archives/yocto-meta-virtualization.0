Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4063.1574995135459556116
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 18:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 066E3E010AF; Thu, 28 Nov 2019 18:38:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1A28E007AE
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:38:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79246563"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 10:38:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 688484CE1C0A
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:30:28 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 10:38:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cssselect: Add python3 version
Date: Fri, 29 Nov 2019 10:39:39 +0800
Message-ID: <20191129023939.30537-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 688484CE1C0A.AA07B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-cssselect.inc               | 20 +++++++++++++++++
 .../python/python-cssselect_0.9.1.bb          | 22 ++-----------------
 .../python/python3-cssselect_0.9.1.bb         |  2 ++
 3 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-csssele=
ct.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-csssel=
ect_0.9.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cssselect.inc =
b/meta-openstack/recipes-devtools/python/python-cssselect.inc
new file mode 100644
index 0000000..377560e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cssselect.inc
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "cssselect parses CSS3 Selectors and translates them to =
XPath 1.0"
+HOMEPAGE =3D "http://packages.python.org/cssselect/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D952026b3fd2f625f2a3c0aa21da24=
93d"
+
+SRC_URI[md5sum] =3D "c74f45966277dc7a0f768b9b0f3522ac"
+SRC_URI[sha256sum] =3D "0535a7e27014874b27ae3a4d33e8749e345bdfa627661952=
08b7996bf1100682"
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
diff --git a/meta-openstack/recipes-devtools/python/python-cssselect_0.9.=
1.bb b/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
index 0c4426c..dfd4e84 100644
--- a/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
@@ -1,20 +1,2 @@
-DESCRIPTION =3D "cssselect parses CSS3 Selectors and translates them to =
XPath 1.0"
-HOMEPAGE =3D "http://packages.python.org/cssselect/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D952026b3fd2f625f2a3c0aa21da24=
93d"
-
-SRC_URI[md5sum] =3D "c74f45966277dc7a0f768b9b0f3522ac"
-SRC_URI[sha256sum] =3D "0535a7e27014874b27ae3a4d33e8749e345bdfa627661952=
08b7996bf1100682"
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
+require python-cssselect.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-cssselect_0.9=
.1.bb b/meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb
new file mode 100644
index 0000000..de194f8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb
@@ -0,0 +1,2 @@
+require python-cssselect.inc
+inherit setuptools3
--=20
2.20.1




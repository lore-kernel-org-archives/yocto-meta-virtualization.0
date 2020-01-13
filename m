Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.34226.1578890786122571776
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jan 2020 20:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABF4EE013DC; Sun, 12 Jan 2020 20:46:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A760E007DA
	for <meta-virtualization@yoctoproject.org>; Sun, 12 Jan 2020 20:46:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; 
   d="scan'208";a="81712510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 12:46:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 009AC4CE1BE8
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 12:37:17 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 12:46:22 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 13 Jan 2020 12:46:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pastedeploy: Add python3 version
Date: Mon, 13 Jan 2020 12:47:46 +0800
Message-ID: <20200113044746.32393-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 009AC4CE1BE8.A1EBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pastedeploy.inc              | 16 ++++++++++++++++
 .../python/python-pastedeploy_2.0.1.bb         | 18 ++----------------
 .../python/python3-pastedeploy_2.0.1.bb        |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pastede=
ploy.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pasted=
eploy_2.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy.in=
c b/meta-openstack/recipes-devtools/python/python-pastedeploy.inc
new file mode 100644
index 0000000..db0b4ac
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pastedeploy.inc
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Load, configure, and compose WSGI applications and serv=
ers"
+HOMEPAGE =3D "http://pythonpaste.org/deploy/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Dd6c3089319205d7e6129f0213b7e=
949f"
+
+PYPI_PACKAGE =3D "PasteDeploy"
+
+SRC_URI[md5sum] =3D "6193afccc0982abedb9b7711d0d6adb0"
+SRC_URI[sha256sum] =3D "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f6748=
8122d6d0d772350a"
+
+inherit pypi
+
+DEPENDS +=3D "${PYTHON_PN}-pytest-runner-native"
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-paste"
diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_2.=
0.1.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.=
bb
index 65668fa..8457858 100644
--- a/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
@@ -1,16 +1,2 @@
-DESCRIPTION =3D "Load, configure, and compose WSGI applications and serv=
ers"
-HOMEPAGE =3D "http://pythonpaste.org/deploy/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Dd6c3089319205d7e6129f0213b7e=
949f"
-
-PYPI_PACKAGE =3D "PasteDeploy"
-
-SRC_URI[md5sum] =3D "6193afccc0982abedb9b7711d0d6adb0"
-SRC_URI[sha256sum] =3D "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f6748=
8122d6d0d772350a"
-
-inherit setuptools pypi
-
-DEPENDS +=3D "python-pytest-runner-native"
-
-RDEPENDS_${PN} +=3D "python-paste"
+require python-pastedeploy.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pastedeploy_2=
.0.1.bb b/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.=
1.bb
new file mode 100644
index 0000000..91c31a1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
@@ -0,0 +1,2 @@
+require python-pastedeploy.inc
+inherit setuptools3
--=20
2.20.1




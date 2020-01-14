Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4177.1578966528762307639
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 17:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B3EAE01402; Mon, 13 Jan 2020 17:48:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AEDBE01387
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 17:48:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81770121"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 09:48:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id F196F4CE20E6
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 09:39:31 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 09:48:34 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 09:48:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-tempita: Add python3 version
Date: Tue, 14 Jan 2020 09:50:04 +0800
Message-ID: <20200114015004.11330-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F196F4CE20E6.AC987
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-tempita.inc     | 12 ++++++++++++
 .../python/python-tempita_0.5.3dev.bb              | 14 ++------------
 .../python/python3-tempita_0.5.3dev.bb             |  2 ++
 3 files changed, 16 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-tempita=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-tempit=
a_0.5.3dev.bb

diff --git a/meta-openstack/recipes-devtools/python/python-tempita.inc b/=
meta-openstack/recipes-devtools/python/python-tempita.inc
new file mode 100644
index 0000000..c511c12
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-tempita.inc
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "A very small text templating language"
+HOMEPAGE =3D "http://pythonpaste.org/tempita/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D33;endline=3D33;md5=3D=
2d33c00f47720c7e35e1fdb4b9fab027"
+
+PYPI_PACKAGE =3D "Tempita"
+
+SRC_URI[md5sum] =3D "365c3b4f36435e2178902d5619301140"
+SRC_URI[sha256sum] =3D "38392bb708a10128419f75fa9120a6d2c8d137013b353968=
e5008a77a5c7a2ca"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-tempita_0.5.3d=
ev.bb b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
index 31d5ddc..8a8e8a2 100644
--- a/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
+++ b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
@@ -1,12 +1,2 @@
-DESCRIPTION =3D "A very small text templating language"
-HOMEPAGE =3D "http://pythonpaste.org/tempita/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D33;endline=3D33;md5=3D=
2d33c00f47720c7e35e1fdb4b9fab027"
-
-PYPI_PACKAGE =3D "Tempita"
-
-SRC_URI[md5sum] =3D "365c3b4f36435e2178902d5619301140"
-SRC_URI[sha256sum] =3D "38392bb708a10128419f75fa9120a6d2c8d137013b353968=
e5008a77a5c7a2ca"
-
-inherit setuptools pypi
+require python-tempita.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3=
dev.bb b/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.=
bb
new file mode 100644
index 0000000..a0123a6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.bb
@@ -0,0 +1,2 @@
+require python-tempita.inc
+inherit setuptools3
--=20
2.20.1




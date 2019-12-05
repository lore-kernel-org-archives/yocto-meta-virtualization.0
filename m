Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2869.1575510168464308428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 17:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 118B4E00F0A; Wed,  4 Dec 2019 17:42:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F7D4E00F05
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 17:42:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; 
   d="scan'208";a="79610902"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 09:42:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 449AF4CE151A
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 09:34:16 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 09:42:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-saharaclient: Add python3 version
Date: Thu, 5 Dec 2019 09:43:34 +0800
Message-ID: <20191205014334.14042-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 449AF4CE151A.AA95E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-saharaclient.inc            | 28 +++++++++++++++++
 .../python/python-saharaclient_git.bb         | 30 +------------------
 .../python/python3-saharaclient_git.bb        |  2 ++
 3 files changed, 31 insertions(+), 29 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-saharac=
lient.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-sahara=
client_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient.i=
nc b/meta-openstack/recipes-devtools/python/python-saharaclient.inc
new file mode 100644
index 0000000..91549ae
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-saharaclient.inc
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "CLI and python client library for OpenStack Sahara"
+HOMEPAGE =3D "https://launchpad.net/sahara"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa37d5=
2a2"
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pbr-native \
+"
+
+RDEPENDS_${PN} +=3D " \
+	${PYTHON_PN}-pbr \
+	"
+
+SRCNAME =3D "saharaclient"
+
+SRC_URI =3D "git://github.com/openstack/python-saharaclient.git;branch=3D=
master"
+
+PV =3D "2.3.0+git${SRCPV}"
+SRCREV =3D "3107b452467537f4eef3d9ecfb5e35d110d19662"
+S =3D "${WORKDIR}/git"
+
diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient_g=
it.bb b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
index 0d571c9..4b9587f 100644
--- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
@@ -1,30 +1,2 @@
-DESCRIPTION =3D "CLI and python client library for OpenStack Sahara"
-HOMEPAGE =3D "https://launchpad.net/sahara"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa37d5=
2a2"
-
-DEPENDS +=3D " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS +=3D " \
-        python-pbr-native \
-"
-
-RDEPENDS_${PN} +=3D " \
-	python-pbr \
-	"
-
-SRCNAME =3D "saharaclient"
-
-SRC_URI =3D "git://github.com/openstack/python-saharaclient.git;branch=3D=
master"
-
-PV =3D "2.3.0+git${SRCPV}"
-SRCREV =3D "3107b452467537f4eef3d9ecfb5e35d110d19662"
-S =3D "${WORKDIR}/git"
-
+require python-saharaclient.inc
 inherit setuptools
-
diff --git a/meta-openstack/recipes-devtools/python/python3-saharaclient_=
git.bb b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.=
bb
new file mode 100644
index 0000000..806cd76
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
@@ -0,0 +1,2 @@
+require python-saharaclient.inc
+inherit setuptools3
--=20
2.20.1




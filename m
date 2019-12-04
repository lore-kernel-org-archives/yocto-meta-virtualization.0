Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.883.1575445566723688723
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 23:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B7B4E00ED3; Tue,  3 Dec 2019 23:46:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCFA6E00848
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 23:46:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79570209"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 15:46:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D18F4CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 15:37:32 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 15:46:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pytest-salt: Add python3 version
Date: Wed, 4 Dec 2019 15:46:49 +0800
Message-ID: <20191204074649.31626-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2D18F4CE1A0C.A8B96
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pytest-salt.inc             | 21 +++++++++++++++++
 .../python/python-pytest-salt_2017.7.0.bb     | 23 +------------------
 .../python/python3-pytest-salt_2017.7.0.bb    |  2 ++
 3 files changed, 24 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pytest-=
salt.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pytest=
-salt_2017.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt.in=
c b/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
new file mode 100644
index 0000000..1f82763
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
@@ -0,0 +1,21 @@
+SUMMARY =3D "This pytest plugin will allow the Salt Daemons to be used i=
n tests."
+HOMEPAGE =3D "https://github.com/saltstack/pytest-salt"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa818a259cbed7ce8bc2a22d35a46=
4fc"
+
+SRCNAME =3D "pytest-salt"
+SRC_URI =3D "git://github.com/saltstack/${SRCNAME}.git;branch=3Dmaster"
+
+SRC_URI[md5sum] =3D "c598d7db87ea52cdeb067d7596b3b0b1"
+SRC_URI[sha256sum] =3D "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c4113=
5d754cc5b65e2494"
+
+SRCREV =3D "feb5031f80cf84b113ebe69543cdd44b6a373d21"
+S =3D "${WORKDIR}/git"
+
+RDEPENDS_${PN} =3D " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-tempdir \
+    ${PYTHON_PN}-pytest-helpers-namespace \
+    ${PYTHON_PN}-psutil \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt_20=
17.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest-salt_201=
7.7.0.bb
index e2cf1cd..e599e77 100644
--- a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.=
bb
+++ b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.=
bb
@@ -1,23 +1,2 @@
-SUMMARY =3D "This pytest plugin will allow the Salt Daemons to be used i=
n tests."
-HOMEPAGE =3D "https://github.com/saltstack/pytest-salt"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa818a259cbed7ce8bc2a22d35a46=
4fc"
-
-SRCNAME =3D "pytest-salt"
-SRC_URI =3D "git://github.com/saltstack/${SRCNAME}.git;branch=3Dmaster"
-
-SRC_URI[md5sum] =3D "c598d7db87ea52cdeb067d7596b3b0b1"
-SRC_URI[sha256sum] =3D "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c4113=
5d754cc5b65e2494"
-
-SRCREV =3D "feb5031f80cf84b113ebe69543cdd44b6a373d21"
-S =3D "${WORKDIR}/git"
-
+require python-pytest-salt.inc
 inherit setuptools
-
-RDEPENDS_${PN} =3D " \
-    python-pytest \
-    python-pytest-tempdir \
-    python-pytest-helpers-namespace \
-    python-psutil \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python3-pytest-salt_2=
017.7.0.bb b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2=
017.7.0.bb
new file mode 100644
index 0000000..4e33265
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0=
.bb
@@ -0,0 +1,2 @@
+require python-pytest-salt.inc
+inherit setuptools3
--=20
2.20.1




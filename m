Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.65.1578289479099110872
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 21:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EEE1E01450; Sun,  5 Jan 2020 21:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15FE4E01348
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 21:44:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81335372"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 13:44:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 07D34406AB15
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 13:35:35 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 13:44:32 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 13:44:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-bootswatch: Add python3 version
Date: Mon, 6 Jan 2020 13:45:50 +0800
Message-ID: <20200106054550.20464-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 07D34406AB15.AC225
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-bootswatch.inc      | 19 +++++++++++++++++
 .../python-xstatic-bootswatch_3.3.7.0.bb      | 21 ++-----------------
 .../python3-xstatic-bootswatch_3.3.7.0.bb     |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-bootswatch.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-bootswatch_3.3.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootsw=
atch.inc b/meta-openstack/recipes-devtools/python/python-xstatic-bootswat=
ch.inc
new file mode 100644
index 0000000..60b978a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch.in=
c
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "bootswatch javascript library packaged for setuptools (=
easy_install) / pip."
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-bootswatch"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+PYPI_PACKAGE =3D "XStatic-bootswatch"
+
+SRC_URI[md5sum] =3D "422f09e076ff1741b76a9f7554ceca32"
+SRC_URI[sha256sum] =3D "93ee5863c1ec07212fe12ae137a10708b4102720391d460f=
061dd3f441ba3b6e"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootsw=
atch_3.3.7.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-b=
ootswatch_3.3.7.0.bb
index 1b95871..6e36198 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.=
3.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.=
3.7.0.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "bootswatch javascript library packaged for setuptools (=
easy_install) / pip."
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-bootswatch"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-PYPI_PACKAGE =3D "XStatic-bootswatch"
-
-SRC_URI[md5sum] =3D "422f09e076ff1741b76a9f7554ceca32"
-SRC_URI[sha256sum] =3D "93ee5863c1ec07212fe12ae137a10708b4102720391d460f=
061dd3f441ba3b6e"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-bootswatch.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-boots=
watch_3.3.7.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic=
-bootswatch_3.3.7.0.bb
new file mode 100644
index 0000000..5a7d5f8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootswatch_3=
.3.7.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-bootswatch.inc
+inherit setuptools3
--=20
2.20.1




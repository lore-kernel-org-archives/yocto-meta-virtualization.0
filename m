Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4320.1578967095988677266
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 17:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B435E01402; Mon, 13 Jan 2020 17:58:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 783C3E00CAE
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 17:58:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81770900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 09:58:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A223E4CE1C86
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 09:49:04 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 09:58:07 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 09:58:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-testrepository: Add python3 version
Date: Tue, 14 Jan 2020 09:59:37 +0800
Message-ID: <20200114015937.20210-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A223E4CE1C86.ABFDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-testrepository.inc           | 17 +++++++++++++++++
 .../python/python-testrepository_0.0.20.bb     | 18 ++----------------
 .../python/python3-testrepository_0.0.20.bb    |  3 +++
 3 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-testrep=
ository.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-testre=
pository_0.0.20.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testrepository=
.inc b/meta-openstack/recipes-devtools/python/python-testrepository.inc
new file mode 100644
index 0000000..673141d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-testrepository.inc
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "A repository of test results"
+HOMEPAGE =3D "https://pypi.python.org/pypi/testrepository/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df19071a777e237c55ec3ab83284b3=
1b8"
+
+SRC_URI[md5sum] =3D "f648b0aceeca4fcd5f8a62eeedea289b"
+SRC_URI[sha256sum] =3D "752449bc98c20253ec4611c40564aea93d435a5bf3ff6722=
08e01cc10e5858eb"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-subunit \
+                   ${PYTHON_PN}-extras \
+"
+
+CLEANBROKEN =3D "1"
+
diff --git a/meta-openstack/recipes-devtools/python/python-testrepository=
_0.0.20.bb b/meta-openstack/recipes-devtools/python/python-testrepository=
_0.0.20.bb
index 79be868..3788ce1 100644
--- a/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20=
.bb
+++ b/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20=
.bb
@@ -1,17 +1,3 @@
-DESCRIPTION =3D "A repository of test results"
-HOMEPAGE =3D "https://pypi.python.org/pypi/testrepository/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df19071a777e237c55ec3ab83284b3=
1b8"
-
-SRC_URI[md5sum] =3D "f648b0aceeca4fcd5f8a62eeedea289b"
-SRC_URI[sha256sum] =3D "752449bc98c20253ec4611c40564aea93d435a5bf3ff6722=
08e01cc10e5858eb"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-subunit \
-                   python-extras \
-"
-
-CLEANBROKEN =3D "1"
+require python-testrepository.inc
+inherit setuptools
=20
diff --git a/meta-openstack/recipes-devtools/python/python3-testrepositor=
y_0.0.20.bb b/meta-openstack/recipes-devtools/python/python3-testreposito=
ry_0.0.20.bb
new file mode 100644
index 0000000..a01b4c2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-testrepository_0.0.2=
0.bb
@@ -0,0 +1,3 @@
+require python-testrepository.inc
+inherit setuptools3
+
--=20
2.20.1




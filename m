Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.59.1575438832924201064
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 21:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94173E010AE; Tue,  3 Dec 2019 21:53:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23EEEE00EC7
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 21:53:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79561900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 13:53:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2CDB14CE1C09
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 13:45:20 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 13:53:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-ordereddict: Add python3 version
Date: Wed, 4 Dec 2019 13:54:37 +0800
Message-ID: <20191204055437.18844-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2CDB14CE1C09.A8106
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-ordereddict.inc             | 21 +++++++++++++++++
 .../python/python-ordereddict_1.1.bb          | 23 ++-----------------
 .../python/python3-ordereddict_1.1.bb         |  2 ++
 3 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-ordered=
dict.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-ordere=
ddict_1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict.in=
c b/meta-openstack/recipes-devtools/python/python-ordereddict.inc
new file mode 100644
index 0000000..fff4bf6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-ordereddict.inc
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "A drop-in substitute for Py2.7's new collections.Ordere=
dDict that works in Python 2.4-2.6."
+HOMEPAGE =3D "https://pypi.python.org/pypi/ordereddict"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7f0267460024072a9bbf135ee87a4=
1b8"
+
+SRC_URI[md5sum] =3D "a0ed854ee442051b249bfad0f638bbec"
+SRC_URI[sha256sum] =3D "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3=
fab7bf6d43f01b1f"
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
+    ${PYTHON_PN}-pip \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict_1.=
1.bb b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
index 6102ecb..9aa3f3e 100644
--- a/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
@@ -1,21 +1,2 @@
-DESCRIPTION =3D "A drop-in substitute for Py2.7's new collections.Ordere=
dDict that works in Python 2.4-2.6."
-HOMEPAGE =3D "https://pypi.python.org/pypi/ordereddict"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7f0267460024072a9bbf135ee87a4=
1b8"
-
-SRC_URI[md5sum] =3D "a0ed854ee442051b249bfad0f638bbec"
-SRC_URI[sha256sum] =3D "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3=
fab7bf6d43f01b1f"
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
-    python-pip \
-    "
+require python-ordereddict.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-ordereddict_1=
.1.bb b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
new file mode 100644
index 0000000..46c08d0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
@@ -0,0 +1,2 @@
+require python-ordereddict.inc
+inherit setuptools3
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.570.1575443037584427790
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 23:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33C65E010B0; Tue,  3 Dec 2019 23:03:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D955AE0083D
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 23:03:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79568039"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 15:03:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B4BC4CE20EB
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 14:55:24 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 15:03:57 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pathlib: Add python3 version
Date: Wed, 4 Dec 2019 15:04:42 +0800
Message-ID: <20191204070442.29175-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1B4BC4CE20EB.AA3D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pathlib.inc                 | 23 +++++++++++++++++
 .../python/python-pathlib_1.0.1.bb            | 25 ++-----------------
 .../python/python3-pathlib_1.0.1.bb           |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pathlib=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pathli=
b_1.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pathlib.inc b/=
meta-openstack/recipes-devtools/python/python-pathlib.inc
new file mode 100644
index 0000000..1df01f3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pathlib.inc
@@ -0,0 +1,23 @@
+SUMMARY =3D "Object-oriented filesystem paths"
+DESCRIPTION =3D "pathlib offers a set of classes to handle filesystem pa=
ths. \
+It offers the following advantages over using string objects: \
+- No more cumbersome use of os and os.path functions. \
+- Embodies the semantics of different path types. \
+- Well-defined semantics, eliminating any warts or ambiguities. \
+"
+HOMEPAGE =3D "https://pypi.python.org/pypi/pathlib"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b6557c860f0fc867aeab30af=
d649753"
+
+SRC_URI[md5sum] =3D "5099ed48be9b1ee29b31c82819240537"
+SRC_URI[sha256sum] =3D "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc=
9e73c94a7894ea9f"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+"
+
+RDEPENDS_${PN} +=3D " \
+"
diff --git a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.=
bb b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
index 21c02a2..02aafbf 100644
--- a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
@@ -1,23 +1,2 @@
-SUMMARY =3D "Object-oriented filesystem paths"
-DESCRIPTION =3D "pathlib offers a set of classes to handle filesystem pa=
ths. \
-It offers the following advantages over using string objects: \
-- No more cumbersome use of os and os.path functions. \
-- Embodies the semantics of different path types. \
-- Well-defined semantics, eliminating any warts or ambiguities. \
-"
-HOMEPAGE =3D "https://pypi.python.org/pypi/pathlib"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b6557c860f0fc867aeab30af=
d649753"
-
-SRC_URI[md5sum] =3D "5099ed48be9b1ee29b31c82819240537"
-SRC_URI[sha256sum] =3D "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc=
9e73c94a7894ea9f"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-"
-
-RDEPENDS_${PN} +=3D " \
-"
+require python-pathlib.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1=
.bb b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
new file mode 100644
index 0000000..afed21e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
@@ -0,0 +1,2 @@
+require python-pathlib.inc
+inherit setuptools3
--=20
2.20.1




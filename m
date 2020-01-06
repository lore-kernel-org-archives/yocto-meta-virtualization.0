Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.315.1578291675948529858
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 22:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBA71E013BB; Sun,  5 Jan 2020 22:21:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0807DE0093B
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 22:21:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81341667"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 14:21:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 499E64CE1CA2
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 14:12:13 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 14:21:12 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 14:21:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cephclient: Add python3 version
Date: Mon, 6 Jan 2020 14:22:25 +0800
Message-ID: <20200106062225.28704-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 499E64CE1CA2.A8821
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-cephclient.inc              | 26 +++++++++++++++++
 .../python/python-cephclient_0.1.0.5.bb       | 28 ++-----------------
 .../python/python3-cephclient_0.1.0.5.bb      |  2 ++
 3 files changed, 30 insertions(+), 26 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cephcli=
ent.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-cephcl=
ient_0.1.0.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cephclient.inc=
 b/meta-openstack/recipes-devtools/python/python-cephclient.inc
new file mode 100644
index 0000000..e8e0d0a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cephclient.inc
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "A client library in python for the Ceph REST API."
+HOMEPAGE =3D "https://github.com/dmsimard/python-cephclient"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
+
+PYPI_PACKAGE =3D "python-cephclient"
+PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/p/${PYPI_PACKA=
GE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
+
+SRC_URI[md5sum] =3D "e3746607f1af1573a241b4995c10c938"
+SRC_URI[sha256sum] =3D "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a=
9c1348466961134b"
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
+        ${PYTHON_PN}-lxml \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-cython \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-cephclient_0.1=
.0.5.bb b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.=
5.bb
index 7ce7307..b3d7ca7 100644
--- a/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
@@ -1,26 +1,2 @@
-DESCRIPTION =3D "A client library in python for the Ceph REST API."
-HOMEPAGE =3D "https://github.com/dmsimard/python-cephclient"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
-
-PYPI_PACKAGE =3D "python-cephclient"
-PYPI_SRC_URI =3D "https://pypi.python.org/packages/source/p/${PYPI_PACKA=
GE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
-
-SRC_URI[md5sum] =3D "e3746607f1af1573a241b4995c10c938"
-SRC_URI[sha256sum] =3D "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a=
9c1348466961134b"
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
-        python-lxml \
-        python-requests \
-        python-cython \
-        "
+require python-cephclient.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-cephclient_0.=
1.0.5.bb b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.=
0.5.bb
new file mode 100644
index 0000000..e05c1d5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.b=
b
@@ -0,0 +1,2 @@
+require python-cephclient.inc
+inherit setuptools3
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.33514.1578885919125548620
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jan 2020 19:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3405E0151B; Sun, 12 Jan 2020 19:25:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBCC2E013DC
	for <meta-virtualization@yoctoproject.org>; Sun, 12 Jan 2020 19:25:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; 
   d="scan'208";a="81710891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 11:25:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F4014CE1C8A
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 11:16:11 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 11:25:17 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 13 Jan 2020 11:25:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-memcached: Add python3 version
Date: Mon, 13 Jan 2020 11:26:42 +0800
Message-ID: <20200113032642.25772-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8F4014CE1C8A.AA32D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-memcached.inc               | 21 +++++++++++++++++
 .../python/python-memcached_git.bb            | 23 +------------------
 .../python/python3-memcached_git.bb           |  2 ++
 3 files changed, 24 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-memcach=
ed.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-memcac=
hed_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-memcached.inc =
b/meta-openstack/recipes-devtools/python/python-memcached.inc
new file mode 100644
index 0000000..5acf43c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-memcached.inc
@@ -0,0 +1,21 @@
+SUMMARY =3D "Pure python memcached client"
+DESCRIPTION =3D "\
+  This software is a 100% Python interface to the memcached memory cache=
 daemon. \
+  It is the client side software which allows storing values in one or m=
ore, possibly remote, \
+  memcached servers. Search google for memcached for more information."
+HOMEPAGE =3D "https://pypi.python.org/pypi/python-memcached/"
+SECTION =3D "devel/python"
+LICENSE =3D "PSF"
+LIC_FILES_CHKSUM =3D "file://PSF.LICENSE;md5=3D7dd786e8594f1e787da94a946=
557b40e"
+
+PV =3D "1.57+git${SRCPV}"
+SRCREV =3D "664bd3e23fe500fbde4c70636e2d24c8fd2f35af"
+
+SRC_URI =3D "git://github.com/linsomniac/python-memcached.git"
+
+S =3D "${WORKDIR}/git"
+
+RDEPENDS_${PN} +=3D " \
+    ${PYTHON_PN}-six \
+    "
+
diff --git a/meta-openstack/recipes-devtools/python/python-memcached_git.=
bb b/meta-openstack/recipes-devtools/python/python-memcached_git.bb
index 9237af3..f237d56 100644
--- a/meta-openstack/recipes-devtools/python/python-memcached_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-memcached_git.bb
@@ -1,23 +1,2 @@
-SUMMARY =3D "Pure python memcached client"
-DESCRIPTION =3D "\
-  This software is a 100% Python interface to the memcached memory cache=
 daemon. \
-  It is the client side software which allows storing values in one or m=
ore, possibly remote, \
-  memcached servers. Search google for memcached for more information."
-HOMEPAGE =3D "https://pypi.python.org/pypi/python-memcached/"
-SECTION =3D "devel/python"
-LICENSE =3D "PSF"
-LIC_FILES_CHKSUM =3D "file://PSF.LICENSE;md5=3D7dd786e8594f1e787da94a946=
557b40e"
-
-PV =3D "1.57+git${SRCPV}"
-SRCREV =3D "664bd3e23fe500fbde4c70636e2d24c8fd2f35af"
-
-SRC_URI =3D "git://github.com/linsomniac/${BPN}.git"
-
-S =3D "${WORKDIR}/git"
-
+require python-memcached.inc
 inherit setuptools
-
-RDEPENDS_${PN} +=3D " \
-    python-six \
-    "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-memcached_git=
.bb b/meta-openstack/recipes-devtools/python/python3-memcached_git.bb
new file mode 100644
index 0000000..de96734
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-memcached_git.bb
@@ -0,0 +1,2 @@
+require python-memcached.inc
+inherit setuptools3
--=20
2.20.1




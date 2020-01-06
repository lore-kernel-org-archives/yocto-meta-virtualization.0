Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.855.1578296890461825079
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 23:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55360E01455; Sun,  5 Jan 2020 23:48:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 168CEE01450
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 23:48:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81362214"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 15:48:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5E4F649E9329
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 15:39:06 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 15:48:02 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 15:48:03 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-font-awesome: Add python3 version
Date: Mon, 6 Jan 2020 15:49:20 +0800
Message-ID: <20200106074920.12441-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5E4F649E9329.A970F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-font-awesome.inc    | 22 +++++++++++++++++
 .../python-xstatic-font-awesome_4.7.0.0.bb    | 24 ++-----------------
 .../python3-xstatic-font-awesome_4.7.0.0.bb   |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-font-awesome.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-font-awesome_4.7.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-font-a=
wesome.inc b/meta-openstack/recipes-devtools/python/python-xstatic-font-a=
wesome.inc
new file mode 100644
index 0000000..57fae23
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome.=
inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Font Awesome icons packaged for setuptools (easy_instal=
l) / pip."
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Font-Awesome"
+SECTION =3D "devel/python"
+LICENSE =3D "OFL-1.1"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a51=
9e5e9eb96316656e0ca4f2b90"
+
+PYPI_PACKAGE =3D "XStatic-Font-Awesome"
+
+SRC_URI[md5sum] =3D "141a0e9a7e21e82f922573a00ae0c166"
+SRC_URI[sha256sum] =3D "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b6=
85816d220e685f6c"
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
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-font-a=
wesome_4.7.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic=
-font-awesome_4.7.0.0.bb
index 76ae529..cc342ac 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_=
4.7.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_=
4.7.0.0.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "Font Awesome icons packaged for setuptools (easy_instal=
l) / pip."
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Font-Awesome"
-SECTION =3D "devel/python"
-LICENSE =3D "OFL-1.1"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a51=
9e5e9eb96316656e0ca4f2b90"
-
-PYPI_PACKAGE =3D "XStatic-Font-Awesome"
-
-SRC_URI[md5sum] =3D "141a0e9a7e21e82f922573a00ae0c166"
-SRC_URI[sha256sum] =3D "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b6=
85816d220e685f6c"
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
-        "
+require python-xstatic-font-awesome.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-font-=
awesome_4.7.0.0.bb b/meta-openstack/recipes-devtools/python/python3-xstat=
ic-font-awesome_4.7.0.0.bb
new file mode 100644
index 0000000..b2998f6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-font-awesome=
_4.7.0.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-font-awesome.inc
+inherit setuptools3
--=20
2.20.1




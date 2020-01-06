Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1252.1578300847987013783
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 00:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D44D8E01455; Mon,  6 Jan 2020 00:54:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70327E01450
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 00:54:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81370534"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 16:54:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 826B649E933C
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 16:45:04 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 16:54:02 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 16:54:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-jquery: Add python3 version
Date: Mon, 6 Jan 2020 16:55:20 +0800
Message-ID: <20200106085520.22334-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 826B649E933C.A76DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-jquery.inc          | 22 +++++++++++++++++
 .../python/python-xstatic-jquery_1.10.2.1.bb  | 24 ++-----------------
 .../python/python3-xstatic-jquery_1.10.2.1.bb |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-jquery.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-jquery_1.10.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery=
.inc b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.inc
new file mode 100644
index 0000000..db8e2a2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "jQuery javascript library packaged for setuptools (easy=
_install) / pip."
+HOMEPAGE =3D "http://jquery.com/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://README.txt;md5=3Daf1f21066b501c7d9265fab0d5=
556ece"
+
+PYPI_PACKAGE =3D "XStatic-jQuery"
+
+SRC_URI[md5sum] =3D "7a29efeab6961ef00ea2272c923f4503"
+SRC_URI[sha256sum] =3D "83416a6bb86e8534858c4d1ddca45e881c87639da6f78000=
c28c3a193fe91305"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery=
_1.10.2.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jque=
ry_1.10.2.1.bb
index 3141cf6..23cc65e 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2=
.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2=
.1.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "jQuery javascript library packaged for setuptools (easy=
_install) / pip."
-HOMEPAGE =3D "http://jquery.com/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.txt;md5=3Daf1f21066b501c7d9265fab0d5=
556ece"
-
-PYPI_PACKAGE =3D "XStatic-jQuery"
-
-SRC_URI[md5sum] =3D "7a29efeab6961ef00ea2272c923f4503"
-SRC_URI[sha256sum] =3D "83416a6bb86e8534858c4d1ddca45e881c87639da6f78000=
c28c3a193fe91305"
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
+require python-xstatic-jquery.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquer=
y_1.10.2.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jq=
uery_1.10.2.1.bb
new file mode 100644
index 0000000..efbb9e3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_1.10.=
2.1.bb
@@ -0,0 +1,2 @@
+require python-xstatic-jquery.inc
+inherit setuptools3
--=20
2.20.1




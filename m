Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1178.1578299788556265838
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 00:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FF97E01455; Mon,  6 Jan 2020 00:36:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE7C1E01450
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 00:36:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81368871"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 16:36:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E809949E932B
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 16:27:23 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 16:36:24 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 16:36:24 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-angular-irdragndrop: Add python3 version
Date: Mon, 6 Jan 2020 16:37:36 +0800
Message-ID: <20200106083736.18910-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E809949E932B.A9E02
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-irdragndrop.inc    | 19 +++++++++++++++++
 ...hon-xstatic-angular-irdragndrop_1.0.2.2.bb | 21 ++-----------------
 ...on3-xstatic-angular-irdragndrop_1.0.2.2.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-angular-irdragndrop.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-angular-irdragndrop_1.0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-irdragndrop.inc b/meta-openstack/recipes-devtools/python/python-xstatic=
-angular-irdragndrop.inc
new file mode 100644
index 0000000..90331a9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdra=
gndrop.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "IrDragNDrop javascript library packaged for setuptools"
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D9acc2dfc3a0345c175df08104bd2=
2298"
+
+PYPI_PACKAGE =3D "XStatic-Angular-IrDragNDrop"
+
+SRC_URI[md5sum] =3D "6ea8809bae94014aef699d58836dba84"
+SRC_URI[sha256sum] =3D "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a7=
5755f99fe8b5bd6d"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-=
xstatic-angular-irdragndrop_1.0.2.2.bb
index daa74bc..c41bdcd 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdra=
gndrop_1.0.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdra=
gndrop_1.0.2.2.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "IrDragNDrop javascript library packaged for setuptools"
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D9acc2dfc3a0345c175df08104bd2=
2298"
-
-PYPI_PACKAGE =3D "XStatic-Angular-IrDragNDrop"
-
-SRC_URI[md5sum] =3D "6ea8809bae94014aef699d58836dba84"
-SRC_URI[sha256sum] =3D "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a7=
5755f99fe8b5bd6d"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-angular-irdragndrop.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angul=
ar-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python=
3-xstatic-angular-irdragndrop_1.0.2.2.bb
new file mode 100644
index 0000000..72c8781
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdr=
agndrop_1.0.2.2.bb
@@ -0,0 +1,2 @@
+require python-xstatic-angular-irdragndrop.inc
+inherit setuptools3
--=20
2.20.1




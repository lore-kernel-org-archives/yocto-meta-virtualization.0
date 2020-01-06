Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.820.1578296349254936074
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 23:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBE35E00726; Sun,  5 Jan 2020 23:39:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 656E4E00726
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 23:39:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81361510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 15:39:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D315449E9330
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 15:30:05 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 15:39:00 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 15:38:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-angular-schema-form: Add python3 version
Date: Mon, 6 Jan 2020 15:40:17 +0800
Message-ID: <20200106074017.10862-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D315449E9330.A7451
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-schema-form.inc    | 22 +++++++++++++++++
 ...on-xstatic-angular-schema-form_0.8.13.0.bb | 24 ++-----------------
 ...n3-xstatic-angular-schema-form_0.8.13.0.bb |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-angular-schema-form.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-angular-schema-form_0.8.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-schema-form.inc b/meta-openstack/recipes-devtools/python/python-xstatic=
-angular-schema-form.inc
new file mode 100644
index 0000000..7bfa957
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schem=
a-form.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Angular Schema Form packaged for setuptools (easy_insta=
ll) / pip."
+HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D0e4430cb0dfdb98d3008c66d8339=
f31a"
+
+PYPI_PACKAGE =3D "XStatic-Angular-Schema-Form"
+
+SRC_URI[md5sum] =3D "d0faab81c36f4cfc03e092fedc30018d"
+SRC_URI[sha256sum] =3D "7c08634901751267fe26d266fc027cf6ed2e5f422696985c=
ec750594b3f4e300"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python=
-xstatic-angular-schema-form_0.8.13.0.bb
index 5c71b52..25c7626 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schem=
a-form_0.8.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schem=
a-form_0.8.13.0.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "Angular Schema Form packaged for setuptools (easy_insta=
ll) / pip."
-HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D0e4430cb0dfdb98d3008c66d8339=
f31a"
-
-PYPI_PACKAGE =3D "XStatic-Angular-Schema-Form"
-
-SRC_URI[md5sum] =3D "d0faab81c36f4cfc03e092fedc30018d"
-SRC_URI[sha256sum] =3D "7c08634901751267fe26d266fc027cf6ed2e5f422696985c=
ec750594b3f4e300"
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
+require python-xstatic-angular-schema-form.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angul=
ar-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/pytho=
n3-xstatic-angular-schema-form_0.8.13.0.bb
new file mode 100644
index 0000000..eae97b2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-sche=
ma-form_0.8.13.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-angular-schema-form.inc
+inherit setuptools3
--=20
2.20.1




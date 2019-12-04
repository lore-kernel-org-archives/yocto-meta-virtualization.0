Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2947.1575431889219555781
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 19:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C75F4E010AC; Tue,  3 Dec 2019 19:58:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01EB5E00848
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 19:58:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,275,1571673600"; 
   d="scan'208";a="79556265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 11:58:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 530104CE1BEB
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 11:49:34 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 11:58:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-mccabe: Add python3 version
Date: Wed, 4 Dec 2019 11:58:52 +0800
Message-ID: <20191204035852.16100-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 530104CE1BEB.A7BFB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-mccabe.inc    | 14 ++++++++++++++
 .../python/python-mccabe_0.2.1.bb                | 16 ++--------------
 .../python/python3-mccabe_0.2.1.bb               |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-mccabe.=
inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-mccabe=
_0.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mccabe.inc b/m=
eta-openstack/recipes-devtools/python/python-mccabe.inc
new file mode 100644
index 0000000..5f5e91d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-mccabe.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "McCabe checker, plugin for flake8"
+HOMEPAGE =3D "https://github.com/dreamhost/cliff"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Daa0383f6aee4f5c20084a97cd1=
3164c4"
+
+SRC_URI[md5sum] =3D "5a3f3fa6a4bad126c88aaaa7dab682f5"
+SRC_URI[sha256sum] =3D "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6e=
d96c953c0352243a"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing"
diff --git a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.b=
b b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
index fac44d9..68c2238 100644
--- a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
@@ -1,14 +1,2 @@
-DESCRIPTION =3D "McCabe checker, plugin for flake8"
-HOMEPAGE =3D "https://github.com/dreamhost/cliff"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Daa0383f6aee4f5c20084a97cd1=
3164c4"
-
-SRC_URI[md5sum] =3D "5a3f3fa6a4bad126c88aaaa7dab682f5"
-SRC_URI[sha256sum] =3D "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6e=
d96c953c0352243a"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-prettytable \
-            python-cmd2 \
-            python-pyparsing"
\ No newline at end of file
+require python-mccabe.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.=
bb b/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
new file mode 100644
index 0000000..8af8ec5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
@@ -0,0 +1,2 @@
+require python-mccabe.inc
+inherit setuptools3
--=20
2.20.1




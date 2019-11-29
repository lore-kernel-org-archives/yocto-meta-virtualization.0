Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4006.1574994533806560323
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 18:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A40BE010AF; Thu, 28 Nov 2019 18:28:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 523E3E00EC7
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:28:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79246146"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 10:28:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AD9E44CE1C0D
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:20:26 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 10:28:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-colorama: Add python3 version
Date: Fri, 29 Nov 2019 10:29:37 +0800
Message-ID: <20191129022937.28073-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AD9E44CE1C0D.AB577
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-colorama.inc                | 18 ++++++++++++++++++
 .../python/python-colorama_0.4.1.bb           | 19 ++-----------------
 .../python/python3-colorama_0.4.1.bb          |  3 +++
 3 files changed, 23 insertions(+), 17 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-coloram=
a.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-colora=
ma_0.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-colorama.inc b=
/meta-openstack/recipes-devtools/python/python-colorama.inc
new file mode 100644
index 0000000..4b5dc79
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-colorama.inc
@@ -0,0 +1,18 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DESCRIPTION =3D "Simple cross-platform colored terminal text in Python"
+HOMEPAGE =3D "http://pypi.python.org/pypi/colorama"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4936429a56a652b84c5c0128=
0dcaa26"
+
+SRC_URI[md5sum] =3D "f927529cd1735f6f50ee2c61628e9c1f"
+SRC_URI[sha256sum] =3D "05eed71e2e327246ad6b38c540c4a3117230b19679b87519=
0486ddd2d721422d"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
diff --git a/meta-openstack/recipes-devtools/python/python-colorama_0.4.1=
.bb b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
index 7df4e97..097193f 100644
--- a/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
@@ -1,18 +1,3 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION =3D "Simple cross-platform colored terminal text in Python"
-HOMEPAGE =3D "http://pypi.python.org/pypi/colorama"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4936429a56a652b84c5c0128=
0dcaa26"
-
-SRC_URI[md5sum] =3D "f927529cd1735f6f50ee2c61628e9c1f"
-SRC_URI[sha256sum] =3D "05eed71e2e327246ad6b38c540c4a3117230b19679b87519=
0486ddd2d721422d"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
+require python-colorama.inc
+inherit setuptools
=20
diff --git a/meta-openstack/recipes-devtools/python/python3-colorama_0.4.=
1.bb b/meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb
new file mode 100644
index 0000000..89c2fea
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb
@@ -0,0 +1,3 @@
+require python-colorama.inc
+inherit setuptools3
+
--=20
2.20.1




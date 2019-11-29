Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5202.1575006950123906141
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 21:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 992BEE010B6; Thu, 28 Nov 2019 21:55:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40454E010B1
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 21:55:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,256,1571673600"; 
   d="scan'208";a="79254373"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 13:55:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A57E24CE1BF0
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 13:47:22 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 13:55:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-jsonpath-rw: Add python3 version
Date: Fri, 29 Nov 2019 13:56:33 +0800
Message-ID: <20191129055633.25347-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A57E24CE1BF0.A96BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonpath-rw.inc   | 10 ++++++++++
 .../python/python-jsonpath-rw_1.4.0.bb               | 12 ++----------
 .../python/python3-jsonpath-rw_1.4.0.bb              |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-jsonpat=
h-rw.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-jsonpa=
th-rw_1.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw.in=
c b/meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc
new file mode 100644
index 0000000..dc2bad2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "A robust and significantly extended implementation of J=
SONPath for Python"
+HOMEPAGE =3D "https://github.com/kennknowles/python-jsonpath-rw"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD+"
+LIC_FILES_CHKSUM =3D "file://README.rst;md5=3D02384665f821c394981e0dd1fa=
ec9a7d"
+
+SRC_URI[md5sum] =3D "3a807e05c2c12158fc6bb0a402fd5778"
+SRC_URI[sha256sum] =3D "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45=
edc89b11fac4fbec"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.=
4.0.bb b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.=
bb
index 52fbcc8..1f8dd55 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "A robust and significantly extended implementation of J=
SONPath for Python"
-HOMEPAGE =3D "https://github.com/kennknowles/python-jsonpath-rw"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD+"
-LIC_FILES_CHKSUM =3D "file://README.rst;md5=3D02384665f821c394981e0dd1fa=
ec9a7d"
-
-SRC_URI[md5sum] =3D "3a807e05c2c12158fc6bb0a402fd5778"
-SRC_URI[sha256sum] =3D "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45=
edc89b11fac4fbec"
-
-inherit setuptools pypi
+require python-jsonpath-rw.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1=
.4.0.bb b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.=
0.bb
new file mode 100644
index 0000000..c320f01
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -0,0 +1,2 @@
+require python-jsonpath-rw.inc
+inherit setuptools3
--=20
2.20.1




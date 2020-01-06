Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1169.1578280999061096496
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 19:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2380E01449; Sun,  5 Jan 2020 19:23:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE66BE013B7
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 19:23:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,400,1571673600"; 
   d="scan'208";a="81327248"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 11:23:16 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 318C1406AB15
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 11:14:19 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 11:23:16 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 11:23:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-django-appconf: Add python3 version
Date: Mon, 6 Jan 2020 11:24:34 +0800
Message-ID: <20200106032434.11848-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 318C1406AB15.A62FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-django-appconf.inc              | 13 +++++++++++++
 .../python/python-django-appconf_1.0.1.bb         | 15 ++-------------
 .../python/python3-django-appconf_1.0.1.bb        |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-django-=
appconf.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-django=
-appconf_1.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf=
.inc b/meta-openstack/recipes-devtools/python/python-django-appconf.inc
new file mode 100644
index 0000000..00f2e3e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-django-appconf.inc
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "A helper class for handling configuration defaults of p=
ackaged apps gracefully."
+HOMEPAGE =3D "http://django-appconf.readthedocs.org/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f34b9b2f6413fd5f91869fa7e992=
457"
+
+SRC_URI[md5sum] =3D "29c87a00f0d098b90f3ac6113ae6e52d"
+SRC_URI[sha256sum] =3D "ba1375fb1024e8e91547504d4392321795c989fde500b96e=
bc7c93884f786e60"
+
+inherit pypi
+
+#RDEPENDS_${PN} +=3D "${PYTHON_PN}-six \
+#	"
diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf=
_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-django-appconf_=
1.0.1.bb
index 2eed747..98aa8f4 100644
--- a/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.=
bb
+++ b/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.=
bb
@@ -1,13 +1,2 @@
-DESCRIPTION =3D "A helper class for handling configuration defaults of p=
ackaged apps gracefully."
-HOMEPAGE =3D "http://django-appconf.readthedocs.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f34b9b2f6413fd5f91869fa7e992=
457"
-
-SRC_URI[md5sum] =3D "29c87a00f0d098b90f3ac6113ae6e52d"
-SRC_URI[sha256sum] =3D "ba1375fb1024e8e91547504d4392321795c989fde500b96e=
bc7c93884f786e60"
-
-inherit setuptools pypi
-
-#RDEPENDS_${PN} +=3D "python-six \
-#	"
+require python-django-appconf.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-django-appcon=
f_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-django-appcon=
f_1.0.1.bb
new file mode 100644
index 0000000..6cc57ba
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.1=
.bb
@@ -0,0 +1,2 @@
+require python-django-appconf.inc
+inherit setuptools3
--=20
2.20.1




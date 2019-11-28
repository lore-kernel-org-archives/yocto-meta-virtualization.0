Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3496.1574922572241472349
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 22:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A25B0E00E8D; Wed, 27 Nov 2019 22:29:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0846EE00AC8
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 22:29:30 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; 
   d="scan'208";a="79206492"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 14:29:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8C0274CE1BF0
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 14:21:02 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 28 Nov 2019 14:29:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-anyjson: Add python3 version
Date: Thu, 28 Nov 2019 14:30:11 +0800
Message-ID: <20191128063011.16384-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8C0274CE1BF0.A82FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-anyjson.inc     | 12 ++++++++++++
 .../python/python-anyjson_0.3.3.bb                 | 14 ++------------
 .../python/python3-anyjson_0.3.3.bb                |  2 ++
 3 files changed, 16 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-anyjson=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-anyjso=
n_0.3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc b/=
meta-openstack/recipes-devtools/python/python-anyjson.inc
new file mode 100644
index 0000000..19e03e9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-anyjson.inc
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Loads the best available JSON implementation available =
in a common interface"
+HOMEPAGE =3D "https://bitbucket.org/runeh/anyjson"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D989aa97e73c912a83a3c873fa11de=
b08"
+
+inherit pypi
+
+SRC_URI[md5sum] =3D "2ea28d6ec311aeeebaf993cb3008b27c"
+SRC_URI[sha256sum] =3D "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20a=
d54cb34d158157ba"
+
+RDEPENDS_${PN} =3D "${PYTHON_PN}-simplejson"
diff --git a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.=
bb b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
index cffff66..2b90a2a 100644
--- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
@@ -1,12 +1,2 @@
-DESCRIPTION =3D "Loads the best available JSON implementation available =
in a common interface"
-HOMEPAGE =3D "https://bitbucket.org/runeh/anyjson"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D989aa97e73c912a83a3c873fa11de=
b08"
-
-inherit setuptools pypi
-
-SRC_URI[md5sum] =3D "2ea28d6ec311aeeebaf993cb3008b27c"
-SRC_URI[sha256sum] =3D "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20a=
d54cb34d158157ba"
-
-RDEPENDS_${PN} =3D "python-simplejson"
+require python-anyjson.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3=
.bb b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
new file mode 100644
index 0000000..d4d13ac
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
@@ -0,0 +1,2 @@
+require python-anyjson.inc
+inherit setuptools3
--=20
2.20.1




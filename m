Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3067.1575432314450040731
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 20:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AF00E010AA; Tue,  3 Dec 2019 20:05:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9663CE0085D
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 20:05:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,275,1571673600"; 
   d="scan'208";a="79556701"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 12:05:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A7234CE1646
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 11:56:39 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 12:05:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-memcache: Add python3 version
Date: Wed, 4 Dec 2019 12:05:56 +0800
Message-ID: <20191204040556.25181-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2A7234CE1646.A75DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-memcache.inc                | 22 +++++++++++++++++
 .../python/python-memcache_1.2.9.bb           | 24 ++-----------------
 .../python/python3-memcache_1.2.9.bb          |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-memcach=
e.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-memcac=
he_1.2.9.bb

diff --git a/meta-openstack/recipes-devtools/python/python-memcache.inc b=
/meta-openstack/recipes-devtools/python/python-memcache.inc
new file mode 100644
index 0000000..61fe67d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-memcache.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "A comprehensive, fast, pure Python memcached client"
+HOMEPAGE =3D "https://github.com/Pinterest/pymemcache"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3De8538d10fb74087ea2dc61033b6e=
bf9f"
+
+PYPI_PACKAGE =3D "pymemcache"
+
+SRC_URI[md5sum] =3D "215510250997423a2a57da061b1bd592"
+SRC_URI[sha256sum] =3D "05fd71f0337384024cc3d1340d35fd0d46307cf711eac936=
5b0eb166812bb121"
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
diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9=
.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
index 96ca87e..2027c2a 100644
--- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "A comprehensive, fast, pure Python memcached client"
-HOMEPAGE =3D "https://github.com/Pinterest/pymemcache"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3De8538d10fb74087ea2dc61033b6e=
bf9f"
-
-PYPI_PACKAGE =3D "pymemcache"
-
-SRC_URI[md5sum] =3D "215510250997423a2a57da061b1bd592"
-SRC_URI[sha256sum] =3D "05fd71f0337384024cc3d1340d35fd0d46307cf711eac936=
5b0eb166812bb121"
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
+require python-memcache.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-memcache_1.2.=
9.bb b/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
new file mode 100644
index 0000000..08ecb7b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
@@ -0,0 +1,2 @@
+require python-memcache.inc
+inherit setuptools3
--=20
2.20.1




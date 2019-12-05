Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2510.1575508762109417604
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 17:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE8B7E00F0A; Wed,  4 Dec 2019 17:19:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 072E3E00F05
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 17:19:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; 
   d="scan'208";a="79609546"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 09:19:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CC584CE1C07
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 09:10:47 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 09:19:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-rtslib-fb: Add python3 version
Date: Thu, 5 Dec 2019 09:20:06 +0800
Message-ID: <20191205012006.14387-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8CC584CE1C07.AA34E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-rtslib-fb.inc               | 20 +++++++++++++++++
 .../python/python-rtslib-fb_2.1.51.bb         | 22 ++-----------------
 .../python/python3-rtslib-fb_2.1.51.bb        |  2 ++
 3 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rtslib-=
fb.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rtslib=
-fb_2.1.51.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc =
b/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
new file mode 100644
index 0000000..e14f33d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "API for Linux kernel SCSI target (aka LIO)"
+HOMEPAGE =3D "http://github.com/agrover/rtslib-fb"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D867c358d5dbac2602d0c0f850f73=
1e62"
+
+SRC_URI[md5sum] =3D "4ec7575eb90b7c5a91bbea2962f0e036"
+SRC_URI[sha256sum] =3D "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571c=
bbb809229fd5553e"
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
diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.=
51.bb b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
index 46d6cc4..5e4d074 100644
--- a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
+++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
@@ -1,20 +1,2 @@
-DESCRIPTION =3D "API for Linux kernel SCSI target (aka LIO)"
-HOMEPAGE =3D "http://github.com/agrover/rtslib-fb"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D867c358d5dbac2602d0c0f850f73=
1e62"
-
-SRC_URI[md5sum] =3D "4ec7575eb90b7c5a91bbea2962f0e036"
-SRC_URI[sha256sum] =3D "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571c=
bbb809229fd5553e"
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
+require python-rtslib-fb.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1=
.51.bb b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.=
bb
new file mode 100644
index 0000000..571b68c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
@@ -0,0 +1,2 @@
+require python-rtslib-fb.inc
+inherit setuptools3
--=20
2.20.1




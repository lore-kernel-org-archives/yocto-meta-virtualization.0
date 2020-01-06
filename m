Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.906.1578297296448707471
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 23:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01BBCE01455; Sun,  5 Jan 2020 23:54:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53593E01450
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 23:54:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81362854"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 15:54:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id ED76C49E9327
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 15:45:52 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 15:54:39 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 15:54:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic-roboto-fontface: Add python3 version
Date: Mon, 6 Jan 2020 15:55:57 +0800
Message-ID: <20200106075557.13902-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: ED76C49E9327.AB48C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-roboto-fontface.inc | 19 +++++++++++++++++
 .../python-xstatic-roboto-fontface_0.5.0.0.bb | 21 ++-----------------
 ...python3-xstatic-roboto-fontface_0.5.0.0.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
-roboto-fontface.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstati=
c-roboto-fontface_0.5.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto=
-fontface.inc b/meta-openstack/recipes-devtools/python/python-xstatic-rob=
oto-fontface.inc
new file mode 100644
index 0000000..d11d0a1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontfa=
ce.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "A simple package providing the Roboto fontface."
+HOMEPAGE =3D "https://github.com/choffmeister/roboto-fontface-bower"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
+
+PYPI_PACKAGE =3D "XStatic-roboto-fontface"
+
+SRC_URI[md5sum] =3D "32273ba68fa063623461db0b0767524f"
+SRC_URI[sha256sum] =3D "6d272df58e20eec3a15bca279163f38614c7074e2fecb537=
a58b29d109e83f62"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto=
-fontface_0.5.0.0.bb b/meta-openstack/recipes-devtools/python/python-xsta=
tic-roboto-fontface_0.5.0.0.bb
index 3c828b4..0f52a02 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontfa=
ce_0.5.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontfa=
ce_0.5.0.0.bb
@@ -1,19 +1,2 @@
-DESCRIPTION =3D "A simple package providing the Roboto fontface."
-HOMEPAGE =3D "https://github.com/choffmeister/roboto-fontface-bower"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
-
-PYPI_PACKAGE =3D "XStatic-roboto-fontface"
-
-SRC_URI[md5sum] =3D "32273ba68fa063623461db0b0767524f"
-SRC_URI[sha256sum] =3D "6d272df58e20eec3a15bca279163f38614c7074e2fecb537=
a58b29d109e83f62"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
+require python-xstatic-roboto-fontface.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-robot=
o-fontface_0.5.0.0.bb b/meta-openstack/recipes-devtools/python/python3-xs=
tatic-roboto-fontface_0.5.0.0.bb
new file mode 100644
index 0000000..e05e35e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-roboto-fontf=
ace_0.5.0.0.bb
@@ -0,0 +1,2 @@
+require python-xstatic-roboto-fontface.inc
+inherit setuptools3
--=20
2.20.1




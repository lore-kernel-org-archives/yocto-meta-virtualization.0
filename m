Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1000.1578280432252054668
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 19:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A49F2E0144C; Sun,  5 Jan 2020 19:13:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 644C1E013BB
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 19:13:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,400,1571673600"; 
   d="scan'208";a="81326896"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 11:13:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 38BE5406AB15
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 11:04:45 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 11:13:42 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 11:13:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-arrow: Add python3 version
Date: Mon, 6 Jan 2020 11:15:00 +0800
Message-ID: <20200106031500.3460-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 38BE5406AB15.A9D00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-arrow.inc    | 15 +++++++++++++++
 .../python/python-arrow_0.15.2.bb               | 17 ++---------------
 .../python/python3-arrow_0.15.2.bb              |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-arrow.i=
nc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-arrow_=
0.15.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-arrow.inc b/me=
ta-openstack/recipes-devtools/python/python-arrow.inc
new file mode 100644
index 0000000..9556a6d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-arrow.inc
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "Better dates and times for Python"
+HOMEPAGE =3D "https://github.com/crsmithdev/arrow"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D458d41a4064e4dc109666cfd941a2=
9e4"
+
+SRC_URI[md5sum] =3D "554f18b0e23182ee0e8cb2a882d2f607"
+SRC_URI[sha256sum] =3D "10257c5daba1a88db34afa284823382f4963feca7733b910=
7956bed041aff24f"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-dateutil \
+        ${PYTHON_PN}-backports-functools-lru-cache \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.b=
b b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
index d2d0616..e5deaad 100644
--- a/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
@@ -1,15 +1,2 @@
-DESCRIPTION =3D "Better dates and times for Python"
-HOMEPAGE =3D "https://github.com/crsmithdev/arrow"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D458d41a4064e4dc109666cfd941a2=
9e4"
-
-SRC_URI[md5sum] =3D "554f18b0e23182ee0e8cb2a882d2f607"
-SRC_URI[sha256sum] =3D "10257c5daba1a88db34afa284823382f4963feca7733b910=
7956bed041aff24f"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-        python-dateutil \
-        python-backports-functools-lru-cache \
-        "
+require python-arrow.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.=
bb b/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb
new file mode 100644
index 0000000..99196ea
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb
@@ -0,0 +1,2 @@
+require python-arrow.inc
+inherit setuptools3
--=20
2.20.1




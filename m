Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3910.1574993893821631713
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 18:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34FE2E010AF; Thu, 28 Nov 2019 18:18:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF40AE010AC
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:18:10 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79245546"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 10:18:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4AC4A4CE20C1
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 10:09:41 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 10:18:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cachetools: Add python3 version
Date: Fri, 29 Nov 2019 10:18:52 +0800
Message-ID: <20191129021852.19135-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4AC4A4CE20C1.A9933
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-cachetools.inc                 | 14 ++++++++++++++
 .../python/python-cachetools_git.bb              | 16 +---------------
 .../python/python3-cachetools_git.bb             |  2 ++
 3 files changed, 17 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cacheto=
ols.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-cachet=
ools_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cachetools.inc=
 b/meta-openstack/recipes-devtools/python/python-cachetools.inc
new file mode 100644
index 0000000..a67794f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cachetools.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "Extensible memoizing collections and decorators"
+HOMEPAGE =3D "https://github.com/tkem/cachetools"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D96c958336b659af4dad628356c5e4=
3b6"
+
+SRCNAME =3D "cachetools"
+
+PV =3D "1.1.5+git${SRCPV}"
+SRCREV =3D "42853733d0caf68ef5bf5933a377572b05437e2c"
+
+SRC_URI =3D "git://github.com/tkem/${SRCNAME}.git"
+
+S =3D "${WORKDIR}/git"
diff --git a/meta-openstack/recipes-devtools/python/python-cachetools_git=
.bb b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
index f3d89b3..ff0049f 100644
--- a/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
@@ -1,16 +1,2 @@
-DESCRIPTION =3D "Extensible memoizing collections and decorators"
-HOMEPAGE =3D "https://github.com/tkem/cachetools"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D96c958336b659af4dad628356c5e4=
3b6"
-
-SRCNAME =3D "cachetools"
-
-PV =3D "1.1.5+git${SRCPV}"
-SRCREV =3D "42853733d0caf68ef5bf5933a377572b05437e2c"
-
-SRC_URI =3D "git://github.com/tkem/${SRCNAME}.git"
-
-S =3D "${WORKDIR}/git"
-
+require python-cachetools.inc
 inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-cachetools_gi=
t.bb b/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
new file mode 100644
index 0000000..14e8b8c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
@@ -0,0 +1,2 @@
+require python-cachetools.inc
+inherit setuptools3
--=20
2.20.1




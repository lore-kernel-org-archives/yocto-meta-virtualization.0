Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2102.1576034057155092961
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7B98E01148; Tue, 10 Dec 2019 19:14:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F270BE01140
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:14:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79994754"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:14:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6FA714CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:05:36 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:14:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cachetools: Remove the recipe
Date: Wed, 11 Dec 2019 11:15:11 +0800
Message-ID: <20191211031511.23509-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6FA714CE1A0C.AAE8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions in meta-openembedded, Remove the recipe=
.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cachetools.inc  | 14 --------------
 .../python/python-cachetools_git.bb                |  2 --
 .../python/python3-cachetools_git.bb               |  2 --
 3 files changed, 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cacheto=
ols.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cacheto=
ols_git.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-cachet=
ools_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cachetools.inc=
 b/meta-openstack/recipes-devtools/python/python-cachetools.inc
deleted file mode 100644
index a67794f..0000000
--- a/meta-openstack/recipes-devtools/python/python-cachetools.inc
+++ /dev/null
@@ -1,14 +0,0 @@
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
diff --git a/meta-openstack/recipes-devtools/python/python-cachetools_git=
.bb b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
deleted file mode 100644
index ff0049f..0000000
--- a/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-cachetools.inc
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-cachetools_gi=
t.bb b/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
deleted file mode 100644
index 14e8b8c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-cachetools.inc
-inherit setuptools3
--=20
2.20.1




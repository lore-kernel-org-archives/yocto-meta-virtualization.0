Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2160.1576034373531487836
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18C25E01147; Tue, 10 Dec 2019 19:19:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7504EE010D9
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:19:32 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79995183"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:19:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E003C4CE1BEC
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:10:56 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:19:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-contextlib2: Remove the recipe
Date: Wed, 11 Dec 2019 11:20:31 +0800
Message-ID: <20191211032031.23845-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E003C4CE1BEC.AB7CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-contextlib2.inc                | 16 ----------------
 .../python/python-contextlib2_0.6.0.bb           |  3 ---
 .../python/python3-contextlib2_0.6.0.bb          |  3 ---
 3 files changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-context=
lib2.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-context=
lib2_0.6.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-contex=
tlib2_0.6.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.in=
c b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
deleted file mode 100644
index d409034..0000000
--- a/meta-openstack/recipes-devtools/python/python-contextlib2.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "Backports and enhancements for the contextlib module"
-HOMEPAGE =3D "http://contextlib2.readthedocs.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "PSF"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D43d1c7827e8fad6454b553caf=
0e1d734"
-
-SRC_URI[md5sum] =3D "d03a631073b40073b5c41364ad8f5979"
-SRC_URI[sha256sum] =3D "7197aa736777caac513dbd800944c209a49765bf1979b12b=
037dce0277077ed3"
-
-DEPENDS +=3D " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.=
6.0.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.=
bb
deleted file mode 100644
index c6a5c9b..0000000
--- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools pypi
-require python-contextlib2.inc
-
diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0=
.6.0.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.=
0.bb
deleted file mode 100644
index db5fa53..0000000
--- a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3 pypi
-require python-contextlib2.inc
-
--=20
2.20.1




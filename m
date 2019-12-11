Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1228.1576028797130385147
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03F80E01146; Tue, 10 Dec 2019 17:46:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BFC6E01140
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:46:35 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79988966"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 09:46:34 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A1864CE1BEC
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 09:37:57 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 09:46:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-appdirs: Remove the recipe
Date: Wed, 11 Dec 2019 09:47:31 +0800
Message-ID: <20191211014731.22128-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0A1864CE1BEC.AE8FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-appdirs_git.bb              | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-appdirs=
_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb=
 b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
deleted file mode 100644
index 2482871..0000000
--- a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION =3D "A small Python module for determining appropriate platf=
orm-specific dirs, e.g. a user data dir."
-HOMEPAGE =3D "http://github.com/ActiveState/appdirs"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D31625363c45eb0c67c630a2f7=
3e438e4"
-
-PV =3D "1.4.0"
-SRCREV =3D "57f2bc44a8bca99bac6c57496c8b3fdea26f94d5"
-
-SRCNAME =3D "appdirs"
-SRC_URI =3D "git://github.com/ActiveState/${SRCNAME}.git"
-
-S =3D "${WORKDIR}/git"
-
-inherit setuptools
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-pip \
-        "
-
-do_install_append() {
-    # Using these "longest" paths will ensure needed shorter paths will =
be created
-    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/test
-    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-inf=
o
-   =20
-    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-pack=
ages/${SRCNAME}/__init__.py
-    install -m 644 ${S}/${SRCNAME}.pyc ${D}/${libdir}/python2.7/site-pac=
kages/${SRCNAME}/__init__.pyc
-    install -m 644 ${S}/test/* ${D}/${libdir}/python2.7/site-packages/${=
SRCNAME}/test/
-    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/s=
ite-packages/${SRCNAME}.egg-info/
-}
--=20
2.20.1




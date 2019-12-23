Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4964.1577064034989080918
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D7E3E01300; Sun, 22 Dec 2019 17:20:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75CDFE00839
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:20:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80607946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:20:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D449E4B3ED8D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:11:39 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:20:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pycrypto: Remove the recipe
Date: Mon, 23 Dec 2019 09:21:26 +0800
Message-ID: <20191223012126.31689-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D449E4B3ED8D.ABC8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because this already exists in meta-openembedded and there is python3 ver=
sions in meta-openembedded, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-pycrypto/cross-compiling.patch     | 23 --------------
 .../python/python-pycrypto_2.6.1.bb           | 30 -------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pycrypt=
o/cross-compiling.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pycrypt=
o_2.6.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto/cross=
-compiling.patch b/meta-openstack/recipes-devtools/python/python-pycrypto=
/cross-compiling.patch
deleted file mode 100644
index 712f3e8..0000000
--- a/meta-openstack/recipes-devtools/python/python-pycrypto/cross-compil=
ing.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: pycrypto-2.6/setup.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- pycrypto-2.6.orig/setup.py
-+++ pycrypto-2.6/setup.py
-@@ -271,7 +271,8 @@ class PCTBuildConfigure(Command):
-         if not os.path.exists("config.status"):
-             if os.system("chmod 0755 configure") !=3D 0:
-                 raise RuntimeError("chmod error")
--            cmd =3D "sh configure"    # we use "sh" here so that it'll =
work on mingw32 with standard python.org binaries
-+            host =3D os.environ.get("HOST_SYS")
-+            cmd =3D "ac_cv_func_malloc_0_nonnull=3Dyes sh configure --h=
ost " + host   # we use "sh" here so that it'll work on mingw32 with stan=
dard python.org binaries
-             if self.verbose < 1:
-                 cmd +=3D " -q"
-             if os.system(cmd) !=3D 0:
-@@ -370,7 +371,7 @@ kw =3D {'name':"pycrypto",
-       'ext_modules': plat_ext + [
-             # _fastmath (uses GNU mp library)
-             Extension("Crypto.PublicKey._fastmath",
--                      include_dirs=3D['src/','/usr/include/'],
-+                      include_dirs=3D['src/'],
-                       libraries=3D['gmp'],
-                       sources=3D["src/_fastmath.c"]),
-=20
diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1=
.bb b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
deleted file mode 100644
index fc91074..0000000
--- a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "Cryptographic modules for Python."
-HOMEPAGE =3D "http://www.pycrypto.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "PSFv2"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D35f354d199e8cb7667b059a2357=
8e63d"
-
-SRC_URI +=3D " \
-    file://cross-compiling.patch \
-"
-
-SRC_URI[md5sum] =3D "55a61a054aa66812daf5161a0d5d7eda"
-SRC_URI[sha256sum] =3D "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa=
92b3a65528f60a3c"
-
-export STAGING_INCDIR
-export STAGING_LIBDIR
-export BUILD_SYS
-export HOST_SYS
-
-inherit autotools autotools-brokensep distutils pypi
-
-DEPENDS +=3D " gmp"
-
-do_compile[noexec] =3D "1"
-
-# We explicitly call distutils_do_install, since we want it to run, but
-# *don't* want the autotools install to run, since this package doesn't
-# provide a "make install" target.
-do_install() {
-	distutils_do_install
-}
--=20
2.20.1




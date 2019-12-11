Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2537.1576036719534530482
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66C0CE010D9; Tue, 10 Dec 2019 19:58:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAAE6E0082A
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:58:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79998103"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:58:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id ACBE44B3ED8D
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:50:01 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:58:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-monotonic: Remove the recipe
Date: Wed, 11 Dec 2019 11:59:36 +0800
Message-ID: <20191211035936.25648-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: ACBE44B3ED8D.AA1BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-monotonic_git.bb            | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-monoton=
ic_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-monotonic_git.=
bb b/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
deleted file mode 100644
index 2552409..0000000
--- a/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "An implementation of time.monotonic()"
-HOMEPAGE =3D "https://github.com/atdt/monotonic"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
-
-PV =3D "0.4"
-SRCREV =3D "93b3d3ba63597e57b20333db4e33ca0f48debf2a"
-
-SRCNAME =3D "monotonic"
-SRC_URI =3D "git://github.com/atdt/${SRCNAME}.git"
-
-S =3D "${WORKDIR}/git"
-
-inherit distutils
-
-DEPENDS +=3D " \
-        python-pbr \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-pbr \
-        "
-
-do_install_append() {
-    # Using these "longest" paths will ensure needed shorter paths will =
be created
-    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-inf=
o
-
-    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-pack=
ages/
-    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/s=
ite-packages/${SRCNAME}.egg-info/
-}
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2091.1576034698788207388
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6432CE01148; Tue, 10 Dec 2019 19:24:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FEBEE010D8
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:24:57 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79995406"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:24:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5FF934CE1BED
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:16:16 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:24:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-dnspython: Remove the recipe
Date: Wed, 11 Dec 2019 11:25:51 +0800
Message-ID: <20191211032551.24188-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5FF934CE1BED.AB645
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-dnspython_1.12.0.bb         | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-dnspyth=
on_1.12.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dnspython_1.12=
.0.bb b/meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb
deleted file mode 100644
index 36a1d12..0000000
--- a/meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "DNS toolkit for Python"
-HOMEPAGE =3D "http://www.dnspython.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D397eddfcb4bc7e2ece2fc79724a7c=
ca2"
-
-PR =3D "r0"
-SRCNAME =3D "dnspython"
-SRC_URI =3D "http://www.dnspython.org/kits/${PV}/${SRCNAME}-${PV}.tar.gz=
"
-
-SRC_URI[md5sum] =3D "3f2601ef3c8b77fc6d21a9c77a81efeb"
-SRC_URI[sha256sum] =3D "03fb82af866001c4afa58c48027bcc4b80bbf0a7f27e1d86=
1cf06393eea4724f"
-
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-# avoid "error: option --single-version-externally-managed not recognize=
d"
-DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
-    --prefix=3D${prefix} \
-    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=3D${datadir}"
--=20
2.20.1




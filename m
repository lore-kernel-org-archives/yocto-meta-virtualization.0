Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1068.1576028090285709521
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DD3BE01146; Tue, 10 Dec 2019 17:34:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6F34E01140
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:34:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79988112"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 09:34:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3199B4CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 09:26:09 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 09:34:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-alembic: Remove the recipe
Date: Wed, 11 Dec 2019 09:35:43 +0800
Message-ID: <20191211013543.21608-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3199B4CE1A0C.A792A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-alembic_0.8.10.bb             | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-alembic=
_0.8.10.bb

diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10=
.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
deleted file mode 100644
index 5a377d6..0000000
--- a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "A database migration tool for SQLAlchemy."
-HOMEPAGE =3D "http://bitbucket.org/zzzeek/alembic"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd07407716fd24408b5747b0fa2262=
775"
-
-SRC_URI[md5sum] =3D "21b344a70ce637699c18bf074a080649"
-SRC_URI[sha256sum] =3D "0e3b50e96218283ec7443fb661199f5a81f5879f766967a8=
a2d25e8f9d4e7919"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-    python-sqlalchemy \
-    python-mako \
-    python-python-editor \
-    "
-
--=20
2.20.1




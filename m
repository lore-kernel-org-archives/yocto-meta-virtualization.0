Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2180.1576035153394745755
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42C1BE01148; Tue, 10 Dec 2019 19:32:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C1FAE010D9
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:32:30 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79995765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:32:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F42354B3ED8D
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:23:50 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:32:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-jsonpatch: Remove the recipe
Date: Wed, 11 Dec 2019 11:33:26 +0800
Message-ID: <20191211033326.24835-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F42354B3ED8D.AA0AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonpatch_1.11.bb | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpat=
ch_1.11.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11=
.bb b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
deleted file mode 100644
index 8971c96..0000000
--- a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "An implementation of the JSON Patch format"
-HOMEPAGE =3D "https://github.com/stefankoegl/python-json-patch"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD+"
-LIC_FILES_CHKSUM =3D "file://jsonpatch.py;beginline=3D3;endline=3D30;md5=
=3D5cd7d1fbd6b236ed142e4285624f58fe"
-
-SRC_URI[md5sum] =3D "9f2d0aa31f99cc97089a203c5bed3924"
-SRC_URI[sha256sum] =3D "22d0bc0f5522a4a03dd9fb4c4cdf7c1f03256546c88be4c6=
1e5ceabd22280e47"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D "python-jsonpointer"
--=20
2.20.1




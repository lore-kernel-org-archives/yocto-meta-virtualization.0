Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2290.1576036027181522913
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3EE1E010D8; Tue, 10 Dec 2019 19:47:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66E83E00E37
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:47:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79997586"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:47:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 656634B3ED8D
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:38:25 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:46:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-jsonpointer: Remove the recipe
Date: Wed, 11 Dec 2019 11:48:00 +0800
Message-ID: <20191211034800.25085-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 656634B3ED8D.A8612
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonpointer_1.9.bb  | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpoi=
nter_1.9.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.=
9.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
deleted file mode 100644
index 12b5e89..0000000
--- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Identify specific nodes in a JSON document"
-HOMEPAGE =3D "https://github.com/stefankoegl/python-json-pointer"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://jsonpointer.py;beginline=3D3;endline=3D31;m=
d5=3D5e663c88967b53590856107a043d605c"
-
-SRC_URI[md5sum] =3D "c4d3f28e72ba77062538d1c0864c40a9"
-SRC_URI[sha256sum] =3D "39403b47a71aa782de6d80db3b78f8a5f68ad8dfc9e674ca=
3bb5b32c15ec7308"
-
-inherit setuptools pypi
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2439.1576036885153444628
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 20:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDF07E01147; Tue, 10 Dec 2019 20:01:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1269CE00852
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 20:01:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79998241"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 12:01:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 95BD34CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:52:45 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 12:01:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-netaddr: Remove the recipe
Date: Wed, 11 Dec 2019 12:02:17 +0800
Message-ID: <20191211040217.25804-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 95BD34CE1A0C.A9967
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-netaddr_0.7.19.bb   | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-netaddr=
_0.7.19.bb

diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19=
.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
deleted file mode 100644
index 1b50587..0000000
--- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "A library for network address representation and manipu=
lation"
-HOMEPAGE =3D "https://github.com/drkjam/netaddr"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6345d695ffe3776f68a56fe7962d=
b44"
-
-SRC_URI[md5sum] =3D "51019ef59c93f3979bcb37d3b8527e07"
-SRC_URI[sha256sum] =3D "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f=
6695127c7753aefd"
-
-inherit setuptools pypi
--=20
2.20.1




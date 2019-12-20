Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4216.1576806560915288845
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 17:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22505E01235; Thu, 19 Dec 2019 17:49:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E683DE011B6
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 17:49:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; 
   d="scan'208";a="80549973"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 09:49:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 91D3D4CE1A00
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 09:40:29 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 09:49:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-networkx: Remove the recipe
Date: Fri, 20 Dec 2019 09:50:14 +0800
Message-ID: <20191220015014.5719-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 91D3D4CE1A00.A966F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-networkx_1.11.bb            | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-network=
x_1.11.bb

diff --git a/meta-openstack/recipes-devtools/python/python-networkx_1.11.=
bb b/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
deleted file mode 100644
index f187663..0000000
--- a/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Python package for creating and manipulating graphs and=
 networks"
-HOMEPAGE =3D "http://networkx.lanl.gov/"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D925586ea588eb990de840dc71=
ea3752f"
-
-SRC_URI[md5sum] =3D "6ef584a879e9163013e9a762e1cf7cd1"
-SRC_URI[sha256sum] =3D "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f8063=
8fef91d54dd1e4b8"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-decorator \
-        "
--=20
2.20.1




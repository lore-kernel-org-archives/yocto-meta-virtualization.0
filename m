Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.6858.1578980440771017919
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 21:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C375E0140A; Mon, 13 Jan 2020 21:40:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5D0FE01383
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 21:40:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81791722"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 13:40:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E5684CE26CC
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 13:31:32 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 13:40:34 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 13:40:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-xstatic: Remove the recipe
Date: Tue, 14 Jan 2020 13:42:02 +0800
Message-ID: <20200114054202.4474-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2E5684CE26CC.AC768
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic_1.0.1.bb            | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic=
_1.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.=
bb b/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb
deleted file mode 100644
index 3e5c8d3..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "XStatic base package with minimal support code"
-HOMEPAGE =3D "http:/bitbucket.org/thomaswaldmann/xstatic"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D36a1e7eaa71e1bd07b8d224783=
9f228e"
-
-PYPI_PACKAGE =3D "XStatic"
-
-SRC_URI[md5sum] =3D "7064b5ea7fd1ee990e0ae0538301d9bc"
-SRC_URI[sha256sum] =3D "0ec93d7c66ebb9e0d31b664753437dc8634cb66e13310cb4=
7c9eb1e0bc66d726"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
--=20
2.20.1




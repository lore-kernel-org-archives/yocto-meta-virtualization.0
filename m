Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5376.1577065780817547264
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB078E01304; Sun, 22 Dec 2019 17:49:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50381E01228
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:49:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80610068"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:49:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 01B984B3ED8D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:40:50 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:49:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-stevedore: Remove the recipe
Date: Mon, 23 Dec 2019 09:50:40 +0800
Message-ID: <20191223015040.530-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 01B984B3ED8D.AE857
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-stevedore_1.29.0.bb         | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-stevedo=
re_1.29.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.29=
.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
deleted file mode 100644
index 4b02f03..0000000
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Manage dynamic plugins for Python applications"
-HOMEPAGE =3D "https://github.com/dreamhost/stevedore"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
-
-SRC_URI[md5sum] =3D "525186cba577852e0408c92c3f8fac65"
-SRC_URI[sha256sum] =3D "1e153545aca7a6a49d8337acca4f41c212fbfa60bf864ecd=
056df0cafb9627e8"
-
-inherit setuptools rmargparse pypi
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS +=3D " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} +=3D " \
-        python-pbr \
-        python-six \
-        "
--=20
2.20.1




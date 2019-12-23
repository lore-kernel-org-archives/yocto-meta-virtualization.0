Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5401.1577065917243782702
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 205A4E01300; Sun, 22 Dec 2019 17:51:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58AEEE008D9
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:51:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80610172"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:51:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 45E1F4B3ED8D
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:43:08 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:51:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-vcversioner: Remove the recipe
Date: Mon, 23 Dec 2019 09:52:58 +0800
Message-ID: <20191223015258.701-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 45E1F4B3ED8D.ABD0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-vcversioner_2.14.0.0.bb      | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-vcversi=
oner_2.14.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.=
14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.1=
4.0.0.bb
deleted file mode 100644
index 7811b69..0000000
--- a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.=
bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "An implementation of JSON Schema validation for Python"
-HOMEPAGE =3D "http://github.com/Julian/jsonschema"
-SECTION =3D "devel/python"
-LICENSE =3D "ISC"
-LIC_FILES_CHKSUM =3D "file://vcversioner.py;beginline=3D1;endline=3D13;m=
d5=3Db20bc154910c13368ad5ba54560f0b0c"
-
-SRC_URI[md5sum] =3D "7848a365ced9941053bc25d9a9f8f4b4"
-SRC_URI[sha256sum] =3D "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d=
591eec5357c03b86"
-
-inherit setuptools pypi
-
-
-DEPENDS_class-native +=3D " \
-        python \
-        python-setuptools \
-        "
-
-BBCLASSEXTEND =3D "native"
--=20
2.20.1




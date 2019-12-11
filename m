Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2153.1576034503100235261
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 19:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDEF8E010D9; Tue, 10 Dec 2019 19:21:42 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ADEBE00E37
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 19:21:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79995286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 11:21:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D44D4CE1A05
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:13:04 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 11:21:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-decorator: Remove the recipe
Date: Wed, 11 Dec 2019 11:22:39 +0800
Message-ID: <20191211032239.24015-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6D44D4CE1A05.A8B6A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-decorator_3.4.0.bb  | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-decorat=
or_3.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-decorator_3.4.=
0.bb b/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
deleted file mode 100644
index 73111f6..0000000
--- a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Better living through Python with decorators"
-HOMEPAGE =3D "http://pypi.python.org/pypi/decorator"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D8;endline=3D8;md5=3D08=
a46ecda64aec8026447390e764b86e"
-
-SRC_URI[md5sum] =3D "1e8756f719d746e2fc0dd28b41251356"
-SRC_URI[sha256sum] =3D "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51=
f36e1a7988d9d783"
-
-inherit setuptools  pypi
--=20
2.20.1




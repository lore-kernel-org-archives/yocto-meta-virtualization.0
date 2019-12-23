Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5296.1577065074768199409
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0E16E01300; Sun, 22 Dec 2019 17:37:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55B61E01164
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:37:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80609337"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:37:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AC3BF4CE1C98
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:29:07 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:37:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pyudev: Remove the recipe
Date: Mon, 23 Dec 2019 09:38:58 +0800
Message-ID: <20191223013858.32459-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AC3BF4CE1C98.AC329
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pyudev_0.16.1.bb    | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyudev_=
0.16.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.=
bb b/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
deleted file mode 100644
index 39f725d..0000000
--- a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "A libudev binding"
-HOMEPAGE =3D "http://pyudev.readthedocs.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "LGPL-2.1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
-
-SRC_URI[md5sum] =3D "4034de584b6d9efcbfc590a047c63285"
-SRC_URI[sha256sum] =3D "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c035=
38bcc4c735ff1c95"
-
-inherit setuptools pypi
--=20
2.20.1




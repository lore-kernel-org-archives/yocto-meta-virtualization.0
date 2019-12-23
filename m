Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5284.1577064945571153041
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E2B1E0122B; Sun, 22 Dec 2019 17:35:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCF88E01162
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:35:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80609199"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:35:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C39394CE1C93
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:26:56 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:35:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pytz: Remove the recipe
Date: Mon, 23 Dec 2019 09:36:47 +0800
Message-ID: <20191223013647.32312-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C39394CE1C93.A92F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pytz_2013.8.bb      | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pytz_20=
13.8.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb=
 b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
deleted file mode 100644
index 485c4ff..0000000
--- a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "World timezone definitions, modern and historical"
-HOMEPAGE =3D "http://pytz.sourceforge.net"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22b38951eb857cf285a4560a9=
14b7cd6"
-
-SRC_URI[md5sum] =3D "37750ca749ed3a52523b9682b0b7e381"
-SRC_URI[sha256sum] =3D "58552e870aa2c0a1fa3b4ef923f00fbf3e55afaa87f8d312=
44d44f188de4793a"
-
-inherit setuptools pypi
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5430.1577066158328397041
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 17:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 352BAE01304; Sun, 22 Dec 2019 17:55:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8386FE01228
	for <meta-virtualization@yoctoproject.org>; Sun, 22 Dec 2019 17:55:57 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,345,1571673600"; 
   d="scan'208";a="80610289"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 09:55:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 311494CE1C93
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 09:47:11 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Dec 2019 09:55:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-wrapt: Remove the recipe
Date: Mon, 23 Dec 2019 09:57:01 +0800
Message-ID: <20191223015701.1160-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 311494CE1C93.A71EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions and python3 versions in meta-openembedd=
ed, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-wrapt_git.bb   | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-wrapt_g=
it.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wrapt_git.bb b=
/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
deleted file mode 100644
index a2def9a..0000000
--- a/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "A Python module for decorators, wrappers and monkey pat=
ching."
-HOMEPAGE =3D "https://github.com/GrahamDumpleton/wrapt"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D848d45ec255e411c0ff82b034a49d=
8a0"
-
-PV =3D "1.10.5"
-SRCREV =3D "42af0563bf88e84d215dea9ea6f989cb867e930e"
-
-SRCNAME =3D "wrapt"
-SRC_URI =3D "git://github.com/GrahamDumpleton/${SRCNAME}.git"
-
-S =3D "${WORKDIR}/git"
-
-inherit setuptools
--=20
2.20.1




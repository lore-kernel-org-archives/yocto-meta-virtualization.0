Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4383.1576807747995031252
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 18:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DEF4E011BD; Thu, 19 Dec 2019 18:09:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C99B4E0079A
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 18:09:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; 
   d="scan'208";a="80550829"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 10:09:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D3BEC4CE1C86
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 10:00:23 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 10:09:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-prettytable: Remove the recipe
Date: Fri, 20 Dec 2019 10:10:10 +0800
Message-ID: <20191220021010.7027-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D3BEC4CE1C86.ABDA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because this already exists in meta-openembedded and there is python3 ver=
sions in meta-openembedded, Remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-prettytable_0.7.2.bb          | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-prettyt=
able_0.7.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-prettytable_0.=
7.2.bb b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.=
bb
deleted file mode 100644
index 8e09f02..0000000
--- a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "Python library for displaying tabular data in a ASCII t=
able format"
-HOMEPAGE =3D "http://code.google.com/p/prettytable"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3e73500ffa52de5071cff65990055=
282"
-
-SRC_URI[md5sum] =3D "0c1361104caff8b09f220748f9d69899"
-SRC_URI[sha256sum] =3D "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0=
db49956531211c4f"
-
-inherit setuptools pypi
-
-do_install_append() {
-	perm_files=3D`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.t=
xt"`
-	for f in $perm_files; do
-		chmod 644 "${f}"
-	done
-}
\ No newline at end of file
--=20
2.20.1




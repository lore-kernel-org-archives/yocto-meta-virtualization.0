Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.32967.1578884844039929857
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jan 2020 19:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98E37E0151A; Sun, 12 Jan 2020 19:07:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5C2CE013DC
	for <meta-virtualization@yoctoproject.org>; Sun, 12 Jan 2020 19:07:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; 
   d="scan'208";a="81710399"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 11:07:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 15CFE4CE1BE8
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 10:58:18 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 11:07:23 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 13 Jan 2020 11:07:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-mako: Remove the recipe
Date: Mon, 13 Jan 2020 11:08:49 +0800
Message-ID: <20200113030849.23239-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 15CFE4CE1BE8.A1289
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions in meta-openembedded, Remove the recipe=
.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-mako_0.8.1.bb     | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mako_0.=
8.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb =
b/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb
deleted file mode 100644
index 7fcbb01..0000000
--- a/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "A super-fast templating language that borrows the  best=
 ideas from the existing templating languages."
-HOMEPAGE =3D "http://www.makotemplates.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751ee0cfdf9df1a16bb=
b54"
-
-PYPI_PACKAGE =3D "Mako"
-
-SRC_URI[md5sum] =3D "96d962464ce6316004af0cc48495d73e"
-SRC_URI[sha256sum] =3D "4791be305338b1fbe09054ec42fb606856599cdcdcde6f34=
8858c13b5fa29158"
-
-inherit setuptools pypi
--=20
2.20.1




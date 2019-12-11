Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2610.1576037167066048948
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 20:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6FF2E01148; Tue, 10 Dec 2019 20:06:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 217F8E010D9
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 20:06:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79998477"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 12:06:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CDA664CE1C09
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 11:57:30 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 12:06:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-netifaces: Remove the recipe
Date: Wed, 11 Dec 2019 12:07:05 +0800
Message-ID: <20191211040705.26318-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CDA664CE1C09.AAE5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-netifaces.inc       | 10 ----------
 .../recipes-devtools/python/python-netifaces_0.10.9.bb |  2 --
 .../python/python3-netifaces_0.10.9.bb                 |  2 --
 3 files changed, 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-netifac=
es.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-netifac=
es_0.10.9.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-netifa=
ces_0.10.9.bb

diff --git a/meta-openstack/recipes-devtools/python/python-netifaces.inc =
b/meta-openstack/recipes-devtools/python/python-netifaces.inc
deleted file mode 100644
index b1b1ed5..0000000
--- a/meta-openstack/recipes-devtools/python/python-netifaces.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Portable network interface information."
-HOMEPAGE =3D "http://alastairs-place.net/netifaces"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] =3D "de92cc322b4f56047c073f802ad77860"
-SRC_URI[sha256sum] =3D "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9=
bd23b3490ef2abf3"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10=
.9.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
deleted file mode 100644
index aa9760b..0000000
--- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-netifaces.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-netifaces_0.1=
0.9.bb b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.=
bb
deleted file mode 100644
index a46326f..0000000
--- a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-netifaces.inc
--=20
2.20.1




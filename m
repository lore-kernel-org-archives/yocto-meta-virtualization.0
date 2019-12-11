Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1163.1576028525596576421
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDF75E01146; Tue, 10 Dec 2019 17:42:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B3BBE01141
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:42:03 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; 
   d="scan'208";a="79988489"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 09:42:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EC83A4CE1BEC
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Dec 2019 09:33:25 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 09:41:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-anyjson: Remove the recipe
Date: Wed, 11 Dec 2019 09:43:00 +0800
Message-ID: <20191211014300.21887-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: EC83A4CE1BEC.AB515
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-anyjson.inc       | 12 ------------
 .../recipes-devtools/python/python-anyjson_0.3.3.bb  |  2 --
 .../recipes-devtools/python/python3-anyjson_0.3.3.bb |  2 --
 3 files changed, 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-anyjson=
.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-anyjson=
_0.3.3.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-anyjso=
n_0.3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc b/=
meta-openstack/recipes-devtools/python/python-anyjson.inc
deleted file mode 100644
index 19e03e9..0000000
--- a/meta-openstack/recipes-devtools/python/python-anyjson.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "Loads the best available JSON implementation available =
in a common interface"
-HOMEPAGE =3D "https://bitbucket.org/runeh/anyjson"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D989aa97e73c912a83a3c873fa11de=
b08"
-
-inherit pypi
-
-SRC_URI[md5sum] =3D "2ea28d6ec311aeeebaf993cb3008b27c"
-SRC_URI[sha256sum] =3D "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20a=
d54cb34d158157ba"
-
-RDEPENDS_${PN} =3D "${PYTHON_PN}-simplejson"
diff --git a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.=
bb b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
deleted file mode 100644
index 2b90a2a..0000000
--- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-anyjson.inc
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3=
.bb b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
deleted file mode 100644
index d4d13ac..0000000
--- a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-anyjson.inc
-inherit setuptools3
--=20
2.20.1




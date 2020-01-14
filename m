Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4921.1578969698178055768
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0833E01528; Mon, 13 Jan 2020 18:41:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 108E9E00CAE
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:41:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81774258"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:41:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A26A4CE1C86
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 10:32:30 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:41:33 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:41:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-weakrefmethod: Add python3 version
Date: Tue, 14 Jan 2020 10:43:03 +0800
Message-ID: <20200114024303.30455-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7A26A4CE1C86.AB4A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-weakrefmethod.inc | 10 ++++++++++
 .../python/python-weakrefmethod_1.0.3.bb             | 12 ++----------
 .../python/python3-weakrefmethod_1.0.3.bb            |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-weakref=
method.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-weakre=
fmethod_1.0.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-weakrefmethod.=
inc b/meta-openstack/recipes-devtools/python/python-weakrefmethod.inc
new file mode 100644
index 0000000..28aee86
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-weakrefmethod.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "A WeakMethod class for storing bound methods using weak=
 references."
+HOMEPAGE =3D "https://github.com/twang817/weakrefmethod"
+SECTION =3D "devel/python"
+LICENSE =3D "PSF"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddd98d01d471fac8d8dbdd975229db=
a03"
+
+SRC_URI[md5sum] =3D "39e7450191dea0b17a646b929784ac6f"
+SRC_URI[sha256sum] =3D "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c=
1f8a4574301cda66"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-weakrefmethod_=
1.0.3.bb b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.=
0.3.bb
index f14d3e1..be5d594 100644
--- a/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.b=
b
+++ b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.b=
b
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "A WeakMethod class for storing bound methods using weak=
 references."
-HOMEPAGE =3D "https://github.com/twang817/weakrefmethod"
-SECTION =3D "devel/python"
-LICENSE =3D "PSF"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddd98d01d471fac8d8dbdd975229db=
a03"
-
-SRC_URI[md5sum] =3D "39e7450191dea0b17a646b929784ac6f"
-SRC_URI[sha256sum] =3D "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c=
1f8a4574301cda66"
-
-inherit setuptools pypi
+require python-weakrefmethod.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-weakrefmethod=
_1.0.3.bb b/meta-openstack/recipes-devtools/python/python3-weakrefmethod_=
1.0.3.bb
new file mode 100644
index 0000000..23dbb54
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-weakrefmethod_1.0.3.=
bb
@@ -0,0 +1,2 @@
+require python-weakrefmethod.inc
+inherit setuptools3
--=20
2.20.1




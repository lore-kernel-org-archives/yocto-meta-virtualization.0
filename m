Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.493.1575442641233775195
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 22:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1B42E010B0; Tue,  3 Dec 2019 22:57:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44C66E0082A
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 22:57:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79567476"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 14:57:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 71E584CE1646
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 14:48:45 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 14:57:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-paste: Add python3 version
Date: Wed, 4 Dec 2019 14:58:03 +0800
Message-ID: <20191204065803.27766-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 71E584CE1646.A6C40
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-paste.inc       | 12 ++++++++++++
 .../recipes-devtools/python/python-paste_2.0.2.bb  | 14 ++------------
 .../recipes-devtools/python/python3-paste_2.0.2.bb |  2 ++
 3 files changed, 16 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-paste.i=
nc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-paste_=
2.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-paste.inc b/me=
ta-openstack/recipes-devtools/python/python-paste.inc
new file mode 100644
index 0000000..64ebc27
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-paste.inc
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Tools for using a Web Server Gateway Interface stack"
+HOMEPAGE =3D "http://pythonpaste.org/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://docs/license.txt;md5=3D1798f29d55080c60365e=
6283cb49779c"
+
+PYPI_PACKAGE =3D "Paste"
+
+SRC_URI[md5sum] =3D "4bfc8a7eaf858f6309d2ac0f40fc951c"
+SRC_URI[sha256sum] =3D "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374=
d698641071daba99"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb=
 b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
index d20283c..e82dd2a 100644
--- a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
@@ -1,12 +1,2 @@
-DESCRIPTION =3D "Tools for using a Web Server Gateway Interface stack"
-HOMEPAGE =3D "http://pythonpaste.org/"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://docs/license.txt;md5=3D1798f29d55080c60365e=
6283cb49779c"
-
-PYPI_PACKAGE =3D "Paste"
-
-SRC_URI[md5sum] =3D "4bfc8a7eaf858f6309d2ac0f40fc951c"
-SRC_URI[sha256sum] =3D "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374=
d698641071daba99"
-
-inherit setuptools pypi
+require python-paste.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.b=
b b/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
new file mode 100644
index 0000000..c35d59e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
@@ -0,0 +1,2 @@
+require python-paste.inc
+inherit setuptools3
--=20
2.20.1




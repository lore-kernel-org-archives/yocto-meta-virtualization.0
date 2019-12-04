Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.430.1575442264120918229
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 22:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2449E010B0; Tue,  3 Dec 2019 22:51:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30ED6E003E1
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 22:51:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79567194"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 14:50:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A070C4CE1C09
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 14:42:26 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 14:51:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pam: Add python3 version
Date: Wed, 4 Dec 2019 14:51:44 +0800
Message-ID: <20191204065144.23509-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A070C4CE1C09.A909E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pam.inc           | 10 ++++++++++
 .../recipes-devtools/python/python-pam_0.1.4.bb      | 12 ++----------
 .../recipes-devtools/python/python3-pam_0.1.4.bb     |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pam.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pam_0.=
1.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pam.inc b/meta=
-openstack/recipes-devtools/python/python-pam.inc
new file mode 100644
index 0000000..4fddfbc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pam.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "PAM interface using ctypes"
+HOMEPAGE =3D "http://atlee.ca/software/pam"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D13;endline=3D13;md5=3D=
8ecc573c355c5eb26b2a4a4f3f62684d"
+
+SRC_URI[md5sum] =3D "4c5247af579352bb6882dac64be10a33"
+SRC_URI[sha256sum] =3D "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640a=
f1597c2a1dde226b"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb b=
/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
index c818d5f..b583d30 100644
--- a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "PAM interface using ctypes"
-HOMEPAGE =3D "http://atlee.ca/software/pam"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D13;endline=3D13;md5=3D=
8ecc573c355c5eb26b2a4a4f3f62684d"
-
-SRC_URI[md5sum] =3D "4c5247af579352bb6882dac64be10a33"
-SRC_URI[sha256sum] =3D "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640a=
f1597c2a1dde226b"
-
-inherit setuptools pypi
+require python-pam.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb =
b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
new file mode 100644
index 0000000..e62079f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
@@ -0,0 +1,2 @@
+require python-pam.inc
+inherit setuptools3
--=20
2.20.1




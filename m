Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4316.1574997646623706715
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 19:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2504EE010B0; Thu, 28 Nov 2019 19:20:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D86FE00782
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 19:20:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79248765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 11:20:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 68EDB4CE1C07
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 11:12:19 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 11:20:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-funcsigs: Add python3 version
Date: Fri, 29 Nov 2019 11:21:30 +0800
Message-ID: <20191129032130.6178-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 68EDB4CE1C07.AA95F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-funcsigs.inc    | 12 ++++++++++++
 .../python/python-funcsigs_1.0.2.bb                | 14 ++------------
 .../python/python3-funcsigs_1.0.2.bb               |  2 ++
 3 files changed, 16 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-funcsig=
s.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-funcsi=
gs_1.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs.inc b=
/meta-openstack/recipes-devtools/python/python-funcsigs.inc
new file mode 100644
index 0000000..24c4894
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-funcsigs.inc
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Python function signatures from PEP362 for Python 2.6, =
2.7 and 3.2+"
+HOMEPAGE =3D "http://funcsigs.readthedocs.org"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6bc91dc8e5793892189fe7481a2d=
354"
+
+SRC_URI[md5sum] =3D "7e583285b1fb8a76305d6d68f4ccc14e"
+SRC_URI[sha256sum] =3D "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4=
abce3b87022a8f50"
+
+inherit pypi
+
+CLEANBROKEN =3D "1"
diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2=
.bb b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
index f682452..3adcba7 100644
--- a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
@@ -1,12 +1,2 @@
-DESCRIPTION =3D "Python function signatures from PEP362 for Python 2.6, =
2.7 and 3.2+"
-HOMEPAGE =3D "http://funcsigs.readthedocs.org"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6bc91dc8e5793892189fe7481a2d=
354"
-
-SRC_URI[md5sum] =3D "7e583285b1fb8a76305d6d68f4ccc14e"
-SRC_URI[sha256sum] =3D "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4=
abce3b87022a8f50"
-
-inherit setuptools pypi
-
-CLEANBROKEN =3D "1"
+require python-funcsigs.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.=
2.bb b/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb
new file mode 100644
index 0000000..617ebf9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb
@@ -0,0 +1,2 @@
+require python-funcsigs.inc
+inherit setuptools3
--=20
2.20.1




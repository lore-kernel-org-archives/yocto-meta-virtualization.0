Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4477.1578967496404179394
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBAD0E01402; Mon, 13 Jan 2020 18:04:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E303E01148
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:04:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81771591"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:04:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 12E354CE20C1
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 09:55:42 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:04:45 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:04:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-testresources: Add python3 version
Date: Tue, 14 Jan 2020 10:06:15 +0800
Message-ID: <20200114020615.21559-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 12E354CE20C1.AD711
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-testresources.inc | 10 ++++++++++
 .../python/python-testresources_0.2.7.bb             | 12 ++----------
 .../python/python3-testresources_0.2.7.bb            |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-testres=
ources.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-testre=
sources_0.2.7.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testresources.=
inc b/meta-openstack/recipes-devtools/python/python-testresources.inc
new file mode 100644
index 0000000..67ad6c4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-testresources.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "Testresources, a pyunit extension for managing expensiv=
e test resources"
+HOMEPAGE =3D "https://pypi.python.org/pypi/testtools/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://README;md5=3D038679cd2cf27bb2acc70257bfee0f=
41"
+
+SRC_URI[md5sum] =3D "db2e774be2a6f5754cbbf4c537f823d0"
+SRC_URI[sha256sum] =3D "ad0a117383dd463827b199eaa92829b4d6a3147fbd974598=
20df53bae81d7231"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-testresources_=
0.2.7.bb b/meta-openstack/recipes-devtools/python/python-testresources_0.=
2.7.bb
index fe8dbb1..d939405 100644
--- a/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.b=
b
+++ b/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.b=
b
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "Testresources, a pyunit extension for managing expensiv=
e test resources"
-HOMEPAGE =3D "https://pypi.python.org/pypi/testtools/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://README;md5=3D038679cd2cf27bb2acc70257bfee0f=
41"
-
-SRC_URI[md5sum] =3D "db2e774be2a6f5754cbbf4c537f823d0"
-SRC_URI[sha256sum] =3D "ad0a117383dd463827b199eaa92829b4d6a3147fbd974598=
20df53bae81d7231"
-
-inherit setuptools pypi
+require python-testresources.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-testresources=
_0.2.7.bb b/meta-openstack/recipes-devtools/python/python3-testresources_=
0.2.7.bb
new file mode 100644
index 0000000..79a535c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-testresources_0.2.7.=
bb
@@ -0,0 +1,2 @@
+require python-testresources.inc
+inherit setuptools3
--=20
2.20.1




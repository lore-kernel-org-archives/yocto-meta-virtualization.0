Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.346.1578292142989123181
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 22:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65F64E01450; Sun,  5 Jan 2020 22:29:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,PDS_BTC_ID,
	RCVD_IN_DNSWL_MED,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  0.5 PDS_BTC_ID FP reduced Bitcoin ID
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B73AEE012F5
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 22:29:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81342207"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 14:29:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F1AF49E9327
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 14:20:03 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 14:28:43 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 14:28:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-coverage: Add python3 version
Date: Mon, 6 Jan 2020 14:30:01 +0800
Message-ID: <20200106063001.31826-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0F1AF49E9327.AC80D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-coverage.inc                | 18 +++++++++++++++++
 .../python/python-coverage_4.0a5.bb           | 20 ++-----------------
 .../python/python3-coverage_4.0a5.bb          |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-coverag=
e.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-covera=
ge_4.0a5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-coverage.inc b=
/meta-openstack/recipes-devtools/python/python-coverage.inc
new file mode 100644
index 0000000..f1c5022
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-coverage.inc
@@ -0,0 +1,18 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DESCRIPTION =3D "Code coverage measurement for Python"
+HOMEPAGE =3D "https://pypi.python.org/pypi/coverage"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD;md5=3D3775480a712=
fc46a69647678acb234cb"
+
+SRC_URI[md5sum] =3D "37f4d8ae679b2c43a87da8d519817a3b"
+SRC_URI[sha256sum] =3D "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a=
5b04dc8597a07e0e"
+
+inherit pypi
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
diff --git a/meta-openstack/recipes-devtools/python/python-coverage_4.0a5=
.bb b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
index 9e63221..0ddc356 100644
--- a/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
+++ b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
@@ -1,18 +1,2 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION =3D "Code coverage measurement for Python"
-HOMEPAGE =3D "https://pypi.python.org/pypi/coverage"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD;md5=3D3775480a712=
fc46a69647678acb234cb"
-
-SRC_URI[md5sum] =3D "37f4d8ae679b2c43a87da8d519817a3b"
-SRC_URI[sha256sum] =3D "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a=
5b04dc8597a07e0e"
-
-inherit setuptools pypi
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
+require python-coverage.inc
+inherit setuptools=20
diff --git a/meta-openstack/recipes-devtools/python/python3-coverage_4.0a=
5.bb b/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
new file mode 100644
index 0000000..917a06c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
@@ -0,0 +1,2 @@
+require python-coverage.inc
+inherit setuptools3
--=20
2.20.1




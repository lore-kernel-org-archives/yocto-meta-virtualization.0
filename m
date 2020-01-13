Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.32809.1578883794509577970
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jan 2020 18:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6EE4E01518; Sun, 12 Jan 2020 18:49:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 744FBE0136C
	for <meta-virtualization@yoctoproject.org>; Sun, 12 Jan 2020 18:49:52 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; 
   d="scan'208";a="81709900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:49:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AFA8F4CE1BE8
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 10:40:43 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:49:49 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:49:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-kafka: upgrade 0.9.4 -> 1.4.7
Date: Mon, 13 Jan 2020 10:51:12 +0800
Message-ID: <20200113025112.18688-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AFA8F4CE1BE8.AECBA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

-Add python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-kafka.inc  | 23 ++++++++++++++++++
 .../python/python-kafka_git.bb                | 24 +------------------
 .../python/python3-kafka_git.bb               |  3 +++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-kafka.i=
nc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-kafka_=
git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-kafka.inc b/me=
ta-openstack/recipes-devtools/python/python-kafka.inc
new file mode 100644
index 0000000..0b360c1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-kafka.inc
@@ -0,0 +1,23 @@
+SUMMARY =3D "Python client for Apache Kafka"
+HOMEPAGE =3D "https://github.com/mumrah/kafka-python"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+
+PV =3D "1.4.7+git${SRCPV}"
+SRCREV =3D "0552b04326c73be29f209c12920ef4cbaceb9818"
+
+SRCNAME =3D "kafka-python"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22efebb1e053dcc946f4b9d17f3cb=
bea"
+SRC_URI =3D "git://github.com/mumrah/${SRCNAME}.git"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS +=3D " \
+	${PYTHON_PN}-pbr \
+	"
+
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-six \
+	"
+
diff --git a/meta-openstack/recipes-devtools/python/python-kafka_git.bb b=
/meta-openstack/recipes-devtools/python/python-kafka_git.bb
index 7fbb826..8a474c8 100644
--- a/meta-openstack/recipes-devtools/python/python-kafka_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-kafka_git.bb
@@ -1,25 +1,3 @@
-SUMMARY =3D "Python client for Apache Kafka"
-HOMEPAGE =3D "https://github.com/mumrah/kafka-python"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-
-PV =3D "0.9.4+git${SRCPV}"
-SRCREV =3D "4955582be1443b75c23f700268b7abbef0fde0ad"
-
-SRCNAME =3D "kafka-python"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22efebb1e053dcc946f4b9d17f3cb=
bea"
-SRC_URI =3D "git://github.com/mumrah/${SRCNAME}.git"
-
-S =3D "${WORKDIR}/git"
-
+require python-kafka.inc
 inherit setuptools
=20
-DEPENDS +=3D " \
-	python-pbr \
-	"
-
-RDEPENDS_${PN} +=3D " \
-        python-six \
-	"
-
diff --git a/meta-openstack/recipes-devtools/python/python3-kafka_git.bb =
b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
new file mode 100644
index 0000000..55c9fcb
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
@@ -0,0 +1,3 @@
+require python-kafka.inc
+inherit setuptools3
+
--=20
2.20.1




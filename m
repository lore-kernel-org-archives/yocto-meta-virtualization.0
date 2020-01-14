Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4557.1578968096249059288
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 18:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBFC4E01528; Mon, 13 Jan 2020 18:14:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 549CDE008D9
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jan 2020 18:14:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,431,1571673600"; 
   d="scan'208";a="81772331"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2020 10:14:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 429FD4CE1CBE
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jan 2020 10:05:43 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 Jan 2020 10:14:45 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Jan 2020 10:14:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-thrift: Add python3 version
Date: Tue, 14 Jan 2020 10:16:15 +0800
Message-ID: <20200114021615.24120-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 429FD4CE1CBE.AC491
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-thrift.inc        | 10 ++++++++++
 .../recipes-devtools/python/python-thrift_0.9.2.bb   | 12 ++----------
 .../recipes-devtools/python/python3-thrift_0.9.2.bb  |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-thrift.=
inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-thrift=
_0.9.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-thrift.inc b/m=
eta-openstack/recipes-devtools/python/python-thrift.inc
new file mode 100644
index 0000000..019d7c8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-thrift.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "Python bindings for the Apache Thrift RPC system"
+HOMEPAGE =3D "https://pypi.python.org/pypi/amqp/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Ddf17a59cc9e1327ec49c2285e13a=
c477"
+
+SRC_URI[md5sum] =3D "91f1c224c46a257bb428431943387dfd"
+SRC_URI[sha256sum] =3D "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01=
054a74141e378afa"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.b=
b b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
index e8fea35..4d01cb5 100644
--- a/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "Python bindings for the Apache Thrift RPC system"
-HOMEPAGE =3D "https://pypi.python.org/pypi/amqp/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Ddf17a59cc9e1327ec49c2285e13a=
c477"
-
-SRC_URI[md5sum] =3D "91f1c224c46a257bb428431943387dfd"
-SRC_URI[sha256sum] =3D "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01=
054a74141e378afa"
-
-inherit setuptools pypi
+require python-thrift.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.=
bb b/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb
new file mode 100644
index 0000000..095dcba
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb
@@ -0,0 +1,2 @@
+require python-thrift.inc
+inherit setuptools3
--=20
2.20.1




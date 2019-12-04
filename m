Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.216.1575440054844782389
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 22:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5316FE010B3; Tue,  3 Dec 2019 22:14:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0E5EE00839
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 22:14:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79564177"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 14:14:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B0034CE1C09
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 14:05:43 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 14:14:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-ovs: Add python3 version
Date: Wed, 4 Dec 2019 14:15:00 +0800
Message-ID: <20191204061500.21656-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1B0034CE1C09.A6913
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-ovs.inc           | 10 ++++++++++
 .../recipes-devtools/python/python-ovs_2.7.2.bb      | 12 ++----------
 .../recipes-devtools/python/python3-ovs_2.7.2.bb     |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-ovs.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-ovs_2.=
7.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ovs.inc b/meta=
-openstack/recipes-devtools/python/python-ovs.inc
new file mode 100644
index 0000000..d9303f2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-ovs.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "Open vSwitch library"
+HOMEPAGE =3D "https://pypi.python.org/pypi/ovs"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[md5sum] =3D "8551ed58f4e5878db9a599e2d7792d98"
+SRC_URI[sha256sum] =3D "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f4=
2200b1674fd60928"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb b=
/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
index 2ec9a6e..cd3685d 100644
--- a/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "Open vSwitch library"
-HOMEPAGE =3D "https://pypi.python.org/pypi/ovs"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
-
-SRC_URI[md5sum] =3D "8551ed58f4e5878db9a599e2d7792d98"
-SRC_URI[sha256sum] =3D "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f4=
2200b1674fd60928"
-
-inherit setuptools pypi
+require python-ovs.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb =
b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
new file mode 100644
index 0000000..9c9b82b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
@@ -0,0 +1,2 @@
+require python-ovs.inc
+inherit setuptools3
--=20
2.20.1




Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1015.1575446838911317970
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 00:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53094E010B0; Wed,  4 Dec 2019 00:07:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04E06E00ED3
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 00:07:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79571486"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:07:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A7484CE1BED
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 15:58:44 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:07:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-rcssmin: Add python3 version
Date: Wed, 4 Dec 2019 16:08:02 +0800
Message-ID: <20191204080802.2535-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4A7484CE1BED.A9A61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-rcssmin.inc  | 15 +++++++++++++++
 .../python/python-rcssmin_1.0.6.bb              | 17 ++---------------
 .../python/python3-rcssmin_1.0.6.bb             |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rcssmin=
.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rcssmi=
n_1.0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin.inc b/=
meta-openstack/recipes-devtools/python/python-rcssmin.inc
new file mode 100644
index 0000000..c897395
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rcssmin.inc
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "RCSSmin is a CSS minifier."
+HOMEPAGE =3D "http://opensource.perlig.de/rcssmin/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
+
+SRC_URI[md5sum] =3D "467d56503ce386c0b0e52f69ac143a9a"
+SRC_URI[sha256sum] =3D "ca87b695d3d7864157773a61263e5abb96006e9ff0e021ef=
f90cbe0e1ba18270"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D " \
+        "
+
+CLEANBROKEN =3D "1"
diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.=
bb b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
index e1b4a55..9b7624b 100644
--- a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
@@ -1,15 +1,2 @@
-DESCRIPTION =3D "RCSSmin is a CSS minifier."
-HOMEPAGE =3D "http://opensource.perlig.de/rcssmin/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
-
-SRC_URI[md5sum] =3D "467d56503ce386c0b0e52f69ac143a9a"
-SRC_URI[sha256sum] =3D "ca87b695d3d7864157773a61263e5abb96006e9ff0e021ef=
f90cbe0e1ba18270"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-        "
-
-CLEANBROKEN =3D "1"
+require python-rcssmin.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6=
.bb b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
new file mode 100644
index 0000000..56347b5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
@@ -0,0 +1,2 @@
+require python-rcssmin.inc
+inherit setuptools3
--=20
2.20.1




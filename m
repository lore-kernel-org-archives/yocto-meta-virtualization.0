Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.414.1578292759204977475
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 22:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14AE1E01204; Sun,  5 Jan 2020 22:39:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 677B4E007D4
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 22:39:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81345471"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 14:39:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6ADC949E9337
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 14:30:18 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 14:39:15 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 14:39:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-uritemplate: Add python3 version
Date: Mon, 6 Jan 2020 14:40:33 +0800
Message-ID: <20200106064033.706-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6ADC949E9337.A9DE5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-uritemplate.inc    |  9 +++++++++
 .../python/python-uritemplate_3.0.0.bb                | 11 ++---------
 .../python/python3-uritemplate_3.0.0.bb               |  2 ++
 3 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-uritemp=
late.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-uritem=
plate_3.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-uritemplate.in=
c b/meta-openstack/recipes-devtools/python/python-uritemplate.inc
new file mode 100644
index 0000000..e0c53e7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-uritemplate.inc
@@ -0,0 +1,9 @@
+SUMMARY =3D "Simple python library to deal with URI Templates."
+AUTHOR =3D "Ian Cordasco"
+LICENSE =3D "Apache-2.0 & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df2e14cc8f5f696fd9d47092e99226=
5c1"
+
+inherit pypi
+
+SRC_URI[md5sum] =3D "1ec31e0d8a2eec72357b2cef4bce5945"
+SRC_URI[sha256sum] =3D "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4=
028a93f1527d011d"
diff --git a/meta-openstack/recipes-devtools/python/python-uritemplate_3.=
0.0.bb b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.=
bb
index d32c1a8..1e19ab9 100644
--- a/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
@@ -1,9 +1,2 @@
-SUMMARY =3D "Simple python library to deal with URI Templates."
-AUTHOR =3D "Ian Cordasco"
-LICENSE =3D "Apache-2.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df2e14cc8f5f696fd9d47092e99226=
5c1"
-
-inherit setuptools pypi
-
-SRC_URI[md5sum] =3D "1ec31e0d8a2eec72357b2cef4bce5945"
-SRC_URI[sha256sum] =3D "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4=
028a93f1527d011d"
+require python-uritemplate.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-uritemplate_3=
.0.0.bb b/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.=
0.bb
new file mode 100644
index 0000000..eac83dc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb
@@ -0,0 +1,2 @@
+require python-uritemplate.inc
+inherit setuptools3
--=20
2.20.1




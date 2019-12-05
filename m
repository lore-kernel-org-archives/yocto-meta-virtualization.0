Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2933.1575510959615080946
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 17:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 394B9E010CA; Wed,  4 Dec 2019 17:55:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61E68E00F05
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 17:55:58 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; 
   d="scan'208";a="79611441"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 09:55:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CDB8B4CE151A
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 09:47:22 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 09:55:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-singledispatch: Add python3 version
Date: Thu, 5 Dec 2019 09:56:41 +0800
Message-ID: <20191205015641.17194-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CDB8B4CE151A.A914C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-singledispatch.inc                 | 10 ++++++++++
 .../python/python-singledispatch_3.4.0.3.bb          | 12 ++----------
 .../python/python3-singledispatch_3.4.0.3.bb         |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-singled=
ispatch.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-single=
dispatch_3.4.0.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch=
.inc b/meta-openstack/recipes-devtools/python/python-singledispatch.inc
new file mode 100644
index 0000000..3ea5026
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-singledispatch.inc
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "functools.singledispatch from Python 3.4 to Python 2.6"
+HOMEPAGE =3D "https://pypi.python.org/pypi/singledistpatch"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Dee3cd67264adc7eb07981f3644=
dc17dc"
+
+SRC_URI[md5sum] =3D "af2fc6a3d6cc5a02d0bf54d909785fcb"
+SRC_URI[sha256sum] =3D "5b06af87df13818d14f08a028e42f566640aef80805c3b50=
c5056b086e3c2b9c"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch=
_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python-singledispatc=
h_3.4.0.3.bb
index 1c92a99..47c6698 100644
--- a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.=
3.bb
+++ b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.=
3.bb
@@ -1,10 +1,2 @@
-DESCRIPTION =3D "functools.singledispatch from Python 3.4 to Python 2.6"
-HOMEPAGE =3D "https://pypi.python.org/pypi/singledistpatch"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Dee3cd67264adc7eb07981f3644=
dc17dc"
-
-SRC_URI[md5sum] =3D "af2fc6a3d6cc5a02d0bf54d909785fcb"
-SRC_URI[sha256sum] =3D "5b06af87df13818d14f08a028e42f566640aef80805c3b50=
c5056b086e3c2b9c"
-
-inherit setuptools pypi
+require python-singledispatch.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-singledispatc=
h_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python3-singledispa=
tch_3.4.0.3.bb
new file mode 100644
index 0000000..0f4b483
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0=
.3.bb
@@ -0,0 +1,2 @@
+require python-singledispatch.inc
+inherit setuptools3
--=20
2.20.1




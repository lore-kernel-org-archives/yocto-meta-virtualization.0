Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3114.1575511946531656707
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 18:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1233CE010CA; Wed,  4 Dec 2019 18:12:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72396E00F05
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 18:12:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; 
   d="scan'208";a="79612179"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 10:12:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DBD1C4CE20C2
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 10:03:48 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 10:12:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-sysv-ipc: Add python3 version
Date: Thu, 5 Dec 2019 10:13:06 +0800
Message-ID: <20191205021306.27153-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: DBD1C4CE20C2.AA896
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-sysv-ipc.inc                | 22 +++++++++++++++++
 .../python/python-sysv-ipc_0.6.8.bb           | 24 ++-----------------
 .../python/python3-sysv-ipc_0.6.8.bb          |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-sysv-ip=
c.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-sysv-i=
pc_0.6.8.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc b=
/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
new file mode 100644
index 0000000..47ecf2c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "System V IPC primitives (semaphores, shared memory and =
message queues) for Python"
+HOMEPAGE =3D "http://semanchuk.com/philip/sysv_ipc/"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D9d6e34e7b47096d7c19c1e3be707=
374e"
+
+PYPI_PACKAGE =3D "sysv_ipc"
+
+SRC_URI[md5sum] =3D "c6cf5b4aa7cd3e07fd4b5661530eca8c"
+SRC_URI[sha256sum] =3D "0af73375a85c5d9d487c2f14f208812600bd81e4046437eb=
af55746b3aade00e"
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS +=3D " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default:=20
+RDEPENDS_${PN} +=3D " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8=
.bb b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
index c46cfcb..08a2ee0 100644
--- a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
+++ b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
@@ -1,22 +1,2 @@
-DESCRIPTION =3D "System V IPC primitives (semaphores, shared memory and =
message queues) for Python"
-HOMEPAGE =3D "http://semanchuk.com/philip/sysv_ipc/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D9d6e34e7b47096d7c19c1e3be707=
374e"
-
-PYPI_PACKAGE =3D "sysv_ipc"
-
-SRC_URI[md5sum] =3D "c6cf5b4aa7cd3e07fd4b5661530eca8c"
-SRC_URI[sha256sum] =3D "0af73375a85c5d9d487c2f14f208812600bd81e4046437eb=
af55746b3aade00e"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        python-pip \
-        "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
+require python-sysv-ipc.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.=
8.bb b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
new file mode 100644
index 0000000..0e3dcd1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
@@ -0,0 +1,2 @@
+require python-sysv-ipc.inc
+inherit setuptools3
--=20
2.20.1




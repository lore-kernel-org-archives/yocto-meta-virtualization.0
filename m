Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4516.1574999349946368761
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 19:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 404A7E010B3; Thu, 28 Nov 2019 19:49:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40836E00ED2
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 19:49:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; 
   d="scan'208";a="79250065"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 11:49:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A05164CE1BF0
	for <meta-virtualization@yoctoproject.org>; Fri, 29 Nov 2019 11:40:38 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 29 Nov 2019 11:48:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-gevent-websocket: Add python3 version
Date: Fri, 29 Nov 2019 11:49:49 +0800
Message-ID: <20191129034949.11882-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A05164CE1BF0.AB982
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-gevent-websocket.inc           | 14 ++++++++++++++
 .../python/python-gevent-websocket_0.10.1.bb     | 16 ++--------------
 .../python/python3-gevent-websocket_0.10.1.bb    |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-gevent-=
websocket.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-gevent=
-websocket_0.10.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-gevent-websock=
et.inc b/meta-openstack/recipes-devtools/python/python-gevent-websocket.i=
nc
new file mode 100644
index 0000000..011c23e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-gevent-websocket.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "Websocket handler for the gevent pywsgi server, a Pytho=
n network library"
+HOMEPAGE =3D "https://gitlab.com/noppo/gevent-websocket"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5aa2f1d4ea55d60497aa8c3debf29=
ab2"
+
+SRC_URI[md5sum] =3D "e095bf3358175489a956949c1b4de9ff"
+SRC_URI[sha256sum] =3D "7eaef32968290c9121f7c35b973e2cc302ffb076d018c906=
8d2f5ca8b2d85fb0"
+
+inherit pypi
+
+RDEPENDS_${PN} +=3D " \
+        ${PYTHON_PN}-gevent \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-gevent-websock=
et_0.10.1.bb b/meta-openstack/recipes-devtools/python/python-gevent-webso=
cket_0.10.1.bb
index a12d0ad..bc529f5 100644
--- a/meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10=
.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10=
.1.bb
@@ -1,14 +1,2 @@
-DESCRIPTION =3D "Websocket handler for the gevent pywsgi server, a Pytho=
n network library"
-HOMEPAGE =3D "https://gitlab.com/noppo/gevent-websocket"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5aa2f1d4ea55d60497aa8c3debf29=
ab2"
-
-SRC_URI[md5sum] =3D "e095bf3358175489a956949c1b4de9ff"
-SRC_URI[sha256sum] =3D "7eaef32968290c9121f7c35b973e2cc302ffb076d018c906=
8d2f5ca8b2d85fb0"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} +=3D " \
-        python-gevent \
-        "
+require python-gevent-websocket.inc
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-gevent-websoc=
ket_0.10.1.bb b/meta-openstack/recipes-devtools/python/python3-gevent-web=
socket_0.10.1.bb
new file mode 100644
index 0000000..99e4946
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-gevent-websocket_0.1=
0.1.bb
@@ -0,0 +1,2 @@
+require python-gevent-websocket.inc
+inherit setuptools3
--=20
2.20.1




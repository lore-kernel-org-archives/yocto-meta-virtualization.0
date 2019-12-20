Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4302.1576807148440013666
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 17:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45589E0112E; Thu, 19 Dec 2019 17:59:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDAF5E0082A
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Dec 2019 17:59:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; 
   d="scan'208";a="80550390"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 09:59:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E05A24CE1C91
	for <meta-virtualization@yoctoproject.org>; Fri, 20 Dec 2019 09:50:22 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Dec 2019 09:59:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pika: Remove the recipe
Date: Fri, 20 Dec 2019 10:00:09 +0800
Message-ID: <20191220020009.6314-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E05A24CE1C91.A9F8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Because there are higher versions in meta-openembedded, Remove the recipe=
.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pika.inc         | 13 -------------
 .../recipes-devtools/python/python-pika_git.bb      |  3 ---
 .../recipes-devtools/python/python3-pika_git.bb     |  3 ---
 3 files changed, 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pika.in=
c
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pika_gi=
t.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pika_g=
it.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika.inc b/met=
a-openstack/recipes-devtools/python/python-pika.inc
deleted file mode 100644
index d33979d..0000000
--- a/meta-openstack/recipes-devtools/python/python-pika.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY =3D "Pure Python RabbitMQ/AMQP 0-9-1 client library"
-HOMEPAGE =3D "https://github.com/pika/pika"
-SECTION =3D "devel/python"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfb26c37045f9e0d2c5e24b711bd7f=
01c"
-
-PV =3D "0.10.0+git${SRCPV}"
-SRCREV =3D "b907f91415169b7f590174ab5d228e75a1b273e6"
-
-SRC_URI =3D "git://github.com/pika/pika"
-
-S =3D "${WORKDIR}/git"
diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb b/=
meta-openstack/recipes-devtools/python/python-pika_git.bb
deleted file mode 100644
index 9d58184..0000000
--- a/meta-openstack/recipes-devtools/python/python-pika_git.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-pika.inc
-
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pika_git.bb b=
/meta-openstack/recipes-devtools/python/python3-pika_git.bb
deleted file mode 100644
index 93f50b4..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pika_git.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-pika.inc
-
-inherit setuptools3
--=20
2.20.1




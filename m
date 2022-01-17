Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A6EC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 12:58:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10901.1642424311626839784
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B328E1FB
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:58:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383EA3F73D
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:58:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-dtc: fix packaging by using setuptools
Date: Mon, 17 Jan 2022 12:58:27 +0000
Message-Id: <20220117125827.464599-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 12:58:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7007

Inheriting setuptools3-base doesn't actually define any tasks, so commit
1ef6050 to drop distutils3 had the side-effect of not building any code.

Backport a commit from upstream to switch to setuptools, inherit
setuptool3, and change DISTUTILS_SETUP_PATH to SETUPTOOLS_SETUP_PATH.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-kernel/dtc/files/setuptools.patch | 34 +++++++++++++++++++++++
 recipes-kernel/dtc/python3-dtc_1.6.1.bb   |  7 +++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/dtc/files/setuptools.patch

diff --git a/recipes-kernel/dtc/files/setuptools.patch b/recipes-kernel/d=
tc/files/setuptools.patch
new file mode 100644
index 0000000..3d37ebd
--- /dev/null
+++ b/recipes-kernel/dtc/files/setuptools.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c691776ddb26acbd3674722caafacaf7b6e3e807 Mon Sep 17 00:00:00 2001
+From: Rob Herring <robh@kernel.org>
+Date: Wed, 10 Nov 2021 19:11:32 -0600
+Subject: [PATCH] pylibfdt: Use setuptools instead of distutils
+
+The use of setuptools is favored over distutils. setuptools is needed to
+support building Python 'wheels' and for pip support.
+
+Signed-off-by: Rob Herring <robh@kernel.org>
+Message-Id: <20211111011135.2386773-2-robh@kernel.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+---
+ pylibfdt/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
+index ef40f15..f065a59 100755
+--- a/pylibfdt/setup.py
++++ b/pylibfdt/setup.py
+@@ -10,7 +10,7 @@ Copyright (C) 2017 Google, Inc.
+ Written by Simon Glass <sjg@chromium.org>
+ """
+=20
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ import os
+ import re
+ import sys
+--=20
+2.25.1
+
diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc=
/python3-dtc_1.6.1.bb
index e9b8499..6e02db6 100644
--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -7,6 +7,7 @@ LICENSE =3D "GPLv2 | BSD-2-Clause"
 DEPENDS =3D "flex-native bison-native swig-native libyaml dtc"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
+           file://setuptools.patch \
            file://ssize.patch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
@@ -17,13 +18,13 @@ SRCREV =3D "ecaeb97fec013973360e94888a7de645f084345c"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit setuptools3-base pkgconfig
+inherit setuptools3 pkgconfig
=20
-DISTUTILS_SETUP_PATH =3D "${S}/pylibfdt"
+SETUPTOOLS_SETUP_PATH =3D "${S}/pylibfdt"
=20
 do_configure:prepend() {
     oe_runmake -C "${S}" version_gen.h
-    mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
+    mv "${S}/version_gen.h" "${SETUPTOOLS_SETUP_PATH}/"
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1



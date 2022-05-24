Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5CEC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 02:29:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.4870.1653359350709532535
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 19:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I8EscCCH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653359348; i=@fujitsu.com;
	bh=Pk7zQgYvjIuML4gLwDWW3A6rUKjYgdPg8I/A8Cyqpxs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I8EscCCHEFTybb92hqUIzGVmQ8U11c6Y8mlFT/IObDfec3tBlaaccgGXHJILkw16I
	 dLYcs6qzgdVVm0azT80mO24i/+RkZQ5Dhrb0D5LzqHVAJt+rSbeun3hEjwlLi6bqBm
	 NHIofTWCicWxj8xqRqPMSj/9dx4qArSWHLgMB/iIuXvvlR0heVyMM9+P9AohB2BwCK
	 HbRGPSnYLsgFC1OtaSw2uZ9YzWNvBqKWR+BIzFqGiDsABYDr7SSJwSLewE07dPcKBf
	 20MoQLrbJ55nZwLqfYHQMba92YjM6xm4cQ82OBqImMFe8BiUT0m6pwxccAOQRP9u/n
	 NauvCaxb9Rcjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqPvZqSf
  JYPc0NYtFX56xOjB6zDz1iDmAMYo1My8pvyKBNaN1XyNbwVHfiubH19gaGM87djFycQgJPGWU
  mHbnPwuEc5FJYsPtJ1DOXkaJk1c/s3UxcnKwCWhI7J56mRnEFhEwkDh3bj6YzSygJnH05U8gm
  4NDWCBU4tXsXJAwi4CqxIOLl5lAbF4BV4mLS5eD2RICChJTHr5nhogLSpycCbILZIyExMEXL5
  ghapQk3l7awwhhV0i8PnwJKq4mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6hgYG
  uoaGprqGukaG5XmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFCmFDPe3MHY
  2vdT7xCjJAeTkijvxevdSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLPse5KEBItS01Mr0jJzg
  BECk5bg4FES4VVUBkrzFhck5hZnpkOkTjEqSonzPnMESgiAJDJK8+DaYFF5iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5IwbyAwxoV4MvNK4Ka/AlrMBLS4V6ITZHFJIkJKqoGJpfRrNfeHCf8
  ZD5xjmbf55aS/Fh+O7RG5x7Zffr7qtV633Bj2B3Fnpnm1P//VY1steXm93MGmdeYCib+uPTzo
  uNhQeDJ78udM9fpUPmXxhTd81Fx/qJQ/MhL9z8De/sTO8cfMs+HsrY9PnGFhlV3n65J9L37rW
  0tNt+bs/0evVy72jOm9XrJvben560rHWL8f6E6xjGB9u1eh73aB5t3azU1iXl2JZe+r7S/Udd
  68ePvApuyZ1VHvitac7ZBvPG5gKrRbbt/UnD3Ln7uyhh5LFdpyO2vHVnW7yem9N0TZ/8o9/H5
  HXM7t6JKpySm5yetnRHpoux+zKUg//ZqhepNL//uiFXsddx9hcXo6cZKgEktxRqKhFnNRcSIA
  Bduee0UDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-24.tower-585.messagelabs.com!1653359347!220580!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23806 invoked from network); 24 May 2022 02:29:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-24.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 02:29:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E934C100190
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 May 2022 03:29:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CC85E100183
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 May 2022 03:29:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 03:28:44 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization] [PATCH] open-iscsi-user: Upgraded from 2.1.4 to
 2.1.7.
Date: Tue, 24 May 2022 10:28:34 +0800
Message-ID: <1653359314-24039-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 May 2022 02:29:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7317

Changelog:
      Fix issues discovered by gcc12
      Fix more issues discovered by gcc12
      Build: add libsystemd CFLAGS for building objects
      Build: remove redundant definition in utils Makefile
      Build: add RULESDIR to top-level Makefile
      Create an systemd iBFT rule generator
      Build: install systemd generator file with svc files
      Use kernel initiatorname when setting local iname
      utils: remove errant spaces in script
      Check for root in iscsi-gen-initiatorname
      Make fwparam_ibft build more reliable.
      Fix ibft-rule-generator shell error
      ......

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../files/0001-Fix-usr-bin-sed-to-sed.patch        | 53 +++++++++++++++++++
 ...1-Makefile-Fix-build-error-of-cross-build.patch | 25 +++++++++
 ...th-of-systemd-service-from-usr-lib-to-lib.patch | 25 +++++++++
 .../open-iscsi/open-iscsi-user_2.1.4.bb            | 60 ----------------------
 .../open-iscsi/open-iscsi-user_2.1.7.bb            | 45 ++++++++++++++++
 5 files changed, 148 insertions(+), 60 deletions(-)
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
 delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
new file mode 100644
index 0000000..ef11366
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
@@ -0,0 +1,53 @@
+From 569886070a273e914f2662d10b03e1767d488aee Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 18 May 2022 11:32:29 +0900
+Subject: [PATCH] Fix /usr/bin/sed to sed.
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ doc/Makefile   | 2 +-
+ etc/Makefile   | 2 +-
+ utils/Makefile | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/doc/Makefile b/doc/Makefile
+index 9ed025d..e121270 100644
+--- a/doc/Makefile
++++ b/doc/Makefile
+@@ -7,7 +7,7 @@ ifeq ($(TOPDIR),)
+	TOPDIR = ..
+ endif
+
+-SED = /usr/bin/sed
++SED = sed
+ INSTALL = install
+
+ DESTDIR ?=
+diff --git a/etc/Makefile b/etc/Makefile
+index d065319..2d98027 100644
+--- a/etc/Makefile
++++ b/etc/Makefile
+@@ -19,7 +19,7 @@ initddir ?= $(etcdir)/init.d
+
+ HOMEDIR ?= $(etcdir)/iscsi
+
+-SED = /usr/bin/sed
++SED = sed
+ INSTALL = install
+
+ SYSTEMD_SOURCE_FILES	= iscsid.socket iscsiuio.socket
+diff --git a/utils/Makefile b/utils/Makefile
+index a7eb352..15539eb 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -7,7 +7,7 @@
+ # from the top-level make file.
+ #
+
+-SED = /usr/bin/sed
++SED = sed
+ INSTALL = install
+ CHMOD = chmod
+
+--
+2.25.1
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
new file mode 100644
index 0000000..bdb9e45
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
@@ -0,0 +1,25 @@
+From 69fa594af5a09e356319cc0ec2e71809ac964d9b Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 18 May 2022 10:28:53 +0900
+Subject: [PATCH] Makefile: Fix build error of cross build.
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d2f143b..127ba90 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,7 +69,7 @@ user: iscsiuio/Makefile
+	@echo "Read README file for detailed information."
+
+ iscsiuio/Makefile: iscsiuio/configure iscsiuio/Makefile.in
+-	cd iscsiuio; ./configure $(WITHOUT_ARG) --sbindir=$(SBINDIR)
++	cd iscsiuio; ./configure $(WITHOUT_ARG) --sbindir=$(SBINDIR) $(CONFIGURE_ARGS)
+
+ iscsiuio/configure: iscsiuio/configure.ac iscsiuio/Makefile.am
+	cd iscsiuio; autoreconf --install
+--
+2.25.1
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
new file mode 100644
index 0000000..8cea597
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
@@ -0,0 +1,25 @@
+From 280fbda492256d2ef70c6d377e8bd8935e7a4f9c Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 20 May 2022 17:59:03 +0900
+Subject: [PATCH] Modified path of systemd service from /usr/lib to /lib.
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ etc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/Makefile b/etc/Makefile
+index 2d98027..d24fd03 100644
+--- a/etc/Makefile
++++ b/etc/Makefile
+@@ -7,7 +7,7 @@ ifeq ($(TOPDIR),)
+	TOPDIR = ..
+ endif
+
+-prefix = /usr
++prefix =
+ DESTDIR ?=
+ SBINDIR ?= /sbin
+
+--
+2.25.1
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
deleted file mode 100644
index 928290f..0000000
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
-HOMEPAGE = "http://www.open-iscsi.org/"
-LICENSE = "GPL-2.0-only"
-PR = "r1"
-
-inherit systemd autotools pkgconfig
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "kmod openssl util-linux open-isns"
-DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-
-SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
-           file://0001-fix-build-error-of-cross-build.patch \
-           "
-
-SRCREV = "095f59ca464220eae285de6b5f2ee31185a6a84c"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
-
-do_configure () {
-    :
-}
-
-do_compile () {
-        oe_runmake user
-}
-
-do_install () {
-        oe_runmake DESTDIR="${D}" install_user
-        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
-        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
-
-        install -d ${D}${libdir}
-        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
-        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
-}
-
-# systemd support
-PACKAGES =+ "${PN}-systemd"
-RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-systemd += "${PN}"
-FILES:${PN}-systemd +=  "${base_libdir}/systemd                  \
-                         ${sysconfdir}/default/iscsi-initiator   \
-                        "
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE:${PN}-systemd = "iscsi.service \
-                                 iscsiuio.service \
-                                 iscsid.service \
-                                 iscsi-init.service \
-                                 iscsid.socket \
-                                 iscsiuio.socket "
-
-do_install:append () {
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system/
-}
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
new file mode 100644
index 0000000..b4b9ebc
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
+HOMEPAGE = "http://www.open-iscsi.org/"
+LICENSE = "GPL-2.0-only"
+PR = "r1"
+
+inherit autotools systemd pkgconfig
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "kmod openssl util-linux open-isns"
+DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
+           file://0001-Makefile-Fix-build-error-of-cross-build.patch \
+           file://0001-Fix-usr-bin-sed-to-sed.patch \
+           file://0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch \
+           "
+
+SRCREV = "7b53fcc502da8617110fd64d675b476772c28a6f"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+PARALLEL_MAKEINST = ""
+TARGET_CC_ARCH += "${LDFLAGS}"
+EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}' MFLAGS='' LIB_DIR=${libdir}"
+RDEPENDS:${PN} += "bash"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "iscsi.service \
+                         iscsid.socket \
+                         iscsiuio.socket \
+                         iscsid.service \
+                         iscsi-init.service \
+                         iscsiuio.service \
+"
+SYSTEMD_AUTO_ENABLE = "disable"
+FILES:${PN} += " \
+    ${systemd_system_unitdir}/iscsi.service \
+    ${systemd_system_unitdir}/iscsid.socket \
+    ${systemd_system_unitdir}/iscsiuio.socket \
+    ${systemd_system_unitdir}/iscsid.service \
+    ${systemd_system_unitdir}/iscsi-init.service \
+    ${systemd_system_unitdir}/iscsiuio.service \
+    ${systemd_unitdir}/system-generators/ibft-rule-generator \
+"
-- 
1.8.3.1



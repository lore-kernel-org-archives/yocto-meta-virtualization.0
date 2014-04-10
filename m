Return-Path: <zhenhua.luo@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe004.messaging.microsoft.com [207.46.163.27])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9104DE00BF0
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Apr 2014 20:39:38 -0700 (PDT)
Received: from mail165-co9-R.bigfish.com (10.236.132.236) by
	CO9EHSOBE003.bigfish.com (10.236.130.66) with Microsoft SMTP Server id
	14.1.225.22; Thu, 10 Apr 2014 03:39:15 +0000
Received: from mail165-co9 (localhost [127.0.0.1])	by
	mail165-co9-R.bigfish.com (Postfix) with ESMTP id E2F5E4C0078	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 10 Apr 2014 03:39:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail165-co9 (localhost.localdomain [127.0.0.1]) by mail165-co9
	(MessageSwitch) id 1397101152721842_9915;
	Thu, 10 Apr 2014 03:39:12 +0000 (UTC)
Received: from CO9EHSMHS006.bigfish.com (unknown [10.236.132.234])	by
	mail165-co9.bigfish.com (Postfix) with ESMTP id A17F42C005E;
	Thu, 10 Apr 2014 03:39:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS006.bigfish.com
	(10.236.130.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 10 Apr 2014 03:39:12 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.174.2; Thu, 10 Apr 2014 03:39:33 +0000
Received: from fly.ap.freescale.net (fly.ap.freescale.net [10.193.20.113])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s3A3dVbx015581;
	Wed, 9 Apr 2014 20:39:32 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 10 Apr 2014 11:40:40 +0800
Message-ID: <1397101240-26311-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-cloud-services][PATCH] Fix the path of header files check
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 03:39:38 -0000
Content-Type: text/plain

Current Makefile will check headers on host instead of Yocto sysroot, following
error appears. Change the path of header check.
| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
| #include <libaio.h>
|                     ^
| compilation terminated.

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 ...-path-of-header-files-check-in-Yocto-buil.patch | 48 ++++++++++++++++++++++
 meta-openstack/recipes-support/tgt/tgt_git.bb      |  6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch

diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
new file mode 100644
index 0000000..6106b90
--- /dev/null
+++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
@@ -0,0 +1,48 @@
+From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Thu, 10 Apr 2014 11:26:39 +0800
+Subject: [PATCH] Correct the path of header files check in Yocto build env
+
+Upstream-Status: Inappropriate [the fix is specific to Yocto build env]
+
+Current Makefile will check headers on host instead of Yocto sysroot, following
+error appears. Change the path of header check.
+| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
+| #include <libaio.h>
+|                     ^
+| compilation terminated.
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+---
+ usr/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index 453eb1a..191503d 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -1,10 +1,10 @@
+ sbindir ?= $(PREFIX)/sbin
+ 
+-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
+ CFLAGS += -DUSE_SIGNALFD
+ endif
+ 
+-ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo 1),)
+ CFLAGS += -DUSE_TIMERFD
+ endif
+ 
+@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o
+ LIBS += -lrados -lrbd
+ endif
+ 
+-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test -e $(SYSROOT)/usr/include/libaio.h && echo 1),)
+ CFLAGS += -DUSE_EVENTFD
+ TGTD_OBJS += bs_aio.o
+ LIBS += -laio
+-- 
+1.9.1
+
diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index db4f56b..8be9fe4 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -8,7 +8,9 @@ SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
 PV = "1.0.36+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://github.com/fujita/tgt.git"
+SRC_URI = "git://github.com/fujita/tgt.git \
+	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
+"
 SRC_URI += "file://tgtd.init"
 
 S = "${WORKDIR}/git"
@@ -16,7 +18,7 @@ S = "${WORKDIR}/git"
 inherit update-rc.d
 
 do_compile() {
-    oe_runmake -e programs conf scripts
+    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
 }
 
 do_install() {
-- 
1.9.1




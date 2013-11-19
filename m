Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D79FBE004DD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 09:20:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJHKdPc024885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 09:20:39 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 09:20:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Nov 2013 12:20:45 -0500
Message-ID: <1384881645-30221-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] openvswitch: deal with missing RDEPENDS of libpcap
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
X-List-Received-Date: Tue, 19 Nov 2013 17:20:42 -0000
Content-Type: text/plain

Bitbake was properly detecting a dependency on libpcap but since it
was not an explicit RDEPENDS the libpcap package was not being built
in all cases which had the potential to break rootfs image building.

The obvious solution was to add libpcap to the RDEPENDS but looking
upstream it was found that they have removed the use of this library
for all but FreeBSD since for other systems it is unused. So using the
upstream patch here eliminates the dependency and in turn the issue
described above.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...gure-Only-link-against-libpcap-on-FreeBSD.patch | 70 ++++++++++++++++++++++
 .../openvswitch/openvswitch_1.10.0.bb              |  3 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch

diff --git a/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch b/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
new file mode 100644
index 0000000..0a44b85
--- /dev/null
+++ b/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
@@ -0,0 +1,70 @@
+From d30e714ccb9d13caf39d14d5b2fc9523b678ed51 Mon Sep 17 00:00:00 2001
+From: Ben Pfaff <blp@nicira.com>
+Date: Thu, 14 Mar 2013 15:20:55 -0700
+Subject: [PATCH] configure: Only link against libpcap on FreeBSD.
+
+commit d30e714ccb9d13caf39d14d5b2fc9523b678ed51 upstream
+http://git.openvswitch.org/git/openvswitch
+
+On other platforms there is no benefit to linking against libpcap, because
+it is not used.
+
+Signed-off-by: Ben Pfaff <blp@nicira.com>
+CC: Ed Maste <emaste@freebsd.org>
+---
+ acinclude.m4 | 7 ++++++-
+ configure.ac | 3 +--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index f0610c9..19a47dd 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1,6 +1,6 @@
+ # -*- autoconf -*-
+ 
+-# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
++# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+@@ -295,6 +295,8 @@ AC_DEFUN([OVS_CHECK_IF_PACKET],
+    fi])
+ 
+ dnl Checks for net/if_dl.h.
++dnl
++dnl (We use this as a proxy for checking whether we're building on FreeBSD.)
+ AC_DEFUN([OVS_CHECK_IF_DL],
+   [AC_CHECK_HEADER([net/if_dl.h],
+                    [HAVE_IF_DL=yes],
+@@ -303,6 +305,9 @@ AC_DEFUN([OVS_CHECK_IF_DL],
+    if test "$HAVE_IF_DL" = yes; then
+       AC_DEFINE([HAVE_IF_DL], [1],
+                 [Define to 1 if net/if_dl.h is available.])
++
++      # On FreeBSD we use libpcap to access network devices.
++      AC_SEARCH_LIBS([pcap_open_live], [pcap])
+    fi])
+ 
+ dnl Checks for buggy strtok_r.
+diff --git a/configure.ac b/configure.ac
+index 1cacd29..bd49179 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,4 +1,4 @@
+-# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
++# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+@@ -44,7 +44,6 @@ AC_SYS_LARGEFILE
+ AC_SEARCH_LIBS([pow], [m])
+ AC_SEARCH_LIBS([clock_gettime], [rt])
+ AC_SEARCH_LIBS([timer_create], [rt])
+-AC_SEARCH_LIBS([pcap_open_live], [pcap])
+ 
+ OVS_CHECK_ESX
+ OVS_CHECK_COVERAGE
+-- 
+1.8.3.2
+
diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 02c8ab3..c0ea829 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -18,7 +18,7 @@ RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 # rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
 # queued for install later.
 RDEPENDS_${PN} += "sed gawk grep"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch \
@@ -27,6 +27,7 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-controller-setup \
 	file://openvswitch-add-target-python-handling.patch \
 	file://openvswitch-add-target-perl-handling.patch \
+	file://configure-Only-link-against-libpcap-on-FreeBSD.patch \
 	"
 
 SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
-- 
1.8.3.2



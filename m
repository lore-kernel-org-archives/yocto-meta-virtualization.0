Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8ABC1E00944; Wed, 12 Jul 2017 14:02:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52C8BE008FF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jul 2017 14:02:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6CL2mbn029278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jul 2017 14:02:49 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 14:02:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 12 Jul 2017 17:02:41 -0400
Message-ID: <1499893362-8251-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] openvswitch: uprev to v2.7.1
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
X-List-Received-Date: Wed, 12 Jul 2017 21:02:54 -0000
Content-Type: text/plain

Released at the end of June 2017 this is a bugfix release with no
major functional changes. Surprisingly the patch for CVE-2017-9263 is
still not applied upstream so we continue to carry this change.

The remaining patches were audited and cleaned up as needed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...gure-Only-link-against-libpcap-on-FreeBSD.patch | 70 ----------------------
 ...b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch} |  0
 recipes-networking/openvswitch/openvswitch_git.bb  |  4 +-
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
 rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch => openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch} (100%)

diff --git a/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch b/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
deleted file mode 100644
index 0a44b85..0000000
--- a/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d30e714ccb9d13caf39d14d5b2fc9523b678ed51 Mon Sep 17 00:00:00 2001
-From: Ben Pfaff <blp@nicira.com>
-Date: Thu, 14 Mar 2013 15:20:55 -0700
-Subject: [PATCH] configure: Only link against libpcap on FreeBSD.
-
-commit d30e714ccb9d13caf39d14d5b2fc9523b678ed51 upstream
-http://git.openvswitch.org/git/openvswitch
-
-On other platforms there is no benefit to linking against libpcap, because
-it is not used.
-
-Signed-off-by: Ben Pfaff <blp@nicira.com>
-CC: Ed Maste <emaste@freebsd.org>
----
- acinclude.m4 | 7 ++++++-
- configure.ac | 3 +--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index f0610c9..19a47dd 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -1,6 +1,6 @@
- # -*- autoconf -*-
- 
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
- # you may not use this file except in compliance with the License.
-@@ -295,6 +295,8 @@ AC_DEFUN([OVS_CHECK_IF_PACKET],
-    fi])
- 
- dnl Checks for net/if_dl.h.
-+dnl
-+dnl (We use this as a proxy for checking whether we're building on FreeBSD.)
- AC_DEFUN([OVS_CHECK_IF_DL],
-   [AC_CHECK_HEADER([net/if_dl.h],
-                    [HAVE_IF_DL=yes],
-@@ -303,6 +305,9 @@ AC_DEFUN([OVS_CHECK_IF_DL],
-    if test "$HAVE_IF_DL" = yes; then
-       AC_DEFINE([HAVE_IF_DL], [1],
-                 [Define to 1 if net/if_dl.h is available.])
-+
-+      # On FreeBSD we use libpcap to access network devices.
-+      AC_SEARCH_LIBS([pcap_open_live], [pcap])
-    fi])
- 
- dnl Checks for buggy strtok_r.
-diff --git a/configure.ac b/configure.ac
-index 1cacd29..bd49179 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,4 +1,4 @@
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
- # you may not use this file except in compliance with the License.
-@@ -44,7 +44,6 @@ AC_SYS_LARGEFILE
- AC_SEARCH_LIBS([pow], [m])
- AC_SEARCH_LIBS([clock_gettime], [rt])
- AC_SEARCH_LIBS([timer_create], [rt])
--AC_SEARCH_LIBS([pcap_open_live], [pcap])
- 
- OVS_CHECK_ESX
- OVS_CHECK_COVERAGE
--- 
-1.8.3.2
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
similarity index 100%
rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index a2893e9..3972607 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.7.0+${SRCREV}"
+PV = "2.7.1+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1"
+SRCREV = "b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
-- 
2.7.4



Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3B7DE00E01; Thu, 29 Aug 2019 23:18:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8C56E00E01
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 23:18:07 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U6HlKr001896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 23:17:57 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 23:17:36 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 14:17:33 +0800
Message-ID: <1567145853-76109-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
References: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] diod: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 06:18:11 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/diod/diod_1.0.24.bb               |  3 ++
 ...0001-drod-add-option-to-config-systemddir.patch | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
index bb5707e..a4a8528 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -16,9 +16,12 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
            file://0001-build-allow-builds-to-work-with-separate-build-dir.patch \
            file://0002-auto.diod.in-remove-bashisms.patch \
            file://0001-diod-ops.c-add-header-file-for-makedev.patch \
+           file://0001-drod-add-option-to-config-systemddir.patch \
           "
 DEPENDS = "libcap ncurses tcp-wrappers lua"
 
+EXTRA_OECONF = "--with-systemddir=${systemd_unitdir}/system"
+
 S = "${WORKDIR}/git"
 
 inherit autotools systemd
diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch
new file mode 100644
index 0000000..8b70d8f
--- /dev/null
+++ b/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch
@@ -0,0 +1,51 @@
+From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 26 Aug 2019 18:00:39 +0800
+Subject: [PATCH] drod: add option to config systemddir
+
+Upstream-Status: Pending
+
+Not need to send upstream, since upstream have refactor
+related code, but not released. and this version release 
+4 years ago, not proper to just backport one or more
+commits, this patch maybe could be dropped after upgrade.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac        | 9 +++++++++
+ scripts/Makefile.am | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1cb8579..3e4a5ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
+           [Define _GNU_SOURCE so that we get all necessary prototypes])
+ 
+ ##
++#Add option to config systemddir
++##
++AC_ARG_WITH([systemddir],
++  [AS_HELP_STRING([--with-systemddir=DIR], [systemd dir])],
++  [systemddir=$withval],
++  [systemddir="/lib/systemd/system"])
++AC_SUBST([systemddir], [$systemddir])
++
++##
+ # Checks for programs
+ ##
+ AC_PROG_CC
+diff --git a/scripts/Makefile.am b/scripts/Makefile.am
+index 2aba728..40822b7 100644
+--- a/scripts/Makefile.am
++++ b/scripts/Makefile.am
+@@ -1,4 +1,4 @@
+-systemddir=/lib/systemd/system
++systemddir=@systemddir@
+ 
+ install-data-local:
+ 	$(top_srcdir)/config/install-sh -m 755 ./auto.diod \
+-- 
+2.7.4
+
-- 
2.7.4



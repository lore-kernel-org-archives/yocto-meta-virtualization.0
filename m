Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4306E00A7B; Wed, 29 Jul 2015 03:05:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1AEBE00A4C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 03:05:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027772"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 18:08:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6TA3VbL017089
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 18:03:31 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 18:05:22 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Jul 2015 18:05:14 +0800
Message-ID: <1438164314-3363-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438164314-3363-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438164314-3363-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 2/2] tgt: upgrade 1.0.36 -> 1.0.60
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
X-List-Received-Date: Wed, 29 Jul 2015 10:05:24 -0000
Content-Type: text/plain

Add 0001-usr-Makefile-WARNING-fix.patch to avoid build WARNING.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  | 31 ++++++++++++++++++++++
 meta-openstack/recipes-support/tgt/tgt_git.bb      |  5 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch

diff --git a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
new file mode 100644
index 0000000..15f5482
--- /dev/null
+++ b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
@@ -0,0 +1,31 @@
+From 2a336ec5bf939d86425570617471df60140d839e Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sun, 26 Jul 2015 04:23:51 +0900
+Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
+ /work/i586-oe-linux/tgt/1.0.60+gitAUTOINC+ab51727a36-r0/
+ packages-split/tgt/usr/sbin/tgtd contains probably-redundant RPATH /usr/lib
+ [useless-rpaths]
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ usr/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index 1fae7e7..2db109c 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -63,7 +63,7 @@ TGTD_OBJS += tgtd.o mgmt.o target.o scsi.o log.o driver.o util.o work.o \
+ 
+ TGTD_DEP = $(TGTD_OBJS:.o=.d)
+ 
+-LDFLAGS = -Wl,-E,-rpath=$(libdir)
++LDFLAGS = -Wl,-E
+ 
+ .PHONY:all
+ all: $(PROGRAMS) $(MODULES)
+-- 
+1.8.4.2
+
diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index fe34858..a5df710 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -4,12 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils"
 
-SRCREV = "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
-PV = "1.0.37+git${SRCPV}"
+SRCREV = "ab51727a361bf296b1c2036375b5e45479059921"
+PV = "1.0.60+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://github.com/fujita/tgt.git \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
+        file://0001-usr-Makefile-WARNING-fix.patch \
 "
 SRC_URI += "file://tgtd.init"
 
-- 
1.8.4.2



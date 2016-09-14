Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A990E009C9; Tue, 13 Sep 2016 22:34:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACA29E009BB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Sep 2016 22:34:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10963559"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 13:34:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B28F4623465
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 13:34:20 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 13:34:19 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Sep 2016 01:34:17 -0400
Message-ID: <1473831257-3711-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 8B28F4623465.A5267
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
Subject: ][PATCH] tgt: 1.0.63 -> 1.0.67
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
X-List-Received-Date: Wed, 14 Sep 2016 05:34:25 -0000
Content-Type: text/plain

1) Upgrade tgt from 1.0.63 to 1.0.67.
2) Modify one patch, since the data has been changed.
    0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 ...rrect-the-path-of-header-files-check-in-Yocto-buil.patch | 13 +++++++------
 meta-openstack/recipes-support/tgt/tgt_git.bb               |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
index 6106b90..b371378 100644
--- a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
+++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
@@ -21,21 +21,22 @@ diff --git a/usr/Makefile b/usr/Makefile
 index 453eb1a..191503d 100644
 --- a/usr/Makefile
 +++ b/usr/Makefile
-@@ -1,10 +1,10 @@
+@@ -1,11 +1,11 @@
  sbindir ?= $(PREFIX)/sbin
- 
+ libdir ?= $(PREFIX)/lib/tgt
+
 -ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
 +ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
  CFLAGS += -DUSE_SIGNALFD
  endif
  
--ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
-+ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo 1),)
+-ifneq ($(shell test -n $(shell find /usr/include -name "timerfd.h" | head -n1) && echo 1),)
++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name "timerfd.h" | head -n1) && echo 1),)
  CFLAGS += -DUSE_TIMERFD
  endif
  
-@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o
- LIBS += -lrados -lrbd
+@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
+ CFLAGS += -DUSE_TIMERFD
  endif
  
 -ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index ac240f0..0fc70fd 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils"
 
-SRCREV = "eca74a72d2595f126a020111943928c3ea9e6fe8"
-PV = "1.0.63+git${SRCPV}"
+SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
+PV = "1.0.67+git${SRCPV}"
 
-SRC_URI = "git://github.com/fujita/tgt.git \
+SRC_URI = "git://github.com/fujita/tgt.git;protocol=https;\
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
         file://0001-usr-Makefile-WARNING-fix.patch \
 "
-- 
2.7.4





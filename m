Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0BEEE00AB9; Mon, 24 Apr 2017 13:31:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD658E00867
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 13:31:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3OKVVVb010465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Apr 2017 13:31:32 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 13:31:31 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 24 Apr 2017 16:31:28 -0400
Message-ID: <1493065890-16039-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/3] crui: update selinux patch to apply to v2.5
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
X-List-Received-Date: Mon, 24 Apr 2017 20:31:40 -0000
Content-Type: text/plain

I am not sure how the uprev to v2.5 was completed without seeing this
patch failure but regardless the file being patched was moved to the
'criu' directory as part of the v2.5 release. Update the path found in
the patch and update the context in the patch such that it applies.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../criu/files/disable-selinux.patch               | 35 +++++++++++++++-------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/recipes-containers/criu/files/disable-selinux.patch b/recipes-containers/criu/files/disable-selinux.patch
index da881dd..5d5d035 100644
--- a/recipes-containers/criu/files/disable-selinux.patch
+++ b/recipes-containers/criu/files/disable-selinux.patch
@@ -1,3 +1,8 @@
+From bd2eeaddfc1f12f87184d870cc9a1adde1cf0b10 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 24 Apr 2017 13:08:48 -0400
+Subject: [PATCH] criu/Makefile.config: explicitly remove selinux support
+
 Upstream-Status: Inappropriate [disable feature]
 
 It shows warning when build crius if libselinux has been built already:
@@ -7,20 +12,28 @@ It shows warning when build crius if libselinux has been built already:
 Apply this patch to disable selinux support when 'selinux' is not in PACKAGECONF.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+[MA: Context updated to apply against criu v2.5]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ criu/Makefile.config | 5 -----
+ 1 file changed, 5 deletions(-)
 
-diff --git a/Makefile.config b/Makefile.config
-index ce4b8d8..3ac2780 100644
---- a/Makefile.config
-+++ b/Makefile.config
-@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)
- 	DEFINES += -DCONFIG_HAS_LIBBSD
+diff --git a/criu/Makefile.config b/criu/Makefile.config
+index f531b3b..37216f8 100644
+--- a/criu/Makefile.config
++++ b/criu/Makefile.config
+@@ -7,11 +7,6 @@ ifeq ($(call try-cc,$(FEATURE_TEST_LIBBSD_DEV),-lbsd),true)
+         FEATURE_DEFINES	+= -DCONFIG_HAS_LIBBSD
  endif
  
 -ifeq ($(call pkg-config-check,libselinux),y)
--	LIBS := -lselinux $(LIBS)
--	DEFINES += -DCONFIG_HAS_SELINUX
+-        LIBS		+= -lselinux
+-        FEATURE_DEFINES	+= -DCONFIG_HAS_SELINUX
 -endif
 -
- $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak include/config-base.h
- 	$(E) "  GEN     " $@
- 	$(Q) @echo '#ifndef __CR_CONFIG_H__' > $@
+ export DEFINES += $(FEATURE_DEFINES)
+ export CFLAGS += $(FEATURE_DEFINES)
+ 
+-- 
+2.7.4
+
-- 
2.7.4



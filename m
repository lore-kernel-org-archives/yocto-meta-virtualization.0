Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02827C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:54:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.6392.1652237643003208401
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 May 2022 19:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eBhT9tQg;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237643; x=1683773643;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AUocyqorrKf5vqiESYlctnWY7jV35NpXXFrigf5Omuc=;
  b=eBhT9tQgd0R7asSylBhHMJxPlM2CgBTiybcUvqTdxxdgzCcNTK5YwcRC
   hgwfS2jo3QP20oFrt9iWTEYYPMq+rk0UtcfubzPlXOoHcjjjuHseV97oK
   6QhDrVirD/mlpRSHXgyhQStHV5VztIKSx/PpmDrlib/4QvB60yhG+r+X8
   n4mbROIIHfj3fLDVvgBFXGcyuLW/ZHfIzW/ri3uqBWutros8dKeRaB7c2
   0P9Xl6svowIWHHlu/fUTLNLAUO/dT7N1utKaxljputU7c8nQO4v35Ki9S
   dEpJxoH/0IFjguubir98cG6Sbe4FikSLe2+e1UqpAi7M3+DLUy8Mc31Wm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269232634"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="269232634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:54:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="739009833"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:54:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [honister][PATCH] dev86: fix a build race
Date: Wed, 11 May 2022 10:53:55 +0800
Message-Id: <20220511025355.324356-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 May 2022 02:54:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7275

From: Ross Burton <ross.burton@arm.com>

Fix a race in cpp/ where token[12].h are written to a temporary file
with the same name.

Also update the status of cross.patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 36433bfef3b690ee1211f04a38022b1f3dc2b383)
---
 ...1-cpp-fix-race-writing-token.h-files.patch | 42 +++++++++++++++++++
 recipes-extended/dev86/dev86/cross.patch      |  2 +-
 recipes-extended/dev86/dev86_git.bb           |  3 +-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch

diff --git a/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
new file mode 100644
index 0000000..d6e7999
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/23]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f507ee398ae20e4e97f01dfbd9a8709a90bc760f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 29 Apr 2022 16:44:08 +0100
+Subject: [PATCH] cpp: fix race writing token.h files
+
+The rules for token1.h and token2.h both write to a temporary file tmp.h
+before renaming to token1.h or token2.h. However, in a parallel build
+these will execute at the same time and race.
+
+  gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
+  gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
+  mv tmp.h token1.h
+  mv tmp.h token2.h
+  mv: cannot stat 'tmp.h': No such file or directory
+
+By using gperf --output-file, the race is avoided entirely.
+---
+ cpp/Makefile | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cpp/Makefile b/cpp/Makefile
+index 0ea43cc..743694f 100644
+--- a/cpp/Makefile
++++ b/cpp/Makefile
+@@ -20,9 +20,7 @@ token1.o: token1.h
+ token2.o: token2.h
+ 
+ token1.h: token1.tok
+-	gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
+-	mv tmp.h token1.h
++	gperf -aptTc -N is_ctok -H hash1 --output-file $@ $<
+ 
+ token2.h: token2.tok
+-	gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
+-	mv tmp.h token2.h
++	gperf -aptTc -k1,3 -N is_ckey -H hash2 --output-file $@ $<
+-- 
+2.25.1
+
diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/dev86/dev86/cross.patch
index 041a8d3..fd62c5d 100644
--- a/recipes-extended/dev86/dev86/cross.patch
+++ b/recipes-extended/dev86/dev86/cross.patch
@@ -1,6 +1,6 @@
 Build ifdef using BUILD_CC, not CC.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/22]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 diff --git a/Makefile b/Makefile
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index 88e9cf3..094fcbd 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -11,7 +11,8 @@ SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https;branch=master \
     file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
     file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch \
     file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
-	file://cross.patch \
+    file://cross.patch \
+    file://0001-cpp-fix-race-writing-token.h-files.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.3



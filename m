Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76E3C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:56:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11849.1651247763267083911
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 08:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8A501063;
	Fri, 29 Apr 2022 08:56:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4703B3F774;
	Fri, 29 Apr 2022 08:56:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] dev86: fix a build race
Date: Fri, 29 Apr 2022 16:55:58 +0100
Message-Id: <20220429155558.177801-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 15:56:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7237

Fix a race in cpp/ where token[12].h are written to a temporary file
with the same name.

Also update the status of cross.patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-cpp-fix-race-writing-token.h-files.patch | 42 +++++++++++++++++++
 recipes-extended/dev86/dev86/cross.patch      |  2 +-
 recipes-extended/dev86/dev86_git.bb           |  3 +-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/dev86/dev86/0001-cpp-fix-race-writin=
g-token.h-files.patch

diff --git a/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token=
.h-files.patch b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-t=
oken.h-files.patch
new file mode 100644
index 0000000..d6e7999
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-file=
s.patch
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
+=20
+ token1.h: token1.tok
+-	gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
+-	mv tmp.h token1.h
++	gperf -aptTc -N is_ctok -H hash1 --output-file $@ $<
+=20
+ token2.h: token2.tok
+-	gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
+-	mv tmp.h token2.h
++	gperf -aptTc -k1,3 -N is_ckey -H hash2 --output-file $@ $<
+--=20
+2.25.1
+
diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/=
dev86/dev86/cross.patch
index 041a8d3..fd62c5d 100644
--- a/recipes-extended/dev86/dev86/cross.patch
+++ b/recipes-extended/dev86/dev86/cross.patch
@@ -1,6 +1,6 @@
 Build ifdef using BUILD_CC, not CC.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/22]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/Makefile b/Makefile
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86=
/dev86_git.bb
index 4b5a265..82f43a0 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -11,7 +11,8 @@ SRC_URI =3D "git://github.com/jbruchon/${BPN}.git;proto=
col=3Dhttps;branch=3Dmaster \
     file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch=
 \
     file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..pat=
ch \
     file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
-	file://cross.patch \
+    file://cross.patch \
+    file://0001-cpp-fix-race-writing-token.h-files.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1



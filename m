Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05F10E00BAA; Thu, 12 Apr 2018 19:50:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6370E00BF7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 19:50:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3D2oIRb010226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 19:50:18 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 12 Apr 2018 19:50:16 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Fri, 13 Apr 2018 10:50:09 +0800
Message-ID: <1523587809-7323-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523587809-7323-1-git-send-email-yi.zhao@windriver.com>
References: <1523587809-7323-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 2/2] criu: refresh patches to fix QA warning
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
X-List-Received-Date: Fri, 13 Apr 2018 02:50:21 -0000
Content-Type: text/plain

Refresh patches with devtool command to fix do_patch warning.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-criu-Change-libraries-install-directory.patch     |  8 +++-----
 .../criu/files/0001-criu-Fix-toolchain-hardcode.patch      |  6 ++----
 .../criu/files/0002-criu-Skip-documentation-install.patch  | 14 ++++++--------
 .../files/fix-building-on-newest-glibc-and-kernel.patch    |  8 +++-----
 ...-Makefile-overwrite-install-lib-to-allow-multiarc.patch |  6 ++----
 5 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
index 4908e47..afb1332 100644
--- a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
+++ b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
@@ -1,4 +1,4 @@
-From 78390305829316633acee2ca5607331b0e37a104 Mon Sep 17 00:00:00 2001
+From f64fbca70e6049dad3c404d871f2383d97725d2d Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 8 Sep 2017 15:11:31 -0400
 Subject: [PATCH] criu: Change libraries install directory
@@ -7,12 +7,13 @@ Install the libraries into /usr/lib(or /usr/lib64)
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
  Makefile.install | 13 -------------
  1 file changed, 13 deletions(-)
 
 diff --git a/Makefile.install b/Makefile.install
-index 3987bcc..73d98a4 100644
+index 1def3cf..d020eef 100644
 --- a/Makefile.install
 +++ b/Makefile.install
 @@ -9,19 +9,6 @@ LIBEXECDIR	?= $(PREFIX)/libexec
@@ -35,6 +36,3 @@ index 3987bcc..73d98a4 100644
  # LIBDIR falls back to the standard path.
  LIBDIR ?= $(PREFIX)/lib
  
--- 
-2.7.4
-
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index dc5b897..d1f136c 100644
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -1,4 +1,4 @@
-From af679853a45fe63f680c99e70416c8ac620d23b8 Mon Sep 17 00:00:00 2001
+From c005b7a4874f55df687ff22bc425551775581421 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 8 Sep 2017 15:02:14 -0400
 Subject: [PATCH] criu: Fix toolchain hardcode
@@ -9,6 +9,7 @@ be taken.
 Signed-off-by: Yang Shi <yang.shi@windriver.com>
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
  Makefile                       |  2 +-
  scripts/nmk/scripts/include.mk |  2 +-
@@ -96,6 +97,3 @@ index 56dba84..1698821 100644
  
  export RM HOSTLD LD HOSTCC CC CPP AS AR STRIP OBJCOPY OBJDUMP
  export NM SH MAKE MKDIR AWK PERL PYTHON SH CSCOPE
--- 
-2.7.4
-
diff --git a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch b/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
index ba414d9..af45db7 100644
--- a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
+++ b/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
@@ -1,21 +1,22 @@
-From 07d9b3d0c372e45127dd51781d9564e8bee90dbe Mon Sep 17 00:00:00 2001
+From 45d74ae8a314c481398ba91a3697ffbd074cd98b Mon Sep 17 00:00:00 2001
 From: Jianchuan Wang <jianchuan.wang@windriver.com>
 Date: Tue, 16 Aug 2016 09:42:24 +0800
-Subject: [PATCH 2/2] criu: Skip documentation install
+Subject: [PATCH] criu: Skip documentation install
 
 asciidoc is needed to generate CRIU documentation, so skip it in install.
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+
 ---
  Makefile.install | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.install b/Makefile.install
-index a30dc96..33143fb 100644
+index 3987bcc..1def3cf 100644
 --- a/Makefile.install
 +++ b/Makefile.install
-@@ -22,7 +22,7 @@ install-tree:
- .PHONY: install-tree
+@@ -29,7 +29,7 @@ export PREFIX BINDIR SBINDIR MANDIR RUNDIR
+ export LIBDIR INCLUDEDIR LIBEXECDIR
  
  install-man:
 -	$(Q) $(MAKE) -C Documentation install
@@ -23,6 +24,3 @@ index a30dc96..33143fb 100644
  .PHONY: install-man
  
  install-lib: lib
--- 
-2.7.4
-
diff --git a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
index d6341da..9361adc 100644
--- a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
+++ b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
@@ -1,4 +1,4 @@
-From f41e386d4d40e3e26b0cfdc85a812b7edb337f1d Mon Sep 17 00:00:00 2001
+From b59947007362b53e9f41f1e5a33071dedf1c59ac Mon Sep 17 00:00:00 2001
 From: Adrian Reber <areber@redhat.com>
 Date: Thu, 28 Sep 2017 09:13:33 +0000
 Subject: [PATCH] fix building on newest glibc and kernel
@@ -24,12 +24,13 @@ Upstream-Status: Backport
 [https://github.com/checkpoint-restore/criu/commit/f41e386d4d40e3e26b0cfdc85a812b7edb337f1d#diff-cc847b1cc975358c6582595be92d48db]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  criu/cr-check.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/criu/cr-check.c b/criu/cr-check.c
-index 5dd448b..8986ec4 100644
+index 1dd887a..93df2ab 100644
 --- a/criu/cr-check.c
 +++ b/criu/cr-check.c
 @@ -21,8 +21,8 @@
@@ -42,6 +43,3 @@ index 5dd448b..8986ec4 100644
  
  #include "../soccr/soccr.h"
  
--- 
-2.7.4
-
diff --git a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
index c2512a0..59e7bcb 100644
--- a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
+++ b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
@@ -1,4 +1,4 @@
-From 89f9b87904bd312b817ffaa7d83abfd5e84d723d Mon Sep 17 00:00:00 2001
+From 6caf90592d61c8c45b32cb7ff76709f9326030e2 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 8 Sep 2017 15:40:49 -0400
 Subject: [PATCH] lib/Makefile: overwrite install-lib, to allow multiarch
@@ -8,6 +8,7 @@ I am not sure why Yocto installs python modules in arch specific
 INSTALL_LIB.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
  lib/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -25,6 +26,3 @@ index b1bb057..06f5c5d 100644
  .PHONY: install
  
  uninstall:
--- 
-2.7.4
-
-- 
2.7.4



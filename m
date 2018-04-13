Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56D65E00BAA; Thu, 12 Apr 2018 19:50:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6270E008A2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 19:50:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3D2oD2K004800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 19:50:13 -0700
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 12 Apr 2018 19:50:12 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Fri, 13 Apr 2018 10:50:08 +0800
Message-ID: <1523587809-7323-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 1/2] criu: fix build failure with newer glibc and kernel
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
X-List-Received-Date: Fri, 13 Apr 2018 02:50:16 -0000
Content-Type: text/plain

With newer glibc(>= 2.26) and kernel(>=4.14), criu would fail to build:

In file included from
/buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/recipe-sysroot/usr/include/linux/aio_abi.h:31:0,
        from criu/cr-check.c:24:
/buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/recipe-sysroot/usr/include/sys/mount.h:35:3:
error: expected identifier before numeric constant
   MS_RDONLY = 1,  /* Mount read-only.  */
   ^
  CC       criu/parasite-syscall.o
  CC       criu/pipes.o
  CC       criu/pie-util.o
  CC       criu/pie-util-vdso.o
  CC       criu/plugin.o
/buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/git/scripts/nmk/scripts/build.mk:110:
recipe for target 'criu/cr-check.o' failed
make[2]: *** [criu/cr-check.o] Error 1

Backport a patch to fix it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  1 +
 .../fix-building-on-newest-glibc-and-kernel.patch  | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 083609f..7d62f35 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
+           file://fix-building-on-newest-glibc-and-kernel.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
diff --git a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
new file mode 100644
index 0000000..d6341da
--- /dev/null
+++ b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
@@ -0,0 +1,47 @@
+From f41e386d4d40e3e26b0cfdc85a812b7edb337f1d Mon Sep 17 00:00:00 2001
+From: Adrian Reber <areber@redhat.com>
+Date: Thu, 28 Sep 2017 09:13:33 +0000
+Subject: [PATCH] fix building on newest glibc and kernel
+
+On Fedora rawhide with kernel-headers-4.14.0-0.rc2.git0.1.fc28.x86_64
+glibc-devel-2.26.90-15.fc28.x86_64 criu does not build any more:
+
+In file included from /usr/include/linux/aio_abi.h:31:0,
+                 from criu/cr-check.c:24:
+/usr/include/sys/mount.h:35:3: error: expected identifier before numeric constant
+   MS_RDONLY = 1,  /* Mount read-only.  */
+   ^
+make[2]: *** [/builddir/build/BUILD/criu-3.5/scripts/nmk/scripts/build.mk:111: criu/cr-check.o] Error 1
+make[1]: *** [criu/Makefile:73: criu/built-in.o] Error 2
+make: *** [Makefile:233: criu] Error 2
+
+This simple re-ordering of includes fixes it for me.
+
+Signed-off-by: Adrian Reber <areber@redhat.com>
+Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
+
+Upstream-Status: Backport
+[https://github.com/checkpoint-restore/criu/commit/f41e386d4d40e3e26b0cfdc85a812b7edb337f1d#diff-cc847b1cc975358c6582595be92d48db]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ criu/cr-check.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/criu/cr-check.c b/criu/cr-check.c
+index 5dd448b..8986ec4 100644
+--- a/criu/cr-check.c
++++ b/criu/cr-check.c
+@@ -21,8 +21,8 @@
+ #include <netinet/in.h>
+ #include <sys/prctl.h>
+ #include <sched.h>
+-#include <linux/aio_abi.h>
+ #include <sys/mount.h>
++#include <linux/aio_abi.h>
+ 
+ #include "../soccr/soccr.h"
+ 
+-- 
+2.7.4
+
-- 
2.7.4



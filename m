Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C717E009B3; Mon, 17 Aug 2015 18:52:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2CA8E00816
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Aug 2015 18:52:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99739581"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2015 09:55:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7I1qBkg008258
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 09:52:12 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 18 Aug 2015 09:52:14 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Aug 2015 09:52:29 +0800
Message-ID: <1439862749-11235-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [m-c-s][PATCH] open-iscsi-user: upgrade 2.0-871->2.0-873
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
X-List-Received-Date: Tue, 18 Aug 2015 01:52:23 -0000
Content-Type: text/plain

-deleted patch not used any more
-add new patch for new version

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../0001-fix-build-error-of-cross-build.patch      | 30 ++++++++++++++++++++++
 .../open-iscsi/files/user.patch                    | 11 --------
 ...-user_2.0-871.bb => open-iscsi-user_2.0-873.bb} |  8 +++---
 3 files changed, 34 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
 delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
 rename meta-openstack/recipes-connectivity/open-iscsi/{open-iscsi-user_2.0-871.bb => open-iscsi-user_2.0-873.bb} (87%)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
new file mode 100644
index 0000000..206da48
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
@@ -0,0 +1,30 @@
+From 943a321104a5b2c4ac25bdb2ae81b5b208e3973c Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Tue, 18 Aug 2015 10:29:35 +0900
+Subject: [PATCH] fix build error of cross build
+
+The error likes as following
+| configure: error: cannot run C compiled programs.
+| If you meant to cross compile, use `--host'.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c5d9700..1f31e43 100644
+--- a/Makefile
++++ b/Makefile
+@@ -42,7 +42,7 @@ user: utils/open-isns/Makefile
+ 	@echo "Read README file for detailed information."
+ 
+ utils/open-isns/Makefile: utils/open-isns/configure utils/open-isns/Makefile.in
+-	cd utils/open-isns; ./configure CFLAGS="$(OPTFLAGS)" --with-security=no
++	cd utils/open-isns; ./configure CFLAGS="$(OPTFLAGS)" --with-security=no ${CONFIGURE_ARGS}
+ 
+ kernel: force
+ 	$(MAKE) -C kernel
+-- 
+1.8.4.2
+
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
deleted file mode 100644
index 767c508..0000000
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -Nurd a/usr/iscsi_sysfs.c b/usr/iscsi_sysfs.c
---- a/usr/iscsi_sysfs.c	2012-08-06 12:32:21.098233792 +0200
-+++ b/usr/iscsi_sysfs.c	2012-08-06 12:33:09.534233952 +0200
-@@ -22,6 +22,7 @@
- #include <string.h>
- #include <errno.h>
- #include <dirent.h>
-+#include <sys/stat.h>
- 
- #include "log.h"
- #include "initiator.h"
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
similarity index 87%
rename from meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
rename to meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
index 5b3a257..4c9326e 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
@@ -8,7 +8,7 @@ inherit systemd
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
-           file://user.patch                                        \
+           file://0001-fix-build-error-of-cross-build.patch         \
            file://open-iscsi                                        \
            file://initiatorname.iscsi                               \
            "
@@ -16,7 +16,7 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
 
 S = "${WORKDIR}/open-iscsi-${PV}"
 TARGET_CC_ARCH += "${LDFLAGS}"
-
+EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
 
 do_compile () {
         oe_runmake user
@@ -29,8 +29,8 @@ do_install () {
 }
 
 
-SRC_URI[md5sum] = "0c403e8c9ad41607571ba0e6e8ff196e"
-SRC_URI[sha256sum] = "bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e16744aae59f0a7dcb"
+SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
+SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
 
 # systemd support
 PACKAGES =+ "${PN}-systemd"
-- 
1.8.4.2



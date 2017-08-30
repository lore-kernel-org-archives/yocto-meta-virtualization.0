Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EB51E00C77; Wed, 30 Aug 2017 00:55:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 096F7E00C14
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 00:55:23 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U7tNeE001365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 00:55:23 -0700 (PDT)
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.170) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 Aug 2017 00:55:22 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 Aug 2017 15:55:55 +0800
Message-ID: <1504079755-13075-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] criu: Correct the installation directory for python modules
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
X-List-Received-Date: Wed, 30 Aug 2017 07:55:24 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  2 ++
 ...t-the-installation-directory-for-python-m.patch | 29 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 849a832..2df203e 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
+           file://0001-criu-Correct-the-installation-directory-for-python-m.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '', 'file://disable-selinux.patch', d)} \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
           "
@@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
 
 EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir} PIEGEN=no"
 EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
+EXTRA_OEMAKE_append += "PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}"
 
 CFLAGS += "-D__USE_GNU -D_GNU_SOURCE " 
 
diff --git a/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch b/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
new file mode 100644
index 0000000..0439b3c
--- /dev/null
+++ b/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
@@ -0,0 +1,29 @@
+From 29865b7e9288a60aca151df323ee89c0952e8158 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Thu, 3 Nov 2016 01:33:57 -0400
+Subject: [PATCH] criu: Correct the installation directory for python module
+ distributions
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ lib/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index f1c0821..c3003a5 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
+ 	$(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)),' c/criu.pc.in > c/criu.pc
+ 	$(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
+-	$(E) "  INSTALL " crit
+-	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
++	$(E) "  INSTALL " crit 
++	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --install-lib=$(PYTHON_SITEPACKAGES_DIR) --record $(CRIT_SETUP_FILES)
+ .PHONY: install
+ 
+ uninstall:
+-- 
+2.8.1
+
-- 
2.7.4



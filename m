Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA7C9E00AF0; Mon, 24 Apr 2017 13:31:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF4A7E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 13:31:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3OKVYKd004706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 24 Apr 2017 13:31:34 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 13:31:34 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 24 Apr 2017 16:31:30 -0400
Message-ID: <1493065890-16039-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493065890-16039-1-git-send-email-mark.asselstine@windriver.com>
References: <1493065890-16039-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 3/3] criu: force python to install in ${libdir}
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
X-List-Received-Date: Mon, 24 Apr 2017 20:31:42 -0000
Content-Type: text/plain

Historically Yocto installs python modules in ${libdir} and not the
no-arch variant. The criu install was following every other distros
use of the non-arch variant, /usr/lib, which was being picked up by
the QA check. Modify the criu Makefile to enable us to overwrite this
location by using setup.py's install-lib directive.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  2 ++
 ...e-overwrite-install-lib-to-allow-multiarc.patch | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 851779d..21dee2b 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '', 'file://disable-selinux.patch', d)} \
+           file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
@@ -67,6 +68,7 @@ do_compile () {
 }
 
 do_install () {
+    export INSTALL_LIB="${libdir}/${PYTHON_DIR}/site-packages"
     oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" install
 }
 
diff --git a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
new file mode 100644
index 0000000..8bda8c4
--- /dev/null
+++ b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
@@ -0,0 +1,30 @@
+From 2e0c5c66786016f6443da2c1ff15ad77f018ec9b Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 24 Apr 2017 16:12:05 -0400
+Subject: [PATCH] lib/Makefile: overwrite install-lib, to allow multiarch
+
+I am not sure why Yocto installs python modules in arch specific
+/usr/libXX directories but it does. Allow the recipe to pass this via
+INSTALL_LIB.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ lib/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index f1c0821..c714d12 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -56,7 +56,7 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
+ 	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)),' c/criu.pc.in > c/criu.pc
+ 	$(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	$(E) "  INSTALL " crit
+-	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
++	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES) --install-lib=$(INSTALL_LIB)
+ .PHONY: install
+ 
+ uninstall:
+-- 
+2.7.4
+
-- 
2.7.4



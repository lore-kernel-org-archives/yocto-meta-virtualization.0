Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71433E0070F; Wed,  7 May 2014 12:00:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
X-Greylist: delayed 7556 seconds by postgrey-1.32 at yocto-www;
	Wed, 07 May 2014 12:00:09 PDT
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9512E00480
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 12:00:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s47GsCoR003676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 May 2014 09:54:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 7 May 2014 09:54:12 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 7 May 2014 12:52:28 -0400
Message-ID: <1399481549-15420-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Cc: mark.asselstine@windriver.com, meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] lxc: fixup VPATH builds
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
X-List-Received-Date: Wed, 07 May 2014 19:00:12 -0000
Content-Type: text/plain

Poky commit 69b6eaca3d9b635e8a61a0fdbd814b558e91901d [autotools:
Enable separate builddir by default] enforced separate build
directories, which is supported by automake. Unfortunately lxc had a
few make directives which didn't take into account VPATH builds so
fixing them up here to allow the lxc build to complete successfully.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...tomake-ensure-VPATH-builds-work-correctly.patch | 45 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.1.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch

diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch
new file mode 100644
index 0000000..2a91951
--- /dev/null
+++ b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch
@@ -0,0 +1,45 @@
+From 08ccd79319e66b3f0b51fd5f5b539e652a16dfc0 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 30 Apr 2014 11:06:12 -0400
+Subject: [PATCH] automake: ensure VPATH builds work correctly
+
+There were a few non-VPATH friendly directives in some Makefile.am files, fix
+these up to allow VPATH builds to work.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ config/etc/Makefile.am | 4 ++--
+ src/tests/Makefile.am  | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/config/etc/Makefile.am b/config/etc/Makefile.am
+index 81d7709..dca001e 100644
+--- a/config/etc/Makefile.am
++++ b/config/etc/Makefile.am
+@@ -4,8 +4,8 @@ distroconf = @LXC_DISTRO_CONF@
+ 
+ EXTRA_DIST = default.conf.ubuntu default.conf.libvirt default.conf.unknown
+ 
+-default.conf:
+-	cp $(distroconf) $@
++default.conf: $(distroconf)
++	cp $? $@
+ 
+ clean-local:
+ 	@$(RM) -f default.conf
+diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
+index 7f6645b..641e207 100644
+--- a/src/tests/Makefile.am
++++ b/src/tests/Makefile.am
+@@ -64,7 +64,7 @@ buildtest-TESTS: $(TESTS)
+ install-ptest:
+ 	install -d $(TEST_DIR)
+ 	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
+-	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
++	install -D $(top_srcdir)/config/test-driver $(TEST_DIR)/../../config/test-driver
+ 	cp Makefile $(TEST_DIR)
+ 	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
+ 	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
+-- 
+1.8.3.2
+
diff --git a/recipes-containers/lxc/lxc_1.0.1.bb b/recipes-containers/lxc/lxc_1.0.1.bb
index b366116..4ef80d6 100644
--- a/recipes-containers/lxc/lxc_1.0.1.bb
+++ b/recipes-containers/lxc/lxc_1.0.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://network.c-Add-missing-LXC_NET_NONE-option-refactor.patch \
 	file://runtest.patch \
 	file://run-ptest \
+	file://automake-ensure-VPATH-builds-work-correctly.patch \
 	"
 SRC_URI[md5sum] = "3c7379891e45713817ec873a167070b0"
 SRC_URI[sha256sum] = "17d8e5b575207b4fb57da0b8ba2d13f3e5ee20ce8ccd1259d6eae4bd5ca575b1"
-- 
1.8.3.2



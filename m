Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE3B6E00B30; Tue, 29 Mar 2016 03:22:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A663E00B30
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 03:22:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2TAMTwM018363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 03:22:29 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 03:22:28 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 29 Mar 2016 18:22:24 +0800
Message-ID: <67ff683b234a9dbfe944a67652f1c15fc7aaea12.1459246648.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459246648.git.zhe.he@windriver.com>
References: <cover.1459246648.git.zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openvswith: Uprev to latest version 2.5.0
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
X-List-Received-Date: Tue, 29 Mar 2016 10:22:32 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Uprev to git rev bb429e09f7783f1ba23ac0682ed9edf424f0cfbb (based on 2.5.0)

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 69 ++++++++++++++++++++++
 ...-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch | 69 ----------------------
 recipes-networking/openvswitch/openvswitch_git.bb  |  8 +--
 3 files changed, 73 insertions(+), 73 deletions(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
new file mode 100644
index 0000000..b79cb1b
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
@@ -0,0 +1,69 @@
+Add test-install rule to support ptest execution
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+
+---
+ Makefile.am |    2 ++
+ test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 51 insertions(+)
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -401,3 +401,5 @@
+ include windows/automake.mk
+ include ovn/automake.mk
+ include selinux/automake.mk
++include test.mk
++
+--- /dev/null
++++ b/test.mk
+@@ -0,0 +1,49 @@
++TEST_DEST ?= ${prefix}/lib/openvswitch
++TEST_ROOT ?= ${prefix}/lib/openvswitch
++TEST_DEPEND =
++
++if HAVE_OPENSSL
++TEST_DEPEND += $(TESTPKI_FILES)
++endif
++
++test-install: $(TEST_DEPEND)
++	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
++	install -d $(TEST_DEST)/tests ;\
++	install -d $(TEST_DEST)/python ;\
++	install -d $(TEST_DEST)/python/ovs ;\
++	install -d $(TEST_DEST)/python/ovs/db ;\
++	install -d $(TEST_DEST)/python/ovs/unixctl ;\
++	install -d $(TEST_DEST)/vswitchd ;\
++	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install -d $(TEST_DEST)/debian ;\
++	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
++	install -d $(TEST_DEST)/build-aux ;\
++	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
++	install -d $(TEST_DEST)/xenserver ;\
++	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
++	install -d $(TEST_DEST)/vtep ;\
++	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	for p in $$list ; do \
++	  echo $$p ;\
++	  p=$${p#./} ;\
++	  pre=$${p#tests\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
++	    install $$p $(TEST_DEST)/tests/$$pre ;\
++	    continue ;\
++	  fi ;\
++	  pre=$${p#python\/ovs\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
++	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    continue ;\
++	  fi; \
++	done ;\
++	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
deleted file mode 100644
index c8ebff1..0000000
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Add test-install rule to support ptest execution
-
-Signed-off-by: Radu Patriu <radu.patriu@enea.com>
-
----
- Makefile.am |    2 ++
- test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 51 insertions(+)
-
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -382,3 +382,5 @@
- include datapath-windows/automake.mk
- include datapath-windows/include/automake.mk
- include windows/automake.mk
-+include test.mk
-+
---- /dev/null
-+++ b/test.mk
-@@ -0,0 +1,49 @@
-+TEST_DEST ?= ${prefix}/lib/openvswitch
-+TEST_ROOT ?= ${prefix}/lib/openvswitch
-+TEST_DEPEND =
-+
-+if HAVE_OPENSSL
-+TEST_DEPEND += $(TESTPKI_FILES)
-+endif
-+
-+test-install: $(TEST_DEPEND)
-+	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
-+	install -d $(TEST_DEST)/tests ;\
-+	install -d $(TEST_DEST)/python ;\
-+	install -d $(TEST_DEST)/python/ovs ;\
-+	install -d $(TEST_DEST)/python/ovs/db ;\
-+	install -d $(TEST_DEST)/python/ovs/unixctl ;\
-+	install -d $(TEST_DEST)/vswitchd ;\
-+	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
-+	install -d $(TEST_DEST)/debian ;\
-+	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
-+	install -d $(TEST_DEST)/build-aux ;\
-+	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
-+	install -d $(TEST_DEST)/xenserver ;\
-+	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
-+	install -d $(TEST_DEST)/vtep ;\
-+	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
-+	for p in $$list ; do \
-+	  echo $$p ;\
-+	  p=$${p#./} ;\
-+	  pre=$${p#tests\/} ;\
-+	  if test $$pre != $$p ; then \
-+	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
-+	    install $$p $(TEST_DEST)/tests/$$pre ;\
-+	    continue ;\
-+	  fi ;\
-+	  pre=$${p#python\/ovs\/} ;\
-+	  if test $$pre != $$p ; then \
-+	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
-+	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
-+	    continue ;\
-+	  fi; \
-+	done ;\
-+	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 0c918cd..700a306 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -9,13 +9,13 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.4.0+${SRCREV}"
+PV = "2.5.0+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "bb429e09f7783f1ba23ac0682ed9edf424f0cfbb"
+SRCREV = "8c0b419a0b9ac0141d6973dcc80306dfc6a83d31"
 SRC_URI += "\
-	git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.4 \
+	git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.5 \
 	file://openvswitch-add-more-target-python-substitutions.patch \
 	file://openvswitch-add-ptest-${SRCREV}.patch \
 	file://run-ptest \
@@ -23,7 +23,7 @@ SRC_URI += "\
 	file://kernel_module.patch \
 	"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=5973c953e3c8a767cf0808ff8a0bac1b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
-- 
2.0.1



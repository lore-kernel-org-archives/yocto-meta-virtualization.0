Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D8E4E00A9C; Mon,  4 Apr 2016 22:00:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9A6AE00A9C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Apr 2016 22:00:08 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u35507BR001943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 4 Apr 2016 22:00:07 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Apr 2016 22:00:06 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Apr 2016 12:59:54 +0800
Message-ID: <a1071e18f0295d47c6955a4005fe8736ec1e47c2.1459831866.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459831866.git.zhe.he@windriver.com>
References: <cover.1459831866.git.zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openvswitch: Fix ptest for v2.5
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
X-List-Received-Date: Tue, 05 Apr 2016 05:00:11 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

- Copy certain files from srcdir since it has been different from
  build directory.
- Copy more necessary files for new added test cases.
- Modify config files for running on target.
- Add necessary RDEPENDS

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 79 ++++++++++++++++------
 recipes-networking/openvswitch/openvswitch_git.bb  |  3 +
 2 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
index b79cb1b..7e74044 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
@@ -1,23 +1,38 @@
-Add test-install rule to support ptest execution
+From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 30 Mar 2016 06:23:45 -0400
+Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
 
 Signed-off-by: Radu Patriu <radu.patriu@enea.com>
 
+Fix ptest for v2.5
+ - Copy certain files from srcdir since it has been different from
+   build directory.
+ - Copy more necessary files for new added test cases.
+ - Modify config files for running on target.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
- Makefile.am |    2 ++
- test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 51 insertions(+)
+ Makefile.am |  1 +
+ test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+)
+ create mode 100644 test.mk
 
+diff --git a/Makefile.am b/Makefile.am
+index ed43c2f..f38d278 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -401,3 +401,5 @@
+@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
  include windows/automake.mk
  include ovn/automake.mk
  include selinux/automake.mk
 +include test.mk
-+
+diff --git a/test.mk b/test.mk
+new file mode 100644
+index 0000000..b10a581
 --- /dev/null
 +++ b/test.mk
-@@ -0,0 +1,49 @@
+@@ -0,0 +1,72 @@
 +TEST_DEST ?= ${prefix}/lib/openvswitch
 +TEST_ROOT ?= ${prefix}/lib/openvswitch
 +TEST_DEPEND =
@@ -29,37 +44,53 @@ Signed-off-by: Radu Patriu <radu.patriu@enea.com>
 +test-install: $(TEST_DEPEND)
 +	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
 +	install -d $(TEST_DEST)/tests ;\
++	install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
 +	install -d $(TEST_DEST)/python ;\
 +	install -d $(TEST_DEST)/python/ovs ;\
 +	install -d $(TEST_DEST)/python/ovs/db ;\
 +	install -d $(TEST_DEST)/python/ovs/unixctl ;\
 +	install -d $(TEST_DEST)/vswitchd ;\
-+	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
 +	install -d $(TEST_DEST)/debian ;\
-+	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
++	install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
 +	install -d $(TEST_DEST)/build-aux ;\
-+	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
++	install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
 +	install -d $(TEST_DEST)/xenserver ;\
-+	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
-+	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
 +	install -d $(TEST_DEST)/vtep ;\
-+	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	install -d $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
++	install -d $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
 +	for p in $$list ; do \
 +	  echo $$p ;\
-+	  p=$${p#./} ;\
++	  p=$${p#../git/} ;\
 +	  pre=$${p#tests\/} ;\
 +	  if test $$pre != $$p ; then \
 +	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
-+	    install $$p $(TEST_DEST)/tests/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/tests/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
++	    fi ;\
 +	    continue ;\
 +	  fi ;\
 +	  pre=$${p#python\/ovs\/} ;\
 +	  if test $$pre != $$p ; then \
 +	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
-+	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    fi ;\
 +	    continue ;\
 +	  fi; \
 +	done ;\
@@ -67,3 +98,13 @@ Signed-off-by: Radu Patriu <radu.patriu@enea.com>
 +	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
 +	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
 +	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
+-- 
+1.9.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 700a306..2f7fe3e 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -6,6 +6,9 @@ RDEPENDS_${PN}-ptest += "\
 	python-logging python-syslog python-argparse python-io \
 	python-fcntl python-shell python-lang python-xml python-math \
 	python-datetime python-netclient python sed \
+	ldd perl-module-socket perl-module-carp perl-module-exporter \
+	perl-module-xsloader python-netserver python-threading \
+	python-resource python-subprocess \
 	"
 
 S = "${WORKDIR}/git"
-- 
1.9.1



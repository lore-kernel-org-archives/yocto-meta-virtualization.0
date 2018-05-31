Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43732E00CC4; Thu, 31 May 2018 14:12:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D7AFE00C82
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4VLAt5Z026854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:42 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 May 2018 14:11:37 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 31 May 2018 17:08:06 -0400
Message-ID: <1527800886-29777-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
References: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] lxc: use compiled tests instead of copying source building on target
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
X-List-Received-Date: Thu, 31 May 2018 21:12:23 -0000
Content-Type: text/plain

The tests are already built when we do_compile so we only need to copy
them to the ptest path and create a wrapper script to run them. This
has the added benefit of reducing the size of the lxc package.

We have to manipulate the test sources some to remove gpg validation
and a few other minor changes, none of which actually change what is
being tested (notes are provided in the associated commit logs).

The following are the ptest results currently acheived:

    ### Starting LXC ptest ###
    ./tests/lxc-test-api-reboot FAIL
    ./tests/lxc-test-apparmor SKIPPED
    ./tests/lxc-test-attach PASS
    ./tests/lxc-test-automount PASS
    ./tests/lxc-test-autostart PASS
    ./tests/lxc-test-cgpath PASS
    ./tests/lxc-test-cloneconfig PASS
    ./tests/lxc-test-clonetest PASS
    ./tests/lxc-test-concurrent PASS
    ./tests/lxc-test-config-jump-table PASS
    ./tests/lxc-test-console PASS
    ./tests/lxc-test-console-log PASS
    ./tests/lxc-test-containertests PASS
    ./tests/lxc-test-createconfig PASS
    ./tests/lxc-test-createtest PASS
    ./tests/lxc-test-criu-check-feature PASS
    ./tests/lxc-test-destroytest PASS
    ./tests/lxc-test-device-add-remove PASS
    ./tests/lxc-test-get_item PASS
    ./tests/lxc-test-getkeys PASS
    ./tests/lxc-test-list PASS
    ./tests/lxc-test-locktests PASS
    ./tests/lxc-test-lxcpath PASS
    ./tests/lxc-test-may-control PASS
    ./tests/lxc-test-no-new-privs PASS
    ./tests/lxc-test-parse-config-file PASS
    ./tests/lxc-test-raw-clone PASS
    ./tests/lxc-test-reboot PASS
    ./tests/lxc-test-rootfs PASS
    ./tests/lxc-test-saveconfig PASS
    ./tests/lxc-test-share-ns PASS
    ./tests/lxc-test-shortlived PASS
    ./tests/lxc-test-shutdowntest SKIPPED
    ./tests/lxc-test-snapshot PASS
    ./tests/lxc-test-startone PASS
    ./tests/lxc-test-state-server SKIPPED
    ./tests/lxc-test-utils PASS

    Results:
        PASSED = 33
        FAILED = 1
        SKIPPED = 3
        (for details check individual test log in ./logs directory)

    ### LXC ptest complete ###

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../automake-ensure-VPATH-builds-correctly.patch   | 26 -------
 recipes-containers/lxc/files/run-ptest             | 57 +++++++++++++-
 recipes-containers/lxc/files/runtest.patch         | 32 --------
 ...ke-busybox-template-compatible-with-core-.patch | 59 +++++++++++++++
 ...-no-validate-when-using-download-template.patch | 87 ++++++++++++++++++++++
 .../lxc/files/tests-our-init-is-not-busybox.patch  | 31 ++++++++
 recipes-containers/lxc/lxc_3.0.0.bb                | 13 ++--
 7 files changed, 239 insertions(+), 66 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
 delete mode 100644 recipes-containers/lxc/files/runtest.patch
 create mode 100644 recipes-containers/lxc/files/template-make-busybox-template-compatible-with-core-.patch
 create mode 100644 recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
 create mode 100644 recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch

diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
deleted file mode 100644
index 61c0e29..0000000
--- a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From fe23085d9a40d6d78387d9ce8ddb65785fe8d6e5 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Thu, 2 Oct 2014 18:31:50 -0400
-Subject: [PATCH] automake: ensure VPATH builds correctly
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
----
- src/tests/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
-index d74c10d..6225f78 100644
---- a/src/tests/Makefile.am
-+++ b/src/tests/Makefile.am
-@@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)
- install-ptest:
- 	install -d $(TEST_DIR)
- 	install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
--	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
-+	install -D $(top_srcdir)/config/test-driver $(TEST_DIR)/../../config/test-driver
- 	cp Makefile $(TEST_DIR)
- 	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
- 	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
--- 
-1.7.10.4
-
diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 23a6256..e985544 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -1,4 +1,57 @@
-#!/bin/sh
+#!/bin/bash
 
-make -C src/tests -k check-TESTS
+# Network interfaces come up and down and can be quite noisy
+# and since we are often on the console when running ptests
+# let's just quiet things some
+dmesg -n 1
 
+# Blacklisted test will be skipped
+blacklist=""
+# Not applicable
+blacklist="$blacklist lxc-test-apparmor"
+# These currently hang so skip them until someone fixes them up
+blacklist="$blacklist lxc-test-shutdowntest"
+blacklist="$blacklist lxc-test-state-server"
+
+passed=0
+failed=0
+skipped=0
+
+# Create logs dir and clear old logs if any
+mkdir logs 2> /dev/null
+rm -f logs/*
+
+echo "### Starting LXC ptest ###"
+
+for test in ./tests/*
+do
+    if [[ ! $blacklist = *$(basename $test)*  ]]
+    then
+	$test >logs/$(basename $test).log 2>&1
+    else
+	echo "$test SKIPPED"
+	skipped=$((skipped+1))
+	continue
+    fi
+
+    if [ $? -eq 0 ]
+    then
+	echo "$test PASS"
+	passed=$((passed+1))
+    else
+	echo "$test FAIL"
+	failed=$((failed+1))
+    fi
+done
+
+echo ""
+echo "Results:"
+echo "    PASSED = $passed"
+echo "    FAILED = $failed"
+echo "    SKIPPED = $skipped"
+echo "(for details check individual test log in ./logs directory)"
+echo ""
+echo "### LXC ptest complete ###"
+
+# restore dmesg to console
+dmesg -n 6
diff --git a/recipes-containers/lxc/files/runtest.patch b/recipes-containers/lxc/files/runtest.patch
deleted file mode 100644
index 6572265..0000000
--- a/recipes-containers/lxc/files/runtest.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Add install-ptest rule.
-
-Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
-Upstream-status: Pending
-
-diff -uNr a/src/tests/Makefile.am b/src/tests/Makefile.am
---- a/src/tests/Makefile.am	2014-04-07 16:25:59.246238815 +0300
-+++ b/src/tests/Makefile.am	2014-04-10 18:09:43.195772467 +0300
-@@ -54,6 +54,23 @@
- 
- endif
- 
-+TESTS = lxc-test-containertests lxc-test-locktests \
-+        lxc-test-getkeys lxc-test-lxcpath lxc-test-cgpath lxc-test-console \
-+        lxc-test-snapshot lxc-test-concurrent lxc-test-may-control \
-+        lxc-test-reboot lxc-test-list lxc-test-attach lxc-test-device-add-remove
-+
-+buildtest-TESTS: $(TESTS)
-+
-+install-ptest:
-+	install -d $(TEST_DIR)
-+	install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
-+	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
-+	cp Makefile $(TEST_DIR)
-+	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
-+	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
-+	sed -i 's|^all-am:|_all-am:|' $(TEST_DIR)/Makefile
-+	sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(TEST_DIR)/Makefile
-+
- EXTRA_DIST = \
- 	cgpath.c \
- 	clonetest.c \
diff --git a/recipes-containers/lxc/files/template-make-busybox-template-compatible-with-core-.patch b/recipes-containers/lxc/files/template-make-busybox-template-compatible-with-core-.patch
new file mode 100644
index 0000000..1c6022b
--- /dev/null
+++ b/recipes-containers/lxc/files/template-make-busybox-template-compatible-with-core-.patch
@@ -0,0 +1,59 @@
+From 0990db9b9723589606104d42ac2cf865b78e50a1 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 11:44:44 -0400
+Subject: [PATCH] template: make busybox template compatible with
+ core-image-minimal
+
+The busybox template makes a lot of assumptions about how the busybox
+binary found on the host was configured. Building core-image-minimal
+"out of the box" does not configure busybox's 'passwd' or 'init'
+applets so we need to work around this.
+
+Chances are if you attempt to use the busybox template with a host
+which is note core-image-minimal it will fail but we are making these
+changes here to at least have the template work with
+core-image-minimal to be able to demonstrate that it can work as well
+as to have it available for the ptests.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ templates/lxc-busybox.in | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index 7d00bf5..5a99103 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -181,6 +181,19 @@ configure_busybox()
+     return 1
+   fi
+ 
++  # copy host passwd
++  if ! cp "$(which passwd)" "${rootfs}/bin"; then
++      echo "ERROR: Failed to copy passwd binary"
++      return 1
++  fi
++
++  # copy bash binary as the container init
++  if ! cp "$(which bash)" "${rootfs}/sbin/init"; then
++      echo "ERROR: Failed to copy bash binary"
++      return 1
++  fi
++
++
+   # symlink busybox for the commands it supports
+   # it would be nice to just use "chroot $rootfs busybox --install -s /bin"
+   # but that only works right in a chroot with busybox >= 1.19.0
+@@ -191,9 +204,6 @@ configure_busybox()
+       xargs -n1 ln -s busybox
+   )
+ 
+-  # relink /sbin/init
+-  ln "${rootfs}/bin/busybox" "${rootfs}/sbin/init"
+-
+   # /etc/fstab must exist for "mount -a"
+   touch "${rootfs}/etc/fstab"
+ 
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
new file mode 100644
index 0000000..81fd15d
--- /dev/null
+++ b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
@@ -0,0 +1,87 @@
+From 0dad69a3bd306cc701c8bd4df4ea47f0ec5f9150 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 15:14:26 -0400
+Subject: [PATCH] tests: add '--no-validate' when using download template
+
+We are usually running the ptests with core-image-minimal which has no
+mechanism to validate the downloads. Validation isn't really of
+interest to this test at any rate so simply add '--no-validate' to
+avoid failing due to no GPG validation.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ src/tests/lxc-test-apparmor-mount | 2 +-
+ src/tests/lxc-test-autostart      | 2 +-
+ src/tests/lxc-test-no-new-privs   | 2 +-
+ src/tests/lxc-test-unpriv         | 2 +-
+ src/tests/lxc-test-usernic.in     | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparmor-mount
+index ddcee8a..d3d2c49 100755
+--- a/src/tests/lxc-test-apparmor-mount
++++ b/src/tests/lxc-test-apparmor-mount
+@@ -157,7 +157,7 @@ if [ -f /etc/lsb-release ]; then
+     done
+ fi
+ 
+-run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a $ARCH
++run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r $release -a $ARCH
+ 
+ echo "test default confined container"
+ run_cmd lxc-start -n $cname -d
+diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autostart
+index e5b651b..d15b79b 100755
+--- a/src/tests/lxc-test-autostart
++++ b/src/tests/lxc-test-autostart
+@@ -55,7 +55,7 @@ if [ -f /etc/lsb-release ]; then
+     done
+ fi
+ 
+-lxc-create -t download -n $CONTAINER_NAME -B dir -- -d ubuntu -r $release -a $ARCH
++lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d ubuntu -r $release -a $ARCH
+ CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.path -H) | sed -e 's/dir://')
+ cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
+ 
+diff --git a/src/tests/lxc-test-no-new-privs b/src/tests/lxc-test-no-new-privs
+index 8642992..e72bdf0 100755
+--- a/src/tests/lxc-test-no-new-privs
++++ b/src/tests/lxc-test-no-new-privs
+@@ -47,7 +47,7 @@ if type dpkg >/dev/null 2>&1; then
+ 	ARCH=$(dpkg --print-architecture)
+ fi
+ 
+-lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH
++lxc-create -t download -n c1 -- --no-validate -d ubuntu -r xenial -a $ARCH
+ echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config
+ 
+ lxc-start -n c1
+diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
+index 16ff12d..0958d48 100755
+--- a/src/tests/lxc-test-unpriv
++++ b/src/tests/lxc-test-unpriv
+@@ -173,7 +173,7 @@ run_cmd mkdir -p $HDIR/.cache/lxc
+     cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
+     chown -R $TUSER: $HDIR/.cache/lxc
+ 
+-run_cmd lxc-create -t download -n c1 -- -d ubuntu -r $release -a $ARCH
++run_cmd lxc-create -t download -n c1 -- --no-validate -d ubuntu -r $release -a $ARCH
+ 
+ # Make sure we can start it - twice
+ 
+diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.in
+index 3e35008..f489286 100755
+--- a/src/tests/lxc-test-usernic.in
++++ b/src/tests/lxc-test-usernic.in
+@@ -146,7 +146,7 @@ if [ -f /etc/lsb-release ]; then
+ fi
+ 
+ # Create three containers
+-run_cmd "lxc-create -t download -n b1 -- -d ubuntu -r $release -a $ARCH"
++run_cmd "lxc-create -t download -n b1 -- --no-validate -d ubuntu -r $release -a $ARCH"
+ run_cmd "lxc-start -n b1 -d"
+ p1=$(run_cmd "lxc-info -n b1 -p -H")
+ 
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
new file mode 100644
index 0000000..4c9bf65
--- /dev/null
+++ b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
@@ -0,0 +1,31 @@
+From b53169dc4c53f9ef64f8cb06dd9af97182577698 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 15:00:34 -0400
+Subject: [PATCH] tests: our init is not busybox
+
+Since we are using 'bash' as the init (see our updates to the busybox
+template) we can't compare '/sbin/init' and 'busybox'. Actually we are
+really only interested in the fact 'cmp' is being run and not the
+result, so simplify by comparing '/sbin/init' to itself.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ src/tests/attach.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tests/attach.c b/src/tests/attach.c
+index 2c77127..1c182d6 100644
+--- a/src/tests/attach.c
++++ b/src/tests/attach.c
+@@ -251,7 +251,7 @@ static int test_attach_cmd(struct lxc_container *ct)
+ {
+ 	int ret;
+ 	pid_t pid;
+-	char *argv[] = {"cmp", "-s", "/sbin/init", "/bin/busybox", NULL};
++	char *argv[] = {"cmp", "-s", "/sbin/init", "/sbin/init", NULL};
+ 	lxc_attach_command_t command = {"cmp", argv};
+ 	lxc_attach_options_t attach_options = LXC_ATTACH_OPTIONS_DEFAULT;
+ 
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/lxc_3.0.0.bb b/recipes-containers/lxc/lxc_3.0.0.bb
index 762a312..4f7526b 100644
--- a/recipes-containers/lxc/lxc_3.0.0.bb
+++ b/recipes-containers/lxc/lxc_3.0.0.bb
@@ -29,19 +29,20 @@ RDEPENDS_${PN} = " \
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
 
-RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
+RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://runtest.patch \
 	file://run-ptest \
-	file://automake-ensure-VPATH-builds-correctly.patch \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
+	file://template-make-busybox-template-compatible-with-core-.patch \
+	file://tests-our-init-is-not-busybox.patch \
+	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
@@ -116,8 +117,6 @@ FILES_${PN}-networking += " \
     ${sysconfdir}/default/lxc-net \
 "
 
-PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
-
 CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
     am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
@@ -159,7 +158,9 @@ do_install_append() {
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
 
 do_install_ptest() {
-	oe_runmake -C src/tests install-ptest
+	# Move tests to the "ptest directory"
+	install -d ${D}/${PTEST_PATH}/tests
+	mv ${D}/usr/bin/lxc-test-* ${D}/${PTEST_PATH}/tests/.
 }
 
 pkg_postinst_${PN}() {
-- 
2.7.4



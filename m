Return-Path: <okaya@kernel.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC1DEE00A9B; Thu, 11 Oct 2018 13:28:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.145.29.99 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F8DFE0090C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 13:28:36 -0700 (PDT)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [104.211.36.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C476C2098A;
	Thu, 11 Oct 2018 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1539289716;
	bh=Yo67CpbCn4Flli+ik0/1SmHLkC5NIrwNR/0fLRaV8vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qXYGNURQusM/FLvnJKFjF+GuUbyouBOGXKA5jSmVgtZPKgAuGF5nkPcYMMdoT6JJ3
	dfSDEuJ8cBoSaIZoT/WQIK8ilW6n8qrhIK+x8kFWBYP+sYs43rlX4TqnlKX0+FKvcc
	fKWYWOMAXV9QtZ71eHwOZ+5YNZatAD9C9rKydrA8=
From: Sinan Kaya <okaya@kernel.org>
To: meta-virtualization@yoctoproject.org
Date: Thu, 11 Oct 2018 20:28:32 +0000
Message-Id: <20181011202832.20004-2-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181011202832.20004-1-okaya@kernel.org>
References: <20181011202832.20004-1-okaya@kernel.org>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: [sumo] [PATCH v1 2/2] lxc: use compiled tests instead of copying source building on target
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
X-List-Received-Date: Thu, 11 Oct 2018 20:28:37 -0000
Content-Transfer-Encoding: 8bit

From: Mark Asselstine <mark.asselstine@windriver.com>

The tests are already built when we do_compile so we only need to copy
them to the ptest path and create a wrapper script to run them. This
has the added benefit of reducing the size of the lxc package.

We have to manipulate the test sources some to remove gpg validation
and a few other minor changes, none of which actually change what is
being tested (notes are provided in the associated commit logs).

The following are the ptest results currently acheived:

BEGIN: /usr/lib/lxc/ptest
  # Starting LXC ptest ###
./tests/lxc-test-apparmor SKIPPED
./tests/lxc-test-attach FAIL
./tests/lxc-test-automount PASS
./tests/lxc-test-autostart FAIL
./tests/lxc-test-cgpath PASS
./tests/lxc-test-cloneconfig PASS
./tests/lxc-test-clonetest PASS
./tests/lxc-test-concurrent PASS
./tests/lxc-test-console FAIL
./tests/lxc-test-containertests PASS
./tests/lxc-test-createconfig PASS
./tests/lxc-test-createtest FAIL
./tests/lxc-test-destroytest FAIL
./tests/lxc-test-device-add-remove PASS
./tests/lxc-test-get_item PASS
./tests/lxc-test-getkeys PASS
./tests/lxc-test-list PASS
./tests/lxc-test-locktests PASS
./tests/lxc-test-lxcpath PASS
./tests/lxc-test-may-control PASS
./tests/lxc-test-reboot PASS
./tests/lxc-test-saveconfig PASS
./tests/lxc-test-shutdowntest SKIPPED
./tests/lxc-test-snapshot PASS
./tests/lxc-test-startone PASS
./tests/lxc-test-utils PASS

Results:
    PASSED = 19
    FAILED = 5
    SKIPPED = 2
(for details check individual test log in ./logs directory)

 ### LXC ptest complete ###

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 ...tomake-ensure-VPATH-builds-correctly.patch | 26 -------
 recipes-containers/lxc/files/run-ptest        | 57 +++++++++++++-
 recipes-containers/lxc/files/runtest.patch    | 32 --------
 ...sybox-template-compatible-with-core-.patch | 60 +++++++++++++++
 ...alidate-when-using-download-template.patch | 74 +++++++++++++++++++
 .../files/tests-our-init-is-not-busybox.patch | 32 ++++++++
 recipes-containers/lxc/lxc_2.0.8.bb           | 13 ++--
 7 files changed, 228 insertions(+), 66 deletions(-)
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
index 0000000..1d472d3
--- /dev/null
+++ b/recipes-containers/lxc/files/template-make-busybox-template-compatible-with-core-.patch
@@ -0,0 +1,60 @@
+From f64f39f54fa33c729c76626d337107f21def8f0b Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 11:44:44 -0400
+Subject: [PATCH 1/3] template: make busybox template compatible with
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
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ templates/lxc-busybox.in | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index c266668..25e4cbf 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -310,6 +310,19 @@ configure_busybox()
+         return 1
+     fi
+ 
++    # copy host passwd
++    if ! cp "$(which passwd)" "${rootfs}/bin"; then
++	echo "ERROR: Failed to copy passwd binary"
++	return 1
++    fi
++
++    # copy bash binary as the container init
++    if ! cp "$(which bash)" "${rootfs}/sbin/init"; then
++	echo "ERROR: Failed to copy bash binary"
++	return 1
++    fi
++
++
+     # symlink busybox for the commands it supports
+     # it would be nice to just use "chroot $rootfs busybox --install -s /bin"
+     # but that only works right in a chroot with busybox >= 1.19.0
+@@ -319,9 +332,6 @@ configure_busybox()
+       xargs -n1 ln -s busybox
+     popd > /dev/null
+ 
+-    # relink /sbin/init
+-    ln $rootfs/bin/busybox $rootfs/sbin/init
+-
+     # /etc/fstab must exist for "mount -a"
+     touch $rootfs/etc/fstab
+ 
+-- 
+2.19.0
+
diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
new file mode 100644
index 0000000..4ca0b33
--- /dev/null
+++ b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
@@ -0,0 +1,74 @@
+From 11d930d622d20c1cf4db19a6ac6e0ee68173a3dc Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 15:14:26 -0400
+Subject: [PATCH 3/3] tests: add '--no-validate' when using download template
+
+We are usually running the ptests with core-image-minimal which has no
+mechanism to validate the downloads. Validation isn't really of
+interest to this test at any rate so simply add '--no-validate' to
+avoid failing due to no GPG validation.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ src/tests/lxc-test-apparmor-mount | 2 +-
+ src/tests/lxc-test-autostart      | 2 +-
+ src/tests/lxc-test-unpriv         | 2 +-
+ src/tests/lxc-test-usernic.in     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparmor-mount
+index bb9b1fc..a727092 100755
+--- a/src/tests/lxc-test-apparmor-mount
++++ b/src/tests/lxc-test-apparmor-mount
+@@ -156,7 +156,7 @@ if [ -f /etc/lsb-release ]; then
+     done
+ fi
+ 
+-run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a $ARCH
++run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r $release -a $ARCH
+ 
+ echo "test default confined container"
+ run_cmd lxc-start -n $cname -d
+diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autostart
+index 61dbdf1..921dfae 100755
+--- a/src/tests/lxc-test-autostart
++++ b/src/tests/lxc-test-autostart
+@@ -55,7 +55,7 @@ if [ -f /etc/lsb-release ]; then
+     done
+ fi
+ 
+-lxc-create -t download -n $CONTAINER_NAME -- -d ubuntu -r $release -a $ARCH
++lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d ubuntu -r $release -a $ARCH
+ CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs -H))
+ cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
+ 
+diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
+index 8486fbd..dfa9b43 100755
+--- a/src/tests/lxc-test-unpriv
++++ b/src/tests/lxc-test-unpriv
+@@ -172,7 +172,7 @@ run_cmd mkdir -p $HDIR/.cache/lxc
+     cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
+     chown -R $TUSER: $HDIR/.cache/lxc
+ 
+-run_cmd lxc-create -t download -n c1 -- -d ubuntu -r $release -a $ARCH
++run_cmd lxc-create -t download -n c1 -- --no-validate -d ubuntu -r $release -a $ARCH
+ 
+ # Make sure we can start it - twice
+ 
+diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.in
+index 0b99baa..2a407c6 100755
+--- a/src/tests/lxc-test-usernic.in
++++ b/src/tests/lxc-test-usernic.in
+@@ -145,7 +145,7 @@ if [ -f /etc/lsb-release ]; then
+ fi
+ 
+ # Create three containers
+-run_cmd "lxc-create -t download -n b1 -- -d ubuntu -r $release -a $ARCH"
++run_cmd "lxc-create -t download -n b1 -- --no-validate -d ubuntu -r $release -a $ARCH"
+ run_cmd "lxc-start -n b1 -d"
+ p1=$(run_cmd "lxc-info -n b1 -p -H")
+ 
+-- 
+2.19.0
+
diff --git a/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
new file mode 100644
index 0000000..2a0113e
--- /dev/null
+++ b/recipes-containers/lxc/files/tests-our-init-is-not-busybox.patch
@@ -0,0 +1,32 @@
+From 9c973bfaab26426d8dcda8329f93a9af77415d76 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 15:00:34 -0400
+Subject: [PATCH 2/3] tests: our init is not busybox
+
+Since we are using 'bash' as the init (see our updates to the busybox
+template) we can't compare '/sbin/init' and 'busybox'. Actually we are
+really only interested in the fact 'cmp' is being run and not the
+result, so simplify by comparing '/sbin/init' to itself.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ src/tests/attach.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tests/attach.c b/src/tests/attach.c
+index af03862..03c247a 100644
+--- a/src/tests/attach.c
++++ b/src/tests/attach.c
+@@ -248,7 +248,7 @@ static int test_attach_cmd(struct lxc_container *ct)
+ {
+ 	int ret;
+ 	pid_t pid;
+-	char *argv[] = {"cmp", "-s", "/sbin/init", "/bin/busybox", NULL};
++	char *argv[] = {"cmp", "-s", "/sbin/init", "/sbin/init", NULL};
+ 	lxc_attach_command_t command = {"cmp", argv};
+ 	lxc_attach_options_t attach_options = LXC_ATTACH_OPTIONS_DEFAULT;
+ 
+-- 
+2.19.0
+
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index facad2e..13f3e77 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -28,18 +28,19 @@ RDEPENDS_${PN} = " \
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
 
-RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
+RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://runtest.patch \
 	file://run-ptest \
-	file://automake-ensure-VPATH-builds-correctly.patch \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://cgroups-work-around-issue-in-gcc-7.patch \
 	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
+	file://template-make-busybox-template-compatible-with-core-.patch \
+	file://tests-our-init-is-not-busybox.patch \
+	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	"
 
@@ -111,8 +112,6 @@ FILES_${PN}-setup += "/lib/systemd/system"
 FILES_${PN}-setup += "/usr/lib/systemd/system"
 FILES_${PN}-setup += "/etc/init.d"
 
-PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
-
 CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
     am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
@@ -151,7 +150,9 @@ do_install_append() {
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
 
 do_install_ptest() {
-	oe_runmake -C src/tests install-ptest
+	# Move tests to the "ptest directory"
+	install -d ${D}/${PTEST_PATH}/tests
+	mv ${D}/usr/bin/lxc-test-* ${D}/${PTEST_PATH}/tests/.
 }
 
 pkg_postinst_${PN}() {
-- 
2.19.0



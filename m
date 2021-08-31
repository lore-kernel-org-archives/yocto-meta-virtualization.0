Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.595.1630452607099865731
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 16:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azjZYrP1;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id a66so1231522qkc.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mc1pMHy256khWsOavkfM3PZMJzGpmrcgdiAEEBKpqf4=;
        b=azjZYrP1sBz0aSE0/etgdI1AdsbczlSIZxeoC3+hjs2H8uVaG0hELvM1CMCmVC0Yb9
         teIvmW+/mYWRoel/tPWxJu2y9NWdNh32wVQNPDGXZSLmVLv72hof9op5xqTDschTPBpM
         SutQA5y+1p5G6KUL8qw3KRgu0xnX50fWB3ei+ZblgSrrN8klPt+Y3YyPn9CNJaKa5qA0
         3AiNT6IFLCKvPFpPqV7zuZSv0zpup8akGs7oF3kU3S+vCuLTnL6sV79soe/421wylNUa
         6HoD3YW6sM1ThUwyGUGRyxDnLC8kPijiHoZSzd92fL+QDXFHUMVkza/gxAyXtCSt2d+4
         3EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mc1pMHy256khWsOavkfM3PZMJzGpmrcgdiAEEBKpqf4=;
        b=NAx81YVGsttstP1AvGqwRoJWNnaF4WDLyUny2wQzkHurC3bA2LcOahBDqf45Lduv/U
         h0rX6Ces66hcFLFpmc+K+H7BFjqhpbRnjHCaq5Myos/pzENki84GoxAjAyOkLs6FMJ+y
         jIcrqi/EOY1189S3foXWPkFIJsUIWUTEAyAgSxh3ei55D2ArFLu2Tyi4nNwCRScTggHT
         9CyowOhja5KTBzl6WirF5rXAhCrryvCe/APQDgEvGgx7Bh9MFCbZInVadBNxcbE+8FAJ
         rVGUtFiXABqPjVtPqyrz6UjyFrHBHzdX/Kc5cnPuqnW6TlG70dLH/YrU2ShAFpFLybzX
         FeAQ==
X-Gm-Message-State: AOAM533cLWP6aJ1bmwLzdSYopUFyF6weyXVclxXuZA3ruOzJqFqOVqbg
	NFpDQt0kO++qX8MSjeT5u+GZjfp2xiP/dw==
X-Google-Smtp-Source: ABdhPJzzBYOgdtKHvCugGG0vn6moN3uTwfPmFhtQ1U3Q6nl1Zr6Dr3LWVCkA0JbQ/YSSJ7nIXW2k0w==
X-Received: by 2002:a37:9e55:: with SMTP id h82mr5632521qke.42.1630452606116;
        Tue, 31 Aug 2021 16:30:06 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id d20sm14793007qkl.13.2021.08.31.16.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:30:05 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH 4/4] xtf: add testimage integration to run XTF test cases in OEQA
Date: Tue, 31 Aug 2021 16:27:43 -0700
Message-Id: <20210831232743.252498-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831232743.252498-1-christopher.w.clark@gmail.com>
References: <20210831232743.252498-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new minimal OEQA test case to run the Xen Test Framework
test runner in the standard testimage step. Tested with qemux86-64
and designed for compatibility with Arm when XTF supports it.

To enable, append to local.conf:
    INHERIT += "testimage"
    QEMU_USE_SLIRP = "1"
    TEST_SERVER_IP = "127.0.0.1"

To run: bitbake -c testimage xtf-image

For inspection while it runs, at another shell prompt:
 * Observe the image booting:
 tail -f ${TMPDIR}/work/qemux86_64-*/xtf-image/*/testimage/qemu_boot_log.*
 * Observe the tests running once boot has completed:
 tail -f ${TMPDIR}/work/qemux86_64-*/xtf-image/*/temp/log.do_testimage

The XTF test sequence by default is a single XTF test case with minimal
hardware dependency to ensure that Xen is running, the Xen toolstack is
functional and XTF works. Additional XTF test cases for an image can be
configured via variables that are documented in the OEQA test case:
   * XTF_TEST_CASES_POPULATE
   * XTF_TEST_CASES_SKIP
   * XTF_TEST_CASES_REQUIRE

Since testimage requires a functioning network to perform the tests on
the image and the qemu MACHINES do not have networking enabled
this commit provides a new qemuboot-testimage-network bbclass to add an
image postprocess command to enable a functional eth0 for qemu MACHINES.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 .gitignore                                   |   1 +
 classes/qemuboot-testimage-network.bbclass   |  17 +++
 lib/oeqa/runtime/cases/xtf_minimal.py        | 116 +++++++++++++++++++
 recipes-extended/images/xen-image-minimal.bb |   2 +-
 recipes-extended/images/xtf-image.bb         |  15 +++
 5 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 classes/qemuboot-testimage-network.bbclass
 create mode 100644 lib/oeqa/runtime/cases/xtf_minimal.py

diff --git a/.gitignore b/.gitignore
index 357aefe..a61332e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,3 +6,4 @@ pyshtables.py
 /*.patch
 *~
 scripts/lib/wic/plugins/source/__pycache__
+lib/oeqa/runtime/cases/__pycache__
diff --git a/classes/qemuboot-testimage-network.bbclass b/classes/qemuboot-testimage-network.bbclass
new file mode 100644
index 0000000..18af1ee
--- /dev/null
+++ b/classes/qemuboot-testimage-network.bbclass
@@ -0,0 +1,17 @@
+# The recipe for init-ifupdown in core has a special-case for all
+# the Qemu MACHINES: it removes all external network interfaces
+# by default. However, eth0 is needed for testimage, so enable it here.
+enable_runqemu_network() {
+    : # no-op for non-qemu MACHINES
+}
+enable_runqemu_network:qemuall() {
+    if ! grep -q eth0 "${IMAGE_ROOTFS}${sysconfdir}/network/interfaces" ; then
+        cat <<EOF >>${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
+
+# Network for testimage
+auto eth0
+iface eth0 inet dhcp
+EOF
+    fi
+}
+ROOTFS_POSTPROCESS_COMMAND += 'enable_runqemu_network;'
diff --git a/lib/oeqa/runtime/cases/xtf_minimal.py b/lib/oeqa/runtime/cases/xtf_minimal.py
new file mode 100644
index 0000000..6094cd9
--- /dev/null
+++ b/lib/oeqa/runtime/cases/xtf_minimal.py
@@ -0,0 +1,116 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Author: Christopher Clark
+# Copyright (c) Star Lab Corp, 2021
+#
+# Integration of the Xen Test Framework (XTF) into OpenEmbedded QA
+#
+# Since not all XTF test cases are appropriate for all test environments,
+# images or machine configurations the selection of XTF test cases to run
+# is determined by variables that can be set in an image recipe.
+#
+# * XTF_TEST_CASES_POPULATE
+# Specifies the list of queries passed to xtf-runner to populate the test list.
+# eg. 'pv64 livepatch-priv-check'
+#
+# Since the space character is meaningful and may be required within a populate clause,
+# the '|' character is used for separating multiple queries.
+# eg. 'pv64 livepatch-priv-check|pv32pae selftest'
+#
+# * XTF_TEST_CASES_SKIP
+# A space-separate list of test cases that should be skipped even if returned
+# from the queries specified in XTF_TEST_CASES_POPULATE.
+# eg. 'test-pv64-livepatch-priv-check'
+#
+# * XTF_TEST_CASES_REQUIRE
+# A space-separate list of test cases that must not be skipped even if missing
+# from the results of the queries specified in XTF_TEST_CASES_POPULATE.
+
+#----------
+# The default single test case here is chosen because it exercises XTF
+# and just Xen itself rather than any specifics of the hardware
+# (virtual or not) that Xen is running on.
+# TODO: this is an x86-specific test - revisit this choice when XTF supports Arm
+DEFAULT_POPULATE = 'pv64 livepatch-priv-check'
+#----------
+
+import json
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.runtime.decorator.package import OEHasPackage
+
+def xtf_runner_exit_status(state):
+    """ Convert a xtf-runner exit code to a test result. """
+    return { 0: "SUCCESS",
+             1: "sys.exit 1",
+             2: "sys.exit 2",
+             3: "SKIP",
+             4: "ERROR",
+             5: "FAILURE",
+             6: "CRASH",
+    }[state]
+
+xtf_rundir = '/usr/libexec/xtf'
+
+class XTFMinimalTest(OERuntimeTestCase):
+
+    def query_xtf_cases(self, query_item):
+        (status, output) = self.target.run(
+                            'cd %s; ./xtf-runner --list %s' % \
+                            (xtf_rundir, query_item))
+        self.assertTrue(status == 0, msg='XTF runner failed')
+
+        populate_case_lines = output.split('\n')
+        while '' in populate_case_lines:
+            populate_case_lines.remove('')
+
+        return list(map(lambda x: x.lstrip().rstrip(), populate_case_lines))
+
+    def get_xtf_case_list(self):
+        xtf_cases = []
+
+        populate = self.tc.td.get('XTF_TEST_CASES_POPULATE')
+        skip = self.tc.td.get('XTF_TEST_CASES_SKIP')
+        require = self.tc.td.get('XTF_TEST_CASES_REQUIRE')
+
+        if populate is None:
+            populate = DEFAULT_POPULATE
+
+        for query_item in populate.split('|'):
+            xtf_cases.extend( self.query_xtf_cases(query_item) )
+
+        if skip is not None:
+            for skip_item in skip.split(' '):
+                while skip_item in xtf_cases:
+                    xtf_cases.remove(skip_item)
+
+        if require is not None:
+            for require_item in require.split(' '):
+                if require_item == '':
+                    continue
+                if not require_item in xtf_cases:
+                    xtf_cases.append(require_item)
+
+        self.logger.info('XTF cases: %s' % str(xtf_cases))
+        return xtf_cases
+
+    def run_xtf_case(self, xtf_case_name):
+        (status, output) = self.target.run('cd %s; ./xtf-runner %s' % \
+                                           (xtf_rundir, xtf_case_name))
+        self.assertTrue(status == 0, msg='XTF test %s failed: %s' % \
+                        (xtf_case_name, xtf_runner_exit_status(status)))
+
+    @OETimeout(2400)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['xtf'])
+    @OEHasPackage(['xen-tools'])
+    def test_xtf_minimal(self):
+
+        xtf_cases = self.get_xtf_case_list()
+
+        for xtf_case_name in xtf_cases:
+            self.logger.debug('Running XTF case: %s' % xtf_case_name)
+
+            self.run_xtf_case(xtf_case_name)
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index fbdd007..ea596ce 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE:x86-64 = "kernel-module-xen-pciback"
 
 LICENSE = "MIT"
 
-inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
+inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network
 
 do_check_xen_state() {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)}" = "no" ]; then
diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index b73e4a5..a78959d 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -11,9 +11,24 @@ DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hype
 #       ./xtf-runner --list pv
 #       # run an example test:
 #       ./xtf-runner test-pv64-livepatch-priv-check
+#
+# This image also supports the OE QA framework, so XTF tests can be
+# run from bitbake by adding the following (or similar) to local.conf:
+#
+#   INHERIT += "testimage"
+#   QEMU_USE_SLIRP = "1"
+#   TEST_SERVER_IP = "127.0.0.1"
+#
+# and the tests that are configured (see the xtf-oeqa-conf package)
+# can be run with: bitbake -c testimage xtf-image
+#
+# For testimage, see the qemu boot log: ${WORKDIR}/testimage/qemu_boot_log.*
+# and the test log: ${WORKDIR}/temp/log.do_testimage
 
 IMAGE_NAME="xtf"
 
 IMAGE_INSTALL:append = " xtf"
 
+DEFAULT_TEST_SUITES:append = " xtf_minimal"
+
 QB_DEFAULT_FSTYPE_x86-64 = "wic"
-- 
2.25.1


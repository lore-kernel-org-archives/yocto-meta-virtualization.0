Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30575.1606108757083615933
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6DBEB38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:19:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644665"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:19:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 889EF4CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:19:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:19:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-salttesting: upgrade 2015.2.16 -> 2018.9.21
Date: Mon, 23 Nov 2020 23:00:19 +0800
Message-ID: <1606143619-97481-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 889EF4CE1505.A2EAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0001-Add-ptest-output-option-to-test-suite.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-salttesting_2015.2.16.bb    | 24 -------------------
 ...dd-ptest-output-option-to-test-suite.patch | 24 ++++++++++---------
 .../python/python3-salttesting_git.bb         | 20 ++++++++++++++++
 3 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
 rename meta-openstack/recipes-devtools/python/{python-salttesting => python3-salttesting}/0001-Add-ptest-output-option-to-test-suite.patch (94%)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-salttesting_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb b/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
deleted file mode 100644
index d5d1e3e4..00000000
--- a/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Common testing tools used in the Salt Stack projects"
-HOMEPAGE = "https://github.com/saltstack/salt-testing"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
-SRCNAME = "salt-testing"
-
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
-
-SRC_URI = "https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz \
-           file://0001-Add-ptest-output-option-to-test-suite.patch \
-           "
-SRC_URI[md5sum] = "8ca55a796e9ad7ba72bc143043753ccf"
-SRC_URI[sha256sum] = "0ef4be6a8a9b505ae1c328394dfad50493674af6100c7e2c220f374533d86edc"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-RDEPENDS_${PN} = "\
-                  python-mock \
-                  python-unittest \
-"
-
-inherit setuptools3
-
diff --git a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch b/meta-openstack/recipes-devtools/python/python3-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
similarity index 94%
rename from meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
rename to meta-openstack/recipes-devtools/python/python3-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
index e86768a1..f1628a3d 100644
--- a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
+++ b/meta-openstack/recipes-devtools/python/python3-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
@@ -1,6 +1,6 @@
-From 1950b943b7173198f345a1cff7b7f771cbac2244 Mon Sep 17 00:00:00 2001
-From: Collin Richards <collin.richards@ni.com>
-Date: Tue, 28 Jun 2016 16:02:22 -0500
+From 61ba63c3cde920873b8df48b950b8ebb79158346 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Thu, 19 Nov 2020 11:20:58 +0900
 Subject: [PATCH] Add ptest output option to test suite
 
 Extend salttesting to support outputing the results of running the test
@@ -9,26 +9,28 @@ suite in ptest format.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Collin Richards <collin.richards@ni.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+
 Natinst-ReviewBoard-ID: 143279
 ---
  salttesting/parser/__init__.py |  12 +++
- salttesting/ptest.py           | 165 +++++++++++++++++++++++++++++++++++++++++
+ salttesting/ptest.py           | 165 +++++++++++++++++++++++++++++++++
  2 files changed, 177 insertions(+)
  create mode 100644 salttesting/ptest.py
 
 diff --git a/salttesting/parser/__init__.py b/salttesting/parser/__init__.py
-index 1e7275b..d8cba0c 100644
+index d752acf..b41e5ea 100644
 --- a/salttesting/parser/__init__.py
 +++ b/salttesting/parser/__init__.py
-@@ -25,6 +25,7 @@ from functools import partial
- from contextlib import closing
+@@ -28,6 +28,7 @@ from contextlib import closing
  
+ import six
  from salttesting import TestLoader, TextTestRunner
 +from salttesting.ptest import PTestRunner
+ from salttesting import helpers
  from salttesting.version import __version_info__
  from salttesting.xmlunit import HAS_XMLRUNNER, XMLTestRunner
- try:
-@@ -264,6 +265,12 @@ class SaltTestingParser(optparse.OptionParser):
+@@ -277,6 +278,12 @@ class SaltTestingParser(optparse.OptionParser):
              action='store_true',
              help='Do NOT show the overall tests result'
          )
@@ -41,7 +43,7 @@ index 1e7275b..d8cba0c 100644
          self.add_option_group(self.output_options_group)
  
          self.fs_cleanup_options_group = optparse.OptionGroup(
-@@ -491,6 +498,11 @@ class SaltTestingParser(optparse.OptionParser):
+@@ -531,6 +538,11 @@ class SaltTestingParser(optparse.OptionParser):
                  verbosity=self.options.verbosity
              ).run(tests)
              self.testsuite_results.append((header, runner))
@@ -225,5 +227,5 @@ index 0000000..4c50f57
 +        self.stream.writeln()
 +        return result
 -- 
-2.13.2
+2.25.1
 
diff --git a/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
new file mode 100644
index 00000000..34476219
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Common testing tools used in the Salt Stack projects"
+HOMEPAGE = "https://github.com/saltstack/salt-testing"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
+
+SRC_URI = "git://github.com/saltstack/salt-testing.git;branch=develop;tag=v2018.9.21 \
+           file://0001-Add-ptest-output-option-to-test-suite.patch \
+           "
+
+PV = "2018.9.21+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "\
+                  python3-mock \
+                  python3-unittest \
+"
+
+inherit setuptools3
-- 
2.25.1




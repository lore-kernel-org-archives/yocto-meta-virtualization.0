Return-Path: <Catalin.Enache@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 002ECE00E50; Wed, 27 Jul 2016 03:26:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFD42E00D56
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jul 2016 03:26:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RAQIRU008029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jul 2016 03:26:18 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 03:26:18 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Jul 2016 13:32:36 +0300
Message-ID: <1469615556-26188-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libvirt: add missing configuration file
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
X-List-Received-Date: Wed, 27 Jul 2016 10:26:25 -0000
Content-Type: text/plain

openvzutilstest.conf file is needed by openvzutilstest test

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../libvirt/libvirt/install-missing-file.patch     | 44 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.3.2.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/install-missing-file.patch

diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/recipes-extended/libvirt/libvirt/install-missing-file.patch
new file mode 100644
index 0000000..f6f6e25
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
@@ -0,0 +1,44 @@
+From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 25 Jul 2016 16:38:51 +0300
+Subject: [PATCH] Install missing conf file
+
+openvzutilstest.conf file is needed by openvzutilstest test.
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ tests/Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 02e0dd8..187fbca 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -155,6 +155,7 @@ EXTRA_DIST =		\
+ 	xml2vmxdata
+ 
+ test_helpers = commandhelper ssh test_conf
++test_misc =
+ test_programs = virshtest sockettest \
+ 	nodeinfotest virbuftest \
+ 	commandtest seclabeltest \
+@@ -259,6 +260,7 @@ endif WITH_LXC
+ 
+ if WITH_OPENVZ
+ test_programs += openvzutilstest
++test_misc += openvzutilstest.conf
+ endif WITH_OPENVZ
+ 
+ if WITH_ESX
+@@ -1293,7 +1295,7 @@ endif ! WITH_CIL
+ 
+ buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
+ 
+-PTESTS = $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh
++PTESTS = $(TESTS) $(test_helpers) $(test_misc) test-lib.sh schematestutils.sh
+ 
+ install-ptest:
+ 	list='$(TESTS) $(test_helpers) test-lib.sh schematestutils.sh'
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb b/recipes-extended/libvirt/libvirt_1.3.2.bb
index 42066c1..0da768e 100644
--- a/recipes-extended/libvirt/libvirt_1.3.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
            file://0001-to-fix-build-error.patch \
            file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
+           file://install-missing-file.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "b48b06bbc7efbe9973ed0f3f223d6da2"
-- 
2.7.4



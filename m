Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B62A7E00A6D; Sun,  4 Sep 2016 23:53:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B8CBE009F8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  4 Sep 2016 23:53:28 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u856rR1u026259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 4 Sep 2016 23:53:27 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 4 Sep 2016 23:53:26 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 5 Sep 2016 14:52:49 +0800
Message-ID: <1473058369-7710-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libvirt: Add missing test helpers and remove windows 1252
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
X-List-Received-Date: Mon, 05 Sep 2016 06:53:32 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Add missing test helpers
We don't support windows encoding so remove that case

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...move-Windows-1252-check-from-esxutilstest.patch | 28 +++++++++++++++++++++
 .../0001-ptest-add-missing-test_helper-files.patch | 29 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.3.5.bb          |  2 ++
 3 files changed, 59 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch b/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
new file mode 100644
index 0000000..217bdbc
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
@@ -0,0 +1,28 @@
+From ffc71da15c3da068f85d16617b6e0c0175fc0110 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 23 Aug 2016 02:28:47 -0400
+Subject: [PATCH] ptest: Remove Windows-1252 check from esxutilstest
+
+Currently we use iconv from glibc-locale and it does not support
+Windows-1252 and we don't need support windows character encoding.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tests/esxutilstest.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/esxutilstest.c b/tests/esxutilstest.c
+index 44bdc84..3223de3 100644
+--- a/tests/esxutilstest.c
++++ b/tests/esxutilstest.c
+@@ -258,7 +258,6 @@ mymain(void)
+     DO_TEST(ParseDatastorePath);
+     DO_TEST(ConvertDateTimeToCalendarTime);
+     DO_TEST(EscapeDatastoreItem);
+-    DO_TEST(ConvertWindows1252ToUTF8);
+ 
+     return result == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
+ }
+-- 
+2.8.1
+
diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch b/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch
new file mode 100644
index 0000000..b4f1e27
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch
@@ -0,0 +1,29 @@
+From e625a42caca492fe7d52b70bbbf83ae4d99cb15e Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 23 Aug 2016 02:16:20 -0400
+Subject: [PATCH] ptest: add missing test_helper files
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tests/Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1c85656..2f8b9eb 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1422,8 +1422,10 @@ install-ptest:
+ 	@(for file in $(PTESTS); do \
+ 		if [ -f .libs/$$file ]; then \
+ 			install .libs/$$file $(DEST_DIR)/tests; \
+-		else \
++		elif [ -f $(srcdir)/$$file ]; then \
+ 			install $(srcdir)/$$file $(DEST_DIR)/tests; \
++		else \
++			install $(builddir)/$$file $(DEST_DIR)/tests; \
+ 		fi; \
+ 	done;)
+ 	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
+-- 
+2.8.1
+
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index 7271ebe..3eff58d 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -35,6 +35,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://install-missing-file.patch \
            file://0001-nsslinktest-also-build-virAtomic.h.patch \
            file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
+           file://0001-ptest-add-missing-test_helper-files.patch \
+           file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
-- 
2.8.3



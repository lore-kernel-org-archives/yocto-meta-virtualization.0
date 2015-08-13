Return-Path: <Jim.Somerville@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBBB9E00978; Thu, 13 Aug 2015 07:59:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26568E0096A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 07:59:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7DEx5qm027773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 07:59:05 -0700 (PDT)
Received: from yow-dellw-js.wrs.com (128.224.56.30) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 07:59:05 -0700
From: Jim Somerville <Jim.Somerville@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 13 Aug 2015 10:59:04 -0400
Message-ID: <1439477944-17425-1-git-send-email-Jim.Somerville@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] lxc: doc: fix broken manpage build
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
X-List-Received-Date: Thu, 13 Aug 2015 14:59:09 -0000
Content-Type: text/plain

docbook2man fails to build the man pages in poky
due to missing the ancient Davenport 3.0 DTD.
Poky meta has the Oasis 3.1 version so upgrade
to use that instead.

Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
---
 .../lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch   | 32 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_1.1.2.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch

diff --git a/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch
new file mode 100644
index 0000000..5f9d771
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch
@@ -0,0 +1,32 @@
+From 4cf207ffd64c6f815e62ecbbf25b5a378e707182 Mon Sep 17 00:00:00 2001
+Message-Id: <4cf207ffd64c6f815e62ecbbf25b5a378e707182.1439319694.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Tue, 11 Aug 2015 14:05:00 -0400
+Subject: [PATCH 1/1] lxc: doc: upgrade to use docbook 3.1 DTD
+
+docbook2man fails to build the man pages in poky
+due to missing the ancient Davenport 3.0 DTD.
+Poky meta has the Oasis 3.1 version so upgrade
+to use that instead.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4972803..2e67b5e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -179,7 +179,7 @@ AM_CONDITIONAL([ENABLE_DOCBOOK], [test "x$db2xman" != "x"])
+ AM_CONDITIONAL([USE_DOCBOOK2X], [test "x$db2xman" != "xdocbook2man"])
+ 
+ if test "x$db2xman" = "xdocbook2man"; then
+-	docdtd="\"-//Davenport//DTD DocBook V3.0//EN\""
++	docdtd="\"-//OASIS//DTD DocBook V3.1//EN\""
+ else
+ 	docdtd="\"-//OASIS//DTD DocBook XML\" \"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\""
+ fi
+-- 
+1.8.3.2
+
diff --git a/recipes-containers/lxc/lxc_1.1.2.bb b/recipes-containers/lxc/lxc_1.1.2.bb
index 77d226b..7bbae88 100644
--- a/recipes-containers/lxc/lxc_1.1.2.bb
+++ b/recipes-containers/lxc/lxc_1.1.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-busybox-add-OpenSSH-support.patch \
 	file://make-some-OpenSSH-tools-optional.patch \
 	file://Generate-lxc-restore-net-properly.patch \
+	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	"
 
 SRC_URI[md5sum] = "3ebadacf5fe8bfe689fd7a09812b682c"
-- 
1.8.3.2



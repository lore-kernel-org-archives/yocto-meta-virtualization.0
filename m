Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26AF4E00D44; Tue, 25 Jun 2019 12:04:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2265E00BAF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jun 2019 12:04:11 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5PJ475r001310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jun 2019 12:04:07 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 25 Jun 2019 12:04:07 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 25 Jun 2019 12:04:07 -0700
Message-ID: <20190625190407.29291-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][PATCH 1/1] irqbalance: use git repo for source
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
X-List-Received-Date: Tue, 25 Jun 2019 19:04:12 -0000
Content-Type: text/plain

Avoid src-uri-bad qa warning when getting source from github.com/../archive.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/irqbalance/irqbalance_1.5.0.bb | 14 --------------
 recipes-extended/irqbalance/irqbalance_git.bb   | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 14 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance_1.5.0.bb
 create mode 100644 recipes-extended/irqbalance/irqbalance_git.bb

diff --git a/recipes-extended/irqbalance/irqbalance_1.5.0.bb b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
deleted file mode 100644
index f73b106..0000000
--- a/recipes-extended/irqbalance/irqbalance_1.5.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Copyright (C) 2015 Wind River Systems, Inc.
-#
-
-require irqbalance.inc
-
-SRC_URI[md5sum] = "3daa34066d28e2ff44fdac9c39952822"
-SRC_URI[sha256sum] = "3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b"
-
-SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
-           file://add-initscript.patch \
-           file://irqbalance-Add-status-and-reload-commands.patch \
-           file://irqbalanced.service \
-          "
diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
new file mode 100644
index 0000000..0571b1b
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -0,0 +1,18 @@
+#
+# Copyright (C) 2015 Wind River Systems, Inc.
+#
+
+require irqbalance.inc
+
+# commit tagged as version 1.5.0
+#
+SRCREV = "e783d132e96a7ccc2a60ac8b87802ab782bb27be"
+PV = "1.5.0"
+
+SRC_URI = "git://github.com/Irqbalance/irqbalance \
+           file://add-initscript.patch \
+           file://irqbalance-Add-status-and-reload-commands.patch \
+           file://irqbalanced.service \
+          "
+
+S = "${WORKDIR}/git"
-- 
2.7.4



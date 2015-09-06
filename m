Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28EF2E00B2B; Sat,  5 Sep 2015 23:53:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E224EE00B2B
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Sep 2015 23:52:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t866qxmV009954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 5 Sep 2015 23:52:59 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sat, 5 Sep 2015 23:52:59 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 6 Sep 2015 14:43:26 +0800
Message-ID: <1441521806-12787-3-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] irqbalance: upgrade 1.0.6 -> 1.0.9
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
X-List-Received-Date: Sun, 06 Sep 2015 06:53:02 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-extended/irqbalance/irqbalance_1.0.6.bb | 17 -----------------
 recipes-extended/irqbalance/irqbalance_1.0.9.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance_1.0.6.bb
 create mode 100644 recipes-extended/irqbalance/irqbalance_1.0.9.bb

diff --git a/recipes-extended/irqbalance/irqbalance_1.0.6.bb b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
deleted file mode 100644
index 76c08a1..0000000
--- a/recipes-extended/irqbalance/irqbalance_1.0.6.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-
-require irqbalance.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "b73b1a5a9e1c3c428ae39024c711e41e"
-SRC_URI[sha256sum] = "95ac79992e6de501f613c781b0fc8aa17a4aaf6a3d865bb6e15ac6a46c6ab1fd"
-
-SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
-           file://add-initscript.patch \
-           file://irqbalance-Add-status-and-reload-commands.patch \
-           file://fix-configure-libcap-ng.patch \
-           file://irqbalanced.service \
-          "
diff --git a/recipes-extended/irqbalance/irqbalance_1.0.9.bb b/recipes-extended/irqbalance/irqbalance_1.0.9.bb
new file mode 100644
index 0000000..fc91aa7
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance_1.0.9.bb
@@ -0,0 +1,15 @@
+#
+# Copyright (C) 2015 Wind River Systems, Inc.
+#
+
+require irqbalance.inc
+
+SRC_URI[md5sum] = "30174d3941c5452a1e4ecee394a76ff8"
+SRC_URI[sha256sum] = "f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3"
+
+SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v1.0.9.tar.gz;downloadfilename=irqbalance-1.0.9.tar.gz \
+           file://add-initscript.patch \
+           file://irqbalance-Add-status-and-reload-commands.patch \
+           file://fix-configure-libcap-ng.patch \
+           file://irqbalanced.service \
+          "
-- 
1.9.1



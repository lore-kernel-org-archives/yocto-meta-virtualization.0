Return-Path: <vlsireddy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3A7CE00C77; Mon, 13 Nov 2017 18:57:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (vlsireddy[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43515E009B4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 18:57:27 -0800 (PST)
Received: by mail-qt0-f179.google.com with SMTP id r39so6070157qtr.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OHPXvwdtdT/IsjJjaqgmH43Op6PLoB8mYNXPvgWnYfI=;
	b=CNKw6bnPv53KzMn0GfabKsfWz8iW1489QmGrOIQtYf9euZfTS1riWgQKhKdikycEZC
	LQpwYUyvVhwcK8tRcQRGHWG0QIdwGetx+bt3wGdL1EqlpmSM4SxUkxr/1fPCTQ2r3Qu8
	KcZ9SjYb9AeNhS7mok6NBJRoSk29H/YF8uf8cvOxl2r00L6r6LJpNIfwgmDxnToo8i5H
	tkcSATZS3NqrJuNpqsOLCQ/x12r6zmseWfM+WbipOYI42Hk88re5jx7CNkLLfcDFTk2B
	XV8tF/V8gLb5imavvAV4Sgm2kmro73P7MMCqdu6lEE7mxk6AkCQ6NN98OG5ccjakIIoB
	u6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OHPXvwdtdT/IsjJjaqgmH43Op6PLoB8mYNXPvgWnYfI=;
	b=omIQVMbvyIr+3lCd0efct5DN3NzohrJlISf36jI0aEP7WOlyuilMjx+dpWrkQG1ZLf
	8pJ1b3FcsP4oZvtn1eOcj/38T6PuLCsY2cxb+fp0xZLy1H/21rLMReeI2GrLvwX/xLzl
	Y/SWEkwO8WvpGgkAgupO0MGCPCBidgYDjByy27RhP5gsASvS537JvT5aVTx+P1MV5Lfy
	oW+nvX8coNiutKGv8Ljh65AwMugwwdj651Oy0tCIFRBSYtJ++K5scy2yJYDrrAPkZONK
	ZjslqZu2axtWikwR9zNEzDXpE07OTbf+fkLKD1kkKegGkameleMXq6ft1o5UJyBAA3aE
	QBBg==
X-Gm-Message-State: AJaThX7oe0zmn4424XtBdUrnVn6jljiBWElZw7ImPQbU6VrZ5AHMngLg
	o6eRGNRm5CbjiXleOZnKqdSVsA==
X-Google-Smtp-Source: AGs4zMZsKr9jYfFoKrFWmQUCmgxUyYBtEZEAdtC2HM2TBIbEcF7F86g6R+CPSflIbTpHDl4yt2onQg==
X-Received: by 10.200.24.235 with SMTP id o40mr15331086qtk.91.1510628246741;
	Mon, 13 Nov 2017 18:57:26 -0800 (PST)
Received: from airvana.wirelessworld.airvananet.com
	(host-131-239-32-100.customer.veroxity.net. [131.239.32.100])
	by smtp.gmail.com with ESMTPSA id
	x3sm11651068qke.82.2017.11.13.18.57.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 18:57:25 -0800 (PST)
From: RC Reddy <vlsireddy@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 13 Nov 2017 21:58:10 -0500
Message-Id: <1510628290-9038-1-git-send-email-vlsireddy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: RC Reddy <vlsireddy@gmail.com>
Subject: [[PATCH]irqbalance updated to 1.3.0] irqbalance: fix compilation errors
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
X-List-Received-Date: Tue, 14 Nov 2017 02:57:29 -0000

Fixed issues:

New features in this release:[From Neil Horman]
=================================
optimization of platform device irq detection
Added sample udev rules to trigger irq rescans on device add/remove
Made irqbalance ui an optional compile component
Added support for Intel CoD
Add -v | --version option to command line

Bug fixes in this release:
==================================
Misc compiler warning fixes and spelling errors
Compilation error fix on aarch64
Compilation error fix when using clang in c99 mode
Unused variable cleanup
Lots of memory leak cleanup in irqbalance-ui
Prevent irqbalance from running in a container
Fix irq affinity assignment in some cases to wrong numa node
Fix oneshot mode
exclude legacy irq 255

Deprecations:
=================================
without-glib2 is removed, we just need it enough that we can't dummy it up anymore

Tested:
================================
Tested on AARCH64 and it compiles
---
 recipes-extended/irqbalance/irqbalance_1.1.0.bb | 15 ---------------
 recipes-extended/irqbalance/irqbalance_1.3.0.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance_1.1.0.bb
 create mode 100644 recipes-extended/irqbalance/irqbalance_1.3.0.bb

diff --git a/recipes-extended/irqbalance/irqbalance_1.1.0.bb b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
deleted file mode 100644
index 16efa95..0000000
--- a/recipes-extended/irqbalance/irqbalance_1.1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Copyright (C) 2015 Wind River Systems, Inc.
-#
-
-require irqbalance.inc
-
-SRC_URI[md5sum] = "b15d975336080bcac4be0c1752d43cf3"
-SRC_URI[sha256sum] = "91506e638b03bf27cf5da7dc250d58a753ce8a0288a20265fc7ff0266040706b"
-
-SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
-           file://add-initscript.patch \
-           file://irqbalance-Add-status-and-reload-commands.patch \
-           file://fix-configure-libcap-ng.patch \
-           file://irqbalanced.service \
-          "
diff --git a/recipes-extended/irqbalance/irqbalance_1.3.0.bb b/recipes-extended/irqbalance/irqbalance_1.3.0.bb
new file mode 100644
index 0000000..5581a8b
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance_1.3.0.bb
@@ -0,0 +1,15 @@
+#
+# Copyright (C) 2015 Wind River Systems, Inc.
+#
+
+require irqbalance.inc
+
+SRC_URI[md5sum] = "53ee393adcfbc8e5ab23cbbd920df687"
+SRC_URI[sha256sum] = "41c2c0842d8fb24240d8069b389cd8d1669625a40009a17ad886967845dc6e43"
+
+SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
+           file://add-initscript.patch \
+           file://irqbalance-Add-status-and-reload-commands.patch \
+           file://fix-configure-libcap-ng.patch \
+           file://irqbalanced.service \
+          "
-- 
1.9.1



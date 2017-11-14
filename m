Return-Path: <vlsireddy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E609E00D24; Tue, 14 Nov 2017 13:14:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (vlsireddy[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58A56E00D07
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 13:14:38 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id p44so18879394qtj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 13:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tuk3V/LKnTPWX6B6VeuKD0qFsPfGGyGir5vIMt/pofU=;
	b=TAnkB4Ib9nrqOfLtBcDLWjyHJl3Px5wx6DJHvJeKi2cmeHBG91n9PAP9T3DjZT6DE9
	Q+wMeQu+OPos5xK+5BYCfAdIAtvSNHdyGDvpVVvSIGWQOUe+R1CJWYG5rkJLHbkG26Mk
	762l7f9Pnyee5EeR/8gorIdiiyCOm8F8Fs/MGzbAqp8b3AHXKxOykOLKU/Yi63ZpXCq1
	hyLFyPe0bSOPPwKw+eRoW+4JF0ry9jfgpO6uHsa2i7uz/+n59lE2tVZ0kyg0P+UUUXX+
	odGq9qXDXWiVYYqL38NOX0t6yEHIb7a/76OXOjgc5hvYaE/DkTX0s+k1DC9P1OpCAN2W
	ARAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tuk3V/LKnTPWX6B6VeuKD0qFsPfGGyGir5vIMt/pofU=;
	b=a7c1oKOPqBOBqWpjAXliquZh9pzWPZr9TyeqE5bguXWdiUT9mh+vjfhHb10qjsD/RH
	vcgnmClNthdZmRyTus3hSaUU8cHNvrH5TYIrx1fIMk7YrKsTtLMjB+vuBEhrn0Z/a9P2
	//7sxR3Itm3iy5dStEokqAAJRM/Q1hTkYywGsohnzWZG8krr7Bx/+OuLg170MQHKQjKP
	Dk4zhE9qUPIVqSoGqSZ7gA5bnMbs311hhUvvZJwSjXUo/ppklGp/LVMkmc/snW0FO9r+
	sEpGeUBoCUDezbRu6tkzM36ZcsWLodr4QNKaO33XABlePOcg4aMvDo3sp2FsgyuWXduK
	/lQg==
X-Gm-Message-State: AJaThX7KaR00nVKFViBAEaxl57ilKOV3vzHIR6+LiuapbIM+qaSbIN6x
	WtUZYWDaB0GiyvyPq8sZOOR6nQ==
X-Google-Smtp-Source: AGs4zMY1qQfQvRUQ8CGigYEVT3xSbHbrzwu+uinTWF1+086lt+mDOCp/TK3yhRDjuMWAtzOM/knoPQ==
X-Received: by 10.55.188.6 with SMTP id m6mr21926982qkf.312.1510694077915;
	Tue, 14 Nov 2017 13:14:37 -0800 (PST)
Received: from airvana.wirelessworld.airvananet.com
	(host-131-239-32-100.customer.veroxity.net. [131.239.32.100])
	by smtp.gmail.com with ESMTPSA id
	o70sm13157384qki.35.2017.11.14.13.14.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 13:14:36 -0800 (PST)
From: RC Reddy <vlsireddy@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 14 Nov 2017 16:15:20 -0500
Message-Id: <1510694120-11068-1-git-send-email-vlsireddy@gmail.com>
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
X-List-Received-Date: Tue, 14 Nov 2017 21:14:40 -0000

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

Signed-off-by: RC Reddy <vlsireddy@gmail.com>
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



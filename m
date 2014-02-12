Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18CCBE0079A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 18:45:12 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WDPnF-0002v3-Lc; Wed, 12 Feb 2014 02:43:23 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WDPox-0005W6-Uq; Wed, 12 Feb 2014 02:45:07 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Wed, 12 Feb 2014 02:45:06 +0000
Message-Id: <1392173107-21170-3-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392173107-21170-1-git-send-email-flihp@twobit.us>
References: <1392173107-21170-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [RFC 2/3] xen: Split Xen PCI kernel config into dom0 / guest VM.
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
X-List-Received-Date: Wed, 12 Feb 2014 02:45:12 -0000

Dom0 kernel builds the PCI backend drive in directly and omits the
frontend driver (what would be its backend?). The guest kernel builds
the frontend in and the backend gets built as a module.

Signed-off-by: Philip Tricca <flihp@twobit.us>

diff --git a/recipes-kernel/linux/linux-yocto/xen-common.cfg b/recipes-kernel/linux/linux-yocto/xen-common.cfg
index 4e796b9..56ab040 100644
--- a/recipes-kernel/linux/linux-yocto/xen-common.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen-common.cfg
@@ -17,8 +17,6 @@ CONFIG_XEN_MAX_DOMAIN_MEMORY=500
 CONFIG_XEN_SAVE_RESTORE=y
 CONFIG_PARAVIRT_CLOCK=y
 CONFIG_HIBERNATE_CALLBACKS=y
-CONFIG_PCI_XEN=y
-CONFIG_XEN_PCIDEV_FRONTEND=y
 CONFIG_SYS_HYPERVISOR=y
 CONFIG_XEN_BLKDEV_FRONTEND=y
 CONFIG_XEN_BLKDEV_BACKEND=m
@@ -47,7 +45,6 @@ CONFIG_XEN_XENBUS_FRONTEND=y
 CONFIG_XEN_GNTDEV=m
 CONFIG_XEN_GRANT_DEV_ALLOC=m
 CONFIG_SWIOTLB_XEN=y
-CONFIG_XEN_PCIDEV_BACKEND=m
 CONFIG_XEN_PRIVCMD=y
 CONFIG_XEN_ACPI_PROCESSOR=m
 CONFIG_XEN_MCE_LOG=y
diff --git a/recipes-kernel/linux/linux-yocto/xen-dom0.cfg b/recipes-kernel/linux/linux-yocto/xen-dom0.cfg
index e69de29..422b769 100644
--- a/recipes-kernel/linux/linux-yocto/xen-dom0.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen-dom0.cfg
@@ -0,0 +1,2 @@
+CONFIG_XEN_PCIDEV_BACKEND=y
+CONFIG_XEN_PCIDEV_FRONTEND=n
diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
index e69de29..edf1748 100644
--- a/recipes-kernel/linux/linux-yocto/xen-guest.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
@@ -0,0 +1,2 @@
+CONFIG_XEN_PCIDEV_BACKEND=m
+CONFIG_XEN_PCIDEV_FRONTEND=y
-- 
1.7.10.4



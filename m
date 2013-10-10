Return-Path: <cjp256@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CA0BE015DA
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Oct 2013 19:23:25 -0700 (PDT)
Received: by mail-qa0-f43.google.com with SMTP id f11so122034qae.16
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Oct 2013 19:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o29gFRuVBLpkuBp3twWdYy6GTbsZjeGHtppeIaw5V9U=;
	b=x91GfY1XQZuDUiQizq5wdf6Bj5EaYaOyZk9ovvkmTSv13eVihPCq/WXnQ5QSH5LoO6
	s2IHCet2zCRp+boRW2Jo8txWK7Uzbo9iRyrWuNU9gWqgj4y2KcDY1hc6weO8CwFgl35t
	BtY0C3xPqDcJzIEyN5ZqqrtRmpLb0rxOvwNesrMt56o6WBOPvrqLP3cibMLtVF8Reeib
	WT3LO+H8zXQNlvr9rY58t8vzWfC7yA/NQyHJKxmILQpiKdqFsu0CokHUbQo0T1VEbx7o
	3Pc+8GJkCcrwRM+UXEDQP/5zl4y/krqff4sjxPaztpN9442O/mrUYxsxNj43uZrZX6C+
	eQ+w==
X-Received: by 10.49.62.137 with SMTP id y9mr850949qer.59.1381371804626;
	Wed, 09 Oct 2013 19:23:24 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id h6sm82159945qej.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 19:23:24 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Oct 2013 22:22:49 -0400
Message-Id: <1381371771-12021-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
References: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 1/3] linux-yocto/xen: update fragment to support both dom0 and typical xen guests.
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
X-List-Received-Date: Thu, 10 Oct 2013 02:23:25 -0000

Updated linux kernel fragment to match defaults as defined in the 3.10 kernel's Kconfig files.  If defaults were not specified, modules were were used unless required by another built-in option.  As such, The core frontend drivers are included by default and the backend drivers are built as modules.

This allows privileged, PV, HVM, and PVHVM guests to work properly without additional kernel configuration or modules required in initramfs (from a Xen support perspective).

This also removes CONFIG_KVM_GUEST which was erroneously included previously.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto/xen.cfg       | 13 ++++++-------
 recipes-kernel/linux/linux-yocto/xen.scc       |  4 ++--
 recipes-kernel/linux/linux-yocto_3.10.bbappend |  2 +-
 recipes-kernel/linux/linux-yocto_3.4.bbappend  |  2 +-
 recipes-kernel/linux/linux-yocto_3.8.bbappend  |  2 +-
 5 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
index e7d774e..4e796b9 100644
--- a/recipes-kernel/linux/linux-yocto/xen.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
@@ -15,15 +15,14 @@ CONFIG_XEN_PRIVILEGED_GUEST=y
 CONFIG_XEN_PVHVM=y
 CONFIG_XEN_MAX_DOMAIN_MEMORY=500
 CONFIG_XEN_SAVE_RESTORE=y
-CONFIG_KVM_GUEST=y
 CONFIG_PARAVIRT_CLOCK=y
 CONFIG_HIBERNATE_CALLBACKS=y
 CONFIG_PCI_XEN=y
-CONFIG_XEN_PCIDEV_FRONTEND=m
+CONFIG_XEN_PCIDEV_FRONTEND=y
 CONFIG_SYS_HYPERVISOR=y
-CONFIG_XEN_BLKDEV_FRONTEND=m
+CONFIG_XEN_BLKDEV_FRONTEND=y
 CONFIG_XEN_BLKDEV_BACKEND=m
-CONFIG_XEN_NETDEV_FRONTEND=m
+CONFIG_XEN_NETDEV_FRONTEND=y
 CONFIG_XEN_NETDEV_BACKEND=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
@@ -39,9 +38,9 @@ CONFIG_FB_DEFERRED_IO=y
 CONFIG_XEN_FBDEV_FRONTEND=y
 CONFIG_XEN_BALLOON=y
 CONFIG_XEN_SCRUB_PAGES=y
-CONFIG_XEN_DEV_EVTCHN=m
+CONFIG_XEN_DEV_EVTCHN=y
 CONFIG_XEN_BACKEND=y
-CONFIG_XENFS=m
+CONFIG_XENFS=y
 CONFIG_XEN_COMPAT_XENFS=y
 CONFIG_XEN_SYS_HYPERVISOR=y
 CONFIG_XEN_XENBUS_FRONTEND=y
@@ -49,7 +48,7 @@ CONFIG_XEN_GNTDEV=m
 CONFIG_XEN_GRANT_DEV_ALLOC=m
 CONFIG_SWIOTLB_XEN=y
 CONFIG_XEN_PCIDEV_BACKEND=m
-CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_PRIVCMD=y
 CONFIG_XEN_ACPI_PROCESSOR=m
 CONFIG_XEN_MCE_LOG=y
 CONFIG_XEN_HAVE_PVMMU=y
diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel/linux/linux-yocto/xen.scc
index 6c68bda..b588e5d 100644
--- a/recipes-kernel/linux/linux-yocto/xen.scc
+++ b/recipes-kernel/linux/linux-yocto/xen.scc
@@ -1,4 +1,4 @@
-define KFEATURE_DESCRIPTION "Xen Dom0 Support"
-define KFEATURE_COMPATIBILITY board
+define KFEATURE_DESCRIPTION "Xen Kernel Support"
+define KFEATURE_COMPATIBILITY arch
 
 kconf non-hardware xen.cfg
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index cc7fd98..c029c05 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -15,5 +15,5 @@ module_autoload_kvm-intel = "kvm-intel"
 # aufs kernel support required for xen-image-minimal
 KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
-# xen dom0 kernel support
+# xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 448d57f..bf84725 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -12,5 +12,5 @@ module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
 
-# xen dom0 kernel support
+# xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index cc7fd98..c029c05 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -15,5 +15,5 @@ module_autoload_kvm-intel = "kvm-intel"
 # aufs kernel support required for xen-image-minimal
 KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
-# xen dom0 kernel support
+# xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.8.4.rc3



Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7752FE01680
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2013 14:22:51 -0700 (PDT)
Received: by mail-ie0-f172.google.com with SMTP id x13so14168336ief.17
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Oct 2013 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kdYs/2Sfi8ygjaBEptoXL0db+nzTWFrxYXuiUKnZTgg=;
	b=D0BbwBtL053SlNbz8aknYYcKaqXGHaUM9HHUWPiePJaxuNrwAtEbq/zMa+aXcb4u75
	iIOPNkoMdyaZa4ud5t/C9MGKWLY4yYjydAbeJVs8IJEe9D6EPM95P95WyLQdJTVJrbTf
	Vyp5p90qDA9TOSp3i7jSimjZK8CIVZSYuSl269tKwji7/Al0FM6DmStu8acLATz42OHQ
	IH3CKKYoAw1aFOeL4Tz/Pru9ueoz2bruuy1rm0ep978/VnMbG0I7JyB9nwLrDUG7/NYm
	Azsl+/WV6aOoJKJy98UINNr3ggNYhCmCnnk+R6yRF8P8t0jftdzJX4vIlIQz5BBSlbMW
	c7Fw==
X-Received: by 10.50.238.196 with SMTP id vm4mr14460130igc.43.1381094570410;
	Sun, 06 Oct 2013 14:22:50 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id i3sm22631061igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 14:22:49 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2013 17:22:13 -0400
Message-Id: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] linux-yocto: Add xen guest kernel fragment support for PV/HVM guests, using 'xen-guest' distro flag.
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
X-List-Received-Date: Sun, 06 Oct 2013 21:22:53 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto/xen-guest.cfg | 55 ++++++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen-guest.scc |  4 ++
 recipes-kernel/linux/linux-yocto_3.10.bbappend |  3 ++
 recipes-kernel/linux/linux-yocto_3.4.bbappend  |  3 ++
 recipes-kernel/linux/linux-yocto_3.8.bbappend  |  3 ++
 5 files changed, 68 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc

diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
new file mode 100644
index 0000000..cbde3cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
@@ -0,0 +1,55 @@
+###
+# linux 3.4, 3.8
+CONFIG_PARAVIRT_GUEST=y
+###
+
+###
+# linux 3.10
+CONFIG_HYPERVISOR_GUEST=y
+###
+
+CONFIG_PARAVIRT=y
+CONFIG_XEN=y
+CONFIG_XEN_DOM0=y
+CONFIG_XEN_PRIVILEGED_GUEST=y
+CONFIG_XEN_PVHVM=y
+CONFIG_XEN_MAX_DOMAIN_MEMORY=500
+CONFIG_XEN_SAVE_RESTORE=y
+CONFIG_KVM_GUEST=y
+CONFIG_PARAVIRT_CLOCK=y
+CONFIG_HIBERNATE_CALLBACKS=y
+CONFIG_PCI_XEN=y
+CONFIG_XEN_PCIDEV_FRONTEND=m
+CONFIG_SYS_HYPERVISOR=y
+CONFIG_XEN_BLKDEV_FRONTEND=y
+CONFIG_XEN_BLKDEV_BACKEND=m
+CONFIG_XEN_NETDEV_FRONTEND=y
+CONFIG_XEN_NETDEV_BACKEND=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
+CONFIG_HVC_IRQ=y
+CONFIG_HVC_XEN=y
+CONFIG_HVC_XEN_FRONTEND=y
+CONFIG_XEN_WDT=m
+CONFIG_FB_SYS_FILLRECT=y
+CONFIG_FB_SYS_COPYAREA=y
+CONFIG_FB_SYS_IMAGEBLIT=y
+CONFIG_FB_SYS_FOPS=y
+CONFIG_FB_DEFERRED_IO=y
+CONFIG_XEN_FBDEV_FRONTEND=y
+CONFIG_XEN_BALLOON=y
+CONFIG_XEN_SCRUB_PAGES=y
+CONFIG_XEN_DEV_EVTCHN=y
+CONFIG_XEN_BACKEND=y
+CONFIG_XENFS=y
+CONFIG_XEN_COMPAT_XENFS=y
+CONFIG_XEN_SYS_HYPERVISOR=y
+CONFIG_XEN_XENBUS_FRONTEND=y
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_SWIOTLB_XEN=y
+CONFIG_XEN_PCIDEV_BACKEND=m
+CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_ACPI_PROCESSOR=m
+CONFIG_XEN_MCE_LOG=y
+CONFIG_XEN_HAVE_PVMMU=y
diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc b/recipes-kernel/linux/linux-yocto/xen-guest.scc
new file mode 100644
index 0000000..575bc43
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Xen PV Guest Support"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware xen-guest.cfg
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index cc7fd98..a3165cd 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -17,3 +17,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
 
 # xen dom0 kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# xen guest kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 448d57f..4d3a0d1 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -14,3 +14,6 @@ module_autoload_kvm-intel = "kvm-intel"
 
 # xen dom0 kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# xen guest kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index cc7fd98..a3165cd 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -17,3 +17,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
 
 # xen dom0 kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# xen guest kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
-- 
1.8.4.rc3



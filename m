Return-Path: <cjp256@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56294E013AE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:09 -0700 (PDT)
Received: by mail-qe0-f47.google.com with SMTP id b4so4872819qen.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fBd28dYxgUukeoR5wDfR0Tg7heZ4yZdrrYy+dU5dfYU=;
	b=tNrMeKb84pWMu+8Hb9jD2BsExIyu8E6TP3t8bHYws7/XMjSqUp/M+pGw0TLEuCE9vb
	+F8nLjvfd3SvmORnixtdIkvDRzxs+FLDb1h/61bNa/qkgkXkCrXVMvEkjtLpi4TKn1IO
	K1fQ+YwjVMRZA3ZVkinEiV/hA4L80AgFEyuphfowEk2rbXl7DhcSOSDKkwzDGXeabu5G
	iO/vhS6nXYILLl77RWLunnWHKsiR0loAaBiJTGibMiEojLGTVkRmqod9SAg6hwex/u5H
	xtfpfOqO7RfpSi+sNMZFiTHr4wMEk88ygKF4m6KelSCxnB+aUG61Iay2ich1KoWu+2N6
	GdHA==
X-Received: by 10.229.191.7 with SMTP id dk7mr30406452qcb.4.1378861389285;
	Tue, 10 Sep 2013 18:03:09 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id f14sm34325809qej.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 18:03:08 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 10 Sep 2013 21:02:38 -0400
Message-Id: <1378861361-7980-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
References: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 1/4] linux-yocto: add kernel fragment and scc to support xen on linux 3.4, 3.8, and 3.10.
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
X-List-Received-Date: Wed, 11 Sep 2013 01:03:12 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto/xen.cfg | 55 ++++++++++++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen.scc |  4 +++
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
new file mode 100644
index 0000000..e7d774e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
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
+CONFIG_XEN_BLKDEV_FRONTEND=m
+CONFIG_XEN_BLKDEV_BACKEND=m
+CONFIG_XEN_NETDEV_FRONTEND=m
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
+CONFIG_XEN_DEV_EVTCHN=m
+CONFIG_XEN_BACKEND=y
+CONFIG_XENFS=m
+CONFIG_XEN_COMPAT_XENFS=y
+CONFIG_XEN_SYS_HYPERVISOR=y
+CONFIG_XEN_XENBUS_FRONTEND=y
+CONFIG_XEN_GNTDEV=m
+CONFIG_XEN_GRANT_DEV_ALLOC=m
+CONFIG_SWIOTLB_XEN=y
+CONFIG_XEN_PCIDEV_BACKEND=m
+CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_ACPI_PROCESSOR=m
+CONFIG_XEN_MCE_LOG=y
+CONFIG_XEN_HAVE_PVMMU=y
diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel/linux/linux-yocto/xen.scc
new file mode 100644
index 0000000..6c68bda
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/xen.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Xen Dom0 Support"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware xen.cfg
-- 
1.8.4.rc3



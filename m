Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6602CE00747
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:34 -0700 (PDT)
Received: by mail-ie0-f171.google.com with SMTP id 9so2347258iec.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XHxmha44TA7POoksPoaUBvqVYoUjbra7qucNXlBFfkw=;
	b=PgsSc25l0ZQvloHVjcf+6gJRIWyywtXKI2cEJ/BluycN1qyIMMUFYDdMHh2VIfIqfs
	Glo9BbkQMjGrvolba5rRQ99BS/aXQMjZk9oZGMxGkxlqrYPhva7g6dr0Cnc1CSRh0N2s
	AzXXqsOrJlVpP1Fg4HRXIUr0wbBuYN7KHfC33nbqp6AIUmXQ0fPPvgc710ePiPMut8ix
	ecg+rHzi5mPC3be/5z+QE39qVsbZYarxIupBgNdl96i4htpMGTw3DP1aFJY9QehzlfzA
	BSiVDbPMqEIl3FNSUzqtbhz3elKuVjw87oN3qoDIqG1WftOBRivkFaRjFxDFBr6ScPTs
	qZ5Q==
X-Received: by 10.50.136.135 with SMTP id qa7mr182303igb.49.1377833853749;
	Thu, 29 Aug 2013 20:37:33 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id p5sm1744506igj.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 20:37:32 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 29 Aug 2013 23:37:21 -0400
Message-Id: <1377833844-14672-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Fri, 30 Aug 2013 03:37:38 -0000

---
 recipes-kernel/linux/linux-yocto/xen.cfg |   53 ++++++++++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen.scc |    4 +++
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
new file mode 100644
index 0000000..f9cfb6a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
@@ -0,0 +1,53 @@
+..........................................................................
+.                                WARNING
+.
+. This file is a kernel configuration fragment, and not a full kernel
+. configuration file.  The final kernel configuration is made up of
+. an assembly of processed fragments, each of which is designed to
+. capture a specific part of the final configuration (e.g. platform
+. configuration, feature configuration, and board specific hardware
+. configuration).  For more information on kernel configuration, please
+. consult the product documentation.
+.
+..........................................................................
+
+CONFIG_PARAVIRT_GUEST=y
+# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
+CONFIG_XEN=y
+CONFIG_XEN_DOM0=y
+CONFIG_XEN_PRIVILEGED_GUEST=y
+CONFIG_XEN_PVHVM=y
+CONFIG_XEN_MAX_DOMAIN_MEMORY=500
+CONFIG_XEN_SAVE_RESTORE=y
+# CONFIG_XEN_DEBUG_FS is not set
+CONFIG_PARAVIRT=y
+# CONFIG_PARAVIRT_SPINLOCKS is not set
+CONFIG_PARAVIRT_CLOCK=y
+# CONFIG_PARAVIRT_DEBUG is not set
+CONFIG_PCI_XEN=y
+CONFIG_XEN_PCIDEV_FRONTEND=m
+CONFIG_XEN_BLKDEV_FRONTEND=m
+CONFIG_XEN_BLKDEV_BACKEND=m
+CONFIG_XEN_NETDEV_FRONTEND=m
+CONFIG_XEN_NETDEV_BACKEND=m
+CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
+CONFIG_HVC_XEN=y
+CONFIG_HVC_XEN_FRONTEND=y
+CONFIG_XEN_WDT=m
+CONFIG_XEN_FBDEV_FRONTEND=y
+# Xen driver support
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
+CONFIG_XEN_PCIDEV_BACKEND=y
+CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_ACPI_PROCESSOR=m
+CONFIG_PCI_STUB=y
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
1.7.10.4



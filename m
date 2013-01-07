Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AC04E00706
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 04:08:09 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 04:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="188456488"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 04:08:07 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  7 Jan 2013 14:08:24 +0200
Message-Id: <1357560505-24122-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Mon, 07 Jan 2013 12:08:09 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
 recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
 recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
 3 files changed, 9 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
 create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg

diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
new file mode 100644
index 0000000..0b5f4fc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable KVM host support"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware kvm.cfg
diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linux/linux-yocto/kvm.cfg
new file mode 100644
index 0000000..0cfcf58
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
@@ -0,0 +1,4 @@
+CONFIG_KVM=y
+CONFIG_KVM_INTEL=y
+CONFIG_KVM_AMD=y
+CONFIG_TUN=y
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 5b163ff..71bead2 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
+            file://kvm-enable.scc \
 	    "
 
-- 
1.7.9.5



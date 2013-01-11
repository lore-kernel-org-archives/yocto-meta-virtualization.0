Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9545E006D2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 08:27:05 -0800 (PST)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 08:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,452,1355126400"; d="scan'208";a="242812621"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2013 08:27:03 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Jan 2013 18:27:26 +0200
Message-Id: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Fri, 11 Jan 2013 16:27:06 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 5b163ff..6fa02e8 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://lxc.scc \
 	    "
 
+KERNEL_FEATURES_append = " kvm/qemu-kvm-enable"
+
+module_autoload_kvm = "kvm"
+module_autoload_kvm-amd = "kvm-amd"
+module_autoload_kvm-intel = "kvm-intel"
-- 
1.7.9.5



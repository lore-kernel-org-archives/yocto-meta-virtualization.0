Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06B05E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 04:55:18 -0800 (PST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2013 04:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="254163439"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.31])
	by orsmga001.jf.intel.com with ESMTP; 29 Jan 2013 04:55:16 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Jan 2013 14:55:53 +0200
Message-Id: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Tue, 29 Jan 2013 12:55:18 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 5b163ff..bac7646 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://lxc.scc \
 	    "
 
+KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable"
+
+module_autoload_kvm = "kvm"
+module_autoload_kvm-amd = "kvm-amd"
+module_autoload_kvm-intel = "kvm-intel"
-- 
1.7.9.5



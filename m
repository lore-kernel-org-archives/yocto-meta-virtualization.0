Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60B1DE01440
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jul 2013 07:11:23 -0700 (PDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2013 07:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1020,1363158000"; d="scan'208";a="342159105"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2013 07:11:18 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jul 2013 17:11:16 +0300
Message-Id: <1373292676-13405-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] linux-yocto: Added 3.8 kernel bbappend
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
X-List-Received-Date: Mon, 08 Jul 2013 14:11:24 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-kernel/linux/linux-yocto_3.8.bbappend |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
new file mode 100644
index 0000000..2893a01
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://xt-checksum.scc \
+            file://ebtables.scc \
+	    file://vswitch.scc \
+	    file://lxc.scc \
+	    "
+module_autoload_openvswitch = "openvswitch"
+KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
+
+module_autoload_kvm = "kvm"
+module_autoload_kvm-amd = "kvm-amd"
+module_autoload_kvm-intel = "kvm-intel"
-- 
1.7.9.5



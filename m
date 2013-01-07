Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D7C0E013D9
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 04:08:11 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 04:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="188456504"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 04:08:09 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  7 Jan 2013 14:08:25 +0200
Message-Id: <1357560505-24122-3-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Mon, 07 Jan 2013 12:08:11 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/images/kvm-image-minimal.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-extended/images/kvm-image-minimal.bb

diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
new file mode 100644
index 0000000..486cd9c
--- /dev/null
+++ b/recipes-extended/images/kvm-image-minimal.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A minimal kvm image"
+
+IMAGE_INSTALL = " \
+    packagegroup-core-boot \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    qemu \
+    libvirt \
+    libvirt-libvirtd \
+    libvirt-virsh \
+    "
+
+IMAGE_FEATURES += "ssh-server-openssh"
+
+IMAGE_LINGUAS = " "
+
+LICENSE = "MIT"
+
+inherit core-image
+
+IMAGE_ROOTFS_SIZE = "8192"
+
+ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
1.7.9.5



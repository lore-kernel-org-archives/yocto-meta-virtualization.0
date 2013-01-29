Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1446FE002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 04:55:20 -0800 (PST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2013 04:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="254163451"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.31])
	by orsmga001.jf.intel.com with ESMTP; 29 Jan 2013 04:55:18 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Jan 2013 14:55:54 +0200
Message-Id: <1359464154-16618-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
References: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH V3 2/2] Created new target: kvm-image-minimal
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
X-List-Received-Date: Tue, 29 Jan 2013 12:55:20 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/images/kvm-image-minimal.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-extended/images/kvm-image-minimal.bb

diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
new file mode 100644
index 0000000..abc0fee
--- /dev/null
+++ b/recipes-extended/images/kvm-image-minimal.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "A minimal kvm image"
+
+IMAGE_INSTALL = " \
+    packagegroup-core-boot \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    qemu \
+    libvirt \
+    libvirt-libvirtd \
+    libvirt-virsh \
+    kernel-module-kvm \
+    kernel-module-kvm-intel \
+    kernel-module-kvm-amd \
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



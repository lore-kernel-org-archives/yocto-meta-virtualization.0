Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21C68E01454
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 08:27:07 -0800 (PST)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 08:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,452,1355126400"; d="scan'208";a="242812637"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2013 08:27:05 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Jan 2013 18:27:27 +0200
Message-Id: <1357921647-17864-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH v2 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Fri, 11 Jan 2013 16:27:07 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/images/kvm-image-minimal.bb |   28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 recipes-extended/images/kvm-image-minimal.bb

diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
new file mode 100644
index 0000000..275c43b
--- /dev/null
+++ b/recipes-extended/images/kvm-image-minimal.bb
@@ -0,0 +1,28 @@
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
+
+PACKAGE_INSTALL_ATTEMPTONLY = "\
+    kernel-module-kvm \
+    kernel-module-kvm-intel \
+    kernel-module-kvm-amd \
+    "
-- 
1.7.9.5



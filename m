Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1ED8E00CF7; Fri, 22 Sep 2017 01:27:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 357E5E00CF2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Sep 2017 01:27:40 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8M8ReMm024689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Sep 2017 01:27:40 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 22 Sep 2017 01:27:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Sep 2017 16:26:37 +0800
Message-ID: <20170922082637.13578-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Fri, 22 Sep 2017 08:27:41 -0000
Content-Type: text/plain

Make these bbappend files to take effect only when DISTRO_FEATURES
contain 'virtualization'. Otherwise, we would meet failure failure
at system booting up qemux86. Related logs are as below.

 systemd-modules-load[113]: Failed to insert 'kvm_amd': Operation not supported
 systemd-modules-load[113]: Failed to insert 'kvm_intel': Operation not supported

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-kernel/linux/linux-yocto_4.10.bbappend      | 21 +--------------------
 recipes-kernel/linux/linux-yocto_4.12.bbappend      | 21 +--------------------
 recipes-kernel/linux/linux-yocto_4.4.bbappend       | 21 +--------------------
 recipes-kernel/linux/linux-yocto_4.9.bbappend       | 21 +--------------------
 recipes-kernel/linux/linux-yocto_virtualization.inc | 20 ++++++++++++++++++++
 5 files changed, 24 insertions(+), 80 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto_virtualization.inc

diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend b/recipes-kernel/linux/linux-yocto_4.10.bbappend
index f163fdf..617cacc 100644
--- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.10.bbappend
@@ -1,20 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-            file://docker.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.12.bbappend b/recipes-kernel/linux/linux-yocto_4.12.bbappend
index f163fdf..617cacc 100644
--- a/recipes-kernel/linux/linux-yocto_4.12.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.12.bbappend
@@ -1,20 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-            file://docker.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel/linux/linux-yocto_4.4.bbappend
index f163fdf..617cacc 100644
--- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
@@ -1,20 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-            file://docker.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend b/recipes-kernel/linux/linux-yocto_4.9.bbappend
index f163fdf..617cacc 100644
--- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.9.bbappend
@@ -1,20 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-            file://docker.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
new file mode 100644
index 0000000..f163fdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://xt-checksum.scc \
+            file://ebtables.scc \
+	    file://vswitch.scc \
+	    file://lxc.scc \
+            file://docker.scc \
+	    "
+KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
+
+KERNEL_MODULE_AUTOLOAD += "openvswitch"
+KERNEL_MODULE_AUTOLOAD += "kvm"
+KERNEL_MODULE_AUTOLOAD += "kvm-amd"
+KERNEL_MODULE_AUTOLOAD += "kvm-intel"
+
+# aufs kernel support required for xen-image-minimal
+KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen kernel support
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
2.11.0



Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DB93E00D10; Mon, 25 Sep 2017 01:42:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CC74E00CE2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 01:42:23 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8P8gMkv024919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 01:42:22 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Sep 2017 01:42:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 25 Sep 2017 16:41:12 +0800
Message-ID: <20170925084113.30094-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170925084113.30094-1-Qi.Chen@windriver.com>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Mon, 25 Sep 2017 08:42:24 -0000
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
index 0000000..8b296d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
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



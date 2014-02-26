Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 57327E0076C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 02:08:11 -0800 (PST)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.209) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Feb 2014 11:08:05 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1WIbPK-0004YR-Ao; Wed, 26 Feb 2014 11:08:06 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Feb 2014 11:07:55 +0100
Message-ID: <1393409277-17451-4-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 3/5] Use a DISTRO_FEATURE to toggle LXC support
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
X-List-Received-Date: Wed, 26 Feb 2014 10:08:13 -0000
Content-Type: text/plain

LXC requires a number of cgroups and name spaces to be supported by the
kernel, which are not possible to enable as modules. This means that an
eventual performance hit would affect all linux-yocto kernels build with
the meta-virtualization layer added. To remove this overhead, require
LXC support to be explicitly enabled using a DISTRO_FEATURE, just like
Xen support is managed today as it suffers from the same problems.

At the same time as solving this for linux-yocto, we can use the
DISTRO_FEATURE variable to affect the default PKGCONFIG in libvirt.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb      | 3 ++-
 recipes-kernel/linux/linux-yocto_3.10.bbappend | 4 +++-
 recipes-kernel/linux/linux-yocto_3.4.bbappend  | 4 +++-
 recipes-kernel/linux/linux-yocto_3.8.bbappend  | 4 +++-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index 76d3f42..dbc6ef3 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -110,8 +110,9 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
-                   polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
+                   polkit test remote macvtap libvirtd netcf udev python ebtables \
                    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'lxc', 'lxc', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index c029c05..584035b 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -3,7 +3,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
-	    file://lxc.scc \
 	    "
 module_autoload_openvswitch = "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
@@ -17,3 +16,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
 
 # xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# lxc support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'lxc', ' file://lxc.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index bf84725..c1aaebe 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -3,7 +3,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
-	    file://lxc.scc \
 	    "
 module_autoload_openvswitch = "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
@@ -14,3 +13,6 @@ module_autoload_kvm-intel = "kvm-intel"
 
 # xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# lxc support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'lxc', ' file://lxc.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index c029c05..584035b 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -3,7 +3,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
-	    file://lxc.scc \
 	    "
 module_autoload_openvswitch = "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
@@ -17,3 +16,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
 
 # xen kernel support
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+
+# lxc support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'lxc', ' file://lxc.scc', '', d)}"
-- 
1.9.rc1



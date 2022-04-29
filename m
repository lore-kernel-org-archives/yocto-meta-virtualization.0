Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8942C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 14:02:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10512.1651240933666760175
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3B81063;
	Fri, 29 Apr 2022 07:02:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 861953F774;
	Fri, 29 Apr 2022 07:02:12 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] xen: enable qemuboot for arm32
Date: Fri, 29 Apr 2022 15:02:05 +0100
Message-Id: 
 <a185ddfe7de80fa95dad40fb3cbfdd1f53c412aa.1651240852.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 14:02:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7236

Modify qemuboot-xen-dtb to use QB_MACHINE to dump the device tree to
make it compatible with other boards.
Add required variables to generate a qemuboot devicetree for qemuarm.

With this change, Xen and dom0 can be started using qemu with runqemu.

Also fix qemuboot-xen-dtb to properly add dom0 bootargs by using a
parameter instead of directly using the QB_XEN_DOM0_BOOTARGS inside the
function (not sure why it is solving the issue but it works).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 classes/qemuboot-xen-defaults.bbclass | 12 +++++++++++-
 classes/qemuboot-xen-dtb.bbclass      |  9 +++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
index c7e74c3..c5615e7 100644
--- a/classes/qemuboot-xen-defaults.bbclass
+++ b/classes/qemuboot-xen-defaults.bbclass
@@ -10,15 +10,21 @@ DOM0_KERNEL ??=3D "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE=
TYPE}"
 DOM0_KERNEL_LOAD_ADDR ??=3D "0x45000000"
 QB_XEN_DOMAIN_MODULES ??=3D "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:mul=
tiboot,kernel"
=20
-# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
+# Qemuboot for Arm uses the QB_DEFAULT_KERNEL method to load Xen
 # and the device loader option for the dom0 kernel:
 QB_OPT_APPEND:append:aarch64 =3D " \
     -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR}=
 \
     "
+QB_OPT_APPEND:append:qemuarm =3D " \
+    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR}=
 \
+    "
 QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
+QB_DEFAULT_KERNEL:qemuarm =3D "xen-${MACHINE}"
=20
 # 64-bit Arm: gic version 3
 QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtualiz=
ation=3Dtrue"
+# 32-bit Arm
+QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
=20
 # Increase the default qemu memory allocation to allow for the hyperviso=
r.
 # Use a weak assignment to allow for change of default and override else=
where.
@@ -28,3 +34,7 @@ QB_MEM =3D "-m ${QB_MEM_VALUE}"
 # 64-bit Arm: qemuboot with a device tree binary
 QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
 QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
+
+# 32-bit Arm: qemuboot with a device tree binary
+QB_DTB:qemuarm =3D "${IMAGE_NAME}.qemuboot.dtb"
+QB_DTB_LINK:qemuarm =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.=
bbclass
index 6fe3164..d43d23a 100644
--- a/classes/qemuboot-xen-dtb.bbclass
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -29,6 +29,7 @@
 # See also: Other QB_ variables as defined by the qemuboot.bbclass.
=20
 write_lops_xen_section() {
+    DOM0_BOOTARGS=3D"$2"
     cat <<EOF >"$1"
 /dts-v1/;
 / {
@@ -47,7 +48,7 @@ write_lops_xen_section() {
         };
         lop_2 {
             compatible =3D "system-device-tree-v1,lop,modify";
-            modify =3D "/chosen:xen,dom0-bootargs:${QB_XEN_DOM0_BOOTARGS=
}";
+            modify =3D "/chosen:xen,dom0-bootargs:${DOM0_BOOTARGS}";
         };
         lop_3 {
             compatible =3D "system-device-tree-v1,lop,modify";
@@ -118,8 +119,7 @@ generate_xen_qemuboot_dtb() {
         -device qemu-xhci \
         -device usb-tablet \
         -device usb-kbd \
-        -machine virt,gic-version=3D3 \
-        -machine virtualization=3Dtrue \
+        ${QB_MACHINE} \
         ${QB_CPU} \
         ${QB_SMP} \
         ${QB_MEM} \
@@ -129,7 +129,8 @@ generate_xen_qemuboot_dtb() {
=20
     # Lopper generates temporary files in cwd, so run it within ${B}
     cd "${B}"
-    write_lops_xen_section "${B}/lop-insert-xen-section.dts"
+    write_lops_xen_section "${B}/lop-insert-xen-section.dts" \
+        "${QB_XEN_DOM0_BOOTARGS}"
=20
     write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
         "${QB_XEN_CMDLINE_EXTRA}"
--=20
2.25.1



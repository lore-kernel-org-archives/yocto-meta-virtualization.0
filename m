Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66379C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.405.1652196931130033019
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 May 2022 08:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EA19143D;
	Tue, 10 May 2022 08:35:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142423F73D;
	Tue, 10 May 2022 08:35:29 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 2/4] qemuboot: Fix command line and enable other machines
Date: Tue, 10 May 2022 16:35:14 +0100
Message-Id: 
 <96483239d8b947bbb69b31255a9f040f4e948b80.1652196703.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652196703.git.bertrand.marquis@arm.com>
References: <cover.1652196703.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 May 2022 15:35:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7272

Fix qemuboot-xen-dtb to properly add dom0 bootargs by using a parameter
instead of directly using the QB_XEN_DOM0_BOOTARGS inside the function.
When not done, the variable is empty and dom0 bootargs are wrong in the
device tree.

Use QB_MACHINE to generate a device tree with qemu instead of always
using the armv8 machine. This will allow this class to be used for other
machines later.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 classes/qemuboot-xen-dtb.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

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



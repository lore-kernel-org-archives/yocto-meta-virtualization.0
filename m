Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3974CCA47F
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:58:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9053.1654768697501567523
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 02:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38BA612FC;
	Thu,  9 Jun 2022 02:58:17 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.10.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70FFB3F766;
	Thu,  9 Jun 2022 02:58:15 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	nd@arm.com
Subject: [PATCH 1/2] Revert "xen: Disable PCI on qemuarm with Xen"
Date: Thu,  9 Jun 2022 11:57:47 +0200
Message-Id: <20220609095748.176486-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609095748.176486-1-michal.orzel@arm.com>
References: <20220609095748.176486-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jun 2022 09:58:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7351

This reverts commit fb0a7b97db4f419b82309f98a4944ae3330d1e2e.

Justification:
Commit fb0a7b97db4f removed the PCI node from the qemu device tree
due to the issue when trying to access PCI configuration space that
was causing Linux running on top of Xen to end up in an infinite loop.
The investigation showed that the problem occurs due to qemu placing
ECAM space at 256GiB mark. Even though Xen officially supports on arm32
up to 12GiB of physical address space, it is able to map it correctly
for dom0. However, when Linux tries to access the ECAM space and the
stage2 translation fault occurs, HPFAR register contains incorrect IPA.
We can say it is incorrect because using hardware AT instruction or
software lookup, we can obtain the correct IPA from the same VA. This
can suggest that the problem is related to QEMU fault handling.

Instead of removing the PCI node the follow-up commit will disable
highmem option in qemu which will cause placing ECAM space in the
32-bit space.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 classes/qemuboot-xen-dtb.bbclass | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.=
bbclass
index 1f17a86..d43d23a 100644
--- a/classes/qemuboot-xen-dtb.bbclass
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -63,21 +63,6 @@ write_lops_xen_section() {
 EOF
 }
=20
-write_lop_rm_pci() {
-    cat <<EOF >"$1"
-/dts-v1/;
-/ {
-    compatible =3D "system-device-tree-v1";
-    lops {
-        lop_1 {
-            compatible =3D "system-device-tree-v1,lop,modify";
-            modify =3D "/pcie@10000000::";
-        };
-     };
-};
-EOF
-}
-
 write_lop_add_to_xen_cmdline() {
     EXTRA_XEN_BOOTARGS=3D"$2"
     cat <<EOF >"$1"
@@ -150,13 +135,6 @@ generate_xen_qemuboot_dtb() {
     write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
         "${QB_XEN_CMDLINE_EXTRA}"
=20
-    # On Qemu Arm32, Dom0 accessing PCI config space ends up in an
-    # infinite loop. Remove pci node from the device tree
-    if [ "${MACHINE}" =3D "qemuarm" ]; then
-        write_lop_rm_pci "${B}/lop-rm-pci.dts"
-        LOP_MODULE_ARGS=3D"${LOP_MODULE_ARGS} -i ${B}/lop-rm-pci.dts"
-    fi
-
     if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
         bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
     fi
--=20
2.25.1



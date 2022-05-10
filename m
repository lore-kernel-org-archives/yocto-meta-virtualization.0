Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C84C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.382.1652196932525547817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 May 2022 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C60C12FC;
	Tue, 10 May 2022 08:35:31 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B60FD3F73D;
	Tue, 10 May 2022 08:35:30 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 3/4] xen: enable qemuboot for arm32
Date: Tue, 10 May 2022 16:35:15 +0100
Message-Id: 
 <3ff0a6eb0eb859dade39cfa8c1494519c626d26d.1652196703.git.bertrand.marquis@arm.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7274

Add required variables to generate a qemuboot devicetree for qemuarm.
With this change, Xen and dom0 can be started using runqemu.

Xen is started using qemu kernel argument and the devicetree is modified
to properly boot dom0 (which is loaded in memory).
This is using the same system as qemuarm64.

At this stage dom0 is hanging on PCI device scanning.

This patch is also using qemuarm64 as machine for arm64 bit instead of
aarch64 to allow adding support for other machine (an example a Xilinx
board that can be emulated with using an other xen machine).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 classes/qemuboot-xen-defaults.bbclass | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
index c7e74c3..f1550cc 100644
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
-QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
+QB_OPT_APPEND:append:qemuarm =3D " \
+    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR}=
 \
+    "
+QB_DEFAULT_KERNEL:qemuarm64 =3D "xen-${MACHINE}"
+QB_DEFAULT_KERNEL:qemuarm =3D "xen-${MACHINE}"
=20
 # 64-bit Arm: gic version 3
-QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtualiz=
ation=3Dtrue"
+QB_MACHINE:qemuarm64 =3D "-machine virt,gic-version=3D3 -machine virtual=
ization=3Dtrue"
+# 32-bit Arm
+QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
=20
 # Increase the default qemu memory allocation to allow for the hyperviso=
r.
 # Use a weak assignment to allow for change of default and override else=
where.
@@ -26,5 +32,9 @@ QB_MEM_VALUE ??=3D "512"
 QB_MEM =3D "-m ${QB_MEM_VALUE}"
=20
 # 64-bit Arm: qemuboot with a device tree binary
-QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
-QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
+QB_DTB:qemuarm64 =3D "${IMAGE_NAME}.qemuboot.dtb"
+QB_DTB_LINK:qemuarm64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
+
+# 32-bit Arm: qemuboot with a device tree binary
+QB_DTB:qemuarm =3D "${IMAGE_NAME}.qemuboot.dtb"
+QB_DTB_LINK:qemuarm =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
--=20
2.25.1



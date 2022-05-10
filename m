Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A74C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:35:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.381.1652196930239599250
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 May 2022 08:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E15ED13D5;
	Tue, 10 May 2022 08:35:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6700A3F73D;
	Tue, 10 May 2022 08:35:29 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 1/4] xen: Fix class inherit in xen-image
Date: Tue, 10 May 2022 16:35:13 +0100
Message-Id: 
 <cba614bcf3d974cb7e8c711f66e25d3c0b229776.1652196703.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652196703.git.bertrand.marquis@arm.com>
References: <cover.1652196703.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 May 2022 15:35:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7271

Remove inherit of qemuboot classes when not build for qemu in
xen-image-minimal.
When reverted the handling for only adding inherited classes for qemu
was kept but the line always inheriting them was kept to.
This patch is fixing that so that qemuboot classes are now only added
when the image is built for qemu.

This fixes commit 27e5ade0abc2660226389b8b62ef07d85f4b8758

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/images/xen-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-exten=
ded/images/xen-image-minimal.bb
index 7f10b1d..9fd05d2 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -36,7 +36,7 @@ LICENSE =3D "MIT"
=20
 QB_NETWORK_XEN_BRIDGE =3D "1"
=20
-inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testi=
mage-network
+inherit core-image
 # Only inherit the qemuboot classes when building for a qemu machine
 QB_QEMU_CLASSES =3D ""
 QB_QEMU_CLASSES:qemuall =3D "qemuboot-xen-defaults qemuboot-xen-dtb qemu=
boot-testimage-network"
--=20
2.25.1



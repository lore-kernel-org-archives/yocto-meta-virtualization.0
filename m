Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDD6C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:58:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9218.1654768700155913365
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 02:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91DC112FC;
	Thu,  9 Jun 2022 02:58:19 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.10.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A030D3F766;
	Thu,  9 Jun 2022 02:58:17 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	nd@arm.com
Subject: [PATCH 2/2] xen: Disable highmem on qemuarm
Date: Thu,  9 Jun 2022 11:57:48 +0200
Message-Id: <20220609095748.176486-3-michal.orzel@arm.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7352

By default, highmem option is enabled for machine types later than
virt-2.12. This allows qemu to place devices and RAM in physical
address space above 32-bits. This can cause issues as according to the
documentation Xen supports up to 12GiB of physical address space.
Recently the issue was observed using runqemu, that was causing Linux
running on top of Xen to stall when trying to access ECAM space placed
by qemu at 256GiB mark. Even though this issue is most probably related
to QEMU and not Xen (the investigation showed that it can map ECAM
space correctly), it is best to avoid such issues by disabling highmem
on qemuarm.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 classes/qemuboot-xen-defaults.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
index f1550cc..460cbe6 100644
--- a/classes/qemuboot-xen-defaults.bbclass
+++ b/classes/qemuboot-xen-defaults.bbclass
@@ -23,8 +23,10 @@ QB_DEFAULT_KERNEL:qemuarm =3D "xen-${MACHINE}"
=20
 # 64-bit Arm: gic version 3
 QB_MACHINE:qemuarm64 =3D "-machine virt,gic-version=3D3 -machine virtual=
ization=3Dtrue"
-# 32-bit Arm
-QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
+# 32-bit Arm: highmem=3Doff
+# Disable highmem so that qemu does not use highmem IO regions that end =
up
+# being placed at the 256GiB mark (e.g. ECAM space) and can cause issues=
 in Xen.
+QB_MACHINE:qemuarm =3D "-machine virt,highmem=3Doff -machine virtualizat=
ion=3Dtrue"
=20
 # Increase the default qemu memory allocation to allow for the hyperviso=
r.
 # Use a weak assignment to allow for change of default and override else=
where.
--=20
2.25.1



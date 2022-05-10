Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E911C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:35:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.397.1652196930232583644
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 May 2022 08:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413D812FC;
	Tue, 10 May 2022 08:35:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B99483F73D;
	Tue, 10 May 2022 08:35:28 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 0/4] Vairous fixes for qemu support
Date: Tue, 10 May 2022 16:35:12 +0100
Message-Id: <cover.1652196703.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 May 2022 15:35:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7270

This serie is a rework of the patch named "[PATCH] xen: enable qemuboot
for arm32" to fix some issues in the qemuboot support for arm and
introduce arm32 support for it.

First 2 patches are small fixes/enhancements
Patch 3 is adding qemu arm32 support
Patch 4 needs to be discuss but is a workaround to let qemu-arm32 boot
right now by disabling PCI as it cause dom0 to hang at the moment.

Bertrand Marquis (4):
  xen: Fix class inherit in xen-image
  qemuboot: Fix command line and enable other machines
  xen: enable qemuboot for arm32
  xen: Disable PCI on qemuarm with Xen

 classes/qemuboot-xen-defaults.bbclass        | 20 +++++++++----
 classes/qemuboot-xen-dtb.bbclass             | 31 +++++++++++++++++---
 recipes-extended/images/xen-image-minimal.bb |  2 +-
 3 files changed, 43 insertions(+), 10 deletions(-)

--=20
2.25.1



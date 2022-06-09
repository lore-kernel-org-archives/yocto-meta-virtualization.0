Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2811CCA47D
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:58:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9221.1654768696027187989
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 02:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB90912FC;
	Thu,  9 Jun 2022 02:58:14 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.10.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA86F3F766;
	Thu,  9 Jun 2022 02:58:12 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	nd@arm.com
Subject: [PATCH 0/2] xen: PCI runqemu issue follow-up
Date: Thu,  9 Jun 2022 11:57:46 +0200
Message-Id: <20220609095748.176486-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jun 2022 09:58:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7350

This series acts as a follow-up to the commit:
fb0a7b97db4f ("xen: Disable PCI on qemuarm with Xen")

This wants to be backported to kirkstone.

Michal Orzel (2):
  Revert "xen: Disable PCI on qemuarm with Xen"
  xen: Disable highmem on qemuarm

 classes/qemuboot-xen-defaults.bbclass |  6 ++++--
 classes/qemuboot-xen-dtb.bbclass      | 22 ----------------------
 2 files changed, 4 insertions(+), 24 deletions(-)

--=20
2.25.1



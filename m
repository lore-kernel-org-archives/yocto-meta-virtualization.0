Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A6FC46467
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2105.1650359243220930364
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 02:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A791042;
	Tue, 19 Apr 2022 02:07:22 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.11.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E61403F5A1;
	Tue, 19 Apr 2022 02:07:20 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	bertrand.marquis@arm.com,
	nd@arm.com
Subject: [PATCH v2 0/3] xen: Update recipes for xen and xen-tools
Date: Tue, 19 Apr 2022 11:07:10 +0200
Message-Id: <20220419090713.134057-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7188

Before the next Yocto release, Xen recipes need to be updated.
This patch series:
- updates 4.15 recipes (4.15.2)
- introduces 4.16 recipes (4.16.1)
- removes 4.14 recipes

v2 bumps SRCREV of 4.16 recipes to 4.16.1 as it was released a few days a=
go.
v2 adds R-by from Christopher and Bertrand to all the patches.

Michal Orzel (3):
  xen: Bump SRCREV of 4.15 recipes to 4.15.2
  xen: Add recipes for stable Xen 4.16 release and update master
  xen: Remove 4.14 recipes and related patches

 .../include/meta-virt-default-versions.inc    |   4 +-
 ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
 ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
 ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
 recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
 recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
 recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
 recipes-extended/xen/xen-tools_git.bb         |   6 +-
 recipes-extended/xen/xen_4.15.bb              |   4 +-
 .../xen/{xen_4.14.bb =3D> xen_4.16.bb}          |   6 +-
 recipes-extended/xen/xen_git.bb               |   6 +-
 11 files changed, 34 insertions(+), 363 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-st=
and-alone-set-of-headers-Xen-4.14.patch
 delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.14.patch
 delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-=
firmware-as-ffreestanding-Xen-4.14.patch
 delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
 create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
 rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.16.bb} (79%)

--=20
2.25.1



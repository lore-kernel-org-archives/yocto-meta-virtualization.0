Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF457C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 12:21:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6152.1641903688342562445
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 04:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8E261FB;
	Tue, 11 Jan 2022 04:21:27 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.84.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6743F774;
	Tue, 11 Jan 2022 04:21:26 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] busybox-initrd: oe-core has upgraded to 1.35.0
Date: Tue, 11 Jan 2022 12:21:16 +0000
Message-Id: <20220111122116.518980-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jan 2022 12:21:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6997

From: Peter Hoyes <Peter.Hoyes@arm.com>

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../{busybox-initrd_1.34.1.bb =3D> busybox-initrd_1.35.0.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.34.1.bb =3D> busybox-initr=
d_1.35.0.bb} (100%)

diff --git a/recipes-core/busybox/busybox-initrd_1.34.1.bb b/recipes-core=
/busybox/busybox-initrd_1.35.0.bb
similarity index 100%
rename from recipes-core/busybox/busybox-initrd_1.34.1.bb
rename to recipes-core/busybox/busybox-initrd_1.35.0.bb
--=20
2.25.1



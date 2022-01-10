Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BFFC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 12:38:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30776.1641818286117812039
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 04:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A04D22B
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 04:38:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41BDE3F5A1
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 04:38:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] busybox-initrd: oe-core has
 upgraded to 1.33.2
Date: Mon, 10 Jan 2022 12:37:56 +0000
Message-Id: <20220110123756.60947-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jan 2022 12:38:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6993

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{busybox-initrd_1.33.1.bb =3D> busybox-initrd_1.33.2.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.33.1.bb =3D> busybox-initr=
d_1.33.2.bb} (100%)

diff --git a/recipes-core/busybox/busybox-initrd_1.33.1.bb b/recipes-core=
/busybox/busybox-initrd_1.33.2.bb
similarity index 100%
rename from recipes-core/busybox/busybox-initrd_1.33.1.bb
rename to recipes-core/busybox/busybox-initrd_1.33.2.bb
--=20
2.25.1



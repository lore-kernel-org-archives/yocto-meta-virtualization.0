Return-Path: <Henry.Wang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F009EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:35:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56587.1688470539509906434
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 04:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: henry.wang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E78E2F4;
	Tue,  4 Jul 2023 04:36:21 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com [10.169.190.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C033D3F73F;
	Tue,  4 Jul 2023 04:35:36 -0700 (PDT)
From: Henry Wang <Henry.Wang@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [mickledore][PATCH 2/2] rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4
Date: Tue,  4 Jul 2023 19:35:23 +0800
Message-Id: <20230704113523.722206-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704113523.722206-1-Henry.Wang@arm.com>
References: <20230704113523.722206-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Jul 2023 11:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8117

From: Christopher Clark <christopher.w.clark@gmail.com>

Added to the raspberrypi dynamic layer for use with Xen as
the default preference for Linux kernel.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_6.1.bbappend           | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux=
-yocto_6.1.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_=
6.1.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yoct=
o_6.1.bbappend
new file mode 100644
index 0000000..dd7edea
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bba=
ppend
@@ -0,0 +1,6 @@
+# Enable use of the linux-yocto kernel for the Raspberry Pi 4
+KBRANCH:raspberrypi4-64 ?=3D "v6.1/standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
--=20
2.25.1



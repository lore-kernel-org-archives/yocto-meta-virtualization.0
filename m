Return-Path: <Henry.Wang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC54EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:35:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.56493.1688470532222179595
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 04:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: henry.wang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491D92F4;
	Tue,  4 Jul 2023 04:36:14 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com [10.169.190.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A01D3F73F;
	Tue,  4 Jul 2023 04:35:29 -0700 (PDT)
From: Henry Wang <Henry.Wang@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [mickledore][PATCH 0/2] Use linux-yocto 6.1 for RPi4 in mickledore
Date: Tue,  4 Jul 2023 19:35:21 +0800
Message-Id: <20230704113523.722206-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Jul 2023 11:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8115

This series is the original commits on master branch rebased on top
of mickledore. Sending to mickledore to make the RPi4 use linux-yocto 6.1=
.

I've verified latest Xen hypervisor with these patches can boot
linux-yocto 6.1 as Dom0 and all our internal Xen test cases passed.

Christopher Clark (1):
  rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4

Martin Jansa (1):
  rpi: linux-yocto: drop 5.15 bbappend

 .../{linux-yocto_5.15.bbappend =3D> linux-yocto_6.1.bbappend}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_5.15=
.bbappend =3D> linux-yocto_6.1.bbappend} (51%)

--=20
2.25.1



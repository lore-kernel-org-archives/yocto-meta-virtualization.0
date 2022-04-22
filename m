Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EB0C4332F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10570.1650644343326652231
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C2D1FB;
	Fri, 22 Apr 2022 09:19:02 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194D93F5A1;
	Fri, 22 Apr 2022 09:19:01 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] xen: Add missing space in append to IMAGE_INSTALL
Date: Fri, 22 Apr 2022 17:18:50 +0100
Message-Id: 
 <bba589c4be43035a5b84d5d470a0d62c2f14cd83.1650644264.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7211

Add a space before doing an append in IMAGE_INSTALL on x86.
This is solving issues happening if someone is using IMAGE_INSTALL in
local.conf to add things to the generated image.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/images/xen-image-minimal.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-exten=
ded/images/xen-image-minimal.bb
index f6fa5ed..3cf4230 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -21,8 +21,8 @@ IMAGE_INSTALL +=3D " \
 do_build[depends] +=3D "xen:do_deploy"
=20
 # Networking for HVM-mode guests (x86/64 only) requires the tun kernel m=
odule
-IMAGE_INSTALL:append:x86    =3D "kernel-module-tun"
-IMAGE_INSTALL:append:x86-64 =3D "kernel-module-tun"
+IMAGE_INSTALL:append:x86    =3D " kernel-module-tun"
+IMAGE_INSTALL:append:x86-64 =3D " kernel-module-tun"
=20
 # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
 XEN_PCIBACK_MODULE =3D ""
--=20
2.25.1



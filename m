Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04962CCA483
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 11:02:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20645.1657710167266736917
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 04:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26A851424;
	Wed, 13 Jul 2022 04:02:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 433DF3F70D;
	Wed, 13 Jul 2022 04:02:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] xen: remove obsolete sdl PACKAGECONFIG
Date: Wed, 13 Jul 2022 12:02:40 +0100
Message-Id: <20220713110240.1294624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 11:02:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7453

Nothing in Xen respects --enable-sdl, and nothing in Xen links to libSDL,
so this PACKAGECONFIG is obsolete.

It looks like the last user of SDL in Xen was removed in "Remove
internal tools/ioemu tree"[1] back in 2008.

[1] xen 19dc3860dcfde9bc4ec4ef35bb1337e13276f630

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/xen/xen.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2bbf1e3..5937763 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -7,12 +7,10 @@ inherit autotools-brokensep pkgconfig
 require xen-arch.inc
=20
 PACKAGECONFIG ??=3D " \
-    sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)=
} \
     "
=20
 PACKAGECONFIG[lzo] =3D ",,lzo"
-PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpoli=
cy-native,"
 PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd,"
 PACKAGECONFIG[externalblktap] =3D ",,,"
--=20
2.34.1



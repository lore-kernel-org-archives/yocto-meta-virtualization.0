Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95EDC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 11:25:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5577.1653477916646010731
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 04:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0530E1FB;
	Wed, 25 May 2022 04:25:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CDFE3F70D;
	Wed, 25 May 2022 04:25:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [RFC PATCH] xen: make LZO dependency optional
Date: Wed, 25 May 2022 12:25:12 +0100
Message-Id: <20220525112512.2512972-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 11:25:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7318

xen-tools has an optional dependency on LZO.  As this is a unmaintained
compression format with better alternatives (such as Zstd), disable it
by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---

I'm trying to purge LZO from as much as possible, as it is unmaintained
and Zstd is a better all-rounder.  I hope to move lzo from oe-core to
meta-oe, so if you wish to keep LZO support enabled by default it will
continue to work.

 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d352ffb..ed6e6a7 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -11,6 +11,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)=
} \
     "
=20
+PACKAGECONFIG[lzo] =3D ",,lzo"
 PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpoli=
cy-native,"
 PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd,"
@@ -41,7 +42,6 @@ DEPENDS =3D " \
     procps \
     python3 \
     libaio \
-    lzo \
     util-linux \
     xz \
     yajl \
--=20
2.25.1



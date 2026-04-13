Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63393F34C46
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:53:00 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270510.1776081171468248847
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 04:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=GsVa/1h1;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5C2433D818B9
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:52:50 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id LFZcT_7mC6Vg; Mon, 13 Apr 2026 07:52:49 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 90DC93D818C5;
	Mon, 13 Apr 2026 07:52:49 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 90DC93D818C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1776081169; bh=m7wgrgcVbVTXxYxjfXc60nzOTy0REfHP0dGLKDj4suE=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=GsVa/1h1qyqcvrjH7+lr6+7kOpeszecSGY3oR2nSj/LGKGe3ZxWmWwZMvi+HBTbhW
	 07+Y1dv2xDOd8y17piN2h6+Z3g1z5E2CM8zbElT279xy8NjZ3LamqyXq4Gh6Uw/VX8
	 Z6Kx34TUwuN+NefSW3ZWWPg5EV3tn43NdEzO+v92bREJBknmlapccBqr4SFzoYaXog
	 TyQpmm2Lfi8vmrkCkVcRjvTxVzk2RnJaIUGBZ5X0XUjdTWYfjnjwYrMFT/fueArJmt
	 vEZYv0D6NqNA0X6H/ixByZ9BNyRdvZMFzxFg+rD1j33uq48AhciFJ5LB4oVOcfqEt9
	 bVLJ+gGj6vMTw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2-pCY_hKx0m2; Mon, 13 Apr 2026 07:52:49 -0400 (EDT)
Received: from traufflet.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 05CCF3D818B9;
	Mon, 13 Apr 2026 07:52:48 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: paul.leguendekerneizon@savoirfairelinux.com,
	Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH] libvirt-dbus: disable -Werror=inline to fix build error
Date: Mon, 13 Apr 2026 13:52:39 +0200
Message-ID: <20260413115239.79131-1-tanguy.raufflet@savoirfairelinux.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 11:53:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9695

The meson.build from libvirt-dbus enables the flag -Winline. Combined
with -Werror from Yocto, this causes a build failure because GCC refuses
to inline g_autoptr_cleanup_generic_gfree() from the glib header
glib-autocleanups.h, as it considers the call unlikely and estimates
code size would grow.

Because the function g_autoptr_cleanup_generic_gfree is defined as
static inline with good reason, this patch disables -Werror=3Dinline for
libvirt-dbus to allow the build to succeed.

Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
---
 recipes-extended/libvirt/libvirt-dbus_1.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb b/recipes-ext=
ended/libvirt/libvirt-dbus_1.4.1.bb
index 767470e2..e4859b0b 100644
--- a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
+++ b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
@@ -16,6 +16,8 @@ SRCREV =3D "0c355bb8921d7cbccf93f41a8615fcd973e64f70"
=20
 inherit meson pkgconfig
=20
+CFLAGS:append =3D " -Wno-error=3Dinline"
+
 FILES:${PN} +=3D "\
     ${datadir}/dbus-1/* \
     ${datadir}/polkit-1/* \
--=20
2.53.0



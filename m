Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2E4ED7B8F
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 09:01:03 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14349.1776157254214782275
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=hjOxJS4X;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 27E363D81689
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 05:00:53 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id tlf3B-Mwbim5; Tue, 14 Apr 2026 05:00:52 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2CA6D3D816E0;
	Tue, 14 Apr 2026 05:00:52 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 2CA6D3D816E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1776157252; bh=PefTAhcs5g3QEV6ssQk3StGU0tQGpiALrrXm3TN47/Y=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=hjOxJS4XbGygrM3cPdF6XyPIpdcWPk1DDFnszq67057z4eNLFALykXLwLaJzZy7if
	 BoGY/A1sAmw7HJ6CQ4IyNI/nRhpLNCEwuwtjz5AU9NDgwXvipQ6zbFDJC/YYANpny7
	 c6aoM2gFAiX1fm6BV30wuTHt3DecWIcEVSITXlNz3j3xFZQs+1NFmal6uVG+jF2kug
	 /EAbmLDsPXrYVcWuS6o4Th8K5BUv0tRRb+AZrdCmBpNrupaHWnfxStioVkIoYyDox3
	 yqYtiYnwRTIRD4rVNKwkszVk1LuwuQolCHK+CU0lkXWVBovIfzG9U9bXGlSy7HqlRg
	 8YxIKeun2bKGA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id xQAqlVcGKp82; Tue, 14 Apr 2026 05:00:52 -0400 (EDT)
Received: from traufflet.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8175C3D81689;
	Tue, 14 Apr 2026 05:00:51 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: paul.leguendekerneizon@savoirfairelinux.com,
	Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH v2] libvirt-dbus: disable -Werror=inline to fix build error
Date: Tue, 14 Apr 2026 11:00:10 +0200
Message-ID: <20260414090010.79091-1-tanguy.raufflet@savoirfairelinux.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 09:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9702

The meson.build from libvirt-dbus enables the flag -Winline. Combined
with -Werror from Yocto, this causes a build failure because GCC refuses
to inline g_autoptr_cleanup_generic_gfree() from the glib header
glib-autocleanups.h, as it considers the call unlikely and estimates
code size would grow.

Because the function g_autoptr_cleanup_generic_gfree is defined as
static inline with good reason, this patch disables -Werror=3Dinline for
libvirt-dbus to allow the build to succeed.

Note: This patch is a workaround for a build issue in libvirt-dbus. The
underlying issue has been fixed [1] upstream in the libvirt-dbus project.
Once the next version of libvirt-dbus is released that includes the fix,
this patch should be removed.

[1]: build: Do not use -Winline
    SHA: c0fffce8c45e79b73bcb63fac70e24a827367dce
    Repo: https://gitlab.com/libvirt/libvirt-dbus

Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
---
Changes in v2:
- Added comment referencing upstream fix and note to remove on next
version bump
- Link to v1:
https://lists.yoctoproject.org/g/meta-virtualization/message/9695
---
 recipes-extended/libvirt/libvirt-dbus_1.4.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb b/recipes-ext=
ended/libvirt/libvirt-dbus_1.4.1.bb
index 767470e2..17db13a9 100644
--- a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
+++ b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
@@ -16,6 +16,10 @@ SRCREV =3D "0c355bb8921d7cbccf93f41a8615fcd973e64f70"
=20
 inherit meson pkgconfig
=20
+# Fixed upstream but not yet released. Remove on next version bump.
+# https://gitlab.com/libvirt/libvirt-dbus/-/commit/c0fffce8c45e79b73bcb6=
3fac70e24a827367dce
+CFLAGS:append =3D " -Wno-error=3Dinline"
+
 FILES:${PN} +=3D "\
     ${datadir}/dbus-1/* \
     ${datadir}/polkit-1/* \
--=20
2.53.0



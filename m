Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2C3C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 15:30:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56592.1656430216187428812
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 08:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1FD6152B;
	Tue, 28 Jun 2022 08:30:15 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3836A3F66F;
	Tue, 28 Jun 2022 08:30:15 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	christopher.w.clark@gmail.com
Subject: [PATCH] xen/sysvinit: add hvc0 console only if not there already
Date: Tue, 28 Jun 2022 16:29:54 +0100
Message-Id: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jun 2022 15:30:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7400

The base inittab recipe is creating inittab entries for consoles listed
in SERIAL_CONSOLES.
For qemu, this contains "115200,hvc0" so an entry is created in inittab
for it.
Prevent to create a second entry if hvc0 is present in SERIAL_CONSOLES.

On qemuarm, this solves issues with the console when starting on top of
Xen as dom0.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-core/sysvinit/sysvinit-inittab_xen.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-cor=
e/sysvinit/sysvinit-inittab_xen.inc
index 7f92bd1..724f47d 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
+++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
@@ -1,4 +1,10 @@
+
+
 do_install:append() {
-                echo "" >> ${D}${sysconfdir}/inittab
-                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115=
200 hvc0" >> ${D}${sysconfdir}/inittab
+    # if SERIAL_CONSOLES contains hvc0, it is already added in inittab s=
o do
+    # not add it twice
+    if echo "${SERIAL_CONSOLES}" | grep -vq "hvc0"; then
+        echo "" >> ${D}${sysconfdir}/inittab
+        echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0=
" >> ${D}${sysconfdir}/inittab
+    fi
 }
--=20
2.25.1



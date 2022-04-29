Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02813C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9223.1651234306192267704
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 05:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F0F2106F;
	Fri, 29 Apr 2022 05:11:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DBF13F73B;
	Fri, 29 Apr 2022 05:11:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] xen: use vgabios 0.8a
Date: Fri, 29 Apr 2022 13:11:36 +0100
Message-Id: <20220429121136.2287359-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429121136.2287359-1-ross.burton@arm.com>
References: <20220429121136.2287359-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 12:11:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7231

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/xen/xen.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 8b86de5..bb7bdb8 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -135,8 +135,8 @@ EXTRA_OECONF +=3D " \
     ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim',=
 '--disable-pvshim', d)} \
     "
=20
-EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/v=
gabios-0.7a.bin"
-EXTRA_OEMAKE +=3D "CIRRUSVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios-0.7a.cirrus.bin"
+EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/v=
gabios-0.8a.bin"
+EXTRA_OEMAKE +=3D "CIRRUSVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios-0.8a.cirrus.bin"
 EXTRA_OEMAKE +=3D "SEABIOS_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/=
bios.bin"
 EXTRA_OEMAKE +=3D "ETHERBOOT_ROMS=3D${STAGING_DIR_HOST}/usr/share/firmwa=
re/rtl8139.rom"
=20
--=20
2.25.1



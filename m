Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F06AF34C43
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:47:20 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270441.1776080835361863587
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 04:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=aj9UMqkJ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 409013D818B9
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:47:14 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Cgx4lX0Z_1XN; Mon, 13 Apr 2026 07:47:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 267363D818C6;
	Mon, 13 Apr 2026 07:47:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 267363D818C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1776080833; bh=bZJYFZBgWsosBJ5eQQo/JsvBCHZI6HJXkImDFX40CCg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=aj9UMqkJ1vDMF6/QXynBSGsyQ52Bp3jkAW3csfeiMxlxI2PM4Yc4h2/tP+RtnVFOv
	 F1bitG4lqS3QPS6bdzD5oGe9yiXS9d6XNrKvXKtNQ4r7rB4UjC+WxNO75D3Kf7Bct3
	 RZYoGe5vzYwMcCP+Nx8Y4452gnijTCH2AWAbzsOiVqC1/tTzaqEoUdhN9hoIzSKU3T
	 ugWpoK/jytuRwbHPxadKYBjSvM6lMp41G5cvQVnv+Ne2KJeN7aIaEVIYPWD44jNWL7
	 dtLBvCRZut6e001BRpwZ2r7uGeZhuRJPAxUuAqrCEYnFEKv8Dxj+UHr+f44tEWzOOh
	 XcPzRdckaj3Aw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id hbcMEhXLAi3w; Mon, 13 Apr 2026 07:47:13 -0400 (EDT)
Received: from traufflet.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 802603D818B9;
	Mon, 13 Apr 2026 07:47:12 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: paul.leguendekerneizon@savoirfairelinux.com,
	Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH] cockpit-machines: remove autotools inheritance
Date: Mon, 13 Apr 2026 13:47:00 +0200
Message-ID: <20260413114700.74906-1-tanguy.raufflet@savoirfairelinux.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 11:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9694

The commit [1] from openembedded-core, removes the possibility to use
autotools bbclass when the configure script is missing. Because the
cockpit-machines release tarball always ships pre-built assets in dist/,
there is no need to use autotools to build the package.

This commit fixes the following build error:
    ERROR: cockpit-machines-346-r0 do_configure: no configure script
    found at ./configure

[1]: autotools: require that a configure script exists
    SHA: 6d327a39befae44a88a812bdf4acde800dcee57b

Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
---
 .../cockpit-machines/cockpit-machines_346.bb   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/=
recipes-extended/cockpit-machines/cockpit-machines_346.bb
index 8aaac4c5..d23c39b2 100644
--- a/recipes-extended/cockpit-machines/cockpit-machines_346.bb
+++ b/recipes-extended/cockpit-machines/cockpit-machines_346.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "c9d80357da2bf3ecda9698f0dc6fcb4=
6675b3b76da9150a22178071fe9
=20
 S =3D "${UNPACKDIR}/${PN}"
=20
-inherit autotools-brokensep features_check gettext
+inherit features_check
=20
 # systemd, which cockpit is dependent, is not compatible with musl lib
 COMPATIBLE_HOST:libc-musl =3D "null"
@@ -24,10 +24,20 @@ RDEPENDS:${PN} +=3D "cockpit libvirt-dbus pciutils vi=
rt-manager-install"
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd pam"
=20
-# Default installation path of cockpit-machines is /usr/local/
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}${datadir}/cockpit/machines
+    cp -r ${S}/dist/* ${D}${datadir}/cockpit/machines/
+
+    install -d ${D}${datadir}/metainfo
+    install -m 0644 ${S}/org.cockpit_project.machines.metainfo.xml ${D}$=
{datadir}/metainfo/
+}
+
 FILES:${PN} =3D "\
-    ${prefix}/local/ \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
+    ${datadir}/cockpit/machines/ \
+    ${datadir}/metainfo/org.cockpit_project.machines.metainfo.xml \
 "
=20
 SKIP_RECIPE[cockpit-machines] ?=3D "${@bb.utils.contains('BBFILE_COLLECT=
IONS', 'webserver', '', 'Depends on meta-webserver which is not included'=
, d)}"
--=20
2.53.0



Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C92ACD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:12:20 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.18216.1710861132855323018
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=l1/yeS2Y;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2B4919C4661
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 11:12:12 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4WzxcG3KEryq; Tue, 19 Mar 2024 11:12:11 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 726C79C536A;
	Tue, 19 Mar 2024 11:12:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 726C79C536A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1710861131; bh=AFhez4rK4Adz5p9Q6BYB7fL4xP1NMZ7rl7DODU/6SgI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=l1/yeS2YrqnUfJ7GIZYhrvuxsUWIPL1WSWH9GwrM5yBd3l7rGq7ovwIegrne20IF3
	 v0Uy9i38RscSZWrHGiQVaxlryhKxYYQO+aMt5SCNW+7KbJkUZdeVs3V651IMTNhGe5
	 GERm4hYJaECLdd4Kk2YkTQVDgemvlfBuLgG9cJExDf99HkHCBOGz3OpGYwJY/OD0nQ
	 b1WdATyUgXjhMSdYwbJ+nHEZ61se/vm/DQpM/KiIqroWI1gUoMJHhdFTOfWJdP0MhO
	 zRii9vaVh6+gAnc2zBHrVZFIPxrR4z9fD+kW8bboUTi4zeJdclXxedNIFitVdIHV7W
	 pTYumKmZq3rqw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0rhED44KAIxC; Tue, 19 Mar 2024 11:12:11 -0400 (EDT)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E5BB19C4661;
	Tue, 19 Mar 2024 11:12:10 -0400 (EDT)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?UTF-8?q?Mathieu=20Dupr=C3=A9?= <mathieu.dupre@savoirfairelinux.com>,
	Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 1/1] libvirt: add libvirt-dbus
Date: Tue, 19 Mar 2024 16:12:01 +0100
Message-Id: <20240319151201.27522-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319151201.27522-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20240319151201.27522-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8645

From: Mathieu Dupr=C3=A9 <mathieu.dupre@savoirfairelinux.com>

libvirt-dbus provides a dBus interface for libvirt. It can be needed as
dependency for some virtualization packages, such as
`cockpit-machines`.
Compilation tested on x86-64 and aarch64 machines.

Signed-off-by: Mathieu Dupr=C3=A9 <mathieu.dupre@savoirfairelinux.com>
Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 .../libvirt/libvirt-dbus_1.4.1.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt-dbus_1.4.1.bb

diff --git a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb b/recipes-ext=
ended/libvirt/libvirt-dbus_1.4.1.bb
new file mode 100644
index 00000000..3f6da334
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "dBus wrapper for libvirt"
+DESCRIPTION =3D "libvirt-dbus wraps libvirt API to provide a high-level =
object-oriented API better suited for dbus-based applications."
+AUTHOR =3D "Lars Karlitski <lars@karlitski.net> Pavel Hrdina <phrdina@re=
dhat.com> Katerina Koukiou <kkoukiou@redhat.com>"
+HOMEPAGE =3D "https://www.libvirt.org/dbus.html"
+BUGTRACKER =3D "https://gitlab.com/libvirt/libvirt-dbus/-/issues"
+SECTION =3D "libs"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+CVE_PRODUCT =3D "libvirt-dbus"
+
+DEPENDS +=3D "glib-2.0 libvirt libvirt-glib python3-docutils-native"
+
+SRC_URI =3D "git://gitlab.com/libvirt/libvirt-dbus.git;nobranch=3D1;prot=
ocol=3Dhttps"
+
+SRCREV =3D "0c355bb8921d7cbccf93f41a8615fcd973e64f70"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+FILES:${PN} +=3D "\
+    ${datadir}/dbus-1/* \
+    ${datadir}/polkit-1/* \
+"
--
2.34.1


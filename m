Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F5AC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:31:21 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.8702.1667320271563313038
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 09:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout09.t-online.de (Postfix) with SMTP id 902AE115C7
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:30:33 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.78]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opu9l-1N80jC0; Tue, 1 Nov 2022 17:30:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCHv2 2/2] virt-viewer: add recipe
Date: Tue,  1 Nov 2022 17:30:18 +0100
Message-Id: <20221101163018.741907-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101163018.741907-1-f_l_k@t-online.de>
References: <20221101163018.741907-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667320229-F37F2ECF-5E33BF81/0/0 CLEAN NORMAL
X-TOI-MSGID: 6f4a9439-4bc4-4363-bde0-c9e219e33036
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Nov 2022 16:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7672

virt-viewer is a minimal tool for displaying the graphical console of a v=
irtual machine.
The console is accessed using the VNC or SPICE protocol. The guest can be=
 referred to
based on its name, ID, or UUID. If the guest is not already running, then=
 the viewer can
be told to wait until it starts before attempting to connect to the conso=
le. The viewer
can connect directly to both local and remotely hosted machines , optiona=
lly using SSL/TLS
encryption.

virt-viewer is the required client for the debian based proxmox ve. That'=
s also the environ-
ment for which it was tested at runtime (only on x86_64).

I have successfully compiled it for x86_64, aarch64 and qemumips. Other p=
latforms might work
(as long as gobject-introspection is available), but are untested.
Adding the vnc protocol would pull in a layer dependency on meta-gnome.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../virt-viewer/virt-viewer_11.0.bb           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-extended/virt-viewer/virt-viewer_11.0.bb

diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb b/recipes-e=
xtended/virt-viewer/virt-viewer_11.0.bb
new file mode 100644
index 0000000..d71e558
--- /dev/null
+++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "Virtual Machine Viewer"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
+
+# for ovirt support librest-0.7 and libgovirt would be needed
+DEPENDS =3D " \
+	desktop-file-utils-native \
+	glib-2.0 \
+	gtk+3 \
+	libxml2 \
+"
+
+SRC_URI =3D "git://gitlab.com/virt-viewer/virt-viewer.git;protocol=3Dhtt=
ps;branch=3Dmaster"
+
+SRCREV =3D "1e99e5e4f409da91638eb79067ec738994c28ef5"
+PV =3D "11.0+git${SRCPV}"
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ?=3D "libvirt spice vte"
+
+PACKAGECONFIG[libvirt] =3D "-Dlibvirt=3Denabled,-Dlibvirt=3Ddisabled,lib=
virt libvirt-glib"
+PACKAGECONFIG[spice] =3D "-Dspice=3Denabled,-Dspice=3Ddisabled,spice-gtk=
 spice-protocol"
+PACKAGECONFIG[vnc] =3D "-Dvnc=3Denabled,-Dvnc=3Ddisabled,gtk-vnc"
+PACKAGECONFIG[vte] =3D "-Dvte=3Denabled,-Dvte=3Ddisabled,vte"
+
+inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspecti=
on
+
+FILES:${PN} +=3D "${datadir}"
+GIR_MESON_OPTION =3D ''
--=20
2.34.1



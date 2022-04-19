Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D3DC4167D
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.540.1650393117996523290
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 11:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4BE1063;
	Tue, 19 Apr 2022 11:31:56 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A92A3F73B;
	Tue, 19 Apr 2022 11:31:56 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-xencommons
 do_package
Date: Tue, 19 Apr 2022 19:31:48 +0100
Message-Id: 
 <d09e1d916ac46ed47636f2e3a0f4d3673f12f24d.1650389597.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7194

With the patch "xen: only package xencommon systemd components if systemd=
 is
enabled" (c9554c6), the following error is displayed:

    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package: QA Issu=
e:
    xen-tools: Files/directories were installed but not shipped in any pa=
ckage:
        /etc/init.d/xencommons

To fix this, we need to conditionally include/exclude files in do_install
depending on whether or not systemd is in the DISTRO_FEATURES.

Also, take the opportunity to have the relevant extra sed processing in t=
hese
conditionals.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Change since v1:
 * Added missing ${D} when removing unnecessary files.
---
 recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
index 6bbc8cd..4acf054 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -805,14 +805,22 @@ do_install() {
         for i in $VOLATILE_DIRS; do
             echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfile=
s.d/xen.conf
         done
-    fi
=20
-    # fixup default path to qemu-system-i386
-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/qemu=
-system-i386"#' ${D}/etc/init.d/xencommons
+        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend=
.service ]; then
+            sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D=
/usr/bin/qemu-system-i386\1#' \
+                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend=
.service
+        fi
+
+        # remove sysvinit specific file:
+        rm -rf ${D}${sysconfdir}/init.d/xencommons
+
+    # sysvinit
+    else
+        # fixup default path to qemu-system-i386
+        sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/=
qemu-system-i386"#' ${D}/etc/init.d/xencommons
=20
-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.ser=
vice ]; then
-        sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D/usr=
/bin/qemu-system-i386\1#' \
-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.ser=
vice
+        # remove systemd specific files
+        rm -rf ${D}${systemd_unitdir}
     fi
 }
=20
--=20
2.35.1



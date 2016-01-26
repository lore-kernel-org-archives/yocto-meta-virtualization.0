Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C094E00BFE; Tue, 26 Jan 2016 11:10:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f196.google.com (mail-yk0-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 415C5E00BFD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:51 -0800 (PST)
Received: by mail-yk0-f196.google.com with SMTP id v14so15389555ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9lq+SL66bNP2kFXSvV2/4dE0j2JAFpnoFWECWLMzgFg=;
	b=SAXTUwLWreg3W/EuFqfDnn6tD3cperf0p+3WYeQpWnUAHmVxXrd30+m7beze/EZxBs
	hB9a9hicweWb3EEHhfEmNn3wDy+YdDG/iHAoWzfwr5Q1koF7Y0MXtgFvuKrE45r5aEvp
	SuGr/qS+t7Moc0x9Br4Wid2S9+uTFO5Aj9N/zEDdgcmqlxk2AFPgsAg5fohyN3mvGW4C
	3O+MxBGwexMaR7+la+1on8fr9C123D3rYZqQ4ycBzQfSMgQqcFScAejHvdCPmo3L+sUx
	KC/zrY+qPJLcPPXbfpQ0n5ViFcgpnF61SWHXtDaNqt4PVpWh96nD9lGTB00kHDr8wdSC
	Y/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9lq+SL66bNP2kFXSvV2/4dE0j2JAFpnoFWECWLMzgFg=;
	b=MzTV6Dl5bkVnwnN44iOY3pNNkUvUQYYGVE5vPerWIxSOvHFef57Cn3sNhmKsiTxSOm
	F/NWnK65nqTzQucimyJ0i0j0ZlxoG188sdJqUIJ0FlWPAACm82pmPzGUaGRmmJH2Meqp
	Fmh6AhIyy0iPZScy5Gwbiqn4++GejkOnNugBvK3Rw/WGqpb0eiz/Xoyj8mAsWJ2nFhcy
	4+FjdA7pG4dgpKZK1/pQ2ZUu9GcRMuJ3TQzIENHLkRnH+nYeS2SCfCeR7zEtrW1AqFhn
	MJSjQGISRnNoCn/g/wNteecHwkKyVmPR25AqKR49TE5MBdPa01KxR3A6cRr12VfI3kCP
	xtfg==
X-Gm-Message-State: AG10YOSAhGYd4Iu8+L+/TUJjEoFrlq1jFIb2BRZqPyad4ub8b4NDgxDhA4rwGO78u4AWlg==
X-Received: by 10.37.39.69 with SMTP id n66mr13466469ybn.6.1453835390689;
	Tue, 26 Jan 2016 11:09:50 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:49 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:21 -0600
Message-Id: <1453835364-6473-6-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 5/8] xen: move bits common to all Xen versions to xen.inc
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jan 2016 19:10:02 -0000

These items are common for all Xen versions since at least 4.5 and newer
so these should just go in the common include file.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      | 14 ++++++++++++++
 recipes-extended/xen/xen_4.6.0.bb | 17 -----------------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 86508ff..a46421b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -693,6 +693,11 @@ python () {
         raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH', True))
 }
 
+# Yocto appends ${PN} to libexecdir by default and Xen appends 'xen' as well
+# the result is a nested xen/xen/ so let's avoid that by shunning Yocto's
+# extra ${PN} appended.
+libexecdir = "${libdir}"
+
 # hardcoded as Linux, as the only compatible hosts are Linux.
 export XEN_OS = "Linux"
 
@@ -720,8 +725,17 @@ EXTRA_OECONF += " \
     --disable-xenstore-stubdom \
     --disable-rombios \
     --disable-ocamltools \
+    --with-initddir=${INIT_D_DIR} \
+    --with-sysconfig-leaf-dir=default \
+    --with-system-qemu=/usr/bin/qemu-system-i386 \
+    --disable-qemu-traditional \
     "
 
+EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
+EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.cirrus.bin"
+EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
+EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
+
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG', True)
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 95570a7..93c6d2e 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -10,23 +10,6 @@ SRC_URI[sha256sum] = "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478
 
 S = "${WORKDIR}/xen-${PV}"
 
-# Xen suffixes the libexecdir within its configure scripts, prevent the nested xen/xen/
-libexecdir = "${libdir}"
-
-# These options override detected values from the build.
-EXTRA_OECONF_append += " \
-    --with-initddir=${INIT_D_DIR} \
-    --with-sysconfig-leaf-dir=default \
-    --with-system-qemu=/usr/bin/qemu-system-i386 \
-    --disable-qemu-traditional \
-    "
-
-EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
-EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.cirrus.bin"
-EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
-EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
-#EXTRA_OEMAKE += "XENGFX_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios.bin"
-
 do_install_append() {
     # fixup default path to qemu-system-i386
     sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
-- 
2.4.10



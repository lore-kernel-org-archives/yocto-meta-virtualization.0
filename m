Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14993E00C4C; Tue, 22 Dec 2015 11:02:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.48 listed in list.dnswl.org]
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA9F2E009F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:50 -0800 (PST)
Received: by mail-qg0-f48.google.com with SMTP id c96so117448899qgd.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Qv5imQYNyobOlFG5tFmDm/i/Gq4ExTpQm6zyzDQq6SA=;
	b=tCWhk8X6dXlTHpUdR4jD1zvtelFlF9GkvpdsGYckj7ffWmaCvpoMOtxf+MLDpSHFA5
	AZqaX8APeuaIgp0QCWk3RDnzin10fzpnSsDhxQ36yofi4BNidYErJMRWzC6AAjZ93tWt
	b2G30rLJM2KGNdulXSFgjYxDItqU8gtJut20g9Nhn/PB8xS6qdlITFdpzqXeSzTanOUA
	yo5j3knK1hz0IyKZkuQpmgV37hcAvYuUKPg++EOnFuS74dO4ji4xov6G7Vwebd03bQBE
	dOaWN3fcBD3qLsjOk8tLm5kdGtRXc+of1bRbwZv2J0wyHaCk+Nsn7rfaMq7mg7gOk6X0
	gL5A==
X-Received: by 10.140.85.102 with SMTP id m93mr35233178qgd.83.1450810969572;
	Tue, 22 Dec 2015 11:02:49 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	m107sm16558240qgm.19.2015.12.22.11.02.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 11:02:49 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Dec 2015 14:02:24 -0500
Message-Id: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2 1/5] seabios: uprev to 1.9.0
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
X-List-Received-Date: Tue, 22 Dec 2015 19:02:53 -0000

SeaBIOS 1.7.5 fails to compile on newer gcc, so update it! :)

Also removing PR while I'm here.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/seabios/seabios_1.7.5.bb |   45 -----------------------------
 recipes-extended/seabios/seabios_1.9.0.bb |   43 +++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-extended/seabios/seabios_1.7.5.bb
 create mode 100644 recipes-extended/seabios/seabios_1.9.0.bb

diff --git a/recipes-extended/seabios/seabios_1.7.5.bb b/recipes-extended/seabios/seabios_1.7.5.bb
deleted file mode 100644
index d57e250..0000000
--- a/recipes-extended/seabios/seabios_1.7.5.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "SeaBIOS"
-HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
-LICENSE = "LGPLv3"
-SECTION = "firmware"
-
-SRC_URI = " \
-    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
-    file://hostcc.patch \
-    file://defconfig \
-    "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
-                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
-                    "
-
-SRC_URI[md5sum] = "3f1e17485ca327b245ae5938d9aa02d9"
-SRC_URI[sha256sum] = "858d9eda4ad91efa1c45a5a401d560ef9ca8dd172f03b0a106f06661c252dc51"
-
-PR = "r0"
-
-FILES_${PN} = "/usr/share/firmware"
-
-DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
-
-TUNE_CCARGS = ""
-EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
-EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
-
-do_configure() {
-    install -m 0644 "${WORKDIR}/defconfig" .config
-    oe_runmake oldconfig
-}
-
-do_compile() {
-    unset CPP
-    unset CPPFLAGS
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake
-    install -d ${D}/usr/share/firmware
-    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
-}
-
diff --git a/recipes-extended/seabios/seabios_1.9.0.bb b/recipes-extended/seabios/seabios_1.9.0.bb
new file mode 100644
index 0000000..fcdc0c5
--- /dev/null
+++ b/recipes-extended/seabios/seabios_1.9.0.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "SeaBIOS"
+HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
+LICENSE = "LGPLv3"
+SECTION = "firmware"
+
+SRC_URI = " \
+    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
+    file://hostcc.patch \
+    file://defconfig \
+    "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
+                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
+                    "
+
+SRC_URI[md5sum] = "c3fea87e731e396bd4e7e2c478ba39d9"
+SRC_URI[sha256sum] = "88595545c6d580a7a6da1c40befc46dd74c0e4aaf808547867dd7ce8cc3b4d0e"
+
+FILES_${PN} = "/usr/share/firmware"
+
+DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
+
+TUNE_CCARGS = ""
+EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
+EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
+
+do_configure() {
+    install -m 0644 "${WORKDIR}/defconfig" .config
+    oe_runmake oldconfig
+}
+
+do_compile() {
+    unset CPP
+    unset CPPFLAGS
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake
+    install -d ${D}/usr/share/firmware
+    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
+}
+
-- 
1.7.10.4



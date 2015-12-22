Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23D43E00C51; Mon, 21 Dec 2015 17:24:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABE81E0088B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
Received: by mail-qg0-f54.google.com with SMTP id o11so44677201qge.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XtTlIj1lqltvIx2U7gpTfmWOc41yuqKC3Sfe/FyzKRU=;
	b=V6y1rKw+EK3sqh1QUGL8nkYA+/Utn/LY3rsB4LDdmhlROkdcQ0bmAt2XMWhcAxogUj
	PrI1199Qhif5/i2es1N2XDjbs+uUqzFeliptuPyrFxrNwcgFgFUhZZz/nRczQSyquoRi
	k2W99yS4byQa5wDKY3TIWTBYfcJ4pwKegPXpbz65KvLCpWSnjl93b8gZkn3tes46AYdz
	nho6I7yt0HDqKQ3XlpUczI4j5ZOJAYVY/Y49L8rYJ2w5z/fzLlSPDjA2eamw0rqgQ6DB
	8lvsGBL4nauhnHcPmrcFyk/tFnUus9wOUTM04WdBJgTwACp6Bxz3JSslmvamEYYVZ4dx
	I3cg==
X-Received: by 10.140.19.229 with SMTP id 92mr28792843qgh.100.1450747440883;
	Mon, 21 Dec 2015 17:24:00 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	o51sm6344305qge.34.2015.12.21.17.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2015 17:24:00 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Dec 2015 20:23:54 -0500
Message-Id: <1450747435-5738-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 01:24:04 -0000

- Fixup LICENSE checksum.
- Add patch to skip a check that breaks in cross-compile environments.
- Drop udev package that has been removed.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/files/skip-headers.chk.patch |   48 +++++++++++++++++++
 recipes-extended/xen/xen.inc                      |   13 +-----
 recipes-extended/xen/xen_4.5.0.bb                 |   50 --------------------
 recipes-extended/xen/xen_4.6.0.bb                 |   51 +++++++++++++++++++++
 4 files changed, 100 insertions(+), 62 deletions(-)
 create mode 100644 recipes-extended/xen/files/skip-headers.chk.patch
 delete mode 100644 recipes-extended/xen/xen_4.5.0.bb
 create mode 100644 recipes-extended/xen/xen_4.6.0.bb

diff --git a/recipes-extended/xen/files/skip-headers.chk.patch b/recipes-extended/xen/files/skip-headers.chk.patch
new file mode 100644
index 0000000..19ce7bf
--- /dev/null
+++ b/recipes-extended/xen/files/skip-headers.chk.patch
@@ -0,0 +1,48 @@
+commit 162c1db56f3126f392269cb81808657e55c395e5
+Author: Chris Patterson <cjp256@gmail.com>
+Date:   Mon Dec 21 19:49:43 2015 -0500
+
+    Makefile: remove headers.chk which breaks in cross compilation environments
+    
+    Signed-off-by: Chris Patterson <cjp256@gmail.com>
+
+diff --git a/xen/include/Makefile b/xen/include/Makefile
+index 94ba3d8..dd51d5b 100644
+--- a/xen/include/Makefile
++++ b/xen/include/Makefile
+@@ -87,35 +87,5 @@ compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) Makefile
+ 	cat $(filter %.h,$^) >$@.new
+ 	mv -f $@.new $@
+ 
+-ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
+-
+-all: headers.chk headers++.chk
+-
+-PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h) $(public-y))
+-
+-PUBLIC_ANSI_HEADERS := $(filter-out public/%ctl.h public/xsm/% public/%hvm/save.h, $(PUBLIC_HEADERS))
+-
+-headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
+-	for i in $(filter %.h,$^); do \
+-	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
+-	          -S -o /dev/null $$i || exit 1; \
+-	    echo $$i; \
+-	done >$@.new
+-	mv $@.new $@
+-
+-headers++.chk: $(PUBLIC_HEADERS) Makefile
+-	if $(CXX) -v >/dev/null 2>&1; then \
+-	    for i in $(filter %.h,$^); do \
+-	        echo '#include "'$$i'"' \
+-	        | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__ \
+-	          -include stdint.h -include public/xen.h -S -o /dev/null - \
+-	        || exit 1; \
+-	        echo $$i; \
+-	    done ; \
+-	fi >$@.new
+-	mv $@.new $@
+-
+-endif
+-
+ clean::
+ 	rm -rf compat headers.chk headers++.chk
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 00f1823..c1be16d 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
@@ -69,7 +69,6 @@ RDEPENDS_${PN}-base = "\
     ${PN}-fsimage \
     ${PN}-scripts-block \
     ${PN}-scripts-network \
-    ${PN}-udev \
     ${PN}-xen-watchdog \
     ${PN}-xencommons \
     ${PN}-xendomains \
@@ -99,7 +98,6 @@ RDEPENDS_${PN}-remus = "python"
 RDEPENDS_${PN}-scripts-block = "\
     bash \
     ${PN}-scripts-common \
-    ${PN}-udev \
     ${PN}-volatiles \
     "
 
@@ -109,12 +107,9 @@ RDEPENDS_${PN}-scripts-network = "\
     bash \
     bridge-utils \
     ${PN}-scripts-common \
-    ${PN}-udev \
     ${PN}-volatiles \
     "
 
-RDEPENDS_${PN}-udev = "udev"
-
 RDEPENDS_${PN}-xencommons = "\
     bash \
     ${PN}-console \
@@ -182,7 +177,6 @@ PACKAGES = "\
     ${PN}-scripts-common \
     ${PN}-scripts-network \
     ${PN}-staticdev \
-    ${PN}-udev \
     ${PN}-volatiles \
     ${PN}-xcutils \
     ${PN}-xencommons \
@@ -512,11 +506,6 @@ FILES_${PN}-scripts-common = " \
     ${sysconfdir}/xen/scripts/xen-script-common.sh \
     "
 
-FILES_${PN}-udev = "\
-    ${sysconfdir}/udev/rules.d/xen-backend.rules \
-    ${sysconfdir}/udev/rules.d/xend.rules \
-    "
-
 FILES_${PN}-volatiles = "\
     ${sysconfdir}/default/volatiles/99_xen \
     ${sysconfdir}/tmpfiles.d/xen.conf \
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
deleted file mode 100644
index 6c17b90..0000000
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
-    "
-
-SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
-SRC_URI[sha256sum] = "5bdb40e2b28d2eeb541bd71a9777f40cbe2ae444b987521d33f099541a006f3b"
-
-S = "${WORKDIR}/xen-${PV}"
-
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
-do_configure_prepend() {
-    # fixup AS/CC/CCP/etc variable within StdGNU.mk
-    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
-        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
-    done
-    # fixup environment passing in some makefiles
-    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
-
-    # libsystemd-daemon -> libsystemd for newer systemd versions
-    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
-}
-
-do_install_append() {
-    # fixup default path to qemu-system-i386
-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
-
-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
-        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
-    fi
-}
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
new file mode 100644
index 0000000..1c84a6f
--- /dev/null
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -0,0 +1,51 @@
+require xen.inc
+
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
+    file://skip-headers.chk.patch \
+    "
+
+SRC_URI[md5sum] = "48e232f90927c08326a7b52bb06f49bc"
+SRC_URI[sha256sum] = "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909"
+
+S = "${WORKDIR}/xen-${PV}"
+
+# Xen suffixes the libexecdir within its configure scripts, prevent the nested xen/xen/
+libexecdir = "${libdir}"
+
+# These options override detected values from the build.
+EXTRA_OECONF_append += " \
+    --with-initddir=${INIT_D_DIR} \
+    --with-sysconfig-leaf-dir=default \
+    --with-system-qemu=/usr/bin/qemu-system-i386 \
+    --disable-qemu-traditional \
+    "
+
+EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
+EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.cirrus.bin"
+EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
+EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
+#EXTRA_OEMAKE += "XENGFX_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios.bin"
+
+do_configure_prepend() {
+    # fixup AS/CC/CCP/etc variable within StdGNU.mk
+    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
+        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
+    done
+    # fixup environment passing in some makefiles
+    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
+
+    # libsystemd-daemon -> libsystemd for newer systemd versions
+    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
+}
+
+do_install_append() {
+    # fixup default path to qemu-system-i386
+    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
+
+    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
+        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
+            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
+    fi
+}
-- 
1.7.10.4



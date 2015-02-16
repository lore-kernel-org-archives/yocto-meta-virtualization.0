Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCD49E00754; Mon, 16 Feb 2015 00:35:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [207.46.100.61 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0061.outbound.protection.outlook.com [207.46.100.61])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 339ACE0088A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:03 -0800 (PST)
Received: from BY2FFO11FD037.protection.gbl (10.1.14.31) by
	BY2FFO11HUB015.protection.gbl (10.1.15.224) with Microsoft SMTP Server
	(TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:35:01 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD037.mail.protection.outlook.com (10.1.14.222) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5E-0002oF-9z; Mon, 16 Feb 2015 00:31:12 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:33 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <bd5cee4c335c4aa6832644657716fc5d@BY2FFO11FD037.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(199003)(189002)(377424004)(46102003)(92726002)(106466001)(2351001)(229853001)(76176999)(50986999)(85326001)(2950100001)(104016003)(53416004)(108616004)(87936001)(575784001)(92566002)(19580395003)(19580405001)(6806004)(47776003)(74316001)(77156002)(62966003)(110136001)(86362001)(50226001)(15975445007)(16601075003)(50466002)(48376002)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB015;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB015;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2FFO11HUB015; BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB015;
X-Forefront-PRVS: 0489CFBAC9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:00.8540 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB015
Subject: [PATCH 11/14] xen: break out firmware bits
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
X-List-Received-Date: Mon, 16 Feb 2015 08:35:23 -0000
Content-Type: text/plain

From: Chris Patterson <cjp256@gmail.com>

Added recipes for various xen firmware components:
- ipxe
- seabios
- vgabios

Signed-off-by: Chris Patterson <cjp256@gmail.com>
Signed-off-by: Eric Chanudet <eric.chanudet@gmail.com>
Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/ipxe/ipxe_git.bb             |  31 ++++++++
 recipes-extended/seabios/seabios/defconfig    | 102 ++++++++++++++++++++++++++
 recipes-extended/seabios/seabios/hostcc.patch |  21 ++++++
 recipes-extended/seabios/seabios_1.7.5.bb     |  46 ++++++++++++
 recipes-extended/vgabios/vgabios_0.7a.bb      |  31 ++++++++
 5 files changed, 231 insertions(+)
 create mode 100644 recipes-extended/ipxe/ipxe_git.bb
 create mode 100644 recipes-extended/seabios/seabios/defconfig
 create mode 100644 recipes-extended/seabios/seabios/hostcc.patch
 create mode 100644 recipes-extended/seabios/seabios_1.7.5.bb
 create mode 100644 recipes-extended/vgabios/vgabios_0.7a.bb

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
new file mode 100644
index 0000000..6dc492e
--- /dev/null
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Open source network boot firmware"
+HOMEPAGE = "http://ipxe.org"
+LICENSE = "GPLv2"
+DEPENDS = "binutils-native perl-native syslinux mtools-native"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
+PV = "gitr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=git"
+
+FILES_${PN} = "/usr/share/firmware/*.rom"
+
+EXTRA_OEMAKE = "NO_WERROR=1"
+#PARALLEL_MAKE=""
+
+S = "${WORKDIR}/git/src"
+
+do_configure() {
+   sed -i s#^ISOLINUX_BIN[\ \\t]*=.*#ISOLINUX_BIN\ =\ ${STAGING_DIR_TARGET}/usr/lib/syslinux/isolinux.bin# arch/i386/Makefile
+}
+
+do_compile() {
+   oe_runmake
+}
+
+do_install() {
+    install -d ${D}/usr/share/firmware
+    install ${S}/bin/*.rom ${D}/usr/share/firmware/
+}
diff --git a/recipes-extended/seabios/seabios/defconfig b/recipes-extended/seabios/seabios/defconfig
new file mode 100644
index 0000000..d4474ba
--- /dev/null
+++ b/recipes-extended/seabios/seabios/defconfig
@@ -0,0 +1,102 @@
+#
+# Automatically generated make config: don't edit
+# SeaBIOS Configuration
+# Wed Sep 18 14:08:45 2013
+#
+
+#
+# General Features
+#
+# CONFIG_COREBOOT is not set
+CONFIG_QEMU=y
+# CONFIG_CSM is not set
+CONFIG_QEMU_HARDWARE=y
+CONFIG_XEN=y
+CONFIG_THREADS=y
+# CONFIG_THREAD_OPTIONROMS is not set
+CONFIG_RELOCATE_INIT=y
+CONFIG_BOOTMENU=y
+# CONFIG_BOOTSPLASH is not set
+CONFIG_BOOTORDER=y
+# CONFIG_ENTRY_EXTRASTACK is not set
+
+#
+# Hardware support
+#
+CONFIG_ATA=y
+# CONFIG_ATA_DMA is not set
+# CONFIG_ATA_PIO32 is not set
+CONFIG_AHCI=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_SCSI=y
+CONFIG_ESP_SCSI=y
+CONFIG_LSI_SCSI=y
+CONFIG_MEGASAS=y
+CONFIG_FLOPPY=y
+CONFIG_PS2PORT=y
+CONFIG_USB=y
+CONFIG_USB_UHCI=y
+CONFIG_USB_OHCI=y
+CONFIG_USB_EHCI=y
+CONFIG_USB_MSC=y
+CONFIG_USB_UAS=y
+CONFIG_USB_HUB=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_USB_MOUSE=y
+CONFIG_SERIAL=y
+CONFIG_LPT=y
+# CONFIG_USE_SMM is not set
+CONFIG_MTRR_INIT=y
+CONFIG_PMTIMER=y
+
+#
+# BIOS interfaces
+#
+CONFIG_DRIVES=y
+CONFIG_CDROM_BOOT=y
+CONFIG_CDROM_EMU=y
+CONFIG_PCIBIOS=y
+CONFIG_APMBIOS=y
+CONFIG_PNPBIOS=y
+CONFIG_OPTIONROMS=y
+CONFIG_OPTIONROMS_DEPLOYED=y
+CONFIG_PMM=y
+CONFIG_BOOT=y
+CONFIG_KEYBOARD=y
+CONFIG_KBD_CALL_INT15_4F=y
+CONFIG_MOUSE=y
+CONFIG_S3_RESUME=y
+CONFIG_VGAHOOKS=y
+# CONFIG_DISABLE_A20 is not set
+
+#
+# BIOS Tables
+#
+# CONFIG_PIRTABLE is not set
+# CONFIG_MPTABLE is not set
+# CONFIG_SMBIOS is not set
+# CONFIG_ACPI is not set
+
+#
+# VGA ROM
+#
+# CONFIG_NO_VGABIOS is not set
+# CONFIG_VGA_STANDARD_VGA is not set
+# CONFIG_VGA_CIRRUS is not set
+# CONFIG_VGA_BOCHS is not set
+# CONFIG_VGA_GEODEGX2 is not set
+# CONFIG_VGA_GEODELX is not set
+# CONFIG_VGA_XENGFX is not set
+# CONFIG_BUILD_VGABIOS is not set
+# CONFIG_VGA_VBE is not set
+# CONFIG_VGA_PCI is not set
+# CONFIG_OVERRIDE_PCI_ID is not set
+# CONFIG_VGA_VID=0x5853
+# CONFIG_VGA_DID=0xC147
+
+#
+# Debugging
+#
+CONFIG_DEBUG_LEVEL=2
+# CONFIG_DEBUG_SERIAL is not set
+CONFIG_DEBUG_IO=y
diff --git a/recipes-extended/seabios/seabios/hostcc.patch b/recipes-extended/seabios/seabios/hostcc.patch
new file mode 100644
index 0000000..f665e1a
--- /dev/null
+++ b/recipes-extended/seabios/seabios/hostcc.patch
@@ -0,0 +1,21 @@
+diff -ur a/Makefile b/Makefile
+--- a/Makefile	2015-02-02 22:02:58.651041951 -0500
++++ b/Makefile	2015-02-02 23:08:13.884514003 -0500
+@@ -8,7 +8,7 @@
+ OUT=out/
+ 
+ # Common command definitions
+-export HOSTCC             := $(CC)
++export HOSTCC             ?= $(CC)
+ export CONFIG_SHELL       := sh
+ export KCONFIG_AUTOHEADER := autoconf.h
+ export KCONFIG_CONFIG     := $(CURDIR)/.config
+@@ -22,7 +22,7 @@
+ OBJDUMP=$(CROSS_PREFIX)objdump
+ STRIP=$(CROSS_PREFIX)strip
+ PYTHON=python
+-CPP=cpp
++CPP=$(CROSS_PREFIX)cpp
+ IASL:=iasl
+ LD32BIT_FLAG:=-melf_i386
+ 
diff --git a/recipes-extended/seabios/seabios_1.7.5.bb b/recipes-extended/seabios/seabios_1.7.5.bb
new file mode 100644
index 0000000..5ff0004
--- /dev/null
+++ b/recipes-extended/seabios/seabios_1.7.5.bb
@@ -0,0 +1,46 @@
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
+SRC_URI[md5sum] = "3f1e17485ca327b245ae5938d9aa02d9"
+SRC_URI[sha256sum] = "858d9eda4ad91efa1c45a5a401d560ef9ca8dd172f03b0a106f06661c252dc51"
+
+PR = "r0"
+
+FILES_${PN} = "/usr/share/firmware"
+
+DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
+
+TUNE_CCARGS = ""
+PARALLEL_MAKE = ""
+export HOSTCC="${BUILD_CC}"
+export CROSS_PREFIX="${TARGET_PREFIX}"
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
diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
new file mode 100644
index 0000000..6addeff
--- /dev/null
+++ b/recipes-extended/vgabios/vgabios_0.7a.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Plex86/Bochs LGPL VGABios"
+HOMEPAGE = "http://www.nongnu.org/vgabios/"
+LICENSE = "LGPLv2.1"
+SECTION = "firmware"
+DEPENDS = ""
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
+DEPENDS = ""
+
+SRC_URI =  "http://savannah.gnu.org/download/vgabios/${PN}-${PV}.tgz"
+
+SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
+SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
+
+PR = "r0"
+
+FILES_${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
+FILES_${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_configure() {
+    echo "Skip do_configure"
+}
+
+do_install() {
+    install -d ${D}/usr/share/firmware
+    install -m 0644 VGABIOS-lgpl-latest.bin ${D}/usr/share/firmware/${PN}-${PV}.bin
+    install -m 0644 VGABIOS-lgpl-latest.cirrus.bin ${D}/usr/share/firmware/${PN}-${PV}.cirrus.bin
+}
+
-- 
2.1.1



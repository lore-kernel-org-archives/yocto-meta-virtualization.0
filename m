Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 667EDE00CAE; Fri,  1 Jan 2016 07:54:13 -0800 (PST)
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
	*      [209.85.192.45 listed in list.dnswl.org]
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13DFAE0033E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Jan 2016 07:54:11 -0800 (PST)
Received: by mail-qg0-f45.google.com with SMTP id o11so216803120qge.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Jan 2016 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uXfDcl/uoQGxsdEeT77KCcocizNkW8pje3hHlR7Sv0A=;
	b=NMEttNjEYflId2fF+4z+kEqhY+Kv4NCZfaEa+M6pfF8mVh66wQeeZ+TKLpCeFDpkJ3
	LhIdeckcPH9DwaJ24hROy+ARz7+jHXB3YE8/ULpt24o7Rh5Uvscc1BZhr9vxlKgrTkm7
	nkRSMLRcH7/TsFAD8gJS+wTQSvVBOOg0GDGyULnbSSmlfJt50znRPN4C95b7GF1s+tX2
	s7lNGyU0PEoErsaQ/NuYliiDyu4yIws/IqKviIsmmApUPSHWQu7lqodR52AtzK+AuxxE
	kWExWuamVOTZmDCDTiFOOtkhX5/vVRyWqVb+cqNuW//Rmf6ZVQSNRgdarsjv1vkVrzT/
	5OTw==
X-Received: by 10.140.95.111 with SMTP id h102mr98337477qge.2.1451663650476;
	Fri, 01 Jan 2016 07:54:10 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	p19sm34795817qgp.9.2016.01.01.07.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 07:54:09 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  1 Jan 2016 10:54:00 -0500
Message-Id: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] seabios: drop shipped defconfig and use defaults
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
X-List-Received-Date: Fri, 01 Jan 2016 15:54:13 -0000

Upstream Xen opted to simply use 'make defconfig' to get a
generic seabios config.  Follow suit and remove old config.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/seabios/seabios/defconfig |  102 ----------------------------
 recipes-extended/seabios/seabios_1.9.0.bb  |    4 +-
 2 files changed, 1 insertion(+), 105 deletions(-)
 delete mode 100644 recipes-extended/seabios/seabios/defconfig

diff --git a/recipes-extended/seabios/seabios/defconfig b/recipes-extended/seabios/seabios/defconfig
deleted file mode 100644
index d4474ba..0000000
--- a/recipes-extended/seabios/seabios/defconfig
+++ /dev/null
@@ -1,102 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# SeaBIOS Configuration
-# Wed Sep 18 14:08:45 2013
-#
-
-#
-# General Features
-#
-# CONFIG_COREBOOT is not set
-CONFIG_QEMU=y
-# CONFIG_CSM is not set
-CONFIG_QEMU_HARDWARE=y
-CONFIG_XEN=y
-CONFIG_THREADS=y
-# CONFIG_THREAD_OPTIONROMS is not set
-CONFIG_RELOCATE_INIT=y
-CONFIG_BOOTMENU=y
-# CONFIG_BOOTSPLASH is not set
-CONFIG_BOOTORDER=y
-# CONFIG_ENTRY_EXTRASTACK is not set
-
-#
-# Hardware support
-#
-CONFIG_ATA=y
-# CONFIG_ATA_DMA is not set
-# CONFIG_ATA_PIO32 is not set
-CONFIG_AHCI=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_VIRTIO_SCSI=y
-CONFIG_ESP_SCSI=y
-CONFIG_LSI_SCSI=y
-CONFIG_MEGASAS=y
-CONFIG_FLOPPY=y
-CONFIG_PS2PORT=y
-CONFIG_USB=y
-CONFIG_USB_UHCI=y
-CONFIG_USB_OHCI=y
-CONFIG_USB_EHCI=y
-CONFIG_USB_MSC=y
-CONFIG_USB_UAS=y
-CONFIG_USB_HUB=y
-CONFIG_USB_KEYBOARD=y
-CONFIG_USB_MOUSE=y
-CONFIG_SERIAL=y
-CONFIG_LPT=y
-# CONFIG_USE_SMM is not set
-CONFIG_MTRR_INIT=y
-CONFIG_PMTIMER=y
-
-#
-# BIOS interfaces
-#
-CONFIG_DRIVES=y
-CONFIG_CDROM_BOOT=y
-CONFIG_CDROM_EMU=y
-CONFIG_PCIBIOS=y
-CONFIG_APMBIOS=y
-CONFIG_PNPBIOS=y
-CONFIG_OPTIONROMS=y
-CONFIG_OPTIONROMS_DEPLOYED=y
-CONFIG_PMM=y
-CONFIG_BOOT=y
-CONFIG_KEYBOARD=y
-CONFIG_KBD_CALL_INT15_4F=y
-CONFIG_MOUSE=y
-CONFIG_S3_RESUME=y
-CONFIG_VGAHOOKS=y
-# CONFIG_DISABLE_A20 is not set
-
-#
-# BIOS Tables
-#
-# CONFIG_PIRTABLE is not set
-# CONFIG_MPTABLE is not set
-# CONFIG_SMBIOS is not set
-# CONFIG_ACPI is not set
-
-#
-# VGA ROM
-#
-# CONFIG_NO_VGABIOS is not set
-# CONFIG_VGA_STANDARD_VGA is not set
-# CONFIG_VGA_CIRRUS is not set
-# CONFIG_VGA_BOCHS is not set
-# CONFIG_VGA_GEODEGX2 is not set
-# CONFIG_VGA_GEODELX is not set
-# CONFIG_VGA_XENGFX is not set
-# CONFIG_BUILD_VGABIOS is not set
-# CONFIG_VGA_VBE is not set
-# CONFIG_VGA_PCI is not set
-# CONFIG_OVERRIDE_PCI_ID is not set
-# CONFIG_VGA_VID=0x5853
-# CONFIG_VGA_DID=0xC147
-
-#
-# Debugging
-#
-CONFIG_DEBUG_LEVEL=2
-# CONFIG_DEBUG_SERIAL is not set
-CONFIG_DEBUG_IO=y
diff --git a/recipes-extended/seabios/seabios_1.9.0.bb b/recipes-extended/seabios/seabios_1.9.0.bb
index fcdc0c5..4808a18 100644
--- a/recipes-extended/seabios/seabios_1.9.0.bb
+++ b/recipes-extended/seabios/seabios_1.9.0.bb
@@ -6,7 +6,6 @@ SECTION = "firmware"
 SRC_URI = " \
     http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
     file://hostcc.patch \
-    file://defconfig \
     "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
@@ -25,8 +24,7 @@ EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
 EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
 
 do_configure() {
-    install -m 0644 "${WORKDIR}/defconfig" .config
-    oe_runmake oldconfig
+    oe_runmake defconfig
 }
 
 do_compile() {
-- 
1.7.10.4



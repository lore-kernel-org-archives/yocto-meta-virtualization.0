Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B8CC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:07:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.15895.1745921263708413835
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 03:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cM7VFm/5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so56410565e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745921262; x=1746526062; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lW/o2HD1Z4ggyRUCCxtyM9tarDzUflZijjhcl3G+mgY=;
        b=cM7VFm/5vAOJKLQ03TGw9RhyGyJwB0+jEGcZxemBAZD2VX2hD1wCVdV81deipgUWe+
         NEbRnjv8yufliJjvRNPUzLas8sSOc4szxgraPr42DzXlKb1MZVVUX0NPnPZ7B1L3ahD5
         iddBKKWbdWKhccUOFyV610DYYKOzIIF7Pf/veqvPxf5JNysrvfBCLohT6WdFKEkTWVA3
         ylMok/SwylwvHZMQJI/XXiXUG/UIRuoAyYR/KwJQ38VO4S1GJK4hBiSF0CbNal/H2/70
         OQzM0xwVUMu9prSte7scnD/Srq87+PLX4ZSgC8rrSH/YUMwglVerPBJ8nGoq0RC8YKW8
         ZMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921262; x=1746526062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW/o2HD1Z4ggyRUCCxtyM9tarDzUflZijjhcl3G+mgY=;
        b=X+OoSusGRCzNx1qpt1wOujRE5zlBQ7SKPsOP94f5vHpw1/noD1hpLkEtWszgcpXHrM
         AONdcvfN1RoxpDnmZ6ddbOSABK+2EuGraguhSR3dYRjmytTxYEw2NvD6EDqCOdxOHhCG
         2lX6aZNjGkgqR+VvgeVTz8S8dH40oo4KymtsJ0iVYeE7Wj7j833CQWbdAN4AbSUFNtoI
         vAykhn+/2HAZ7/ACTSTQbFRExe3IrpIOrothWATfnba//9u8CwseM2C/wQi6w5rGW9zN
         kgtmvDb/2n8jHnANoad/ADmrMMuQcMrDofIxfvFv16Kk4KTNhb2/7xo7dnEadWoddnDk
         S9/w==
X-Gm-Message-State: AOJu0YwNbn9NNRtCNaP7syr1f7IPQBaS7SKBYvCw1gYyo5d48TIY1skl
	Urgkvuk8HFojnpMuGOF/NtjlqpYIpdD931HQgZJeWbgGF+czPHK9btL0BB8U
X-Gm-Gg: ASbGncsRhI6jc2odyRE5pjcwnbYXMhOJyDgN4NvPorv8GxBk8rXlSG1stPVYBD05Iu6
	TfbZBc+HuYkadYodd8PIuH1mADN3moHPk1NKVWEV3NfcOI5fs3D7XFF/8qPwDvMSpx7HW2ylRg9
	ugi80tBYidvDwiLq41hLEwljrRt8nwXm5aMyMlZmZn74npueHzbEfwZImsHfZk9y2pj8Fu8LGyo
	JgicjaKunIVo0xWGMcfXf7EG+kvEvFDFkvWM2xtk8EK1GYe+ozBCBB8CEELXQKbLfIemcjP5JSH
	QI/fnYDBHtVRYJ5tAmuhVDNWa0l5guVK5fJe7wWf6F0=
X-Google-Smtp-Source: AGHT+IG+e83R5ULodHysG9S+cD262WLHiiNTToB1ptnzOe+8iEwsU3Yvmm5kseJR4lYEFZrHlriP7Q==
X-Received: by 2002:a05:6000:186e:b0:3a0:7d39:c23f with SMTP id ffacd0b85a97d-3a08ad3a71emr1565632f8f.21.1745921261613;
        Tue, 29 Apr 2025 03:07:41 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d633sm13801606f8f.16.2025.04.29.03.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:07:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/3] ipxe: fix build with gcc-15
Date: Tue, 29 Apr 2025 12:07:32 +0200
Message-ID: <20250429100734.1440305-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 10:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9237

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/853265/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ld-Fix-typo-in-xenver.h-header-guard.patch |  25 ++
 ...ld-Fix-old-style-function-definition.patch |  25 ++
 ...ent-the-use-of-reserved-words-in-C23.patch | 103 ++++++
 ...afe-disable-function-wrapper-from-le.patch | 294 ++++++++++++++++++
 recipes-extended/ipxe/ipxe_git.bb             |   4 +
 5 files changed, 451 insertions(+)
 create mode 100644 recipes-extended/ipxe/files/0001-build-Fix-typo-in-xenver.h-header-guard.patch
 create mode 100644 recipes-extended/ipxe/files/0002-build-Fix-old-style-function-definition.patch
 create mode 100644 recipes-extended/ipxe/files/0003-build-Prevent-the-use-of-reserved-words-in-C23.patch
 create mode 100644 recipes-extended/ipxe/files/0004-build-Remove-unsafe-disable-function-wrapper-from-le.patch

diff --git a/recipes-extended/ipxe/files/0001-build-Fix-typo-in-xenver.h-header-guard.patch b/recipes-extended/ipxe/files/0001-build-Fix-typo-in-xenver.h-header-guard.patch
new file mode 100644
index 00000000..089a8143
--- /dev/null
+++ b/recipes-extended/ipxe/files/0001-build-Fix-typo-in-xenver.h-header-guard.patch
@@ -0,0 +1,25 @@
+From e4795a590e3b708008a7bbd944370aef5337c561 Mon Sep 17 00:00:00 2001
+From: Michael Brown <mcb30@ipxe.org>
+Date: Sun, 27 Apr 2025 17:33:28 +0100
+Subject: [PATCH] [build] Fix typo in xenver.h header guard
+
+GCC 15 helpfully reports mismatched #ifdef and #define lines in header
+guards.
+
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+Upstream-Status: Backport [https://github.com/ipxe/ipxe/pull/1457]
+---
+ src/include/ipxe/xenver.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/include/ipxe/xenver.h b/src/include/ipxe/xenver.h
+index b29dfb321..5d820a6e7 100644
+--- a/src/include/ipxe/xenver.h
++++ b/src/include/ipxe/xenver.h
+@@ -1,5 +1,5 @@
+ #ifndef _IPXE_XENVER_H
+-#define _IPXE_VENVER_H
++#define _IPXE_XENVER_H
+ 
+ /** @file
+  *
diff --git a/recipes-extended/ipxe/files/0002-build-Fix-old-style-function-definition.patch b/recipes-extended/ipxe/files/0002-build-Fix-old-style-function-definition.patch
new file mode 100644
index 00000000..7edafd0d
--- /dev/null
+++ b/recipes-extended/ipxe/files/0002-build-Fix-old-style-function-definition.patch
@@ -0,0 +1,25 @@
+From 0b5e26f82d3bb5dc49557b8c29d802911c050aaf Mon Sep 17 00:00:00 2001
+From: Michael Brown <mcb30@ipxe.org>
+Date: Sun, 27 Apr 2025 17:36:52 +0100
+Subject: [PATCH] [build] Fix old-style function definition
+
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+Upstream-Status: Backport [https://github.com/ipxe/ipxe/pull/1457]
+---
+ src/drivers/net/3c595.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/drivers/net/3c595.c b/src/drivers/net/3c595.c
+index 92d38cfc5..c3442946e 100644
+--- a/src/drivers/net/3c595.c
++++ b/src/drivers/net/3c595.c
+@@ -342,8 +342,7 @@ eeprom_rdy()
+  * before
+  */
+ static int
+-get_e(offset)
+-int offset;
++get_e(int offset)
+ {
+ 	if (!eeprom_rdy())
+ 		return (0xffff);
diff --git a/recipes-extended/ipxe/files/0003-build-Prevent-the-use-of-reserved-words-in-C23.patch b/recipes-extended/ipxe/files/0003-build-Prevent-the-use-of-reserved-words-in-C23.patch
new file mode 100644
index 00000000..fb93d96f
--- /dev/null
+++ b/recipes-extended/ipxe/files/0003-build-Prevent-the-use-of-reserved-words-in-C23.patch
@@ -0,0 +1,103 @@
+From 2f39451dbab215763c09465848b89dcf41eb71be Mon Sep 17 00:00:00 2001
+From: Miao Wang <shankerwangmiao@gmail.com>
+Date: Sun, 27 Apr 2025 17:30:49 +0100
+Subject: [PATCH] [build] Prevent the use of reserved words in C23
+
+GCC 15 defaults to C23, which reserves bool, true, and false as
+keywords.  Avoid using these as parameter or variable names.
+
+Modified-by: Michael Brown <mcb30@ipxe.org>
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+Upstream-Status: Backport [https://github.com/ipxe/ipxe/pull/1457]
+---
+ .../infiniband/mlx_utils/src/public/mlx_pci_gw.c     |  4 ++--
+ src/drivers/net/igbvf/igbvf_osdep.h                  |  7 ++-----
+ src/interface/efi/efi_hii.c                          | 12 ++++++------
+ 3 files changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/src/drivers/infiniband/mlx_utils/src/public/mlx_pci_gw.c b/src/drivers/infiniband/mlx_utils/src/public/mlx_pci_gw.c
+index 30c1e644e..0b257ed22 100644
+--- a/src/drivers/infiniband/mlx_utils/src/public/mlx_pci_gw.c
++++ b/src/drivers/infiniband/mlx_utils/src/public/mlx_pci_gw.c
+@@ -32,7 +32,7 @@ mlx_status
+ mlx_pci_gw_check_capability_id(
+ 							IN mlx_utils *utils,
+ 							IN mlx_uint8 cap_pointer,
+-							OUT mlx_boolean *bool
++							OUT mlx_boolean *result
+ 							)
+ {
+ 	mlx_status 		status = MLX_SUCCESS;
+@@ -41,7 +41,7 @@ mlx_pci_gw_check_capability_id(
+ 	status = mlx_pci_read(utils, MlxPciWidthUint8, offset,
+ 				1, &id);
+ 	MLX_CHECK_STATUS(utils, status, read_err,"failed to read capability id");
+-	*bool = ( id == PCI_GW_CAPABILITY_ID );
++	*result = ( id == PCI_GW_CAPABILITY_ID );
+ read_err:
+ 	return status;
+ }
+diff --git a/src/drivers/net/igbvf/igbvf_osdep.h b/src/drivers/net/igbvf/igbvf_osdep.h
+index 8ac179de0..dc65da6c1 100644
+--- a/src/drivers/net/igbvf/igbvf_osdep.h
++++ b/src/drivers/net/igbvf/igbvf_osdep.h
+@@ -35,8 +35,9 @@ FILE_LICENCE ( GPL2_ONLY );
+ #ifndef _IGBVF_OSDEP_H_
+ #define _IGBVF_OSDEP_H_
+ 
++#include <stdbool.h>
++
+ #define u8         unsigned char
+-#define bool       boolean_t
+ #define dma_addr_t unsigned long
+ #define __le16     uint16_t
+ #define __le32     uint32_t
+@@ -51,10 +52,6 @@ FILE_LICENCE ( GPL2_ONLY );
+ #define ETH_FCS_LEN 4
+ 
+ typedef int spinlock_t;
+-typedef enum {
+-    false = 0,
+-    true = 1
+-} boolean_t;
+ 
+ #define usec_delay(x) udelay(x)
+ #define msec_delay(x) mdelay(x)
+diff --git a/src/interface/efi/efi_hii.c b/src/interface/efi/efi_hii.c
+index 506fc8869..66f58affe 100644
+--- a/src/interface/efi/efi_hii.c
++++ b/src/interface/efi/efi_hii.c
+@@ -147,13 +147,13 @@ void efi_ifr_end_op ( struct efi_ifr_builder *ifr ) {
+  */
+ void efi_ifr_false_op ( struct efi_ifr_builder *ifr ) {
+ 	size_t dispaddr = ifr->ops_len;
+-	EFI_IFR_FALSE *false;
++	EFI_IFR_FALSE *op;
+ 
+ 	/* Add opcode */
+-	false = efi_ifr_op ( ifr, EFI_IFR_FALSE_OP, sizeof ( *false ) );
++	op = efi_ifr_op ( ifr, EFI_IFR_FALSE_OP, sizeof ( *op ) );
+ 
+ 	DBGC ( ifr, "IFR %p false\n", ifr );
+-	DBGC2_HDA ( ifr, dispaddr, false, sizeof ( *false ) );
++	DBGC2_HDA ( ifr, dispaddr, op, sizeof ( *op ) );
+ }
+ 
+ /**
+@@ -462,13 +462,13 @@ void efi_ifr_text_op ( struct efi_ifr_builder *ifr, unsigned int prompt_id,
+  */
+ void efi_ifr_true_op ( struct efi_ifr_builder *ifr ) {
+ 	size_t dispaddr = ifr->ops_len;
+-	EFI_IFR_TRUE *true;
++	EFI_IFR_TRUE *op;
+ 
+ 	/* Add opcode */
+-	true = efi_ifr_op ( ifr, EFI_IFR_TRUE_OP, sizeof ( *true ) );
++	op = efi_ifr_op ( ifr, EFI_IFR_TRUE_OP, sizeof ( *op ) );
+ 
+ 	DBGC ( ifr, "IFR %p true\n", ifr );
+-	DBGC2_HDA ( ifr, dispaddr, true, sizeof ( *true ) );
++	DBGC2_HDA ( ifr, dispaddr, op, sizeof ( *op ) );
+ }
+ 
+ /**
diff --git a/recipes-extended/ipxe/files/0004-build-Remove-unsafe-disable-function-wrapper-from-le.patch b/recipes-extended/ipxe/files/0004-build-Remove-unsafe-disable-function-wrapper-from-le.patch
new file mode 100644
index 00000000..6598882d
--- /dev/null
+++ b/recipes-extended/ipxe/files/0004-build-Remove-unsafe-disable-function-wrapper-from-le.patch
@@ -0,0 +1,294 @@
+From 1de32c9e11e727fe8c4eab68b331d862cb2f03e7 Mon Sep 17 00:00:00 2001
+From: Michael Brown <mcb30@ipxe.org>
+Date: Sun, 27 Apr 2025 17:37:44 +0100
+Subject: [PATCH] [build] Remove unsafe disable function wrapper from legacy
+ NIC drivers
+
+The legacy NIC drivers do not consistently take a second parameter in
+their disable function.  We currently use an unsafe function wrapper
+that declares no parameters, and rely on the ABI allowing a second
+parameter to be silently ignored if not expected by the caller.  As of
+GCC 15, this hack results in an incompatible pointer type warning.
+
+Fix by removing the hack, and instead updating all relevant legacy NIC
+drivers to take an unused second parameter in their disable function.
+
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+Upstream-Status: Backport [https://github.com/ipxe/ipxe/pull/1457]
+---
+ src/drivers/net/3c595.c      | 2 +-
+ src/drivers/net/amd8111e.c   | 2 +-
+ src/drivers/net/bnx2.c       | 8 +++++++-
+ src/drivers/net/davicom.c    | 4 ++--
+ src/drivers/net/depca.c      | 2 +-
+ src/drivers/net/dmfe.c       | 2 +-
+ src/drivers/net/epic100.c    | 4 ++--
+ src/drivers/net/ns8390.c     | 2 +-
+ src/drivers/net/prism2_pci.c | 2 +-
+ src/drivers/net/prism2_plx.c | 2 +-
+ src/drivers/net/sis900.c     | 4 ++--
+ src/drivers/net/sundance.c   | 2 +-
+ src/drivers/net/tlan.c       | 2 +-
+ src/drivers/net/tulip.c      | 4 ++--
+ src/drivers/net/w89c840.c    | 2 +-
+ src/include/nic.h            | 3 +--
+ 16 files changed, 26 insertions(+), 21 deletions(-)
+
+diff --git a/src/drivers/net/3c595.c b/src/drivers/net/3c595.c
+index c3442946e..fbee739a2 100644
+--- a/src/drivers/net/3c595.c
++++ b/src/drivers/net/3c595.c
+@@ -443,7 +443,7 @@ vxsetlink(void)
+     GO_WINDOW(1); 
+ }
+ 
+-static void t595_disable ( struct nic *nic ) {
++static void t595_disable ( struct nic *nic, void *hwdev __unused ) {
+ 
+ 	t595_reset(nic);
+ 
+diff --git a/src/drivers/net/amd8111e.c b/src/drivers/net/amd8111e.c
+index 693d77d1d..5ad55eea1 100644
+--- a/src/drivers/net/amd8111e.c
++++ b/src/drivers/net/amd8111e.c
+@@ -609,7 +609,7 @@ static int amd8111e_poll(struct nic *nic, int retrieve)
+ 	return pkt_ok;
+ }
+ 
+-static void amd8111e_disable(struct nic *nic)
++static void amd8111e_disable(struct nic *nic, void *hwdev __unused)
+ {
+ 	struct amd8111e_priv *lp = nic->priv_data;
+ 
+diff --git a/src/drivers/net/bnx2.c b/src/drivers/net/bnx2.c
+index 4ebcc52a9..60bef7711 100644
+--- a/src/drivers/net/bnx2.c
++++ b/src/drivers/net/bnx2.c
+@@ -2671,6 +2671,12 @@ err_out_disable:
+ 	return 0;
+ }
+ 
++static void
++bnx2_remove(struct nic *nic, void *hwdev __unused)
++{
++	bnx2_disable(nic);
++}
++
+ static struct pci_device_id bnx2_nics[] = {
+ 	PCI_ROM(0x14e4, 0x164a, "bnx2-5706",        "Broadcom NetXtreme II BCM5706", 0),
+ 	PCI_ROM(0x14e4, 0x164c, "bnx2-5708",        "Broadcom NetXtreme II BCM5708", 0),
+@@ -2680,7 +2686,7 @@ static struct pci_device_id bnx2_nics[] = {
+ 
+ PCI_DRIVER ( bnx2_driver, bnx2_nics, PCI_NO_CLASS );
+ 
+-DRIVER ( "BNX2", nic_driver, pci_driver, bnx2_driver, bnx2_probe, bnx2_disable );
++DRIVER ( "BNX2", nic_driver, pci_driver, bnx2_driver, bnx2_probe, bnx2_remove );
+ 
+ /*
+ static struct pci_driver bnx2_driver __pci_driver = {
+diff --git a/src/drivers/net/davicom.c b/src/drivers/net/davicom.c
+index 9d3d8b915..07c994573 100644
+--- a/src/drivers/net/davicom.c
++++ b/src/drivers/net/davicom.c
+@@ -159,7 +159,7 @@ static void davicom_reset(struct nic *nic);
+ static void davicom_transmit(struct nic *nic, const char *d, unsigned int t,
+ 			   unsigned int s, const char *p);
+ static int davicom_poll(struct nic *nic, int retrieve);
+-static void davicom_disable(struct nic *nic);
++static void davicom_disable(struct nic *nic, void *hwdev);
+ static void davicom_wait(unsigned int nticks);
+ static int phy_read(int);
+ static void phy_write(int, u16);
+@@ -601,7 +601,7 @@ static int davicom_poll(struct nic *nic, int retrieve)
+ /*********************************************************************/
+ /* eth_disable - Disable the interface                               */
+ /*********************************************************************/
+-static void davicom_disable ( struct nic *nic ) {
++static void davicom_disable ( struct nic *nic, void *hwdev __unused ) {
+ 
+   whereami("davicom_disable\n");
+ 
+diff --git a/src/drivers/net/depca.c b/src/drivers/net/depca.c
+index 016f28bb2..30e2fcb0a 100644
+--- a/src/drivers/net/depca.c
++++ b/src/drivers/net/depca.c
+@@ -644,7 +644,7 @@ static void depca_transmit(
+ /**************************************************************************
+ DISABLE - Turn off ethernet interface
+ ***************************************************************************/
+-static void depca_disable ( struct nic *nic ) {
++static void depca_disable ( struct nic *nic, void *hwdev __unused ) {
+ 	depca_reset(nic);
+ 
+ 	STOP_DEPCA(nic->ioaddr);
+diff --git a/src/drivers/net/dmfe.c b/src/drivers/net/dmfe.c
+index 2ea0d2b2b..ea14c462f 100644
+--- a/src/drivers/net/dmfe.c
++++ b/src/drivers/net/dmfe.c
+@@ -435,7 +435,7 @@ static void dmfe_transmit(struct nic *nic,
+ /**************************************************************************
+ DISABLE - Turn off ethernet interface
+ ***************************************************************************/
+-static void dmfe_disable ( struct nic *nic __unused ) {
++static void dmfe_disable ( struct nic *nic __unused, void *hwdev __unused ) {
+ 	/* Reset & stop DM910X board */
+ 	outl(DM910X_RESET, BASE + DCR0);
+ 	udelay(5);
+diff --git a/src/drivers/net/epic100.c b/src/drivers/net/epic100.c
+index 8e31a3bfa..01c0c43c9 100644
+--- a/src/drivers/net/epic100.c
++++ b/src/drivers/net/epic100.c
+@@ -51,7 +51,7 @@ struct epic_tx_desc {
+ 
+ static void	epic100_open(void);
+ static void	epic100_init_ring(void);
+-static void	epic100_disable(struct nic *nic);
++static void	epic100_disable(struct nic *nic, void *hwdev);
+ static int	epic100_poll(struct nic *nic, int retrieve);
+ static void	epic100_transmit(struct nic *nic, const char *destaddr,
+ 				 unsigned int type, unsigned int len, const char *data);
+@@ -419,7 +419,7 @@ epic100_poll(struct nic *nic, int retrieve)
+ }
+ 
+ 
+-static void epic100_disable ( struct nic *nic __unused ) {
++static void epic100_disable ( struct nic *nic __unused, void *hwdev __unused ) {
+ 	/* Soft reset the chip. */
+ 	outl(GC_SOFT_RESET, genctl);
+ }
+diff --git a/src/drivers/net/ns8390.c b/src/drivers/net/ns8390.c
+index 0ffc6216b..ffd05afdb 100644
+--- a/src/drivers/net/ns8390.c
++++ b/src/drivers/net/ns8390.c
+@@ -597,7 +597,7 @@ static int ns8390_poll(struct nic *nic, int retrieve)
+ /**************************************************************************
+ NS8390_DISABLE - Turn off adapter
+ **************************************************************************/
+-static void ns8390_disable ( struct nic *nic ) {
++static void ns8390_disable ( struct nic *nic, void *hwdev __unused ) {
+ 	ns8390_reset(nic);
+ }
+ 
+diff --git a/src/drivers/net/prism2_pci.c b/src/drivers/net/prism2_pci.c
+index 69ddf0fb0..b4ed0a728 100644
+--- a/src/drivers/net/prism2_pci.c
++++ b/src/drivers/net/prism2_pci.c
+@@ -44,7 +44,7 @@ static int prism2_pci_probe ( struct nic *nic, struct pci_device *pci ) {
+   return prism2_probe ( nic, hw );
+ }
+ 
+-static void prism2_pci_disable ( struct nic *nic ) {
++static void prism2_pci_disable ( struct nic *nic, void *hwdev __unused ) {
+   prism2_disable ( nic );
+ }
+ 
+diff --git a/src/drivers/net/prism2_plx.c b/src/drivers/net/prism2_plx.c
+index a73b0e087..b1c466de9 100644
+--- a/src/drivers/net/prism2_plx.c
++++ b/src/drivers/net/prism2_plx.c
+@@ -99,7 +99,7 @@ static int prism2_plx_probe ( struct nic *nic, struct pci_device *pci ) {
+   return prism2_probe ( nic, hw );
+ }
+ 
+-static void prism2_plx_disable ( struct nic *nic ) {
++static void prism2_plx_disable ( struct nic *nic, void *hwdev __unused ) {
+   prism2_disable ( nic );
+ }
+ 
+diff --git a/src/drivers/net/sis900.c b/src/drivers/net/sis900.c
+index 8a3ac01bc..c8fd3e9b5 100644
+--- a/src/drivers/net/sis900.c
++++ b/src/drivers/net/sis900.c
+@@ -164,7 +164,7 @@ static void sis900_transmit(struct nic *nic, const char *d,
+                             unsigned int t, unsigned int s, const char *p);
+ static int  sis900_poll(struct nic *nic, int retrieve);
+ 
+-static void sis900_disable(struct nic *nic);
++static void sis900_disable(struct nic *nic, void *hwdev);
+ 
+ static void sis900_irq(struct nic *nic, irq_action_t action);
+ 
+@@ -1238,7 +1238,7 @@ sis900_poll(struct nic *nic, int retrieve)
+  */
+ 
+ static void
+-sis900_disable ( struct nic *nic ) {
++sis900_disable ( struct nic *nic, void *hwdev __unused ) {
+ 
+     sis900_init(nic);
+ 
+diff --git a/src/drivers/net/sundance.c b/src/drivers/net/sundance.c
+index 9127fa2cd..77567a5e8 100644
+--- a/src/drivers/net/sundance.c
++++ b/src/drivers/net/sundance.c
+@@ -536,7 +536,7 @@ static void sundance_transmit(struct nic *nic, const char *d,	/* Destination */
+ /**************************************************************************
+ DISABLE - Turn off ethernet interface
+ ***************************************************************************/
+-static void sundance_disable ( struct nic *nic __unused ) {
++static void sundance_disable ( struct nic *nic __unused, void *hwdev __unused) {
+ 	/* put the card in its initial state */
+ 	/* This function serves 3 purposes.
+ 	 * This disables DMA and interrupts so we don't receive
+diff --git a/src/drivers/net/tlan.c b/src/drivers/net/tlan.c
+index 0e85b35b6..7127c7373 100644
+--- a/src/drivers/net/tlan.c
++++ b/src/drivers/net/tlan.c
+@@ -717,7 +717,7 @@ static void tlan_transmit(struct nic *nic, const char *d,	/* Destination */
+ /**************************************************************************
+ DISABLE - Turn off ethernet interface
+ ***************************************************************************/
+-static void tlan_disable ( struct nic *nic __unused ) {
++static void tlan_disable ( struct nic *nic __unused, void *hwdev __unused ) {
+ 	/* put the card in its initial state */
+ 	/* This function serves 3 purposes.
+ 	 * This disables DMA and interrupts so we don't receive
+diff --git a/src/drivers/net/tulip.c b/src/drivers/net/tulip.c
+index e4e6ffa87..55e9747b4 100644
+--- a/src/drivers/net/tulip.c
++++ b/src/drivers/net/tulip.c
+@@ -494,7 +494,7 @@ static void tulip_reset(struct nic *nic);
+ static void tulip_transmit(struct nic *nic, const char *d, unsigned int t,
+                            unsigned int s, const char *p);
+ static int tulip_poll(struct nic *nic, int retrieve);
+-static void tulip_disable(struct nic *nic);
++static void tulip_disable(struct nic *nic, void *hwdev);
+ static void nway_start(struct nic *nic);
+ static void pnic_do_nway(struct nic *nic);
+ static void select_media(struct nic *nic, int startup);
+@@ -1128,7 +1128,7 @@ static int tulip_poll(struct nic *nic, int retrieve)
+ /*********************************************************************/
+ /* eth_disable - Disable the interface                               */
+ /*********************************************************************/
+-static void tulip_disable ( struct nic *nic ) {
++static void tulip_disable ( struct nic *nic, void *hwdev __unused ) {
+ 
+     whereami("tulip_disable\n");
+ 
+diff --git a/src/drivers/net/w89c840.c b/src/drivers/net/w89c840.c
+index 72ccf3a28..0c222214e 100644
+--- a/src/drivers/net/w89c840.c
++++ b/src/drivers/net/w89c840.c
+@@ -579,7 +579,7 @@ static void w89c840_transmit(
+ /**************************************************************************
+ w89c840_disable - Turn off ethernet interface
+ ***************************************************************************/
+-static void w89c840_disable ( struct nic *nic ) {
++static void w89c840_disable ( struct nic *nic, void *hwdev __unused ) {
+ 
+     w89c840_reset(nic);
+ 
+diff --git a/src/include/nic.h b/src/include/nic.h
+index 8b06e88f4..8e928beb4 100644
+--- a/src/include/nic.h
++++ b/src/include/nic.h
+@@ -217,8 +217,7 @@ static inline void * legacy_isa_get_drvdata ( void *hwdev ) {
+ 	}								  \
+ 	static inline void						  \
+ 	_name ## _disable ( struct nic *nic, void *hwdev ) {		  \
+-		void ( * _unsafe_disable ) () = _disable;		  \
+-		_unsafe_disable ( nic, hwdev );				  \
++		_disable ( nic, hwdev );				  \
+ 	}								  \
+ 	static inline int						  \
+ 	_name ## _pci_legacy_probe ( struct pci_device *pci ) {		  \
diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 08ed519a..8625919d 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -19,6 +19,10 @@ SRC_URI = " \
     file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
     file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch \
     file://build-be-explicit-about-fcommon-compiler-directive.patch \
+    file://0001-build-Fix-typo-in-xenver.h-header-guard.patch;patchdir=.. \
+    file://0002-build-Fix-old-style-function-definition.patch;patchdir=.. \
+    file://0003-build-Prevent-the-use-of-reserved-words-in-C23.patch;patchdir=.. \
+    file://0004-build-Remove-unsafe-disable-function-wrapper-from-le.patch;patchdir=.. \
     "
 
 FILES:${PN} = "/usr/share/firmware/*.rom"


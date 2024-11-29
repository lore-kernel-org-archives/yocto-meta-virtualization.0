Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F2D729FD
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:46 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.80])
 by mx.groups.io with SMTP id smtpd.web11.123080.1732911158744397479
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=R8jX419x;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.80, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXG3cnhplHigHQxOZHadhnCFK6lQHyoEZvizedJqCPCoZ1wTyfVp+5TMypu+TMgxbpY5LekICZWETSbDVqXn+Gg28Fiky3W5q1eUfG0E58OiopSWju+r5ljVy6q539kSUO1McqAxsp4AjENwSGWDAQC4RLD4tmLRmDbFCC8H+SPITtnXz1HnWVOSP/vxeVcrQAFSi2ZLFfUN/p97/FKJy65J3SkuIUMaLHQ1Zw4KhZtwYsb5ypRRIraomiEHrBOp59LtwQ79I4Kli8jVBO+xx1dgWkQeuTL81URQE32HRZeKzCALFBOhpzTrFCe75BIP7abbLpq/8WSX03G938vWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=sGTyWbYSx4EWvbnLi7y/yTw/Z4F8sPkdOd94s8duiNU6wzVmyDEOuXfCHajVbM1wsTpUvfBQ82vzA5sQICKA7VB52lqNLMDooag9ny9iD5d2X9CGjxHgIXTsL0D+BVgCjeyyEJFnQaPM7nxvPippUM29lD7SrE0Gs5oejXhjXdbHmZyQCoiwZApkACRyLO4j1rLAh315TnAxVJcmhwK3jvsGKKjF9oTDtS4yaGj+0RPfzWQQ55sRRGYX6A7twFDceHu8k8e0mxwl0MKc8VOI7vmyFpB9xOp3n8YcS0hu0KqJbsmajeQBc+THHEowbHW3dWHfh8WF3XnJCgh4dpUW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=R8jX419xxOOoD3/paDRyw/2lBPcX8l6OtQvOiC7mxShuR/IIVrO87o/1C35qpR+mQDVdtuxyp8Srl0AuWfbXBPNTQyVHgjfFbIgaTi5AGaafpyLz6UOONEy1tyAoErcmKi5McrtEOjBDoV2LZDQATjLvW7C19/8T5PAas7o17HM=
Received: from BLAPR03CA0018.namprd03.prod.outlook.com (2603:10b6:208:32b::23)
 by SA1PR12MB8965.namprd12.prod.outlook.com (2603:10b6:806:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Fri, 29 Nov
 2024 20:12:34 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::6d) by BLAPR03CA0018.outlook.office365.com
 (2603:10b6:208:32b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 14:12:30 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 14:12:30 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 2/6]  xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
Date: Fri, 29 Nov 2024 13:12:25 -0700
Message-ID: <20241129201229.3161385-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
References: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SA1PR12MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e208ec-c049-45f7-b3e9-08dd10b22920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Wa8MYWTiiKOWgQ/YhysnPfdabOTM55itJPm7BHcIS+r9YyyRM04+kErRr6pr?=
 =?us-ascii?Q?InvF+byPK0/e6Ms4vDFOC0AS5h16FK9WJgOuosUsEyPRPWOlsXctTNpFfVI+?=
 =?us-ascii?Q?v/INUkPS4tYAnWyVzTP5dO1patE2SfvJTzZvfJzokS72oO2awGym9hwTIvNY?=
 =?us-ascii?Q?3A5ik6P6x4ZZ/szX7NuntcKkCqyxVA92dXVxH/YuFmytJSOfMpmKaHQQ9OyB?=
 =?us-ascii?Q?KMZujd7+pjPWGxTHA+LvtXlp8AphP+1PmeHITC7lzZpGGch8axMgGoJmZIpc?=
 =?us-ascii?Q?ZkIt1NsXmN/OzTrj2jx/SzqE8utTvDFqTL08kEU4TsUhJFSNe2mVE/uxiVPA?=
 =?us-ascii?Q?ZkxF8qXHUB21aIm1VXJCs1pAsKGnvK0DwnguHhcgqRKClCCxVnx3JyyxVTxm?=
 =?us-ascii?Q?8SSJID0P44JQZonH68nN9VNecdET6WlejcEpmIzF9p1mbb6AFXwY8Z1LcxrA?=
 =?us-ascii?Q?3a4PFppaclccYBIOc9o/sbXk8v5/2aFpK7RtHwxCJay5fiuX6R6m9auVLmB6?=
 =?us-ascii?Q?7mikj0+4xhGYBE4fw2YIGdHu0fqK+JzNuA5L0OBgXBMLd4hNYIV9XLLEoOcp?=
 =?us-ascii?Q?gh91k5GJn/hgd9kBhBMVQbi8Z8EKwCnqO/TBPmgV/TFIb50+d7GGsgvvywnX?=
 =?us-ascii?Q?Fspjb0lZ6jWrOcajocJzhYyFr4JvGb1IE3sPoUlkbLckzlwptkYeAKo9pWMs?=
 =?us-ascii?Q?75vpRVMNL9OOieZrb5uIA4n5Ev7A4VCkvgaR+wI+abq2/j4oifqWe/QaykBL?=
 =?us-ascii?Q?Ji9ohGM/690LJarOb7ZKPWXRyTFW9K0QBSD9gR/w4t+bVjxuo+/aoIimXf5D?=
 =?us-ascii?Q?IO02LCYMIwYaJ9nHlk78gO5qh77cMtWrotbRJGG5dtvvqtNu5dRZAZi2QnNK?=
 =?us-ascii?Q?zDvdU2RuSBOmGVZ8p450IvfBvv5apgWQ38fdhnWBHUnCP1JiaWh8G4VFS1vH?=
 =?us-ascii?Q?YMY5xR+3/MqjsKIX1tpZDUPSpaknJpLfhlyAbk2tE55pW5B35Za2SOi79cZb?=
 =?us-ascii?Q?HCN4EuGjahku2lN16SlNFhnFD76MWHZjcAgB1tDYZRTdpgsaJWJIdoqnT4d2?=
 =?us-ascii?Q?hr6et+zjDwl7cBDnyVAYXNU4+pA2vTIsrvaASVA0b9X5ucdye37W6FtozPmz?=
 =?us-ascii?Q?6M9z95kJTX3bWruceH+6B0drb8U9gzobHx/EuhqrnyyHKuvMWx7bUv8pzh2N?=
 =?us-ascii?Q?qwu9LmmwgWaX+q6Lsf78otymfytJKloym4ybv2gcHhN0asWHlTENaDQm4hBi?=
 =?us-ascii?Q?1jKVSoM5g26nKU4H7ie1QV1IQ10cWU+MyYGM6/iG9RzYvnTKuIsBacn6dJ3k?=
 =?us-ascii?Q?QsN9ObFt3pHaayzpb3JNLRsr42hrMBa1n8tps0H442RR/sCpnoDonrn0Van1?=
 =?us-ascii?Q?QfP/gRgwSJcqmwTVzBjfG0EAZ9cvFxCcebgpZUp9ScJdpSDNLrmZuXhLxKhL?=
 =?us-ascii?Q?rWuaBkH/LVinymQk8f/dkuH7rkxlc5CK?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:33.6085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e208ec-c049-45f7-b3e9-08dd10b22920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8965
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9022

Inherit xen-launch-config bbclass to use common xen launch config
variables for xen-rpi-u-boot-scr recipe.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in        | 10 +++++-----
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb        | 13 ++++++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/file=
s/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/files/boot.cmd.xen.in
index 98742200..b0ed0dc8 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.=
cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.=
cmd.xen.in
@@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
 fdt get value bootargs /chosen bootargs
=20
 # Set module load addresses
-setenv xen_loadaddr     "0x00200000"
-setenv kernel_loadaddr  "0x00400000"
+setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
+setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
=20
 # Add some space to the fdt so we can edit it
 fdt resize 0x1000
 echo Add boot arguments for Xen
-fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/soc/serial@7e=
215040 dom0_mem=3D'@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
+fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D@@XEN_SERIAL_C=
ONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ @@XEN_CMDLINE_APPEND@@"
=20
 echo Add a dom0 node to chosen to put Linux boot information in
 fdt mknode /chosen dom0
@@ -36,11 +36,11 @@ setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot=
 debug root=3DPARTUUID=3D${rootfs
 fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
=20
 echo Load Xen into memory
-fatload mmc 1:1 ${xen_loadaddr} xen
+fatload mmc 1:1 ${xen_loadaddr} @@XEN_IMAGETYPE@@
 echo Xen loaded, size: 0x$filesize
=20
 echo Load Linux kernel into memory
-fatload mmc 1:1 ${kernel_loadaddr} Image
+fatload mmc 1:1 ${kernel_loadaddr} @@KERNEL_IMAGETYPE@@
 setenv kernel_size 0x$filesize
 echo Linux loaded, size: 0x$filesize
=20
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-=
rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/xen-rpi-u-boot-scr.bb
index 3f83c7f8..0b5d4201 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
@@ -5,18 +5,21 @@ COMPATIBLE_MACHINE =3D "^raspberrypi4-64$"
=20
 DEPENDS =3D "u-boot-mkimage-native"
=20
+inherit xen-launch-config
+
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
 SRC_URI =3D "file://boot.cmd.xen.in"
=20
-RPI_DOM0_MEM ??=3D "256M"
-RPI_DEBUG_XEN_ARGS ??=3D "sync_console bootscrub=3D0"
-
 do_compile() {
     sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
+        -e 's/@@XEN_IMAGETYPE@@/${XEN_IMAGETYPE}/' \
         -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
-        -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
-        -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
+        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
+        -e 's/@@KERNEL_LOAD_ADDRESS@@/${KERNEL_LOAD_ADDRESS}/' \
+        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
+        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
+        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
         "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
=20
     mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORK=
DIR}/boot.cmd" boot.scr
--=20
2.34.1



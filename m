Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94F6E77183
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.87])
 by mx.groups.io with SMTP id smtpd.web11.103353.1733756089644657751
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=wtSXtF5U;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.87, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISnZhoMW/lqqRqGd20EL6O2ILmrB7h6/lo8dLUA6+RB4neP8llThC6ldrdEtTozUQWuIyLgeuZ16+rBu0JFSWBAEM4nsn6kzWT7U1L1YWhUl2douM2goLkfx5NBk3GzenSQ3TAboJISQRGi9LM9yS2vIGP+sWx43vviFi95czK/O/+nmTSf8ITNp3S3R8HW6hkgVPpenO1Ylpn01V4OZPr1wpkjpp6t2YgardKpfsBRMVWeIFrQRCSc5UOBBOT3+67skDmGsrUke6Bx4XDWorYI9bYDU8C5qKBZ/tf5RMojiNEq8KJaJT45r53oav+W7X1ADlKRr2MA9XucafpKvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuBCzADGIQqE4V3IbG5PJrc6xtS6BbdRxWU9UJC+ACk=;
 b=KJ+lGxD0kMP2NBoNr7qzrsOMZv3Y3JnhXaTeBFLXvD9KiVE9hYwdCS3LaEEvsuMnXFgJQFvG1zeHPOtra37cGZKejC36ueSg1TeJhRZ9tXTeX4WMipwnu/SJsSGm4y9+z8C3mho6nR+PlZLM2GiardvShnqul/lb3yCt0Sz7n3eJz1viHNQ0FtB6QpxW9aBTw51+cIhXU7Qbioi9yJgtuXV0UgNlx+G3n3kec6ub/6e7xWM2w/M0O3kJ9RzOXL4Y/xIgwmudpK/LpF2RLiwHeT5qMVfPh3JIwReST4SaQyROB+MA6H9NJewpPCzNn8+JkZVCAwFtelpUvxgrZW2i1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuBCzADGIQqE4V3IbG5PJrc6xtS6BbdRxWU9UJC+ACk=;
 b=wtSXtF5UES6rIufl6abCleCwuj3pgLU/pTPzW7IKcClYExUfKOcRGH2yPSYjeeo6WPGHI5eSqkl+XIWqr7dZKzYJcZS4+dv+kI3AGpORviOP2qlKzHNZcDwlo20GsjzEOe3LC50lW/bCnBECjFViNeYPPJxTXKkuuduSsPvpHf8=
Received: from DS7PR05CA0082.namprd05.prod.outlook.com (2603:10b6:8:57::23) by
 SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 14:54:45 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::73) by DS7PR05CA0082.outlook.office365.com
 (2603:10b6:8:57::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.11 via Frontend Transport; Mon,
 9 Dec 2024 14:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:44 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:44 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 3/5] u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Date: Mon, 9 Dec 2024 07:54:40 -0700
Message-ID: <20241209145442.3291634-4-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 110a46a5-ce3d-4a84-cb78-08dd18616beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TwVF9F2nZlalYzr7h9JYV/zPIJvSYRke+jQCb7jSAk1ZkCdEnaFHsgblp7fi?=
 =?us-ascii?Q?ZRxtH+FUz9djgMtzEJWNgWZqOiO3DK6juurYdzpnP5Mcd339d2MlnA2FO37I?=
 =?us-ascii?Q?dT7OWesfQgo0NTpvjUSYcYQPwxTcqprmRMiMuWWJ/N+wNyX1B5bcRybZNGuF?=
 =?us-ascii?Q?7p6dRjEP75mK1OQ4XxS0CD1UV71jKIseoP9IBrxOmv8kCcXo4JYGC5ncCrC6?=
 =?us-ascii?Q?kkdMqkYUbWj3CjJt9CJJ9g3KbW4kZP/5Pxbb6ekRC0YWqC7BLypDp0yuTlfR?=
 =?us-ascii?Q?qebWXqzaxFJaoBDMAz2+axiNqtitqt4v27CY1Ir7Kvam7//racjQ8iyV2NQb?=
 =?us-ascii?Q?955x38eMjuC2GVdE+JrLeI62Of5VADwDLu7qGVqkY+47Mjf0VnMIiFlEqC4a?=
 =?us-ascii?Q?W2kzF14w6Z2D1UkeXFVHdnM3150XvSobK8t6oqWEH7tnRcMKkWoUk0E+x8va?=
 =?us-ascii?Q?Hq7lcg+imjR8wm4lfoNZkPVImXRDj1PBgpUM4laJvnRtiVMNxcb3/nf7pt9H?=
 =?us-ascii?Q?LGYgYu412l2KVVKPT1qXd5z99IV6buI2XQnGG6rwGfBUHh3wfjhbhAWvtmGo?=
 =?us-ascii?Q?Swl3B2ne3RVTVnV1mTUN2dBfJUz+6Y5T/33s55+vGvJiqH658s+Cc/JS1SYX?=
 =?us-ascii?Q?aBAzdW/N4U0kA5rEkc8GTIdVR/v/AcLxIFFppE90+NK9U1dc7Q4nyqHHh2bA?=
 =?us-ascii?Q?c+iCVvKS6emi8cPuW1VY7X2Bai6K9Z+dOMBuo0fW2vLaaakfifq5o3gHbpxd?=
 =?us-ascii?Q?TZsCJHEY+J4mmVrEYm/yZM7fdnPkDm0rBbZM5cQ0I8hXDO7D72oHkVzzBG/9?=
 =?us-ascii?Q?TWYpN+QdJMzMlm2PTt44RT43YUo5DLDHaDGm0SsnLCjLF3yU2UXFdRMU7mAA?=
 =?us-ascii?Q?qe6MJfG1228VtBRJFZrVOQaEZcu6cl7fnMkb0Pn1OwMu8tt1b/a9mYctk6ra?=
 =?us-ascii?Q?7J8fP5qAWTmz2ikVZb8I7bVTuztAFAyt0I4hepY4aFeaO+1HhbLiR/MD5ynp?=
 =?us-ascii?Q?EQVBHTNmTWEhNYzEfNBF5irZzhBSVTYEuMte8G9QVHIC3t3cfuL0RW64Z57N?=
 =?us-ascii?Q?3sRY+NsZMFn1Oz/XKoJoUsFgU0s0liudgPCPUwWXZSsDG8Q1bIhqtjwngIfF?=
 =?us-ascii?Q?LYHL6v82repW9wpfuIeBKKmA1x5EVkU4PLCH2wCWpttnYrpcI4UWYZ6LUHem?=
 =?us-ascii?Q?JnA7JOITHQ6ZA4ggv+hGih0zjyGIKGnWATe8HqldOhR4tr1nBcCEnQ+Wq98j?=
 =?us-ascii?Q?I4UrECw5mlozcRTmW5jNHwyomw+nWltsauHqvGvAlLiNjaFOlxEMOoMErK0p?=
 =?us-ascii?Q?WJQ7rvgL5o4DDzItZ+xcQXeA3AvocCGApxcVqK74Gq2cb8Aj3GMZci22NYTT?=
 =?us-ascii?Q?KccCa5WKSxSm6kmWOZPtoGXOEIK80hJVuefe6NqlJ6ZOHtQxlw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:45.6894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110a46a5-ce3d-4a84-cb78-08dd18616beb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9045

1. Move xen u-boot boot script variables from xen-boot-cmd.inc to new
   xen-boot-env.inc file. This allows users to include this inclusion
   file for their custom boot scripts.
2. Include xen-boot-env.inc file if BOOTMODE=3D"xen" and also remove xen
   u-boot boot script variables from xen-boot-cmd.inc.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../u-boot/u-boot-xlnx-scr.bbappend           | 13 ++++++-
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -------------------
 .../recipes-bsp/u-boot/xen-boot-env.inc       | 29 +++++++++++++++
 3 files changed, 41 insertions(+), 36 deletions(-)
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.i=
nc

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
index ec64d246..9deb8613 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -1,4 +1,15 @@
-# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration
+# Include xen-boot-cmd.inc only if BOOTMODE =3D "xen" is set from configur=
ation
 # file and xen enabled in DISTRO_FEATURES.
+# Note: BOOTMODE variable is defined in https://git.yoctoproject.org/meta-=
xilinx/tree/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#n32
+# to support multiple u-boot boot target for u-boot distro boot. See below=
 files
+# ZynqMP: https://github.com/u-boot/u-boot/blob/master/include/configs/xil=
inx_zynqmp.h#L160-L170
+# Versal: https://github.com/u-boot/u-boot/blob/master/include/configs/xil=
inx_versal.h#L121-L129
+# Versal Net: https://github.com/u-boot/u-boot/blob/master/include/configs=
/xilinx_versal_net.h#L117-L123
+# for u-boot distro boot.
+include ${@'xen-boot-env.inc' if d.getVar('BOOTMODE') =3D=3D 'xen' and bb.=
utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
+
+# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration
+# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is supports mu=
ltiple
+# boot modes such as JTAG and SD(ext4 and ramdisk).
 ENABLE_XEN_UBOOT_SCR ?=3D ""
 include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =3D=3D '=
1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
index 7a4e41a6..6fccc7b4 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
@@ -1,38 +1,3 @@
 FILESEXTRAPATHS:append :=3D ":${THISDIR}/u-boot-xlnx-scr"
=20
 SRC_URI +=3D "file://boot.cmd.xen"
-=20
-# Image offsets for Xen boot
-KERNEL_OFFSET:zynqmp ?=3D "0xE00000"
-KERNEL_OFFSET:versal ?=3D "0xE00000"
-
-DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
-DEVICETREE_OFFSET:versal ?=3D "0xC000000"
-
-RAMDISK_OFFSET:zynqmp ?=3D "0x2600000"
-RAMDISK_OFFSET:versal ?=3D "0x2600000"
-
-XEN_OFFSET:zynqmp ?=3D "0xBA00000"
-XEN_OFFSET:versal ?=3D "0xBA00000"
-XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
-
-# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
-XEN_IMAGE_NAME ?=3D "xen"
-RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
-
-# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
-DOM0_MEM ?=3D "1500M"
-
-# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
-# alias or full path to a node in the devicetree
-# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D "/axi/ser=
ial@ff000000"
-XEN_SERIAL_CONSOLES ?=3D "serial0"
-
-# Specify additional Xen paramaters which will be appended to xen-bootargs
-# This can alos be used for debugging purposes.
-# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
-XEN_CMDLINE_APPEND ?=3D ""
-
-# Specify the max number of vcpus for dom0
-# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
-DOM0_MAX_VCPUS ?=3D "1"
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
new file mode 100644
index 00000000..9b9962a4
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
@@ -0,0 +1,29 @@
+# Adjust the variables for xen boot
+
+# Image offsets for Xen boot.
+KERNEL_OFFSET ?=3D "0xE00000"
+DEVICETREE_OFFSET ?=3D "0xC000000"
+RAMDISK_OFFSET ?=3D "0x2600000"
+XEN_OFFSET ?=3D "0xBA00000"
+XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
+
+# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
+XEN_IMAGE_NAME ?=3D "xen"
+RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
+
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
+DOM0_MEM ?=3D "1500M"
+
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
+# alias or full path to a node in the devicetree
+# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D "/axi/ser=
ial@ff000000"
+XEN_SERIAL_CONSOLES ?=3D "serial0"
+
+# Specify additional Xen paramaters which will be appended to xen-bootargs
+# This can alos be used for debugging purposes.
+# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
+XEN_CMDLINE_APPEND ?=3D ""
+
+# Specify the max number of vcpus for dom0
+# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
+DOM0_MAX_VCPUS ?=3D "1"
--=20
2.34.1



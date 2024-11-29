Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0984D735E4
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.41])
 by mx.groups.io with SMTP id smtpd.web11.125147.1732919384542611364
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=3nrWCzRn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.41, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfXptIlqakM3ndqKvREP/Pmdj3CVhT8yPTYqPjUXJTaBk+Bxj3NWhAtHnkWe2rTSRE1WxA4RMBOYeJgktcq8n4f00L3kpG5iJE4mzsLBwytuL5eZJk8JX1zIux0ASmYlEHNET4iDJs9g+NjwS0vdTvWC3xOAZwFEc0/t25Sd2oKtY5ykdIZIJ+KMpvVJrEL7hHHDaVUFPH4O7jhJOTqG/79rOrRg+TH4qi8BD2+HC5l4lwqlcQPlYGbmZaU8i53D6G4h+mbERq1/SOao7Nb/Osst64lyZjEEz4ySZ6J1y55twxxy85BBUhvHl6C98xhg3D2wSNQpMIVQgPf8Z7+DXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=MFChizMvMRjR4la6PaE9vE3nSLZWICbptJ3sWPmby+F9k0JtIZHIk2dimx2K92x4xl6w9u+Hlj7qwE6RurS2mC+rLXnreT5KMZI+f/gX8nhEwVh+PBvKjrNezwOrY3edp89KGRuDhelHWKAZUH84aqYaiixKvggHcgRm07Se/sMssSkmnSMsR9+rBgQAmB0ZNpjU7mBmkPhK4SL9+Rdu3xafiDk1oqmvMuI0M2rfURk8E1ns5LXCQcpB0XYfO0KStIHHo1E93KsX4SpJc97WgG+YZGuoGTdL7NEZJjir5CnEnATnEMT6r5gUUtbkcFkY9xyE5gXtVfyhCUfdc3CafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=3nrWCzRnPVkK2hJlahuUgcjyPGaIa2v3MqT/XssDHYxsfzWvkb/NFVGhab/5ZmW8HLVcGxGx0vc8OrHOEticU9sgT/zCRrBhdFVEGCe51pGrSoEmgOmTCtAGSmAswrsgToKVBUlVip2M7Ub45KxMquLV5MKFqJMYshUalIXHebs=
Received: from CH5PR05CA0005.namprd05.prod.outlook.com (2603:10b6:610:1f0::6)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 22:29:40 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::c6) by CH5PR05CA0005.outlook.office365.com
 (2603:10b6:610:1f0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.5 via Frontend Transport; Fri,
 29 Nov 2024 22:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Fri, 29 Nov 2024 22:29:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:38 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:38 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 4/6]  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Date: Fri, 29 Nov 2024 15:29:29 -0700
Message-ID: <20241129222931.1300310-5-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7168ae-3336-4e6e-22db-08dd10c550ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D2Z3NWpYfOYrWOwfoVEZyrqpT4mtgwqtWniq2VRKEUAh0EPF7uDritdHxTvF?=
 =?us-ascii?Q?xYPAruV0YLh6MLM4dHpX/2RGNxaQz8FBf/fZJ40d/9o/bUpKNeHOaQyGq7WT?=
 =?us-ascii?Q?gxJuk4DSirs2U8kMFZo5m/dWcmdwK3DpN9bTncWqWtn1G6hmd1UbGAk0Emov?=
 =?us-ascii?Q?Rc68Qim6YvI0qO2wbAuv7lOqOoCIYyBxqJgiaDWuAghQAk6roGG/72hQklTr?=
 =?us-ascii?Q?XDkkzSnPTxs52kdNNRYuRNlK9kkbBci2lpuDO7twIidr6NMKNOYQEnL6SKyO?=
 =?us-ascii?Q?eP1Q001UlV/U3R2DzFe3hZ0FHkzMayOW/0hWizpxWqltcsi0EZ3eh7ntigw5?=
 =?us-ascii?Q?fjtEBXObRebhDDVrWyNjEATf7HW17E/4b0xu/xoO6gRFayOjhyGZTbpXP1F4?=
 =?us-ascii?Q?nlFIS91DuZ4qrgJth9bAAk3mTYimizElo+fz/HN2myhH+Wh0Lg1DMDuLd7VC?=
 =?us-ascii?Q?oCigbDgA+Krc3nFAguDqcF+ekS1BCVCOElw1DC3kgb7/VN2KsEuNeYGEgT4u?=
 =?us-ascii?Q?4el5JHYRceXb6+KOM8VBX3eUp/lFh8bNuamNqPveKWbRER/0CsobO7A1m4kz?=
 =?us-ascii?Q?rrCVVwOd9eTizb7XIg4VzAjgsKXvx2qxLgwuVW7x/qZjukJ79+x+7yruaMfZ?=
 =?us-ascii?Q?IXR5h5fprEONV8+srD/d9pyDg13ur4nkc/Iu1J9VLIKnhyHQOzAcvZrOkaBp?=
 =?us-ascii?Q?UOD9cxCoKmEQo2uVmihNK6lRfXDclQCwK2vUbQX4GRyUsoHm4OA6uwdkdHid?=
 =?us-ascii?Q?sFsNTlRH0znlMBnQ9qYosvAdRGoMqPx+JcDjUbTAJos6RsWFjkMn+XPs5wWF?=
 =?us-ascii?Q?TBQNS4az7OqYSMZxuweOh+SP8YaDQoKQAvBqRdQ3w7clHvMOEXAzVQWtP6nj?=
 =?us-ascii?Q?fNDbAFRUgv0r7TyIdEI3zxFGIRVe2U21s5RAj6nsmOyi4vxgQaaxUiKjzH1k?=
 =?us-ascii?Q?tx+sog6+igW66KwSGj6YEF8jciTC27tleVlIT66Btv3Jt3l2FKNvmJ4/wlUv?=
 =?us-ascii?Q?QeHHXLzFSoDnF1TpEjSXenpXKSSvXRQHnEGJ2ETPJGgTwVQKTcAlJHaA/5Lf?=
 =?us-ascii?Q?ADLTbQC6G+QwV1YTheQ6SEE6hjs0Pyq3WoMz4kW1T/m37v6EGZBzk9AfxnvB?=
 =?us-ascii?Q?OFOcqOOd+tCg2BY3X7q02wl6Sp4qR7dKC/OW3T98pU8dxGZlc/9WIVhwbciU?=
 =?us-ascii?Q?G+pPV+cCf9d7gGpBo1KSy23VjH66l6azPOHXzqNXEe9+7EM5ksnbmtm9IpyK?=
 =?us-ascii?Q?BIhfRN9TdTzy3so0gwIUyWSRQQHJAq2K+9h3xFuMGGR0na8efTOP4nAo/HUW?=
 =?us-ascii?Q?x96NgbwbUHkhFri4AKWmyTFOZqTsy2aEM5rcV4y6Xr6Pot9/HcTje+69NXdz?=
 =?us-ascii?Q?ZO7xDsg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:40.7860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7168ae-3336-4e6e-22db-08dd10c550ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9028

Include xen-boot-env.inc file if BOOTMODE=3D"xen" and also remove xen
u-boot boot script variables from xen-boot-cmd.inc.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../u-boot/u-boot-xlnx-scr.bbappend           | 13 ++++++-
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -------------------
 2 files changed, 12 insertions(+), 36 deletions(-)

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
--=20
2.34.1



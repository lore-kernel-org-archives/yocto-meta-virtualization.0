Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE21D72A1C
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:47 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.63])
 by mx.groups.io with SMTP id smtpd.web11.123081.1732911159767648060
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=kuwlOYjn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.101.63, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxk1xfgSsMK2yaFfXutpWowwpgWFVrO3pLkfRQRoS1YpQRwMaYydPuWXEYwyDaTjEqzH/MBmu0LmrLT5qQfKXULfUsQrYeu3+uciw6fXvyzDmWExb/RtAVNaEOml2OoPZ8Lm7pvpHl8rJDsxD1z3e8uH8DkY+n7bgap2zxzGUmwPkYNxs+qEgoX6tXQIwsUUrH+1W7OXULVQi5CwBm7js6oR18D11IJwe1bc0Av+fyKTOWxMkpkYe1F49V6IWoM52GC44XI3FeBNFrZBEdrlaR6ye8sPRGHgPZIEf26JjWBZcj8AQDDQdMq+tPl3oXyPpnJlZPZAyoWPzZaG+2Ohtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=MLJ7YghPZz4bpB1aUWIYN2je/p5Pj9DcBCCvR9De5dWvyDT9qA5LrRl7k19w2ZXp+BjDIrgnvHHqKJfyYwOn8ddB+rVed+cF0vwZlU1FzqysFd+ufAqaj5v02M4V7DUWmut+PrdkzfVq2tJifZLASVKark3gFNN2p4F6U888bzS01dUn3TSaLjK7Ffrz9yWDYW9USKkl0W4xNSaNJD3CmWYB7amQ17mLRZ5yTGlix9pi9oQJ8SdGSi/OPdNH+T3s1RWn14A7/MGi93mli3Z/qpUvjoqKy+Gcl/try2jOr7lK/ADFewVJdwKYEf0viGZF2XMp/MVy2vCWPuScKAePcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=kuwlOYjniW6MXlnXsdCKsYs0jKVNaI+rXtW3Pz3ss7OXhUs4CrbA7+MIpH4BqJ/hAI9LmH5fte0vZxnlk/h2xSH2ozcg88i9jFJFYeM/6cXITMzgdYGEHtymiWjobu76tBT6thC3Z4zFNPw9RjfDYRtRQZHsxzGGDdshHG6/uu8=
Received: from BLAPR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:32b::8)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 20:12:35 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::53) by BLAPR03CA0003.outlook.office365.com
 (2603:10b6:208:32b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 14:12:31 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 14:12:30 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 4/6]  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Date: Fri, 29 Nov 2024 13:12:27 -0700
Message-ID: <20241129201229.3161385-5-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 09686c49-e19c-4a8e-8431-08dd10b229d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H+R2fGlZUeme0xMa0Y7Z5bDCrspoLMU/VWJOaG4QXrAuMoGTrMrsa+k3WB4g?=
 =?us-ascii?Q?nQeTjLpCaoksAXD3PXsM0GV5AUbgJtlLAcoeMzbAqcVT9R33ZHXzTT0oRuE/?=
 =?us-ascii?Q?6Cm6PmNuCkR0Q/w+ebvox+YkhAuAB7x6xMKo/yhidrupEYTB4ctnm3cSWug+?=
 =?us-ascii?Q?UOl6GZQz1YQE5zRYF/oLzAnLkB/QtqXu4Vss1aMUTfYsyrmOrYSzv32Alywj?=
 =?us-ascii?Q?qqHVV0Bm6fW4UOEKsagEWsllqHnf6dQ4EADKsoG+8mOY/kKQzWfPucyxu4zK?=
 =?us-ascii?Q?EZd2UJLKvi4nJJQFZ3Qv1cd9UEkTXEZpFgIHM6YfoHb9uO2viOe/oHhQtgXN?=
 =?us-ascii?Q?ZGV4n3BAitbUM28/XPT8nq1lDjJvBTdfhoipKjF/goBJyGTjth7tlIEmIEH6?=
 =?us-ascii?Q?/pdzdST1Q16SWipmWE+5IEpFu0hsM8xeOVf37FIl+X267fVRdWye8OCEf5fF?=
 =?us-ascii?Q?sliGpIvdAE1itC1DIBtueE1xN0ihUmQO70wmjBCr+MSAAARmMfkY+NmUmCA7?=
 =?us-ascii?Q?fIMgdgH86XSbJRsx6NirxIBryHDe8gTjD3Bkg2Ee654ufkkg5HAHZjJzEtKh?=
 =?us-ascii?Q?vsXGfRavWAwpPZoLYRaBAVtV6FM8KH5Kjk/X2MCQQlxF+vKFbECz9oxsnkS3?=
 =?us-ascii?Q?FMPIf3hy0CPiwU/GA/m/H3qjg+TFrWRLVJpOqLT3kiR7df2SyA7Jy1pcVuTb?=
 =?us-ascii?Q?IXJrSfL6mKrgj1rIopxCvLOgtdUcn7XlASLpj63VtKxA94ucx72hQE4JY0JB?=
 =?us-ascii?Q?kkoNO7lJN2x2Jj89Ei2ZZu8CXkR4i0s26cwXPLm16GSvlhcZUFRJ2UUQ/1vE?=
 =?us-ascii?Q?zWiqITmq2j0AzeRgYLZC+fhsb8ej8UoM6Kw777BYcn/cYLbAH3N0bpVaKyus?=
 =?us-ascii?Q?g6r9TI2Btp+jUtB8H/XXalfga4K1Hiv898zDZtUyiZErP5u2os6ssC+Zf4Ja?=
 =?us-ascii?Q?2qjtGYtnZRFgpKkcw5XZ34DjfohiT01XV0QoL59KvllFctg7in2UGuM4z8kg?=
 =?us-ascii?Q?dYO0PrqRpoTM6r2zchCMIm/M0VLxi8qV6+g1LwtWq+eVm+Y4rEpl1blNyLAe?=
 =?us-ascii?Q?6p06qEf+haRBVf6URUT5vzIOe7plJwU8ipl9n+rPvl29gJAc/ZANYqoOpilm?=
 =?us-ascii?Q?ins7jw74tZxPR6rsvxtzzmUbnqFjwJz8HRK2lCYWfkDLAvKeYbbArf3O2hwQ?=
 =?us-ascii?Q?+kTw2w1ldnS7fl2bZXmyevrjjcWKHshbk3uM6vNOX8as7orThTxu7lao/UhU?=
 =?us-ascii?Q?T/Io5Yiz4ral8mh03aYfxWIVtD31mcvmYXSWBX2CrxXBa9TjJ8bR6PhjlpJF?=
 =?us-ascii?Q?GnXROYEk6bu6c8AVbE4lfJhCBfAtOlSXFaLa9n3TIFjFvDjOj0w8sWUKAjvl?=
 =?us-ascii?Q?6ke43Cb+BQITRM8vyk8BfGqjSeZ/qAMLaxbQcMmvUzuzn+ygKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:34.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09686c49-e19c-4a8e-8431-08dd10b229d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9023

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



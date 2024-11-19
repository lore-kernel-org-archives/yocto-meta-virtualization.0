Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67B9D10F59
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:12:37 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.72])
 by mx.groups.io with SMTP id smtpd.web11.14147.1731993148657681372
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=N0hIcsIo;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.72, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhaHtbkg0AhKJj8mNKFDKeMSVovXqKEEfY3Z8JCDlNPdUZkcVZcqIir95F8K1nT1wTwDADAeKRfEIooeBsfeqt7gy7ph2VybVT5bJFV0DPsq3SF8rhYq0c6sEt7OZIJBVmZQTL7LnPOR5IJszsBeZWr5imNufaBasIlsAmfHWjz6/q5VaoHROdura86pPhhv6hvtlcpK6/Itkbub+wCfdur7MOUf2vZ74IAsw7hesrnmRsO7kxE4DEk96xSLtJyD+d1M6egv4IbS+y3zfXT4Bw9YOAeGw7oXv/Dh2AVYRPL56CFuO78ZB7VCywsHtYbJrRw+SnRRH90MgvptpMdDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu0gPqJDe16wCbfWfntE2NYK8Az6B4Y3k40VGyjdmbY=;
 b=vIdt3dEpxctTVqI4fiGExM9elqD/immXt7nkbJp7lSj8lSXGADrvfjNUANqqz4ofFSBa6VjDXxgXTCXlb6R6ekoVuAiadiB18qN1bF08yZ28PjMTnEPC5uiEk0lZBTccUNbJZJofzSiSYdGHY2YJWJf/YN7Dno27nYcRrPJsDyNZQZdmfMMfO5/hzccDM90kdb0AQHaf59OaaBS3NSvSVqwuloJXbgPZnnusPH1i7Q078aiQHj+A8MulAhUGE14GMF9vdDwoGOLhx0tvWO0NKx+NXdsM6a6tKZfGbTal1Hc2HgD2pE22oriHA0pXqjEOPyYlVpshDoYqaJL79A0XLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu0gPqJDe16wCbfWfntE2NYK8Az6B4Y3k40VGyjdmbY=;
 b=N0hIcsIoahLPONNLrL0R4Fj/SJ78P3FaQ4Jp15PIlHymJRMVPj2yHcbYTUtRx6G3dy3I2k+MUBkaZ5RskZTN5hDLhIajG6rM7mkUKrG3xVRg/pqNtz6iaYmtWXZtbo2N6+gBjDduTsgppkFHMkTH23VmAXJO8kWXt5yhF8lzRDM=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.22; Tue, 19 Nov 2024 05:12:25 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::35) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 05:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:12:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:18 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:17 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Date: Mon, 18 Nov 2024 22:12:01 -0700
Message-ID: <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: bd030493-2203-42ed-94c7-08dd0858c189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BbohuEHHua8jxhs4++fNKKjMv+q/S4OkQeVYUSPyFT0PU+P+Ts2lxLM/qPXU?=
 =?us-ascii?Q?k8SyIf9KG6kWlD9oKWfLL4AA8ib0nkhGNOjj11Ea44LcyFEeX9d8b76Jxn1W?=
 =?us-ascii?Q?F8K6LdxD8oOoHCzgrB3m3HYzyq3jS3vMKCF3cx83LVyP+DpmbHorCJ+hGBve?=
 =?us-ascii?Q?rPuqkbwokY5XvQqQGG9AOxMTDJbWt4UjaAedklwDYwaTZtBOQsbnDwiB9/6C?=
 =?us-ascii?Q?Zvph0daUWZgtfFR2cA94YJQ9emdqsJfLVSfe29BCUnNO2stdFqraVzNr6BP4?=
 =?us-ascii?Q?lz81S4Cdd0BmvpkTgBHUu9R+2AORNp0JEfS1GxiNJOty2olC+LBvVJZhi0Sj?=
 =?us-ascii?Q?KPORBWgRmc4vSKNQEeBiIwROZbUi1KngknAkCFYB7lBdjdQnLWWFaThP4Uyj?=
 =?us-ascii?Q?1R7z2JPvPKDNqsBNWTC18wfo2stwOnATJvWTCmQhS4tskmxFH36JrrHC7czi?=
 =?us-ascii?Q?7z8DtV+Vm2g26fMxq7YxKvR226QMBGcjrfnXxxYWiXuKibHvc5qpNX64+dr+?=
 =?us-ascii?Q?QOjyczQrM7cPFN0KFnCOR9/iMnYORi9pwtxurJ7V+GfVaVYqojsHkqdB7mJQ?=
 =?us-ascii?Q?RlMcvl01zJfs+bwsCjBQNsY3JZEKqQYth/HxJJDlKq0pi4McCos03ViqMCXE?=
 =?us-ascii?Q?S76dy5VG005dWepxG8lMFoNnQ5Z9RV66LaoGKUIgiFPcXvxRKWnagUDK4kSC?=
 =?us-ascii?Q?Tghh05oNwu9hjQTFhxhC2/3tahtfDBHtgvGILxGJqAejJykHlP+aX5jX+kyn?=
 =?us-ascii?Q?9TPjqRrIUWxSboWXwZePBwA1SiJrIgFWJ84XvN/sUpQK+AQi+4B9pm519lhx?=
 =?us-ascii?Q?x0/e2OYMsVcUAe5/aS7cQ36fLOSj+9kn+9u3Z5jDulqo3RjEFkdBhcZlSsgT?=
 =?us-ascii?Q?lH81CspG+kI9n/6REblFPqp5nxTR9cTZjZVYiFrkWk00UevoTO8yW+F6Ovjs?=
 =?us-ascii?Q?1rJo0XwEH4qDanwn6CLUNlOq3m+/4+AlTjs9z2sSZfTFKnJ7v2H2gshlDOLP?=
 =?us-ascii?Q?wF4hCWHYDPJk9aU2AnlWReQP003L0Wnp09mfdOi9r8asqqWnFHHlSKa+x9PR?=
 =?us-ascii?Q?2Csw4vBJ7Iui6ZL5zFRodRWNK09guLY69yZCrSBDYBhOkUK0yFymF3HDbeqK?=
 =?us-ascii?Q?HwRCQGNSLPnQqfJxJ+BSxWI90qKsn4yggjEnc+lzPvh2FOYKDO0ycmJErfT4?=
 =?us-ascii?Q?ILJPSMnGDKQ9s/Xwt6USxPIlEAtV1VVii6ZrvnFu8sHRrveiV+WYYX8z9337?=
 =?us-ascii?Q?tLnu6w8kResS9iLzhOw/MALlsDelXo1HyQ8MpEkcv8GFsniwFYuAEwYa0h94?=
 =?us-ascii?Q?h8pJuYgs6E0auTCxJh+mX7gY5c/MxAExOzXajxfIZJKLEJyQHGDjpNqcrmKN?=
 =?us-ascii?Q?nky1rkYKOzU+iJ+OeDvv3y83hMcltSl/K2E7xBCzeBLS66alHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:12:25.1610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd030493-2203-42ed-94c7-08dd0858c189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8980

Include xen-boot-env.inc file if BOOTMODE=3D"xen" and also remove xen
u-boot boot script variables from xen-boot-cmd.inc.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../u-boot/u-boot-xlnx-scr.bbappend           |  7 +++-
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -------------------
 2 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
index ec64d246..4e39c316 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -1,4 +1,9 @@
-# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration
+# Include xen-boot-cmd.inc only if BOOTMODE =3D "xen" is set from configur=
ation
 # file and xen enabled in DISTRO_FEATURES.
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



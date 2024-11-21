Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C139D7876A
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:42 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.88])
 by mx.groups.io with SMTP id smtpd.web11.11846.1732229377397498457
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DTPeytrX;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.88, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkB8X5bfoZCqQcCPLe771R8mWPKTom1ntQ0lJZ/FVYi3KSGDkfbMOeY3yiJxkY1gSK4OsVGxn4+6UOz0iUrjLM0V7YCVQk4UpqoVW9TBn3gvWKIhAbfrmHxY3AeAjRWYhh+3Oi0QYbVnEvz+8LmOK+ygm0QbjuC9VOrzI3BC0r53ifp7nVEIn1lza0a/vseqxjdOCuKVV4Jmo+Mo9jqMiiLPO0dNE80IXrsi9z6YKtM5rLaLTHyrC0gMVDnwD5uzzo/C+wKRgyKaibJ00w/DpYMgDpL5I8sWVm3vYO/jS9IWzvo3p3M6rqBSSx08+4aC4Q5ojU394nn6iBZOj0ToMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=V+PkXIiPVaKNfYZt21hM9vzbavQmpAoxgP+9ANWcKiCIMKEPQ1rrMwsOVKetH5gcRFXC103zrneE3dL17oHIfIRsz+JpCe8Q8R5lPaeLxuVgVWmeOSk7B4Io6KJ+ASHupNOeYggVWrKlO4bYjpmRpNjuIoRH4Zfb+inJFI0OsjmEetPFdj2u6qss4mq34Heb6/B8TUEcGFFFFtx9Aw2/jlun4i355mTF9+xHPTojkVryYNOmVbVaGyXfQBPSoPxeGNfNq8dygN8Z5GnM3UziECh0FkaGJNHDe8C3ePk9ryY2VJ6v4KtktXRvupPh9nItQ2oxt2BKdGbJgZTD8vqEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnGO8wFcVplPoqhPYed8LC4Hfb5GDFs2wtA+9nTKmxc=;
 b=DTPeytrXBXo9KsYXy6jkA8oTmDCFE+iLuEgpZ/9iUbokRYlNWB8ud2NYyyBv5NCrX4fydgbZ0tiCPE/D2yKHlqBxbQbwzhzGFM4KJHwLT9PJwLPd8DnNAGUuN1Cu1yFkhgOSe90iLxMCC7OLQx6Bnz0xNl8lMy+i5QjAS7pWcTo=
Received: from SA9PR13CA0119.namprd13.prod.outlook.com (2603:10b6:806:24::34)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 22:49:33 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::f3) by SA9PR13CA0119.outlook.office365.com
 (2603:10b6:806:24::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:31 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:31 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v2 4/6]  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Date: Thu, 21 Nov 2024 15:49:27 -0700
Message-ID: <20241121224929.776765-5-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 00414b63-d6ff-450c-8240-08dd0a7ec3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eoH/33B8mBIqO34rjUFEfAAibI9YJLautnD5Q7KVi08xAiSr9zLn+le0//uo?=
 =?us-ascii?Q?zIQeWELLwuVUz3mvVsrVMOAFCx6dNxNXrXPuloL2bZex9Dr2q6j+zqnmWw1y?=
 =?us-ascii?Q?lz+OYd0PP+VW0hV6oObR7rsYfdUn0N82AiBJws7Eg/wCg4y3VeOPZGyhI4Ma?=
 =?us-ascii?Q?uYYr8MyhKNv5BOlplcesW6wlpzEn5qcBZGmJuztPSkvdXc8cT7WXK4py5+oz?=
 =?us-ascii?Q?qvNUKKpSDtLoB9JHHc/9f4LNQVcu7mK7QpPxcbqGmqi/w4UjPvhoowtyv/JF?=
 =?us-ascii?Q?xeD5ez6OwbCEMvWWVBmlaAKwW+vI95OOsHD0+oOEgoqr/MtpcbXDZR6qEGxS?=
 =?us-ascii?Q?wziA8mzEmzm4IIMUI/aXY3VEUeFRz2UbP+u1TO4NKigRfLc0KuXWopZ5iF4F?=
 =?us-ascii?Q?PhMznY4u4qPs7c2R6W4LaTpscpJH4Dr6IkLTA1dijjwtV2wqlwPa85Dm5w/r?=
 =?us-ascii?Q?9bDTKwQM/xa8RzlZaOb/Wn8ts0XYYRdzLA2hfquqFZ0lJ+y2La1rGEXRF+gn?=
 =?us-ascii?Q?n3onAoOq6zme2XS5J2/2zvPvnZ2sDQZxJxaudE3Lb72Y+oquKGVgrUalsCol?=
 =?us-ascii?Q?iCDoRnVaqOrn7wmZ6skD2YzLv+XmQFjz2aeJ7SYXnTyCE9+tVD8fqJp4YjdG?=
 =?us-ascii?Q?5r2TQBRPoh77UXn/Mj4WXkcqMRHJtZrkuRrdkQMqktNTu4lcc+wspig0mhJc?=
 =?us-ascii?Q?LdNvUfQ/3Ap5H3ZCCN6645xTGxkLSTtrLqOMNoip1WYWqx4u+5G9GZHSJIgR?=
 =?us-ascii?Q?SMAPAyo8UIHJ5v3NvxoXR4WMU2vmgne4B72nhXPF2f5PK7V2E8QhWZJkIjIs?=
 =?us-ascii?Q?38rTZJb4J79Q+eIVvctWIfpXQRiY7r11pkk1LfPqjaGU8dQuHvbnH/yPVU54?=
 =?us-ascii?Q?lJc9h5+bGu0jGkgemwtb/zH9fLGiKzL4oHzJyj7nMWyvXqfu2aF/Sq4k3YAG?=
 =?us-ascii?Q?rvaslzhYIagzLlrhtXbK/5pyZRRXrGfrPwTuhWPsI/Kyi+X+CZuKhDDhQFrB?=
 =?us-ascii?Q?Ef4jvgNKTy+pZ6b2rD0a6VmyV7wOAaCJSMgNH+5jFT8bl97/VtSOqE/yvPh7?=
 =?us-ascii?Q?rja+yTqnRotHA/6s2nYtDEfPCBMdT14Ssgulg8kfbShbMkoGIW92+hpDOIdb?=
 =?us-ascii?Q?1TkJl61waptKy88rqPvy2Puf0ZQ07Lb4KQJyKUfSf9hIOv1hGrQTlPOwxDGQ?=
 =?us-ascii?Q?e3VeXUUTCry8Oei1+mE9J4+D3xwcPvYnTzN9bc4kHq8gEgXtpMPhl8/Sq9p3?=
 =?us-ascii?Q?94rOanMSvvHDM9sp21arPz8KT0vaW2jFeQSFt1Dxp3MwfrH1F7ENNpJpcQT7?=
 =?us-ascii?Q?K9Ve/gqDnSzJciTzRYwAy58ThwEupjk/hO/hZ3m97VtIL1KTWkX707tXGF8K?=
 =?us-ascii?Q?cCqyJLY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:32.2486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00414b63-d6ff-450c-8240-08dd0a7ec3c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9003

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



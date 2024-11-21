Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3CDE6403F
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:41 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.81])
 by mx.groups.io with SMTP id smtpd.web11.11849.1732229380833996738
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=PhlnadCH;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.81, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcAgFJCSjbxXad8WxtBqqP/BPympLYqrjPCQdMdBwDBFKnCW67E0n4D9f3Pkk5Fafw1y9sx9gkGwZi0q6SQZKef1TMH3fDE9DIbDLGm/BG+6Z6lXBpkXlfJ555oEC2d1fvj10YFM5FaaXPyFXFWDeno/h8FvndF17nj9VGBD1EuwSLN9+JL4BV27B690lNW6H3WCABx9d/s2VXpfGUrQnOz+Obls/tZxIKj1BL7a/RxBs/7CTdGOrVZ5zjGJGAJk0i9G2JZhG/GLdJbD7Qksq3J8vl6QjCunnUhJXyKRgjaL9eaKZoEp32kp2CffaMwtk3BMfxHPifEflDww2yXNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAFXHF3c+Cfeu7bphzij7N4E4hXtF/hH3K7WMD6jY24=;
 b=B2uEEgc8jkn+NoRaDIkt8NQaddAwXh0QSIG+q0OBes18zE6tjQsAj0IWAdUY6i//VNTcTSyWE6tVcRcmdxgMjHIZlxA2++ANCjS+zwGhFQagVNanHj/nQEqaFCAJJZGul6KcX5OCPzoBxGgyewL2Brz/AYSjjLJAAwT2KzPF3S+BruXlbWKbmLodPv+8wIz0QccqVmb0qxAsAPPmI5PbmtJ6tyIyUcWitX7tfOnmj2P836qeeeqNIe02d+hPqTNESgmrX647G5qgFewQyEPF+6eIeG9zONgibaWe2cKOEuf75cE5FmNAGPbb+xKPp1hPYH39KaoSRhp4DOP8q7jwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAFXHF3c+Cfeu7bphzij7N4E4hXtF/hH3K7WMD6jY24=;
 b=PhlnadCHpY5/Itg49eFpymMHZE1Hc2jIxT1HoNoaY8XVTos7jcgxPtSKBA6vhqYM2IodAS82hwRiibNBwK3krQ+HXCgv4kLqwDfddMv180fLdy22EmuucyKUDkToeBuX5yBoJwRVsQlafcYGvWvWq7xY5+21kqMFOaex+lsBkTE=
Received: from BY3PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:39a::14)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 22:49:32 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::6b) by BY3PR03CA0009.outlook.office365.com
 (2603:10b6:a03:39a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:30 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:29 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH v2 1/6]  xen-u-boot-scr-configuration: Add bbclass for xen boot script variables
Date: Thu, 21 Nov 2024 15:49:24 -0700
Message-ID: <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb4d251-1232-43a5-6fa0-08dd0a7ec32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WySdkE5ksmb7AxEipWX1+TfpX38EOTLvP8FhT2njYBBAfj/v+6n5UP4XdkHb?=
 =?us-ascii?Q?W8DsmF8HfoN+2ZLkHBJD62mjoy4vBdXmlvd7MhvwABeP5nnEc8Xx2TV3cvYt?=
 =?us-ascii?Q?F276pV/HH0xihTkMwJlObdX3t9J2kIltM51e9e9G8APNCqI2t158NjbCiqYI?=
 =?us-ascii?Q?E4h1JtSwksHQKJlDYkf8KLmNMBj2pMNm0TO+6TjPYkw4R1tzlwIOsFkaSDFe?=
 =?us-ascii?Q?RjMk4naLwCJDWvKaTWCgAgk6QDYRU1f5OvTbS61K+U1XQIUtmJnH6BTxfkNw?=
 =?us-ascii?Q?vdC0kdJksv+taIPDFLh/ax7ccgNN7y0bt24isPDACDVrb2QNdyeb2ezwmXyJ?=
 =?us-ascii?Q?dNS9QQ39N0H36zmRha24LEUlUnrdqUSzFjQCn8bZHvd2yjX2GoBtqleNh8qs?=
 =?us-ascii?Q?p5DfDlOIUyq0QE6jfgql9qNsz0pXYF0XUbGaXBps09JwG+63YP6h0gPoFA/t?=
 =?us-ascii?Q?/fxmn+NCjQketvlj+8Aiao3MiPiBfBwJqLVBB5vXbt99Ia37WZL9KUYN9+IS?=
 =?us-ascii?Q?N+7ZTAv4yXyzMwakWDCg0YU0okd8//JC1COVKbh/gGL/k6X/V+p1JzJWKnRV?=
 =?us-ascii?Q?CKXInWEK7oiNtzeDXC62BxxCGzSkqKzIcR2U4U2qgR+AaPOzDSgHy1T2hM2W?=
 =?us-ascii?Q?UbYwn8MeV+FF28QfvHBG5+FAtddGgY5lKB3FdrOwKfCbgE3OJGvSPZGyh99Y?=
 =?us-ascii?Q?M0lZUjX/0scgqYS9t6GLP7wyk0AiBiCyVZCY3sQtgfFHtH5GrzEjMUTklQcu?=
 =?us-ascii?Q?gtSnRMxwJqNiUpbvxRTV5m/fWNaA5C0QD1zWIzXcne1hwWkqEQOjyt5jNYz3?=
 =?us-ascii?Q?r8S17vglTrn2b8h1ToLQ7i9Hrk2WeSNaO3JvAzLRpqSeZOQjoJlvAcvbpFoc?=
 =?us-ascii?Q?tEUiff/u7/DMM/xHNZ9w8tAkJcOyM3Jwe2/F4tj16EZcrfLWRbrbMhRqB3bi?=
 =?us-ascii?Q?dn2/ZYfP7CKcMzoOgpcxRWFONIbY/AN/l9NUwP1NgDTI91BQxyx3flf/ikAb?=
 =?us-ascii?Q?2unB0pNzFZeqRaDEnQJ38cjcdt/dYWzyqhj5zY3H5dsuPUUXdzue4UK8LriO?=
 =?us-ascii?Q?p8LLAyJlkqxs38kDfajQNRol/aD4Aqe/AR2GFHgX5p+N/ZwjpMrS5Mae8BGU?=
 =?us-ascii?Q?XdNm/Htl/h6zB6i2vosFg1Pefr2ShZNhpxhkZ5uXfGXOzrBUyEU7l8dXQKSN?=
 =?us-ascii?Q?10dpx+bB6VA664ZYY2n9RKZhi7iGBNKXC/PiT2Pq1iaI84hyUoI5cpKWSqU5?=
 =?us-ascii?Q?Ye0/so0nGE5tPxbe6DODff/OscOePAax7Gnf8EwnUY1d2HFS36AJD9dI7tP2?=
 =?us-ascii?Q?3TWkaeAEW1IzNIezAUl5onvy0VSW7IGgoBaw4Sc7KkRwbdLG0anK+lt/aXnG?=
 =?us-ascii?Q?d/fDmjY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:31.1254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4d251-1232-43a5-6fa0-08dd0a7ec32a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9007

Add a new bbclass for xen boot script variables. This bbclass provides
common xen u-boot boot script variables which can be inherited by any
vendor specific u-boot boot script recipes. Also these variable are
configurable from recipes, global and machine configuration files.

Variable nomenclature is aligned with xen documentation.
https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

Currently it supports Xen Dom0 boot and can be extended for DomU
or Dom0less boot.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../xen-u-boot-scr-configuration.bbclass      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 classes-recipe/xen-u-boot-scr-configuration.bbclass

diff --git a/classes-recipe/xen-u-boot-scr-configuration.bbclass b/classes-=
recipe/xen-u-boot-scr-configuration.bbclass
new file mode 100644
index 00000000..df8287e1
--- /dev/null
+++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass
@@ -0,0 +1,43 @@
+# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved.
+#
+# SPDX-License-Identifier: MIT
+#
+# This bbclass defines u-boot script variables required for xen boot which=
 can be
+# inherited u-boot boot scripts recipes and also allows to configure these=
 variables
+# from recipes, global and machine configurations files.
+
+# Variable nomenclature is aligned with
+# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
+
+# Image Load Address for Xen Dom0 boot
+KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
+XEN_LOAD_ADDRESS ??=3D "0x00200000"
+DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
+RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
+
+# Xen boot image types.
+# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boo=
t.
+# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
+#                Example: xen or xen.efi or xen.gz
+# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio=
.gz
+XEN_IMAGETYPE ??=3D "xen"
+DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
+
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
+DOM0_MEM ??=3D "256M"
+
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
+# alias or full path to a node in the devicetree
+# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
+# XEN_SERIAL_CONSOLES =3D "serial0" or
+# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
+XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
+
+# Specify additional command line arguments used for Xen and this will be =
appended
+# to xen-bootargs cariable. This can also be used for passing debug cmd li=
ne arguments.
+# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
+XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
+
+# Specify the max number of vcpus for dom0
+# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
+DOM0_MAX_VCPUS ??=3D "1"
--=20
2.34.1



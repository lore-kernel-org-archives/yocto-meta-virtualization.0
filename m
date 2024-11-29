Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE66D72A1B
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:47 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.52])
 by mx.groups.io with SMTP id smtpd.web10.122157.1732911158223633051
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DTTHnaxm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.52, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WExXyLmhRi2rv4THYpy0oGLm95TKC3lEHBoMQfwoKFEBHxtd4kQfBHxMgfF3G/Y+SGOXMeuTR60ATJI6ZOX+x8yZxF1m174geIR8ga96wtqFqofXOOyd4jNz+G3uw+R/kRSeMGo8L/VafMnwJBJKW8AoOdAX+tkc4uPvB5PUrrYKQpnAKoNl7J7iqgOu89DDYjpKdJArc8/u0XM5M4jHAGT02wa/C98J9DKALxJeeAS798cLlapRLTfD/Enbz07teQSdFInwop0zNxEGaXeq0VI+rX13JmpQ+C7Kpu2vEUZr2AdkRczcJICD3wSBwogUFRQdlrNrtDLz8ywHdj/+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=ab1uw7i0JLqwPKKsM+wh09iP8zqznVCYgA0V35HZkHdu/nBsN/uZ2XC50pWipNPpgeydnx/4So6c6EbCysArGf1y5usDVio/em0och0KulsDW/AzYKghckuclP/NkkHQprGm4t+MFQrN9ZqXLHyd6u2j36CRoVcSQZMRqA4tzKQqnFhADTvuI1fgcx/OdLlv1Bc6LNEmcJZXQH15Y/hplr8IzpH7ldOCGGrJWy7dXxKO0449XNYnk3w6YXSJ9aByWgX3IhFj6KG76Lg3akMF03xTrWbW6miBuZktwYBP40dEFt3rtaZ9cykXZu+V7FKXAcBX3mCeTGWvi5X+KW+/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=DTTHnaxmRhNx3FsEll18mgV/dQOjYQr5KBJxo82nq104+eXduiWVw7uKXSXukv58Rs4oS+Q/0s/WzVT41iUTvRS7NmjPSVqiP82HZcko1s0weqtR5IK/v0idBViU9rPxu67uixsXee5KW1gRyAp1zdqd+D3pUdYQ0jW6zvSGA2I=
Received: from BN9PR03CA0757.namprd03.prod.outlook.com (2603:10b6:408:13a::12)
 by IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 20:12:33 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::e8) by BN9PR03CA0757.outlook.office365.com
 (2603:10b6:408:13a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 14:12:31 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 14:12:31 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 5/6]  boot.cmd.xen: Add load address to echo messages
Date: Fri, 29 Nov 2024 13:12:28 -0700
Message-ID: <20241129201229.3161385-6-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
References: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 296d30eb-a90d-45bc-bc64-08dd10b2281f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W+p5KxjqvOHhFiw0latmCkFvr+WbQKtNsmwvNpGVgsvBTsruFpHzhdOcTYlg?=
 =?us-ascii?Q?virbFN9JNCNjW85xizu3IHqFdWDsYxgqbctINgajnNe1kt3LIKMH6B7vbdGI?=
 =?us-ascii?Q?sHJfXVZsYmah9+RirUOlvKUHerVqBbjMwBaIMc8ieC9muZRukmXMP2MYFJfR?=
 =?us-ascii?Q?VED3aDWbYcJsFprvYyPXDUyTQEQyyjZuxNpMp0HmMl7z8QsAyVv/+OUnznH3?=
 =?us-ascii?Q?LldnmIyCsPFu8o+wAwjflnNoAgDjxm5i2mnlVsHCUd1eXnmOJZZtCLJQaZUc?=
 =?us-ascii?Q?arAodRuf0YEcZ/UQVwL0zV+hRqMtINNS1NWdFV+i37Pv9EshDlIJak/aNkXc?=
 =?us-ascii?Q?YHtDBNDDAApv8wGrIrAOsEXbB9ZkKqABz/yhcTJRFef6NGpIssDMdJ+vM8Jo?=
 =?us-ascii?Q?QQbAqIXoLSYdVlS83I/bmeEkCPWN1SLN5/O+Xusbva/XqhNa7FbQdAZ+Sy7v?=
 =?us-ascii?Q?hafPRVMyrnt5l4CSl6qGKyce4Q88fMUHgnuC+QzvcPne7ri77ub9SadkX/8l?=
 =?us-ascii?Q?+68VToSasI1BMy+ZygE3F049onqoxZb37SlxXRwEnt8o/p+AVlT0HiStsvXd?=
 =?us-ascii?Q?lIMati/zhOZJlj4HxkcPXDT2HIvHGMG520YuHXcW5HbsE0nryRseuOFmaI8y?=
 =?us-ascii?Q?UtjGWDXTBiKIO9IciVVcIlXPh9Ml++uyK1u/+UlfXMXkpPTq58wdzrvzfIwl?=
 =?us-ascii?Q?zIYNCof4Ho+p57tG+WQ0k+ul+Vp8Qi3Wp1hCJtXOHYu6Fl07yeCsj9hkD5H+?=
 =?us-ascii?Q?ZeAcSC8hKoEZjj+/LL/0e6feHJwJzxi9BSPhZDc2IGasP+zy8RGO3n2bt6iJ?=
 =?us-ascii?Q?kUofuoT3dvmw3+aTOeB4UoaqOn2lsxueSAiw18LoENf98oB6cbkaFxGzolxa?=
 =?us-ascii?Q?HagIQIxHztdlPL9yNlqWnkuj7w4Lg2es5UYFHjybJZE/0UK7C+LGVVfPoUlv?=
 =?us-ascii?Q?Ex47QUlgxVYkel9YBLVyxfH2X9qJj/vvKl8qtLlQTPdGlb9XASRuQXaTIxIJ?=
 =?us-ascii?Q?hW7mJGkOmwUT4B27OfHAkHK3YsbsOLL+AlvMCWnW3wHPGFtUaCEnMvqv+hpp?=
 =?us-ascii?Q?zinYmZ8yDP0hbdF0QZBNHbvSQL/UqifkTEY9fZE5a88iPxRlCgZWrnTZGUBY?=
 =?us-ascii?Q?AM1gZkcf9o836BQFRiCOqFtNlDOHSrvcoKIDEuwmAqPcEpcE2xZzqTZODCfm?=
 =?us-ascii?Q?Va1sOo6gw2TxkG4GAuOiF51gMhPv0P3QRrzuVY55ejbliWUIl/pGd5yOwMxt?=
 =?us-ascii?Q?VD5CnK8mgUq2JwOX+6KgybQcZ8K4Kh+AT0sMfVOQFeVMtO+ak+E03NsMFjXv?=
 =?us-ascii?Q?HZIjiz5451ZHSHihG+7TVF5S5fFbzeNpz6r/NJ8VtFEjMtz//Jan3njlNiH5?=
 =?us-ascii?Q?OXVMp+3+IJIrtA2mO3htkl484waVGLBIE/dTg7klImAVa1KQKkkQITP1sUOd?=
 =?us-ascii?Q?DVykmyJRTM2H7G0Ls3335GM0Rm9EaQDR?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:31.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 296d30eb-a90d-45bc-bc64-08dd10b2281f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9021

Add load address to echo messages to boot.cmd.xen u-boot boot script.
This provides more detailed print messages during boot so user can do
self debug if images overlaps resulting in boot failures.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.=
cmd.xen b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd=
.xen
index 25e5842c..929f66f1 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
@@ -29,23 +29,23 @@ do
 		fi
 		echo "Checking for /${xen_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${xen_name}; then
-			echo "Loading ${xen_name}";
+			echo "Loading ${xen_name} at @@XEN_LOAD_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@XEN_LOAD_ADDRESS@@ ${=
xen_name};
 		fi
 		echo "Checking for /${kernel_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${kernel_name}; then
-			echo "Loading ${kernel_name}";
+			echo "Loading ${kernel_name} at @@KERNEL_LOAD_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@KERNEL_LOAD_ADDRESS@@=
 ${kernel_name};
 			setenv kernel_size 0x$filesize;
 		fi
 		echo "Checking for /system.dtb"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /system.dtb; then
-			echo "Loading system.dtb";
+			echo "Loading system.dtb at @@DEVICETREE_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@DEVICETREE_ADDRESS@@ =
system.dtb;
 		fi
 		echo "Checking for /${rootfs_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${rootfs_name} && te=
st "${skip_ramdisk}" !=3D "yes"; then
-			echo "Loading ${rootfs_name}";
+			echo "Loading ${rootfs_name} at @@RAMDISK_IMAGE_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@RAMDISK_IMAGE_ADDRESS=
@@ ${rootfs_name};
 			setenv ramdisk_size 0x$filesize;
 		fi
--=20
2.34.1



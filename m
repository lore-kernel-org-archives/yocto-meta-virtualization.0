Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CD3D735E1
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.42])
 by mx.groups.io with SMTP id smtpd.web11.125148.1732919386322293230
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=Tsv8SFqh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.42, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfJlMl1tVxGl7CQ7ggNACSzMjrlgGeN0d3MMpvyp9S7fqGW2cgNVNyag0TLCS7udPPeSL9i7bOMEfDGSomed8sgBWy44OMPbM3tqLJmDC91F+4zSzY67zqrWdiYg98mFjAPwpV6olpVU03By5J/5OhRm87MQkbyj0Wc0H2N/qc6wbVJnZAKjD10cldiIzWDDVPCPqoEnSDzzpXnPjFvQqu/cbTvtU75Uz1PfzP8Q7jiFOSva32xQcQRQxkJCaGPHxRnF3qW0h3HueJKzecx6o7XsirCH4IbbtTk7ByqQWlFWQhfCwyGxHJ05BXrrAV3QlTR1znhz9ATTjowOnpeifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=ILDSYxxfWI55JE7YI2v8G/nffZwX+GWgH14Q/c/RHPgRUJM67Dhy7ezXTYiKGpRZ61J5H5tby+dQqPM1UcTc+j45WYIHPeIGvCgZDsiDtV0/BqRrHhRwoF/qh5dYhAnBsPQ59vssfXZ0YBiw5p0xADxuvBosFhKkmFcqumR/Y4KPFCtnmk+3KII6OcGaK9x8Z+npOVCp6S73bMxrX8WrX8KN9UzzIZE/iIJV4sJ1D07n1/MjAIThFe51Cu23xSg4Ua7bDKfjPFV0MmD1ABY46QoGhYj6zM8sxEUVoxqlctAt8U0z06heeyomQAp0JipICY16QNf8poM/1dhUv5jMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=Tsv8SFqhwXp8+qjmvD8YV2W8+H8i9uPPho6YaklX9pmrTMpVRlCAXH5UWCBCJCZJEA4yLwbJXE567qZPfFoShdmL0X2q/lkNmxJ/GJYr3VCxZRsw9C7HX9/NUHORpJX9GWGs9Ju3fe2rXlj6RcTIvmzocBUmfyDR9pGQugGfM20=
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 22:29:41 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::ca) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Fri,
 29 Nov 2024 22:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 22:29:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:39 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:39 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 5/6]  boot.cmd.xen: Add load address to echo messages
Date: Fri, 29 Nov 2024 15:29:30 -0700
Message-ID: <20241129222931.1300310-6-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3547ef50-8215-49cb-615f-08dd10c550b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+GqcRkfJwdjTRhNrYmMerVnXLKKiBC6r9UMAoCL3GMXYCvCcpazSdTAWsE+y?=
 =?us-ascii?Q?o2J0ddUtoCAZxqx4RBMcftH9g/3bBK9qY6xRLQq1FdMb06MHLYa2Bp5grdaa?=
 =?us-ascii?Q?cimqRJQGUJ/WmnXeR5il3cw5GTjxEDKpNnah/Vx8flTKGcXPp6LyEPDxoEaQ?=
 =?us-ascii?Q?kOKF2kK7B5b6rQVqnSw/lLyHpkBYi/m6Ontu05PDrJN1gHV3kr7rI8v0Dnkk?=
 =?us-ascii?Q?mWukcn1jXg19fnX9sMN9Bc0PMmn+eE6E12FZ95DL6eBD/UnWy8kaLLtbLxUE?=
 =?us-ascii?Q?PzNjqnw5Gmuj0Qm4kIgxN2Fcm90Qdu73JxYdjq/9QI2mbnxmY/4AuytOLClF?=
 =?us-ascii?Q?UIKqlwhAobImjKGNN4G3Juxq2x50As5T49gqLGGfLaK2yGl6jfL7vJ23ht/J?=
 =?us-ascii?Q?1Ll7mFuMLsF/kbr/mgjbMOLoARfyFWSew9QkwSma37mEbTc3hHh6XwJYEHB1?=
 =?us-ascii?Q?vqkcGQsDGKIgm2SWcjYJDHIBpH22fM4H9BDCbDUN9dWMySrH38twM03+uDXF?=
 =?us-ascii?Q?zRLsWszTtdIgiuNKGXJxhJPu6rxsxPhO/9mXsYCqpxfrwk03WpDj30HswExl?=
 =?us-ascii?Q?EDiROXmGDvvGwDGWO44WhXSCUOflnZ1K7aNRHNSjVR881kdtPhU/iT7o9BAg?=
 =?us-ascii?Q?2aB4M+18d12MU/KKPrKfEYZuP0i4hYX3Jj+iSTb77PoC87J1kgpnlYVHYWVd?=
 =?us-ascii?Q?tsZYeT+FU+7npr7hkZtpEN9yVCzjptkr5iTCUESjLgG0aGwwJVQ5qSVE229R?=
 =?us-ascii?Q?YfnWmigCkddp/e7KaEsLHzueBWPbsarvP05klpK7qZ3Q8kh1PIt7lUvYlPQZ?=
 =?us-ascii?Q?qeBXBhDAqm6y5D23Rc8Jx5tFyrDTaN/vu+7esXWjNqdxUVHme6k7jBNGEkhU?=
 =?us-ascii?Q?6GjgBBXoZqDpfQq2L5gN4d4mtb7G5ucJoPC6PH9zNwCxW8T64nzv30NVR8W+?=
 =?us-ascii?Q?wYz+gTdk6DIUFaorxIrjdyl61YaJxHadm9vGC0WiNCOzz9rvXkLgEq0hAhsv?=
 =?us-ascii?Q?90wwaUZMhSAUOfBkRgqXbWQYwesEPVotcF1zb/ClMSvteGeJbly92P6Di8Aj?=
 =?us-ascii?Q?6oLgp/+ZWOTzBwoEyhldr/430AXLsu1QQDYNXAayaNaPEsx4gq4cw9k362Mq?=
 =?us-ascii?Q?wpUzLXH7QJotGnjmmr3Xi4Jjc2aFEBpPTOCnSSoypEALFeZpNg4g6xlPlsW0?=
 =?us-ascii?Q?vbZaQ6lM9iFoblXZInfBvBfAX72YlrQB3WmYzdA4UUucY/FDFifgY5lHWa6Y?=
 =?us-ascii?Q?rJSL6A6Xg+PXbM7AWuI8Qa4JrgKzAKxH5if92Qs9GjrK+9TuOb2CA7iH6qb+?=
 =?us-ascii?Q?qr72/cepmC4x76NkLIOjKQDp4/FSqjsjP1NUdY10ZdR5n+C8QAR8Iu8x0Vl3?=
 =?us-ascii?Q?Kvq5wG5z68orYxOYI/j6O+6Y4lOD1KRqVe+i/3k4knYVcxnrcpePOwqg9F2e?=
 =?us-ascii?Q?5F9KryPllhC26elVWwzSICz5m6rD/Di5?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:40.3425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3547ef50-8215-49cb-615f-08dd10c550b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9031

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



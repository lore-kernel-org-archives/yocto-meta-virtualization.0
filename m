Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E770EE6403D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:41 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.72])
 by mx.groups.io with SMTP id smtpd.web10.11641.1732229380282261557
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=wHXg1Zas;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.100.72, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJwk+sX5PCNiJAmxbR2knpJj0vHhLA3KYJUFqh35bjQOwLyJNs7RCbWBqz/ku9z/wMFuxMo9kdbcUN4iuzNuXP2WWIE5kv6efVLvOzUGsMR0tUbEATndVl1UXTi05jz7pP95oSXJBtfAL1hLa5Y3e1AFMhHjaS/DFMPaWu6yVlaLGTJN0ctFwYcLp/h8BZrH4Qbfxny2zulsY9GH/JhY6Z4TJgJXW9z+I1qy8f968cTQ8UyYRqzTo5KnOTD44qnJH8z5ugqBsZTgy6QcQGuhlunzg7satdqltfq9e4ZnwVsllrZpDW4uf73o1POrHN9V0nTCRt8GE9/bSppjiIsgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=eqNJxxXso6MUaiZqQmVDeXgWERdqHfPIJ43CvMmIrVKejHXPMXQpGxmqi3VG5d5ugu/2E7aiz2+kWnZyFEEbYvLVZW7q4rKkX4fJWnkyWRnJCDvJXCmO5WaITFEA5T1WItDKCMtMwj6E5T8e/Nii9kbDhqdrSKu6xD8pjEfopWt7UYYA4D7tsS+zrEWQ+K1aAgvQDOuMhrEmVUF1n38KhtEOrN8mBUMVlK+bM4Oexgykk4lpphrl3LpkLcy0NinC09eEweV07J/2mQzV3+TeGrdmp2GahN/qfGhhL1VLl/Ir/PaF5e4fuMtpu/aienKLqOHC6NYTEj5nv44X9qyGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=wHXg1ZasR4orcD6ogZLNQQvuHd5tllNOpHSFHuFzvCTeu/AhUfK4BPgqtd2p8WD82MevbZYYK8mVPGaaZop1invZc2046v6dSScJPoM7+GP/GmlYAsDAliYOO712VUbShYt44Jj9801nERpaJ7cSXpGOViJ/smZxpIT28RoQKM0=
Received: from BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34)
 by MW4PR12MB7468.namprd12.prod.outlook.com (2603:10b6:303:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 22:49:33 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::19) by BY3PR03CA0029.outlook.office365.com
 (2603:10b6:a03:39a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:30 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:30 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v2 3/6]  xen-boot-env: Move xen variables to inc file
Date: Thu, 21 Nov 2024 15:49:26 -0700
Message-ID: <20241121224929.776765-4-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MW4PR12MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e10759-203f-4090-15fe-08dd0a7ec414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XtWXAx/oQLuxavzUXOe+1Y76aJuX3acIwkyn9FyVwEx7AoCwasqmg6eGEidR?=
 =?us-ascii?Q?RJTJE5B14D60xaOBMnTyGaQ5TWY2qAmRy0cBN7R9LCSuy7/KfTAf7FoFgkn7?=
 =?us-ascii?Q?/yPM780sHDTdwFwFoW7JHLct+AEWcpv5zA8sStam07fVwJPochBCuWJnc2uQ?=
 =?us-ascii?Q?15zDOF8+1ZQk/oWSRLtaIYemdvdSU5jbx2f6BVt2mEhc4KTPHFFbj/Ai5wg2?=
 =?us-ascii?Q?+h1AKfy14JLcyjuVudu4oSgU1bmfligU0QuFY6OB2Y91qpiEpxPJDL6phF0T?=
 =?us-ascii?Q?tBilr5ann2nitEqMaZwjYl0yNWRvTxbpa9Y2gX2NSASAUIm8Mr9FIBcmI/t6?=
 =?us-ascii?Q?ZTD2ooaKMLdvRWiBZAuctsc1hgiASErNNA9DlGknqhcy4J8RgC39adgZaYHD?=
 =?us-ascii?Q?QtM6t4DIh3hJqqvzW3mDMeUlF1tobMa24/8kbPAGF+Qmm9x833NnLOqeNl9Q?=
 =?us-ascii?Q?KxqnF9ITL/R8txXMMvzwcLEWTmt28Hg/6edVrE34ipvbL0bpeIBU/LnOrwrn?=
 =?us-ascii?Q?UkVemwRsIZZsWd51sM1JUDdXpNtU293IwPQr9mKeuEB/ZbmvsPhAaPkGWrW6?=
 =?us-ascii?Q?91oxddSfQv0j++FT8pj6uFOWCXPdRGo5wnkbBTcOJ2qAEpyq9BkQ15NeRYDB?=
 =?us-ascii?Q?O9WlHq3hsgtILem2umbwXBaeVsRY+O1BsqeS+sjImQVsoVZYY87+8TslIsIT?=
 =?us-ascii?Q?w1hDr7+sWGBSOmv1+EIDmjiIxA2a/7pPk7NNH2tgMVmebrLNcpAQUmhsfKRm?=
 =?us-ascii?Q?7jqHYmk6THlW/+gpywsSvY3S1TfMoVt7aPWqDWQLRmExJ4O/HGAey6sYIK4B?=
 =?us-ascii?Q?IENHbsnMt+ir0NDDLyL+bgtcDyNS/qyE9bIH3AIdQ/uFWrzJ4WeSWHkqfQOJ?=
 =?us-ascii?Q?mB4nLQ/+5/XCt6tuplDnlTV/F1IPk3bDEJH3VGHFMKk6KyP3Wz8pfBWgJSj7?=
 =?us-ascii?Q?p77j/5iTHxjXpmvyNBtP7pPL6wkXImqrOlGpWLEmcIeuxUxI0BwP0zCsVI72?=
 =?us-ascii?Q?u/rr3yPL4ucPf8Ond1a2MbW1Tb+HnmjC6jv+YV3vuDFgv+p9aJ+v5MaNKkrG?=
 =?us-ascii?Q?pzjGfzZcvPmbmcL1yRItAH9+8G8/DCiPXGHar3ZwZYBo5JzIYDUKD7VhQpUn?=
 =?us-ascii?Q?1R5oaz7WTJbdPg8aqJ8a+/0BlFV/wSiPDPNVrsxCVGxKIFMyEGWwuCgOuICW?=
 =?us-ascii?Q?i49LthgBOB+ja0C3Q0kPm8qKnSKIbtXXFcpOPuPtpuJu2hD4X6VD8sarUXcH?=
 =?us-ascii?Q?KOBYXBqB3cq0hXAxaT9fA5UC6Nrz/cmY6PSqa2tx0m/DAJ9cZsAISizkZUrx?=
 =?us-ascii?Q?p09IebxRkumugkttqP2F37g9D0+VoOojCSnhHoNF99DE62n5y+HgpE+lGk8D?=
 =?us-ascii?Q?Q1b4OMOl8nKOMOZOBv3G7fha2FHKokwbPwv+XrhiWjeCKbnbMQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:32.6723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e10759-203f-4090-15fe-08dd0a7ec414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7468
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9006

Move xen u-boot boot script variables to new xen-boot-env.inc file.
This allows users to include this inclusion file for their custom
boot scripts.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../recipes-bsp/u-boot/xen-boot-env.inc       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.i=
nc

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



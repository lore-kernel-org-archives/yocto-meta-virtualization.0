Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135DAE65D02
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.63])
 by mx.groups.io with SMTP id smtpd.web11.11850.1732229383869862212
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=lYRh0/af;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.63, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPp0POFzcmFlRwX1PSa9Z5je0Z9WSaTUBT5SqYjzskVcUZfhIdrGkXG+lfVuqzQBatHkK4QPKbaBr154ODvOCkzMRs4n7cewxz1MiofBudqvSm2UiIlfr4iYqrKDH5QkE+MIIqYq//FiSO1pLv6J67sb1pixtoBLNyTQj6KfLpCxEiGTQll+DL+ucVE/cfdYR+ra/p0WOJeYfDpZjP8W260buVNhILCSZVTAOz7wdNpzFVHn0C66uB9ON5d5bHV1WX22V7m1izgmGNseEF2K3uCQmk4+9Al2VZVQAHDi7Wmp3MOLP4dFC/MhmIbptQMmvD+t3iR2ADER6R2mdiY9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgzWI+RRXSY/cnI0xyZV2fbN9Z78ZgZ6KwvNl21MDO4=;
 b=XZNhqy9fkxgunAkVyzIR/mpCZHbiiZz49YG+QmlXF77V/aFi1JRW6etDHY6Z6yjUpvipsm3yQNgZkcW5Y8An3h5ODWr+OB9OQp7PC4FR1glsK5+NxP8EYoXdVKkcxRXCo45wdVfjvCPFJPYmqVEQ03f2b+IAhLVzOWeNyzn2rUwKHgabHA3rs24jPf2mHBS1GoT6s8WzbHrSgmVpCm+WhBIo6z+92WMDeSPYZpNHo7iJwoDn+4rpjZhX+pRUO1yEOglarMmuj4eZThfOKgtqs26CTnrYUMk65YKcfTq7oEX/SL4+vTiW3SJidgPCrHd1xoHLf/THMk2cr2PzH9C97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgzWI+RRXSY/cnI0xyZV2fbN9Z78ZgZ6KwvNl21MDO4=;
 b=lYRh0/af8jioZSzQf7b7wC4k5tjE/o9zvMYDvsmCxiyrQsPsje/DypvxZa1+GVSDNUMJOvEOKBaZuBjXvRCjqBFADoCUkwqJGLLy63SbVx98s/yaqM5eGal3vdwdc799LobvoxNfST+VU3SXnkqdjCLaGh2AqE8spYsNyNN/p34=
Received: from SA9PR13CA0105.namprd13.prod.outlook.com (2603:10b6:806:24::20)
 by MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 22:49:34 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::b8) by SA9PR13CA0105.outlook.office365.com
 (2603:10b6:806:24::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:31 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:31 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH v2 6/6]  xen-boot-env.inc: Inherit xen-u-boot-scr-configuration bbclass
Date: Thu, 21 Nov 2024 15:49:29 -0700
Message-ID: <20241121224929.776765-7-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a3ecbe-c29f-4fbf-7602-08dd0a7ec4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0PFsm5oP9z22iPHykBue126CFRCOeOiny6Yu5wT4UwnIwL2/o/Cy+rI9+A8x?=
 =?us-ascii?Q?7PyvrJF9igkQxs1akeo6TsL/8zIjlqliefPMqUPJEiG7ziMvOE/9uWgMKw9t?=
 =?us-ascii?Q?iXkhjTocDRPf/XbWpziAH6a4llE4A4s7EVmLfJjj0S8ATOuGscGHyIbZ0VJY?=
 =?us-ascii?Q?sPk1n6fxMknT8FAscPzCcc4vHagOsRXs4aTQuriWdU8V093ULjwCZMo6kwWX?=
 =?us-ascii?Q?d5QG1/U7FP1bLyV6uvkbuBYKr9BIHFWdpp289pbwE1d3dcY5I0wOnKwkJn+s?=
 =?us-ascii?Q?MSBIr5oKfzr5P/qKhXeztczxlgBfC2F/vkJ5XeRXRDT9fZXE33va5B/mYZLL?=
 =?us-ascii?Q?adWX8u29UTne58YQG6PQSC9YCxMIfwcQ0KF7FfNQh9VKhdOawuA/QvJTG8pT?=
 =?us-ascii?Q?vFjK+qM6suNYMf3TVLrVRkUImHnTG30HNDIJ1OIFrgZrkupHJia4M/AuHAvR?=
 =?us-ascii?Q?enm+V0g8lyYRJLpwyqVf46BfWhHw+qyPyzNbl7xwd10OG2FTkXMCRZQwWUnj?=
 =?us-ascii?Q?NlOURkCT4vcdwHJcgOr2q3OsyEatrwCpFcf+hKFVAsKymB0eHgVPC1Yk2IMS?=
 =?us-ascii?Q?zU1rark0rQq4fwfguwNd0mSy7+GRqhMQLXkK41nHNBU6ZcE2GWaqvwzyKcMi?=
 =?us-ascii?Q?NyaQxckp4/bsoaOfDWi4kkEMC40UKq8Q5UuWoJHZuv/XjgDitevIE1CVT8JC?=
 =?us-ascii?Q?+eUYrlwLX4sN8UqNH99hTPvg9BTkb2bsu5fFjspnbgPlCNx7TxsZH67p86RB?=
 =?us-ascii?Q?JYQT2f24524F6L/Hwg6YdoGHlC7n39dQLd18lwIw9LqhdYjC1vG4owifJt+N?=
 =?us-ascii?Q?ShE6meOarqt7J3MxUXf/ejMIM4DFAasu+dffr692/Qf8+X4j5WMHR/ugNAX0?=
 =?us-ascii?Q?i7/YfXGi2q7Wfw5T1tlbOBffl/40ZeB3eFzMoGCuaqy/dRMrV8Wq3RjRMFcN?=
 =?us-ascii?Q?7Jx0g7OxO4zMusW668XXt3w9Mq8fmk7yIspRF0GRbY1/bNJe+iaK9rhbf2Gp?=
 =?us-ascii?Q?CXEjTmj34qrDHESNUqlakfCcf/gXjrBSsAarszknsK+EWZk9+sF5+sy186YF?=
 =?us-ascii?Q?Whue6JAQduKHsf8f3NQpk5WXVRkRRCt3LYeZPmaNMfjjQBYEp6eJsGcB6939?=
 =?us-ascii?Q?vfPKzw2Clx7fCHrM5zsAt5AekSh5CjCOhuYAZDq5a0I0nsIz0cwWFinZKu93?=
 =?us-ascii?Q?vajFNgbraXkgyu2e+77ZoodCPPkEmuD7qJuhMX5NMfRelTaFf5jZuerfGkpJ?=
 =?us-ascii?Q?wks5slMskFLSR24gfrrm5q1zKDFF0Fo4nE0W01bcBTgsaAMGcdqnl7ioJY+/?=
 =?us-ascii?Q?fca1rtqtBP2Si4mP6eQJyevRSkuL6S8NfChXkFJ0+n2WFQnpyaAJO38M9PP4?=
 =?us-ascii?Q?gkVUUVidN2/dZJANimIAV24uJN+OpoH5s3qS0R2CLE0EmQtHOQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:34.0142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a3ecbe-c29f-4fbf-7602-08dd0a7ec4de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9008

Inherit xen-u-boot-scr-configuration bbclass to use xen common u-boot
env variables.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
index 9b9962a4..43da5690 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
@@ -1,5 +1,7 @@
 # Adjust the variables for xen boot
=20
+inherit xen-u-boot-scr-configuration
+
 # Image offsets for Xen boot.
 KERNEL_OFFSET ?=3D "0xE00000"
 DEVICETREE_OFFSET ?=3D "0xC000000"
--=20
2.34.1



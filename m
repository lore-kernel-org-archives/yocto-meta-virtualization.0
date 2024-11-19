Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A7D44001
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:14:57 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.67])
 by mx.groups.io with SMTP id smtpd.web11.14164.1731993291391623123
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=1BAxZ5Iy;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.67, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR2FIq/DEeDhh2yNSUidL6bELIkzrnzLqk1t/mZnS3IzJgc6HZ9XEVqPgfF5GIfgIs2Zlf+4efpCp6P2X1TdVa1k20qieo5Ik8mxgidX+58ROq2gHImbLf98w8pO1tTrZJWasiA4RdzB2IHSxqQn4RytPzWpjnjbxJ2kR8JtqAQRmivfX6uUmvPx9rJB2gRwcvrwMMB6ZHaMx0ajLlIViqzPNXEfYJMcRqkW0iv1BYjO8dqHoKlhAMgqnFkBPrZAd8dgYkrwPHDQ6179jm5pz5EZ5IxRXRndTQCIIWsm1Wg/0C75cwahan+X/irZA+TVhyRzGm0fAj6vn9L24r1wLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDMObGwnwCS93uRiSc5pGGq+9ABgZ9M2O5Z5ovKjoWA=;
 b=EzpYvb99hxgAxK28BaMHwmLR/FAO8IAQf9eNMZCrhDr8rjBEBOStFyaaJ69Pp4fPurzwNAg3/FcCtOx6qV2coGM+RPqHtC6AZKVSzEu4U4+m7xeq17q4WR5Fyq4xT1qf9Yb4UEqHlqY9qXAqZs+vizi0SJSJbMfX/l3mSYHQW1xRIYP+mfXz4nRtHtW5FmBxSliPJW34X5IAaHdsbbATIghuv0Do6cYJAjYOEpGtT3QLmuPVciohF5fNZyFX7HRnG1MdpwM5nM2VTZiMVgX+s5Hb2/T/FAOIuWCZz8f0oSSKYtGulBsBRWlPSOOso8VP9ITn/yrtUwHUBDDkRflKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDMObGwnwCS93uRiSc5pGGq+9ABgZ9M2O5Z5ovKjoWA=;
 b=1BAxZ5IyEE9DaNBq7ry8dWp4BFzZvi8dV9+f5rZX2+0zEceIkU/qwiymd3MPpD7zkui/HR4efEVXr5YAIhniUfUjJCoaChSTBjcud/pWe4XZKSeTn3TUdg8RD8cdSk0RemkAzI8cseAzKjKL5GRM1z1i2eVi3T6TdXFb/5VCJ5c=
Received: from BN9PR03CA0104.namprd03.prod.outlook.com (2603:10b6:408:fd::19)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 05:14:47 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::47) by BN9PR03CA0104.outlook.office365.com
 (2603:10b6:408:fd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 05:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:14:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:27 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:27 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 6/6]  xen-boot-env.inc: Inherit xen-u-boot-scr bbclass
Date: Mon, 18 Nov 2024 22:12:03 -0700
Message-ID: <20241119051203.3841577-7-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e9db76-10ff-45bd-b855-08dd08591646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6fxDcKD/LpQAwgiLPhbV/0wFuTRROpaJ6r1eux20k/7cYf1Wm1k3znVJ8nZ6?=
 =?us-ascii?Q?kHxR8A59u3eWpLktrUaGAbholrLoPKb3o3dMPv11jtaqUyfaIknPB8xguFC+?=
 =?us-ascii?Q?Qu3Kg5HFyniViO+PukAr62rMiwXylklr7DNA/kV1ooxadAcSGpWpqmyl1kGG?=
 =?us-ascii?Q?t7U1J/h7WIr+ewE6EUfr0z72zJz2dGKd2k9vG2oiCgwQfswVGJD2OtClwx63?=
 =?us-ascii?Q?loRswqgLXYzhcJvy7DA71MRGElARkDcYwgwZ60pW8XoBHtjJcdVqWrF5Hwkk?=
 =?us-ascii?Q?8kJLVFGxwSB8CP+saRbSskzFqQQQKpQCq2MYRPf8PQttaLas9wa0KSLwB2Xy?=
 =?us-ascii?Q?h/F0ErW/lT2xln6rqcBkLj/fP8SVh725kThKhrMRx60LpYi7bPbTnCfH4Gox?=
 =?us-ascii?Q?yvBARAk9hInQTEBEBfpdySVDCtDw6FQGgrJyjmFZsLREciOxB0D+NrDJLvp4?=
 =?us-ascii?Q?Gornz9zhYm3NqWAzWC5dOuYA4VHb7Eunfu+lpzoNyM9AqVdRMQvuW5wPJMgi?=
 =?us-ascii?Q?kGc/WFskznGzIAVXdROuC+oxdZLTXz2EPiTDR+scezRcg0gfEizDwxYJcI97?=
 =?us-ascii?Q?7cs/HD7z5HUw/vnAs+md9FGIMK4G6k7fflUXYda7Ant4DY/fCybAtj+9gJmf?=
 =?us-ascii?Q?U6CEsWlOVhBUoZZxCor7a4vGTqtvKHfPG5EQ8JFzKqWxRhEtnl39Izw/7rrs?=
 =?us-ascii?Q?9LUHjpWACOhBCIq5V6pWGC51djgpL/W6vOG8Wui4Us9r3EPzmBiZ5MbiqHVc?=
 =?us-ascii?Q?9OG/EgMHBSKvRaY5/vohraZhebET1XIuJGpsCu8FkKJO+EyB1lP+GemwTzTy?=
 =?us-ascii?Q?K60tnX24/z1vJ6QCxfwO+jByiiH2EcAJ5wecgycr+KQkRKMhWSyxHT0rYsV3?=
 =?us-ascii?Q?qFxUm463g1zBUvTPp2uZx5yv8GaoyKTd8XFA/C6HcmZlQCZNvVHYsZnOjeIr?=
 =?us-ascii?Q?N0Lr8xAlQFaufPxe3JT79waQ4xZO6SvoyBB3/LczszDf+MKIlc0cbj8u1jap?=
 =?us-ascii?Q?F1MyFqF15sPgu1cb+Uilha1YbffySWWFpWmM66FSwSCMbnxQCKXtVCxoPybm?=
 =?us-ascii?Q?OnGwLn0JroiKCfjtwFSmO8JTy14CDV2J1KD6Rpv3WRhUWv106whEpYsLkpgg?=
 =?us-ascii?Q?Z3taf8+oMXf09MwXuSZNZPrrUO4S8y4MlikrOr8JDd18oP6M7G46qeU+MlAs?=
 =?us-ascii?Q?07+HtYnKy9AwwYVI79pqZby6nM9gNLIktpLjobuZc9dxkB+Zo8wNK3No7o7V?=
 =?us-ascii?Q?C4XT/pevI7xqsaEloeYht2QB3xNQio9A4qmLPlqGYptPL5niJGY0CFbBFmSG?=
 =?us-ascii?Q?17HDDFlUDQZb3WLFrRhmrK0s8drKp4/OsIedGGBjSzkR/8aYZ6Y8WTlNIm0/?=
 =?us-ascii?Q?iQ1holxtZN9B2UQOCAkZwvJ5zujWoK3RM1ToX+BpgdWALYancw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:14:47.4229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e9db76-10ff-45bd-b855-08dd08591646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:14:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8983

Inherit xen-u-boot-scr bbclass to use xen common u-boot env variables.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
index 9b9962a4..da615f0b 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
@@ -1,5 +1,7 @@
 # Adjust the variables for xen boot
=20
+inherit xen-u-boot-scr
+
 # Image offsets for Xen boot.
 KERNEL_OFFSET ?=3D "0xE00000"
 DEVICETREE_OFFSET ?=3D "0xC000000"
--=20
2.34.1



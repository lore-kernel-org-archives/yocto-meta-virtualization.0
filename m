Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2648CC48BF6
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 01:32:44 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.64])
 by mx.groups.io with SMTP id smtpd.web11.3555.1708565559533406243
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 17:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=3vdQRznb;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.64, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGkC6mmilzwNeDUAgJ5TKfk8MDYCh0hU2tfv6Y9lszYW24V5kBTUpQvrZFFAZuppwh34+AZEPECUWMafMLvPky8AJWbfWBvjPYrlOiyEUVAwQaFQ9kF5QjjB3r15u2x9LyakQZSkvqmENHOMkqzicbqaW045zIgTFc0yV5d9jPLOGBTkDpnHo/C/qAyRmH6b6C+SRpoO87gSH8O3rlvsqePZB3vwVDc45i22wZFxDpXmO6bfcJikcEB7+EjTC5LQyNvZZx9AcBOzjvsuvyhn+EzzYw7raAAvIkOW16mQurDbF2NEHQXRbVEh++juXD0g7W8/QW8N8gLubNpi53HG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T5Gef2odWwsdQgHYLPT6HfSGV/PpiB1tGO2L74NVTo=;
 b=WwKcmajc5tt6lcOOxv3sO2mwIEzRSZjFMZhMlv1TZSnXv8UY5ElKIb8FNwl1MKlekOO0QwXJ+ysXlJ6g7crIbOR5xhrv6uesOK4z9+5pIQ18yho0s1V1ZYfZPc4JClzDvtXrkqC6yY8LkZhDIC/lPOT+cgVYtz68R288cUK5hAI7O4iz6W7LeVeN1N2ICNKdy2mbnqnpzsRgCW7MErgRospaVOJRh4fwe/OJPMkZ0SAmf6UJ8biyNuosxcINrDWKideI2umT4qdDTYtayOt85rMSgpD11+SeUET+O0houQp44BkCIOI6NtQmRCpKMOAux3b34UiS7cHyDwXc+B3U2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T5Gef2odWwsdQgHYLPT6HfSGV/PpiB1tGO2L74NVTo=;
 b=3vdQRznbAr96lbCoED+1A4ZeCfMZFCvGvPx5gWBSm7bkMbxIAQ7AJZgXkfZVl7wMajbcQCDMN+69YnUpZuxLPukrTAyltgapJfKisHvH4b02L0aehllE7bS7RhOsFVaL3eL6ATWvmif0o+xfUQ1PvzsU+lzMEBjgUqiUwZjjfDQ=
Received: from BYAPR01CA0012.prod.exchangelabs.com (2603:10b6:a02:80::25) by
 MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Thu, 22 Feb
 2024 01:32:37 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::29) by BYAPR01CA0012.outlook.office365.com
 (2603:10b6:a02:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42 via Frontend
 Transport; Thu, 22 Feb 2024 01:32:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 01:32:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 19:32:35 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 21 Feb 2024 19:32:35 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] xen-boot-cmd.inc: Fix initrd boot issue with 6.6 kernel
Date: Wed, 21 Feb 2024 18:32:30 -0700
Message-ID: <20240222013230.1183593-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 059c791a-1e5f-455e-a247-08dc3346264f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jniBAXzsqoKlwJR0nka+53A+pBb/xirwxpspT9UEdD6Dqx3YxUwU6SBTDSVIrAgdXwJgPMnw43j++sSN30VK6gbIY+SXZHoznkhCHTfSl+n4Wg76j//D7ZSAFhNttvrjZCLKY4g/3w4D7/HRqIXGPrA24BizlWlcdUv3Q83TTOVHIXyIft5D1+W3/6jiHWU7PMdA2UnAoWgYx9BRoqmufSAZ88lO1B6o+LzY+2hbs9V/BYz0DFllFnI0jI6HS2UdeGkOwqlf6KuNTtVoffTz6GEOrwSQIMlyUDvG+HwzrqVxveKsrr60p4hvg8TP8IBfPpCz+xNArS3nI+iqKxQ0nDqN17a8HNGA1ym8DsV98dCufWAkj5gjYrYLNWiuXGbVa3wJjmk50XRXAy+NWcBK+pjdWO4+d41k2ZgUlJQNrYs80p7+esLM4/69aoWjUcsO6KvDr5SkoKDfOgMAFjbPN3tvya7/VA2PlPL0SzgnfTebqBuqRY4lHMRpS/Y4SV+Cy5mCbg39wrglUXgG/lWyplezbMrU3wfZZrvNU9c3fycLULJATXrQVo3J8+q6Fk2NOe7UeMv7KUx1xSJs2ghF7HRBIePPrABQLSHVkn3FHfdbGUh0SjKPy3ck0Bq1Bw8tSNNTVYT2w3VeUBykYz6HfWVF9DGrBj3hDSgeaX7ruVA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 01:32:36.1998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059c791a-1e5f-455e-a247-08dc3346264f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 01:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8569

Due to increase in 6.6 kernel image size xen ramdisk offset was
overlapping with kernel image. This causes xen randisk image boot
failures. Hence increase the ramdisk offset to fix initrd boot
issue.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
index b2b76120..7a4e41a6 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
@@ -9,8 +9,8 @@ KERNEL_OFFSET:versal ?=3D "0xE00000"
 DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
 DEVICETREE_OFFSET:versal ?=3D "0xC000000"
=20
-RAMDISK_OFFSET:zynqmp ?=3D "0x2400000"
-RAMDISK_OFFSET:versal ?=3D "0x2400000"
+RAMDISK_OFFSET:zynqmp ?=3D "0x2600000"
+RAMDISK_OFFSET:versal ?=3D "0x2600000"
=20
 XEN_OFFSET:zynqmp ?=3D "0xBA00000"
 XEN_OFFSET:versal ?=3D "0xBA00000"
--=20
2.34.1



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA3FE77185
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.63])
 by mx.groups.io with SMTP id smtpd.web10.103532.1733756090451638350
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=a8S3s+R5;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.63, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf2TLYrl99Yf0N9YzREzIxJNbMXfaI7UIebWLCZAJfbnOLh3EoGPnKrIVIC9NK3q52wmSoJfb2be1gXBhDY+HLcDSuenL2aXhUju7AIorH5hi9AK8JkaiN2JH9tSpRRHUDdTIkUlEBB4Jj3nRdcqAh0/tUkTytYV3lvvZF48ZNAonXHAbV4inu9KyOPazi/f6jE2qiCD33NOkNCP0rETolaRXN2FdPg3DQdHVDeBK5aenWL8BYKSYW5RvgZ3alcrdiXF/kFThPIXls/hhF7XnG5J+Zhi7GsGZVIXEEHJKpN/gUgXNftZLpBJpb+iK5TcuXXN9t+PpSUDTKQJi19H1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgHKbYchzkKXmkeb1U4FCTdGY+H2QIeLvsnMSJkCAOg=;
 b=P1TxgQ3musm8DuuUKHTmIkEfzZo1ImK5HRWvOhyY3n2QLGShYHZN9/gaY08+TOZ3fjfDX1Ziywpha2OBGqO53WXVhy+ghohKDkl6Lm5NpyszMSYVXAbMaG6Ydi5LpJCm4g7djINGtQJBSNIV6l0EvNT1Ij4BGb4a3VK2RcG6zc93eeHm/cdx1ZTzuwheZeHht5FObLtr99l7HYYC2RvKpfpotx/C9Xq6ZgiYvGSpUCEwPCO3908k7fWyhMh1M4WhuSAWxXkHqzuVFBPU64wFZZ92STh+VF/Uk+I4z0ZGXFnRpwt9cfCajyIrXKxh7lyvxz6RHHbJIyQpVd3pOsNwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgHKbYchzkKXmkeb1U4FCTdGY+H2QIeLvsnMSJkCAOg=;
 b=a8S3s+R5g1xFCmu8RHJjhF2JLgR0ez5x+XQd5Z9KD4lnEk+PwixC51LF9gSFzju//GaDCu084ooPY31E7ALuhCVxTFYB736oJDSEy2mpn6fIxm2qGNKb95gAcc/bNsLwjsj3ALvJjCyobZLLaY4m9JUKwiQSJHEgHyJPTcVCc34=
Received: from DS7PR05CA0064.namprd05.prod.outlook.com (2603:10b6:8:57::26) by
 CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 14:54:46 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::63) by DS7PR05CA0064.outlook.office365.com
 (2603:10b6:8:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.12 via Frontend Transport; Mon,
 9 Dec 2024 14:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:45 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:45 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 5/5]  xen-boot-env.inc: Inherit xen-launch-config bbclass
Date: Mon, 9 Dec 2024 07:54:42 -0700
Message-ID: <20241209145442.3291634-6-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3521d2-d937-438b-5226-08dd18616c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5C8gVV/NHT501UwPcuM+d/HdnUhI9dgJ9FRdses+W6+yyPUfBA6daueXLDBW?=
 =?us-ascii?Q?8kjGQ/gwoV1qVfYHvGsuwtkJ0m5nB5BFFt8j/mc4xUXSZZS/ojhmtxYfZGNk?=
 =?us-ascii?Q?7qI0ELCshkLqcP9EG6Zj52wyIFnLoL+liuXWEAbGMCV7lL05QxWapilfgDBS?=
 =?us-ascii?Q?iNEFFIWzsGRHbM7pwyDMD+o4nnFXB59ftJkG/nnsin5w7qIOu/k6jsRgG8YU?=
 =?us-ascii?Q?vyfsKPD6eKURsUMJ0TKHOgbVyJX/zIOXdlkAxrwaisVf1CkwWsJl2z5+TYMs?=
 =?us-ascii?Q?/GJBWLJXPYBBYSa41aXOn0pg2YDRc6maFO/vS9SoOyKm3f1ZdG1ptTVZD5MQ?=
 =?us-ascii?Q?WUApraQ0CGk0JW/0TAPCpl3oL9hNGE6kdJGBnb+MHv2/KctMYyB2nn/UAbRl?=
 =?us-ascii?Q?EbwBLM7xnWFxRAw3qV4fzgyr7Tikc/8umgaopp1jajdBNsXAuePmShcefuAN?=
 =?us-ascii?Q?khIKGNtfR7ykLS4lt644EFL11XHv0lbr8mk0iJYU8e3Lx00nlHdefrg6BuvI?=
 =?us-ascii?Q?98yGjxW16Dcpwtp9wMqGKW04Xogd0Q0zl++Bcdpx0txZqmTziphB+Yh4+V/O?=
 =?us-ascii?Q?lPvJM2+wWRBgAlNxxNktzjBehGLbr0hBbcgwJ//TyYE292RL+jPlule6XxDk?=
 =?us-ascii?Q?01QTdGjU7nllaY+C+Ld/YuZJVdV2CIS8qIi8/TqcwBOaI1XaD/Ahck3NUhS8?=
 =?us-ascii?Q?eTRg4eloSa+pDpA43MUEkfWIlK9Jc0c5Xz+l0OgQDcNeM0sHcgjXSK5/dMwQ?=
 =?us-ascii?Q?I7IrzygWYdwyu16CE/+7QgPyQGSJvT6LKJkdWM8R6cjhCn8Dn4gvj65k3xVV?=
 =?us-ascii?Q?Hg1ugyndc4RDq2Ea0cOqwFeUb1ZkNgVV5hpboGpDruYQX6CMbHUqnAQaeaMX?=
 =?us-ascii?Q?Y61MbCyk+SIKSf0cZIy3Iw5kt10y2K035I7wAtEfznc0Fx3AhXwZSj3oTWlw?=
 =?us-ascii?Q?IgZnuuO716zxInnBZitq9qCNf+hhY3Av3NUMNEvgSdcmT4L4Z9y35ibIAYdh?=
 =?us-ascii?Q?anVB2QsC5ac3wezZbO6ta78Gq9jL8hBoLSlMDmyhcUNDbnvEGavii/d3DZw0?=
 =?us-ascii?Q?e8VQNGMhAGcNNsZk6hEqdGEP/G0kD/w6DM4UxWrE8hOUf8e3krMXcARc0LF8?=
 =?us-ascii?Q?1voVyN27GMqzrrLsuL4gxZoIQ2XUrzGXBetk+Ju4Fmdp14KC15igAajfOPLi?=
 =?us-ascii?Q?fRk3DcVnkJxY/exp1RtPAFuJPOSTvIW69tqbbWvbD1S5c7qmgB0GrIgUYHgL?=
 =?us-ascii?Q?K+YmugtztIIuT1OeUZDa3VOT5BWK6UFdTN8ThhBUVdmtk81ywB/5ayujaiFX?=
 =?us-ascii?Q?2RsdpLg6ioqL2jJ3tLeTkdByTXjn1FZ3fqoY/lE8+gHpr9IL2QETlqHW8r7h?=
 =?us-ascii?Q?qGjwC/bg0aH9dqjetFhy7tUamZ1H4XDITvQEWL8qhNntqWqDzP5/s0QNE5Tu?=
 =?us-ascii?Q?LWl9DXkSbUfOzPq2GweGplLY0YUnM7kr?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:46.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3521d2-d937-438b-5226-08dd18616c33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9046

Inherit xen-launch-config bbclass to use xen launch config variables
for u-boot boot script.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
index 9b9962a4..53f800eb 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
@@ -1,5 +1,7 @@
 # Adjust the variables for xen boot
=20
+inherit xen-launch-config
+
 # Image offsets for Xen boot.
 KERNEL_OFFSET ?=3D "0xE00000"
 DEVICETREE_OFFSET ?=3D "0xC000000"
--=20
2.34.1



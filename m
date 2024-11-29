Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA138D72A16
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:46 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.80])
 by mx.groups.io with SMTP id smtpd.web10.122158.1732911160145953338
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=fXh10cg5;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.80, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETbEZBTNC2i7O53koDRqe4G9LW5wsZsmpnaytYZS4lF4q9GRpcwmVtg/QYegx9niVO/r5/zgFoVayjxPTpy9UG6Skad/c5TjT6K+cbzw+sOMouV6VuyCo80IkOuQbIxUpUm5pYQx9K0yUrpZalaX9+5g8E55x5U4r7guhXipa9lRpgdFVaaVrye3qxNK9I8AJAXTeJbgFDdUaSuQQfUdv3t8o52ARcNerFRLg4gs/H/xZFr20uIUBoLvL53QQT+2kIoeBMcrpo4sUS9WojSgtoBbDeeqa5H9l2pLyrdWc5Hyx1n5C5jOvyOzVHqk/l1nE+Q8nXhYwwt74S16K4UDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/qexl3CBh0lr1U0mqmadRrsesthswvxLyNLzrdqAlU=;
 b=au1pOouBnBjsSUJx6EvKsFdn+rHHtR16O5Zy/k5JybqBuGTTsbFuxPR/o74E63p0FfsgWJBBtoshiU6VWu4K3Mr31X4suzGf3FbTBF5HvJ7GDEH1YcMoiau1UICo9nylK3Be56dQ1aSLcw+8oxpHr1fUUwTsk+Yzlcj40tSaD0M6gOfzd8JcrvRsQaeXRYqPsxbxoa+p5nSogWbxDXV+m4dvkFBNgeS3ZeT+TQg/+7zfO4Y9v7MJRbfRpcUj6v4C3z/0VV8QWQuw1pzt6Z18KLyRwgJW2e3QH2cHCnmfkSPd2NjApCvdn3jPbkMBulDrzSVDyZ+rwg8s9XxvjZrQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/qexl3CBh0lr1U0mqmadRrsesthswvxLyNLzrdqAlU=;
 b=fXh10cg5u7Bcwx/4jZr4pntqVw22IMIgq5vBqRd5MNhS+jCqVTpHd0hjMjCLiwqMvWT/JDyv6K9aEr0qisTUX/5+s4kQZHTLXZozdn6rCjcKHig6QIIFnV9SIkWBne9TIDio9A3BfDqPdtDdn7f4y3yPEPOjhjESY78+v5h97Po=
Received: from BN9PR03CA0751.namprd03.prod.outlook.com (2603:10b6:408:13a::6)
 by DM4PR12MB6352.namprd12.prod.outlook.com (2603:10b6:8:a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 20:12:36 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::f) by BN9PR03CA0751.outlook.office365.com
 (2603:10b6:408:13a::6) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:33 +0000
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
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 6/6]  xen-boot-env.inc: Inherit xen-launch-config bbclass
Date: Fri, 29 Nov 2024 13:12:29 -0700
Message-ID: <20241129201229.3161385-7-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DM4PR12MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f99341-0248-4dc6-c448-08dd10b2292a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KcuHo3LG2bWuWad7aCSfvHZe86rGQg1XxlTYmzqwsiREBXQj1u++RmtyN2vb?=
 =?us-ascii?Q?aFl5Zv+zm4qC8a9n5rJj87c3MNudk2+vZyoxhomC1gjfyFTTVqoLZzR+JkcI?=
 =?us-ascii?Q?+NsVFQWuENgegxpX47ivB3jmgnoRoquo/425g7yV04J8hclbMpgodc+xAFdO?=
 =?us-ascii?Q?7n7j8Fh9spxT7/TM7OfAesMvSbNeT+Ogh8PlSrfIxXO0DaZ8M0N8ixmjDwZK?=
 =?us-ascii?Q?WOB6D7a1gwH13qVdb9cO+7mcvC21fMUmwgscNOdQhe8vScqSD+81aXJTccVX?=
 =?us-ascii?Q?1HIiLP++kapoe5y0TaibOvKB90e/NwdcA+2uvgKQhxGlMRVUu6IfYz75rK0g?=
 =?us-ascii?Q?FiZyd6BRMVLMIW+FrgqtANh8/Uzf6p3pXXSNveAj6XuYfM1QFqXUIX2wpRvd?=
 =?us-ascii?Q?YYxb+uXH3rXJQt/pQI4UvHAssHDA00Z3MONo9WV96aII1rroINeL57hy4k2g?=
 =?us-ascii?Q?GrAStNIyeGhSkOCu7FMANYCjLOiW2Emx1UclgyGO5RbujWUpEjZlp3JwZb1U?=
 =?us-ascii?Q?cg5xPFGqkf3qAqLEosbeEAkKSu0N3uvmTpwQQlqT4KfUIABT4P28a1Lqmqp3?=
 =?us-ascii?Q?aZqxcM16KX4DwCxCVZjiMWDUNPNkY40E9lg4hz9CUC1oOYQRZYwa2+unEWaA?=
 =?us-ascii?Q?IlpczxNR9vA/7yz27ZiI8o/xdAUH3x6FVrBpI5Al33jyVuMI3cNqn84crmgU?=
 =?us-ascii?Q?gMlR2Z+a10iUDFWrmke8a2iaL9gesEnxwYMGLmm7wXMPiIZ+SypkIqfFmSU2?=
 =?us-ascii?Q?UU9PfYc8NceDEVeidLbfT0/3Veoqsue1JMfemDi2fejVUcWGZXtbPSozqwrr?=
 =?us-ascii?Q?V9qE1twnT4IXW08eRz9W0Q+oREVnf9LkhFluvNLmnc89i9feePuaUdlWQ7Rn?=
 =?us-ascii?Q?9ILEXEFX/9XVLcXhLQItIBnGpK/14U+cPTbajlj4drzcQTKTBHyO2HDZ+uyH?=
 =?us-ascii?Q?fQnOq84cNBXm6okzfrns4oVGkfsk1XhX8c1H+a11Tw0mn4dGhmRF7b4cVnKR?=
 =?us-ascii?Q?lP+Fy8ZfWNEH6Y8hzlPUS6ZvW7L7RlmH44u16FBhYEHrfh/88oIBp8cBzDhO?=
 =?us-ascii?Q?1+XJJaP80nOuPX54vFQLKnfoItYRqzDeaEadsUfWkV8v3dAihi5OXsMoTvHV?=
 =?us-ascii?Q?TB+9hSKYBuDVWcv+4E+9FL1E7DUetDvGEYl5qAdjNtZJCibYm30iZpFRv8kT?=
 =?us-ascii?Q?lo1wuCSZZXqSSQ5nQ9YtTnp46qZmFKCzW9U/Wm3e9h6HLiN5tQJ95Uunu3IQ?=
 =?us-ascii?Q?M8c+hH9cJM8Ly1a8kH3bIcTPVE5Z1mq7ZgxXOVpx8rlO6RkMz+l648xd+bZ5?=
 =?us-ascii?Q?qG9Oma/OL36hJy70PQeV/M1lYrPRIHDSejH3eKOKAFrjt/wDI+IIsNt4m9TL?=
 =?us-ascii?Q?WkdyrI47v8dBvp51DSzKz4olU+7r4Sp2SAzuJ8URHcHQADFNgBHW6YebyknP?=
 =?us-ascii?Q?hBSGjDFs1W42cRL8t+Aln8XEhdqjPVz0?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:33.6276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f99341-0248-4dc6-c448-08dd10b2292a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6352
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9025

Inherit xen-launch-config bbclass to use xen launch config variables
for u-boot boot script.

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



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589B7C27C41
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:43:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.48])
 by mx.groups.io with SMTP id smtpd.web10.171726.1692218584882365947
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 13:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=EJTYSYmd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.48, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfG6CYCU4q9B4BF+gau24xUD0WDi6uKrRk9ha5omb3FR+hGleKSqxnFLhI1wxyB75XVDeYvDzP/2yvPWWAvhzmPfjRKRSM99SlO3Xb734xoag/PUfxJ+tIHV6/8AFBhiLEPgl7LnEn2k1nxZzI2TnmV02jnKwT9qTnd2CAYtuAA2YP2NZ6MdOuiwNOFIcMbHWRaQ9vCele5RonqgDxfCbLxEtF6QZL15RCnVpGtDrA0+wcsvzBpVuKPXB0GZ2wnzOKIORXHzTd6z9695zd2ARC0ziCktBXRawjYG7HYmpA66Nuxunl9sGwiWVpTjPN/HyxYRNjc3bsnfuDPISFmjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxwF3ZzaCq0+Jfwwojqii/mmTCE3RaRw1AaEXbZ5ptw=;
 b=mrRpcfU7mDhDWYitEDdA0rYJtwC3aWK1QSY1zu8SHywoWQbqGQ7RqsG5PFPqSgpSFpH0F4jlfd/iepGXbBSWHOEv47kURVphtfY3v5WOAr2JgCuNuqyo+DLK672ZnQpdE8Xeo16hvRnMbaA2STrdOSbxYNkMf1P3GgG2q6y2p569r/QIpt+rYH0MPo1Frf7x2jHkyjudHSzCFqRnXZyIH7Y4YpG/cXc+ghleHEXZ+UP+jnkuswTE++sHmG9IiWcANkvRvZiM+RtwxwJkNhfBuwRBov+PjgS0D36jvO5qcVSM8SPcnb1Lp+AG+YD6v5jfwVfXwjAz4u6ya6BVtyWV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxwF3ZzaCq0+Jfwwojqii/mmTCE3RaRw1AaEXbZ5ptw=;
 b=EJTYSYmdDUajEC4/3nrkqCGuT/TsUsVYIV/EPuWqqVzAnw05GJDuHBB6gJmn7DPwut9fV6ymK4N+eVqyrfCRUYgn8Zfj/pSBR61DAa7i9OxTOLHDlwDeoDCje5uOSxmXOskRDyiUWkDji6cql5gZZ+3BWcyWaNhLRStrSYvMf8Y=
Received: from SJ0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:a03:39c::22)
 by MN2PR12MB4583.namprd12.prod.outlook.com (2603:10b6:208:26e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:43:02 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::11) by SJ0PR03CA0347.outlook.office365.com
 (2603:10b6:a03:39c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Wed, 16 Aug 2023 20:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 16 Aug 2023 20:43:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 15:43:01 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 15:43:01 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH] xen-boot-cmd: Remove hard assigment for ramdisk image
Date: Wed, 16 Aug 2023 14:42:55 -0600
Message-ID: <20230816204255.1120358-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MN2PR12MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f68b0b-3268-4ea6-d1f7-08db9e996249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x0RndYiBh3lnFylYeg8r/zyBC1bjddor/qbpVkNFumCaEikIdxjYwixLn1ygML9qGBXLcfgipThc2YKDoZiVXKr2ca55EGGgaWSMYte2zRBHySeEFawNceoWJ9S/Udggj7F3iVm4Rl3frCbD/Ff4eODiBWltjBKRUOpayBZgI6TJM3W50oxu2BGeVWLpaHaIeIE7tHxpryrwIrVgpqW8Hm7Aymmnbuxpx8Y+Q2bTp5P+zqKYVvgw93pB4DbIwryKjeLsDkrgEWlWWr8JlE82gLf7TWzzjZ1U0qRzXJ4whnUhA9H1+umyMbscXla90MEirkA82PAQnk8/jaxW1JPzUFHYq1VtVUPqC73SW3nfOxxC6nS2B7YC2124/zje3JpZfGzpNQzf0ApHc1lC+lDhSNWAS9c9OMgvTNIiRApR2u1VEKc5t5QSMv9Et97Qr4oJMCdIQv7S/dqX0kFz9U+1WZiwgJs62e+D17DaPL2TPlFLwTJoqKv7SNaz9a5SXv+/iimfMxDJrYwrAzzOmsUQGrPR5kYu/PpRa+DYUpaDAv2AxnLPdPk9FLQ1mADHIJVqY0z/9Ndis3NEVVojil8y+44bWb6HW0VjeSmpiart4/LIu584SqM35i2lcRB+Ijf0XPdyJ5QHBJDet2GKyGVNDvqWzJadyYt5/xy1v+fKQTDSfoITy17lUd5P3YSPpnkslVGkcSSk9yWW3XxFrOJ6ZQ2dKbA7HHlVGTIP8cmu3gJdXlaJjz8dqOqPrueMc0molt5rbAzzwutbs5J+zT4J0Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(83380400001)(4744005)(86362001)(40480700001)(478600001)(426003)(336012)(36756003)(2616005)(6666004)(1076003)(26005)(5660300002)(36860700001)(41300700001)(82740400003)(356005)(316002)(81166007)(70206006)(70586007)(110136005)(8676002)(8936002)(4326008)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:43:01.8622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f68b0b-3268-4ea6-d1f7-08db9e996249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4583
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 20:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8205

Setting hard assignment for RAMDISK_IMAGE will take precedence during
variable pre-expansion. Hence set RAMDISK_IMAGE variable with soft
assignment.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
index 38f6f267..b2b76120 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
@@ -18,7 +18,7 @@ XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN=
_OFFSET'))}"
=20
 # If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
 XEN_IMAGE_NAME ?=3D "xen"
-RAMDISK_IMAGE =3D "rootfs.cpio.gz"
+RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
=20
 # Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
 DOM0_MEM ?=3D "1500M"
--=20
2.34.1



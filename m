Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB248C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 01:00:37 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.77])
 by mx.groups.io with SMTP id smtpd.web10.13277.1702429235052255995
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 17:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=SDk69uTU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.77, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hr5cC1At1+7gkIB3z18xwxEUTI0zSTOGOtD74rvjHWRQJ/qBRhW3b1Apltg9YAmNZu9xHNutklowiXQxOjiUjdtXmklvejFkEQRznAL1szH9J+dFW1+CbkSsSGSLyKqZGc+sB1LEZX6vGv5Wx8PtLNrFssi63R3Wy00LooPfNdsE2GyKgmOBCEqPi5tqhkscBOPz/C1zlmoStAn6aRbYUaTsHdf+cxZHxOrLM2jSYYMcx7L/NT+t3486KJFH/E0KI7kBqWfre7pL6a7lDbAMseWSH6ig1DRh6h1MAhWaurFN2bh+/L3Qez7I41MSiBh4lntshficT8+ng1oAUN1LYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8L+YPWvMgZFIy1KZ68LVfWZQKesixnKeDaWXeOkwfM=;
 b=od7H+PIOOlMZry7s1p8f8omGX8tAUnhcK5ymhByzpHLJEdb8+aQFXDXLBkemYe7zfm3XsZUUHNoOpWbMKrZUKkRtafw1KF7eO34dVro1hwTA21TLhPoL4mCdf2P4CcizVcF8LS5mKpIkSKgh7gHwLj98h5Xc9fDZtByicp/osdW8VEssTNXfHeznL3nOaItRNttSak7hwFtIr6SnzdFtlRPRbUXTxwkDX+t85PpfIOkl4xC6OsqjotugJkOrar1MIn2nej4dKQ1v6nN5vAyDHrSLgvEPWAdEn+PQddQvH2MigS3U1+TgRD9sB1vWkHMThwR2KmRF0R8RzC3KK4swRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8L+YPWvMgZFIy1KZ68LVfWZQKesixnKeDaWXeOkwfM=;
 b=SDk69uTUC7pZy2dsU7eHzifqmtNZOfa+7h2Kx5LGgFnoDooXZ9dK7YRpA4//QaolPkay6wWo9ytfmISKUn/L0trI5vCBJvQQcV0hkwd2Bprto8cAImwCH+6lBQPOLAyVoECSNghlrCrwYYs+9tZmVdz4YGlDHKy6Tggn7Jgskuk=
Received: from PH8PR07CA0039.namprd07.prod.outlook.com (2603:10b6:510:2cf::7)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 01:00:31 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::13) by PH8PR07CA0039.outlook.office365.com
 (2603:10b6:510:2cf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 01:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 01:00:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 19:00:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 12 Dec
 2023 17:00:29 -0800
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 12 Dec 2023 19:00:29 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove device_type dt nodes
Date: Tue, 12 Dec 2023 18:00:29 -0700
Message-ID: <20231213010029.2111483-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 038ced10-2e60-42aa-fb0f-08dbfb76e758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g3cklMLLfjUtxY7b9XdoX6YvHz46JrDQ15IqEmnY6nhiEr2lwlmBmEbK12/CmeVhUGSi6Icz2tbiKCCHo1KUHcyDqFjS6/Jj1rzkheBhXO0wBLh2iCtBrIsimyG6TarIO8lT6ptZ8apAreVuN3sUxLp/A6AIt5g1DYx0WoJxqAyBWIRXKIxWaQDFS7Ca/Ci3jpObD32a78NY0K2Xgh5tWFWGDnx8oy6GBN5ggF41kB2DqyKlkuGczXCnxeTqhkl3RmUQq1GYqsDAdjQ/X6YCtTe7el/we4k6xfCspMP4jQ7Od+r3nExeBoHz13dOnF22Cucv6INopnJ22+FTFgDqAaoDSoaeXKhdKbq4XTjrI3fedpQqO9sld/TqdkQgHmJ1/qtgGy6PUTaP46dMKNDpBBRFH7NskPLjAI4F90419l9TvZlLKTZS2G6lHWxeB9uc6keUTeAVBKQSDPvqi1DsfFSRFdw+eVIjRh28nXkjsCmLxJbJInVecbPlbOhaV41eji5MEddVdNvkvOrtus9K8mXjM3Dj93Vov2GS4O6pAtL0IYoTwZJpgoK13+iFVxrQuetLpUqyeHEoSV6bAhLqSDmbbad7j5B5TMRZjcTvYK4ZrjQ/R7xu75s5F/SDLdoEApYQeoi1C5LDaH93TcdzOvmkcB3RvFYr1/mNAGrumZ1dSeZnlYf7wLtCOzpJ+ajLnFumTmtqA153CE7uWEaVJUveYg8n8uhgz4tS71DGqmvHjEoZsugMy+MQrL++yOzky/Rak3llwqRFPcZIMDCH2Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(478600001)(356005)(86362001)(81166007)(36756003)(82740400003)(316002)(70206006)(2616005)(110136005)(36860700001)(26005)(70586007)(336012)(1076003)(426003)(83380400001)(47076005)(41300700001)(8676002)(8936002)(40480700001)(5660300002)(4744005)(40460700003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 01:00:30.8669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 038ced10-2e60-42aa-fb0f-08dbfb76e758
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Dec 2023 01:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8506

Remove device_type device tree nodes as these nodes are no longer
required for Xen qemu boot.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../device-tree/files/zynqmp-xen-qemu.dtsi         | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi
index 249a786b..336d7a25 100644
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.d=
tsi
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.d=
tsi
@@ -1,16 +1,2 @@
 / {
-        cpus {
-                cpu@1 {
-                        //compatible =3D "disabled";
-                        device_type =3D "none";
-                };
-                cpu@2 {
-                        //compatible =3D "disabled";
-                        device_type =3D "none";
-                };
-                cpu@3 {
-                        //compatible =3D "disabled";
-                        device_type =3D "none";
-                };
-        };
 };
--=20
2.34.1



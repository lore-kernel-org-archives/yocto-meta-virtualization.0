Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C2DC6787B
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 18:18:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.84])
 by mx.groups.io with SMTP id smtpd.web10.2044.1692987498925074472
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 11:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=bKxtRxF2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.84, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/7W4Z+Pgeb+8O0omorYdUwbeHbxWIZI4QWZXekh9ofn43HTFsQVIUc+AedQA52Csl423uDfLZ71rNmhC0kUUzfJj33rciXjzQexso+TM6RMwsmGVcJ8jOAF9i9wibRgtODO38lEHkif3jMOyz1d+ZkrAGAVonNC9gAM5qZ/oEHSMj4+I+QpQI0SiD2HxVDDFO1eXEIV3KKDfkET8IbYkBv/oFdLhNZdd2qrt6sO3x1iGOCpB0aIqTn//67p5kX6yRc+urqQCLJqw1UPdc9n5qfGvMm+a5YqE/4zCQGUE9humb3DJRjN84mmlT45RwrBORIrssK42sjXpjaHcqtGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hdWRkKzKDej2qYHikxoMp6OhEcnqYJ4dCn9pdPr4SM=;
 b=GHyZkvN6Ng2Dh3eUf5OlMvn1iUNEURjkcdgWryVslPBJpmeSrsaZZ9BFGzYUuu/lm7OclMCb0zsBWiD3b/zKd5E2i1C3yTOmQyh6BRkgvY9yCafNzdHMJu4z+YRdoL5I2YddkrJJ7fpChpnhdxNlVv1b1A99MxlFoQkrD3+Cicv/xtK/1ynCLktzN0HgprIl0XnBtHw9i7bNJ9jzJe5BLFJr/+Fq3Edwo6zbyupRPnz/Y+cbaI8m0ajSjTioNVzEda8x0bb/rxm5jR0ijqiieaePqQu2gx4y0qlvBqjtmsgDKQBcvisn3K7wV6I+5hobX/+118q+g4MLNqx+lmZF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hdWRkKzKDej2qYHikxoMp6OhEcnqYJ4dCn9pdPr4SM=;
 b=bKxtRxF2IMVOsR8KXOrBCB1gmoWHjQ9Y+8V/Kn7+Zunk8C6Dywjs3QdG8mTj6G0rK0ubA0EZw9bSAgfKwLP03REg15EyKGfwyuwBDFRUlfO4XQ1MMBIPwU8Mb8zzzihro/oUcWJ2E/qdRNqeL034CUZcLQLE4hN4jcc0JjayY/I=
Received: from DM6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:5:18f::15)
 by BN9PR12MB5148.namprd12.prod.outlook.com (2603:10b6:408:119::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 18:18:13 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::97) by DM6PR14CA0038.outlook.office365.com
 (2603:10b6:5:18f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 18:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 18:18:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 13:18:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 11:18:13 -0700
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 13:18:12 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 2/2] u-boot-xlnx-scr: Enable xen boot script using variable
Date: Fri, 25 Aug 2023 12:18:11 -0600
Message-ID: <20230825181811.3306054-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
References: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BN9PR12MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd3a39a-aeca-43bb-d527-08dba597a56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fzjgJP4e9Ab+jIQ10A4KWZqwliSTlCgsVjXXsexx26nxjAaimf/aHbSe8+8z4RgB+kVnUswqkvxKW5BAMVuOJ7OpfVDpgUN/qwOkvJtr0SSZxsVZPS+i5/HXr0WZUNDK2QExeqGeaTqcp7OegDJggomyX8Wk0dbyeusV9Bdfp/EamnnpoMxkLjoD7Nwsvkv9afv8VUnUuz6yo9nGO9rE2sZqwWxf0zehcXI6VjDWWDb8OcxUnWo4jIQJFBFNJnVnrIgdoZaaYttuPp+Vxe7Fh6khcAQvtD99riVgtm05UAxPgjb6hLHptH4DQW1AIPwChiX7Lq212gtx5qulYq7HZ7DDt2HqSl2eocEgv16rcGw6nXiXXjL0RrGHlRJ0TifNcR6vPydsa4/xrzAWkpfT8wcJrkF6E4CVWr0b/a78ADmXayUMOIzSUU1/HUmKvxqs2XR0XFakR3d+pdoVmDuBqjsU57cR2+Qql/cvNiHlq0U8gFpM7boeck7NUtbDN+syJMUsMMlxtDbtZuls8huAnc5ny2zFKGN3LfITwm00avQclOZrCV4yDYAF6NpVKkDN0m+HrCHT9JxJMLr/QD1uV4wDIF2WvBVnFRPRWJiwfvk/VMRg2d9QNe5vaq4QYhMMmXCR6Fz1qFYZhQjdz/ZX+N+KwHK3iAz5+OGVji/7AHQO11BpO1gayg8IpLZqAPWPlidiFbPJQvn7y2UaKvzK0Irz/dpWLCiRbT1e4/ghZ22hV+e9yk+iR4LeQmEu5pe1/Tf1EVCl0c5Gk3KPvb7RnA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(1800799009)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(1076003)(36860700001)(336012)(83380400001)(478600001)(26005)(47076005)(40480700001)(2616005)(5660300002)(426003)(2906002)(8676002)(8936002)(4326008)(356005)(82740400003)(81166007)(40460700003)(70206006)(70586007)(86362001)(110136005)(41300700001)(36756003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 18:18:13.6515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd3a39a-aeca-43bb-d527-08dba597a56d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5148
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Aug 2023 18:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8235

By default xen DISTRO_FEATURES are enabled for ZynqMP and Versal
for non xen builds KERNEL and DEVICETREE boot script offset was
override from meta-virtualization. Hence enable xen boot script
using variable ENABLE_XEN_UBOOT_SCR from configuration file only
for xen builds.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
index ae847cbc..07685117 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -1,2 +1,4 @@
-# Include xen-boot-cmd.inc only if xen distro features is enabled.
-include ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen-boot-cmd.inc',=
 '', d)}
+# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration
+# file.
+ENABLE_XEN_UBOOT_SCR ?=3D ""
+include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =3D=3D '=
1' else ''}
--=20
2.34.1



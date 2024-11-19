Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6838D44001
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:12:37 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web11.14148.1731993150331966740
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=MnAsr84N;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.58, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPiak2rTyCqUuvv9fZ/OUK5pR7j7lYw7o+0l6tffyQWq9hF5QdbJK2jyATJHL+CsXraicleboF2b3L5yTfjzk157uGCpqYxPpN+gHs9OejrYHwwTclR3//NjsH5cKlBbhL00kMxlMtgZjCoM7Lt+UYUyws4nNNX8GrBZtR31uug0ABTa/fB2478AOZ7JYGzYw9Wbym1TNBtdvGmD34+baq8ry4piZkokcvvuBl0twqF22a4q/lspMDIuM4UhpvXxV1ppaRjJOBq5exJs+YBmgnfcPyj9WxfDLVxchYdi/6ZCTDPpEAh0ya4Og3c6asnA25qj83LoJKnLhu5hsoiCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=gmcowaRcFtAPwIGyWTOikfem+2JTJIkXATrLL82b0pCo0pPHYzpAEpcSZw82tXnMr8KQutcHv/VYVEFjVXLtJ0EBq58S6qlUGn/Tv0KaFwXrl29fe5y+btG+w3v06towHizjr5WEnVdDDC0+Ce/JFqgZ5qlmZfhWp2Fx31DrSVwy2+XTOcrh8KKqViBvXF5gGc5bBKO3uR1mG8UF35jAOmn1vQmXWGCZzXALPD3OjlCfdOz4D+mg+LLPrAbMs8N9SXwtqx2jbhy2JhWUv1FXdY19CCWXMiAC4aIhSueO8SZAkQ3WF36K7Jr7q/pa+qb5qsFZ1rQpJmCoLhXGXbS5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=MnAsr84NxtntZkg834MoUDcYfb6BXlhji5dXiRQlODwyKBD4n6WS85Mzhz+Ukh78rkpLodh0wxDh+UK80IXHaHoBEArEDPpKo1gdEHYzAYPLx5wjfYRemPJsPJ5aOUiZuplpEH2h/DZRrq+fYqRyQpg/JOU4f6qNMYGt4fdnYaM=
Received: from DM6PR04CA0005.namprd04.prod.outlook.com (2603:10b6:5:334::10)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 19 Nov
 2024 05:12:24 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::31) by DM6PR04CA0005.outlook.office365.com
 (2603:10b6:5:334::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 05:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:12:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:17 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:17 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH 3/6]  xen-boot-env: Move xen variables to inc file
Date: Mon, 18 Nov 2024 22:12:00 -0700
Message-ID: <20241119051203.3841577-4-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb74be0-07d4-4940-381c-08dd0858c10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6mWAmKquiOq45iDkc5kDvLtJ+Wi7HGxiMpuzED4fu+jhQ3gjdT5cAZx2az+p?=
 =?us-ascii?Q?iWaCWz0xvyoY0sMcg3D+6wrzhXRleByaOjmiHqBIzzKpcbBfNqcgzv6tLyIy?=
 =?us-ascii?Q?gpWvA0NTp39axXSbppJpiRPbpglo1cjVoEWbz+4okdOXKrsDrgN5SeFcKPBE?=
 =?us-ascii?Q?nwNQ7I6aa56W6H8Ee+vCzwdSbwe4hd9iZeOQELpKFFRM9+QwZphSz6iQv52z?=
 =?us-ascii?Q?idHOHIxNv9V/CjhLwGU/427Cr8HkzGaFlUQSBj0uw9DUkrwaWfHU30KPSQlL?=
 =?us-ascii?Q?etL5W04hiPiOE2iLhyeYBUxBFFjAZ0Yic6YMOvMacdUZewd96CsdnAMHqvh9?=
 =?us-ascii?Q?K5HgNEHM20oI/lLxvX376DgeqyujrRz/x6nb/JBGnkjYnAg1jzL2pwPchlhd?=
 =?us-ascii?Q?J4n4tFNys6t34VN4S6BZSpl38I19NEzf28JK4njN8nHz9dvoPLK6s8vDt6iJ?=
 =?us-ascii?Q?6vYpyVgJ/6tGZnarF0n3DlUr6Vwf+jHpkkLW8jORXa5uI5UgsA5wrIElUEQV?=
 =?us-ascii?Q?pa1kJA5v6CtGa72BkRyA8Me1ITtQjEjVz5ow2HsGr7g/RIOKl2ZewEtW2FzG?=
 =?us-ascii?Q?u+QkIcMogQ+VgPjxs/LbiUZu/E0Os7TT/lij2ej0LqIfsuXigvaeRQ0WGH+E?=
 =?us-ascii?Q?/Fv+4eSLRbl0iRSuskqALGfBslkqO8MpYzmjj+7hQoCTpQOJKSNPwgJb/n9/?=
 =?us-ascii?Q?SyfvpxskJE462XFjKxRmmhjaIW+x/v2aUREK+wigCRkCzv+zFhA9+rtngoer?=
 =?us-ascii?Q?qlcVeoO396yjce0vjoLlcXxWtVXaohMcytV/KT4M+gJuXfngFe3gknRMOo0r?=
 =?us-ascii?Q?g/mNM+4fBBlkx7/qeASKphQlOW4Hwq/myhQ1FNusepO4AVhnS3gqQGJclf7A?=
 =?us-ascii?Q?+J3AA4MVdfYwsOS6S9NvdypNN6Mt/3gn/q1CxGGnro4c+b5/Ewz75epgeE86?=
 =?us-ascii?Q?MdICKUEjGYOmkv7y7JR4Up7aON/AFG0xi/avjs3PpL0EgRwm8MUFUC4SlpSU?=
 =?us-ascii?Q?1z0QEMRFHflA4tI7xsdl08jAs/bm3b23hKY3zbh/Wlhbj6YlzZLLU/44kBnq?=
 =?us-ascii?Q?6jg0P754IAu2KTMlWTpc3/DRno4fT7LoOJB8tkCgl+6q6hHhNKc41C9SvaJR?=
 =?us-ascii?Q?h5xb2wRHqakY00i3mzI1N0ncZkEpVO7DyR5s8VcAA8eH+4P2EZrYMENS6LRj?=
 =?us-ascii?Q?boalM9J04ZBUt9MlnNTnRgXLaQ+U71G0SxU8aNRPn4h8GBSyvaHzbuIRFSRi?=
 =?us-ascii?Q?BfodisCgJHG81jSdzOoch8q0tSt2PLBj7bljljp5wQt47PFUk0cJj/LMVlyU?=
 =?us-ascii?Q?powBdSUz8sCX+RvY1N9WXbuhX1eSCv/Dzjxn430STCET3FIEZ6Ry1QxJzorP?=
 =?us-ascii?Q?BH09Bq6GNRW6AzMLtVluR0VG4+1n6OEWC7jn8H3TZhu4cELeQg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:12:24.3173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb74be0-07d4-4940-381c-08dd0858c10b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8981

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



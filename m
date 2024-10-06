Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C106CFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 04:47:53 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.58])
 by mx.groups.io with SMTP id smtpd.web11.26003.1728190064958187985
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 05 Oct 2024 21:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=wgA3iZNj;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.58, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv4mRFhXWEqns62oc6aq1HkKkFKChFsNVE3hNZ7BLM9kSNSZRRM9LvG4Ohzu1dt+0MAQlT9m0kcotp14x7MqdF5Y6aB5e0YncvJMerG+ril0+dpNf7Yl3kX0FqsLRI6k1+eLjLiCJQqvzDX78QoNsHi7UeFM3k8hDDG2RUJ8ZqtqFw+r2pyGXrPIJkTlvgPIh5hRZHE8Fn3ACZe6Hxa4L+2Axcnj5KssbM1kz21Rinqvgl20LrYbXgw/zJjddFTz5OkUkFavrVQzXra8Tpy64ERkj9mxdx5c19D1wBIosaccbBBGdbzAjJC0Cwtay7qQKOL4j0rwG1oKdAubJ31/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOSBdQDKL9AbvCDiRFtiZJRV6qrYW34Q2FEk8hZS0c8=;
 b=rVG/v4zNHC5KgP8xS90kvK1J8H7Y7NUr1kVPKcdiRP/K1dMQh7OoSSHPvQ710YQ+pV+vzi9WbjEIpkLgyq4pgyLU7NMP65qm07VjrWcdFhsViqu7nLhiQn6zDLkFEtGgDnUUEErfyScwwtciz19TZ/hSvef2HkHpzo3nsZKzAoTOa56Mzvm8yxqUdiLuQCPZAcvS/PaBUU7iqu6hviOa7cG09Gk1CIRVU+InPRQEAZbjLkpfl8dRhlkh4KQzPwtwLWTbX1vKwbRxAP+f7Eiq9Z/XvLqRcsY6A36hWL9pmajVxT6tHCGVzdWOKBMurFEXNWGO3hK0qq5oVsT5LjdgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOSBdQDKL9AbvCDiRFtiZJRV6qrYW34Q2FEk8hZS0c8=;
 b=wgA3iZNjrsCTB3ZNzy5TlL840hXAOqhxQVcwWR4PfUcD88YPLWoHWKa84CjvfMsE8gP+Lzsvks4xtiXjSnvQ2/jFpRPFk8lGZvZ2F4+XN3czTL/X3cKNVfB+AheEhYZtIHZWWQDATWZoO8jXmiTo3YoMbBGifIOU16EFsr5E20k=
Received: from CH5P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::11)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 6 Oct
 2024 04:47:38 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::6d) by CH5P222CA0023.outlook.office365.com
 (2603:10b6:610:1ee::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20 via Frontend
 Transport; Sun, 6 Oct 2024 04:47:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Sun, 6 Oct 2024 04:47:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 5 Oct
 2024 23:47:37 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 5 Oct 2024 23:46:58 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][2024.2][PATCH v2] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
Date: Sat, 5 Oct 2024 22:46:58 -0600
Message-ID: <20241006044658.3241118-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: d744c188-9c1b-41fe-d97a-08dce5c20135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+Q4Bl/QLmi6rv4rffxXq/hRST+Nhg0ZdleKnN/i+jacv/voJDEgxLcucwje9?=
 =?us-ascii?Q?aDuCW5/BWUgZ/lN1NHqXgGJVim2PIKKX6uWq8KrvbkhNMCdthIFOR0iMl+97?=
 =?us-ascii?Q?6Cum6XqEn5fBb9TvmUl2alDKVXJmy7n+B6q448JEOGiKVcffQRasEDqClSTK?=
 =?us-ascii?Q?cNfjaLaXWdEx6U40+sLRW5+xMisQNrFgCMjuvyPCfGem3HTsZOX1IpgZiA24?=
 =?us-ascii?Q?pEoSvyzM0zlQKWHsZ9lOzcHpIfLrPHkPNUGuXtpwi8/gTWwH8apKRjufruo9?=
 =?us-ascii?Q?qSxe3hLExoHfkC+jWlHZNIHJ7C0TUH/e8ZF1x5ZgpHNS1ZQP8PoKqSFbLcNK?=
 =?us-ascii?Q?KEp7qxLPAOjjqK5FMSXIBhDXuCJbH9XGN4F6LX/cSGoaN6MEnK8Ytn9aCfZA?=
 =?us-ascii?Q?8TKyr0wgpYzmh1kiJFQP0wqECQM9bp8gjVwYyhqbmv5CzPeHRnmYwTkAMJwj?=
 =?us-ascii?Q?mJSLC2zDGg8HWrPv+UdhLiaeio2YJfIG48l3aYvrQXJHSkXvDmz6w3fp+PRo?=
 =?us-ascii?Q?e3Fm+l3qCKkuFi5IRuoq4nEuu/0Q9oOQy+ILDpmzuNTuPPIlKbkzfIZ9+8rt?=
 =?us-ascii?Q?1NXQkfhycVZcz3YrbYqXXc0rinrvz2RlCV+RAP8rq9Rj93/A/bgy7DuezY7M?=
 =?us-ascii?Q?gJI+Dq2EK8V3yzqsLymryik6BBoCxI+WwAQvW+XuU1y37QTAmIvZHmvhpOl8?=
 =?us-ascii?Q?x10PZAIUHEM6kQLOoErRhPs2P7TRZwfKICK7vZ0CEvd1cUI0GCRwlnvxjDOc?=
 =?us-ascii?Q?fbCoqY1VMNwVxW5xX6ihUDFcTzN3XNpogfzZ0T/xdyB82G2LYzbIQASCjprW?=
 =?us-ascii?Q?/O1+pyGr5ThuqEkQjBIZq7viWoSeNd8Ct4XT0gTT0fQHFriB4fsdSdRDu37q?=
 =?us-ascii?Q?OeVY/cWO9kvT9SM1LLkM8hcAbLEwsP8m3UzRgH7BHa8vCuEunPB4Ebul+EiM?=
 =?us-ascii?Q?mNN6ceoNBoGONIvadfMknTW5FFd8RCL9n1oiuv6M/+1VYhnK5pQO6O7gH1ZB?=
 =?us-ascii?Q?NjBuX6wyyqUaYlcM0x2MUQTNQdi3Smt9EmbGDaTILok9Tw6mT0su7RaRmIOw?=
 =?us-ascii?Q?l5dwynQgZOSXvEffgNPJRQneI41nXHxEWwlsN/tECmliFf9USP0fzh1v3iuM?=
 =?us-ascii?Q?eGunqOdU8+zh5Z5GQVCyUTWn9FXso38WqZQaYxlyBrT+pYMNX27rQiEE4Enw?=
 =?us-ascii?Q?ae6uMuoLJdBq4jiVfrZDktTrh/ZBjEsES0UBvyAcP0OHL95gI8bGedp20vz/?=
 =?us-ascii?Q?Ru6WyBoNn+qgliwyKg9gEFUNrtZzZrAU2vCiSr98fbSsB19wwOnFfpwIl9eB?=
 =?us-ascii?Q?KDMgTo9OqezgOaJ2QFylw9e+GdN1tDGrmwbFo0MqKPOLOfMeeDDRIoJeVVb+?=
 =?us-ascii?Q?GsSmQF8tl0mPMOWv6mF9akkEyB7m?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 04:47:38.5865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d744c188-9c1b-41fe-d97a-08dce5c20135
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 06 Oct 2024 04:47:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8916

Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
are renamed in https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilin=
x-core/recipes-bsp/device-tree/device-tree.bb
recipe.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
Changes in v2:
   - As per Bruce comments add link to device-tree recipe so that others
     will known which one we are tracking.
---
 .../device-tree/device-tree.bbappend          | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbap=
pend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
index e235826..813c08f 100644
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
@@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 ENABLE_XEN_DTSI ?=3D ""
 ENABLE_XEN_QEMU_DTSI ?=3D ""
=20
-XEN_EXTRA_OVERLAYS =3D ""
-XEN_EXTRA_QEMU_OVERLAYS =3D ""
+XEN_EXTRA_DT_INCLUDE_FILES =3D ""
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
=20
-XEN_EXTRA_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qem=
u.dtsi"
=20
-XEN_EXTRA_OVERLAYS:versal =3D "versal-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:versal =3D "versal-xen.dtsi versal-xen-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi versal-xen-qem=
u.dtsi"
=20
-XEN_EXTRA_OVERLAYS:versal-net =3D "versal-net-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:versal-net =3D "versal-net-xen.dtsi versal-net-xen=
-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi versal=
-net-xen-qemu.dtsi"
=20
-EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('ENABLE=
_XEN_DTSI') =3D=3D '1' else ''}"
-EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getVar('E=
NABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
+EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' if =
d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
+EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILES}=
' if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
--=20
2.34.1



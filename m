Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA20FE77184
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.79])
 by mx.groups.io with SMTP id smtpd.web11.103355.1733756091015977971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=LlxMqiWz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.79, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfTSG7SOdB6ky5bJeGwAAZhCFWghknGukZK0Z8xIK/mceRkGJqmEHoRfbnEkF1LPSP9tIDLbaUfW6hsr4sEP3iezQczQsq6rWSnwDy7rGu6ZVHwv0B7cODhpEowehsmZjd45yuHfr7gVnV/cEq+BbeAf+JjqJHwnBYF8mw9+wZB2N44rvQnAGy3jKp+hEU+MHC9ym9DJSopSNQx6UquTgRcWk6/o05K6YxwLWwJnYDz4zCeXw5wkd0sMvjklT5DGiJjIH4+DCadI3mVo7Gvo/N768OyfLaRGD+uYfUfLlTfQ+AeHM0ojiEYZXYq6K4ZzfJOXFVKBYwVb4NySuOGndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=lTG9Q5+ruAcqyvk7ZyxU3IO2cqBc87zfymytwyoOn/d2pKMuUArKRjX9316ZkxTL3xTt1QivL1XJKfXJsv6rujan59WhQj8F6jj57I9azXlfr9aJqcNYj3CoBRhbvRiYv8mYUXeHd+ozBahRlR0X1AfRMGOJzW4MVjwgz5YbF+DHeY6qvX5mIx3TC/J0cS0dtG8ku+RU9xAhbhq/0aN/D57JWvM373lWd0DGh0o3nEya6H9xzG2qEm6DmrRCAUF/dJYkTBWfrtmEaMSG6+hpHIemuUB1L9pTUp6iFqg294NY3O/nWnT2iiPzNMnaYZw0XpU9201DSIqQn5atDFBLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=LlxMqiWzKQGu3r4Oj8/yCJhRsBGEwADZx5GQ8IMCND7AdQvlt/CF9RUS+4pGKWddDZg1ARXIVt7Y97GP5LekcDLgKDQF2Y8D8PI3pLz4WGfLPyoL0c3nKrVNeMzBlp/ToW42mkZCIGX137S0oc1rcQ8yXyx9Ei/8MglMIWMZmMA=
Received: from DS7PR05CA0070.namprd05.prod.outlook.com (2603:10b6:8:57::28) by
 MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 14:54:45 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::ee) by DS7PR05CA0070.outlook.office365.com
 (2603:10b6:8:57::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.12 via Frontend Transport; Mon,
 9 Dec 2024 14:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:44 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:43 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 2/5]  xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
Date: Mon, 9 Dec 2024 07:54:39 -0700
Message-ID: <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f8f54f-d778-4e16-5901-08dd18616b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WzSc0WmZWwu2G0FOpxpttzG54f3y9X3CHhepT+t6HiRDFneUgJZh+0n+bIxl?=
 =?us-ascii?Q?oBBOnB0w9N+pWiXKCyYg6mHypUJrQvwsuOCGae14vJ+ZjNQeiCJaWfl7bhuQ?=
 =?us-ascii?Q?qA8XPafn3VC8n/VeBXux5EUETktna/b3mvJTG/ObFzLbVBnhEuKsLjGQaANu?=
 =?us-ascii?Q?pBPKoG0l+9KDqGblonlZr+xaBAvK/eeQ4eJWO0TfPE86lLGVtuWxDv85651s?=
 =?us-ascii?Q?HCq63zRmqFJ0P1DjoE83Qkl0eWGHjgHsn7Vhzs8FJF1h++c3eAMPPq7eUfRX?=
 =?us-ascii?Q?FfEDA0psOhjDiYvJRaWVC8f/ZE3FSgBXlFO/y8R7LizpfrFAoe8oymk/VMsx?=
 =?us-ascii?Q?+M2axwebTThkjDYyzi4vJC5VAuoPhh33rK3yzFl38yDHkQ9zPMdBnmOT9tJj?=
 =?us-ascii?Q?bCyb7CxlPvoJH3qf4NqyUknuVtbV2cm8bYnoRTwLPp0pJ4CRavUdlgf7+50y?=
 =?us-ascii?Q?xc+D8b/FejO/2az1VJ8Zo6NhLnXje57w40RKBldti4P+qc1HTvt/DPFygwNz?=
 =?us-ascii?Q?AuNoMja/o7pRIPi5nq3LYBq7CzUSFTg1rcc7u1IQ/hLt9K9qz5cPIWdn12rW?=
 =?us-ascii?Q?Lr9UyOw9cyhNFLXVyfPUIqgYiNAHaN6myfN5BQz27mxNzj5m5biKNqlKyiow?=
 =?us-ascii?Q?S5brV6ouaizwyx/3BXorhC/nzMRKGKLf5LyLhUR3Xknz2fqCiI7pp7YdR+se?=
 =?us-ascii?Q?/2IdvDSEpG7q/OtWWONNDUDA97fi60CTVx5Fs4ZAFG7rB+HMS0iMSjIal0Ql?=
 =?us-ascii?Q?CzYI5YIq87fIDwbs3G9pRmebVNE50GOC5RDzZT05h3TJJRweLK2jkLjJC+aE?=
 =?us-ascii?Q?ZWbMye7Wy8/u1RTgZ07ZEdN6OVfk/s3pvcjMYaIb0O/8mH0FsUtnE50mEgB6?=
 =?us-ascii?Q?Mb0h452izrLoP16WaXNPJSPr7rbcbVLvUJVArXDwM9UWki4HxyjkgkD3FC1J?=
 =?us-ascii?Q?6gepD+DFjhrlgT3SdfllIQ1k3tuP2ZIF50E+XOYW94yWByJJSz/ek0Pj3BT/?=
 =?us-ascii?Q?JBApK+yKwW8bZnAkc/QL3+LGyL5m+4eM5AoWfY47qUg4fIHLdX0LtGKEmlmp?=
 =?us-ascii?Q?JYDlMPLOXarxnqYJhR60a8VuDbasogJJm+MtU7ezLa0qqF+cKzC4GWGH8HPE?=
 =?us-ascii?Q?2XLu/bLL7/RthXtRlobbL8uE/CQ6OxhzoWGGf4TLpC7jbyhjp82XO2jr7uJs?=
 =?us-ascii?Q?55y+gyK06LTcdKurk3o2iomcVvgq15F/l/GCGYawhN3rWPh6ZVFNX5W8tQk9?=
 =?us-ascii?Q?fSQTzi4YipvF5MKFtAnNP+ICdhsnLo2hlXWHw27RS+BEyuQPDO6Tvhin4PZd?=
 =?us-ascii?Q?afYkFup12A1a+mLmPwkzzSTrIi/J7ge9fYMdTwWomIvu4s0SNXsy283lXnRT?=
 =?us-ascii?Q?jVgEs2Hgaj63IJhpEwFtNYulfK/uDunxGF4U2ukS2jFI2+9EkSrUorvPztww?=
 =?us-ascii?Q?xbvngjE0HckDHXQvabTRu/NDKo9xE74l?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:45.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f8f54f-d778-4e16-5901-08dd18616b98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9047

Inherit xen-launch-config bbclass to use common xen launch config
variables for xen-rpi-u-boot-scr recipe.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in        | 10 +++++-----
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb        | 13 ++++++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/file=
s/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/files/boot.cmd.xen.in
index 98742200..b0ed0dc8 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.=
cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.=
cmd.xen.in
@@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
 fdt get value bootargs /chosen bootargs
=20
 # Set module load addresses
-setenv xen_loadaddr     "0x00200000"
-setenv kernel_loadaddr  "0x00400000"
+setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
+setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
=20
 # Add some space to the fdt so we can edit it
 fdt resize 0x1000
 echo Add boot arguments for Xen
-fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/soc/serial@7e=
215040 dom0_mem=3D'@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
+fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D@@XEN_SERIAL_C=
ONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ @@XEN_CMDLINE_APPEND@@"
=20
 echo Add a dom0 node to chosen to put Linux boot information in
 fdt mknode /chosen dom0
@@ -36,11 +36,11 @@ setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot=
 debug root=3DPARTUUID=3D${rootfs
 fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
=20
 echo Load Xen into memory
-fatload mmc 1:1 ${xen_loadaddr} xen
+fatload mmc 1:1 ${xen_loadaddr} @@XEN_IMAGETYPE@@
 echo Xen loaded, size: 0x$filesize
=20
 echo Load Linux kernel into memory
-fatload mmc 1:1 ${kernel_loadaddr} Image
+fatload mmc 1:1 ${kernel_loadaddr} @@KERNEL_IMAGETYPE@@
 setenv kernel_size 0x$filesize
 echo Linux loaded, size: 0x$filesize
=20
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-=
rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/xen-rpi-u-boot-scr.bb
index 3f83c7f8..0b5d4201 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
@@ -5,18 +5,21 @@ COMPATIBLE_MACHINE =3D "^raspberrypi4-64$"
=20
 DEPENDS =3D "u-boot-mkimage-native"
=20
+inherit xen-launch-config
+
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
 SRC_URI =3D "file://boot.cmd.xen.in"
=20
-RPI_DOM0_MEM ??=3D "256M"
-RPI_DEBUG_XEN_ARGS ??=3D "sync_console bootscrub=3D0"
-
 do_compile() {
     sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
+        -e 's/@@XEN_IMAGETYPE@@/${XEN_IMAGETYPE}/' \
         -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
-        -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
-        -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
+        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
+        -e 's/@@KERNEL_LOAD_ADDRESS@@/${KERNEL_LOAD_ADDRESS}/' \
+        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
+        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
+        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
         "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
=20
     mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORK=
DIR}/boot.cmd" boot.scr
--=20
2.34.1



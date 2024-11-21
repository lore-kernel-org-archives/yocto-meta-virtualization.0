Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB35EE64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:41 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web10.11639.1732229375270856614
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=b54BJzx4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.46, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOl6xXAbTrQGBiKifYd25ucKD/XSnParW5g9y21jr+HqNp3au3EzGlDmPYsnbOPX3aHBFZynUwmTbvbTw2JlapgIvcYRb8yTAollxbPbYU2dkmX/D/CzG/LDXgvtFXcWvcS0MmMVmE5vmliAwp4mECOCPHUiZ9K5UDwGN5rLxDZ9M1sCjBFWIsZE/TM2Pv0wMs9S0iJWNyg7CpwmKDekvKycUJJ/gOTroDU3jzoOhxTIZCsndpn+PDGZAuKF4JoqG65GZm5HN5nvymo+fWDd5LFuL0JC4a4DXDB9bro5Rkl8A2h8ofaPReeARozEyU8UBtip+OEEPBDaMNDpBLPbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JnwsHkdmEf0dVxMgdDHaaBA0aG01xjYZG0xMtt9oTU=;
 b=Z+YajG2Yxm3ZRgvF2Am24mOdK1lLbwvz7wYvYzByLy7abkXhUL4abXROi6cFhCN24yM2x5hwSHZPHeZ/rja0jYPFQ+vi2CwXoKL1Z/EVXSgL0dVOuGqjuob5XcQSOMVYlMN0Mx/U4bupU93Iat1TBQx5pHVpcuRoxYrLs+wAoIl3qgAvdswUOOXF7p1KpwIjXRzHE27gyZYWQZ1EsDD6jdaZHuXkakL75fjdCdKJc/SKkfi4U8Bd6O+otEKOUwcjH296QwyuhuKntaC59VEticz5qyREWGxGi7eiZHUyCv+iRdS2ief9XOBRudIr8TwB8Ec358DkruYjLkJG+Ry3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JnwsHkdmEf0dVxMgdDHaaBA0aG01xjYZG0xMtt9oTU=;
 b=b54BJzx4zEmERinRFsE0GyTx2sLm+m/RN+i7YwXmLitDnCcatIkrQz3Pv4T2kWei+NnYnWkDQ8CEGbr0LHdgCvr2xKdG5WBYEsrDkE2o9tfj4nvoaPlsyFkDJMAtKrotjjrhIyljqLnXbMp9s2C45daEGnSEizC1k8DMezyQW4E=
Received: from SA9PR13CA0101.namprd13.prod.outlook.com (2603:10b6:806:24::16)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 22:49:32 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::42) by SA9PR13CA0101.outlook.office365.com
 (2603:10b6:806:24::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:30 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:30 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH v2 2/6]  xen-rpi-u-boot-scr: Inherit xen-u-boot-scr-configuration bbclass
Date: Thu, 21 Nov 2024 15:49:25 -0700
Message-ID: <20241121224929.776765-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8e27df-66f3-4b51-49de-08dd0a7ec38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6f8t9ydnYA12FG1SIwxJZ9nM3gemTCJfe01LAigM7q2j56itDwPP8ABtqtjb?=
 =?us-ascii?Q?D3vmH+IYmvsopyOv+hn564+cV41vNgjXf3rCWlIV2ya9Igtof1u4/Y9DUFDi?=
 =?us-ascii?Q?AIhkPwtzYm1zoYSVe/31ihlt/D3h/c1BBOC9bdVJbMfGjCAqb0epNp1Oodk3?=
 =?us-ascii?Q?EBF/BXK8cJsxPM445ACQBttd/LV38oXFSaawYBWH9O8fxc1P1TeHinvFcX/A?=
 =?us-ascii?Q?RrpkOGxXUe/jUQiVGJoY2sW5adfIuixrzL6CswKlZefrPvqxkBZ9y5AmCJHQ?=
 =?us-ascii?Q?5RTLt/woSZSUY6aZ/D+U+GvkWdIu6RMezwsMAp1R6qNBYSy4XpAugactKXEU?=
 =?us-ascii?Q?t1i7sW4S7LPfbicmdVFIyjDr5r4aMKXZee1Jda+9ds4FzGRncftqbrXFb4VD?=
 =?us-ascii?Q?R4RYkAX+iD7+FZ+l5GY+CDtoIKGGswXjII9UYII38wylbGHhWZgbOLmPWBdq?=
 =?us-ascii?Q?L5zBB3JxE3k0xBZjZfEHZlZ4jAw6EP8tdy5knhBt0zeVMS8ZYDlZRP/1uTxC?=
 =?us-ascii?Q?LbTrTcUKkSSeclWsCSbObldb1sXuWCe2dFiA/AyQoSdDbG07tEAFBc2BrxVK?=
 =?us-ascii?Q?CwBK/XeXXiC40+ICIgsg20VSVUIOruglBLTqwB8l4ZLySYxDd8OwA39jZW5y?=
 =?us-ascii?Q?W+hOivY/D8EObBuJoNGj2UHUK/WGoOQZYEQDlmPwsJbe4PW1FJskw4/53VlV?=
 =?us-ascii?Q?WBzh1rR4UR+/J3uoS3uwzU6Dw4udy4oV4sD70VPZE+4HKmm6PdTwJwq8qynD?=
 =?us-ascii?Q?UX7xklcmsXQL9OZGnveXqjiaZ70J8d7tnLFGWMvYRsOR4pzkgymZ2eWaKUKs?=
 =?us-ascii?Q?78jouHvxqZLe+zkFzy1ioHk0+j8yEBimr08nAVMLV5FMVzcfsD/9GrrvouYu?=
 =?us-ascii?Q?zfAbFgi3CiIkNd4EHbGu/KlPB1yYbPRthbqMeqLikiRS0wC669jV9WXwFPUR?=
 =?us-ascii?Q?ykTDUAZaXy58sYdjIS9VmZV1srqzX4VGF/Oh7U147Sz89JD/x8/y/Cpoanlm?=
 =?us-ascii?Q?arVA7HpeuGgMoiSrjC68WxUMyQYtwVOdOZAAtFKuwwLsmlzXrMCWGe41F7zw?=
 =?us-ascii?Q?G/nys+kcYYFiLv4uJ7aqPVl9Y2wX5dlOaazaSaweG6BQDoGAZIzvVVFUOfIB?=
 =?us-ascii?Q?MGXeQfoDhVrXbNsNHQfw8eXnq+GYsVjZe4LQUXkuTZJ+XDUo9gqqCdBQ430C?=
 =?us-ascii?Q?m8leaW/wxYEtf6wKP4bRAzczd0FcxdKEaYwT5rSlzXaHzPDdVDQM2F3qcDxn?=
 =?us-ascii?Q?RgEF5A6IrCBzNZLt55hHP9zklxTEvmo6pLT2j9tqsTlEFFBeXnShCFjsDFof?=
 =?us-ascii?Q?68QW+W46pZFeFwZZrn2q6CobrqISQKZ5eCYYjHOmAlAzV25+CS0FqJQ9DAqk?=
 =?us-ascii?Q?p+X2H0Or4WijJT5vYzCtiYXr1Qz2ypuvlB8tOLhaQ5vN+hS76g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:31.8423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8e27df-66f3-4b51-49de-08dd0a7ec38e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9002

Inherit xen-u-boot-scr-configuration bbclass to use common xen u-boot
boot script variables for xen-rpi-u-boot-scr recipe.

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
index 3f83c7f8..7c327e82 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
@@ -5,18 +5,21 @@ COMPATIBLE_MACHINE =3D "^raspberrypi4-64$"
=20
 DEPENDS =3D "u-boot-mkimage-native"
=20
+inherit xen-u-boot-scr-configuration
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



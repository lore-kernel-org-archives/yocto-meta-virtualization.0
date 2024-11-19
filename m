Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E5DD10F59
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:12:27 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.67])
 by mx.groups.io with SMTP id smtpd.web10.14074.1731993146419714069
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=WpRzGhdh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.102.67, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoGCrtYK5n+V0CN3Z6wXLKyPp4iJtEE3MqSGWXzL9+11N+rLuky+zZA5Ao9Y4dEiskoV0/8IV+I4rwJfA7tPq8ayLw8qM4xtIUSWjyG8XJLtesEszekN+/ApixBzbXax5kSK7vFsIZRLHdU3NKN3qAMC3zRqTMOv29rHQ7wafPz5SyuhRgiD7AbHXtu25nxnCAHagM2To8bVDPWCiN9F984BqEhibOxpgJJ77ohrW7PKIR8N7zHIilyp6vS3nfXyMVyUbvBGlvfLHyC0SHV+KXE6VtKqbEY2fMQVOI3QysmeMw3W8vSB6pmNg1IO+zAQsBB1LykyhRFCRDdYks/A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueaJgIq3g5oOO0nqPfoB5+G8IOzBxNjAcdh7ujCOPF8=;
 b=bqLkqkHtbyE9aMZvkO4gmfMVSiJOGdceNC9OzZMkk4qi90vBwb/AVrxuQRJQPcGNmK+/iHyC+Q2oMCJoy+nNIbJw6z1Jkym89nDTtYyEbvfpwdshKim4uvFfS1aE4ZnyC7cyTjQHPTjTgiV4DeRbrtTxG0g4xopiAehnLcMkLj7+x24RVjyIjTjrlwXt82ELRotjX898XWwuL1grLMf/Po45jlBGeDO8WSRfmSzPDEjOVdsglBh0o62xNWSDgytN/5hhN3cI440CJGDh7yow67WOsv1ugh3J+1TwQ2FiCY9UhQx2O8eagP7JYQf+HRmjaPcbSSpk18pNwSz3apM/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueaJgIq3g5oOO0nqPfoB5+G8IOzBxNjAcdh7ujCOPF8=;
 b=WpRzGhdhCt/3UUma+5aLptZ1nd63mqcvL64/2FM1gKrOg9X9WYLF2r5JrAamj/7czdCqAkwkazGLzLju9lOAt4jnYHarpgDRCO2rYQm+fVk2cE1i2NIJ4C5A8gyIvH5iTJAAIfYzqm2YxCDWm4uAGIGFLjKRwQFf02aWR3u2wEs=
Received: from DM6PR04CA0007.namprd04.prod.outlook.com (2603:10b6:5:334::12)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 05:12:23 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::10) by DM6PR04CA0007.outlook.office365.com
 (2603:10b6:5:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 05:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:12:23 +0000
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
Subject: [meta-virtualization][master][PATCH 2/6]  xen-rpi-u-boot-scr: Inherit xen-u-boot-scr bbclass
Date: Mon, 18 Nov 2024 22:11:59 -0700
Message-ID: <20241119051203.3841577-3-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 64719bd1-aed5-41a4-0478-08dd0858c075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f6bRk6sNZrgaKULUsPMuerqYVoDF1Z2gSWO7CpgTH5iNjTGT/J8nLw8UBaSP?=
 =?us-ascii?Q?EVpoMAgAEdVM8fmKdZwL/5oESgWABti+J7cR/PZdARy4l1gqdFANlmnrkrnB?=
 =?us-ascii?Q?/fBoK4vfrQXJ350TjAg17cnACAhXAm96ldPzkYjkaUgsAC30cqLnAVe6kXUl?=
 =?us-ascii?Q?rdFKaRhi7ldm5FZquF4Tw6TGElQlEHE0a71UNbVeRLesCZTiiq/Cvy+b9/M3?=
 =?us-ascii?Q?Knx/DgELGJHWsCIToM3P7tFIUQYvuljij9X2wBVGt4pD5tM5CcoG8MrRICM2?=
 =?us-ascii?Q?sgIyaOlXkJsLUpJMSQE4odRziFVDdEPrTBR8DS0WGgK+juo4Bcb3kbKSq2PK?=
 =?us-ascii?Q?oSP2SQ/nfUIbM2T0AJjIM0X4sZfWNMSK4jjLM/Y+epgHssx9SGyGQECFrqkD?=
 =?us-ascii?Q?34Y0eym6X3dbDubLVMBW13RnQib6yxD2625KbDH0VIaQkW+qm/8xeXZqnKS8?=
 =?us-ascii?Q?eG89qRpLihyS7Ey3yH2QS3zaJZrBnAg7Q0vbQHfnv3sFkPLjPe3vBam9C5Df?=
 =?us-ascii?Q?kpx3FCzyYgcYeim+daTxUNgatwrbBaSQqlyzPaiUXqXrGE3NiRPuhU+DaOam?=
 =?us-ascii?Q?jDC51tpnVuOTHHBdjmvjPA4fETP/aiG6cKVW/5QsynjHxMLiop+m7iOvR8IA?=
 =?us-ascii?Q?gbmNoiBEf5ef7N2J4HpJ3NsL03v3vzEMn3O1sZyL2f7BnHpf0YZie90hqtuu?=
 =?us-ascii?Q?YJXqO027KIgdEuezs1OkeyUyL14dQKe8z2GKdSvv00aZ1dOxepqrvGto32nB?=
 =?us-ascii?Q?AJYgQwknNdXAIVcs9IMVtlocl89yiztMfQb7zPFcjL2NYTzuuDUZZUVJD2WQ?=
 =?us-ascii?Q?L2FjSDrXsWfAEE3XhPC4O4Khs6vUMBBg5GYWwSWyRZBWRUlayYKhfLAm9HfW?=
 =?us-ascii?Q?4TKCGnDg9qtqDefz+vy8Vfvrqgl1y7WtV6yeF0Cd1AMh3wcfSiLF8yspO/QP?=
 =?us-ascii?Q?/Zb7mnaM0PjYCv5IXWTwKf+mLm+mwsmmkEV9BqmMGJ4qmYAwC8Mw3AK2+vxd?=
 =?us-ascii?Q?WHd/dLOZoNKOjhk67JMhNqvNCoJI2bBhmWxdOcNqEtgte7LAHHyBLcrRo2Tg?=
 =?us-ascii?Q?kywzu7iCc2aPkQoFJ2PkY4L89438jpvtT/vOVjRwP3iKEhPbk388CGJAGQQs?=
 =?us-ascii?Q?ILbeZSSarrtp+XLkYigJhynphXBa8XkRk4OyEh5tb66N+D+q4SBjifUBoXD9?=
 =?us-ascii?Q?St67FlF6fEwMhPTeJCa7yE6lJjeZhCbXo3Y3JsRdHBtZMczWleFGDnS0QvLI?=
 =?us-ascii?Q?FWRg82c4KNlw0ia6ATV43WSrFOsOOgr6WjkrUu8bUD60WXt7hOgm37HZupFG?=
 =?us-ascii?Q?YsCFn/8dEd4VzezcUvRh9//DhysCBB8n+zKo+L8a+28RgER1WMPrU06fyZUO?=
 =?us-ascii?Q?bgSGmZtpKk9NqPdq37PVf/lACmYW/0BBIVVgbClG7cXD9tYIQQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:12:23.3485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64719bd1-aed5-41a4-0478-08dd0858c075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8979

Inherit xen-u-boot-scr bbclass to use common xen u-boot boot script
variables for xen-rpi-u-boot-scr recipes.

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
index 3f83c7f8..8893b42c 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-b=
oot-scr.bb
@@ -5,18 +5,21 @@ COMPATIBLE_MACHINE =3D "^raspberrypi4-64$"
=20
 DEPENDS =3D "u-boot-mkimage-native"
=20
+inherit xen-u-boot-scr
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



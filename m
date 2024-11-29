Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA04D735E5
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:57 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.54])
 by mx.groups.io with SMTP id smtpd.web10.124220.1732919389013543863
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=OUI5GqM+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.54, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7flrWlebergYoRCE3FRnUGfVXfZ0EJlhKdRxMxm5blEKIzMVY1xLbFvcVIEYRbgtROIgfWjqOAm+7PBfERhKZfHH0mTPaMdAKm+IbEs/aUJeqg1X9fqn6nCpa1wGvrVlhmvC9azwClo3TtwlKSV/VdavLE0vZsVm9HB7JG4mFvGPENBOlYeTbc0FHdty+bFKq1YTa+L6XkMLfSt6VYZr1tFPYz6F34N7DT9MYoEnTnoxJ+eaQV88mph4OtYEzXmjqNFCmTRsGiKkma9AaE2X4V1KlqjXHwIOPiTTTg2UizXM0q8zfAAvrkPoF89d6cRCSRZ1TDJeAehsOz78FS7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=v1rJWF8Zn90KKeQ6pnHxNTyerxe+kdHaXWLglAYVTEOI7wZMSJCjcsmg7t8PtfIImV1Nzkw+silLra7gpSMTaiXBcenmjV9YRaxdcM+hfUJ+fIfMkRAc7RitXfyhkR6/SoxhKIEt+TKXvl60IEzXhobpXZXjH0P/CPaD5aAHkJTurhE7FMEQion932ena/fH5Ke95ZEyjXS9bocmk9zZdqgvTf/qPFHssBlTjjFqRo1YbQdNyqeuFzb5hpkd3FwDlhVyglFen0q1tYUJA14ze2osPPqxDPtmfj/DcYUUR/9WqkbOuFo2SzWrniTQNT062CRNK3W/8/9uLZJlAS7uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA2VA5RZ1e3HKGVmVD2eWNNgBFMgWosX8VA8NxRBNNg=;
 b=OUI5GqM+ht/9oETWEThPEg94r81sC0Kfywwxkc9o4OHUyOyJYsqgtuDeFbX0VWQshIROGFwACtIHBPzb7IOnaoSdEn4UjUmzxGUh0j/GoxaYeYBIkPeYqjfMVaqewvO0N8qFSPR5+xWOdDt5LUKCWFMJIx+7KLmUCoLoa80xWUc=
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 22:29:39 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::60) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.5 via Frontend Transport; Fri,
 29 Nov 2024 22:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Fri, 29 Nov 2024 22:29:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:38 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:37 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 2/6]  xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
Date: Fri, 29 Nov 2024 15:29:27 -0700
Message-ID: <20241129222931.1300310-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH7PR12MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 456c0682-8ab5-4f2a-8dd9-08dd10c55035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LObl5i6le1krsznEsQHa8yaaXFFBfY6V7QSYugxAVq40OS43O6d9WJVBk5sS?=
 =?us-ascii?Q?wpJd6XCv21fq6L9ZserhBz0IfPh0Y57sPy+df2xjClf1MtsQh/PCxpD7VT7p?=
 =?us-ascii?Q?4Fmz2GvRDR2bErR9E5GysyNpPRYaEoQXVkNEgFZoC6t/nt8I/mjfPxOB4Ihg?=
 =?us-ascii?Q?W7YTUn28E/Kq0vbchznHwsdpoMgoDRonD1bcVu5y0PtqAU5s97RR3EchmpVV?=
 =?us-ascii?Q?iz95iu6pO+ky8Fxj6nBO0IBY6owlO3ol0QTzLpALNcpCTDEQtQiJ5x943Yi3?=
 =?us-ascii?Q?nEUXizwf0UgTOLY7pLqqO8U41LRf5gfHq8Y73IuR/f03j+xsSMu8huWX/R8Q?=
 =?us-ascii?Q?zGMLmzPzI2cuLE+r9E+Fm6/ws0cEpb6hegdRq8NPmEEWbykbLkKCLQKG3+Wn?=
 =?us-ascii?Q?x+fvdMgaYnWbx0xBS4kVuR42RNjTese8xGpre7ogsZiMRbowWcKdH9M97RxR?=
 =?us-ascii?Q?uJBQxuhCsPe3OKWGG98NtPTAzA3kf0XWjG0/KGxv+jK6duLpW2wdPn/ZfqxW?=
 =?us-ascii?Q?dgAjV3vI1QOf5XNYg1gFrb4v/jdSK5N9cTYlpb97zxyckzKjNDwoC8vp/3MJ?=
 =?us-ascii?Q?juBIIC5wcm36DG8kPlFOxIHcCKiNKc9+BkW2oSOGSEIl9w4nCmOzk7muclYI?=
 =?us-ascii?Q?JhM2CvHo2dmHZrBtjumfdGimQl1rn3d4GUucOzsbZgAEWF/vrATlwajH5sRO?=
 =?us-ascii?Q?80xq/Tuery5I/CkeILm7MxLpUYr5tHTXsOXzit6MZBpfGSXR/w9b6Otc8k9N?=
 =?us-ascii?Q?fFXSBdu+QNdGe3w0oFQ152j9YQy/cD8qEso6EvmHI3bBcy1x7gR28S80p//K?=
 =?us-ascii?Q?pqnHboC3ItOjLTYdWCW8UHxkbxWBq/AHK7AdkFYaH5KLriauRhdgiwA2llSp?=
 =?us-ascii?Q?xSTyBUELUEc5uKQ/sRRdBC8pCkYofJTVGxLRFZHYTEqfnVWH7d1+TuXXHn4h?=
 =?us-ascii?Q?sNG7UF1WD2QoZJNVfLUumI2CJP6YghS6jxzQtCiBRzmFvVnEnSDrQI22EyT3?=
 =?us-ascii?Q?OHQLCIgjf1rGb/6VmXiQYMls8jpg4JhGxXi5FhBiM/OgZzFm+RSAA+tn2Cc6?=
 =?us-ascii?Q?TBEhBqpPnBw2hUo+yF50fOEwXyWugnKGjffwhXKnaKQg+7qjTaDT2+FLR+yB?=
 =?us-ascii?Q?jqlh7AFX9TNhdpDPQAdhsfGWsNDih2BPwlt9GDmaQJvEdic9q+xe/brYSTwD?=
 =?us-ascii?Q?55nBnqXg+PyY2msKhqYQ9ol+xVBnZSdw9GN48SXYc0ZiIzu7I7WuPHkZWAtG?=
 =?us-ascii?Q?k6yXE/acSPHQ/pK/B3MrQuxcleNzvtrTqrV67JXubXpI1IN5ctGWOu/1VV3Q?=
 =?us-ascii?Q?+73gjXlCCr3GzIFrX9nkzV2NB3ytECW6+LhIZa8hfHxdVdwbC+2vwt8nSUe9?=
 =?us-ascii?Q?1Nh5PRXup8palME6v/fvmhR/v7KTuMszsHw/qtk41MZhXriStg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:39.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456c0682-8ab5-4f2a-8dd9-08dd10c55035
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9032

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



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5008E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.56])
 by mx.groups.io with SMTP id smtpd.web10.103533.1733756091218541877
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=IQf408B9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.56, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlDxkV5UlvZury7iuOrR/P8evMQzw7TmlnV1J5WdbdQp8Q13+ehjl1/RUaSlgpz7uJiczNKnK8lh8e10LX3NSqxYeQ2EtBpt9F7/LxWmZWnLSNF153gCE7BZ+pxrWbEmZcohQdBbpXR9aKbBykLM2X7TqiJBhHa3g1ranthtSKdR3C/NS1OFWa8U/rJKYrvmNn3ATOpRdGGv++7rfenN9m/a9jjUFCYYhIaKRNaaq9CwRXbuzwAPZ2FjeKdBJkqFMhDhux2JP9GnYzuzGlntyuBuUZjGE8q+s/zoJEq3PLla4+qYQ/vRG48a27q7a8+89iVHPbDeyFfsav9oxuTXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=wXfqbvJRabJlJLbkVVCJD0DtnRkCzYEzvF1hZVsUZcYkVu5raDQd1D7mwGkA95Ne7kK/83eF8f+zadzjleyyZa7FWg3U1C8XjWeuQvD9bdBEcUIluVvocPo4sLE7wxZzHzGtJybC0VphyuSNA8JRlMPKAHA6Slpb8qD3tjnrKSswaRNfBRfsqON/8Q+XI0ptwPYZQNPiJQ7m87VmByeuCeiC0lvfefbNvLvUYTTQ+XvG2vN/Id+oj6WZaajan49BhLd5QPLh6Z3tPDi/wJAy9eumWpobCDb0UXHYB59HqV5NZlG/6b5FVH5UF7L0lOUm2CIpKO8ykdroH4lEHhvmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=IQf408B9VoBVKjSiJrK9GSnDPtAETZtcz2nL8DefGLw3LpusGtV7xxS7Vmno/nCZHg8Ht0l3qMIgyBQvBXHs/i7aln8bNbD6HQj2zywLnOE/WuRln7AbyjSmILt1xfz5Lp1HgeD5wlSrPitXqNvaxTFkYRiAubdbv4fszkOIXuo=
Received: from MW4PR03CA0295.namprd03.prod.outlook.com (2603:10b6:303:b5::30)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 14:54:47 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::f7) by MW4PR03CA0295.outlook.office365.com
 (2603:10b6:303:b5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Mon,
 9 Dec 2024 14:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:45 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:44 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 4/5] boot.cmd.xen: Add load address to echo messages
Date: Mon, 9 Dec 2024 07:54:41 -0700
Message-ID: <20241209145442.3291634-5-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: db92b8d4-3d5c-401a-2320-08dd18616c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+VI3KI228Ht0AFXSpmPMI32g29zSEZUtH4PapVbkSBQzaqZQnFAZnn+9JJQb?=
 =?us-ascii?Q?3G1Y4vNVwrft2I9nBnuXnXk3pXqY/Nj8F4xQlY+Unq7Tk9wEThg81U7woYRI?=
 =?us-ascii?Q?VCZ+2WlTPJWHie7cX2c4yJAaT4Iy2a3T+H8yXSJhgR18hFO/E+P2SvLxxGkX?=
 =?us-ascii?Q?SrqIlS3c/gPp/s1Z+VT/uFvyCEsjLXBOOE03Oyn5wKoBANPt2sbskv+6DD02?=
 =?us-ascii?Q?wiPEjMir4MgB79EacBK1kIDqHnhqfUuhD6cdvKs7imcf7Bf7zBG1gl/VWkAr?=
 =?us-ascii?Q?rc3CswNPmws79DLalnkXkcltrGZySFXDXROWAHbI2ev2o6ztVcmghfrVaEYv?=
 =?us-ascii?Q?k8Jc8J8UApLXdkvctvhJW3S/ccrB9PbGk72iUNd5N46iZXrZWztKdefgHc7M?=
 =?us-ascii?Q?2PpaWtPG07UImWdXYdRdeqCJbYkIBU+dhRb1JpZpcE8rhw0JS/uSyiWv31E/?=
 =?us-ascii?Q?D7tvbGLfz0Vpme2s2SLyaqIMFMH7gMoI4Yu4T+PYia5jk1EggGgx+dYYPYo7?=
 =?us-ascii?Q?lWQjzIdXCjEMb2lyAxNRCJEaJx9cjxuFLWrZyQYzwLQ0EaKLkNS0P601Xppc?=
 =?us-ascii?Q?NDnh0uL8HdTffgFnYm7fxAvh1O38MisfHrqowqYMAI3nDt5EbWriB6UnRJk4?=
 =?us-ascii?Q?SVLCeoKp2eAoK+i01PaI/fIOVBLhKdm2n2jtV11xreL9LEGcz4rEVeXW80CV?=
 =?us-ascii?Q?Cvt3vTpv4+G2YTU4H6J99WnsO/DE7rrufL0kTJ8iHlux1yVI9PmwgqtBpUed?=
 =?us-ascii?Q?GSNJF06hs27Izlw8T0h6jxYjXXGGw/jf1wWMw/h3oKYDr1ZK4zxX69UZdQ2C?=
 =?us-ascii?Q?cqvTAG5B/ZUOa18UAOcqBTCBmAE3yqLa2IzrV2Z91iSCoGYBL1vnAJfid8Ii?=
 =?us-ascii?Q?SA6swcvYHXWJSLs/lSpdiyUKu/B6PJ+UNykdwXKj3jo9VTRBdOcn20rnuD77?=
 =?us-ascii?Q?6U/nDLKH5GvQiFctTJzlQ7zPWr0lV6p64WBnyssIMKH5r0DSXL6UbLwIDzA0?=
 =?us-ascii?Q?TkCm+/Mg5hdeWnsz2XPY6Qy1+jmqZ0HM3NH2GfiLakjB3wT6/ZzUm2aYedw/?=
 =?us-ascii?Q?ZDXZ41gr8mWfGQLeS5cdSzNR7G5Kd+hXHVv2u8JIKsgh0okeLfHokq7VXp5T?=
 =?us-ascii?Q?qPebWiUw0yaKaOgm2URpTIOCdvmWXiAnpdCSl6beOw6a+n2uaPlwsFEkP6MV?=
 =?us-ascii?Q?f79o4HJ2ssfL4qQ9emYe4uVC42HI9LyPIp+t3dVxJGw4bBcNmZSUAUeRP+7Q?=
 =?us-ascii?Q?ZDT6DOdjaBwlWLbmVa/da3U1sWM5bIr2wryIVZO0AxY/vOwM2Ei6VoBsyBTP?=
 =?us-ascii?Q?HzOwAUPrCGbMiyb8uSfcfS4LADpkqUR7u83T3vPzjwr8gZQP7MiLGZGqbJnx?=
 =?us-ascii?Q?CuYYqQ2pilwEgdIiUVxqnInk8HzeU9rB1deET3sXgYVsaVyv9h7KeVseNf6X?=
 =?us-ascii?Q?RUena2DuUzr574kTBE79ZEVsbC/lRS6F?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:46.7064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db92b8d4-3d5c-401a-2320-08dd18616c8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9048

Add load address to echo messages to boot.cmd.xen u-boot boot script.
This provides more detailed print messages during boot so user can do
self debug if images overlaps resulting in boot failures.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.=
cmd.xen b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd=
.xen
index 25e5842c..929f66f1 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
@@ -29,23 +29,23 @@ do
 		fi
 		echo "Checking for /${xen_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${xen_name}; then
-			echo "Loading ${xen_name}";
+			echo "Loading ${xen_name} at @@XEN_LOAD_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@XEN_LOAD_ADDRESS@@ ${=
xen_name};
 		fi
 		echo "Checking for /${kernel_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${kernel_name}; then
-			echo "Loading ${kernel_name}";
+			echo "Loading ${kernel_name} at @@KERNEL_LOAD_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@KERNEL_LOAD_ADDRESS@@=
 ${kernel_name};
 			setenv kernel_size 0x$filesize;
 		fi
 		echo "Checking for /system.dtb"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /system.dtb; then
-			echo "Loading system.dtb";
+			echo "Loading system.dtb at @@DEVICETREE_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@DEVICETREE_ADDRESS@@ =
system.dtb;
 		fi
 		echo "Checking for /${rootfs_name}"
 		if test -e ${devtype} ${devnum}:${distro_bootpart} /${rootfs_name} && te=
st "${skip_ramdisk}" !=3D "yes"; then
-			echo "Loading ${rootfs_name}";
+			echo "Loading ${rootfs_name} at @@RAMDISK_IMAGE_ADDRESS@@";
 			fatload ${devtype} ${devnum}:${distro_bootpart} @@RAMDISK_IMAGE_ADDRESS=
@@ ${rootfs_name};
 			setenv ramdisk_size 0x$filesize;
 		fi
--=20
2.34.1



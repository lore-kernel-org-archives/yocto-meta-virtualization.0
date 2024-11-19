Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA60ED44001
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:14:07 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.59])
 by mx.groups.io with SMTP id smtpd.web10.14090.1731993243910682779
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=OpMAoq+t;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.59, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPVoRZHS1JMMaUs/oUPG+C1e7Pc2kkUpFXy+A2UiUSgslylddLzir7QVKrAREKI2p6QLc9fs2eApGJsf4fL5cQQs8V2vkNLzE27YwB/mthXsu7saDWVREaOxH72Dbp4ywAAuHLu20+6l/lTl35IqRv2+fwA8e2vLAqSNlT7VgN/9hSxQrKVe908HAX3+7MZCP/+OrPP18pWnuKDIHSQ+KPjBQ4/VEoj/fcTGE8G+mcJ0HJBHSHp2t6+6hUx7aAqGgk2KjmEEWvc2c8KPCweT9Y9qqGwkV/7QlzJoWLWjEA1v8NUymIceZNGsBJfPirCSmA8/uOeqR2RYWzJtRLSx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=bbnmv65UfnVBeQY8dPAymGsaKPPcLlypcewlE9oapkr615AC+MVYDtVwJ4WFJeqjKmCBciedADELuVD7MDbj0JInGazYgBcG0I6hyKuueMttEkbTc//uEyGEgXBCsXE2ubHkKGtu4Hg9sCdJ/6gBWgf5agzJnac97jjkGftK1HcTUsm43T+mbkgmZ/eZzHLEElmbBHF9P8zKbQ2R7zOdzoP3xLPVgoK59LMeLCaf1i5DzggH+TsCJvG7zHpOc7UIGWUsnQnbGtb2tJp6nGAG1eJvLS7PPRWnTe/i7GO0qxlzq5KnS0fUUHFUpzavOb28yH2TRuido9M0O01KK6hFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=OpMAoq+tECBKW18bgKVxugmFLJnojx9PjH5w/NPjIBx00Jc7Aj90hdat4dZvNGrlzAObevo8RwQjfVowgSad5cMlKoTYsNkqEik55f6AxmVMiDRR1Xspx4hEwDY3147ubXTTYvQ7/6KigE+OWDf2Lr1Jcp7Wz/HzR0K/IUT9fj4=
Received: from DM6PR14CA0043.namprd14.prod.outlook.com (2603:10b6:5:18f::20)
 by IA1PR12MB9062.namprd12.prod.outlook.com (2603:10b6:208:3aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 05:14:01 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:5:18f:cafe::2) by DM6PR14CA0043.outlook.office365.com
 (2603:10b6:5:18f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 05:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:14:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:18 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:18 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH 5/6]  boot.cmd.xen: Add load address to echo messages
Date: Mon, 18 Nov 2024 22:12:02 -0700
Message-ID: <20241119051203.3841577-6-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e51c990-6e18-4467-210b-08dd0858fa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CwzgvrLJpqG+Amy5GoVJTVAMCf17nGEExChrWNRQHs3BUbvZvc3hDNEet8tV?=
 =?us-ascii?Q?hvU6gt9kw2SpN+BPIXJVzq4ahwyyS6CqvdbciqQa6Cnpmnb5xWujpjFEA0QC?=
 =?us-ascii?Q?htZoNazEFYjN05rnGm4IwP0vxGLXtyYC16mDjoJqNivoTOzN/LgAHPG6N3Z1?=
 =?us-ascii?Q?b+iw4ucIa9JsM2sKySCbcI53Rq1JORvyCwUMkkIQOvWT7jhwj4WtR7Cyn8RK?=
 =?us-ascii?Q?PS8v95DTxV8kckEniiFWTBB08PjRlS3fuxORlSdcnjD5Y648UszK8TfcvDGz?=
 =?us-ascii?Q?5+GOtyWk6ypYv2VvZi+u2hnnQB6B4ZJ4EuHmgdCYsJFNTHrowYeXVr8Io8Ez?=
 =?us-ascii?Q?YTTVZ02zQflP9vCk06YQAr0zo2xmrh5A5cIjbzaqYywyhOHiKShCbO1BCPPO?=
 =?us-ascii?Q?Uwj8KshvFsnsHA8e77bqgmzwfJB7AV+1Y2uiJt56q04D5A3Jrqo3zHLTzczC?=
 =?us-ascii?Q?Fc9cTm+cs6OXZRws971xLuvSOa/egC+nhez6DMdnqwSj8sjX741vdHhDUKOj?=
 =?us-ascii?Q?LRVzVDlOLYXqINymNNwIh4kUaJnvpq798Isz/s8AENqNNj24sUe2RJ+4sjwq?=
 =?us-ascii?Q?VWb0oac6A0FuiAeM9Ak3MXBmK5P+JsKgz3ulDmPodzfnyAewzauTdrCee05p?=
 =?us-ascii?Q?fNwoQAh207j+oVFkDXzRBwsYE0LjuRW1xdSWKtNeIVN7pudX0ba3fGhHLaJE?=
 =?us-ascii?Q?VFME6dNIl3LRb7+6QfqbaWr9HKSqt82OlzXXxL8IttlJq6Yhgv1oMm2LWhhz?=
 =?us-ascii?Q?1IjUXhl2dMPYlg9SZnOcDJQ30LnN1U+PyOHnivG1AtOvjYi77f0/MbSbcOsl?=
 =?us-ascii?Q?Elmv2lEegJ7qwNdBlpLQmia98Xa0RXb2TqsknQ9e3o0rfEe6GGTLY6UWRSZ8?=
 =?us-ascii?Q?YtgE0FF7308uXh3Ef9rtnNIKGfOVxzj5bMistI8yWxsyR9z/YvOmAIF7J9FI?=
 =?us-ascii?Q?BxkNpKuJQn3GPcQ/agbONLCQWOpV8qsSkYEs68ogzCPAUo/yGh4bImntCgPE?=
 =?us-ascii?Q?3aL5tAivyKa5miCIc9qMSzj98YhYJ8d24pBBkufVp+eI/dAQc6OdUBjH5mLg?=
 =?us-ascii?Q?pBELmF6VUbkK0Y5bvHHlHkv9WmPWw5U8IQvb6r7bD3HNSihvOeW7jT9XX1fg?=
 =?us-ascii?Q?ZEmjVwJaRkoqy530DKej1UxK1qkJdzYX7USJYOLg8HXtHH3Azt6LJ/510xyH?=
 =?us-ascii?Q?nea8F2gclzI9mMJY8tIh2jtlRpspLRT4CytfVaCYNZicW/vWHDn1p6F+9LIH?=
 =?us-ascii?Q?lXcTjFZB8oIIyP/hFbvEo6/GFT/vKfbXLXV2iw/tb110+8Oit1r8yT1eVWBH?=
 =?us-ascii?Q?u0rPmq0Mg+a95czcPrpiI+lEzeqUPOZaGAkBJYltlan/wBPD+hevJosDH8hf?=
 =?us-ascii?Q?JUJZdXK/GZzlx5jLj0SRiZquDJ0CVmgbFbAYNwo1+gRiWbQIWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:14:00.4877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e51c990-6e18-4467-210b-08dd0858fa54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8982

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



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D63EE65D00
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:42 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.48])
 by mx.groups.io with SMTP id smtpd.web11.11847.1732229378565298698
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=p2yvBYJ6;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.48, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIuP7mAFts4sV6NG+z3F3fTUtjnalnhCxuqqdKcyAWTONkDmsiPy0hoOsKqPu/yZomBERk1ig7noljAmYOyeLjSMcHXSg+JV93vKfiQZVNjm7EmJgsKYfXXxGS3PhbLZu9h6cDY+oXTr0dGAO5ne/BZESolBXJdQGwf/zcdj1WC/ZrOYxiORUrmD0L9z2uPkHk9XfW6Bi5FAWkWXWWOQzXRObL1leoN2EKH5nfNDlOUjrZScKfnhWa6EE4A/a1HkUyvpkX4JJxqib/JgJaraFxFSSMDUxSxI39DpksD7gzMRUTvNRLL0u0wwd/t544vEmb0ZfcGq8NNvD2a7DVVzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=VNXC+uELyOPnxPJyNNgjSDeKsbYCYvMSkGOOMpnQaaE3nMMOn357fQwlA4ShOEI5fxbOkTBVx0vTpxzz0T3US6kmgEs8VSX3RowcfS/bXG3JPNof4gV9w/urAFfmx5avkb+UkErA6xgzq00a7P5Olj9hCmWhe7FSZY4pN9nr8DFB2O4G9hciQSqbDFuRsSROurEQbasuJEcWPWD5dJeQfXf2DiQpM7mo0Cz/K90t6Q6Y7G8KYxeGg27aHFmd1qLXcnH+8hDQTsPs9lx7jvsicXB7rPMJF18hikOdPVklL6R/a/HF50OLmpni/xnD5fDlWhTdfDSUS0iyPFzMggOkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdnVBmee0YGeM/OM2bXhl1//wgJA1skt0RR+j+ICQCY=;
 b=p2yvBYJ6XAPxVOR8nm/s0I19xLs2oh31HZkMwZ0L/vDnqgTEIFqToSD/QsRIRY30qUg0GYXd51MmsVe4MdAF5tHs/1by7T9KcXaMjMjnH9NUNVNPwLpD72UG9McuxH+EA4v/I2YS3GzI2fQyTwxbbin4ShoM/jrupJD+kXPicVY=
Received: from SA9PR13CA0093.namprd13.prod.outlook.com (2603:10b6:806:24::8)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 22:49:33 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::9e) by SA9PR13CA0093.outlook.office365.com
 (2603:10b6:806:24::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:31 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:31 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v2 5/6]  boot.cmd.xen: Add load address to echo messages
Date: Thu, 21 Nov 2024 15:49:28 -0700
Message-ID: <20241121224929.776765-6-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 831e0cc0-4215-45d2-1927-08dd0a7ec460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VQCQIp1HcoNu2YQce5vDxocBUrY9ZdWhMJb0fXqhQx/TTVch4yDXuMgjGPMH?=
 =?us-ascii?Q?F+Oi2b2uffAPf89vM0lNQcgHukL5t2A9H5bU01QM75/BPMBX+J/7BzUf9cmQ?=
 =?us-ascii?Q?Y2IKvvERKAyBr3kMpcuH2wj11csW14L6oQd1gKT4RlYiuzy6xvJ8QG9TEnhG?=
 =?us-ascii?Q?Q2e9Jwiy8cI2CUWts26/5OoW1sSffA5tmeB2vdZHCUFow+PLxpWqquGK1Hgc?=
 =?us-ascii?Q?wASuoQyQeOoOwlz5/d9gyXynGfJn4dWcl/yqkBwpzWTk2bkTz11ljIOOMeaZ?=
 =?us-ascii?Q?EI9LUar7KZHd24poFfct6mBVdmyfl0TITQZL2PA4jQIWCq2ZJ/NppEXB0g5/?=
 =?us-ascii?Q?ulPHthTm1AY0tapnWrfKnFZRZZKmdYwP+z42YxcVm+nk+NGotX3bRXcx3fj6?=
 =?us-ascii?Q?kWFYwVE3JvNRFadQFlAiyNhc1KgPyaO0qjZzsIVWHUmXLHVJlE/efX7dZLSt?=
 =?us-ascii?Q?kKBbVw++Odt6mZmYIbHFgwumW5dS8mReIZQMkS+eEamSaUmUyPap/+hIkV0j?=
 =?us-ascii?Q?5SvVIjZOAVOlQeMRdj1427SanulNnvhrVgMzEARi/17wpsdM6yEVR1Q2dn8t?=
 =?us-ascii?Q?MAPrvsJ1q0K1ymhQXUsstFhTxzh/1/QugNmtEDLIcnwFyjsnqIz0IdL7jM3+?=
 =?us-ascii?Q?ug0R4iPlWVUL5vgIBG7mDVYIBCzYxxUA3Po6frh7V4PQ7lEQxXRxx4CA5LnA?=
 =?us-ascii?Q?O1WC71rUkwu5qC1QpwUo34cD53+z7W3Qvagh69+/dYyJLHvplI+ROQHLbXQ8?=
 =?us-ascii?Q?h92wDf2/gVtovFyjfkUQ+p5UMgscMBRYtElwfg9m+cHe8tAQffdAxi//FpB0?=
 =?us-ascii?Q?ws0xN6ZJbItmZShOGWxTyltZjHpSb5/KQGDa1kLbUxamJ3CdHnsoX676cudz?=
 =?us-ascii?Q?NQWOgqX7h+BQGrfS93DrmyfJ4WoQk9Mr6KoW4bg48PU3ws6g70HCYjLsWxtT?=
 =?us-ascii?Q?SEHMuhBqrt8CNBX7m+22JUjWSkmHKEmf1Flo/q8VfrXhlMbUotcxmEAYlUHN?=
 =?us-ascii?Q?WlGQn7jtLSE5UcU04BD0hMcq2u1z9N5rfdU4fEg/ixRsfhpFapn6m8TKjJcC?=
 =?us-ascii?Q?v/cdM4ioupzaA0wD+gaATh/BbB7z3qPyzgozy3QfAf3NjRt530zTNVrv0FY5?=
 =?us-ascii?Q?3eM+rTbPzaycxE0GJ0bV124V4mLF+9ZmXlRb/W0Qmaymjgn4lF7241aW9XBf?=
 =?us-ascii?Q?KJlvBu89QBzU+c/WUJGh2J1f9uTBnyxUfzbZyAJpFosgvb1wVTyfZE+QGJyj?=
 =?us-ascii?Q?IpkcT2yR4hrBM9RvT3Pl3+3upU4MGmxnF8VS0n/Z7FC7r9nZpKUkol95tHox?=
 =?us-ascii?Q?FEdwwfVx73YwQzlYFhAj5EhFqU8/oGe+wT0u4iUtfb4E1BnmI2mMSKtDpVSd?=
 =?us-ascii?Q?S9i/2C585ecQ7oH8IQeWwSpEO1Y2ROECBSXo1gxnFOW98IDI+A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:33.2330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 831e0cc0-4215-45d2-1927-08dd0a7ec460
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9004

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



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9305D72A14
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:46 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.46])
 by mx.groups.io with SMTP id smtpd.web10.122156.1732911157870799176
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ihuYBVwN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.46, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhiFdgYrrzInE+NTxIgJQ9fzMq+q5qmJ37yOLCSffgwViXpimsShyL9HkoAheOL6DCu7jAWHFoHcE0lv9iffqWRB8vrY2rUFXNVZNvHO+SR2sQkNW73v7yD7bSENcyEhfwU4XfpW/8No71kz4u595tGBqmwnz+E6FxmAO9vaeSFIrb6W2lN99MGYidfDio4omBk2bzbgmrJASv5Se/UBILB/XGPYBWPW7VDs6ZT6HbPo5R1VKhMKLyf0pWq1pO0nqTGzzWUe3vuLqlTguLhW+f0JpluCUO3dhTKFi6WXseSDkL/5Ju1lQCNqyrSYYtC1gCmdjGMMyj1+WsDcDWkWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=COoc5UqUTvJSHNbfL8vACUdPT4rTRzmPrPviZEuUHRdO+U95TlpvliH++7NaZwxnbU8AAsYZ7W0BkNxw9RoR4Pa3n8ZuX+FjTOLy5DIAcLHSsDrj7nuysDgn1Cq/Cs3h7R1RGFeqEgBfCNijuJIjJVVfT57T3LAck47QdVPruZxr58qBOELuuzF6lZaiNCLqQTvxwwiNm1Ly3TLXPJQ9EJf4ov1xvzJdV7x0VHQ78MuI81pKGhv7eUyKpADpGSXWFXrwJzLOxVwCd0lkdVP+7dD0qHyVJZrNBO6VoecxL9NosBhiQyqncaPC5yA2XTdJfTihg9dcjfrYAk+J+49pzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=ihuYBVwNiyjuRtNwKb4ue8u5WLMhx3IIEddqUTM+B4L1ljWSKfsQZXz6OMWNM1xQh9AvIxDRpcthiQbCQ8pNFxmdCEzRHXNgsa7StR9pmdAUaTfadoE9WESqXnexErl7RCj+mof+35fzXU9ss8E1KF8mLYLvOaHsgQDgyc+ClRE=
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 20:12:34 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::3) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 14:12:30 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 14:12:30 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 3/6]  xen-boot-env: Move xen variables to inc file
Date: Fri, 29 Nov 2024 13:12:26 -0700
Message-ID: <20241129201229.3161385-4-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
References: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ee581176-d8ae-4a97-4bd1-08dd10b2299a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nf159vqgNbJHWBvkf0jyVHoSiTnU+qMDsLhXRidC9o/UnwMJ0MN6IijNrv5E?=
 =?us-ascii?Q?usEAxKVXK8W39x3WAcBl53dWSMvrT6t6jVM7Zkv8MrqS0wcoke5NEsljUAhw?=
 =?us-ascii?Q?zQZbg4/TCMb/oAFGQdXm1WgSFF/iuAk8YSoXkpBuJX9WSKR5jmG/reJiqKU4?=
 =?us-ascii?Q?nkFEGCAAbzFwr/3hUhDprAO5a4h7zT2C5119iLNA89j6aFWskvMi3YPmoSXf?=
 =?us-ascii?Q?LF97lgv7wZ7WXqzgizNVXHJR90Ls4v7D72zzrLaF0XUgJNIXr6CVA0TFOkC4?=
 =?us-ascii?Q?Nz0Xc8u3NfdMvCvO51iCB+7D4ebnDM4lJZoO2iB2mtzxlLDqQjA08comxJ2i?=
 =?us-ascii?Q?amw4JWxw7g+VwgLzkblPQd7BHCjFRuy3LW9CXGMR4Scwb9zLFVekBUEZ3oMq?=
 =?us-ascii?Q?Q8G6UpJmivenxtBQGuvuOE9hLk/3cOtAPNAhpExLw8HJx/yyA4Beo4+LHCdQ?=
 =?us-ascii?Q?IeDSeVWBNDuCdoXYxsNSbkzRil7UM7FLWjERocg92pu4NhZrDYFTsP8KNU5W?=
 =?us-ascii?Q?2HJcEc6MWsvwaKduNOniTsldVzBJ/Pohk0rEznC8mIx60dPa1w4VlfzC7zz3?=
 =?us-ascii?Q?T0FmuG4aGT8lY8ETxR6u3Hsn+EIiG5XIUNNTsuVQ//mY90VEIeUoyJSj6UxB?=
 =?us-ascii?Q?ivX2qiHvXRLnLVNh2FxaYTEyAnXNxycf4d94oHfmHw5AKElxI7qNI87Q9Ne7?=
 =?us-ascii?Q?ETsEbcOV4Okbip5R0C2PcVygJo0fxdEZzczJG0wVtpBWl+WIPggvAHij7BOq?=
 =?us-ascii?Q?Jk8pcfSxiU5pRb28yhQJKqyWmusp8QPyVJgJMrVK6TqPGYEsrQtJ5M1OTUIq?=
 =?us-ascii?Q?1orl8q1RN3vY+FJcQlnsJAE6LmoJ806/U39a8PjgCUzAL8gN02eleP8VJSNL?=
 =?us-ascii?Q?/YII9G3GHlTawKm1cYAMn5eD1YOXT9/P97t8SrRh+qZXNtqtoXiaZ3JYQ0vQ?=
 =?us-ascii?Q?HjdEsD43whFdFO8DGXV8Br/mvsFB2dHYrwRhBJvMen9A0WBSBRwNq8EFrfxy?=
 =?us-ascii?Q?wwwj8O0gFq3K4sRVknqGavaHlA2JKCKpSPR7uG0jAXVm1fLOgWCPBCpXCt0E?=
 =?us-ascii?Q?Rf5/rsCD9g7koCc2ekjomH42UQYEK8eMTHl1B5PiYteG9xDlV3YGyCN8KfEv?=
 =?us-ascii?Q?6Gjwhhl829u7V78/iDWqTLNcQWW1jNna/6o2G1b0c/FiH/ql+DSJb5bbcTri?=
 =?us-ascii?Q?dm8vrX7Lpf5F/IP1n4kUavv3PV9y9wmGAFUmP43AFgDtysslZaH/4ncGQ/mT?=
 =?us-ascii?Q?JLnsK+B/t1e4pk1GvbhdJTSPsfT5bkNgir5ftXIGpOnWetv3MiBG9Z0orCTE?=
 =?us-ascii?Q?35lJ45Zkjrt16qXXKxlFggHgZkFGy1b2/Nh4S431Ze/aJnJhBbZJ7Yl2ZY+p?=
 =?us-ascii?Q?8y9C5t3KsJUk+LByT6+uxnfinzTQsLiRtn2itCk2JKoyxDOMzv2DTcDeEAJs?=
 =?us-ascii?Q?mt4+YRzD6haw4rusrV00R5BuR0Fkhu0N?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:34.3898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee581176-d8ae-4a97-4bd1-08dd10b2299a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9020

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



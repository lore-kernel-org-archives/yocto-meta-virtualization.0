Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E331D72A18
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:47 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web11.123082.1732911159929168062
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=0ZOS0U3y;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.79, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nS0cOKk8FK9ybcPSxRA38RIX8sXYJcOlg7a13Ab//FttyvLHkY5j5K6zxOsDylRnaAdVxUl5+M0+09DyLlo0FaznsMtAFlZaiIhLxmvo1qPSdRhshgDbDqkWoH5qOc27wHFvers6qNu5uVbkvmvzsKTMS/+vM6JvIZfijRSq6loi7vs8Zu68ezF8DQHsSLRlVqWd9qUUkS9ugmtFBTjKbAdYVch+IMFcMV2zTrg71P3ns9vax5+meM3m3BpHJvWNDhAorvRNNdMfDw9IEjw+3VwK7FQGS3IZAolO+VI6Rutl8bUOgzE5/bm5RTUpilnab///oXjZPc0Lw4/+Iub5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=JMBUG77M3NgIQR7mxKvt5DFnK2yBL9+MurpgzZrtSgg3PU4yai1P07eKKmIeIk4g3SGSSkiq3x6NlmyYnWpQGzMOFmqDgWMR8OdPdeJVVqy514pRo3BydK4r6/EbiA6IykQb+yr8iqUFv9TmT+/IlOhTzNR4cQ6IeLkxcVhUHnzgKgpmxxKR9OJl0nDFmgI3aVqOuduKgqhv323dMfsdzbCnua3Kw8S7ioYWYYIqWnZqj3ggO3y7SbKHRRbEHVj0WwnPNCAQ7zSgHgBa7hh4GqM8tn0VF5M26J3ZPLzVSodvOCNxk/nyaKtGCklYJHDhD+RylWNAxP5/YNH0M4fBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=0ZOS0U3yQtDCM2NuW8NwQPL/caMUQxWPMmVEgtHiOPdKWixT0QCKPqDYDjCil6IM8CmK24Vuwaj5btXiO7CU30XdEcRENkFUBUSvvrwE1rYJ8wt91TfbxNThl6I3lfr35SnTIN5ueboD23tAt85IHOYii0WgMctQYuqo42PIswI=
Received: from BLAPR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:32b::26)
 by SA1PR12MB6994.namprd12.prod.outlook.com (2603:10b6:806:24d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 20:12:32 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::d9) by BLAPR03CA0021.outlook.office365.com
 (2603:10b6:208:32b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 14:12:29 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 14:12:29 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 1/6]  xen-launch-config: Add bbclass for xen launch config variables
Date: Fri, 29 Nov 2024 13:12:24 -0700
Message-ID: <20241129201229.3161385-2-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SA1PR12MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c223ded-06d1-485b-0aea-08dd10b22875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9a728OduhE6j0CdLmCcaslNOPIAdIVwhMpr9gBH+4Eii6Md8SPFDNUEIsDzv?=
 =?us-ascii?Q?WO7HCYCHKPiffDTyB2XKaVsVxekH2rS6CYyKoCZO8GWT1ROOie18HcW2F/0J?=
 =?us-ascii?Q?Ga9ZRT6w2Rmyk5GEpojfoz6vco7s/KfJTdHL0PuwVhPHA2k5tx4xmhPAUeMg?=
 =?us-ascii?Q?7PquAQxilIeFHdRhQuDODXzj4JcA20qCQD1I0pkZ9lFCmTRe5GP7E0NdfkNA?=
 =?us-ascii?Q?0TlltyuMmhZX3UNEgm2BTaWoGc1BtPhWt9eSXaZPgfH2yFtuUtBgQvAiWLj7?=
 =?us-ascii?Q?WAboETG2jU3LGhNq4HZWMNqwyblC6ikBVZwJBfIiqegrdb8eDytN5+NDvPa8?=
 =?us-ascii?Q?2pfBbfrWD08Z/rh+KKiQR+XfV62SLFaJVMqNxr0ic3R7K5rF08dokBM77K7R?=
 =?us-ascii?Q?DRTUiStVLbyzpo81rFKmrrD9XFMVAWLPqMUUV71LwN8F4Q7Ppuql3neilBI8?=
 =?us-ascii?Q?wxx8LnlLRAMC4/gZul5+p/zzcK+GwDCbhQHJvGtZ1IthYQf8jsj6z0hSpmgX?=
 =?us-ascii?Q?DVEJaeuHDtgs/SGDY2+bwVZ6AftrJKyjl2mThBwQ+/Vrae2KKC/ZA9oT8Tpz?=
 =?us-ascii?Q?9XkJR/duMKCTWPD595A2CicTReIpYwFhW9XUtmXZsxzgrRJmvT4Y0NOV+emn?=
 =?us-ascii?Q?y/daFiD5upBKgWhRNa0xUMwzMZTwS78vzYtQup+jX+wSIVNvSJl7DipCXv/4?=
 =?us-ascii?Q?p88Rvsqy7xa3tCnAnLgkFk9b1gTYAUV1kpamnniknA8wStjM0laBgNDmhgXn?=
 =?us-ascii?Q?DCC8z5SRPq3DPFUZlPl3r+Q9Dmtw9SHyG5crTENIeZRvaA7QGU5lDqgwf4ez?=
 =?us-ascii?Q?NGVqtMnuAaMoWvnOta75+/o5aAaKCojBoL7QUp9lWzkE18MKTPbk8Q/hYDVN?=
 =?us-ascii?Q?HF5lkpxi5CNtOikeo6EQpIu7/3iyBID4PBAxfjuRaxAP+96TPtlccdaXb2aU?=
 =?us-ascii?Q?bzlYIU6Dq6yFJQYFasADI3QhOxdQ4V4sq3u7FI/KEqqj72OHTJM6eF3IQYYU?=
 =?us-ascii?Q?OSk/jdkRRf6ug6T3SLN5Chu7HUvXCbJTUGJqEt5PMCZPNki0n7KCGEuUFFj3?=
 =?us-ascii?Q?OmcEj864t8/2anQOsjE7zaIqqdAplP9/0VtvvWZWbWBTpkLuxHx8KXGV/O5a?=
 =?us-ascii?Q?MFCq+CD17AONlsfubHj62IodP5G1Oc78+0SWTJ3m7IKqDosLNn3UylCDwxhs?=
 =?us-ascii?Q?4smpFcJrVOcbYTUpaEOrxjj4MwnjVK3uR4DED4uQy8j2+QoVW/Fqqj8VzQue?=
 =?us-ascii?Q?SdV5MwbSGXril2QmBpSQ5IJSmVhZm6ww2Q/vuFz/rI0vazz2jSa4O26CDAD+?=
 =?us-ascii?Q?V2ZrkowDYt8QlOegubyzmrzgBfZKjfJlZO2O3X6i2XHrsLfxkkLexitDrSYi?=
 =?us-ascii?Q?ikw8JuvQ991JMVQquxkmAjrx9aRjndVYqrAqhzjly1qhvU5ShA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:32.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c223ded-06d1-485b-0aea-08dd10b22875
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6994
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9024

Add a new bbclass for xen launch config variables. This bbclass provides
common xen launch config variables which can be inherited by any
vendor specific u-boot boot script and non-u-boot recipes. Also these
variable are configurable from recipes, global and machine configuration
files.

Variable nomenclature is aligned with xen documentation.
https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

Currently it supports Xen Dom0 boot and can be extended for DomU
or Dom0less boot.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 classes-recipe/xen-launch-config.bbclass | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 classes-recipe/xen-launch-config.bbclass

diff --git a/classes-recipe/xen-launch-config.bbclass b/classes-recipe/xen-=
launch-config.bbclass
new file mode 100644
index 00000000..df8287e1
--- /dev/null
+++ b/classes-recipe/xen-launch-config.bbclass
@@ -0,0 +1,43 @@
+# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved.
+#
+# SPDX-License-Identifier: MIT
+#
+# This bbclass defines u-boot script variables required for xen boot which=
 can be
+# inherited u-boot boot scripts recipes and also allows to configure these=
 variables
+# from recipes, global and machine configurations files.
+
+# Variable nomenclature is aligned with
+# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
+
+# Image Load Address for Xen Dom0 boot
+KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
+XEN_LOAD_ADDRESS ??=3D "0x00200000"
+DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
+RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
+
+# Xen boot image types.
+# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boo=
t.
+# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
+#                Example: xen or xen.efi or xen.gz
+# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio=
.gz
+XEN_IMAGETYPE ??=3D "xen"
+DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
+
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
+DOM0_MEM ??=3D "256M"
+
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
+# alias or full path to a node in the devicetree
+# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
+# XEN_SERIAL_CONSOLES =3D "serial0" or
+# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
+XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
+
+# Specify additional command line arguments used for Xen and this will be =
appended
+# to xen-bootargs cariable. This can also be used for passing debug cmd li=
ne arguments.
+# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
+XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
+
+# Specify the max number of vcpus for dom0
+# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
+DOM0_MAX_VCPUS ??=3D "1"
--=20
2.34.1



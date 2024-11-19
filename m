Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4943D60D1A
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:12:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.86])
 by mx.groups.io with SMTP id smtpd.web10.14072.1731993143885549178
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=E1ghyQx1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.86, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYg+woXNYQOQ8HnrNKqsZ+mx5tC37QjTQMidXTW4jU5xlBKKtp4wZxgLfyiRpbXIUdg3M0DNGjEcKQjbnAwgqK0rJEF+ZpMDyqa88xxunF+Zf2D9hZuBHt0QYi9SH7DYCB6Ei9qsAVoFThCqTO8xYX1pLo2cQJMYotD6bsR+RZHF3A/fLfy/Y3xTQ0HFcfBcSB0N/nSbWMv5CRYt7z5HZtQA7dEC5La1EFsQsnxPcR3Tay0eFETRQflox4minORrhN+XW02blaOWTaPYJtyjEMeTsG0MNQMbOHKK81hXBqajJxdzhuRE0ANp3wp9D6QZWPdDesRoIwxgzluKUXtm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWG7ERM5ZE+0EQ10AMF/7ukBadgWJwNw9ipYS1d3WRE=;
 b=vzjFvo9J/IAFrslDIvhkHQvRgBqwVmHHfUkbyCJ8135q9GlTtMrr6JMPq+x/kLP5dzGjHTUt2Sp9YgD6OqqWpyCjx9WPOrWrfy85+Nqnf1zbL6/rghckqc4XFOHLyZE8/z+YKvhTwq/JCDgAB/nZGB8sAmYmcmLYwPSqAhOE8h5QybHTNSlvuJsJoht1NsbVaIAmaK1pTYojuTNMyKEkkTUWLdPd56+6DiT0DFTeZEatZ5yf8JO5Yp8HWQgW0so45lLjReC2XvVP+juPHj4+14fIcaMXSE0YGuHttboQpqqmngRvZ/QfvySXw/qtd7LfRC/2oWGCKs+Ci+IkDXg9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWG7ERM5ZE+0EQ10AMF/7ukBadgWJwNw9ipYS1d3WRE=;
 b=E1ghyQx18hQVvA6nWErN8fDz10UB6aeMhL+bLA3/W7D5W+8SC6+/NAF9Bc/gJfjYFsTlPIUJ7MGbGg7LBwB4LQ9QDBI0PQQDzq5YBPRA5REtkVqXmQRgqBTBV2D0mx0KTj7p5xBE6PNgH8ZRXkW5ktA24TrvLqwnUB/IVtHjGt0=
Received: from PH8PR02CA0024.namprd02.prod.outlook.com (2603:10b6:510:2d0::16)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 05:12:21 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::d2) by PH8PR02CA0024.outlook.office365.com
 (2603:10b6:510:2d0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Tue, 19 Nov 2024 05:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:12:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:16 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:16 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 1/6]  xen-u-boot-scr: Add bbclass for xen boot script variables
Date: Mon, 18 Nov 2024 22:11:58 -0700
Message-ID: <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: b6927097-0dc9-4d4f-01d4-08dd0858bed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Uo/owa2B6n7yemaCLBB6jM2AXaL0MVzrusZG3ufvkmx8UvEc9UAfMKsjxCaT?=
 =?us-ascii?Q?mo39VsxKzXfY+NMBkAsXA6uCDV7VZis4I9BD74X6Gcg1Z5PLSanHusMDSODM?=
 =?us-ascii?Q?SLkpHFCnCSAl/XW9ThJuvNtVaDGt+6rgkrCBvztNNMOUd8sr42qH/KezZ+8+?=
 =?us-ascii?Q?3OlJpYx2gQpfLnQfH8ulNZdrIPioy8jdrhJ6mrJPYu0zQVIJppCjpc7tDZlq?=
 =?us-ascii?Q?tu62gml2dL2NDyOOVf1i1458kIagwG70/J1lza+t4S6Hqo7QZo1ZczvljZDs?=
 =?us-ascii?Q?E+QVRLIvlhqW4FHlg0O26Y7VJO/9nhqBLS5IB0UIPRu1Xtv9WX8B37g0AiHZ?=
 =?us-ascii?Q?pMtXkZl51hQlgnOCK75tWameIE5BDk5vnmnHATXJ0gCWrQgnHGqrL+1S1TcD?=
 =?us-ascii?Q?LPy6z/HsSQMsegxjZoWtF57Wme5ZaINAvAM3646BsHu9eMoXnI2pdg9Q4zKh?=
 =?us-ascii?Q?Ue1615XCVMPjaGFqyrM0QNcFBMHOYp6vU/3YWn8ps2NHhoG1QAiA7Eb3SHe4?=
 =?us-ascii?Q?8HLfcc7ouLk9rAzWHiSBEq+aTHpt22f/47YyIiRLfMlfRY7I9MtuBgwupPf1?=
 =?us-ascii?Q?HKC1poEbw8cpZLMjRXPt6EyTuDmj1oEX5VETRwmjfmRrbbICiRJJNlfhpSIG?=
 =?us-ascii?Q?i43PYjyo32nG3+Pt/wB4G96sdUTk5GtuV7+s1GadjTO6RnFOM+n8ivOw5mat?=
 =?us-ascii?Q?EoBaRzIJrJzT3sxLQtu1mA+EBkfxAKXu3OmsWTgBMJ/QaDxSWDm7Wp+NHRNN?=
 =?us-ascii?Q?fbvqiBtBjifGsjc4czU76NRUIDtUuwW/rBcZmZDk2ktoBjufHCSvRGShOCX5?=
 =?us-ascii?Q?JLqwS7w+LDucrUOK3FEwemoZu+ic+MT3JDD/ZTSTsyLfmzPzJe8L4Hgt4PWV?=
 =?us-ascii?Q?By7Me8p426HoJL//EeA4xqmjLPuGTKesmYz5D5kxdSsPd4VYg/jI5Zm7a1Ab?=
 =?us-ascii?Q?r9HnIiyfV15szWYQSK+LA4zycfNZP6/Q3o9Jrx/EvDiXHuos1bU0LahYcUnK?=
 =?us-ascii?Q?6v/TUn5FbvzCFj7itoCY9GakGa/vlTcCEvekQSIdyTiVQ+MlNCIpQlTN16GA?=
 =?us-ascii?Q?x9V4qZkbCRYLEmJCrKZNQSJuIDINB9cbOt3MYEvJ7LF+ftL8vmhleWHE9gQH?=
 =?us-ascii?Q?4gP71ICNNjNlXlewmkyoNW7bDmDJIvxbopEmkFPh2P1jdeirRO/R6B9bLuXR?=
 =?us-ascii?Q?EkKs+fwLaROaqKQSTqpoB/TCibQzhwc4Z+HEHDLPshOLTHJtgCd/UbYFwAJe?=
 =?us-ascii?Q?cFCSHcHpZbMj4mpS+Yg+h4hv993F5G12v7dhZjpWRzHf9aKtkYVWouIEkJSi?=
 =?us-ascii?Q?chmTvYOKovWRbGlGzRYaT0OgqM4Q9qXvrKRdcBm9OxBSmv7W7h9vsjkj0dYA?=
 =?us-ascii?Q?GD/JYDJ5DwgnHi1IgTDcqes1HoqMp4c9Ec6fpUmUUwhzJEZNHQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:12:20.5869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6927097-0dc9-4d4f-01d4-08dd0858bed2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8977

Add a new bbclass for xen boot script variables. This bbclass provides
common xen u-boot boot script variables which can be inherited by any
vendor specific u-boot boot script recipes. Also these variable are
configurable from recipes, global and machine configuration files.

Variable nomenclature is aligned with xen documentation.
https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

Currently it supports Xen Dom0 boot and can be extended for DomU
or Dom0less boot.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 classes-recipe/xen-u-boot-scr.bbclass | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 classes-recipe/xen-u-boot-scr.bbclass

diff --git a/classes-recipe/xen-u-boot-scr.bbclass b/classes-recipe/xen-u-b=
oot-scr.bbclass
new file mode 100644
index 00000000..df8287e1
--- /dev/null
+++ b/classes-recipe/xen-u-boot-scr.bbclass
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



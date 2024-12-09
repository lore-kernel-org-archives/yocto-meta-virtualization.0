Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A78E77182
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.86])
 by mx.groups.io with SMTP id smtpd.web11.103351.1733756089534933156
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=usRscw8b;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.86, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO/4byoIx3ANhBgBafbASfoJ+Q8jTAsbMwJl/bYLzAfZVWYnz0WCK7T/HUg4BPEO3pKADunWS2HsN29D+VEma1AAiOyA7C5w6kzXdNajGAxhXtCmxtW4gUjYkfpyzgarQcNBMunhy9h6QDnU8UrRC9HqWnRdUSva9AfZHYwHU3a0raL8JkRbXCP8ARIqTxPq4hgezPiiec+pFClUrYqp/sAWDIiLF2B5jtyxhQeCxM+VYbj6VJfU8DAV6Yas5oFvVY1QgsOBDk2Ks6Q34Y54sXRwofcxBLbrFe7Na1VepTATBB6HSlq43qlLcwLri/timWMrtle9m71TvWDf96/NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=ABGFoQfIEgo1G3osmtz6ZNNkU/JAzCGAfF/0wspIgZ+cTUoiiwh9zwzFVv7Q0mAE/k2Qt1yB6LemWcVvH9vHOl5uAH0AZpAKz7GQG/4TqLLRvojIwj8JBYolctZQ2yli5XRPQgPqxaJsjUV0ld5D5Stha4Ls3qkcoIgWn6CNIwU3spML8Sni+Hkok5ylhXoGHAinoiARWgsiFo5FzTzq8WOnIQFc1tG/q+YxOYGgLKKfhUFqUeCap1Vs1OjFmQKfDLSQgiiXD9V0lfAdBhEsKFgAr69MDVB8FjxcNVqbQqAcFDaexSn4ibbYT3m/tPF3WcFktU3n4iXRjfu5bDetVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=usRscw8bXODMG4qpAOfpt0FlwLir0/ciJh8TM3yKq5uH19jYLyo1m5sOnnjVroneEXDZM4eVCXq/5vKPJbxzCOzHGl36Qj3ysxJVf8DxXsMN0heA0FPPiQ3uztTHMDSQS2RPrq6M/QJ2iHfikVUC0MOUO9R55R6STQWh1mIDSok=
Received: from DS7PR05CA0076.namprd05.prod.outlook.com (2603:10b6:8:57::13) by
 SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 14:54:44 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::70) by DS7PR05CA0076.outlook.office365.com
 (2603:10b6:8:57::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.9 via Frontend Transport; Mon, 9
 Dec 2024 14:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:43 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:43 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 1/5]  xen-launch-config: Add bbclass for xen launch config variables
Date: Mon, 9 Dec 2024 07:54:38 -0700
Message-ID: <20241209145442.3291634-2-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a08a60a-0bbe-4e05-96a6-08dd18616b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hApbj8wC5PEWDNBmppSPupiEP8CZfKGWOPbBkNKM5gfGqv/G9dQEWLn84yMP?=
 =?us-ascii?Q?4xutnwV5C57XeHkuEF/QS6cQHeJ0EjhWANVNhTAPuNY4JcvUU2BVY8zWz/Rw?=
 =?us-ascii?Q?y7PVikxPQnhE0pVqFjvI6PApKZs6RVXuLyhBNIXzRPyuXk8hLFrl7aY4gu1A?=
 =?us-ascii?Q?MVl1yvqnM0lnTIHxfmXckT1H5Q41C0dVev0JNyxZb0fhbQ4ujy47vYDwQexU?=
 =?us-ascii?Q?kQw5sZHInEZmvwa/WbJ4HtINHw3lVEjlXZBLUsP+4WJpSy8NJpvaOYVw87z4?=
 =?us-ascii?Q?zG/qSlmtGLzjiyWZcR+fAdaM5PQkn130OZ4Ngx+7WspLKbZ4oktg0666O8od?=
 =?us-ascii?Q?foeUWFS2/tOhjg3PuoKRihQEQUvhEuBT3MV0gUsqwZeoin7BLP6yE4qJXxbj?=
 =?us-ascii?Q?T7fQXhOyuWZ1lm81/Q4XKhQA2EQrgWxyGU2Xc0X5PiZRiMK6/L9FpSWS+8WU?=
 =?us-ascii?Q?dX9HEkyHiI1StCf/J0hhXfAxwTXONrKzBmmpM5y95Sku9Yyu+z4elE/8LCE0?=
 =?us-ascii?Q?1GHHgS6RE0F+HNQY5dX2VgRGKvl8NQBOmB8FgYbcpeEVK5KeW5u7YhQAThY2?=
 =?us-ascii?Q?Ajp6sOqGbHu+bedHCXqvr4dq1HzDxjSKp3gtuEqIk7LowsO2inVICoxzmW0u?=
 =?us-ascii?Q?5xP/NLgphYUpDo50pVU5pSx0FJpvOJ6GaQBkUgNoUrbeeIr5+cDbOh5+M2kc?=
 =?us-ascii?Q?q/ddDjpZG8krPtYdugABscnIx74wLk5not9i0MU4xcT70y71PpST5MyXjEfB?=
 =?us-ascii?Q?g6WXbihdh6KepBvw4FDXfAvC8atXgyQuPLfj6SlvIm05Rr4YfAykB03gCVAz?=
 =?us-ascii?Q?QmdQH5YVbZnt78XO9m7mr431bFckMpsfP6LS1QfASVcYhbo3n1+sZY8HBuG2?=
 =?us-ascii?Q?a3tuUpEzZ3awmAxVrGfazeDLuYT1923QvjXDrrOxvjGJxQVeWiYsDrhjCJur?=
 =?us-ascii?Q?zKQAAFMyIw+KxrPWzf4OJyGddnfXsrS/e9Kmo8Ewf1JqZKJg66QxqO/NjOb0?=
 =?us-ascii?Q?F/MKh3ksVs4VC8oh6jrmgulB8JsFjYVZhIyewLxx8H4rDyl6Buyw4cTTBS5W?=
 =?us-ascii?Q?ur/1dbQy7YPBEGyDauyzfONaMlCyRHa14HtHu1aWR4sZTa+JFUt8GknwUC7S?=
 =?us-ascii?Q?dmvv3siUJMBPwIVPZRx7oomoKqP8TQ4NRvHT8cv6z5mZ49kfJj0zIrD8R7IV?=
 =?us-ascii?Q?FLveKXhAHpU25QsDGBiSXViDLcEJv4l7vZEFa8W6xhXG5zE8O5A8ZgDWkX3Z?=
 =?us-ascii?Q?HAkgD/8kNvOe4tj5rDwaCD3W7sqk54+sqmbNr4Ho8qMgq29aVSKoOvpGguOT?=
 =?us-ascii?Q?sCBW/LF/erHdiWbUboRLVykg4R3O4CrTl3usk7KIe/Iqmeb1ITL/uOikuNxn?=
 =?us-ascii?Q?B2tWsSxUVdysyMpgHYn1vuj7c1rWqrub9TuRI8jdsXAKTqZk14lmGiCxoK77?=
 =?us-ascii?Q?MNXtqpDsHiXf4m/ZKa8Hjr8EJoWKt8GZ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:44.6894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a08a60a-0bbe-4e05-96a6-08dd18616b55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9043

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



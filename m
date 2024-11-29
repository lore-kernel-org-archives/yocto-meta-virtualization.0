Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5064D735E6
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.58])
 by mx.groups.io with SMTP id smtpd.web10.124216.1732919386028475306
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=Rw2o8CG4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.58, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8LSq++uMi9AfPRDuL+femHvfLASK7JTyyKAVBm8szGewwLK+w0uFma1WOLpcWcmpmg7JtVMeQRFDXlA89bQ0aRwN9ltx8fj7+22qDnbeo9Cl9XXCpFzkcFw6EnLo6f2AolAXUqH7/IPIjjN+2L/pZOABmQZS4GLL2ewO++Mq+EnF71PGyegD2dDzU4ZMXuEBEO+Ssatq8/uQqfzhT9zd3/KRKV8+N55tZVMNIqiflD2HK2VNaq5b6uOC5bOWpLnsshU1qEVG6Fi9Ld6Ltdzmc88kN7l8CEabejii5B8+HMN8JD16BTtfR6TlrCSftGrFzM9bC207ag7tkRy21Lx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=rhyRqlQjw0JQ0BTiuEQJ6dZpa1ZQxuKgnaf/1+J53DWeKono/EwCoWHUJipYFeyVBjvqrhrciGxQXMD/xlgNVnW3/iIMW2vdKSs3L8cHcv5pzTPgNMXBfRh/6+wgxLA/Z+J2PDlQrg3DBUfcEkLxWX+mM3u7H3JiOceILvIAApKjBPVlf/l3psC4YREQx//nRklNmTv/nKWjWcHGW0uNwtf+9J9Ijkk3KT6+lYv+gRWLdRZKqWY17TO+JrZsqxYRynhoJFUnk3d6RNeIUpA3PiXO2L51NegGsEJsoRFQtBAs8n5SXqcRfFwK88YoKgYDDVxgB5haw9D8TuTR9NaHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mxnI6Hfh2AyEVARbEc0PC9Tu8Jy7L44bfVxbcyeh5E=;
 b=Rw2o8CG4a8wjpJg29sL3KcOvKeoVFLF1ynkg5jh9ohhdCqa+Br0j7V6tOQAHKEu4H4CFbVq4AtjD5T3yxDb3yk2LKQENnHaolAd1E1pCSH9jHnUiHi3GQhGKWOI/COFdeKRgUPks0fBjrhLD+AzPSIiqMyiJkbr2r8nGBeJ5D+I=
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 22:29:39 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::39) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.5 via Frontend Transport; Fri,
 29 Nov 2024 22:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Fri, 29 Nov 2024 22:29:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:37 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:37 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 1/6]  xen-launch-config: Add bbclass for xen launch config variables
Date: Fri, 29 Nov 2024 15:29:26 -0700
Message-ID: <20241129222931.1300310-2-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e4142e-8fee-4cc8-44c6-08dd10c54fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p6b8kpWPakpUiMFcg1Bb/EGHn2+JvkgugRLM6ilrBoTojRnxYxXYc+iRy3vo?=
 =?us-ascii?Q?29FsndwKVouSgXuBUc//pjaeCKvun6TpBRGVwnEOtADtCyAz3r7B+lHCZbAK?=
 =?us-ascii?Q?Kuj6JhVUpWqCWxhWt3hvdY5MfauIwVor+nLZu+SSFZEdKGrFTwTPSGzIN2oh?=
 =?us-ascii?Q?5iQ1lyLK5N+nBfnuS02v6ZZgO7ojKUdLLKjk5m5Kcj0DjOLmEYQ6p9YJxqs7?=
 =?us-ascii?Q?I884/8UU780nxnF6V6aN90qCITh2K6uF2ipiS6kkHquEvO+Rsrcp4BFPGM+j?=
 =?us-ascii?Q?/FnxNb6NX1ek89aTpYOHOHEOimu+z44fEVwOUe4FFgJUp0aQCVbVsXaSTqp9?=
 =?us-ascii?Q?BXaRk5EWI/mS15o3bEsj6mUh7hzlNSepUSmDgQlJzN+O0sgEyc5uKxcUfxTb?=
 =?us-ascii?Q?eJtRUYPNfidfTJPg0HOSeAID4Eo11LG+cd3vhYbqL7DfAzkJcpC/we6A41Y1?=
 =?us-ascii?Q?fOXKEqG3zu5z3XMPwfQROlWw3pjwPOlnXAUTAUqtNhjS8iXhvU1mqt1tD67z?=
 =?us-ascii?Q?m9lrH2hELfTvV6hLnVOrQtZOvm0Wgksy0fzSUauTLydEaVxJdNdJqOl5iqHn?=
 =?us-ascii?Q?iyzqZn35D3M9aLYF1fFCUKXjj8bnjhxt2NK36zi4HPen3bqwE6Sggg2N2aIW?=
 =?us-ascii?Q?5IOwwHzvIuzLJY/yV5qX4Bzx/dD+xUrjEhYA7XSa9V6Jwb7WmL3G+A9HJy3R?=
 =?us-ascii?Q?0CKbcwwtAsmFPV+cSH8m4FwGvwv+pUuuqbY3hL7oaMFyGHklX7BbbHZgI+/1?=
 =?us-ascii?Q?Df+sOwJFhj+L+gPCakN+ZxnTG/IK5vCeSAd/do/k0ezkrhlq5ZDgjDWiP0V4?=
 =?us-ascii?Q?rrBkYyOIzG+5V7VzuwSlZmzqVz2YA4WnaEoAe4tr3zRkHq6vGGoEiCFXPE9x?=
 =?us-ascii?Q?ko7NVV1Wm6bhkwOha29iLZQMjw74EqoDWxTNZ/xgvpjrPYpBgnWLD94z9Ucl?=
 =?us-ascii?Q?C4z8OwqpMyApuh1NimS8VKZ60+X/RxScVnvjnSJTdsxLPmcxpFAOxAztBG/r?=
 =?us-ascii?Q?rGqSy5LwMj0Rp3FSGYTUNampGjFMQIdKwmIL5J/rr8a7daSduQFkv6lUp81F?=
 =?us-ascii?Q?FI5LJJJwKqMqw5WhBTeEuYfCgulrhHqyxEWN4jnymXDPkks9X7knu7MY4/Oc?=
 =?us-ascii?Q?/Zj5KDJlBLs7ytOuDVzMLVfTkJCZaKI6BAWEhZfQ1oE6aCMk/fVf9vs6YNtT?=
 =?us-ascii?Q?furX6dyAHPaN+isth5n/PWJ5AHuHICetZErAyuzahCZH9Na9hQIyCv7Uu+sm?=
 =?us-ascii?Q?RDMo7wYkRlJ8A2+QBeHQwAymirBn1uj1t8DVt4+taVfd5RxRpQyqM2XTmQGA?=
 =?us-ascii?Q?EpNxym4dS3Lsrm0HWHcJKXlomtvzfxBnF2ThWJTYnmX7EApUwzsfQfR/f2u2?=
 =?us-ascii?Q?53LqXyw=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:38.8954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e4142e-8fee-4cc8-44c6-08dd10c54fca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9029

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



Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E604CD735EC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.73])
 by mx.groups.io with SMTP id smtpd.web10.124215.1732919384440093532
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=cdiXmoMw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.73, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaHA1mRjHY73cUGloS7TXEM3IDS6F2GqvWrD9lWBh6CPtT1eGgCYlHSd3oQ+caCU4jiX7698ohcQihBcf58QjAIXy2yE4OFNdrS0OupHr17O/nO3WP1RIwBPyr+Skkl8NzgwP/xDduVVzJ6TIH7Uyn+iUjshXFQKngXIR/n/H/y0JI5oqyLJMaeJmC+aMKFiah6/CQUfq1OEpSwqCk97ZnttX/rCxmBxqKrwKReXKiDnBCLbeUCxFFLZLoIvBxYrz5tUzvM1mkVQ5VPb6yZIiRxjdAC8DgPlXJiQQrPlloTV8cN0+aS9VQs8gWUHg6RI4jbwz9z45qVNwG42pvv33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=kCpcCMJPvKu1gECZm9ZUKc3jwUiRdlrsebg7bG3TlQNs8G6xbTB4ifzS+GiX7fJikn9SPML69Y4fW3pElBc0vgzyk+dYtN0hvifWHNksCjLUkkvM5dhXqxw4uWnqfaXqWX8lUz6cj70/sRntiIkoTYZgZnAxM/o2ULiZF1Po1mCvGjIVo7+xYIaMrbQ5WsGlHKKTHyA/wKVJ7GQcyKJgM0pGXzbWkaIywbPq5l7sJZbXY3tZQHBuozzSu7UJTW/dHhtj1otp8IU5JU5IxVvIQ5alTrRQql62vHiHZgqW4gzywQxVcSDj9nbqhMlicFYQgNz1hR5jtWjdst8vFSVaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNCB5uaVywQFSF7RK87yy8hVQfKcKdaKBNLoXwxQrw=;
 b=cdiXmoMwrDEa9p6YTbKXj1Xfa2kxD07mcnbUkJ6DKzitPhXn+Ej+ZY0pcoIZQXPYRFxmDs6ORCzq/1QipvNGLizvnPzj24gJHnZrdIXo3LzVbWrVumxsM6fhVWE2PkMh3Hi9P7/wGh66AtRsZcYx9k+23cA36HZ1X925PsmOMec=
Received: from CH5PR05CA0013.namprd05.prod.outlook.com (2603:10b6:610:1f0::26)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 22:29:40 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::67) by CH5PR05CA0013.outlook.office365.com
 (2603:10b6:610:1f0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.5 via Frontend Transport; Fri,
 29 Nov 2024 22:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Fri, 29 Nov 2024 22:29:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:38 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:38 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 3/6]  xen-boot-env: Move xen variables to inc file
Date: Fri, 29 Nov 2024 15:29:28 -0700
Message-ID: <20241129222931.1300310-4-sandeep.gundlupet-raju@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: f7376035-6ea2-4f63-8974-08dd10c55092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5CBr29hWAGSqJheHhDZqrfX/Qu6maZVtbQ1UQvTsrwuqfi2XiNolDYkKqZi0?=
 =?us-ascii?Q?3oM7n+xfbjV3qjE2vmuLE6x1uGxrRjFmzyYVj1ImlTBoTgsVF8lehYx+yHV3?=
 =?us-ascii?Q?9HF7UFEm98GlIbHEs7Ix+UUOkszbzjn2gwfhlJXFVIhed2scJ7c9JJHs+xqi?=
 =?us-ascii?Q?75UZya8D6Red7rbR7rU+TjtmsOzUs0Lj9fIsOyBKoW7tni14tq2ABeVklirV?=
 =?us-ascii?Q?vWASBVKuAVoK11h42yNEXYkP62s1mV7JmpFOQBNwY3IWCw09T4wDPJt5A8px?=
 =?us-ascii?Q?LWt5915Pbe5cKdsKn+0J6BQ17o1Sgv3oid51UjOF7ZY1RCyRHd0vT4Wsl14J?=
 =?us-ascii?Q?/vl7Fiw9dnTsxqXw+J8IZio57LSPVB+kNZQTRxulf7coxwT0JCNX6MdUHf5Z?=
 =?us-ascii?Q?ob39NlOhxyksaHekeEUlJarvnCiRg+G7/LxZxjdhLjv4OXxtqVhgEwwgFYzr?=
 =?us-ascii?Q?sEKem3ia3eBsz8ULWL6p/WsDgWIj6KIexSyWhvpTakLgwqMonyDTBjKyu+/W?=
 =?us-ascii?Q?ovIzBJPUOEQokAseVwQw27lqxYydzdHF5qZ7DB1brvhPHq20Oiz+Z38a6sSu?=
 =?us-ascii?Q?BqjNxSzZZzpGVApzQg/JrOd1BfQcezi4h7jDym6TL3JjWzNUOCHCxRo/mXCu?=
 =?us-ascii?Q?AXpaZY3FG23Djv2xym3Yxs45KDCbnlrABSqz8Ts1xwvNHLrQPH8LQO7CPd03?=
 =?us-ascii?Q?A06oFzRkEna3PLg3Md2kBYBxa4DX110hJQQJtMfceTOGWSlrzk0tgMCWX98X?=
 =?us-ascii?Q?4U6BJWubjEEhqnsp5x2FN+6mI/KAW0Uef3wHpOlPzfCJDZ7xY3EQ4dxkgyWQ?=
 =?us-ascii?Q?FMTc+xCn446jtJ0X1vbpIjRBijuZGUcfOdCdRq6wOpBczc7+DNX9C2vTBCbX?=
 =?us-ascii?Q?b7BGCnQ9P6/6Y3H5TaBJnSu1J/SxU8+hP95JMUloPJvMMqtmBZoH/ncCNa+S?=
 =?us-ascii?Q?t3PWzYEMoshMkDaHY+2Ez5bIeSfteOA5CkSM/MzIIJjdGwI074pX+G6O5ome?=
 =?us-ascii?Q?tvo9fUwtzh+JemRS/W2diG9cR85EoYop/yNzncqSt1kBxYKupAi9rpF2YWC1?=
 =?us-ascii?Q?jwI1QFNH+QH0JQREQAGmTeclMuXhWcV3Z3gkvZljsXT/XvH38PFcTBUuUGGE?=
 =?us-ascii?Q?A3GDjKAmThLhqrUpKYJGU0r2AXSE5v0clj8/wq9AKC1DnAPq1wMsfyw2xqXP?=
 =?us-ascii?Q?1SLlEjDmsVpjnrv30LwZQ0Dm9kK5Cm37h8G/s5462MU+ag/51HeRBZGXahx2?=
 =?us-ascii?Q?XH9D1sg11GBtajoulPmBBBkd4VRUMHvm0hXpQ5tosmgU+1aC1/w5sQ7vZcVe?=
 =?us-ascii?Q?VBWeztY0FQKv4/FB5Q4vpCGiqxDlwYZeMe9BVIIaCKh4b/Cdf5pTjZAoU6M5?=
 =?us-ascii?Q?/oLEPolH6PqQlah1R8VnCURImc/0Dc51Y2omVhuQ7S++TlboXg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:40.1923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7376035-6ea2-4f63-8974-08dd10c55092
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9027

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



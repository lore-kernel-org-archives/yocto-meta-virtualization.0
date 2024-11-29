Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5116D735EB
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.68])
 by mx.groups.io with SMTP id smtpd.web10.124217.1732919386248386189
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=D1jIwaAN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.68, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0UnCMDhfZ9Ldg2a9mxy3aeOrfUx2LhubCvLNgJVl1d/B3Imy41h/KIQvLxOGb0AahMnCFoyJj/vvFIaSuol+9ytE4p/eaoHmhunKWZ9PwzoXGDEZl7ZC/iWckbjqWNtU8QsRg7hzTOCzn06+XSjFvAgrmjyy9wGQarfsx7Tca5JbIP3NdK4THhSk/2Gti9kL+dnA/BIY7dSNeTzWqpjdVHOBauyRR6jOlfWzacziSxYgWcG+pjzEy0SFUdPUbHqRCQWjq0xekUSSwOCOhz5tHHLwFPSjG9RU8aPPWCGVBUi0IDhNpAL2mSXGgYrvc/JOXCSxCaD3IlvZoSQd1SClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgHKbYchzkKXmkeb1U4FCTdGY+H2QIeLvsnMSJkCAOg=;
 b=VqU0DjBW1QqDOz9XtFjMFHlt/7nasumIVtoj9OAsYfzkIINqggf71TPZwntDJnUKL4xK/YqVC7gue/r54X2KIhcOf5zxKomAHjWKu2+RdRRtg/Q2XZ0O8XcSWsoaB4NU4hP+EiHiq1UY5kQ/PyCmn/j1MprSxZObhBrePA/64onYZ3NF+H2Pm4Fwp4r/PZBPoaYoc52ihhXMdnPrJddJXSFZ8RgM0pMgeb+51H+HOTZFEjqCKUtS63MW7freXkasVAcaLCGLqm0gRVS05l0ikpfZhAVVEPoDiwXa12B6KmH1HcnzNIBf4tsZYDhjnw902rXsF6TKvqkU9ZcHNb4Fhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgHKbYchzkKXmkeb1U4FCTdGY+H2QIeLvsnMSJkCAOg=;
 b=D1jIwaANFR4vA1IWwydkS9JWD6wrPQkA5BlZWppzsyfyxpd5zvx6JtK7JMwBSVOfj+qNA3TWut2A2Gf/vVmzl84wzTHNcYk0rDZPKIeUjmWJTNjeQOxWyAOeASZMY+oqn0I6W7skQ0OLkHagean98bZSg8KqlO8q2VWeBd0xf70=
Received: from CH5PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610:1f0::16)
 by CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Fri, 29 Nov
 2024 22:29:41 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::30) by CH5PR05CA0003.outlook.office365.com
 (2603:10b6:610:1f0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.5 via Frontend Transport; Fri,
 29 Nov 2024 22:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Fri, 29 Nov 2024 22:29:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 16:29:39 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 16:29:39 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 6/6]  xen-boot-env.inc: Inherit xen-launch-config bbclass
Date: Fri, 29 Nov 2024 15:29:31 -0700
Message-ID: <20241129222931.1300310-7-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0ea7ed-925c-4953-f8ca-08dd10c55123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s4NW0CisYhRkHNjL24SD+vKBfdZtjKb5awz8IX+eqKVPyBTfAsBeu2FQ+Gjv?=
 =?us-ascii?Q?zvzezSvAlaUEa1Z5UXpU6XH5rUcOSPw1cbE971FFEubkniJKDlSSwL+TRuGv?=
 =?us-ascii?Q?3HuKxz+lLzWS1ZhZLRsU9FNQwzkLe9eBE2ChAlm5BmO+JJEWdQqNRXcl4e9A?=
 =?us-ascii?Q?TGMD/zN3Dx5ny6w5oH6Lue9T+zSklDEUBdTKnemAvlXkM47vb3TH7G9zl1bO?=
 =?us-ascii?Q?hI3XEpybBBIdB+S41Gpp5kRZXyOzL7YhTK2ft7qGauByHTcr1zgxAZnUC0lr?=
 =?us-ascii?Q?KVLfIRKHw25VuIls8Mgs+OS5VxDWgCi81T2LB2GWxZt5xN9bHwDRPn53N3kD?=
 =?us-ascii?Q?GDxwUnMF+kCpD/+IrPXSNlvF7CLFhk09QtOrxisZ4PvJajxzqcIXqaB1uDPd?=
 =?us-ascii?Q?vLVUNZH4E7Fludl8mxoQvu0YwnpwTZeGIZ6aXY1Oaey8T2H2Dz1+GPaDHjQ5?=
 =?us-ascii?Q?gtiXb7JWYNx4Ph2+QE6/Ma4ii0W69PgPSbObAHSESK45PTMRfyjsuHbn3E2C?=
 =?us-ascii?Q?RxcL2lxESWKms16il0cwNfi5SYVMaNpevkEHvawxfl5N/H9oiGyT/MIiGTPW?=
 =?us-ascii?Q?uw5ZnYeZhcAfJ3tAMqLL32G+pigpXm5u0SlwJ5SaP3UulxYg4Y6cHXNqmUW8?=
 =?us-ascii?Q?N+Lwhl11bi0oB0B/Gd8LfeGUZIwrw6mH5ktS09bWlorSKR2EBga4Era7YEAr?=
 =?us-ascii?Q?uHTPZF1sXnq8Pw2ejUFBR1tuIOYgCY2CBmkIstw9TGIeH6rSKr4TXDXlurGn?=
 =?us-ascii?Q?qrrde+vQoVt/fQ7rWnsLbJ5hWFVbxeEI12pY8YW0ThrTbIr9dkzwTD9qrbUj?=
 =?us-ascii?Q?dAD092G2O+GlMFPoL0GJ7Wn/gbz2NEZjqG2B5j7sCr2zyOIDx0ceoICcW3u3?=
 =?us-ascii?Q?GcQZy4Dp6dbYSvnmSvJGR3VtxKyB/zorCZTill6T1/jvKqrbJlAHjvIOj0F5?=
 =?us-ascii?Q?ZHH1cSgNuwY5e9/NqFnxOC7jfuFo4nDpCgS8sPsu661UhHUOUaeQCU19Md4f?=
 =?us-ascii?Q?k+UVOpdTz2T7BNLwVstPH1siXsYpoWWyrXLNwLRlq0zjl9N4/cC9+nF/M/Ga?=
 =?us-ascii?Q?O0WXxd+ZPRCdkJyObkJx1j1ByKnH8EGcXDpWq0p+SCNOvSz4p0dCAFC5AMjZ?=
 =?us-ascii?Q?eE3rpKXru9vGWDXN85ZL4r5pjFKpexnbpOyV5m60oDtBrMX1D3QPJxDlzpod?=
 =?us-ascii?Q?CBrw0ZR41X/uy5ymg+YCaVgwxkZEAYiSBZXbKxTYzdzCfjfOD9te+Cc4nwd6?=
 =?us-ascii?Q?7kgzt5Akd+makwqVDY0ykfqtAAlcMptBxuIRXk5Z7HIGUk6Ff6nzupCLy/AF?=
 =?us-ascii?Q?Iu6sJINlZlUjEweFts3eaVadxrc39GHFpiZfA44KNOx6m6Yo9Gtv0k2rgqCr?=
 =?us-ascii?Q?Ew4cm0z7GjwZmUvyWhhg/KJ4vhk2V1Bt3S/RxG6p2NsP8ubxUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:41.1454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0ea7ed-925c-4953-f8ca-08dd10c55123
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9030

Inherit xen-launch-config bbclass to use xen launch config variables
for u-boot boot script.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
index 9b9962a4..53f800eb 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
@@ -1,5 +1,7 @@
 # Adjust the variables for xen boot
=20
+inherit xen-launch-config
+
 # Image offsets for Xen boot.
 KERNEL_OFFSET ?=3D "0xE00000"
 DEVICETREE_OFFSET ?=3D "0xC000000"
--=20
2.34.1



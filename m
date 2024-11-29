Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A82D735E5
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 22:29:47 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.51])
 by mx.groups.io with SMTP id smtpd.web11.125143.1732919382167830665
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 14:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=iC9s/B7W;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.51, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvQxvNlgiwNpF5tIxYY0gU2hiN2qVqGQRntz3lyzQL13KVMdDgL73O6FuU19NElf4TQHU5IlCK75o2Olu0V1BvPLgjhvIDw1MDE/U4eAgP5MSNXyhmQCrkkWAg95EYPWaF5Fi5u3bI8SiCY00lc7RMmgZOr90Bt0Sb/iHlDk8Dc8XCj5J8bu1g4xBM9wBJRI4niuD2UNNJELtPiFeHbXROE6RiMD3rQKSzngwjRasaBI0lFODq5jS5k8WfHOlwgrTb2ePRI6rz4o8hRKIe4/WNTwdQC7wox9rewXuAJTrGkS0626ZKsN/wtlJ2ZJKFtRkZhKokg5Rcba6r/vrYC0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSK8Fr2QBlOifDnlfHHKRgMAdJiC6G/rl+yZ5d/IoUs=;
 b=qfTIaXG5zzXBg29OWo8tiicbHXTVbH8eej1hnAYEaSMXhy4gwEZmpZOuW5Ikq2Mrfr8sWGl1U9etCWZ3KLIDfDWygzW5AHoR6AdcNTAEOKYzDViP2bwNDiANOSKhGSrrfke87ZqMdmHytO65b3RBEEhx6tkV4gdgf1U2LUEpjtYnNL7uLWONrmtdosNGBH7ZvMr+cvQImCHD92qfBLnITx7JMZhvfRV+1rDt/ESQYJ92CvE13Lxga/cynsKWjIZ7cO4Q7CWaVho5+hU49SYR0Dyao+H5sVUP5LgsCyuLHGfND2XR5nyxRLZcwaEoz5SlekqRDy7LAD7RYBEyuLWhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSK8Fr2QBlOifDnlfHHKRgMAdJiC6G/rl+yZ5d/IoUs=;
 b=iC9s/B7WVt7AF38IHBfX3kcd5PaZl0Hf59DhmDkXxZS/2VvjaIpgUx7VT8yCjxY2ytvQ4k+Nqai47j0dk8nDhyajm0BxFaAQbEtfcIYy34mrkUkLbk8/61zE2x47cPJk1A5bTow89mMOv7gVueY5LCx/5RZRrLfX4X0dR0xJlvE=
Received: from CH5PR05CA0002.namprd05.prod.outlook.com (2603:10b6:610:1f0::8)
 by DS7PR12MB9526.namprd12.prod.outlook.com (2603:10b6:8:251::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 22:29:38 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::58) by CH5PR05CA0002.outlook.office365.com
 (2603:10b6:610:1f0::8) with Microsoft SMTP Server (version=TLS1_3,
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
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6] Add bbclass for xen launch config variables
Date: Fri, 29 Nov 2024 15:29:25 -0700
Message-ID: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DS7PR12MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 90768269-b892-4259-0eb7-08dd10c54f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EuJBfhzVm1KgZFMtUV4Ozi9qmYx+kVA8nIM/68u0pesOi0ykfbX1dqNiT4Sn?=
 =?us-ascii?Q?YkL024FMcqro6m6eFTC5XInJAJAo0MlH39z0cgzrM+15I8wKCQmQ+0Erpf6n?=
 =?us-ascii?Q?/XpIesNpA6GyhRmnmFA+C3nCcLudgTWNBaaaz1F5SKnVY8kJlHprLuomq5MC?=
 =?us-ascii?Q?iIfNQoqtYdtw+AQASWYXvS9nZUg67LqV9M00/UrGOv8tS0U2Dgk8wNR0fPCQ?=
 =?us-ascii?Q?lOyiGYHeB5pdOb2G8+4Gz06YF/m+yV7N36CqqtLNOMj0PlJDuury4YLiqSHg?=
 =?us-ascii?Q?5Bd6DF0boeSIVcPyJ6zhYyGUWVpDo4/pQA8HvkEzHFHCF7mUOvIMZWgEDvK4?=
 =?us-ascii?Q?6mFuwXOF3z8/YuytU/+K+GP0o63NWKi1qmNoN1n1kcwonWFwBTkTZBe3KTfc?=
 =?us-ascii?Q?p96RELqh7hDb8YYOibOHzC/gqAgm3shmAE2U1YKoZjVbeKwJT8bZxeMaRFub?=
 =?us-ascii?Q?1Wgp9WGf7xTiERD2vduSt9bdRHl0m9WslZumVB7yAXsFw7MhuL9WvaGmi7Ar?=
 =?us-ascii?Q?LdUu0zof4b5zSzO1l/p9LVu/qvMLX7WuY1T1rgPBWXY5DORbdbEJ9nUWN/II?=
 =?us-ascii?Q?r6bShzb1U32ygu5IGgjOP4+wXnk7QxwjD0aYhZ+FVRLga6E6cBwHKOQT1+3f?=
 =?us-ascii?Q?/dlFSP+WB4CSvYPCF2SqpGKQlTNYgFB2YLbHx3L7ph7XAf6pmTO1lVcHIyiy?=
 =?us-ascii?Q?hTxr2FxLugKVeeUOr2KWn0xIWoAOzAEzQnft4vEG7TwuQnC2iPBN5Ga1yOCj?=
 =?us-ascii?Q?/ocnHscgL1gKu8q1jie3JXyyYdMQTqD3LsbSFxW2rRgDuw1GdgckJv5PCtu5?=
 =?us-ascii?Q?TIB4K1of4SfQsccS8HK6IDz/LWl2KSrgDi5u/uT9xiVbYVtIztulCfo8vtNc?=
 =?us-ascii?Q?F6EA8jt6eN7N8A9gkBk/8UGVz3Hb8AJqAdKUlVuTv45iQwooyGfCGB4mR0mh?=
 =?us-ascii?Q?rVIRJuHYpQGxu+V9qgDgjZq65eA7/dF1dzFyGPdg+MgPXF6RoRmLeI3uFLby?=
 =?us-ascii?Q?gOFEZrcFuG6gX4SvUHZUU9l7IKOeUPmb4U/Hl255sM+d43WhADdKaJkmtehg?=
 =?us-ascii?Q?78jBFEnfTwozp+LfiJr2yKgGP6DFi/H1ITyl6+SS1BD/05Inu/V4u6HUNxvT?=
 =?us-ascii?Q?VTgSVhB9AIXlKYNJiRot7rATuoNra8cxRSFkvVjJoS3hRk6tlGuGTSX+FXSY?=
 =?us-ascii?Q?RmMBVV+dGMJvGVoCk0U16Yt+GEIpENn1NAIt4M51b2dVtpWdtIKNmu7WFWkE?=
 =?us-ascii?Q?l9u/WSQ8MAPqAT+QuoJhT1OBR3kqxYyz4+juZrkWmsgzXbyhTHrQKP9Zg2q0?=
 =?us-ascii?Q?bXEGzSOpw3KLZxJZS9sLT5F14nKk8NNvwUjROVeKfiY9stS2kZK1i/rFvdkw?=
 =?us-ascii?Q?TqHswVmRoZ4boq6v21mWI1iti8PdxdioMvDDU839eq75CPsROw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 22:29:38.1142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90768269-b892-4259-0eb7-08dd10c54f53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9526
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 22:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9026

Changes in v4:
   - Fix xen-boot-env.inc by inheriting xen-lauch-config bbclass

Changes in v3:
   - Rename xen-u-boot-scr-configuration.bbclass to xen-launch-config.bbcla=
ss
     as suggested by Christopher Clark as this is not u-boot specific.

Changes in V2:
   - Rename xen-u-boot-scr.bbclass to xen-u-boot-scr-configuration.bbclass
   - Add comment in u-boot-xlnx-scr.bbappend to specify where BOOTMODE
     variable is defined.

1. Add xen-lauch-config.bbclass for generic xen launch config
   variables use by any soc devices.
2. Inherit xen-launch-config.bbclass in xen-rpi-u-boot-scr.
3. Move xen variables to xen-boot-env.inc file in xilinx
   dynamic layers.
4. Include xen-boot-env if BOOTMODE =3D "xen" switch is enabled.
5. Add load address to boot.cmd.xen script echo messages.
6. Inherit xen-launch-config bbclass in xen-boot-env.inc.
7. If user brings in their own boot.cmd.xxx file they can just
   inherit xen-launch-config bbclass and use the generic
   xen boot script variables.

Sandeep Gundlupet Raju (6):
  xen-launch-config: Add bbclass for xen launch config variables
  xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
  xen-boot-env: Move xen variables to inc file
  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
  boot.cmd.xen: Add load address to echo messages
  xen-boot-env.inc: Inherit xen-launch-config bbclass

 classes-recipe/xen-launch-config.bbclass      | 43 +++++++++++++++++++
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
 .../u-boot/u-boot-xlnx-scr.bbappend           | 13 +++++-
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
 .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
 7 files changed, 103 insertions(+), 50 deletions(-)
 create mode 100644 classes-recipe/xen-launch-config.bbclass
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.i=
nc

--=20
2.34.1



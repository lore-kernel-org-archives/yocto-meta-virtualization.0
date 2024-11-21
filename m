Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A5D78768
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:42 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.46])
 by mx.groups.io with SMTP id smtpd.web11.11848.1732229380287844305
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 14:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=fk1scQmK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.46, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtkvMm/ZwQoeJ3hCgj9mIempbUqfI7iY/Bc9RJaZUlWfC/aMP/G1WmHn8MNLu5+5Pu/PYfGnshcvis0D4DWOAiVmQQkDhjS1WM5UHCqjFGhsVA0D0a3y0aOPZjpR2w+kiWTSfteUxcfeR/tR+AgICPP1zUlZZRMlRKDrF3OFOsaurW/5TdYSY8Xjbo2oFhttzE8h8HT61zapnzsvh5jKl49VqsnPymzksN6IUYbYz1lnHzqnCqqB5kvpmOoy6s6eYTWtxj2ulVpBGcb9yrS9v5373DJ9YJsx/1Q28yDyY3PgFJwjKbpWXFS27kD9/yTBP0RFmOSaB3BsN8/1wE4JFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5poGzoF1AVuyfUzt5G98AGLJl7DNdl0uObDbD+k5PM=;
 b=DPbxI+ZiHyKjn9VfWtiLGQbbpmqcT4W1IfV5rIJnecCjI3uY/2pf6FEpZxs/jWZeG3XT9gd+kf0UYsVVO1n9DhLpHHxcA28LsCsXmWc3rzF5tBY05aju7YDauHEoJj9K4op4KH0EIXTAI27StSUIACn5D4d44oeD6Ilpsj1iFVTKGVht01+7fzZtH7zXnqzj1zWWK897Vt7t8GE8lgkiz1lsJ9oxG15DRTl+RFKntw5I7F/W4HcATz19WLiCDZStZ1BaH7MfVLcWU/TpZYtSc2sCzb5GdWKjsdfPXiXswbmOdCVGCSPSBVpX1NRHB9pwrGTwmedv7szYjqT2gVtsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5poGzoF1AVuyfUzt5G98AGLJl7DNdl0uObDbD+k5PM=;
 b=fk1scQmKyV0rZESFDeLj5PZj6lihfkpUBVcgIz2+9+DFYryDJHXm3P1tT+E43t+zxdWCC94LAZrddpFDPHALt89dswxSz8l6yn4Ef2aCSK94F2DOPzd7Fqf0/CNtJzxsFZujJU2B9V90uJCtc3bNjs0L1+adT34C0Fw7aKHPpow=
Received: from SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 22:49:31 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::e7) by SA9PR13CA0097.outlook.office365.com
 (2603:10b6:806:24::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 22:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 22:49:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 16:49:29 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 16:49:29 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v2 0/6] Add bbclass for xen boot script variables
Date: Thu, 21 Nov 2024 15:49:23 -0700
Message-ID: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 0baf0f6b-3a16-4e30-c9bf-08dd0a7ec2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1dlqEaYX0pxb+0ghA2Y4E8xpBPncFv6mvwQTPI1rR+0Olixf9uEEQWkYf0Rm?=
 =?us-ascii?Q?l6SPxUNjVLZAGlYhcprV1X8spbN4sJ2E6cL2IyfU//+hVZsLlYmxc7Q2cAo7?=
 =?us-ascii?Q?TI2U9W2/8tkjfCnXuue+a5pzKxZrOiKtwsXTcM35WBgKrigp8EpX2m+qb3wv?=
 =?us-ascii?Q?VFd8ngZeLG+OXaVsNQx0CeFetCMoKidSOcP2JEI+Y+6Xnohihwt6NP/VW2wj?=
 =?us-ascii?Q?dKKqewnPFWTkJhwh1nKNWATJgDcGr2VctRppS4mlBQoOh02EVHvjRk2qK7Q2?=
 =?us-ascii?Q?DSgpqmZA/mz7BYQhHPMVv+fyvqd6nqzX7fnCHr09GyHnLf9GnlMYYdYsvUeY?=
 =?us-ascii?Q?sI798pbihApkTn22GwFeM8hEtYZ5J0WhklBEdD9a6N4BP8Kt4+ym73Mj7b3U?=
 =?us-ascii?Q?oxLLQHKAU5YDTFEdYyP/jzOAa9rnFS0uMidDd6PjPMGzqRhW6s6Mh74NkfXZ?=
 =?us-ascii?Q?u8I8Gq9w6+OSL5HsdO14VF+AwlE6eM6hB9B/mlZU/5+yfftnB/NI4ELQ1yLH?=
 =?us-ascii?Q?k5NpQjCQkty0Bf4Uy5TA2awpl6aIoznktt4pZY00VhBQaTQ6YQg8xMFD9ON6?=
 =?us-ascii?Q?uCxUbhO+26u1YY65JPT2hC7rgoJMtpcoDHnVzleStUXRRjB5VBTgL9qKRlwg?=
 =?us-ascii?Q?Ro1MYBRqyv42v7li17xuO8/S11vU17MbDrMqQ8rKpcxUZqb9YpLU4/r8OBr6?=
 =?us-ascii?Q?+EFnhi3+xHF8tfVQCoFZ3HbGAGufTsSJAqEzK2weQksPjdEZdtKaCoEz8Iuj?=
 =?us-ascii?Q?+pqFSaKJFmTL3xrHGvd8t1lgYddGgeFo1xf9K/8tiobwUUnenO1BGLi9y7PO?=
 =?us-ascii?Q?oYTeeqkKFbYacqvrkcY2vuJg/ZkoRkHGdjeURxMJYf7wGuTYkjPLp0odpNBS?=
 =?us-ascii?Q?IrKzbS7T6iIxu10VY7t3qY8rII8vgXooREP4mi9CJQspBUv8wzoCNgDHACBG?=
 =?us-ascii?Q?TU2w5Evfp4LHzjKf1hWPKUeQ6BQZsQK5LvpQIN5JUmHoEJN1FM7Ov8BDm8dX?=
 =?us-ascii?Q?esnSfmIKkPYSS+1ZHbsTe2T6gA2tJaEkfMQskK03ulKivHggOR/IDKlFdu+9?=
 =?us-ascii?Q?WvR5bQPpy6d0KaJoxNik7FXq7LAxMRC0ks9frRncZzVuvRhbujc4fB/jhqx/?=
 =?us-ascii?Q?XudBzz16XDwg1kge3/ktSrD+T/+cdvDhzRFGBO5PlomXC7cSlKytv9AMO4W5?=
 =?us-ascii?Q?Ty14Uv/2sSafEdGm/tDs2sH7twgx8B7ysz7v4Bg2Y85n+JHB9fvyItO4trmF?=
 =?us-ascii?Q?Gll6z7qUOFPOc5wwPadBcyf5CXVRRYVMLO4ior9qwko9yOqvF7MSb7tjYb+P?=
 =?us-ascii?Q?AXKqugEXNYjGqyvFYpkycHl2z6rIEgUsC1CiWz3aHZIDHb5A+WDtRwBYJdJs?=
 =?us-ascii?Q?NLGBT/Y2Gdwdni1JeUB6dWgjG/MkDfwLstu2lk8frtK14082rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:49:30.3736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baf0f6b-3a16-4e30-c9bf-08dd0a7ec2ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 22:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9005

Changes in V2:
   - Rename xen-u-boot-scr.bbclass to xen-u-boot-scr-configuration.bbclass
   - Add comment in u-boot-xlnx-scr.bbappend to specify where BOOTMODE
     variable is defined.

1. Add xen-u-boot-scr-configuration.bbclass for generic xen boot
   script variables use by any soc devices.
2. Inherit xen-u-boot-scr.bbclass in xen-rpi-u-boot-scr.
3. Move xen variables to xen-boot-env.inc file in xilinx
   dynamic layers.
4. Include xen-boot-env if BOOTMODE =3D "xen" switch is enabled.
5. Add load address to boot.cmd.xen script echo messages.
6. Inherit xen-u-boot-scr-configuration bbclass in xen-boot-env.inc.
7. If user brings in their own boot.cmd.xxx file they can just
   inherit xen-u-boot-scr-configuration bbclass and use the generic
   xen boot script variables.

Sandeep Gundlupet Raju (6):
  xen-u-boot-scr-configuration: Add bbclass for xen boot script
    variables
  xen-rpi-u-boot-scr: Inherit xen-u-boot-scr-configuration bbclass
  xen-boot-env: Move xen variables to inc file
  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
  boot.cmd.xen: Add load address to echo messages
  xen-boot-env.inc: Inherit xen-u-boot-scr-configuration bbclass

 .../xen-u-boot-scr-configuration.bbclass      | 43 +++++++++++++++++++
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
 .../u-boot/u-boot-xlnx-scr.bbappend           | 13 +++++-
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
 .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
 7 files changed, 103 insertions(+), 50 deletions(-)
 create mode 100644 classes-recipe/xen-u-boot-scr-configuration.bbclass
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.i=
nc

--=20
2.34.1



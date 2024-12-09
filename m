Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF57FE77187
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:52 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.57])
 by mx.groups.io with SMTP id smtpd.web11.103352.1733756089633554907
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=K+tF984N;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.57, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tselA2o/I2oRLsHpXNvcgtwL1isLHvotJOd8BAK4UVoiN/bM/gR4QVAEs9FLuD6YK7GEOrVHI/dFYrikFJTa5mytwwDkYWF8Gc0DWM6Ia0lCSRsLuAScexIz3o+3bDZVTDnwohzKgWu7CDcd5wcSIZ1rJvyKyk6kJpY4pqzETCDEDv4+4G39hWobh0s/QGhJINGGmZx21a74KqEBm5HR0B67g7NTbXjU4c03yV9Fk2M3SupbiVyK6Z3etLCkEwaW2SxQNXWBUPr8AA1H0iwga+WCsDv2LJ/HbCGkqNx2cWaseQ8p1uCtuYboogIzjCJSRPV2UEdi4Hqeaf15aTz8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSJpFUOpNqaqPPOtq1EsUZ2E68de4WPZQP+U0FmjddY=;
 b=vsds17yh9PMVnMRmn1alTXczUaTEAmiVweQHBvGP9GyVXFpUdKatCZn8mKdsPZ8Sm16qbfeiyJvxENrwKpKd/6T03PgS+bO2JCnjqy8SZa52qpXDbxzkw3AMHQB/aeMFbDnNmcD1K0L1e71Q+Dd/DZEQ7hEFsu3hTz3GX44Ns5GC01gPL2fCcosTk+1R81BUZNKao5V9SNs5B/itu28XUFFHztM8wzVFJR3QswcxYUl03vNGGoLMCsOE3rH8dHoeW7ICdNyn539NZlSJ8eCX2+9X+8FS/Hgf8qZvOKT1g7uD73FmlGOy8TWaPF/+JGwkEdJVGsqaL1PXawjqNEtZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSJpFUOpNqaqPPOtq1EsUZ2E68de4WPZQP+U0FmjddY=;
 b=K+tF984N67qUuMYoWPkIYXf7UICeALndOhsgZPRsnYD/pGk2e3TbTeCD/N8x+PqDtpPE+gR6insTb5mCwovIcepdd25mBQK46LJeWvdE/WpEBdzoQ5GEvENpf+SvqyniI0IDVKzExxWUh/GGBPWj9jZZnSFkYG/p1BoxYDE84K8=
Received: from DS7PR05CA0075.namprd05.prod.outlook.com (2603:10b6:8:57::16) by
 MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Mon, 9 Dec
 2024 14:54:44 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::e5) by DS7PR05CA0075.outlook.office365.com
 (2603:10b6:8:57::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Mon,
 9 Dec 2024 14:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 14:54:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 08:54:43 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 08:54:42 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][styhead][PATCH v5 0/5] Add bbclass for xen launch config variables
Date: Mon, 9 Dec 2024 07:54:37 -0700
Message-ID: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2f25a5-7f65-4137-ea2e-08dd18616ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ksnV42A+Jmxh5QmQuFTJGUFVgApQ8e0C9Lh/y+HPfjJqmsKngbnmJY8tX7ye?=
 =?us-ascii?Q?b7MTUQ1Ctv7nFD3RRPsuV8/Faw3XuRMAshGnT2ApxBFIc1Z12rZnPqbfX8r/?=
 =?us-ascii?Q?B/6fMz2ABvuI6XSUtEXu1n0Hh5qj4V0TnHhHuXTphjVRw1e34CfWAhhZzXjz?=
 =?us-ascii?Q?XdLl/KS/TSdCEjx2G7OGj43fpYg6CjGjx4X8liGodcScRpP60jWyrUQtMoL4?=
 =?us-ascii?Q?aCuPUUkQtEgTEulIB4AmQa+qlIfZ4B4f5zkl1qH6h4DcsqJGKa6NHPdC1FST?=
 =?us-ascii?Q?fPQNXdAmfrEvCKEO/qEUdL5oJrxF4yzq77DSa31+D7usaFDR1DB8oZAmJ8eV?=
 =?us-ascii?Q?TgVZ5kTW1lVjTZ128PoO4FLvrzGKoMTAoy62a+7W+D2hgxotS6dqgSi59mdh?=
 =?us-ascii?Q?qAIwlx5bGx4hK0CeYlYc1VeYv7JdDaSVUljzQ6BXezZvbwfLJQLMwhTSaUUy?=
 =?us-ascii?Q?jYHX9KGddSBqYtD7QhWJ2d7t3O0mxwbpynPqmE25rIhh18J9yNuwFE3I62u9?=
 =?us-ascii?Q?YyFqx0c9SpDvT8ffWR1X6qDWHET+I2ieOnlrx601dGlYz9RDyRkXGXFSOfWs?=
 =?us-ascii?Q?qPd/tFUdIXqQaYa1y5MnCywkxxhdPi8hDWO9aee578ywPKbZYrnrJiHSNJ3K?=
 =?us-ascii?Q?ryvCwbLm8RUZglLqMPV7R0TUjY/2RxGweynE0l0+AjscYD1rEX544cCsGNDW?=
 =?us-ascii?Q?M481JRLT/ieKvpXgpFBgiUoz8li9E+0NInXpAyEsXOigw0vc1YjFcezymOKT?=
 =?us-ascii?Q?XEmJ1PaarQjQ0Vb/lYAusi+NAWB3k5i2iK5wIbK+e4s/iPsm87JtG7VUsgjn?=
 =?us-ascii?Q?HjvkxFnTI7gXTcnwDmb1EjMXIweOYXR6EPWR3SBnawASKA6UT0LVxSbZ5yms?=
 =?us-ascii?Q?xFbY4Pm9UtSySEV/AcVXQvoojlEu1yCL1eZ0XQPdaQz6tcy7IC7Jo/DCB/WV?=
 =?us-ascii?Q?H1pN2SfHSPS3Ghe+Bkq2Hs7H6sF3LIbouf1W9V0qDs5yV/Pv4ZTLH0wsF6b5?=
 =?us-ascii?Q?keOqgGhe/7bNvh2SsKVXUKZDXjwQJwrs7Jw44nHXU56Q/B6xST7y5bLgz5IE?=
 =?us-ascii?Q?j2YM6lUz2ZAQ+mKpjUFm6dGaKKHEH6vntb9P9V0FIVS8GhSqFWLFjxpxWjD9?=
 =?us-ascii?Q?f7NfaQA2Lh55i847A/g1hgEzapV3+m/emWI3z+cBsH8bDUzSU1HoNpTZtKVN?=
 =?us-ascii?Q?wFafjs1yAO5YwI0ZXYX4FpeqKLDxG8O5yGHm21z6YiPXSfTbglryRmGaYo5k?=
 =?us-ascii?Q?kyQiTEffNjLRdr1IqKRV4bK311QMr9YyvmjMFXHIWnaCEdPU8eL17er25AYX?=
 =?us-ascii?Q?k9HK+z9wMKM9cJaUA2Bwx2ecJOBs5pXNkd7R/jo7v+cOheWMBRkimJDNSp4+?=
 =?us-ascii?Q?sJF9GXP9u2Z0fiZ+StzdGOMyUF1ePBOVX9iEe9iJIp1b4ZK9c9wu9ozekZ6+?=
 =?us-ascii?Q?JsGjLAje4KaobzHqIlhaV07n9nyWz9j5?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:54:43.9862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2f25a5-7f65-4137-ea2e-08dd18616ae7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9044

Changes in v5:
   - Merge below 2 patches into single patch.
       - xen-boot-env: Move xen variables to inc file
       - u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen

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

Sandeep Gundlupet Raju (5):
  xen-launch-config: Add bbclass for xen launch config variables
  xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
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



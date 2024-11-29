Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE75D72A12
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:12:37 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.55])
 by mx.groups.io with SMTP id smtpd.web11.123079.1732911156239389525
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 12:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=WFP+GrCM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.55, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysygPWwszflAbyPB8Mh8t0Oo/mfnMzXT4aXkDUCVgy9ng+QFFnEC560AOYW2i7FLbOCAj0YEu6yzcaWatxWFqv0yg7LuhCxsmkyEgY0RBKYyMvRPerSdV768zTdkf3IiU2A2Bumdn0Ot2wdmE2vFhbf/uGh9iuxy8VkpfF9tq2CH1chf5ENOnyYPuEGpWuG39+BmL9HWqKaMVgyR+ds/3/LsZgx/JzK1LohaqSMgN0LzL/bVmkdnMBsSKqrnSli3MWHg8IBso/+HyuWz2V0hX5xoRU/aFH1jjn4LHmwAAZ1dyhNfuGDV5iuadmNHxkyiu1dwYmyL8KOMqDgiZFxLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0pLQy2maQ5Uy6wtRlCIk7pSNMoGCz39dpw7r4Tv2V8=;
 b=SYqvRn4TXJ5fgR9oo9+vPAsbcQ/5C70KNfIbo8J9vqI8vIhMJgBJ/tNu4Jh3x3G+i2bkvEhZ4IEX/bjI6aRqhboonT1DESxMQN+NnLvFsNd9q1ooqfNsFI2P5xffmCzQb/nR60NZExQwZ37Q/DTDaFhCxFHYF+4LBN1OhZfimVd686ptW9SDeYmeFBfilFVpiL49N5iuYKWtDZ2Aa1+Bg86K/9yOX4QiWnJnhwsZ91vWQLGYuGmXfVZnTldSUntV5Dk7CZIec7qemrBeTPYweU/9Qdcb+ZHoJs5NWUXWQY4r+qi1MV/7+BOVPFTu5Nnuh4nbM7NF9UxkJgf6ke8kSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0pLQy2maQ5Uy6wtRlCIk7pSNMoGCz39dpw7r4Tv2V8=;
 b=WFP+GrCMakFWC6x14aVyPmqtuHNsJd/7MXIc1EK53IkSAJ5iELIxy6sMXlLxbXN5C4Hn9O7WAoOrJPjUWFoa1NTQ3Lcm54Of+ID+R78i6noBSKtvBNrDr/mqo2IDA3kaqSUYJC9IyFLYRkqa7Ogv8tLfbGz+Uikg14K6+mAJ4hY=
Received: from BLAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:32b::25)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 20:12:30 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::ec) by BLAPR03CA0020.outlook.office365.com
 (2603:10b6:208:32b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 20:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Fri, 29 Nov 2024 20:12:30 +0000
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
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH v3 0/6] Add bbclass for xen launch config variables
Date: Fri, 29 Nov 2024 13:12:23 -0700
Message-ID: <20241129201229.3161385-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e2eafe-1d5c-4f2e-b999-08dd10b226fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zou41P5B1VoVCAgsOWFq6tfm3ADIz6V6megwuBStgCqVWEg3BeHxShYYwada?=
 =?us-ascii?Q?IolmB8NhfK8r92YI0VErgFHV5OcDNGVei21Xg1EjiW8ji5XZKfX1yhMyfp5r?=
 =?us-ascii?Q?uZ6Tnq47+XMxYddp4DUx8ScgA6oPVnRXNqWP4k8qgmgzr9l09jjj3Al+D0nW?=
 =?us-ascii?Q?l8LsH/xr4OEyCZktavrNkKbsp4WQeRXpcro4WeXa0oUV1YvpmVKn15wa2/uc?=
 =?us-ascii?Q?FiNpd6Sjd5WWPEeIE9ni7yrFZ+z/t6l8KfQDbHoHgGLuD0pBSemUcnt3PHDN?=
 =?us-ascii?Q?T45KWBaq7dSgpcoqVgKiU6msDnSGLksGy02OPkLIOfbLYMZFOGK4zZIG63gU?=
 =?us-ascii?Q?pPJgT4tGtjABtLlSSYnPWs7CgqcLqypglKgfj4rZFauYLpcTqk0GSWNOOcdQ?=
 =?us-ascii?Q?xSSs+8TZA9DjSuowB5K1nz0GPh8jM09D2g2T8gj4YwDtdQy8UfjRVe5N1jMX?=
 =?us-ascii?Q?muzYiP4eiZGcQIQfmhJR/cgqlmQwcpDvKPqFo4tew57PVg77P0PM2xpPICu1?=
 =?us-ascii?Q?6YyvmMRL23UotTySXQYqBXm4blgo/CHTLWFBdm8nzkfegeVf9puDy/u6h1mq?=
 =?us-ascii?Q?hsfLseON7uHb/sDYpW4ncjSEXNJ8cdXRkJkfa23S9D9D/VbOBaMLUdXFqzeq?=
 =?us-ascii?Q?RXKzKLnQX18IYkmis8ECHC0jrdaBp/e5fHeYM7S4syfr1/uQ6a6/X+nr0wws?=
 =?us-ascii?Q?AVdlVmPPH/iSvdvGgbUMrmOKqr+UQRQKsjb6n97waC3ExGMoSNq5y5At3av1?=
 =?us-ascii?Q?dKldcHbzpAMU4Wvl3shl/kGFUS56qV9Q5XNI+yFXEDszbbW8j3cyW38xSjSM?=
 =?us-ascii?Q?Dsn1ujDiwkl6ZzPEzeoeHBctXh6mEP5wX/7NJJa8E13KHfv9/L6moJxoEvNI?=
 =?us-ascii?Q?zv6FPDpTQn7Ep4gTkU/+ZHob7oQS6V+NhSB9n6QCT3CObg/5/97hrwbeJz7o?=
 =?us-ascii?Q?n30jlIuh0eAbicLDiVXzyaiGIpef2sm7uPyAuieb3nSFvbvm7Z2uRbdC1tNF?=
 =?us-ascii?Q?c8Ww9dJ6kzk8QAf2WIqTpdlgx4fLaRGynxr51TV2xqletWe6c1QAhRd7FDBU?=
 =?us-ascii?Q?zVIwZWXjlMTsqm3MEOPyZ2pyvEI3IB4tIa9RVBA/chogD/vXSyYwXoRL49Xn?=
 =?us-ascii?Q?kPsXcqkmtgQSjskCm7AL3X1DDvRPQn/yPNZyn4v3kw9ljPzGRWsEKBhdTH1N?=
 =?us-ascii?Q?VMEKWDNxlnJNjkuVB4nsogpAx8+tdIkpsI93t7WXZMKOaW53yxoqymlPdXMR?=
 =?us-ascii?Q?+IafYtJV+MnRY0hDsraGJLHwHEwI990BRLXe8M6UWcCkAsmsiwtUIZ1NWWFv?=
 =?us-ascii?Q?ePOtVREudOSGlwP3PXfluh/z1LENbXEsYCRnZT0bsenhLrQ3KQ/PdJGM78Q2?=
 =?us-ascii?Q?0F5l5OLKKKufAaHKd181FCI0h/Hd5JF1XNxjDKaN91Dq2w6zMJkxTZMq55mI?=
 =?us-ascii?Q?cVwv1Scfic9kjMGilVgW16QmIKnswOcl?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 20:12:30.0148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e2eafe-1d5c-4f2e-b999-08dd10b226fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 20:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9019

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



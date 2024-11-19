Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B79D10F31
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:12:27 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.75])
 by mx.groups.io with SMTP id smtpd.web10.14073.1731993145797506722
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 21:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=gDAaCf+d;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.96.75, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzkcWx8QvunQug6FE3TAwEby0mU0pHZ8m80p2KOB228EMEpc8/Oz6en4P6ILniLOYKZvs1XWmdjyrXHszAiJr5NiAKC7Ewu8sm5jDZ6iECP20cC83GrriHLnY9+zz2TtX0usQAktvXZm3J7tw3NCtooRAj8JfSLLM3JjnhHC4M2MgUHeC29m4WRmnFTMAHsYWzlK2Rb69hMpO2xCPWTn5GizkM6nHDU0gjF7IXaOMlMdgXiQE7D+LKQIhgtHmopwNM1pCm0RceeKuv2v8MiPLtFOIXn131uKYn+ZsrMxSGlPi+LbMtSexLHpmfG12ipWLxUpb1VpXyv7tLOlrZ42zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RcgM1yPKIRQaRj2lR0zrjxb1fhqJhL9l1v7wsHb3LM=;
 b=HyQSRb82exu4MI3fYo9fwen0by7fQBNGIwhbT2gbsIAP/cHr53INtczIivYPJ3styczcWyd/HTRwHD4/mRdqyVM0jJNy1fx516LgRKAtwLxrT68HDX1WG58Y2Ft/qdBiGjjC+uPQL1IHqE7vCr8snPUZd/D5ZgCKItLDlVjF9ekZruwBGc6oLbPocKQ5CEQoCrj5YoYFBEeBHajL21nyAYYevsXShIhDs0Fd2NyvaRpYAr+O6e75uhR30VmFFcJkBrbbwI91dF32NxKSCTpUOfIUHhzDjnlHTdSDPjzWyAl17El1uexuRtMIUDkDOUMmPWq0K9cFMMSh5kCSqX2IgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RcgM1yPKIRQaRj2lR0zrjxb1fhqJhL9l1v7wsHb3LM=;
 b=gDAaCf+dyEIx3PApPFeRIXxHYytFYvLpm3AHR2aoYWzgSrUw9egXqrzVq2LUSRvRJSX7pWdN27dk7KBNOwUCZ+3d08djIAwXrgkFjTqmKiIb5X9oBsu1iLARhHcDY4YdMSj/O+uuzlZIu8/Tsx9sZQfRd0yvhwTg4KJ5347rlOM=
Received: from DM6PR04CA0025.namprd04.prod.outlook.com (2603:10b6:5:334::30)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 05:12:22 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::1d) by DM6PR04CA0025.outlook.office365.com
 (2603:10b6:5:334::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 05:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 05:12:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 23:12:16 -0600
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 23:12:09 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][styhead][PATCH 0/6] Add bbclass for xen boot script variables
Date: Mon, 18 Nov 2024 22:11:57 -0700
Message-ID: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f03b7b5-76ec-409b-9807-08dd0858bfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sZ0Dw2ZLnsZ6Oq+2wZfXZ8iPfRXW5ykpUqDM3pcrsIvUoIu1zOGoG+ABu0uC?=
 =?us-ascii?Q?HT81ZAGNGeKi+7sS2iua7iB3DNqqTcPZyuTTK1kscksyZXn6AtuTGrTqt8Ew?=
 =?us-ascii?Q?R5QhL8crkUIeEmMbx/4g8wxzclIx56baFgyfxFO/DoW3vhXCpizBKVV96QdA?=
 =?us-ascii?Q?3bqgebmV8U+uXw+3PuzRG+p4C+cmieUGkvgWXEiC1Tr/1GPMM+cxwq1a49Nd?=
 =?us-ascii?Q?IzYFIUurfNX8Dk/fOuivuHXRHUVRbtIesMNdND2E/Xats8S2VgwWmC9LgoKS?=
 =?us-ascii?Q?dt5oIISkTcIJpWh5b8N+cE8LJ8/Jcn28QFeaWrP3zfS1S7U0IMFrL3VfRH2M?=
 =?us-ascii?Q?aswU1dWizeOqP42XnT+Mud/dfLgAkEWCI4ydFGNpSvlADJ1m4h2gJ2HEC5BL?=
 =?us-ascii?Q?9w4AE57yHjkKowQDEnHws5J01nCckP9A0uYKQsJjnmMdP+cf7jUTuuPERQHC?=
 =?us-ascii?Q?Rm/BR2/g27riI1CtwTRiQU7RjdQtUJREs+QFV4M9LL7ey5OfL5B2aKNnDB/n?=
 =?us-ascii?Q?6ieNti+TgaquQp+W0kHnKC3V+KPK7nBpQrqUyHO5MmQz8ihSY/qO869UctSw?=
 =?us-ascii?Q?AhSfu6QHjZcE/viU+6D/5ovu2QqMPgQMN1h+YHo5r6k/Dg7ZmvFyYibIwbVL?=
 =?us-ascii?Q?XQeyTam3vbOOdqqMZ3o9iAMbmoYL7Lahe7flPsMmo2eNgQcijia88eXGDzyq?=
 =?us-ascii?Q?YTyX084Y9sDIMW236KnwRgNzA/znHmg1bkYzpxYv3/8ckAVlKdvVjhqAvYQC?=
 =?us-ascii?Q?Zn0jsPTu0Mrf5PkKb4Z4R4HGeHFG4u0sbzGQ+4s2T2dF8RnfFZ9zkBP5X9DN?=
 =?us-ascii?Q?tVrSQk1TfGeWbZ5OZyIMOtyDwUiOxvLE5zjmkWvmS5C2KJmHdj5GPuGXH/MZ?=
 =?us-ascii?Q?W2Q7cba1DepdYk6KXtoBHuXhMEylfkygLpDnA0Y9p5oji0oz24EoLvfjElsO?=
 =?us-ascii?Q?Ag1RexpYXzxMf7SDn8JPz6QgLxgVDtyIuRVXJLQ89kFHDms2BlIMod7LPL6c?=
 =?us-ascii?Q?ml40OwQGrIG/xb4gviI52+N0QuEC3WIqXdcJKnLkN3Hyfj3e7cJVb6Cre8c3?=
 =?us-ascii?Q?Ih9I3e6bKqVLjTcMUUIuzT94vsqz3lwnNgKnQqLpCCKumoUpFdgQcFbbndMM?=
 =?us-ascii?Q?MGGsU3OgC720RD0TKrvTQlomjC4O1nxMStL+g/gmjAr+nrIw0ybryR7kiIl9?=
 =?us-ascii?Q?FSpomo27TIr1D7bJt4jY/47kYpGVLsmGyeloR6CvUk1sWSPIUFnLOx91oV7B?=
 =?us-ascii?Q?sDFsU32d/HwdZD+xb7v5qiL8JfyX+qCrirhGCxOqLfmeT9Fk5sLgI1fvKf0Q?=
 =?us-ascii?Q?5EKbDKLqLLwUPodFlYkyF3X64gXp1UaCclgTHLaTeNwpZjCE1xf9pbZU3vjB?=
 =?us-ascii?Q?iExzXMPyTRMmLPUEvHmTzBi/NORD96g2dXFcMeFG4ej8yVhpIw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 05:12:21.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f03b7b5-76ec-409b-9807-08dd0858bfa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 05:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8978

1. Add xen-u-boot-scr.bbclass for generic xen boot script variables
   use by any soc devices.
2. Inherit xen-u-boot-scr.bbclass in xen-rpi-u-boot-scr.
3. Move xen variables to xen-boot-env.inc file in xilinx
   dynamic layers.
4. Include xen-boot-env if BOOTMODE =3D "xen" switch is enabled.
5. Add load address to boot.cmd.xen script echo messages.
6. Inherit xen-u-boot-scr bbclass in xen-boot-env.inc.
7. If user brings in their own boot.cmd.xxx file they can just
   inherit xen-u-boot-scr bbclass and use the generic xen boot
   script variables.

Sandeep Gundlupet Raju (6):
  xen-u-boot-scr: Add bbclass for xen boot script variables
  xen-rpi-u-boot-scr: Inherit xen-u-boot-scr bbclass
  xen-boot-env: Move xen variables to inc file
  u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
  boot.cmd.xen: Add load address to echo messages
  xen-boot-env.inc: Inherit xen-u-boot-scr bbclass

 classes-recipe/xen-u-boot-scr.bbclass         | 43 +++++++++++++++++++
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
 .../u-boot/u-boot-xlnx-scr.bbappend           |  7 ++-
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
 .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
 7 files changed, 97 insertions(+), 50 deletions(-)
 create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.i=
nc

--=20
2.34.1



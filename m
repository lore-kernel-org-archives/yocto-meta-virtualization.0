Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586E5EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 23:22:43 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web11.21607.1690500156049444571
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 16:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=hRJL658a;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.77, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW0uxU5GTdliI0E2TLcruV6bF+ZpOPPNPRdr0uNuKsRGOOPYAUK7zYnz4CXCAlJDrmeflbV9K4682V5gqk34n3d5RFJBjJtBc0PJWs1EsJ3mys/cBcN2twIjOaCgAIWy0XEoW+LqsEi+Btw0wV3rSsUjw+m7u95jnCVa17rHIMxCuV65VbdbKpdVToJRWQ689c+aVbYAzaHpjVUIR5+oF9VjFX+SPwfJrfen3Qz3rJ590SnsCsd0ES27SjnSvf1mo4kkQLH0v9AluE2DJVvg0qsVLn/b2H1lxfdCRyb9zy8zvDVZE5bhSQQdMzafYbKp4KBtEnUyRYrz+0+HRUNz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MffWTock6UQlXaDLzj/LzfYV3KQb1Y2L1B4P24Pbtcw=;
 b=irYsIoaJhARy+z4cKPM2IUdYx1btSwaqn0zuFjF3z14mp3rBrXSAvi4rWKBvZ3zPwjztL9BGo0KG07imKuy59xAGWPNZWY1HJUBfCnLonTahWickgcA3mkILwtxBPrTfOkQSkjnxBx5RsyZkMpeg53uMbIDcopvfp39ZUsJqdk6H5fhhAVyENdGd9oGR2uAM7wbqBP/ja9MAN1uhhHYiNRBdKKeoZlgxbGBnKrvjdcy2NQrZ2Oj+AJAav3JXchQhHEYbOO09wcE/ji29hRA/3WmwDoA7aEOdZOp1EywThEdkj8zHEjXHD0F+y1L3h858g8m1K/poiuWld3gW6C/BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MffWTock6UQlXaDLzj/LzfYV3KQb1Y2L1B4P24Pbtcw=;
 b=hRJL658aVmE+UiJs8AixUoV91SIoux2y+uhsC+zMsauiOuxvzkYngXOF7b0Bn4vYx6Jw0KS6Ftj99mF/e0s5AaCOXTyg2CGLBWfs9+C84y82oAMA272DBXOv9QtGwLHYg0xErOix81K1IMjyDBMEVdiA0PYUIqMAxRjSgy94NiY=
Received: from MW4PR02CA0017.namprd02.prod.outlook.com (2603:10b6:303:16d::24)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 23:22:33 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::8a) by MW4PR02CA0017.outlook.office365.com
 (2603:10b6:303:16d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Thu, 27 Jul 2023 23:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.29 via Frontend Transport; Thu, 27 Jul 2023 23:22:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 18:22:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 18:22:29 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 27 Jul 2023 18:22:29 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>, <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot script support
Date: Thu, 27 Jul 2023 17:22:27 -0600
Message-ID: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 86376ef5-123f-4f6f-1ba4-08db8ef85abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F/qapJoHMzZO298eVHmriwgJ71gqpOAv2C/22pjjWeq69ssIHMIAzqb4CXNX2X47qCvJ1Io9aEt6mNxnBeQuXf7IN4YlNyrizX5udMB+biudd3bL3NOjjIaJk7Ihek3DDG5Xfs73LPFavBQZ07UkD6+ydodidiGBMn+XVhpqE7rMUQeukb+ABaBhR2DNxIQWCQghi76zElMayRlE+TUm6Zl8OWWFTW4FaAdhPUG09UgoM6hZUkULEg0h6pawQuxtYoJ92BwOMsHihrLaQH1Wx30ny/e9TjAcpEVMxpQf7E7ujmU4jDhsTeXGzPAsoJyJXqT9yG41pj7MPB9jdRinmpfoultBXzcA/R3L2yBm3pUL8BH07lz0+vgJL8dEbXNJ0wk0hciRpl6YO926AfOqvFvNz8eqI5SiJoUuXMWJpWJH1nNQQMn+5SWRfwkndO3cCH6qhkwYzaNlm6RuKashi7LByEwWy7rdJ9sSekI5XbRYbV+qIKe42lEkelsqOIDEt9GPQvFT9jlVG7dEwxcXQM+v6Ox/OABJ6GtuX5p1aTT1bGnt+uyH+/dQnqSIZAhoVFkBcUj48ysWAl/c5EevuoGjVW1HuWfJGyfEaxO0ELo22x8OPWUObRkJt9QAdsOgrhLUjPg1GGQPyikD68VQw98kZTP+WpOEIdD1Gr3Clwk1fC4RmjWLa8R/0ZqjrzhxC+gD8stdADjAf06hcD2hFsF/6wnRusdURhzyhQTgqZ0vd4hJpKbOw7vpRdB/e/rZVa9um/ok+CC4xXwdrEuwiA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(70586007)(70206006)(36756003)(36860700001)(426003)(47076005)(86362001)(40480700001)(81166007)(82740400003)(2616005)(356005)(110136005)(186003)(336012)(1076003)(26005)(478600001)(40460700003)(316002)(41300700001)(5660300002)(2906002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 23:22:32.7002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86376ef5-123f-4f6f-1ba4-08db8ef85abf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 23:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8142

Add Xen dt and u-boot script support for AMD ZynqMP and Versal devices.

User can enable xen u-boot script by adding below variable from
configuration file as shown below.

BOOTMODE =3D "xen"

This u-boot script also supports to configure below Xen params from
configuration file.

params          variable assignment
------          -------------------
duart           XEN_SERIAL_CONSOLES =3D "serial0"
dom0_mem        DOM0_MEM =3D "1500M"
dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"

Sandeep Gundlupet Raju (2):
  recipes-bsp: Add device-tree files for Xen support
  recipes-bsp: Add u-boot-xlnx scripts for Xen support

 .../device-tree/device-tree.bbappend          |  19 +++
 .../files/versal-net-xen-qemu.dtsi            |   2 +
 .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
 .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
 .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
 .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
 .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++++
 .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
 10 files changed, 408 insertions(+)
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/device-tr=
ee.bbappend
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r.bbappend
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r/boot.cmd.xen
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.i=
nc

--=20
2.34.1



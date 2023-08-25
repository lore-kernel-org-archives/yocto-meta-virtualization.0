Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21A6C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 18:18:18 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.53])
 by mx.groups.io with SMTP id smtpd.web11.2033.1692987498020406574
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 11:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=orYPRrYt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.53, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk5wJu2CHbdc3rFvnDfF+kW4M/6lB4OQmbcZTocJMlc6fXKfw+w9EziWKQk+/VBGC/qF/8NN+cJkKG6sTUlB0iTyMp2eAQx29xmf8qkDIBrKrv1wlojEUIqXrk29BIR3vz6+MSITnVdWx7i0ZShf5exrAhjFjM6wTYYr2Zk4tu1CB6WnwS5VMYYOQl0uQb/76fIdRjIg76FeHK+sw/Q8QWp6HzopfEvnlgPoZXcdDh1vZz9Ww9PCSYlh+O2V89aENeqs5hAeGa2EsdFR+g8vC1W6U2vFfqXmN1mfPnv0YXbIZEQNaolYbk8X2zyHW9hAWEAQ3Et05M8mURHwKc/ZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZQ94eIFWfa2Lw+beqMyg93fE12sCkL9O4Nn8F1xSJg=;
 b=lyNUAdMg3OV4oHBlv7WV4kM1GurMQJ5Rd0+lhH4NfWxnd0S1h2FTQK4FXbP8UXY1QcnXrlkJlFI/PauhBSgkfszYzKXdzCvIIbesvtJ4OUHBjP/gFE2F+8KaZjQtIyiCPyxAyGzJnsgm+osQiVBv9vCzSd3HS2r20kdujR2zhJUlP5ygcudofy0xMf6FHHD6QvP/I+0OtaGuxD82Xr97pW9kXSb3iIlQ5e+tXW5oXyhWzUbFpZvljhd+U0FcOYR+JSFNv1vG0af23u20lbe1Ck7Qur/FcYbBPpYNSBtjHbZXPJHNCidg5NpeqXR7YcWO/CrCEu8xutf+NsFlBHcGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZQ94eIFWfa2Lw+beqMyg93fE12sCkL9O4Nn8F1xSJg=;
 b=orYPRrYtRCYGUiWMrYOHG81RxqSUzieKfcCccQBY7Pynp08X0GXn/HKzRC7nk4XNPc0q0kgd6CG9w6CVGu0Q6KbdAK7XKRHdUpFuLzpjgX8vnvlg5Cl3hkHwV7X+2B51Nc/ehxzmt0GFP+bbiU/mcRX2Z/pn0oBtxBwS6WZNHMs=
Received: from DM6PR14CA0068.namprd14.prod.outlook.com (2603:10b6:5:18f::45)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 18:18:13 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::24) by DM6PR14CA0068.outlook.office365.com
 (2603:10b6:5:18f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 18:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 18:18:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 13:18:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 13:18:12 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 13:18:11 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 0/2] Enable xen boot script using variable
Date: Fri, 25 Aug 2023 12:18:09 -0600
Message-ID: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: f04468f0-590f-433c-da74-08dba597a4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vnUURm3KRAT/92sNcCpKmo99L0Cy1oRDFPg/lc2f8bEddFuQeZza4w3uwzYSSLWPGPufJfcdsO+grQfSU88eMzmL9rXCwyT4s/tf5In7n9msu6BkbKZobikvOJCe8fs6jf6sfDb71KQUg2LGsF8SfeBDDL3DI/q/gktO2BEQZE/PRzLJQv01zAc9x8F5pyOsab6DPpe/EpBtSTpfaeuelmSMESibd2nKdiGmKae7FXXyFs069FfBjH3URoi2SANgQTiEL/HQ+R2NwwoDio/V/jUfr4CdlPSLdrEW1mnfWteH82Tdlvyf6XOC3XSR5l83m2yyFs31NWqmTfbJd1e5oYk8aTtUcW+JibnEnVUu0+LyoHOO9hG98pmd3aAF7AhEoPCZYHL4CEp1c/+OcffGZjYF978eMh/lkpjryoofRgmBSb4BfrswEgap7duZ8n8a4AiYIJVN9PQncMobtWyV/ga6At6l+DWXADfVbECKJRcy08KmOCQJiN/mWngQFrsbbqUW3NAtV9MbodUXwkBGmj7bs3xzTRPO66+zFHdj0U5RuZebgaJnhIV5IiZa5dqfUwd0H/cGGvv7JsAMAUuDL2XztgoC1YAEmROibTXSum2AQrD4cnbzdVBr7cdrZ9HK+JyOp/xhgp1DvcWKN0TwfsPWkw29Et1R/52MSboHQpxVUE1jbBu7V1C+zOomU9TiQvcz5tNn0O/pGuLw6Dz1b61xgkwWmGzmNBAszcofey9WCJeLc8tR8Pv1f1HG+UvdwgHbjdcQ1qRXTw/0rDoOhQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(86362001)(356005)(82740400003)(81166007)(36756003)(40460700003)(478600001)(5660300002)(40480700001)(2906002)(4326008)(316002)(8676002)(70586007)(110136005)(70206006)(8936002)(26005)(336012)(83380400001)(426003)(36860700001)(2616005)(47076005)(41300700001)(4744005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 18:18:12.8390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f04468f0-590f-433c-da74-08dba597a4f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Aug 2023 18:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8234

Since u-boot-xlnx-scr is shared between xen and non-xen builds,
Kernel and Devicetree image offset address from dynamic layer will be
used during variable pre expansion which causes boot issues on HW.
Hence enable xen boot script using variable.

Testing:
Add below variables to local.conf file to enable xen builds.

BOOTMODE =3D "xen"
ENABLE_XEN_UBOOT_SCR =3D "1"
ENABLE_XEN_DTSI =3D "1"
ENABLE_XEN_QEMU_DTSI =3D "1"

Sandeep Gundlupet Raju (2):
  xen-boot-cmd: Add xen variable as addendum
  u-boot-xlnx-scr: Enable xen boot script using variable

 .../recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend      |  6 ++++--
 .../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc       | 12 ++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

--=20
2.34.1



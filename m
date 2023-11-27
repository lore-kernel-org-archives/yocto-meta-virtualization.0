Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4660FC07D5A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:38:38 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web11.91864.1701081515849873334
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 02:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=GVmXazBM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.57, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3jfCU+2sPvZhGBgGB9g5LzmDuJro8AnUFeGKpgu32wnHJOu89YrArSCe3IowTTdVp0Ybr1dUCYC0HUsMaTLDytpbE7qH2YDh4E1blZFw+4lKPByN5rKBvhaMvQY7uxfrSvBkpgfXiqK6hgqlwc5htX0O7DOKETJEzIRt7uIGE0fyanzZJIi2gNfiiriaZJxbTGw+lhd/eIn0UdusA9HXjOmQP6wLnkpQepmpZcVNdHax7auU9wWIxNzhLszD9Bxq4VHQH5AYYwYjnUZiEtiZPkG1TKDSYJ/3vP0dQbAxhYzTCUGp7QjFo1AX/+8hD9m1eaxC4tv7M3Uw7F7W6vjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQZDO0i8g0yizBwgUnEq6GwBTkUyx5zOv3lIA71dkHE=;
 b=lT1wZlt6i+82z+DWWyrm0DmtFNLJzfsyeWstUxXId0NDXLe6z9XDDPL2YplZ/UBYNb/zr+paXERNcu2ppB0vAjjsdBiRSXbRQgObLt8O+NiLGxt7RVbedwxM/zKdRTT7R+rpkdU9r0ViROaaA38KWK8M7p5IrtOtvbG3yWLu6xKecnna+0OoeXd7DJsBCxvV4g1bEsn1xVHtpGtay2iBt6uCyMUMCEbk2zAHpNzoMdSgWDjo+cvWxD39otEP3SVuyjgRQ2Km2EHZqvhsHEHpTxwuB/v4nPW7dZFV8Ha2k9d+aGmlhft1iG2UXjuh24bxKT1SZUOEiYZK+8XuNZSGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQZDO0i8g0yizBwgUnEq6GwBTkUyx5zOv3lIA71dkHE=;
 b=GVmXazBMA0y1DBve1SJ1fLZ/jUSlvXz8t18oVqNs98X9RvH/3yDshbT/nes/+Ie3dfpCErb9KwK1tw0LRebuTrLeuaPHtakJZuSFLUMZOQzXfyh430fG1/k/eHOMvdGDHh9tFC28CeSqYx0QeHuhJcJXEylYFjUUrNjuiiLPH4U=
Received: from CH0PR04CA0089.namprd04.prod.outlook.com (2603:10b6:610:74::34)
 by CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:38:33 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::c0) by CH0PR04CA0089.outlook.office365.com
 (2603:10b6:610:74::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 10:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 10:38:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 04:38:27 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 27 Nov 2023 04:38:26 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, <christopher.w.clark@gmail.com>,
	<bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] xen: Set XEN_REL to 4.19 for master recipes
Date: Mon, 27 Nov 2023 11:38:11 +0100
Message-ID: <20231127103811.319149-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127103811.319149-1-michal.orzel@amd.com>
References: <20231127103811.319149-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|CO6PR12MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5d3872-0171-44f9-fda6-08dbef35008b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x7mzMC6Ws9stw3ff1LgKg+KHk/wCzXkLywS0vGFMQ1+vIILxtaqvdk3+Ep0a7ukcErs/pIBNHBXdZ2gc/3aUQPcZxiLz9olaVDWfsKiNE0y7XP/OxabIjeMSe94i8NmZONZBlsDsijjTb1WZlwjBU4pryK602NEjwuzcGPKZ+FceA3vxFaaiXLsd1yAovAxS50uL2K+nHicRfySHUzH1Xza5Wc44oT5zdEMR0OS2DGU6lR78VlarlupQfhMgpNOdIlvIUiGx1MkUp8c8Hhm0KaZvFknr/qu4fIoN6cGbPodIEStrGrXwa9Z5fEixHPVCQgo32ZN10rQ+jtLWiJKFN8miKT1S5zjrW7Wm22fLEhlGY3D6tqrVQOAB0SNk+Q00qLlGhqyyLLxJyeQ/4vvPEPfo0rVI2kX3Rro+UehMXoZBkb1mOXJiNa6yQWelHx5gvljWqUGBJMn6JSVcFLTd869r52GTcQqOeF+B7g3U5fs5tynjsuycC6riIb2OgCBAwJCiLp9hWEq70V73Ml7SdXnO37kVa5FQkw3WaI/EVAqizKGXn49vbWl84bBeXhmJLDGGsfcjGE0JLaSzQ9JyMXtg3kmNt+wC2EX1pofPPzSteZENkp5kFOfgcgpr0/v/tsxA8s+ToewkU274CdlWoQUX4Gj1fqQYa54UTOfhs30TfsciMO8qy2ygJnP/esAvItRQtl+5satBfVirDZ7XtprJemv6cO4Wa44EmxdD0/A7PdqtwNnqJhsHSpU3+s9MtQWMxDbK1FjJ2LkA2UewZA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(356005)(81166007)(82740400003)(478600001)(41300700001)(8936002)(8676002)(4326008)(36756003)(54906003)(6916009)(86362001)(316002)(70586007)(70206006)(1076003)(26005)(47076005)(2616005)(426003)(336012)(83380400001)(6666004)(36860700001)(44832011)(4001150100001)(2906002)(5660300002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:38:32.3599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5d3872-0171-44f9-fda6-08dbef35008b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 10:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8466

SRCREV recently updated by commit e3bae02214 ("xen/git: update to latest")
points to 4.18 while in fact it refers to 4.19 development version. Fix
it. Also, take the opportunity to update master tools recipe to point to
the same SHA.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 recipes-extended/xen/xen-tools_git.bb | 6 +++---
 recipes-extended/xen/xen_git.bb       | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/x=
en-tools_git.bb
index 8fbdf92e3549..0c33cfe6d4b9 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,7 +1,7 @@
-# master status on 2023-05-26
-SRCREV ?=3D "380c6c170393c48852d4f2b1ea97125a399cfc61"
+# master status on 2023-11-24
+SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"
=20
-XEN_REL ?=3D "4.18"
+XEN_REL ?=3D "4.19"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git=
.bb
index 784e71ce319c..1a1ebb782f1d 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,7 +1,7 @@
 # master status on 2023-11-24
 SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"
=20
-XEN_REL ?=3D "4.18"
+XEN_REL ?=3D "4.19"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
--=20
2.25.1



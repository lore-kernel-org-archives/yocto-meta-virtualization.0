Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4FC46CA3
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:38:38 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.43])
 by mx.groups.io with SMTP id smtpd.web11.91863.1701081513614003220
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 02:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DVd8dmAr;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.43, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Psk3+Bl3Ewz5m36Zztko9FnPlGG4oUg54lwr5ZBmmql9uvsZzVMmEUTsNeB/me+PUc1XSy0s8YXHRAmWo3Bu3Y0d8MV1M9F5eqPFP0qn89pDoFKlfPQTqtuJLBY/dUMTa9Egg4FNJvWZbsR78JPH5QwVw83EpuxWUzDm2uskdlclXZgI9E+EYyhvN0OH/zbIqmOfFD+Mv3zEABa8m45XQx5TQRJzLwZi1t00Av5f3Fq3S2HartVRKyNWFc3tqCbYFm02HpnfDgjELaVxY1/aI9O6M9yXkrGHmojmbzFRv4g669vSfksemSzPm6RzRWjaT1w+bGL//5ELKrDg4vSoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSMtAc7RzI2sf/tGnDtBIj/zAqFboxo6cAGfu1x4e60=;
 b=jUUWgV0RzVzF3RboEvNP6RiFyjX118KG4hwkkcCj0qoSFvvA6/Lns4JerJukynLs+LPOSr01eW3X9Uyz8d2EEcfQ87QnE+WBRCFuBGGokuWO1FzAg6EM59UAMq9YQUrkrZ2Fgw7JbPCEqUR3BSF8gN8r1xHsj6+fTdTnPczFfa29kI5mk83Q040pa3S3FH/ffvPrKHcOhN/Y1ablLhQ+YJzXDLTgdgxfYA288eyEuXbcRJmIMv96LOk9l7EDrDTKamTnStrVnDnYZ4QYvx0K3aomQGPFFxrUmWMZRzya6nn4koldsuOXIEgPffLbtOJCgG6YWQl4ztngxWA2eVAOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSMtAc7RzI2sf/tGnDtBIj/zAqFboxo6cAGfu1x4e60=;
 b=DVd8dmArrR9ovk3a1n3GUDYjSIQ/naspt+lje+geetyCyG9gRTekAw2GaiYD2WzkWm1iMtlKD4A0H7197oLTeGcOIvJP8EIY8PbMcCFg8bw7LAmtfSdegSbbnEA0v7E0EJ8c5gmXFHxB+xeTtcyLwAnY7fujhf+UZGCF3T5YE7Y=
Received: from CH0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:610:74::35)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:38:30 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::eb) by CH0PR04CA0090.outlook.office365.com
 (2603:10b6:610:74::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 10:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 10:38:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 04:38:25 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 27 Nov 2023 04:38:24 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, <christopher.w.clark@gmail.com>,
	<bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
Date: Mon, 27 Nov 2023 11:38:09 +0100
Message-ID: <20231127103811.319149-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f4db27-c408-443b-0c04-08dbef34ff56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V+5ijCCMOOF3xF3kew0AcUsJO8I448jsXsDsvXrIgdRoKZ+dLY4/PPXGWV0DBawxX0zViotk3GSPrRwliDMLzU9mMYh6rE7o7MCFcG8zr3ap/NzFC9va+47nAAYr1M+nXelB2utlxCNVFZ08Esu6WM0AhSTLkQkBGHRY0a8luQGgcfcS7p9TinhUKwqbc/Fo6sPCilkzdlciPL7ZjpzbCIDmuYAQfuSH3pfXqY0eu1OD0GkwasTm82jpDXEMxWZwfU2QnIlqE+FRZjXOvH2FqZQepFADwbMMLS+r/8+lsg65NoYYTQP/JLwirks7bJPdEQ241apoJ/5onOvWFwS3Ur7g5nQYnEHbJYyaG8O9f4P48Nxw+l6APMU7cwllS95PbUcQMjuXNVzwX4DrQi5eO1Jd36UwVa+hjoc7VbEtMDJoqCnloHtfmK2ILdPDolxb2doCQxQ+ua1i6rBlwnlucwniXBNSWDNlxERTlm9O2VoWo9CKzC+XT1NP5UPHqDIkda0C1Kt3VA4xk10V2ZAOSQ8qfrWlq6KIgqKzhjENbvV0dZow8iGVpW4Akh0nVcmSSALBUQeLUtBOOOk4DxTL0HsA9cjtEvQyp/aNvv3BoKnBjHQr0XUxrTWUACAYNMeA0sMGQITzwTftEZlWuE+gkeUU1U15UOKuWWRUnAwQT8ux1o+uyJaPs+S3JwHnbt2px4D8zSmC1x1mblDFTpyMpalVdWBWvwHe0bOvF6aVKb+tDDI0CPvBZahAZQThtEoPtdtX8XYzIUayfw6gr3WD6Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(6666004)(8936002)(8676002)(4326008)(54906003)(70586007)(70206006)(6916009)(316002)(478600001)(40460700003)(2906002)(36860700001)(15650500001)(81166007)(4744005)(356005)(47076005)(36756003)(41300700001)(1076003)(86362001)(26005)(44832011)(40480700001)(2616005)(83380400001)(336012)(426003)(82740400003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:38:30.3443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f4db27-c408-443b-0c04-08dbef34ff56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 10:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8465

Some follow-up patches after a recent Xen recipes update.

Open question:
Shouldn't we set 4.18 as a default version?

Michal Orzel (2):
  xen: Bump SRCREV of 4.17 recipes to 4.17.2
  xen: Set XEN_REL to 4.19 for master recipes

 ...g-solaris-syntax-for-.section-direct.patch | 70 -------------------
 recipes-extended/xen/xen-tools_4.17.bb        |  4 +-
 recipes-extended/xen/xen-tools_git.bb         |  6 +-
 recipes-extended/xen/xen_4.17.bb              |  5 +-
 recipes-extended/xen/xen_git.bb               |  2 +-
 5 files changed, 8 insertions(+), 79 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-solar=
is-syntax-for-.section-direct.patch

--=20
2.25.1



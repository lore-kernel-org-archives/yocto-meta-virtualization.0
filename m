Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D0DC54E76
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:54:31 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.56])
 by mx.groups.io with SMTP id smtpd.web10.13197.1672926865822110525
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 05:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=TQNw8X2V;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.95.56, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeCFRJzXa5ONMtq5F09RtN5VkJVSsOy/wDOsMBjYTMNEc9NP+wzk4w0xD9/BjmA30GxfsNOXX/O0ZRPjcAPhCTCbHdfex3O/JOLRPFYH1IavdjwCjz71zBTlhs8LEEBXRPZw3Fn5k6dm5MfFUsGQUqqz2y5pW8BwvVjUndew4ABs0MthLaEsNofMxktSeyI44jSjiKMyGr5/t+QdM6IUQ66t1kxRpSEWNPXUTpg8MIFPxjcGY9huAm05vr1q7T0GL3Ej7EF4ZiN0XQC0OIofyc3G7db3CxKb7aCNxp2RQ8/9mrkE5Ks79yhThraWTaoq8AAgznBXreNOKjC4beKGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66JgCXCgy8QWATNiGb1bjeE6eM0JtT4AFKpIIvmSqmo=;
 b=CLxZvYR/14z7JsnEW1uY/Ezoo2pzaJ8N5MA+/eIc5wPUgI6oVy19+29i8X3ychHLYc9cNRmZKoVKyHBr0EaXXjVyamQV0NBkQpOBZAp+2Ucqk1AVAWVTn8qKa6gyiBcM3UoZW5prYEsRqGMWvl5QM088Xs9yrI2bXOVSi9oYh4jC+sb3MaWretDGDKbw2KtcRehyUHL0Y7CFHQFEdCmo4pI1yzw9ZpFkkRd5rzK+TQzcN8YlExukgUEnRizqyuB6WkM6H+eR8gIRBz9OILaiofuY9FLB25tN1PdrHCSHO4na+D+ZqXrOFlRziYFnNTqQs1aXoqITtq5PBj5lWG5+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66JgCXCgy8QWATNiGb1bjeE6eM0JtT4AFKpIIvmSqmo=;
 b=TQNw8X2V1jXX/NAHoADuL+exiGVK+1R84ht8xpJ/cc3HTGutw0w32SpCpcb0w59u7WIiBFN/OulQeairl2sDBTUsS1AVWEp0iyPifOcCHBX4InRX2O9Sk/7sX44r/TpeUrqlSgy+rNSaW6jwqTXU8P4PbeltXncoKh0+0UasSqs=
Received: from BN0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:408:ea::18)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:54:24 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::76) by BN0PR04CA0073.outlook.office365.com
 (2603:10b6:408:ea::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 13:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 13:54:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 07:54:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 05:54:22 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 5 Jan 2023 07:54:21 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 3/3 RESEND] xen: Bump default version to 4.17 stable
Date: Thu, 5 Jan 2023 14:54:05 +0100
Message-ID: <20230105135405.10168-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105135405.10168-1-michal.orzel@amd.com>
References: <20230105135405.10168-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4621f4-0cf8-483f-8285-08daef245a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pXQN7J+lNM1UpGVqs6Nt646RpZkA6tW9PA7hpWohDFzeUdsgykYyYH/kd6uGDzD/+N1r1ZIz5bImsbQPA21DShACI7H+VW206DLVLyXLDZYbW9elMS75I0cIGByqfwT18iT1P2LPmlp+P5YQiGKT0XcVJakxfj+MD/UUza9AmKfbKoZaCADy5VUI9Eps74iVJHIR0fTG6TsQGsN4P/eAuh0MZac66D0xkWjrQ5STwbmcJK0h4LSPUqfrjNmRpJs+PoJ31zXiE/zzOkFzaE2l+8uvGeKtH9ZC8tPjYWxbgOmeoCnncECnNY9B50T9eTYRy0XQ2SAsc7Cx/AUJz7tx7jJnKUFqDeKkS+k3clT2KtA6Zt1I13TV224lrb7TMYAR7853CRUEZBZTIOcENJauqtFUfQrXpIySn11A3cDOj62xPrFmu2uYZ0Th76WOqb3loPYehtYeJ1qXJ8U1thCdlqwm0TaHfsnbfNKnxZezfXjbwFNuKRJCHTf4RJIxF1khDD1oYdGbaqRXCKCaxf5bVdgqhG2qBH1lzfT+sAacApxwJOFcc5ym0kP799wXszCfymTN7frkRxaOXICn0rv9FkdE0KKjzfPVzXVPiIJqtQMQn6UvEoGnVXKq0xM20RNAon5QQyK1d8/Je1/nmCy105qSv5sZFXbD4oJaX/yz82ZN4q2gvVs6FOEW75ki3NQJd9TASK0gt4CdEmeM2BEGJilbmG+fcpbGQSufNPt19D0=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(356005)(36756003)(426003)(8676002)(336012)(4326008)(1076003)(5660300002)(41300700001)(47076005)(83380400001)(8936002)(478600001)(44832011)(6666004)(26005)(186003)(70206006)(4744005)(6916009)(2616005)(70586007)(316002)(81166007)(54906003)(86362001)(82310400005)(2906002)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:54:23.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4621f4-0cf8-483f-8285-08daef245a14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 13:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7792

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 conf/distro/include/meta-virt-default-versions.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/dist=
ro/include/meta-virt-default-versions.inc
index b2ce0210c05c..388eca90bed4 100644
--- a/conf/distro/include/meta-virt-default-versions.inc
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -1,4 +1,4 @@
 # Meta-virtuailization PREFERED_VERSION
=20
-PREFERRED_VERSION_xen ?=3D "4.16+stable%"
-PREFERRED_VERSION_xen-tools ?=3D "4.16+stable%"
+PREFERRED_VERSION_xen ?=3D "4.17+stable%"
+PREFERRED_VERSION_xen-tools ?=3D "4.17+stable%"
--=20
2.25.1



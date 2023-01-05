Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A30C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:54:31 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web11.12955.1672926862534674986
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 05:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=sWac/4Ur;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.41, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1I1az/JqDmcst4S657tMgClF8pIDfilz/9fMbLjTkfmClvL+Bf9ACYq93NvoeyCDNhetCqHk6fxlXigzBclbXxRjP90BgePbrtO2Rtf+u0yUFpAwU5chUEIi7Qpk6Lxu5tT4Ha8TlA5+RZ+ipBzhvQmICEB/j/lz3b74HOMB7OS/YWOWlMrz3ghJYYrJYLg8s81qD3Rd+iBJcfEVDUBpv4BQFMg7ujtbgMPiax20rqFiEXNK22LTYSa/63Ru9cshdMAhYToxkYuQbnuvggVbRU6OjwtwKzesOu8xWj3wEBKGK/ETqKIRl+0cI6xfN3eQ949fMwXUjjr/DGICDPEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysDARKFj74xdqznQ4s6MsYmo4hA4Ta3j2iCFh5/b4Vk=;
 b=akm0IdXy6s0pIqXI0IsLxOMyJX3568lVkZGCGuupC/CEsFM5ELHmuxSi6T8KEJQxBSfCD8sPhl5WQBt1kegyvYz9+ckyQuRHAAcYznE866MOpQZlc7MpxjVRzMGX9bz9OLscf8aQYm2zs8CkN8qGjcaSKrryVjdGo1BQ1mdPfbYd8rUP/myqCeO66hAmGNxvKBG3/eiUf5qIAqH68LhERmoi/j4VVek+EBdHOC9WzU/vGF25jRvzsbRZXzza3UcDSNmnRKkvwNhPk5t/bsfDn7AqAV14DiCY9Y18HCQHF7rUHcUOwTv/sPFRD6Dxfu7n+C8knE8BeEw6AJubsvD1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysDARKFj74xdqznQ4s6MsYmo4hA4Ta3j2iCFh5/b4Vk=;
 b=sWac/4Urg4CNwJnjuHG+4TD6B+ihF6HsLPv8Qp6ryDcowOsnWL9jTsN+cbK6vwh5TMzXZWNcIcsy2c+ETow1vEbkv4zLD2aA4h8nt6WqeKUXysBMqriMGmA405bcr7YWIJ8tz8T8yDRpgPp6duMaOqkC8b1FtYGG4fxT9FloJ8o=
Received: from BN0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:408:141::32)
 by DM4PR12MB5245.namprd12.prod.outlook.com (2603:10b6:5:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:54:18 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::bb) by BN0PR07CA0011.outlook.office365.com
 (2603:10b6:408:141::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 13:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 13:54:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 07:54:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 05:54:17 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 5 Jan 2023 07:54:16 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/3 RESEND] xen: Update recipes for xen and xen-tools
Date: Thu, 5 Jan 2023 14:54:02 +0100
Message-ID: <20230105135405.10168-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|DM4PR12MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 56739ba5-ba9c-419d-21da-08daef2456f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nQe8XOdro+tzW0VtuivNDF28m691Nq+qesfGboHHRDpPLS7ETKYMMu1X4H00sGf6Q27naI/BsK0fut1jFzuJlRUgJXSo3jyyNIVNHzNZ5iCbTAzCutZyHMqRHb53+aqAQxSOTMuckhT2ku1dfO+zfmw7aLOHhd/tDHYOuDVeSNiEl0Ocl7Q8bDPRC5x0tfAUwqG8o9sLUwI1wYhPHYTzhvo+4jOqJTfinqFHuJ/0BTYgUd9iO66RTGkkOTtbAvyNP0iAgGnucuvwup4Z+Lc4HXve3d9qcUOAg2YwlasdTF7i/wO8QuYd+4RhyjKv2jSLsUdMFdONoO69MPgxKk79SK6NhFz+iH/S+ZXITBP9UfKdP2cCsuuKveTtu13lzbzDde+OwXphpN33Q70rQFFre3OzRlfd9WVrsabXg2na1Tr+ul5qT3P0fNztNXOt9D5Oxuc/BexFfExcX62gl1bxcRFEjuXSLpN68mm7ltJ74I+MKZqGDpHqFdMo2rwycvv5hg5F8GGGOpShd09Vi5oyCmGAE6516RgO9U72miRSrm+LoN7NYjpm94NZl7Izrc6psZwTfjE0tFUvrAra5vGZ46pjloEwmCdQ+pcSt/3/4w2+9MvuJc19vHFcndm7DN9xRBoL3Whv8oKQZYWoA5OK5VgR82GFq/AT69cIWPzmx6k1nriodnHIQGrnMt4yWnviF+VY/ZcNid9pNTY5xkWsAGomRdEslybPIY7ire024aU=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36756003)(2906002)(8936002)(44832011)(5660300002)(15650500001)(41300700001)(426003)(47076005)(83380400001)(36860700001)(356005)(82740400003)(86362001)(54906003)(6916009)(70206006)(40460700003)(70586007)(81166007)(336012)(478600001)(6666004)(40480700001)(82310400005)(4326008)(316002)(1076003)(26005)(8676002)(186003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:54:18.2513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56739ba5-ba9c-419d-21da-08daef2456f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5245
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 13:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7789

This patch series:
 - updates the 4.16 recipes to the latest 4.16.3 release,
 - adds 4.17 recipes, fixes conflicts and updates master,
 - bumps default version to 4.17.

Tested by building all the available Xen versions on qemu{arm64/x86-64} and
running them using runqemu.

Note:
The first attempt to send a series resulted in not being delivered to the
mailing list. This is the attempt after subscribing to the list.

Michal Orzel (3):
  xen: Bump SRCREV of 4.16 recipes to 4.16.3
  xen: Add recipes for stable Xen 4.17 release and update master
  xen: Bump default version to 4.17 stable

 .../include/meta-virt-default-versions.inc    |   4 +-
 .../files/xen-fix-gcc12-build-issues.patch    | 433 ------------------
 recipes-extended/xen/xen-tools.inc            |   8 +
 recipes-extended/xen/xen-tools_4.16.bb        |   5 +-
 recipes-extended/xen/xen-tools_4.17.bb        |  19 +
 recipes-extended/xen/xen-tools_git.bb         |   8 +-
 recipes-extended/xen/xen_4.16.bb              |   5 +-
 recipes-extended/xen/xen_4.17.bb              |  19 +
 recipes-extended/xen/xen_git.bb               |   8 +-
 9 files changed, 60 insertions(+), 449 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-fix-gcc12-build-issues.p=
atch
 create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
 create mode 100644 recipes-extended/xen/xen_4.17.bb

--=20
2.25.1



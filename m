Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38F7C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:46:50 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.78])
 by mx.groups.io with SMTP id smtpd.web11.15068.1673016400954461449
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 06:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=fiInzR2N;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.78, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjqNUk8TZemoYCsc4iYoU8U2yDTGumQ0tHsxu6UHbmkBlXnmzVAXlzOJQeZsWOqUGcwlRMVlZEKnNWsTzUTlLawdS4Kr0STvzF78O5Dct9zZRPLjtmDza+K7ugeBeNvbz9NpO/Lfzv/8XpiPo1jb35lqdfLyM6SPw55NueUZzrVHss6y3h9OratwsEE61rR9g2eW0ZIjEwu5Q/1i70Mi6aOQFa7atr7p8b08JOVpEt2JLp9hgOTQXTEzr8wBln6PNj5WTNXHnQC8B/nI91bh8LAT7LDhh6dFwsXuQNiibLUYXjG1eUtAJjsQHxOTLhPqF0E9Q6vTyXLif4EU+JL9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dihD/l8Vz2eW3vlx4B9GIxfQm0t8sr5lWDp7/LG40H4=;
 b=ktF+FezBcHxDDhN1SjY5W95LYiWevcCwyvRdOUi+vjF5OAoVoETlDbLVIzS+PQRY0awBMNgrO7yqYMXnaTah9P2RMv+kUnOmUA2ktIreMN/Mr8tD2q2ho1j4tISlehBHF3TsUfLAcy5+pTQVVfbHgz+Rc/3yr3D9oRrYFu8YEzmJQUX73fCfISZP2Dhe5tGu81fmHeRdzwPmXd//i8vR5EAeTxzTNclWwdP31nT4nkqX7JsGhN9e0cYDWh+3V6n/U1LVcbLzGohpJfuuALhSESvsQES1JCyGVSK9osDRfIu2ihLVnOaSiMbYFBsCppWNKvQ7HxrpgOqzGO6PA0V1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dihD/l8Vz2eW3vlx4B9GIxfQm0t8sr5lWDp7/LG40H4=;
 b=fiInzR2NDQ7RKhUs60QtUJnrjL4M88PDJQfFpu1qDbuwARf67ZAaRtLUGmIMKLYe3zEPVTaHMBX5RXV2LdH8tFmgFn68FsOVPwApGOttWM3w4Rje834ka0ZueoGOqBBR3N9Waf/92gMArFYkGFvGOeJtL3jGOnvcRGLWvX03r54=
Received: from DM6PR13CA0033.namprd13.prod.outlook.com (2603:10b6:5:bc::46) by
 DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 14:46:38 +0000
Received: from DS1PEPF0000E642.namprd02.prod.outlook.com
 (2603:10b6:5:bc:cafe::57) by DM6PR13CA0033.outlook.office365.com
 (2603:10b6:5:bc::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.6 via Frontend
 Transport; Fri, 6 Jan 2023 14:46:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E642.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.15 via Frontend Transport; Fri, 6 Jan 2023 14:46:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 08:46:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 08:46:37 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 6 Jan 2023 08:46:36 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 0/3] xen: Update recipes for xen and xen-tools
Date: Fri, 6 Jan 2023 15:46:27 +0100
Message-ID: <20230106144630.23637-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E642:EE_|DM4PR12MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: bfaa8482-e562-410c-c9d1-08daeff4d0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dYriQRYfx1KYvmu8SnAxSwkKZLOzHgp8/g7BzwdoTrnyaQeFBsUu5oQKDynD8dDoirUFfwMg5Kzl63pnNNNvSanHGE5mDLOgU3/3+DfCkTbmR9lCIriOWOzNjDxA+ArADtLwQl6zFhXZCW63YrF1ed9lw5N2mkRjLxb2wfnONKbCp/R/bQGr0z2u9ZybWDv0egNUJ3fSrHGf2EuJi8hKm5w9PHoBamkF58N8vVDSleIkWBnTJPdueznqHrhbLsVu2enPIO5aypx7kHQIP/aBFAluCb/e9O5ye+/yEyegcBLuYUCbkFZ7LaqnT5E/v9NulsmX4Nwjvm2uXEPsc9KlFwe9IKmmsjnSTF1ABxR5+GpVwM3CTyFP381+bfXaXMvYJS3OZ1xwdD0wMzCh7HWGgtb9oSFHYniu4Vp6Lb+SJan8QjyEt5VMFBLX7h7+/QatrptAg3B/tqekq5yEqxwLUMPBb7MADYHRxfxcCGoGd+ZvTHhpdNQEo6IEUAn95cCelz8Hej44nj6Pyu/Erlwx4T6finfeJXwsYjqAvkMWRk0khCWsncy1Pv7qJ41kNyjUIc7/pDDwOwpNN8SSr/labQmgBoUquBHcF1rIEt0CzJZyAs1kBY8wD6+d+m5kksNhgnUfAXy2jRR9pERLpSPEV7RLL++dOLj+oHaKsffS5MWR+xxzUUnV6yUJWtuFkH/TRH8v24yEpPd3Dcj6rlFu/Vd1j4uwr/nueP0NQfsVUbA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(47076005)(1076003)(186003)(426003)(82310400005)(336012)(26005)(83380400001)(6666004)(40480700001)(86362001)(40460700003)(36860700001)(36756003)(356005)(82740400003)(81166007)(2616005)(15650500001)(4326008)(41300700001)(8676002)(2906002)(70586007)(5660300002)(44832011)(8936002)(478600001)(316002)(70206006)(54906003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:46:38.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfaa8482-e562-410c-c9d1-08daeff4d0e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0000E642.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 14:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7797

This patch series:
 - updates the 4.16 recipes to the latest 4.16.3 release,
 - adds 4.17 recipes, fixes conflicts and updates master,
 - bumps default version to 4.17.

Tested by building all the available Xen versions on qemu{arm64/x86-64} and
running them using runqemu.

Michal Orzel (3):
  xen: Bump SRCREV of 4.16 recipes to 4.16.3
  xen: Add recipes for stable Xen 4.17 release and update master
  xen: Bump default version to 4.17 stable

 .../include/meta-virt-default-versions.inc    |   4 +-
 .../files/xen-fix-gcc12-build-issues.patch    | 433 ------------------
 recipes-extended/xen/xen-tools.inc            |   3 +
 recipes-extended/xen/xen-tools_4.16.bb        |   5 +-
 recipes-extended/xen/xen-tools_4.17.bb        |  19 +
 recipes-extended/xen/xen-tools_git.bb         |   8 +-
 recipes-extended/xen/xen_4.16.bb              |   5 +-
 recipes-extended/xen/xen_4.17.bb              |  19 +
 recipes-extended/xen/xen_git.bb               |   8 +-
 9 files changed, 55 insertions(+), 449 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-fix-gcc12-build-issues.p=
atch
 create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
 create mode 100644 recipes-extended/xen/xen_4.17.bb

--=20
2.25.1



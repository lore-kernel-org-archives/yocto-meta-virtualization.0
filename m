Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D8BC5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:46:50 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web10.15190.1673016405169213416
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 06:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=A8/WpnBU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.51, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OodqSJLkbLPuox1uMg+U2Fq+joOUeebdBWCwepugfVHVJsg5vnev2aod0jiZnGpSakRxtXAHmDReOUUCGS2T2qgyuwjO53HmYMleLoZ+vjF2R+i/wmbonH6WkYUj4s1MgJFyJZEBSmMjpVGyYTDJR/be9vieUQlc9ZD1wJPcemMfKsswx/7jlTOWgTch5uKBhB4Kr1Kfn9wMFP8XZ0jw7SQNA8fTSzaFU9605ZUGP39JV90OVIa5N6h1xxmz7txJVpPvAxrDsMnyON7W+/hnRPr4xqJnVwDu6mk6TzfGvT1coak2EmHq7qcyeAMXXkIbi1oxp3nZ3rDPfBtxjSBteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY1eGuoncRu/NUdVqcHIXF76LkcwI9/iChfU8n3zuMc=;
 b=mEiwttvcYBdKfIsXLmIhenHDvncYdfUJuP4P7tFpju3Zk2J6dUgSKYR3jKs7G0NZ0ztbUEtDxKL+YIO40rbL0gxXnAqtHmFcHzW5Q5wYvPm+13BoMbk3XvV1e8bemqXFt0Vde8qt+uE/Cmw3KkfM31D6PLKI6XdCuXzBvFx7jducgT2Zyr1jTVkqj7V4nX3r7zR4CxHq4abIpezWDM3E+W3/pED3xW5jU6FIcA7AgPycn7z6N9ETWHxZeVAhGFhmbNOO4r+Y2gf7IAG1jbKmqgURAUNr3wt1exuWO54L6GJXf0wEM5XDusG/LaLfyeWIKzgjk9HOUvMD11fEgH38mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY1eGuoncRu/NUdVqcHIXF76LkcwI9/iChfU8n3zuMc=;
 b=A8/WpnBUucjSaL7WTyOBp6/ygJEfgG3sDkTH4rggIbjpfRhCh4sr7bI5DaFNRQu9TMGFjSYHBF4IQ6vZqg/LA8Ya43SwmJUiI4sCz0QzWTWrwKyvHwdBnTV8QtxxEjbRERMvOzoOgoT16ZIPh6b81fEAitXi5z6mHK3DTEw475A=
Received: from BN9PR03CA0859.namprd03.prod.outlook.com (2603:10b6:408:13d::24)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:46:43 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::15) by BN9PR03CA0859.outlook.office365.com
 (2603:10b6:408:13d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:46:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 14:46:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 08:46:42 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 6 Jan 2023 08:46:41 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 3/3] xen: Bump default version to 4.17 stable
Date: Fri, 6 Jan 2023 15:46:30 +0100
Message-ID: <20230106144630.23637-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106144630.23637-1-michal.orzel@amd.com>
References: <20230106144630.23637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: c0302930-b4ec-4ed1-fd03-08daeff4d3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qksXifbX3z6jQqkPdDOHCsWceRD1fCgIiASSVquMw4f9igq6R/4Mkpahm3yQ0uteu7EO8Y3GjzWkBfnfOmEw6NYrEy8p9L8uHaCNH7cIArvZ5For12+C4SNiHdcY9LOIzGc/Pv71apa+P4Ir5a8EerTaY5HdlcUws3WFopRSWHLGdX7XCwTCRH1WdJrPqUGkKbVfhSNXnwodUnlQ/7D5sD0bB0RGqNI+nOosYSa5Ta5utBZDpILHBBGf5VNFlqdAn2eZtE7ELx4rrBV2RicPhhnmpd7ki0pirf+Wqcm78WBhlwpXR1MdzddF3F6XUwf+jOzuGnUtbpYLG2ioSrqJhFZwHuoc7CVP25uuLQvWRqOxXS/mGgLMzNhHrp46XwyHSeoukuUzR/1g5Bhwar5skrbqXQ/h3CR+KaqhhPvtNoBVxviWp6YHU16h8pk5RQ2ipAL3ZadFJsjuCQLxqEquGC5jN74iU5Ere6qnAPueeTh4LbgSbbJ5YyfV/Ipp2p0KvYzJusbPIkwfxg0x719wIRMeto9iUxT8NlQGCJpTH5m8rim/JsCu/XYtq06DMXtv+3AOA9xmw7EguBH/CLBfcLnS3Tmkr9yvQ6ZmBlpkMihO/vyNV6bjDV5rr5p9AWibtqLGT4crhdt5DtRHxcqyVy5jD7ZpmEVQ82zsobGzu1gXHmt7eEFJ4aE/mdOhNtBXNXWXnC1dZZQn+ZURaNdzjBvolg7Spvn8ybMugGF/6TI=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(70586007)(4326008)(70206006)(8676002)(36756003)(4744005)(41300700001)(8936002)(5660300002)(40460700003)(356005)(316002)(40480700001)(186003)(81166007)(26005)(478600001)(6666004)(82740400003)(426003)(86362001)(6916009)(1076003)(54906003)(47076005)(2616005)(82310400005)(336012)(36860700001)(2906002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:46:42.8487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0302930-b4ec-4ed1-fd03-08daeff4d3ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 14:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7799

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - none
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



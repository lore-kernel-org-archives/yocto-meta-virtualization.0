Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929F6C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:57:38 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.53])
 by mx.groups.io with SMTP id smtpd.web11.15083.1711630648360075055
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 05:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=RkqRz9XK;
 spf=pass (domain: ni.com, ip: 40.107.92.53, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTNt0mATBAfR4T1lBc/RJmZqESNypJV4baTf3bYeiyFvSzxaBmPSHckTcNj/M3tozt6nsAzP3eX3MxuvUuRRckHEIAMwoNhQZAuzQj4RkiqerfSQgjfpvcM+ApervPrn5Ju2PC446fM4HOc6S1OYQUGul4X317BpU/udiD1toxSvhJu9GL2d2m8Mafm+/t5MM1L5AZWjXOWgoe4go4Xu7x9LBwOfdj6AzkVRYjAqRC8T5LHGmdxOioslWrfM0gTFI/IRKFPlbA/oFUf+wcJYn73mpbQa8Gh8Q0GroQ6UpXnzNRUXL0f/pAUQhziIVHKlgEtidsPnL4hcTaaRJX8OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT28fGsg99/hWdX3MYsTMllzttnaZW2BXe7vT02cW0g=;
 b=V+AVl6pqEqNCYV7goRL56mxB5RTtP1e+Ob4M46Urbc7575Ie9hgMJQXhNNqQr4Eh98emW9YHf94lOLaE5ibyltg2Su9b1Qr0C577aAtbTJwITvWgX+Oa17aLwBWjMpFcNbpZsqs68mTiwSuEbdrmzAglDNRuPVPQEFKcI4d6/as5/FlEl4jtdkdKkevIx210CWKAmfLswNmZ8JdJz48D4PWXU7F2nXG0S5hO/5LwRC907r1HS+NAsRtMa+a7yGs4P+2OWYAekJXGNHKKF2pyTZIQJhz7zrQDHnwXkJFxpSPO0vtrDheUXLKPOAIUcysqnEycNu0KOVD6yunWYzFRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT28fGsg99/hWdX3MYsTMllzttnaZW2BXe7vT02cW0g=;
 b=RkqRz9XKCFWYDoJinV3sOfG6AXT428uIlYtweoev3CXJf7obM1x3STSEdd5iYkG5ds4j4NZHgtrF2+Rz4iojrjhCyWSyk3nCTGslvMAKK4wo+EWmXVeGhLp2WxxEU6EBfXCSSC2u4oAsW9kVJmyA2kyRIchcFrtc9Ew1X+bxm2Q=
Received: from DS7PR05CA0044.namprd05.prod.outlook.com (2603:10b6:8:2f::10) by
 DM6PR04MB6363.namprd04.prod.outlook.com (2603:10b6:5:1f1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Thu, 28 Mar 2024 12:57:25 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::86) by DS7PR05CA0044.outlook.office365.com
 (2603:10b6:8:2f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39 via Frontend
 Transport; Thu, 28 Mar 2024 12:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 12:57:23 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 28 Mar 2024 07:57:22 -0500
Received: from cvadrevu-p620.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 28 Mar 2024 07:57:22
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH] libvirt: Update bbappend to 10.%
Date: Thu, 28 Mar 2024 07:57:06 -0500
Message-ID: <20240328125706.3946145-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM6PR04MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: dadfe4f2-4f15-4da7-0ac2-08dc4f269c71
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n7Qm32cmcp6QuFkYKPwLM1S2r9cRJwcOLl4Plv506aoHdK4E8X/3gAanpcQeUFFpGg2zR3XR6l1b30+iRczaDoCsyJO2p6TR4rtdttDQC/bwfcemSpe7LYGHMnfMgfgZgP4B6rFanHCkIXJimO5MX67cHfUBLdws+jLDsDDCEsPCm9YY4HMS5pD0mpvqMZYee/ZwaJzfGPcuzoMrg2ua+kTxs3E3n0v7PlNYRg5gIMTiWF0uien+p8rbFUnDDEwVsEFTYwxJFo2eM0mevQ4K2nIwG5+Ge0wawt/tlUnEBdjx1NB/AEHjQCuzvG+vmYlBlfT1r7tcRMzx05Vg7ksPAg//ss4YAxdbNSNr53gBJF3sSPgFM+hhOaXG5H38WSYrvPcMpjAcLQpxFKYWnh7MY8DHyEJw9yldSvNtdg22j7+R2ezcteeI5+4naEVi6WP1tCN8AQ8FTpeaE78tPtKn2Ik23R+vewJHHqyXNjlGJOnGka7vdQVT9b4JzV1IBnvj6P65OX7jg5FvT/DPRg9Mi9GKYotV5cQzrPZsM/otfWpDoGr9cDLi4UxRWi7wYoVfttx7J5I4B3NY7ShSkORkX66QYzXQYyTl+4mRx4MREnhDK9MlsmRwAI3UbINw1J4dpyDrrCNZie2cI9rGELPNr25Kq+NpGG7cXzN1UBd02rDOglslU9vKnz5HuEj3H4uAUsoN79enitMWbSAkouCE7ee4gN56tC/hAfBppEsGB+/eouI/nUJu8h3dzrvYyEsX
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 12:57:23.1304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dadfe4f2-4f15-4da7-0ac2-08dc4f269c71
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6363
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Mar 2024 12:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8659

meta-virtualization has upgraded libvirt to 10.0.0

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../libvirt/{libvirt_9.%.bbappend =3D> libvirt_10.%.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_9.%.bbappend =3D> =
libvirt_10.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend b=
/meta-openstack/recipes-extended/libvirt/libvirt_10.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_10.%.bbappend
--=20
2.34.1



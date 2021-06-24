Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.40])
 by mx.groups.io with SMTP id smtpd.web10.834.1624561199790933515
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1krnKAwx;
 spf=pass (domain: arm.com, ip: 40.107.15.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asBZX0I4fblMDtyBVGO7UU8uKdeurmzOiawasC3fiLI=;
 b=1krnKAwxOUMwWUPAzKpkyRhQZDdvEu9/CvE+YTlhI2pwzEhhYxkWYC9opaVW3WznQYGPyDeii0z9BHZ+CHJw9Q5gXJWSvabobFJTa2mHPtKCZ0bL2+omWkDl6oiagO2nDydy3eNQO2D7Fl70Zl2KSCyunHqG7H9dt7B96c/FhCY=
Received: from DU2PR04CA0197.eurprd04.prod.outlook.com (2603:10a6:10:28d::22)
 by DB8PR08MB4106.eurprd08.prod.outlook.com (2603:10a6:10:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 18:59:57 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::20) by DU2PR04CA0197.outlook.office365.com
 (2603:10a6:10:28d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Thu, 24 Jun 2021 18:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 18:59:57 +0000
Received: ("Tessian outbound 2df94acd389f:v96"); Thu, 24 Jun 2021 18:59:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40ce80940d092d10
X-CR-MTA-TID: 64aa7808
Received: from d257acd2ffaf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1824ECB3-6B5E-4016-BE82-6F1675831736.1;
	Thu, 24 Jun 2021 18:59:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d257acd2ffaf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Jun 2021 18:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M968EcG+DHE7NiihJxFOa915o7jMrnal60Zs9uQXJ0pd7YLU5otughnHj23Vs7GrO9sUiSNbGoCLHIWyBl4Wk2xXF8YIyKxghzaNFARUYMdUEnKube2OzqsGHGkPdLYtRYhGLyIOKHThxEsZG4Mnb6JY26vcuxCI7kPgc6PJRH3hzPQhZLh3YaJtMNwm4HpPrn3mZxVebiqvfG+I+vL2814io2mgaW31CIjUVH8WF/VDkPASKwNxZ/dwOhfF0VK0ompLoSWHsF9Wzn5FvkiI1SbR5NP3PL34XtG5TpEgtT9Sd6U2t6pPA3HHTE27GCptnSLA3sCqLUkV+K/7VwyRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asBZX0I4fblMDtyBVGO7UU8uKdeurmzOiawasC3fiLI=;
 b=cyDSlALnGOKRAG803QbY4h4wsXHgTFlhuTkxtjb9MJpLM6QpYRvjBDb+U6PGgSn7vySNz+aU06FHBTkkD6j0D8PK3z6CuXI2WhwU3GDxSUoShlqDWLjPkeaMj4xGPCQLYGwWAUWwCuVzFokgd4ba2nnxa8lbi34FN+i+snqfqRlWAM7dHlAWlvVRxMAMekzuc++AnISbbFRPYnajtht9IhGffPH1IfLx1Xm7t1Ja9RU6+qI/2UKwY7xlgT8rbhF6LUIYDDzv9XF3jErDCfyf9PRueKNADtHpZr2PJdCvBwI04xoglNltFxudWsH2SLWy+7//sWetDlH+qqX0rEIyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asBZX0I4fblMDtyBVGO7UU8uKdeurmzOiawasC3fiLI=;
 b=1krnKAwxOUMwWUPAzKpkyRhQZDdvEu9/CvE+YTlhI2pwzEhhYxkWYC9opaVW3WznQYGPyDeii0z9BHZ+CHJw9Q5gXJWSvabobFJTa2mHPtKCZ0bL2+omWkDl6oiagO2nDydy3eNQO2D7Fl70Zl2KSCyunHqG7H9dt7B96c/FhCY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3462.eurprd08.prod.outlook.com (2603:10a6:20b:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 18:59:48 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 18:59:48 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
Date: Thu, 24 Jun 2021 19:59:32 +0100
Message-Id: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 18:59:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f3e1cc9-0ceb-4e11-94e9-08d93742425b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3462:|DB8PR08MB4106:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4106DF899B752F0DBC08E85792079@DB8PR08MB4106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OSM59dXkuk7x8VU3aLawXYPal8VeCnrkPQJZcDYZMYdwa4IzWCN+FloKHLQO8EQ/YEpu7DjUIxyTJaTF07ziJZWj7oxKuUASdqpalUrBpkGDBg9Ul+c7vnHJfnHRd7fiLuZUG87kRuhQbzI/leYjlwx1llknbCMwGNkOrAQJNgra37IsGcRG3NRBp8z37ylWVbVns9qVSS2ZTbitZW7WXT8Z0lIAXa5lbVfeIDHtb57JA93ehUs9+8zWCC/XeCFkMTEBJgL1frttIPHKDXZ19jQKt40i7ejLpqPt7PrfOZOLwpnZ0sNvlzOwT8Cx+HepqkruPZzqJjfzkkgg6vUnXCt+kV5JDO0ZkAFcOkXg4XNenGKEdr+o6lRWeEdNMdTBQSk+QtnZla0qLbFetewHfs1KR6Dmp6KR25xf3EAWIVl1JZ3CLxdO3LmV2oPqplscyLdVyJV1nHEc4hMe0p8i1LgTH9n8+8DxoV+HTuvKj5nmDdNjs5YbiRpKDiF6zYNmr+UilbQ+d/4llgr1BwITPaYF5KHA+sO3tDqUA5tWRr3Clb8XGZimz3QtPvCIALa5XC/PmudDet8110cBT4siSuMt8BIIYwxJMxLB5FxRgzp01oA+nASMug775dm8rSNu/zxB/hrkWMCLAD1Zi/LKtxr9sI522DMinw1aHMGKDuvLTxgemqOUG+q2tMCs+kT4ekfqhLmFQs+vHJylgYxzDg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(478600001)(66476007)(66556008)(44832011)(38100700002)(7696005)(8936002)(6916009)(38350700002)(86362001)(52116002)(36756003)(2616005)(5660300002)(316002)(6666004)(956004)(4326008)(26005)(16526019)(6486002)(4744005)(66946007)(186003)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?ZIuvCf+zUyeNoOWSdN0l+TEoXjE4o1psLAeQER1YGBhjz8tI3SP7ff6t68qm?=
 =?us-ascii?Q?wlYFo2zYlsLQMfpraZmSVcbLNa/czkEc7ksj6qYyj/lUh5WVlgZv9PUYmIDB?=
 =?us-ascii?Q?dkHLp0LGy8sivmwykgpghGNdNz0qf7Z9lfTlkR0+Fn9fwcVD94cl9Riq3lQ5?=
 =?us-ascii?Q?6Fjm7Vwt+vr9BkDqWbrAsrnU/bnLhwUqteOVeXHM0heFUz2xL6dha7fgeJ8x?=
 =?us-ascii?Q?zfFvJI7VyxT8Jqty0y7J047HiJ7f4lowEReHjFRiKHQTACnXq1V7ox3alSUV?=
 =?us-ascii?Q?8AVl4sx7soGjI6wZURxGgqsdEpumWHfaDg/FlcJK1+KVw6G81sO8Pdw8i9yL?=
 =?us-ascii?Q?agxVA++ve5Naqd2M3LLuSuJWVr7gIdSd3X67dPCwfKAHGkNkmZssyncan8k6?=
 =?us-ascii?Q?GFA6ESxyjDIpHWS0Ey+oG0/oswBtDP+WA+7/fKEsTJh3v25WhdGJQ79tHQLH?=
 =?us-ascii?Q?nGXGXWQd7gep0K4TWbtcCMEeRaeEAjOrutuGpYGGPDEURcRxpiIKNIIkoT1m?=
 =?us-ascii?Q?pa4v4gQAMLbG6XTinegsEgnYRyMjFKPzf1nq7Temqlwlw40d/Q4QwrsjKc6o?=
 =?us-ascii?Q?n6sCpljbn6h0ebQQDM5l5Auiv0NEh1h0ltBRgDX09LRJFrlgV35jqdT8zL4D?=
 =?us-ascii?Q?ltcPIktfvpDY+iz/2hXEvd6FyMf/T/sdv3cXTDTD8Fg0y+xphymhhdSLz1qd?=
 =?us-ascii?Q?Oy9rzj0hfB/lq93xtjPxhijJq4QtTMIGlc0WMHUdSLYIdnlOhVzAr2FtkTTa?=
 =?us-ascii?Q?AJ4bAI1n8BNpwUhSIFIP5u2ICWSer3Ir4sTBKPM9z40QNMSpOa+qJ/JpegHm?=
 =?us-ascii?Q?zjr269blTj9k3Uus8Tmvgjsm10EpSbDjJnkctCZI5GAso7yqzLv65KcgVpUa?=
 =?us-ascii?Q?t/LNyQ0gp5ux4kr+w8TMqz4cxEb3E+Yu9id220cSOxW6z6bIfZu6v70KVFNb?=
 =?us-ascii?Q?S7fVO+dUIx24ZGNn66WCUpZAHWFpJ0utJ9p76BAEJjhcu74z1bAOLA92/UVN?=
 =?us-ascii?Q?OYbPrFy+vfjD5JIcVQ79XsY2OAIhmjH+bBk4OaQWRNpAGGnhfr/u+xU5rVjf?=
 =?us-ascii?Q?ZKa+lbJhA4sL0q3IKi4QQFDQ7PlAIGXd59weugGZud+KmFY1Az02YVSHRI40?=
 =?us-ascii?Q?SeRQUcKmo2SSv17G/06t/RIfRC7rPRKvw2Ru45JXxzyj9bitaHJwu44hHRRd?=
 =?us-ascii?Q?2J2VgjYhpgrN8kuH2nalTmc4cixaEHzm0GPdRS9ZoNlankwFt82jBvRP4H6N?=
 =?us-ascii?Q?+nJh3OSvVQlXLeq8P+bL9Wb8ggLd2naXJ5HWlzFYTooLv50QNc9zQLn56pys?=
 =?us-ascii?Q?VLX1kVeQkDgei82bQK8KtxG8?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3462
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	016fbcdc-cf1f-46b7-084a-08d937423cef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fRGUg4EcwtQFKcvrx5HLLmP7AMntVSSa37fe06Q6/8o+UNWj3D5WwTGm2FS6v9YDdr9fl62mxZja0JKvc1vMCGEkTTit45cTlj4qI5PoKoyw+XkcLwKCQtGSG5JA5COTZbrVy44gAdKnuYQHQy8qIol0IylJCkKTSi/7woPX0OHunVJIC4lwe4WAT7PkUujUYp/gPrHIFaAS8SWExZ0sD0OzMkjT0GKQ+C2J6KeGeziIHdKDvsgpNs3NVlb5HuyGz12rB4Ath4QMz4jnkgqsFx4rZVZ7kY42KsMC6RyAG3Gp7rY6wjbJimtRJ8J0Sbo662WRMoX8sPgDQudgdxIgwDEfpBU1Hh6//7T56ZTXvlrtXbLwkEbW7cHPGXv5Q3kMM0fJdfmT1GtB5DMJVK5+VPnQxUyRnWN/J6tqaypVbySE+7+d2VO02hkrzVi3nDYLdnM2KGx3TXaNgJ3C0VY9h3Tw8bf3kYwgGR2f1MbYsnx6XN269DecDYRJZs7gEJPVseAP6NW4VRULppea4vxJOsG38fX45f/T9GpNiedKM6ezMEetRXp0QxfmQmXF+MQ48dJnaWHf9RP+vINM9BYzjLCKYWTNOcW6cQ91l35DpGBvSeWYFymENXOtbNRgs/LIcsZGCJJFDb65wTHz3PLSzgEV5JDWbgUAbBTfFVu/ONs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(316002)(5660300002)(478600001)(356005)(8936002)(47076005)(7696005)(4744005)(82740400003)(81166007)(8676002)(82310400003)(4326008)(36860700001)(86362001)(186003)(70206006)(6486002)(44832011)(6666004)(6916009)(2616005)(16526019)(336012)(70586007)(36756003)(956004)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 18:59:57.0238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3e1cc9-0ceb-4e11-94e9-08d93742425b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4106
Content-Type: text/plain

The libseccomp package is only available if seccomp is in DISTRO_FEATURES.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/podman/podman_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 9dcb21c..351f38b 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
     `alias docker=podman`. \
     "
 
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
+
 DEPENDS = " \
     go-metalinter-native \
     go-md2man-native \
-- 
2.17.1


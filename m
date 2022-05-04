Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F204EC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 15:06:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web11.628.1651676783877868292
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 08:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ICRcFiSd;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: diego.sueiro@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j3ggOydf7SHLqt1cBJmioGWzTVYDTp16jVf5FRSB/o9C7/C3apZAqW5+suPC/wVtskIEOavyTzzoXxjnuIiUvnsd2x2SYL5uI9DMwm47OIEyrthma5CcM9WLoqAq3eHGjevMMjUYlETOX2iqlb8t9bvNrp6a8Wrmvzf9D2+K6gGoclxfWzo35plIqy+5c/c1uEbsX9GxIujk7iV6CS54EwyYSsekT5ykf38h45z2U9Xk6HxcaSdLOuytj+9TwB/PFIA2eP097eTDMSfO+YjdVL1jlw+QXQfXA+9TEcCA441cSotlxMAuDjLzk68lADWLt70/V1jbQewrmEYXhXasnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMdJ055tdrg1rEl9C7XRuNd2C9G3fJmUd7eFLvEcQLQ=;
 b=L6+tWPQSk9+6debcwyY1zUbsidtoEDJHHgf0xiij2AFz3Bo8MSXNvU3M6H/IegixxL3IcXAH0O1TzeESwKK7dwwUGiqRqh4LRfFidW80bMZgFarXP360CCAQm2NJ4jB89vlTBIRo8kzEgsB6Cxf4MR7o/rAeiQKFFy3MQ0CjFtLODFmgmCU6t9npfhULiRGF+IUCaEqBwCOtW9npg2DWfVfn0SuEsYxbmE+nMeFAVjtdyBVz2+bGUZvObsKdPqhy4hmLAq1L5u6qYzzK8gMsoeT0dxVNc4zxRItyjn+WU85NVVNLGI/rSTVJbBlHjpjV5rgVXqSjvz5pdga3KhU2wg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMdJ055tdrg1rEl9C7XRuNd2C9G3fJmUd7eFLvEcQLQ=;
 b=ICRcFiSdyAwUa5QPch4TfLiFwphkfKTKEzACjtU/YukBGdJHTQQffkSOl06AYs53oYVpNmqyX45eetPqZ2CIlwAQujoYMJpp6XRnzm4WYNRVrRZL9Su3i+ga3W+AN5DCd2DKRkb4c/d+nMRG2JpHmEvz9p7QT7fjFGLzRDc0VMA=
Received: from AS9PR06CA0338.eurprd06.prod.outlook.com (2603:10a6:20b:466::32)
 by VE1PR08MB5230.eurprd08.prod.outlook.com (2603:10a6:802:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 4 May
 2022 15:06:19 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466::4) by AS9PR06CA0338.outlook.office365.com
 (2603:10a6:20b:466::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Wed, 4 May 2022 15:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 15:06:18 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 04 May 2022 15:06:18 +0000
X-CR-MTA-TID: 64aa7808
Received: from bd6c43ac7db3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24BC8250-7F3E-4635-A8AF-6006D8E23610.1;
	Wed, 04 May 2022 15:06:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bd6c43ac7db3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 May 2022 15:06:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt5uZOHiHfbF4E7oPPnBBw3+mt9WJZCk2O+dKTqpf749K1bNBKKcO9p91tlaeUgcRKWvA3t7svKsGYBsPco/xj9Q56/0c3Ov0ma2Vc6pNQu/13Lbh0B9PqDpRnBYT3R4iwWslj9n0KYidbBWu4vgj7dHjsvrEH5VYiXxi0FuaPXAZgfNS1TdBzyVlpt3cFCMVsLkCakxtv8PQqOxxGaUTqdxdDfIAzrz0kdC1G51ZzTYZwslGvZs59U0uN1Ps+ixy+zde0a9q0G/Hgo+mPdEYXINOS/ovVBvVK7wbLfOlSCQadmMUHPWcx6tDmMCFpqPv1KghXsmS6ZpwRyKYJLV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMdJ055tdrg1rEl9C7XRuNd2C9G3fJmUd7eFLvEcQLQ=;
 b=aT4qRmW9BGbGoaT6+VMCcAKI+7JSyDKKPo06Yeg4rb4j7AcGo9z9b9/EO1V29D4hNv5ore6qztduUPaF2sVqTF5KDgrJjaUjNsoN3gcvbjdpzGlq4eW8xrmPlDh/JsPNTH61O8DV4X9lppGqbrihL4zSOieltT5yxgyqHVHtgGyAs4URfpgL3FtGzIaJWonNqshgQvS5YBaSmwnn9xJMYWG08CfwqUOAq0N7EUFEjM53t+xBZsvmbmrEc6CYKe7uEb36kXLbVjcFGREyWK0KW5opj0kYmNYAwcty6AXxxplnTQ+FWtGctS224ng9dCWYHDh5Eoa9jyWxhqWcBnUQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMdJ055tdrg1rEl9C7XRuNd2C9G3fJmUd7eFLvEcQLQ=;
 b=ICRcFiSdyAwUa5QPch4TfLiFwphkfKTKEzACjtU/YukBGdJHTQQffkSOl06AYs53oYVpNmqyX45eetPqZ2CIlwAQujoYMJpp6XRnzm4WYNRVrRZL9Su3i+ga3W+AN5DCd2DKRkb4c/d+nMRG2JpHmEvz9p7QT7fjFGLzRDc0VMA=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3606.eurprd08.prod.outlook.com (2603:10a6:20b:4d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 15:06:05 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7%2]) with mapi id 15.20.5206.014; Wed, 4 May 2022
 15:06:05 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, Richard Neill <Richard.Neill@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: RE: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Topic: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Index: AQHYX8CS44bd/TpvUkyDmVWSlAxM/a0OxnCAgAAAXZCAAAjycA==
Date: Wed, 4 May 2022 15:06:05 +0000
Message-ID: 
 <AM6PR08MB34610DA802EC02E1E755B26D92C39@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20220504140917.623536-1-richard.neill@arm.com>
 <CADkTA4MRs3UWyZYOAEcSuSsnDfuyL+38e_OJOi8W-898jCUxxg@mail.gmail.com>
 <16EBED5FBFD686F6.29994@lists.yoctoproject.org>
In-Reply-To: <16EBED5FBFD686F6.29994@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 898CDA1C69378848B7E9D1374197D8F7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3bf9eb56-186c-4d97-9ed7-08da2ddfa4a0
x-ms-traffictypediagnostic: 
	AM6PR08MB3606:EE_|AM5EUR03FT062:EE_|VE1PR08MB5230:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB52308C73D051833AE700016492C39@VE1PR08MB5230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3wRIUn+WZJ2Amcp87C+QGamX36+2yfvT7vVV9sHt2r15QX0LRYV2s5ce3Q5csssyIbFf1NfoSd+1ypycMnry9d5quDtrgFuHtaryD2dz22PEyOXgdOmNty4g3vbWaAtBbHCw4TSyFROlFdcyDwaRIjDnSiZUClgK0kD3LLgz30UePQBhWMDVEZJCSiBeiRlZdxcVW2S+EVkdFaujC7MrH4n0IJjMvXatxDqTlz1E2w1ZNk6qkmI+W3GsQ3y0RSuvsgge4fkzKQsyAFvC5aKLuIpYs2cRZUnbTIRENH6mSHu+Qzsr1UYRatbpibmWhMfyXhuxfu/wZi4FiA2npvRLiqdsBXZxCJqVBsuc7i/ajevQIa7u2sEMc1Nn1RKXkzUKPXmKxzADDfjXQtsEiJywOiN9KLTb55o+Cu2SaNHzvVUZvEwprYGDq97xCxmvuhXTiCyB0SfG3mZgJAHaf4tLQ3fytHhYUOMQYY/MDZY/QAf2GlKWbgIb8u4siFdagEnzX5S5tEKLOHQtwTIquW1hTwPoRV3vUTnau62xW9Kzro0IL6EnaquFpLPQtnXiKydL/1iP3ip6XyzSMR/Hev85nrzTCUQhPQGfLM7M9dW5Imgd024tvwEg6x705ypqFrrtgQ5oA4i0i+dgQIUPt22QMpD/bh2kAyIl1jQWK8ZJAh9i6MwztPgjsZEy77wx+hULFXOTsAoseps3n7/4shEyM5U7E31IBTaaHYucc0eKW+XemghQlJvFGsCHKBCMrUD7WqMf9GBiXYcG7TNsb9CGorFob6cRMob7knlbNUYylsf9g6Pegb+7K33DDNQbiCeFE9xoPZBSNuHyJ6X1LjelSRs9c20tMx9YBPqX74dDZDQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(4326008)(66476007)(76116006)(66446008)(8676002)(66574015)(66556008)(64756008)(66946007)(5660300002)(33656002)(8936002)(83380400001)(52536014)(26005)(9686003)(54906003)(71200400001)(55236004)(55016003)(6506007)(508600001)(6636002)(110136005)(7696005)(2906002)(38100700002)(38070700005)(316002)(84970400001)(122000001)(86362001)(547064002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3606
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8532fef9-1b1f-4e42-9b02-08da2ddf9c64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VvN4z8rng/R+Gmzk8zhvxqBBD5p0pSGisJTLuyDc8zB6kj2Ac8yfaeqn2fcfHTbRnwTqrOBfwkiyrEGEjWW5PQtH5dAW50OoGwlErpqV7Ue753LVsJeyu6Mj33BZGQV5mY13ThlR93GPU2hQ18tdsxcQEX0iOiCrMS3W41FrxBGE5xGgMTp1vdAOKGNhRT2P0C8MuH5dNP4maO21Q2WncE8iIbRkRL+J5p2iMAsIj3Xf/Ud40wAVGhDOPwgcYQIbvCqWtSXVKm0gKEkQ83CW5zWS55jjrrJUdo9HoZSQIZ0wJ6EYBDWZo97IM0SdIE76NYI/0ksp2g4rQBijUBNu11EPg0p5y5xbT37lqWX/qxxXOeJlCi0fggkSEUlrBlOrwdK9YiLM2Jab+a6z0YJahU2Q7BhoQuZpndv0ma4oiLP2dYAj6ashjGnQEaqX7nTw4rrSOk3BqwcYxtUoMjpHeTWG3nyfSAyhxf7c1OWPiSTqiVpkDcnAK/YjjjdN3fnEQ5RY1n3muTPMKnMGVzm2a7XY5ZF2dTiUUDFCXKk3t5XOkeIZXcygsZyPVbiQIiWVrK3RSFBiRt3LNAQijl2S98dx5zZz36Q1m/0wdggNUbk3L18amF9Xw34Jlhwc8HHfgR/VWKUbBnkVSDl96lbp4wFsUFXeMAbCstG7sNt7vA9vX0mFbq5dzzXAJa9FIAQX27jemUdZxVvbiolOfhkZ+lFLSDN7jPPEk+vlwoIKB9n4p/WiIqIlTOeuWwVNM/yXPaxdvq8b2znkLixsYRf4bFGfNYuPg/VkBksikkLITgMQAH9CSRnlmkg1nIC+ynupTYoSqAHt3CxMENEwXzHOBA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(5660300002)(33656002)(2906002)(54906003)(6636002)(86362001)(110136005)(316002)(55016003)(8936002)(36860700001)(84970400001)(52536014)(82310400005)(186003)(70586007)(356005)(8676002)(26005)(9686003)(7696005)(6506007)(4326008)(81166007)(508600001)(40460700003)(83380400001)(336012)(66574015)(47076005)(547064002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 15:06:18.8649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3bf9eb56-186c-4d97-9ed7-08da2ddfa4a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5230
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 15:06:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7245

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPnZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBEaWVnbyBTdWVpcm8gdmlhDQo+bGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPlNlbnQ6IDA0IE1heSAyMDIyIDE1OjMxDQo+VG86IGJydWNlLmFzaGZpZWxk
QGdtYWlsLmNvbTsgUmljaGFyZCBOZWlsbCA8UmljaGFyZC5OZWlsbEBhcm0uY29tPg0KPkNjOiBt
ZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IG5kIDxuZEBhcm0uY29t
Pg0KPlN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1BBVENIXSBkb2NrZXI6IEFk
ZCBydW50aW1lIHByb3ZpZGUgZm9yDQo+dmlydHVhbC1kb2NrZXINCj4NCj5IaSBCcnVjZSwNCj4N
Cj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPj52aXJ0dWFsaXphdGlvbkBsaXN0cy55
b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQnJ1Y2UgQXNoZmllbGQgdmlhDQo+Pmxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4+U2VudDogMDQgTWF5IDIwMjIgMTU6MjcNCj4+VG86IFJpY2hh
cmQgTmVpbGwgPFJpY2hhcmQuTmVpbGxAYXJtLmNvbT4NCj4+Q2M6IG1ldGEtdmlydHVhbGl6YXRp
b25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgbmQgPG5kQGFybS5jb20+DQo+PlN1YmplY3Q6IFJl
OiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1BBVENIXSBkb2NrZXI6IEFkZCBydW50aW1lIHByb3Zp
ZGUNCj4+Zm9yIHZpcnR1YWwtZG9ja2VyDQo+Pg0KPj5PbiBXZWQsIE1heSA0LCAyMDIyIGF0IDEw
OjA5IEFNIFJpY2hhcmQgTmVpbGwgPHJpY2hhcmQubmVpbGxAYXJtLmNvbT4NCj4+d3JvdGU6DQo+
Pj4NCj4+PiBUaGlzIHBhdGNoIGVuYWJsZXMgc3VjY2Vzc2Z1bCBydW50aW1lLWRlcGVuZGVuY3kg
b24gdGhlIERvY2tlcg0KPj4+IHByZWZlcnJlZCBwcm92aWRlciwgYXMgdmlydHVhbC9kb2NrZXIg
ZG9lcyBub3QgcmVzb2x2ZS4gRG9pbmcgc28NCj4+PiBhbGlnbnMgd2l0aCBvdGhlciB2aXJ0dWFs
IHBhY2thZ2UgcHJvdmlkZXJzIChlLmcuIHZpcnR1YWwtcnVuYyksIGFuZA0KPj4+IGZvbGxvd3Mg
dGhlIFlvY3RvIFByb2plY3QgZG9jdW1lbnRhdGlvbg0KPj4+IChodHRwczovL2RvY3MueW9jdG9w
cm9qZWN0Lm9yZy9zaW5nbGVpbmRleC5odG1sI3ZpcnR1YWwtcnVudGltZS1wcm92aWRlcykuDQo+
Pg0KPj5XZSBkb24ndCBoYXZlIGEgdmlydHVhbC1kb2NrZXIgcnByb3ZpZGVzIGJ5IGRlc2lnbi4g
U2luY2UgdGhlcmUgYXJlDQo+PmRpZmZlcmVuY2VzDQo+PihoaXN0b3JpY2FsbHkpIGJldHdlZW4g
ZG9ja2VyLWNlIGFuZCBkb2NrZXItbW9ieS4NCj4+DQo+PllvdXIgcGFja2FnZSBsaXN0cyBhbmQg
aW1hZ2VzIHNob3VsZCBiZSByZWZlcnJpbmcgdG8gdGhlIG9uZSB0aGV5IHdhbnQsDQo+Pm5vdCB2
aXJ0dWFsLWRvY2tlciBhcyBhIHJkZXBlbmRzLg0KPg0KPkluIHRoaXMgY2FzZSBoYXZpbmcgYCBQ
UkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9kb2NrZXIgPz0gImRvY2tlci1jZSJgIGFuZA0KPmAg
UFJPVklERVMgKz0gInZpcnR1YWwvZG9ja2VyImAgaXMgdXNlbGVzcz8NCj4NCg0KQWxzbywgaXQg
c2VlbXMgdGhhdCBvbiB0aGUgYnJvd3NlciBnaXRodWIuY29tL2RvY2tlci9kb2NrZXIuZ2l0IChm
cm9tIGRvY2tlci1jZV9naXQuYmIpIHJlZGlyZWN0cyB0byBnaXRodWIuY29tL21vYnkvbW9ieS5n
aXQuDQpEb2VzIGl0IG5vdCBtYWtlIHNlbnNlIHRvIHJldGlyZSBvbmUgb2YgdGhlIHJlY2lwZXMg
YW5kIGp1c3Qga2VlcCBvbmU/IEl0IHdpbGwgcmVkdWNlIG1haW50ZW5hbmNlIGVmZm9ydCBhbmQg
YXZvaWQNCmNvbmZ1c2lvbnMgdG8gd2hpY2ggb25lIHNob3VsZCBiZSB1c2VkLiANCg0KRGllZ28N
Cg0KDQo+DQo+Pg0KPj5CcnVjZQ0KPj4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQg
TmVpbGwgPHJpY2hhcmQubmVpbGxAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiAgcmVjaXBlcy1jb250
YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jIHwgMSArDQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9kb2Nr
ZXIvZG9ja2VyLmluYw0KPj4+IGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5j
DQo+Pj4gaW5kZXggNDBhMzY0Mi4uZTE5NmY5YiAxMDA2NDQNCj4+PiAtLS0gYS9yZWNpcGVzLWNv
bnRhaW5lcnMvZG9ja2VyL2RvY2tlci5pbmMNCj4+PiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMv
ZG9ja2VyL2RvY2tlci5pbmMNCj4+PiBAQCAtMzIsNiArMzIsNyBAQCBSREVQRU5EUzoke1BOfSAr
PSAidmlydHVhbC1jb250YWluZXJkIHZpcnR1YWwtcnVuYyINCj4+PiAgUlJFQ09NTUVORFM6JHtQ
Tn0gPSAia2VybmVsLW1vZHVsZS1kbS10aGluLXBvb2wga2VybmVsLW1vZHVsZS1uZi0NCj4+bmF0
IGtlcm5lbC1tb2R1bGUtbmYtY29ubnRyYWNrLW5ldGxpbmsga2VybmVsLW1vZHVsZS14dC1hZGRy
dHlwZQ0KPj5rZXJuZWwtIG1vZHVsZS14dC1tYXNxdWVyYWRlIg0KPj4+DQo+Pj4gIFBST1ZJREVT
ICs9ICJ2aXJ0dWFsL2RvY2tlciINCj4+PiArUlBST1ZJREVTOiR7UE59ICs9ICJ2aXJ0dWFsLWRv
Y2tlciINCj4+Pg0KPj4+ICAjIHdlIHdhbnQgYWxsIHRoZSBkb2NrZXIgdmFyaWFudCByZWNwZXMg
dG8gYmUgaW5zdGFsbGFibGUgdmlhICJkb2NrZXIiDQo+Pj4gIFBBQ0tBR0VfTkFNRSA9ICJkb2Nr
ZXIiDQo+Pj4gLS0NCj4+PiAyLjI1LjENCj4+Pg0KPj4+DQo+Pj4NCj4+Pg0KPj4NCj4+DQo+Pi0t
DQo+Pi0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBh
bmQgbWFkbmVzcyBhd2FpdA0KPj50aGVlIGF0IGl0cyBlbmQNCj4+LSAiVXNlIHRoZSBmb3JjZSBI
YXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==


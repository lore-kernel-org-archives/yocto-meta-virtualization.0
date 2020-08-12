Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web11.18963.1597250533886874119
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 09:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=akaieSHB;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIISFrWY7MqLA2on9ziXNcPjQG8BL7cdv7EJRkpA2+4=;
 b=akaieSHBup5nr8QqINKniNqyu0JEA+UHtz4JsRaXYO4VTFFq4RHkfFNT4D5xnLfPqY/qPWiDSJTXVOURkdXGs5U9+otEGImDRu5s+PXpaOxvqFRopADQ14XCik0FwVqETJOKGPLC1ev7bUrriE07RCHbJf3a2ys4Pu8EC9JYRNM=
Received: from DB6PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::24)
 by AM6PR08MB4834.eurprd08.prod.outlook.com (2603:10a6:20b:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 12 Aug
 2020 16:42:10 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::ad) by DB6PR1001CA0014.outlook.office365.com
 (2603:10a6:4:b7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Wed, 12 Aug 2020 16:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 16:42:10 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 12 Aug 2020 16:42:10 +0000
X-CR-MTA-TID: 64aa7808
Received: from b393a730f97f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5919A259-ED3D-41CB-B5F1-0A3F66E0B334.1;
	Wed, 12 Aug 2020 16:42:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b393a730f97f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Aug 2020 16:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po6xCucbiBnXdmCQskp7uZs63ex8OcTv2mgH/n85DgStQ8yIuCJh/gYNtEVmNhskBF4ZySpt0K6gXmcHk118U6vxGLWSOxAT99KfLkCijDLJkARgDkFpUn7W0zXU7/6aE+fFOcHRvDr3xfseloZain7/o5hlyVLZUSJaEWkN8hkCmQLa7OvEENdTeYNUhJ9kZRCWq+3O7aL2NEkkx74fyZk2Abg6iaTeUaVh4GLhZzWl1AW5xdsIQpvG+1y8ZttRaphaA8b9JLWOfm9D5FivA7FYszCnkv/6g5PewH6sqB7c1VwjCLtA9XALLgVWdJoE2mtAD7Q7jIG+PfimaFJ/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIISFrWY7MqLA2on9ziXNcPjQG8BL7cdv7EJRkpA2+4=;
 b=LntFI+4K9JTsp96zNj/CgGSiusT49XhwYoaGHxE0aeK6ZBPpcm+/yPPTSV+54vH5tGZreIQCIOnaLKZ1Zxq/xvyTFsntOkMxO2il24rjcd/azvwkpQySmZOg034zbkRn4cNRHJhlA+zKzbvB8v1xKsdn2uemA/CIgC2BikJMgPyuzdTFu4icoqel0WwzZJ9gwgOKMCpDRjqvuFoNHlZF5Jr5ZXTZmWaCx7xypVnVtgjTiMYIELPHOZvKTxQ6/Pq8mZ4EGp9pNAPD9HQICgEZr0GoJ9BCG/clQUGXf52/oCJ5mfC7rOu56Y37s8v15h3GTHPZu6kNV83y/oIhfPNqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIISFrWY7MqLA2on9ziXNcPjQG8BL7cdv7EJRkpA2+4=;
 b=akaieSHBup5nr8QqINKniNqyu0JEA+UHtz4JsRaXYO4VTFFq4RHkfFNT4D5xnLfPqY/qPWiDSJTXVOURkdXGs5U9+otEGImDRu5s+PXpaOxvqFRopADQ14XCik0FwVqETJOKGPLC1ev7bUrriE07RCHbJf3a2ys4Pu8EC9JYRNM=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1619.eurprd08.prod.outlook.com (2603:10a6:203:3b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Wed, 12 Aug
 2020 16:42:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 16:42:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, Doug
 Goldstein <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: Fix menuconfig
Thread-Topic: [meta-virtualization] [PATCH 1/2] xen: Fix menuconfig
Thread-Index: AQHWavWz25BqK/0cHUeM1U8CzEQtZqk0t6Pg
Date: Wed, 12 Aug 2020 16:42:03 +0000
Message-ID: 
 <AM6PR08MB346132E7263466C5373B72A692420@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <CACMJ4GbhFuOyGKVQn8u+VeWMXyAC_F-37huMKczibiHdAQyhCw@mail.gmail.com>
 <19886.1596610639405316859@lists.yoctoproject.org>
In-Reply-To: <19886.1596610639405316859@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: eaeaf4b4-f72c-4702-8582-ab7993f6e3f2.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82fc2306-e433-4bc2-e2c7-08d83edea8ab
x-ms-traffictypediagnostic: AM5PR0801MB1619:|AM6PR08MB4834:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB483429E5098184E1F2EB8FDF92420@AM6PR08MB4834.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Dda41z6Km35XCGMyokrwJfaKVUBVayFJYgPnBmhjPW/eUoJTBFAgpZJhqb1M6eyFG+8sfn4cSOXRZHQkdHlfecoKLzXZgeZDwvPLSPB86LsdOqeAlx17t1exlq4+AwwEGGJ3hVeG83wK8ua48fK3ApIXqrwwKIrCNX2WYVr+sWaZwVJsG/7+NePQHgKU4WlD6rBazmabXKl3Y5ZQUKzCwFfxMFqfIBI2Pre4xBSqGjHjicxP6IaviCxiEHvSovNLVPaz1r6ry3pTro/Pny+/cVpnYM6A5uLW4Hne9hoWZII6fsPTE+3xLcPpPaklR9vjlDtbvNmnp1ezW1mZlpTqMWHa27L2EPDrzyiq68/KuOOw5ISLGPfunc3Q1UYH2qlaS1VOsJeNy5kDW84HtgY7Vg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(2906002)(4326008)(66446008)(64756008)(66556008)(316002)(66476007)(83380400001)(76116006)(71200400001)(186003)(26005)(6506007)(66946007)(52536014)(33656002)(54906003)(9686003)(110136005)(8676002)(7696005)(86362001)(5660300002)(478600001)(55016002)(8936002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 gp4HvkQnEdzT2+U2nwXGEQkQFHPDbbGLT3sVCtTs8ltP8Gvx0VUnb1NUj0Dy4OC+hgLbS3u+KwfKIPHllCBLT+7/PjUc4Sgj6NZbwWVK/I8WcC0yNOEW8H0YN08Y4Wpb3depehGN3ul900J9tnw4uzf6GRcMYR7R2Znkz/OAW+97ETkhsS77d3JHyvGGSi4IYQVon9lGpNXNhUgzym77p2UpgnbdyyM4T4ZxyI9mJdnxdcoOEM+T+ZI26BUf6AHzoym8x7ZUq1tMqNT5RlR2EMPYW3PRBHNFXGBMSO2hglfOpAjRlZbCVjKfw/C0k4t/yp+0v/GneLgXToDjKeTF0ZIdP8nuZ0A54gOywIbxAU18aRlL5HKcj9pVMy/pBFK0p9fMoMpSQlX0YYl6URtiP8h9uFcunNJH+24GR2hiXQwwgt7ZkbZt7Si3zY/L3xUX8HgH9ReRRWeNoCIy+53aSxwZN6vcJcNc0RU/ThGSUGLdZ8hn3F/sa03CnL/g0Gfzn8TgRz3WWwL5pa90HaG2YdIcNymuen4YpI3rhGHM6tw5E3HWdHrfZlgUo751iN/3yaL/bvEsyw2XyZ+aSqhHdG1/adu9p80IALWxkQ80LYMebKXXVtay/3LuOepSOmG+B1Sh4MZ6QYqSfhr2xLMWJA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1619
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35d0463f-e0f6-4850-f103-08d83edea4a7
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(81166007)(82310400002)(86362001)(4326008)(6506007)(336012)(47076004)(82740400003)(186003)(356005)(7696005)(33656002)(110136005)(5660300002)(9686003)(8676002)(8936002)(54906003)(55016002)(83380400001)(316002)(478600001)(52536014)(107886003)(70586007)(70206006)(966005)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 16:42:10.6334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc2306-e433-4bc2-e2c7-08d83edea8ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4834
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPnZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBEaWVnbyBTdWVpcm8gdmlhDQo+bGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPlNlbnQ6IDA1IEF1Z3VzdCAyMDIwIDA3OjU3DQo+VG86IG1ldGEtdmlydHVh
bGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPlN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0
dWFsaXphdGlvbl0gW1BBVENIIDEvMl0geGVuOiBGaXggbWVudWNvbmZpZw0KPg0KPkhpIENocmlz
dG9waGVyLA0KPg0KPlRoYW5rcyBmb3IgeW91ciBjb21tZW50cyBhbmQgZmVlZGJhY2suDQo+DQo+
UGxlYXNlLCBmaW5kIG15IGNvbW1lbnRzIGlubGluZS4NCj4NCj5PbiBXZWQsIEF1ZyAgNSwgMjAy
MCBhdCAwNjoyNSBBTSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6DQo+DQo+Pg0KPj4gT24gVHVl
LCBBdWcgNCwgMjAyMCBhdCA2OjI4IEFNIERpZWdvIFN1ZWlybyA8ZGllZ28uc3VlaXJvQGFybS5j
b20+DQo+d3JvdGU6DQo+PiA+DQo+PiA+IFdoZW4gYnVpbGRpbmcgaW4gT0UgZW52aXJvbm1lbnQg
dGhlIGxpbmtlciBwYXRoIG5lZWRzIHRvIGJlIHBhc3NlZA0KPj4gPiB3aGVuIGJ1aWxkaW5kIHRo
ZSBLY29uZmlnIHRvb2wgaW4gb3JkZXIgdG8gZ2V0IHRoZSBtZW51Y29uZmlnIHRhc2sNCj4+ID4g
cHJvcGVybHkgd29ya2luZy4NCj4+DQo+PiBIaSBEaWVnbywNCj4+DQo+PiBUaGFuay15b3UgZm9y
IHdvcmtpbmcgb24gZml4aW5nIHRoaXMgLSBpdCBpcyBuaWNlIHRvIHNlZSB0aGlzIHRvb2wNCj4+
IHdvcmtpbmcgY29ycmVjdGx5IGFnYWluLiBJIGhhdmUgc29tZSBmZWVkYmFjayBpbmxpbmUgYmVs
b3cuDQo+Pg0KPj4gPiBTaWduZWQtb2ZmLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bh
cm0uY29tPg0KPj4gPiAtLS0NCj4+ID4gIC4uLmctQWxsb3ctc3BlY2lmaWNhdGlvbi1vZi1uY3Vy
c2VzLWxvY2F0aW9uLnBhdGNoIHwgNTUNCj4+ICsrKysrKysrKysrKysrKysrKysrKysNCj4+ID4g
IHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYyAgICAgICAgICAgIHwgIDQg
Ky0NCj4+ID4gIHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE0LmJiICAgICAgICAgICAgICAg
ICAgIHwgIDEgKw0KPj4gPiAgcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuX2dpdC5iYiAgICAgICAg
ICAgICAgICAgICAgfCAgMSArDQo+PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkgIGNyZWF0ZSBtb2RlDQo+PiA+IDEwMDY0NA0KPj4gcmVjaXBlcy1l
eHRlbmRlZC94ZW4vZmlsZXMvMDAwMS1tZW51Y29uZmlnLW1jb25mLWNmZy1BbGxvdy1zcGVjaWZp
Y2F0aQ0KPj4gb24tb2YtbmN1cnNlcy1sb2NhdGlvbi5wYXRjaA0KPj4gPg0KPj4gPiBkaWZmIC0t
Z2l0DQo+PiBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzLzAwMDEtbWVudWNvbmZpZy1tY29u
Zi1jZmctQWxsb3ctc3BlY2lmaWNhDQo+PiB0aW9uLW9mLW5jdXJzZXMtbG9jYXRpb24ucGF0Y2gN
Cj4+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+ID4gaW5kZXggMDAwMDAwMC4uNzRjOWNiMA0K
Pj4gPiAtLS0gL2Rldi9udWxsDQo+PiA+ICsrKw0KPj4gYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi9m
aWxlcy8wMDAxLW1lbnVjb25maWctbWNvbmYtY2ZnLUFsbG93LXNwZWNpZmljYQ0KPj4gdGlvbi1v
Zi1uY3Vyc2VzLWxvY2F0aW9uLnBhdGNoDQo+PiA+IEBAIC0wLDAgKzEsNTUgQEANCj4+ID4gK1Vw
c3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWMsIGNyb3NzIGNvbXBpbGUg
aXNzdWVdDQo+Pg0KPj4gSG93IGhhdmUgeW91IGFycml2ZWQgYXQgdGhpcyAiVXBzdHJlYW0tU3Rh
dHVzIiBmb3IgdGhpcyBwYXRjaD8NCj4+IEkgYXNrIGJlY2F1c2UgaWYgaXQgaXMgcG9zc2libGUg
dG8gYXZvaWQgY2FycnlpbmcgdGhpcyBwYXRjaCBpbg0KPj4gbWV0YS12aXJ0dWFsaXphdGlvbiBp
bmRlZmluaXRlbHksIGl0IHdvdWxkIGJlIGdvb2QgdG8gZG8gc28uIFBsZWFzZQ0KPj4gY2FuIHlv
dSBzdWJtaXQgaXQgdXBzdHJlYW0gZm9yIGZlZWRiYWNrIGFuZCBob3BlZnVsbHkgYWNjZXB0YW5j
ZSBmcm9tDQo+PiB0aGUgWGVuIG1haW50YWluZXJzPw0KPj4NCj4NCj5JJ2xsIHNlbmQgaXQgdG8g
dGhlIHVwc3RyZWFtIHByb2plY3QgYW5kIHVwZGF0ZSB0aGUgVXBzdHJlYW0tU3RhdHVzIG9mIHRo
aXMNCj5wYXRjaC4NCj5MaWtlIHlvdSBtZW50aW9uZWQgYmVsb3cgaXQgd2lsbCBtb3N0IHByb2Jh
Ymx5IGhhdmUgZGlmZmVyZW50IHZhcmlhYmxlIG5hbWVzLg0KDQpQbGVhc2UsIGRpc3JlZ2FyZCB0
aGlzIHBhdGNoLiBJJ2xsIGJlIHNlbmRpbmcgYSBuZXcgcGF0Y2ggc2hvcnRseSB1bmlmeWluZyBi
b3RoIHRoaXMNCmFuZCBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1
YWxpemF0aW9uL21lc3NhZ2UvNTY4OSBjb25zaWRlcmluZw0KQ2hyaXN0b3BoZXIncyBjb21tZW50
cy4NCg0KPg0KPj4NCj4+ID4gK1NpZ25lZC1vZmYtYnk6IERpZWdvIFN1ZWlybyA8ZGllZ28uc3Vl
aXJvQGFybS5jb20+DQo+PiA+ICsNCj4+ID4gK0Zyb20gZDA3OGUyOWFhMzFhYzNmYTRjMDQxYmY4
OWM0NmJjNjM3MmMxYTAyYSBNb24gU2VwIDE3DQo+MDA6MDA6MDANCj4+ID4gKzIwMDENCj4+ID4g
K0Zyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIuY29tPg0KPj4g
PiArRGF0ZTogTW9uLCAyIEp1bCAyMDE4IDIzOjEwOjI4IC0wNDAwDQo+PiA+ICtTdWJqZWN0OiBt
ZW51Y29uZmlnLG1jb25mLWNmZzogQWxsb3cgc3BlY2lmaWNhdGlvbiBvZiBuY3Vyc2VzDQo+PiA+
ICtsb2NhdGlvbg0KPj4gPiArDQo+PiA+ICtJbiBzb21lIGNyb3NzIGJ1aWxkIGVudmlyb25tZW50
cyBzdWNoIGFzIHRoZSBZb2N0byBQcm9qZWN0IGJ1aWxkDQo+PiA+ICtlbnZpcm9ubWVudCBpdCBw
cm92aWRlcyBhbiBuY3Vyc2VzIGxpYnJhcnkgdGhhdCBpcyBjb21waWxlZA0KPj4gPiArZGlmZmVy
ZW50bHkgdGhhbiB0aGUgaG9zdCdzIHZlcnNpb24uICBUaGlzIGNhdXNlcyBkaXNwbGF5DQo+PiA+
ICtjb3JydXB0aW9uIHByb2JsZW1zIHdoZW4gdGhlIGhvc3QncyBjdXJzZXMgaW5jbHVkZXMgYXJl
IHVzZWQNCj4+ID4gK2luc3RlYWQgb2YgdGhlIGluY2x1ZGVzIGZyb20gdGhlIHByb3ZpZGVkIGNv
bXBpbGVyIGFyZSBvdmVycmlkZGVuLg0KPj4gPiArVGhlcmUgaXMgYSBzZWNvbmQgY2FzZSB3aGVy
ZSB0aGVyZSBpcyBubyBjdXJzZXMgbGlicmFyaWVzIGF0IGFsbCBvbg0KPj4gPiArdGhlIGhvc3Qg
c3lzdGVtIGFuZCBtZW51Y29uZmlnIHdpbGwganVzdCBmYWlsIGVudGlyZWx5Lg0KPj4gPiArDQo+
PiA+ICtUaGUgc29sdXRpb24gaXMgc2ltcGx5IHRvIGFsbG93IGFuIG92ZXJyaWRlIHZhcmlhYmxl
IGluDQo+PiA+ICtjaGVjay1seGRpYWxvZy5zaCBmb3IgZW52aXJvbm1lbnRzIHN1Y2ggYXMgdGhl
IFlvY3RvIFByb2plY3QuDQo+PiA+ICtBZGRpbmcgYSBDUk9TU19DVVJTRVNfTElCIGFuZCBDUk9T
U19DVVJTRVNfSU5DIHNvbHZlcyB0aGUgaXNzdWUNCj5hbmQNCj4+ID4gK2FsbG93aW5nIGNvbXBp
bGluZyBhbmQgbGlua2luZyBhZ2FpbnN0IHRoZSByaWdodCBoZWFkZXJzIGFuZCBsaWJyYXJpZXMu
DQo+Pg0KPj4gSSB0aGluayBpdCdzIGdvaW5nIHRvIGJlIGdvb2QgdG8gZ2V0IGZlZWRiYWNrIGZy
b20gdGhlIFhlbiBidWlsZA0KPj4gc3lzdGVtIG1haW50YWluZXJzIG9uIHdoZXRoZXIgdGhlc2Ug
dmFyaWFibGUgbmFtZXMgYXJlIGdvaW5nIHRvIGJlDQo+PiBhY2NlcHRhYmxlIHVwc3RyZWFtLiBJ
dCBjb3VsZCBtYWtlIHNlbnNlIHRvIGFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGVtDQo+PiB0byB0
aGUgSU5TVEFMTCBmaWxlIGF0IHRoZSBoZWFkIG9mIHRoZSByZXBvc2l0b3J5IHdoZXJlIHNvbWUg
b2YgdGhlDQo+PiBvdGhlciBidWlsZCBzeXN0ZW0gdmFyaWFibGVzIGFyZSBleHBsYWluZWQuDQo+
Pg0KPg0KPlRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIExldCdzIHNlZSBob3cgdGhlIHJldmll
dyBnb2VzIGluIHRoZSB1cHN0cmVhbQ0KPnByb2plY3QuDQo+DQo+PiA+ICsNCj4+ID4gK1NpZ25l
ZC1vZmYtYnk6IEphc29uIFdlc3NlbCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5jb20+DQo+PiA+
ICtjYzogTWljaGFsIE1hcmVrIDxtbWFyZWtAc3VzZS5jej4NCj4+ID4gK2NjOiBsaW51eC1rYnVp
bGRAdmdlci5rZXJuZWwub3JnDQo+PiA+ICtTaWduZWQtb2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCA8
YnJ1Y2UuYXNoZmllbGRAd2luZHJpdmVyLmNvbT4NCj4+ID4gKy0tLQ0KPj4gPiArIHhlbi90b29s
cy9rY29uZmlnL21jb25mLWNmZy5zaCB8IDggKysrKysrKysNCj4+ID4gKyAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspDQo+PiA+ICsgbW9kZSBjaGFuZ2UgMTAwNzU1ID0+IDEwMDY0NCB4
ZW4vdG9vbHMva2NvbmZpZy9tY29uZi1jZmcuc2gNCj4+ID4gKw0KPj4gPiArKGxpbWl0ZWQgdG8g
J3hlbi90b29scy9rY29uZmlnL21jb25mLWNmZy5zaCcpDQo+PiA+ICsNCj4+ID4gK2RpZmYgLS1n
aXQgYS94ZW4vdG9vbHMva2NvbmZpZy9tY29uZi1jZmcuc2gNCj4+IGIveGVuL3Rvb2xzL2tjb25m
aWcvbWNvbmYtY2ZnLnNoDQo+PiA+ICtvbGQgbW9kZSAxMDA3NTUNCj4+ID4gK25ldyBtb2RlIDEw
MDY0NA0KPj4gPiAraW5kZXggYzgxMjg3MmQ3ZjlkLi42NWE5YjllNWI4YTYNCj4+ID4gKy0tLSBh
L3hlbi90b29scy9rY29uZmlnL21jb25mLWNmZy5zaA0KPj4gPiArKysrIGIveGVuL3Rvb2xzL2tj
b25maWcvbWNvbmYtY2ZnLnNoDQo+PiA+ICtAQCAtNCw2ICs0LDE0IEBADQo+PiA+ICsgUEtHPSJu
Y3Vyc2VzdyINCj4+ID4gKyBQS0cyPSJuY3Vyc2VzIg0KPj4gPiArDQo+PiA+ICsraWYgWyAiJENS
T1NTX0NVUlNFU19MSUIiICE9ICIiIF07IHRoZW4NCj4+ID4gKysgICAgZWNobyBsaWJzPVwnJENS
T1NTX0NVUlNFU19MSUJcJw0KPj4gPiArKyAgICBpZiBbIHgiJENST1NTX0NVUlNFU19JTkMiICE9
IHggXTsgdGhlbg0KPj4gPiArKyAgICAgIGVjaG8gY2ZsYWdzPVwnJENST1NTX0NVUlNFU19JTkNc
Jw0KPj4gPiArKyAgICBmaQ0KPj4gPiArKyAgICBleGl0IDANCj4+ID4gKytmaQ0KPj4gPiArKw0K
Pj4gPiArIGlmIFsgLW4gIiQoY29tbWFuZCAtdiBwa2ctY29uZmlnKSIgXTsgdGhlbg0KPj4gPiAr
ICAgICAgIGlmIHBrZy1jb25maWcgLS1leGlzdHMgJFBLRzsgdGhlbg0KPj4gPiArICAgICAgICAg
ICAgICAgZWNobyBjZmxhZ3M9XCIkKHBrZy1jb25maWcgLS1jZmxhZ3MgJFBLRylcIg0KPj4gPiAr
LS0NCj4+ID4gK2NnaXQgdjEuMi4yLTEtZzVlNDkNCj4+ID4gZGlmZiAtLWdpdCBhL3JlY2lwZXMt
ZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYw0KPj4gYi9yZWNpcGVzLWV4dGVuZGVkL3hl
bi94ZW4taHlwZXJ2aXNvci5pbmMNCj4+ID4gaW5kZXggYzM4NjkxNy4uNzg0MDU5YiAxMDA2NDQN
Cj4+ID4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLWh5cGVydmlzb3IuaW5jDQo+PiA+
ICsrKyBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYw0KPj4gPiBAQCAt
NzcsMTIgKzc3LDE0IEBAIGRvX2RlcGxveVtkZXBlbmRzXSArPSAieGVuLQ0KPnRvb2xzOmRvX3Bv
cHVsYXRlX3N5c3Jvb3QiDQo+PiA+ICBkb19kZXBsb3lbZGVwZW5kc10gKz0gInhlbi10b29sczpk
b19kZXBsb3kiDQo+PiA+DQo+PiA+ICAjIEVuYWJsZSB1c2Ugb2YgbWVudWNvbmZpZyBkaXJlY3Rs
eSBmcm9tIGJpdGJha2UgYW5kIGFsc28gd2l0aGluDQo+PiA+IHRoZQ0KPj4gZGV2c2hlbGwNCj4+
ID4gLU9FX1RFUk1JTkFMX0VYUE9SVFMgKz0gIkhPU1RfRVhUUkFDRkxBR1MgSE9TVExERkxBR1MN
Cj5URVJNSU5GTyINCj4+ID4gK09FX1RFUk1JTkFMX0VYUE9SVFMgKz0gIkhPU1RfRVhUUkFDRkxB
R1MgSE9TVExERkxBR1MNCj5URVJNSU5GTw0KPj4gQ1JPU1NfQ1VSU0VTX0xJQiBSRUNJUEVfU1lT
Uk9PVF9OQVRJVkUiDQo+Pg0KPj4gSXMgdGhlcmUgYSByZWFzb24gZm9yIGV4cG9ydGluZyBSRUNJ
UEVfU1lTUk9PVF9OQVRJVkU/DQo+Pg0KPg0KPklmIEkgZG9uJ3QgZXhwb3J0IHRoaXMgdmFyaWFi
bGUgdGhlIG1jb25mLWNmZy5zaCBjYW5ub3QgcmVzb2x2ZSBpdC4NCj5JJ2xsIGdpdmUgYSB0cnkg
YnkgdXNpbmcgdGhlICR7U1RBR0lOR19MSUJESVJfTkFUSVZFfSBhbmQgc2VlIGhvdyBpdCBnb2Vz
Lg0KPg0KPj4gPiAgSE9TVF9FWFRSQUNGTEFHUyA9ICIke0JVSUxEX0NGTEFHU30gJHtCVUlMRF9M
REZMQUdTfSINCj4+ID4gIEhPU1RMREZMQUdTID0gIiR7QlVJTERfTERGTEFHU30iDQo+PiA+ICBU
RVJNSU5GTyA9ICIke1NUQUdJTkdfREFUQURJUl9OQVRJVkV9L3Rlcm1pbmZvIg0KPj4gPiAgZG9f
ZGV2c2hlbGxbZGVwZW5kc10gKz0gIm5jdXJzZXMtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3Qi
DQo+PiA+DQo+PiA+ICtDUk9TU19DVVJTRVNfTElCID0gIi1sbmN1cnNlcyAtTCRSRUNJUEVfU1lT
Uk9PVF9OQVRJVkUvdXNyL2xpYiINCj4+DQo+PiBTaW5jZSB0aGlzIGRlZmluaXRpb24gaGVyZSBk
b2Vzbid0IHVzZSB7IGJyYWNlcyB9LCB0aGUgdmFsdWUgb2YNCj4+IFJFQ0lQRV9TWVNST09UX05B
VElWRSBpc24ndCBzdWJzdGl0dXRlZCBpbnRvIENST1NTX0NVUlNFU19MSUIsIGFuZCBzbw0KPj4g
aXQgZ2V0cyBldmFsdWF0ZWQgbGF0ZXIgd2hlbiB0aGUgbWNvbmYtY2ZnLnNoIHNjcmlwdCBpcyBy
dW4uIEl0IHdvdWxkDQo+PiBiZSBnb29kIHRvIGFkZCBhIGNvbW1lbnQgdG8gZXhwbGFpbiB3aHkg
eW91J3JlIG5vdCBtYWtpbmcgdGhlDQo+PiBzdWJzdGl0dXRpb24gb2NjdXIgd2l0aGluIHRoZSBy
ZWNpcGUgaW5zdGVhZC4NCj4+DQo+DQo+SSdsbCBnaXZlIGl0IGEgdHJ5IHdpdGggYnJhY2VzIGFu
ZCBnZXQgcmlkIG9mIHRoZSBleHRyYSBleHBvcnQgaWYgaXQgd29ya3MuDQo+DQo+PiBXaXRoIGFk
ZGluZyAvdXNyL2xpYiBhcyB0aGUgc3VmZml4OiB3b3VsZCBTVEFHSU5HX0xJQkRJUl9OQVRJVkUg
YmUgYQ0KPj4gbW9yZSBhcHByb3ByaWF0ZSB2YXJpYWJsZSB0byB1c2U/DQo+Pg0KPg0KPkFncmVl
ZC4NCj4NCj4+IERvIHlvdSBuZWVkIHRvIGRlZmluZSBhbmQgYWRkIENST1NTX0NVUlNFU19JTkMg
dG8gdGhlIHRlcm1pbmFsDQo+PiBleHBvcnRzPyBJdCBsb29rcyBsaWtlIHRoYXQgaXMgYWN0dWFs
bHkgaW50cm9kdWNlZCBpbmRpcmVjdGx5IGluIHRoZQ0KPj4gbmV4dCBjb21taXQgaW4geW91ciBz
ZXJpZXMsIHNvIGlzIHRoaXMgcGF0Y2ggY29ycmVjdCB3aXRob3V0IGRvaW5nDQo+PiB0aGF0Pw0K
Pj4NCj4NCj5JIGhhdmUgdGVzdGVkIHdpdGhvdXQgdGhlIENST1NTX0NVUlNFU19JTkMgc2V0dGlu
ZyBhbmQgaXQgd29ya2VkLCB0aGlzIGlzDQo+d2h5IEkgaGF2ZW4ndCBhZGRlZCBpdCBpbiBoZXJl
Lg0KPg0KPg0KPj4gdGhhbmtzDQo+Pg0KPj4gQ2hyaXN0b3BoZXINCj4+DQo+PiA+ICsNCj4+ID4g
IEtDT05GSUdfQ09ORklHX0NPTU1BTkQgPz89ICJtZW51Y29uZmlnIg0KPj4gPiAgcHl0aG9uIGRv
X21lbnVjb25maWcoKSB7DQo+PiA+ICAgICAgaW1wb3J0IHNodXRpbA0KPj4gPiBkaWZmIC0tZ2l0
IGEvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuXzQuMTQuYmINCj4+IGIvcmVjaXBlcy1leHRlbmRl
ZC94ZW4veGVuXzQuMTQuYmINCj4+ID4gaW5kZXggMDQxM2JlZS4uOTFlODk4OCAxMDA2NDQNCj4+
ID4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuXzQuMTQuYmINCj4+ID4gKysrIGIvcmVj
aXBlcy1leHRlbmRlZC94ZW4veGVuXzQuMTQuYmINCj4+ID4gQEAgLTYsNiArNiw3IEBAIFhFTl9C
UkFOQ0ggPz0gInN0YWJsZS0ke1hFTl9SRUx9Ig0KPj4gPiAgU1JDX1VSSSA9ICIgXA0KPj4gPiAg
ICAgIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0O2JyYW5jaD0ke1hFTl9CUkFOQ0h9IFwN
Cj4+ID4gICAgICBmaWxlOi8veGVuLWFybTY0LWltcGxlbWVudC1hdG9taWMtZmV0Y2gtYWRkLnBh
dGNoIFwNCj4+ID4gKw0KPj4gZmlsZTovLzAwMDEtbWVudWNvbmZpZy1tY29uZi1jZmctQWxsb3ct
c3BlY2lmaWNhdGlvbi1vZi1uY3Vyc2VzLWxvY2F0aQ0KPj4gb24ucGF0Y2gNCj4+IFwNCj4+ID4g
ICAgICAiDQo+PiA+DQo+PiA+ICBMSUNfRklMRVNfQ0hLU1VNID89DQo+ImZpbGU6Ly9DT1BZSU5H
O21kNT00MTk3MzllMzI1YTUwZjNkN2I0NTAxMzM4ZTQ0YTRlNSINCj4+ID4gZGlmZiAtLWdpdCBh
L3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmINCj4+IGIvcmVjaXBlcy1leHRlbmRlZC94
ZW4veGVuX2dpdC5iYg0KPj4gPiBpbmRleCA0MDhiYzNiLi41Nzc5MWZjIDEwMDY0NA0KPj4gPiAt
LS0gYS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fZ2l0LmJiDQo+PiA+ICsrKyBiL3JlY2lwZXMt
ZXh0ZW5kZWQveGVuL3hlbl9naXQuYmINCj4+ID4gQEAgLTYsNiArNiw3IEBAIFhFTl9CUkFOQ0gg
Pz0gIm1hc3RlciINCj4+ID4gIFNSQ19VUkkgPSAiIFwNCj4+ID4gICAgICBnaXQ6Ly94ZW5iaXRz
Lnhlbi5vcmcveGVuLmdpdDticmFuY2g9JHtYRU5fQlJBTkNIfSBcDQo+PiA+ICAgICAgZmlsZTov
L3hlbi1hcm02NC1pbXBsZW1lbnQtYXRvbWljLWZldGNoLWFkZC5wYXRjaCBcDQo+PiA+ICsNCj4+
IGZpbGU6Ly8wMDAxLW1lbnVjb25maWctbWNvbmYtY2ZnLUFsbG93LXNwZWNpZmljYXRpb24tb2Yt
bmN1cnNlcy1sb2NhdGkNCj4+IG9uLnBhdGNoDQo+PiBcDQo+PiA+ICAgICAgIg0KPj4gPg0KPj4g
PiAgTElDX0ZJTEVTX0NIS1NVTSA/PQ0KPiJmaWxlOi8vQ09QWUlORzttZDU9NDE5NzM5ZTMyNWE1
MGYzZDdiNDUwMTMzOGU0NGE0ZTUiDQo+PiA+IC0tDQo+PiA+IDIuNy40DQo+PiA+DQo+PiA+DQo+
Pg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55
IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0
aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

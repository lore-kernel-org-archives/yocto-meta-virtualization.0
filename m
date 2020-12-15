Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.9033.1608026236618951577
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sH3HkBb+;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 529C138C070D
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGSq3zQusaRbiOJ3dErWuHDra+PPx/tx8KcapjCiwM=;
 b=sH3HkBb+9M6WA7GyyrFoz/jK31MJ9KFWudGN2MDaYl1t+P47OUbee0GB6tl2RcrKjXiu8GKYnM+RjeaD3IUMVsehK64LuH66Sud3snYEfIibIzMp82G0jPJeT2YqFcNc34lnKTYuRcH61OZTiGkKvuv4jsKp1gO81i0Jt9BuLiM=
Received: from DU2PR04CA0051.eurprd04.prod.outlook.com (2603:10a6:10:234::26)
 by VI1PR0801MB1663.eurprd08.prod.outlook.com (2603:10a6:800:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Tue, 15 Dec
 2020 09:57:11 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::62) by DU2PR04CA0051.outlook.office365.com
 (2603:10a6:10:234::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 15 Dec 2020 09:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 09:57:10 +0000
Received: ("Tessian outbound 76bd5a04122f:v71"); Tue, 15 Dec 2020 09:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee438b44090ab5ef
X-CR-MTA-TID: 64aa7808
Received: from 7dde2b4351be.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E0A757B-0DCE-4C7B-AE4C-EDE3613C5587.1;
	Tue, 15 Dec 2020 09:56:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7dde2b4351be.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 15 Dec 2020 09:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUG7Kvths1/nuYKg+MuTfzg/4d9Jd4lTD48dq6yxG0IzqkJs1UMHJwcBifunQkQ/sBWAOZXCDVDwYlQqisUQPM076Spm4eLYWRSroDYAkBIN2oePiYZmynBvOy2XOffNv2KDRnsU0pBIkSQaoitX4w13Xg8puj/nFoJXFWk6fdVmPMThv8ZPirKwydGxwSNDM2SCun3RfEXugMN3KTAi9blQyAQBHezkCcgMia7A6xRHvqspThm2a2AYygMVCpLuXEAM6WMv+vN0jUKWDpjQzSAMZMWtby6odAZBFy81RQC0KeTwRMZCLwZuNkuFzDbkNGsd1xQLFOtSg8EucnHRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGSq3zQusaRbiOJ3dErWuHDra+PPx/tx8KcapjCiwM=;
 b=eakyxijcyRW1siWk3DmwzXhs0KrrPRorS7S0uHdfuTM2JqKteIIFa2h/YPiPTarLoQg1JUPeqLwQdFeF7fEisvP57HUaB5jGMz6TlkOVA16iEhvdeVVpDarTBYlNkrGmLq6Df0ar4BMAn192iWUjun+28ETAmNoHolxMkrEUr21xpLho4jm70087b01jNdCIPFduxMsAQN99nz0sviVY9L2CqAdkVzwexEs0oi1Vb8HZjV6HHr/rE2wYHAgT1CUTBPKIBjnq38PaukFtqQjuJAyfLa1T1hvAeaDY9zfJNNJGW3a5rmXGPzMgS/rpsUxSEHW9baxCydnH1PkVk1E1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGSq3zQusaRbiOJ3dErWuHDra+PPx/tx8KcapjCiwM=;
 b=sH3HkBb+9M6WA7GyyrFoz/jK31MJ9KFWudGN2MDaYl1t+P47OUbee0GB6tl2RcrKjXiu8GKYnM+RjeaD3IUMVsehK64LuH66Sud3snYEfIibIzMp82G0jPJeT2YqFcNc34lnKTYuRcH61OZTiGkKvuv4jsKp1gO81i0Jt9BuLiM=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DB7PR08MB4601.eurprd08.prod.outlook.com (2603:10a6:10:30::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 09:56:39 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::48a0:6c02:a83e:3578]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::48a0:6c02:a83e:3578%7]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 09:56:38 +0000
From: "Lance Yang" <Lance.Yang@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Joakim Roubert <joakim.roubert@axis.com>, Michael Zhao
	<Michael.Zhao@arm.com>, meta-virtualization
	<meta-virtualization@yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
Thread-Topic: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
Thread-Index: 
 AQHWvN7jgv01Iw0ulEaEn70waR1PtanMUR8AgAABKgCAAAJ1AIAAAqmAgAAIdIuAAAHlgIAAV5FmgAF95YCAACSxgIAjN3nwgAB6KwCABgP2YA==
Date: Tue, 15 Dec 2020 09:56:38 +0000
Message-ID: 
 <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
 <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
 <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
 <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
 <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
 <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 74FF2FA6E03C534F8609A5D5A055C602.0
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2402:9e80:0:1000::1:8724]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16b8f737-5008-47a7-e447-08d8a0dfca8a
x-ms-traffictypediagnostic: DB7PR08MB4601:|VI1PR0801MB1663:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB16637230685FF71353B31D0291C60@VI1PR0801MB1663.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hhet3TUvbV8ztCneQJp7PS81bFQecoUYwdsfyAXv1YJQzeHEklzE72VEwJv3ifkPqceI7ZHuT7JGR7oZNDHu71QJarPCAhSjn1fV1aSmsfpqTG5jX/QRRma6v+0+CrYlHIqGJY1/CIL9ZJMu9cqMkNOJDd8LsU7ja1eH4o1kYjujk4hrFBmNr0NO5CwkOz32u5dAhCazNQf9tqH+s7aDg6CUkhLGRxAoBGHr0SgTq2zbXRM4AB9VAUM4cbC+l7I0i6y3rFQWrRLfugOso6YDS7mAo9tBfuZmzu/J5QT41UUIy7v650CkvSRXWY+ujftD3+NJZq89Sh3dV0g6cYsU1A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(478600001)(316002)(6506007)(83380400001)(9686003)(8936002)(2906002)(71200400001)(55016002)(66446008)(86362001)(76116006)(7696005)(4326008)(186003)(66946007)(4001150100001)(66556008)(64756008)(33656002)(66476007)(52536014)(53546011)(5660300002)(8676002)(54906003)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?TnNjTVpyTDJ6TDVyamU5NHlLbTJIWnJmekRUT3ViUFNjMHVyWms0UTduRXBr?=
 =?utf-8?B?b3g2ZCt6TkRBVlh6OGtwRnBDZGF4V0Y1U050K05PY3J6eHB4ZXVwOVdMYjRt?=
 =?utf-8?B?cFZSSFIvTGFOTzU4aWRFeFl3TzBkSGs0dlZqMi83TGZtaG9tdm9VejZQWXlF?=
 =?utf-8?B?M2ZlcHg2SVVWU2d4ZTJTUDFXQnNKbDZ1S2VweDBuWktTYVNwY1FicWdWMDJU?=
 =?utf-8?B?NVB3cmlSRlNLMitWSEJsczhBRmIwRlAxdTIzdTZrSWxaY042WjRhcDcvVUJu?=
 =?utf-8?B?L1lFWDNlRW05LzNtaEwrTXZmdUtEOW5EV0RLTUxyOGZ2cDlLQjJzUkFtQUpQ?=
 =?utf-8?B?TXNXelI4ekdrNFdTQW1lV1pHTlo1aGM3QU80ZmR6bTRCc3FKVDAzejQ2MjNy?=
 =?utf-8?B?Z0NFaityTkpJVzc0MEVRemVhbmhWM0RIWUFNZmNWM09LTjVxVkFEVWE2Tktw?=
 =?utf-8?B?SEhRRGZBVUs0dTI1MW44Y3NxNjd2ZzRyS0hQUjZ6c20wMWZMWGxDZkhUTXh4?=
 =?utf-8?B?cXR3bEF6K1VDaVNKMHArRW4wMllCZG9TN21LS0NkekpKWHp6VThTdHI1TjRO?=
 =?utf-8?B?VUJ2ZWlvaW1JSEM5c25UM1VxZ2ZhVmZDWWdiTVJTTkVrT3RGRnppR2RORzZn?=
 =?utf-8?B?UDJaeDJ6aCtCRUo3NGx6aTE0R21oRDZKbDMwSFBkVTBNdG5jWkJsUmk2N1c4?=
 =?utf-8?B?K09EWUN0bU5TTEZkWmRsbUxSTHZranFlbmtQd1I0MXN5OHZ4L2hCVlNNb2cv?=
 =?utf-8?B?dUIyUmxPM2JLUUEyejVLKzFPcXFhWHpnZThNdWlZSVJ5QkZXVnYyNDdjcElk?=
 =?utf-8?B?WnA3ZjR3ZlR0eXJSL05iSDNBZmF1d2k5bjAzZ1NGTkMwb1REN0lSbFVBOCtv?=
 =?utf-8?B?YU1hMVlBUlRUOHRZL3R5TEZwZXFLMlFqR2RkYlB1QnV1Y2xBZ2gvbDl4MDlH?=
 =?utf-8?B?WE9kR1pZSU5lYUJzWHhUZmtDeGdZT21OSmFwRlk2TDBGalVxa0YzVUtvcEkw?=
 =?utf-8?B?RTNucThNL2xQdDNYZEpUSXVlbXd3QzVWSkpzUGN1ZHVSbkNNRnAwdG4yVHJw?=
 =?utf-8?B?OHphNFR4SS92a0pkT1JtRlU3bUhJZVVDZ1ZNK2ZZbXIvLzRMbUlHYzNkMDhT?=
 =?utf-8?B?bUh6c0lzNDlvVjJTR0Uvc2tFdHlqbDFPejJ0bFNuRVB1R0hPb2s4NmJJUTZF?=
 =?utf-8?B?SUhVU0crTHg1L21tRkoySWNwaUZFMlRVN3VTcmJJQjNHRWRBNHhiMUdSZHp0?=
 =?utf-8?B?OVVKNjNZdmpnQllQUFBFeDNhNkNaWE9VcEhybThWcHVxM2xXY3JWZDRINFIw?=
 =?utf-8?B?K1JSVUo0cVhTZGw0OS9uSWFKUndXazgxUk03UmlLZkhvNjJ4aENTQ3ZKSDJq?=
 =?utf-8?B?Z2ZxSUdFajQva1E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4601
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2235ea05-2c12-4bc3-da74-08d8a0dfb773
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+4rTIkBfmsUTUQ1t2P1XiTvItlAgQ0sQv4Et4iacsCubbeqWtj9uyarUeIjb7zPsNNqj+qZZ+FT0m/R1LItCPXVIWWCQj49xpl9YROvMap5vg4C/83MVFyXaytGzTlNFHC90wX7TVk7ZPj3fSbg9ZMRa/Ekd4TxFFrd3EwX+lm7XNizQX3thyHXuzJYCxSCKS6jHRxqTn+36ZAZYNeDg6L/jzn65ltNflDJZLHWclg7e0Hk99ewDuhv80/hGg4FPVNEpvX7lrhSxBYiZvN857eEOzEV/a4ObzIerPBPJJXUqFkQY746jiF6DW1YMvAHz/mf9vGJDvwCtl8zezmxKSyrj8oLtAEOCJbdfy+4T1kDp2z+BMfe9lEXZM/BXHrJPgA46cmUkeqkvKTImA/JXxg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(86362001)(316002)(26005)(5660300002)(52536014)(55016002)(70586007)(2906002)(4326008)(53546011)(8676002)(9686003)(6862004)(8936002)(4001150100001)(336012)(6506007)(54906003)(70206006)(7696005)(33656002)(478600001)(83380400001)(47076004)(81166007)(356005)(186003)(82740400003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 09:57:10.9086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8f737-5008-47a7-e447-08d8a0dfca8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1663
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNClRoYW5rcyBmb3IgeW91ciBxdWljayByZXBseS4NCg0KWWVzdGVyZGF5LCBJ
IHB1bGxlZCBtZXRhLXZpcnR1YWxpemF0aW9uIG1hc3Rlci1uZXh0IGJyYW5jaCB0byBteSBsb2Nh
bCBzZXJ2ZXIgYW5kIHRyeWluZyB0byBidWlsZCBrM3Mgd2l0aCBxZW11eDg2LTY0IGltYWdlLiAg
SW4gbWFzdGVyLW5leHQgYnJhbmNoLCBJIGZvdW5kIHlvdSBoYWQgY3JlYXRlZCBESVNUUk9fRkVB
VFVSRSBjaGVjayBmb3IgazNzIGFuZCBzb21lIHBhY2thZ2UgZ3JvdXBzIGZvciBrM3MuIEUuZy4g
cGFja2FnZWdyb3VwLWszcy1ub2RlLCBwYWNrYWdlZ3JvdXAtazNzLWhvc3QuDQoNCkkgY29uZmln
dXJlZCBteSBsb2NhbC5jb25mIHRvIGluc3RhbGwgazNzIHdpdGggZm9sbG93aW5nIGNvbmZpZ3Vy
YXRpb25zOg0KDQpESVNUUk9fRkVBVFVSRVNfYXBwZW5kID0gIiBrM3MgdmlydHVhbGl6YXRpb24i
DQpJTUFHRV9JTlNUQUxMX2FwcGVuZCA9ICIgcGFja2FnZWdyb3VwLWszcy1ub2RlIHBhY2thZ2Vn
cm91cC1rM3MtaG9zdCBjZ3JvdXAtbGl0ZSBrZXJuZWwtbW9kdWxlcyINCg0KSG93ZXZlciwgd2hl
biBJIHVzZToNCg0KYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWwNCg0KdG8gY29tcGlsZSBhIG1p
bmltYWwgaW1hZ2UgdG8gdGVzdCBrM3MuICBJIGVuY291bnRlcmVkIHRoZSBmb2xsb3dpbmcgZXJy
b3IgbWVzc2FnZToNCg0KZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRp
b24g4oCYLWZtYWNyby1wcmVmaXgtbWFwPS9wYXRoL3RvL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgvbGlidmlydC82LjMuMC1yMD0vdXNyL3NyYy9kZWJ1Zy9saWJ2aXJ0LzYuMy4w
LXIw4oCZDQp8IGVycm9yOiBjb21tYW5kICcvaG9tZS9sYW5jZS9yZXBvcy9idWlsZC90bXAvaG9z
dHRvb2xzL2djYycgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDENCnwgV0FSTklORzogZXhpdCBjb2Rl
IDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQuDQp8IEVSUk9SOiBFeGVjdXRpb24gb2YgJy9wYXRoL3Rv
L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvbGlidmlydC82LjMuMC1yMC90ZW1w
L3J1bi5kb19jb21waWxlLjE2MjA0OCcgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDE6DQoNCkl0IHNl
ZW1zIHRoZSBlcnJvciB3YXMgcmVsYXRlZCB0byBsaWJ2aXJ0LiBJIHR3byB0aHJlZSBxdWVzdGlv
bnMgaGVyZS4gSWYgeW91IG5lZWQgbW9yZSBsb2cgZGV0YWlscywgcGxlYXNlIGxldCBtZSBrbm93
Lg0KDQoxLiBEbyBJIG1pcy1jb25maWcgYW55dGhpbmcgc28gdGhhdCB0aGUgZXJyb3IgYWJvdmUg
YXBwZWFyZWQ/IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciBjb25maWd1cmF0aW9uIHdoZW4g
eW91IGNvbXBpbGUgdGhlIGltYWdlIHdpdGggazNzPw0KMi4gRG8gd2UgbmVlZCBsaWJ2aXJ0IHdo
ZW4gd2UgaW5zdGFsbCBrM3M/IEZyb20gbXkgb3duIGV4cGVyaWVuY2UsIGxpYnZpcnQgaXMgZm9y
IHZpcnR1YWxpemF0aW9uLiBXaGVuIEkgcnVuIGszcyBvbiBiYXJlLW1ldGFsLCBJIGRvbid0IHRo
aW5rIEkgaW5zdGFsbCBhIGxpYnZpcnQgY29tcG9uZW50LiBBbmQgYmVmb3JlLCBJIHJhbiBhIGsz
cyBzdWNjZXNzZnVsbHkgd2l0aG91dCBsaWJ2aXJ0IG9uIGFhcmNoNjQgWW9jdG8gTGludXguDQoN
Ck9uY2UgSSBzdWNjZXNzZnVsbHkgYnVpbHQgdGhlIHFlbXV4ODYtNjQgaW1hZ2UsIEkgYW0gd2ls
bGluZyB0byBzcGFyZSBzb21lIGVmZm9ydCB0byByZXByb2R1Y2UgdGhlIGJ1Z3MgeW91IG1lbnRp
b25lZCBpbiB0aGUgcHJldmlvdXMgZW1haWwuIFdvdWxkIHlvdSBtaW5kIHNoYXJpbmcgeW91ciBj
b25maWcgdG8gbWU/DQoNCkJlc3QgUmVnYXJkcywNCkxhbmNlDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWls
LmNvbT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMSwgMjAyMCA5OjQ0IFBNDQo+IFRvOiBM
YW5jZSBZYW5nIDxMYW5jZS5ZYW5nQGFybS5jb20+DQo+IENjOiBKb2FraW0gUm91YmVydCA8am9h
a2ltLnJvdWJlcnRAYXhpcy5jb20+OyBtZXRhLXZpcnR1YWxpemF0aW9uIDxtZXRhLQ0KPiB2aXJ0
dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnPjsgbmQgPG5kQGFybS5jb20+OyBNaWNoYWVsIFpo
YW8NCj4gPE1pY2hhZWwuWmhhb0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVh
bGl6YXRpb25dW1BBVENIXSBrM3M6IEJ1bXAgdG8gdjEuMTkuMytrM3MzDQo+DQo+IE9uIEZyaSwg
RGVjIDExLCAyMDIwIGF0IDE6MzEgQU0gTGFuY2UgWWFuZyA8TGFuY2UuWWFuZ0Bhcm0uY29tPiB3
cm90ZToNCj4gPg0KPiA+IEhpIEJydWNlIGFuZCBKb2FraW0sDQo+ID4NCj4gPg0KPiA+DQo+ID4g
SSByZWNlbnRseSBzYXcgYSBuZXcgYnJhbmNoIG1hc3Rlci1uZXh0IGhhcyBiZWVuIGNyZWF0ZWQg
aW4gbWV0YS0NCj4gdmlydHVhbGl6YXRpb24uIEl0IG1haW5seSByZWxhdGVkIHRvIGszcyBhbmQg
SSBzYXcgazNzIGhhZCBiZWVuIGJ1bXBlZCB0bw0KPiB2MS4xOS4gSSB3b3VsZCBsaWtlIHRvIGtu
b3cgaWYgdGhlIGszcyBwYXRjaCB3aWxsIGJlIG1lcmdlZCBpbnRvIG1hc3RlciBicmFuY2gNCj4g
c29vbi4gIEkgcmVtZW1iZXJlZCB5b3UgbWVudGlvbmVkIGszcyB2MS4xOCBoYXMgc29tZSBhZ2Vu
dCByZWdpc3RyYXRpb24NCj4gaXNzdWUgYW5kIHNvbWUgaGFkIGNyYXNoIGxvb3AgaXNzdWVzLg0K
PiA+DQo+ID4NCj4gPg0KPiA+IFdoYXQgaXMgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBrM3Mg
cGF0Y2g/IElzIHRoZXJlIGFueSBmdXJ0aGVyIGlzc3Vlcz8NCj4NCj4gSXQgaXMganVzdCBpbiBt
YXN0ZXItbmV4dCwgdG8gc2hvdyB0aGF0IHNvbWUgY2xlYW51cHMgaGF2ZSBiZWVuIGRvbmUsIGFu
ZA0KPiB0aGUgc3VwcG9ydGluZyBjb21wb25lbnQgdmVyc2lvbiBidW1wcyB0aGF0IEkndmUgZG9u
ZSwgYnV0IG5vLCBpdCBzdGlsbA0KPiBkb2Vzbid0IHdvcmsgdW5kZXIgcWVtdXg4Ni02NCwgc28g
aXQgY2FuJ3QgYWN0dWFsbHkgbWVyZ2UgdG8gbWFzdGVyLg0KPg0KPiBUaGUgbm9kZSBiZWNvbWVz
IHJlYWR5LCBidXQgYWxsIHRoZSBjb3JlIGNvbnRhaW5lcnMgZ28gaW50byBhIGNyYXNoYmFja29m
Zg0KPiBsb29wLCBrdWJlY3RsIGxvZ3MgZG9lc24ndCB3b3JrLCBhbmQgd2Ugc3RpbGwgY2FuJ3Qg
cmVnaXN0ZXIgYSBjbGllbnQgd2l0aCBpdA0KPiAobGlrZWx5IGJlY2F1c2Ugb2Ygc3ltcHRvbSAj
MSkuDQo+DQo+IEknbSBhbHNvIGNoYXNpbmcgZG93biBhbiBpcHRhYmxlcyBpc3N1ZSAodGhhdCBJ
IGhhZCBwcmV2aW91c2x5IGZpeGVkKSwgYnV0DQo+IHNob3VsZCBoYXZlIHRoYXQgc29ydGVkIHNo
b3J0bHkuDQo+DQo+IEJydWNlDQo+DQo+ID4NCj4gPg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0K
PiA+DQo+ID4gTGFuY2UNCj4gPg0KPiA+IEZyb206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiA+IDxtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZQ0KPiA+IEFzaGZpZWxkIHZpYSBsaXN0cy55b2N0
b3Byb2plY3Qub3JnDQo+ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE5LCAyMDIwIDQ6Mzkg
QU0NCj4gPiBUbzogSm9ha2ltIFJvdWJlcnQgPGpvYWtpbS5yb3ViZXJ0QGF4aXMuY29tPg0KPiA+
IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uIDxtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVj
dC5vcmc+DQo+ID4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gazNz
OiBCdW1wIHRvIHYxLjE5LjMrazNzMw0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+
DQo+ID4gT24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgMToyNyBQTSBKb2FraW0gUm91YmVydA0KPiA8
am9ha2ltLnJvdWJlcnRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gMjAyMC0xMS0xNyAy
MDozOSwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+ID4gID4NCj4gPiA+IHJvb3RAcWVtdXg4Ni02
NDp+IyBrdWJlY3RsIGdldCBwb2RzIC1uIGt1YmUtc3lzdGVtIE5BTUUgUkVBRFkNCj4gU1RBVFVT
DQo+ID4gPiBSRVNUQVJUUyBBR0UNCj4gPiA+IGxvY2FsLXBhdGgtcHJvdmlzaW9uZXItN2ZmOTU3
OWM2LWJkOTQ3IDAvMSBDcmFzaExvb3BCYWNrT2ZmIDgyMm0NCj4gPiA+IGNvcmVkbnMtNjZjNDY0
ODc2Yi03NmJkbCAwLzEgQ3Jhc2hMb29wQmFja09mZiA4MjJtDQo+ID4gPiBoZWxtLWluc3RhbGwt
dHJhZWZpay1tdnQ1ayAwLzEgQ3Jhc2hMb29wQmFja09mZiA4MjJtDQo+ID4gPiBtZXRyaWNzLXNl
cnZlci03YjRmOGI1OTUtY2s1a3ogMC8xIENyYXNoTG9vcEJhY2tPZmYgODIybQ0KPiA+ID4gcm9v
dEBxZW11eDg2LTY0On4jDQo+ID4NCj4gPiAgRnJvbSBteSBvd24gZXhwZXJpZW5jZSB3aXRoIENy
YXNoTG9vcEJhY2tPZmYgc2l0dWF0aW9ucyBpcyB0aGF0IHRoZXJlDQo+ID4gbWF5IGJlIHNlcnZl
cmFsIGRpZmZlcmVudCB0aGluZ3MgY2F1c2luZyB0aGF0LiBDYW4geW91IHRyYWNlIGRvd24gd2hh
dA0KPiA+IGlzIGNhdXNpbmcgdGhlIENyYXNoTG9vcEJhY2tPZmYgaGVyZT8NCj4gPg0KPiA+DQo+
ID4NCj4gPiBOb3QgcmVhbGx5LiBUaGUgYnVpbGQgc2VlbXMgdG8gaGF2ZSBzb21lIHNvcnQgb2Yg
bWlzY29uZmlndXJhdGlvbiBhbmQgbm8NCj4gbG9ncyBhcmUgY3JlYXRlZCAoYW5kIGhlbmNlIGNh
bid0IGJlIGFjY2Vzc2VkIHZpYSBrdWJlY3RsKS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBSdW5uaW5n
IHRoZSBzZXJ2ZXIgb24gdGhlIGNvbW1hbmQgbGluZSBqdXN0IGdldHMgdXMgcmVhbXMgb2YgbWVz
c2FnZXMNCj4gYW5kIGEgbG90IG9mIGZhbHNlIGxlYWRzICh0b28gbWFueSBuYW1lc2VydmVycywg
aXB0YWJsZXMgLS1yYW5kb20tZnVsbHkgbm90DQo+IHN1cHBvcnRlZCwgZXRjICkuDQo+ID4NCj4g
Pg0KPiA+DQo+ID4gSSd2ZSB0cmllZCBhIGZldyB2YXJpYW50cyB0b2RheSwgYnV0IGNhbid0IGdl
dCBhbnkgcmVhbGx5IHNpbXBsZSBsb2dzIG91dC4gSSdsbCBkbw0KPiBtb3JlIHRvbW9ycm93Lg0K
PiA+DQo+ID4NCj4gPg0KPiA+IEkndmUgYmVlbiBhYmxlIHRvIGNvbmZpcm0gdGhhdCBteSBwYWNr
YWdlZ3JvdXAvaW1hZ2UgdHlwZSBydW5zIGRvY2tlciwNCj4gY29udGFpbmVyZCwgYW5kIHJ1bmMg
bGF1bmNoZWQgY29udGFpbmVycyBqdXN0IGZpbmUsIHNvIHRoaXMgaXMganVzdCBzb21lDQo+IHF1
aXJrL2lkaW9jeSBvZiBrKnMgdGhhdCBpcyBjYXVzaW5nIHRoZSBwcm9ibGVtLg0KPiA+DQo+ID4N
Cj4gPg0KPiA+IEJydWNlDQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPiBCUiwNCj4gPg0KPiA+IC9K
b2FraW0NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gLS0NCj4gPg0KPiA+IC0gVGhvdSBz
aGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBh
d2FpdA0KPiA+IHRoZWUgYXQgaXRzIGVuZA0KPiA+IC0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0g
R2FuZGFsZiwgU3RhciBUcmVrIElJDQo+ID4NCj4gPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29u
dGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZQ0KPiBjb25maWRlbnRp
YWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQsDQo+IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQg
ZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkNCj4gb3RoZXIgcGVyc29uLCB1c2Ug
aXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBh
bnkNCj4gbWVkaXVtLiBUaGFuayB5b3UuDQo+DQo+DQo+DQo+IC0tDQo+IC0gVGhvdSBzaGFsdCBu
b3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0
aGVlDQo+IGF0IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBT
dGFyIFRyZWsgSUkNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJp
dmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRl
bnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3Jl
IG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

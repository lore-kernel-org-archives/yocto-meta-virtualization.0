Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.46])
 by mx.groups.io with SMTP id smtpd.web09.27955.1604304466732968192
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 00:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Hp3i4yRv;
 spf=pass (domain: arm.com, ip: 40.107.5.46, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJwIA8bc7+F0NRCBobFW4pQha8+8iH/eLsDUyZ2Tmhk=;
 b=Hp3i4yRvkDKMAczEk/A8q1JirmeZBFV8DlIzmcxElJilTnb4KU1zzdtQNEKtlPEH5kFpb8agbxwyQcwQRo5ZHvs7sm71/vyEVG++UVaNSvlrzZGixOibSa6twcgleg1TAnpRH4EfoCl12Owb4kqokkLMddk42KlwTOp9QRxZ/7E=
Received: from AM5PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:203:2::30)
 by DB6PR0802MB2246.eurprd08.prod.outlook.com (2603:10a6:4:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 08:07:43 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::de) by AM5PR0701CA0068.outlook.office365.com
 (2603:10a6:203:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Mon, 2 Nov 2020 08:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 08:07:42 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Mon, 02 Nov 2020 08:07:42 +0000
X-CR-MTA-TID: 64aa7808
Received: from b12a28a38bb2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 285009FC-E93F-48BA-BDD6-8A9F3D6EEA9C.1;
	Mon, 02 Nov 2020 08:07:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b12a28a38bb2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 08:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWeQQZrAbIA3CK8eM3jsVCyZC+C2DPBV/OqPSYL996XHidIJfIYclilTWxPNq4ByGEs0+xTnNW+zYUuQbVv6PdinTLjcIiTX/dlWVBgD/MDWc5C5IwfAzm0ydQ7XmiwimUTnv2L0BId5GVP8RpaqlLuuj2hA1uaBP4abc288QHs5WiL8F/8gDY5NIn0P8pyFwIpGRW3aFTFMLTZ7ed0klZMuCXkiFCe+XX4Cq1M7zdTQH1yF2fC9GO9gwzv3PUSC1Xn07JC+klfDBkBLTGQhaE04h9Bx8GeqZJteleXKkVX7Ug/cLtS8YsqYYgHjrGrbcrQkYAc1XYrcpFXTIk908Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJwIA8bc7+F0NRCBobFW4pQha8+8iH/eLsDUyZ2Tmhk=;
 b=LvXopNKqAMtDRRa/1uiqqBSTCDzqwjHqq5J8w4WCPuIogh7Pmj96TaP/5y8tGl13hV+gJSXHefLxcyw3q4pLj3NuYP4biYOM4Khjn5HUJZKkX/axbYoi1QUXimPVzZdeu2gyNPSNFH8NfSOO0dL+PuTdAsGvClJU6lJ3E0clc86UNsDOXPM2FiIeX8/fcIdAcUJU4XHckMIrfefQYFzUVtWEedoQDm5U+iTpNQWtt16CIlN30/hd2Ni0vbX96INkScCLuwWxzZKFs6ulT+CstOGobGZA7cNjFYK3UrYWQEDBepzQ3/L9w5V0BdBYSW7yabAzm3FRjOOPmZi6PONb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJwIA8bc7+F0NRCBobFW4pQha8+8iH/eLsDUyZ2Tmhk=;
 b=Hp3i4yRvkDKMAczEk/A8q1JirmeZBFV8DlIzmcxElJilTnb4KU1zzdtQNEKtlPEH5kFpb8agbxwyQcwQRo5ZHvs7sm71/vyEVG++UVaNSvlrzZGixOibSa6twcgleg1TAnpRH4EfoCl12Owb4kqokkLMddk42KlwTOp9QRxZ/7E=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5143.eurprd08.prod.outlook.com (2603:10a6:20b:ed::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 08:07:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 08:07:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Topic: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Index: AQHWrHn0Oytpowydxk2X9qW7uvn8Kqmv2AfAgACeZYCABAvCEA==
Date: Mon, 2 Nov 2020 08:07:36 +0000
Message-ID: 
 <AM6PR08MB3461CACAF9EC0A8A7DAA16D392100@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <AM6PR08MB3461B708E14D6181ADF4993992150@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <E4E29C95-6EE6-4A5C-834F-CC08641C03BB@gmail.com>
In-Reply-To: <E4E29C95-6EE6-4A5C-834F-CC08641C03BB@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 53835BD5E524924396A8AB1ED6BCEA44.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 349e873b-c82c-48a0-84cc-08d87f065ff2
x-ms-traffictypediagnostic: AM6PR08MB5143:|DB6PR0802MB2246:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2246FD72D45A4B93167A110E92100@DB6PR0802MB2246.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dksWqf8RWEmf8fWMyLWfew/8Bm9lCbI71AyQ7ZgbeQwpQz3O8KhuMxK9wkW+sDZfFNr1iWKQSbzqMAdTWUx98yZrMAtpwujTbCu9yu268lKzpxv63v7ubB01PrgQoATMHo7MSrx4J+bXTJMkxD0KjdIJYDwNCRV91QKJ0jzFxqTuZE/DeydJfiO7Z8v3uIEHVwebDNX4RgM3wghyJI3RkNNS5vz8q4Nv34LjKkRSfk1fZmERTqdhWD7XdBJ7QP4/iRYnjK6mjEr/+9fG8tcysKRLxKP9sEZ0i0L9PdqgRlesxY4MAsFHkE3uc3RMxFIlWUtZp3K7pKyYGZoGv9Luzss+gquF/iwuA/hQL1A2ziqfeGnoLwBPuB+NxTRgzynGMG16fo74VGgNuwXRdxSeig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(33656002)(86362001)(6916009)(316002)(66446008)(64756008)(66476007)(66556008)(66946007)(83380400001)(76116006)(9686003)(8676002)(478600001)(8936002)(52536014)(55016002)(5660300002)(7696005)(54906003)(6506007)(71200400001)(4326008)(2906002)(53546011)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Cxn/J0ZEUvuEmxTtfEAV8yzl5B3101pgcbZjNfkKLZmWczM0Jzdz2OaCJIbeXlS7QiZOchLzfM9SXS2MehupN72AS1CzzTltXcaUqrceQ2TpDGbQYfGW7zv760JTfchwxceznSViwa1k4vgSzTgR+Pb196g552NZazD2yh7lljRUmLoEcaJ2NCqGy5y+xWj2RhZwHOMArhk8ybvYpGuuSF7zM2lJHphbGFYM1azaKLWMV1/+id76ne78dP2TY7dovujm3F2zSH5DOrHkG38Y+9LeO0TS8oHc5dGw45k/cWA2fzn8ODb9WYlACrSUpyb2eHZue6CyUzzt4jvj7WkxEWP6IGXc73h3XKGKgyybXvmCAcgqeD7dGkVQ+nEuMF7rAVe1CMoxyDZR29vxksSMKoY04NeOBS6uc3+MPuBf3UtzRN1b1Co9D3bGFWzInrwz2roarPvYGtOV6Kb0saTsZ5LIwB1UAiCWK7JT1Yp2CMyNHImV8vwryLjik4ILDIg456lffOIwZmNS0G+FQOYRRyfckj3+nGLBfbzb8N01waytqBi4X7Ntt/adqTAwZmioB0I0JpHgmqIMOmbsT0Yeh1DFAKcFYP0E9uBYMHdTnfdqL31iNCgtmRQWU90SQZYyDLOrOkjjjnN25X8lDB4Jfg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5143
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	82804e2a-b222-4241-3e48-08d87f065bf9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nRtRYa7v3Oy+YImURFIDZDWx2dzI0LdccGggZjbS4jkCRH5qEbfgNorLrZfW9qoggiXqFk3FtSVHp/SapLJIX13Bd2Cmcl0MBI+Olol2duIT+lDNk+FPpAvkohwERRmoQ6ePX3ug6TZ2gBjmDH+PK2UWRDeTdbCtEpgcUAZ6cBIZjvHr9dx/jyj0BWAclCwg8KjZyAYDd2CZhTM3ZyQeg0AY5JMjTmiHJRsw18gB3ipHvQNGToq+XO6/Chl96IQhtGFmybA4rzpelV9yKLKy0YAHc6oV1yOvRX/0DGzo4engAKgLdQrROZJLglaMpOEVdXsk22YO3hHyM2+ry5MYxMk+q2PXTZ3qWM3UpyTDHJy7DVinuEWmvNM3UbEv+SWu7+KJXaaTgSoPbd734SMutqAVKo4TbPrktzo5PinnEa/Ia6od5IgITcyw+VZG/Xm7YtTSKgmcOe6uIWY6XC91x4CtFJ2Qb0IlL+KyLTbsiaY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(8936002)(55016002)(70206006)(4326008)(6506007)(52536014)(83380400001)(336012)(53546011)(8676002)(82740400003)(5660300002)(33656002)(26005)(6862004)(82310400003)(478600001)(86362001)(356005)(47076004)(9686003)(186003)(54906003)(316002)(2906002)(36906005)(7696005)(70586007)(107886003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 08:07:42.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 349e873b-c82c-48a0-84cc-08d87f065ff2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2246
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPnZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBDaHJpc3RvcGhlciBDbGFyayB2aWENCj5saXN0cy55
b2N0b3Byb2plY3Qub3JnDQo+U2VudDogMzAgT2N0b2JlciAyMDIwIDE4OjA5DQo+VG86IERpZWdv
IFN1ZWlybyA8RGllZ28uU3VlaXJvQGFybS5jb20+DQo+Q2M6IG1ldGEtdmlydHVhbGl6YXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgbmQgPG5kQGFybS5jb20+Ow0KPmNhcmRvZUBnZW50b28u
b3JnDQo+U3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbUEFUQ0ggMi8yXSB4ZW46
IGV4dGVuZCBTWVNST09UX0RJUlMNCj4NCj4NCj4NCj4+IE9uIE9jdCAzMCwgMjAyMCwgYXQgMTo0
MyBBTSwgRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4g
DQo+Pj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IG1ldGEtdmly
dHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS0NCj4+PiB2aXJ0dWFsaXph
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgRGllZ28gU3VlaXJvIHZp
YQ0KPj4+IGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4+PiBTZW50OiAyNyBPY3RvYmVyIDIwMjAg
MTU6NTYNCj4+PiBUbzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+Pj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgRGllZ28gU3VlaXJvIDxEaWVnby5TdWVpcm9AYXJt
LmNvbT47DQo+Pj4gY2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb207IGNhcmRvZUBnZW50b28u
b3JnDQo+Pj4gU3ViamVjdDogW21ldGEtdmlydHVhbGl6YXRpb25dIFtQQVRDSCAyLzJdIHhlbjog
ZXh0ZW5kIFNZU1JPT1RfRElSUw0KPj4+DQo+Pj4gVGhlIGRvX2luc3RhbGwgdGFzayBhbHNvIHNo
aXBzIGZpbGVzIHRvIC9ib290IGFuZCAvdXNyL2xpYjY0LiBIZW5jZSwNCj4+PiBleHRlbmQgU1lT
Uk9PVF9ESVJTIHRvIGluY2x1ZGUgdGhlc2UgcGF0aHMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KPj4NCj4+IEBDaHJpc3RvcGhl
ciwNCj4+IENhbiB5b3UgcGxlYXNlIGFsc28gcmV2aWV3IHRoaXMgcGF0Y2g/DQo+DQo+SGkgRGll
Z28sDQo+DQo+SSBzdGFydGVkIG9uIHJldmlld2luZyB0aGlzIGJ1dCBpdCB0b29rIGEgbGl0dGxl
IGxvbmdlciB0aGFuIEknZCBhbnRpY2lwYXRlZCBhcyBpdA0KPnJlcXVpcmVzIGl0IGRpZ2dpbmcg
aW50byB3aGF0IHRoZSBTWVNST09UX0RJUlMgdmFyaWFibGUgZG9lcy4NCj4NCj5UaGUgdmFyaWFi
bGVzIHlvdSB1c2UgZm9yIHRoZSBkaXJlY3RvcmllcyBiZWluZyBhZGRlZCBsb29rIG9rLCBnaXZl
biB0aGF0IHRoZQ0KPnJlY2lwZSBkb2VzIGluc3RhbGwgdG8gdGhlcmUsIGJ1dCBJIGRvbid0IHF1
aXRlIHVuZGVyc3RhbmQgd2h5IHRoZXkgbmVlZCB0byBiZQ0KPmFkZGVkIHRvIFNZU1JPT1RfRElS
Uy4gRG9lcyBldmVyeSBkaXJlY3RvcnkgdGhhdCB0aGUgcmVjaXBlIGluc3RhbGxzIHRvIG5lZWQN
Cj50byBiZSBsaXN0ZWQgaW4gdGhhdCB2YXJpYWJsZT8gSSBzYXcgdGhhdCAke2JpbmRpcn0gaXMg
bm90IGxpc3RlZCBhcyBpbmNsdWRlZCBpbiBpdCBieQ0KPmRlZmF1bHQgaW4gdGhlIFlvY3RvIG1l
Z2EtbWFudWFsIGRvY3MuDQo+V2hhdCBiZWhhdmlvdXIgaXMgdGhpcyBjaGFuZ2UgaW50ZW5kZWQg
dG8gZml4PyBDb3VsZCBpdCBiZSBkZXNjcmliZWQgaW4gdGhlDQo+Y29tbWl0IG1lc3NhZ2U/DQoN
ClF1b3RpbmcgdGhlIG1hbnVhbCAoaHR0cHM6Ly93d3cueW9jdG9wcm9qZWN0Lm9yZy9kb2NzL2xh
dGVzdC9tZWdhLW1hbnVhbC9tZWdhLW1hbnVhbC5odG1sI25ldy1zaGFyaW5nLWZpbGVzLWJldHdl
ZW4tcmVjaXBlcyk6DQoiIEEgc3Vic2V0IG9mIHRoZSBmaWxlcyBpbnN0YWxsZWQgYnkgdGhlIGRv
X2luc3RhbGwgdGFzayBhcmUgdXNlZCBieSB0aGUgZG9fcG9wdWxhdGVfc3lzcm9vdCB0YXNrIGFz
IGRlZmluZWQgYnkgdGhlIHRoZSBTWVNST09UX0RJUlMgdmFyaWFibGUgdG8gYXV0b21hdGljYWxs
eSBwb3B1bGF0ZSB0aGUgc3lzcm9vdC4gSXQgaXMgcG9zc2libGUgdG8gbW9kaWZ5IHRoZSBsaXN0
IG9mIGRpcmVjdG9yaWVzIHRoYXQgcG9wdWxhdGUgdGhlIHN5c3Jvb3QuIFRoZSBmb2xsb3dpbmcg
ZXhhbXBsZSBzaG93cyBob3cgeW91IGNvdWxkIGFkZCB0aGUgL29wdCBkaXJlY3RvcnkgdG8gdGhl
IGxpc3Qgb2YgZGlyZWN0b3JpZXMgd2l0aGluIGEgcmVjaXBlOg0KDQogICAgIFNZU1JPT1RfRElS
UyArPSAiL29wdCINCiINCg0KSWYgYSByZWNpcGUgREVQRU5EU18ke1BOfSA9ICJ4ZW4iLCBpdCBl
eHBlY3RzIGFsbCB0aGUgaW5zdGFsbGVkIGZpbGVzIHRvIGJlIGluIHRoZSBSRUNJUEVfU1lTUk9P
VC4gSW4gdGhlIGNhc2Ugb2YgeGVuLCBzcGVjaWFsbHkgdGhlIHNoaXBwZWQgYmluYXJpZXMsIGFz
IG9mIHRvZGF5DQpvbmx5IHRoZSBzeXNyb290IGlzIG9ubHkgaW5jbHVkaW5nIHRoZSAgL3Vzci9s
aWIvZGVidWcveGVuLXN5bXMtNC4xNC4wWy5tYXBdIGZpbGVzLg0KDQpJJ2xsIGFkZCBtb3JlIHdv
cmRzIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KLS0NCkRpZWdvIFN1ZWlybw0KDQo+DQo+Q2hy
aXN0b3BoZXINCj4NCj4+DQo+PiBUaGFua3MsDQo+Pg0KPj4gLS0NCj4+IERpZWdvIFN1ZWlybw0K
Pj4NCj4+PiAtLS0NCj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4taHlwZXJ2aXNvci5pbmMg
fCAyICsrDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYyBiL3JlY2lw
ZXMtDQo+Pj4gZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYyBpbmRleCA2YTc1ZDE2Li45
MTZiZDNjIDEwMDY0NA0KPj4+IC0tLSBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZp
c29yLmluYw0KPj4+ICsrKyBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmlu
Yw0KPj4+IEBAIC01NSw2ICs1NSw4IEBAIGRvX2NvbXBpbGUoKSB7DQo+Pj4gZG9faW5zdGFsbCgp
IHsNCj4+PiAgICBvZV9ydW5tYWtlIERFU1RESVI9IiR7RH0iIGluc3RhbGwteGVuICB9DQo+Pj4g
KyMgVGhlIGRvX2luc3RhbGwgYWxzbyBzaGlwcyBmaWxlcyBpbiAvYm9vdCBhbmQgL3Vzci9saWI2
NA0KPj4+ICtTWVNST09UX0RJUlMNCj4+PiArKz0gIi9ib290ICR7ZXhlY19wcmVmaXh9L2xpYjY0
Ig0KPj4+DQo+Pj4gZG9fZGVwbG95KCkgew0KPj4+ICAgIGluc3RhbGwgLWQgJHtERVBMT1lESVJ9
DQo+Pj4gLS0NCj4+PiAyLjE3LjENCj4+DQo=

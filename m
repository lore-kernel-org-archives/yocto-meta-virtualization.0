Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1093.1605166228524038913
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 23:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3gjiOhO8;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E62B538C07C9
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmVvHt9q0oiIFaljdubJNrz3etXn9OSN2qOD8unjyio=;
 b=3gjiOhO8k4afjz3Xx8u+WJoA9KE3CND4JGJRGKva2ZQmAE/nFUT5DxVrfh2pl9wQY9yUdZ+7ZnYM3k8BdOoEQoftcQra/pqfjdU4uqKRcjiX9zTGwpBQWlJ++JS7mai4MXYxms1zohP9I6zHNcdDkN7AV6biFs4dKA1nrj3NNPc=
Received: from DB6PR0601CA0027.eurprd06.prod.outlook.com (2603:10a6:4:17::13)
 by VI1PR08MB5455.eurprd08.prod.outlook.com (2603:10a6:803:135::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 07:30:24 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::b7) by DB6PR0601CA0027.outlook.office365.com
 (2603:10a6:4:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 07:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 07:30:24 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Thu, 12 Nov 2020 07:30:24 +0000
X-CR-MTA-TID: 64aa7808
Received: from 93724cd1f4cd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A1BBD99F-8557-4422-B42B-B4BA5A39E39B.1;
	Thu, 12 Nov 2020 07:30:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93724cd1f4cd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Nov 2020 07:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0ZWvU4crLzWI11FU7d++R3Woe/oxAbFx+TajZsWNa5fBNr5UKF0zIbqgSPjnnl8JsjnDIzqD9t4f8C7/Gtj2CGlh0h43xxsgglmlLperLITGIW0Ouo+NZvILCTDVJ5wDmYowUiFIjSQC/Q0HpqvWcej6sbgb94SmQr+58DLpmMVxorkAeM0ane2Yko19bdUa623EmBkWnCf/k1/rGhYRoEJ0s0uGn/ZGIV9cc+bgoOnOlKucQ5Fg+3p0pw7I8D7fVFWkx6ULTWgiscWGx3aDYtNO+eR8MAolwXcU7zdGIQBtJB4pPTBPZrhbAslmuQ+K8jHjkD8eZBhD5QiJDGEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmVvHt9q0oiIFaljdubJNrz3etXn9OSN2qOD8unjyio=;
 b=UlybVQFjSRpXUDHC2n1ghS4Ye23KuQ+O82E8Lmqtcimrz/liv6vQRuk85qjuV+btKbfu3a/cscAI97oyujhDpSrAbEHiejSYbWYoid4rSDVcuL2spR/oaXELiw9eLtpX46hQDA3OxUbUvfzl8XiFOzttT1dsGGK7t/wNidVVdZKp2GH3jus47R9VD/M5+JIapIExJ546P8YK7zJ0reefbnlToFle/P9wv7y7sBZ3IbBGxnRR3HVdqrk9X+K7cMvrj7Xg03yhSDmelmltS6NOlgfgAELNDJ3uma2vxgW3L93arJICRkF56RAogv5UDfYTb3KoM2R1/7szEyR0E2ytTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmVvHt9q0oiIFaljdubJNrz3etXn9OSN2qOD8unjyio=;
 b=3gjiOhO8k4afjz3Xx8u+WJoA9KE3CND4JGJRGKva2ZQmAE/nFUT5DxVrfh2pl9wQY9yUdZ+7ZnYM3k8BdOoEQoftcQra/pqfjdU4uqKRcjiX9zTGwpBQWlJ++JS7mai4MXYxms1zohP9I6zHNcdDkN7AV6biFs4dKA1nrj3NNPc=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DBBPR08MB4726.eurprd08.prod.outlook.com (2603:10a6:10:f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Thu, 12 Nov
 2020 07:30:15 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 07:30:15 +0000
From: "Lance Yang" <Lance.Yang@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Joakim Roubert <joakim.roubert@axis.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Topic: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Index: AQHWq69fcPQ8C1m0vkKsSMY3RAelSKnA/LdQgABzxceAAr5JoA==
Date: Thu, 12 Nov 2020 07:30:15 +0000
Message-ID: 
 <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 7EAE526DCDAEF64989B46DE391ED60B2.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [103.73.66.85]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43437db0-af22-4eac-3532-08d886dcd1b9
x-ms-traffictypediagnostic: DBBPR08MB4726:|VI1PR08MB5455:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB54556D61032304D0F51C959591E70@VI1PR08MB5455.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nqvbeVxxmYWlyCCVARFH3V+qX63/+L5tfh3Q4t3HC9WXgbqTuC/ZsBhTsvZHgTqj5y9sfmcxn6/kVNI6/kAgpuG7SbQSDhGNmYHKMkJFHdOFnG4rLYee0jicuXFN6uKS2Ufh69c41+tXVjOvaA8+kFEGqh8LeJb+EG2PNI4BzV8DD1BFQ9w2c6RgQgmzVs9R1lhWj+FJlopRdVrNy/05J8xmVe3NJMPhHukuP7LS/eLX/en9AjDEog+rpi/gFRXDu7ss0YcXp99GyFnra+TY6bNzFYdHebXxLYDHwfRwrUMoHepS+XOsDhX5i53ibknDC/IF8ZwrWCbCa/k+kHtQCSceRyiW9GzzEVGallZ0ZCuT0u5zS2+0xzYEGjkn+ZwDbVBlu903+E/w3LBsO4OHndfZ0OYpaQBJakebz9DWi76UHd+aBys0XXo9zQzy5ZSpfQ4sVIKXiC/ZPWjekvy7qA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(71200400001)(9686003)(66446008)(66556008)(5660300002)(52536014)(4326008)(64756008)(66476007)(7696005)(76116006)(66946007)(8676002)(966005)(478600001)(15974865002)(33656002)(86362001)(55016002)(53546011)(8936002)(66574015)(4001150100001)(6916009)(2906002)(186003)(83380400001)(6506007)(54906003)(316002)(26005)(42413003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 OqLmRzi/b+OfcbVSx6a3DNMVneoSFY25OUF48pnfbpY/Etriy86BwPZJVrMWqYXQGXFt2sQ80VsTsRwcwxQTS/Qr7dNOFKZBJB6FL80WzjKxgtY+448fCP+4OnPMMguWYbogftj7iJT6bIKBjIn4L4gMu94HwtKgy82IrEolWT6jz0IjXMvxHvh3jPcwW3+VIao4Nni9DUPXDQO2iBNaPQjO39+oV9zBjCGoUnnXW0QVOKUADVZaQjPxPHefctgm9nYyutTrjLRWGrGV6j3/eYpDMtDnh8RY0dPRTyPhFft+k3X1WdcZjf/h0cspGws59I2NjG4UAyj9V3LwV9maDgY5b95AeBhlfftmwaFgVYKm4QvAv/j0AGAUUAwPSaXklaI5Txcj+b0UjDY+Us8VIJQTFzRM6ZAcma+ccTheqp7Td+Eivr8wVGTfH8Zu5Jw34TAAzxuQLOipq/op6BnAb+B5YX4wBtJjV5LXwwbQhcrw771lyqr0pcLd1t18Gj/h8oU79rkG7oDuAyBHtoZ2hYqC/HqqO0rWQsFXWOgoaFZy0raphp8exqoC1PXOcL73LpIY9DTkxfa67oXW7p/S7FXMq4bDqCU/CWf79Fpn462CfDpKkjTZH/tKsIdsOFb0NwrER9ySnmxlATCGiL66eg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4726
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b3cda520-43b8-45f0-b2d0-08d886dcccb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L0DmgxJkiVHmueu5v89B+bhjKD/vva0OR/rhcyjjL8F4gjQZLlDJYcpBflLWYVHi1fF4X49OP1sNmDEscoV4n3khE4IdmRZ9pEnV6lsK7eh4hnHRK4+z2m+XmIxzuI1kGt48CzsQ35aWz/aWyKUmT9jopNz4j/cPPy9Y3RGVOpn31KJZZCzx4/tDoe16OTBhJeo1K/E/l9QXbKyvD6rFii0pKgHu88wfGwNlST82yd3Ct8jA/67tFzPghHzXjNecxiI7X0F1mhrb2m9U3Xgd/HxlOOkqtZpZiqjxnMmQGm0huy7KJJbkX79P8uWpv752oMBROUa7GcrYg6c0CuHLXT6y+YT3Nl89HIazL8ig8Q+NGaDkNYNEx/XaIhQjoCw28XE5dFWN8IQgv2zw3ZNgvJfSIYGwzxRAnIFgbe45zoKQ00tFXUCf2MTpOfHDzg85ROm/ZzpBhaDz3F9GJtzl4/H6C+oM+lBz+gLujW/YCTG+IpBxfURH9j057cT2mBiT
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(7696005)(6506007)(53546011)(26005)(9686003)(186003)(4001150100001)(6862004)(336012)(55016002)(52536014)(82310400003)(8936002)(4326008)(316002)(86362001)(478600001)(2906002)(8676002)(66574015)(966005)(83380400001)(70206006)(33656002)(356005)(81166007)(82740400003)(70586007)(54906003)(5660300002)(15974865002)(47076004)(42413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 07:30:24.2348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43437db0-af22-4eac-3532-08d886dcd1b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5455
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCkkgcHVsbGVkIHlvdXIgbGF0ZXN0IGszcy13aXAgYnJhbmNoLiBJbiB5b3Vy
IHJlY2lwZXMtbmV0d29ya2luZywgdGhlIGlwc2V0Og0KDQpjYXQgaXBzZXRfNi4zOC5iYg0KIyBD
b3B5cmlnaHQgKEMpIDIwMTcgQWFyb24gQnJpY2UgPGFhcm9uLmJyaWNlQGRhdGFzb2Z0LmNvbT4N
CiMgUmVsZWFzZWQgdW5kZXIgdGhlIE1JVCBsaWNlbnNlIChzZWUgQ09QWUlORy5NSVQgZm9yIHRo
ZSB0ZXJtcykNCg0KLi4uDQouLi4gKHNraXAgdmVyYm9zZSBvdXRwdXQpDQoNCkRFUEVORFMgPSAi
bGlidG9vbCBsaWJtbmwiDQpSREVQRU5EU18ke1BOfSA9ICJrZXJuZWwtbW9kdWxlLWlwLXNldCIN
Ci4uLg0KDQpJIHVzZSBiaXRiYWtlIHRvIGluc3RhbGwgazNzIGFuZCBpcHNldCBidXQgSSBnb3Qg
ZXJyb3JzIGJlbG93Og0KDQpQcm9ibGVtIDE6IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQogIC0gbm90
aGluZyBwcm92aWRlcyBrZXJuZWwtbW9kdWxlLWlwLXNldCBuZWVkZWQgYnkgaXBzZXQtNi4zOC1y
MA0KDQpJIHRoaW5rIFJERVBFTkRTXyR7UE59IGlzIGEgc2xpZ2h0bHkgb3Zlci1zdHJpY3QgY29u
ZGl0aW9uIGluIHNvbWUgc2l0dWF0aW9ucy4gRm9yIGV4YW1wbGUsIGluIHRoZSBmb2xsb3dpbmcg
c2l0dWF0aW9uOg0KDQpJbiBteSBidWlsZC9jb25mL2xvY2FsLmNvbmYsIEkgYWRkZWQgImtlcm5l
bC1tb2R1bGVzIiBpbiBJTUFHRV9JTlNUQUxMX2FwcGVuZCBzZWN0aW9uLiBrZXJuZWwtbW9kdWxl
cy1pcC1zZXQgaGFzIGFscmVhZHkgaW5jbHVkZWQgaW4ga2VybmVsLW1vZHVsZXMgd2hlbiBJIGNo
ZWNrIGluIHFlbXVhcm02NCBpbWFnZSB3aXRoICJsc21vZHxncmVwIGlwX3NldCIuIEJ1dCBpZiBS
REVQRU5EUyBpcyB1c2VkLCBiaXRiYWtlIHdvbid0IGNvbnRpbnVlIHRvIGNvbXBpbGUgdGhlIHBh
Y2thZ2UgdW5sZXNzIHlvdSBhZGQgImtlcm5lbC1tb2R1bGUtaXAtc2V0Ii4NCg0KU28gSSBzdWdn
ZXN0ZWQgdG8gdXNlICIgUlJFQ09NTUVORFNfJHtQTn0iLg0KDQpCZXN0IFJlZ2FyZHMsDQpMYW5j
ZQ0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLXZpcnR1YWxpemF0
aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4NCj4gT24gQmVoYWxmIE9mIEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy55
b2N0b3Byb2plY3Qub3JnDQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDEwLCAyMDIwIDk6MTcg
UE0NCj4gVG86IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+IENj
OiBMYW5jZSBZYW5nIDxMYW5jZS5ZYW5nQGFybS5jb20+OyBKb2FraW0gUm91YmVydCA8am9ha2lt
LnJvdWJlcnRAYXhpcy5jb20+OyBtZXRhLQ0KPiB2aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qu
b3JnOyBNaWNoYWVsIFpoYW8gPE1pY2hhZWwuWmhhb0Bhcm0uY29tPjsgS2FseSBYaW4NCj4gPEth
bHkuWGluQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFU
Q0ggdjVdIEFkZGluZyBrM3MgcmVjaXBlDQo+DQo+IE9uIFR1ZSwgTm92IDEwLCAyMDIwIGF0IDc6
NDYgQU0gQnJ1Y2UgQXNoZmllbGQgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gPGJydWNl
LmFzaGZpZWxkPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gPg0K
PiA+IE9uIFR1ZSwgTm92IDEwLCAyMDIwIGF0IDE6NDMgQU0gTGFuY2UgWWFuZyA8TGFuY2UuWWFu
Z0Bhcm0uY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBIaSBCcnVjZSBhbmQgSm9ha2ltLA0KPiA+
ID4NCj4gPiA+IFRoYW5rcyBmb3Igc2hhcmluZyB0aGlzIGJyYW5jaDogazNzLXdpcC4gSSBoYXZl
IHRlc3RlZCBhZ2FpbnN0IG15IHlvY3RvIGJ1aWxkLg0KPiA+DQo+ID4gVGhlIGJyYW5jaCB3aWxs
IGJlIG1vcmUgZnVuY3Rpb25hbCBzaG9ydGx5LCBJIGhhdmUgcXVpdGUgYSBmZXcgY2hhbmdlcw0K
PiA+IHRvIGZhY3RvciB0aGluZ3MgZm9yIGs4cyBhbmQgZ2VuZXJhbGx5IG1vcmUgdXNhYmxlIDpE
DQo+ID4NCj4gPiAgICAgICAgIG1vZGlmaWVkOiAgIGNsYXNzZXMvY25pX25ldHdvcmtpbmcuYmJj
bGFzcw0KPiA+ICAgICAgICAgbW9kaWZpZWQ6ICAgY29uZi9sYXllci5jb25mDQo+ID4gICAgICAg
ICBtb2RpZmllZDogICByZWNpcGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC9jb250YWluZXJkLWRv
Y2tlcl9naXQuYmINCj4gPiAgICAgICAgIG1vZGlmaWVkOg0KPiA+IHJlY2lwZXMtY29udGFpbmVy
cy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gICAgICAg
ICBtb2RpZmllZDogICByZWNpcGVzLWNvbnRhaW5lcnMvazNzL1JFQURNRS5tZA0KPiA+ICAgICAg
ICAgbW9kaWZpZWQ6ICAgcmVjaXBlcy1jb250YWluZXJzL2szcy9rM3NfZ2l0LmJiDQo+ID4gICAg
ICAgICBtb2RpZmllZDogICByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by9rdWJlcm5l
dGVzLmNmZw0KPiA+ICAgICAgICAgbW9kaWZpZWQ6ICAgcmVjaXBlcy1uZXR3b3JraW5nL2NuaS9j
bmlfZ2l0LmJiDQo+ID4gICAgICAgICBjb250YWluZXItZGVwbG95LnR4dA0KPiA+ICAgICAgICAg
cmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMvDQo+ID4NCj4gPiA+DQo+ID4gPiBNeSBJbWFnZTog
TGludXggcWVtdWFybTY0IGJ5IHlvY3RvLg0KPiA+ID4NCj4gPiA+IFRoZSBtYXN0ZXIgbm9kZSBj
YW4gYmUgcmVhZHkgYWZ0ZXIgSSBzdGFydGVkIHRoZSBrM3Mgc2VydmVyLiBIb3dldmVyLCB0aGUg
cG9kcyBpbiBrdWJlLQ0KPiBzeXN0ZW0gKHdoaWNoIGFyZSBlc3NlbnRpYWwgY29tcG9uZW50cyBm
b3IgazNzKSBjYW5ub3QgdHVybiB0byByZWFkeSBzdGF0ZSBvbiBxZW11YXJtNjQuDQo+ID4gPg0K
PiA+DQo+ID4gVGhhdCdzIGludGVyZXN0aW5nLCBzaW5jZSBpbiBteSBjb25maWd1cmF0aW9uLCB0
aGUgbWFzdGVyIG5ldmVyIGNvbWVzIHJlYWR5Og0KPiA+DQo+ID4gcm9vdEBxZW11eDg2LTY0On4j
IGt1YmVjdGwgZ2V0IG5vZGVzDQo+ID4gTkFNRSAgICAgICAgIFNUQVRVUyAgICAgUk9MRVMgICAg
QUdFICAgVkVSU0lPTg0KPiA+IHFlbXV4ODYtNjQgICBOb3RSZWFkeSAgIG1hc3RlciAgIDE1aCAg
IHYxLjE4LjktazNzMQ0KPiA+DQo+DQo+IEhhaC4NCj4NCj4gSSBmaW5hbGx5IGdvdCB0aGUgbm9k
ZSB0byBzaG93IHVwIGFzIHJlYWR5Og0KPg0KPiByb290QHFlbXV4ODYtNjQ6fiMga3ViZWN0bCBn
ZXQgbm9kZXMNCj4gTkFNRSAgICAgICAgIFNUQVRVUyAgIFJPTEVTICAgIEFHRSAgICBWRVJTSU9O
DQo+IHFlbXV4ODYtNjQgICBSZWFkeSAgICBtYXN0ZXIgICAxMTJzICAgdjEuMTguOS1rM3MxDQo+
DQo+IEknbSBhdHRlbXB0aW5nIHRvIGJ1aWxkIGFuIGFsbC1pbi1vbmUgbm9kZSwgYW5kIHRoYXQg
aXMgbGlrZWx5IGNhdXNpbmcgbWUgc29tZSBpc3N1ZXMuDQo+DQo+IEknbSByZXZpc2l0aW5nIHRo
b3NlIHBvdGVudGlhbCBjb25mbGljdHMgbm93Lg0KPg0KPiBCdXQgaWYgYW55b25lIGVsc2UgZG9l
cyBoYXZlIGFuIGFsbCBpbiBvbmUgd29ya2luZyBhbmQgaGFzIHNvbWUgdGlwcywgZmVlbCBmcmVl
IHRvIHNoYXJlIDpEDQo+DQo+IEJydWNlDQo+DQo+ID4gSSd2ZSBzb3J0ZWQgb3V0IG1vcmUgb2Yg
dGhlIGRlcGVuZGVuY2llcywgYW5kIGhhdmUgcGFja2FnZWdyb3VwcyB0bw0KPiA+IG1ha2UgdGhl
bSBlYXNpZXIgbm93Lg0KPiA+DQo+ID4gSG9wZWZ1bGx5LCBJIGNhbiBmaWd1cmUgb3V0IHdoYXQg
aXMgbm93IG1pc3NpbmcgYW5kIGtlZXBpbmcgbXkgbWFzdGVyDQo+ID4gZnJvbSBtb3ZpbmcgaW50
byByZWFkeSB0b2RheS4NCj4gPg0KPiA+IEJydWNlDQo+ID4NCj4gPiA+IEFmdGVyIHRoZSBtYXN0
ZXIgbm9kZSBpdHNlbGYgdHVybmVkIHRvIHJlYWR5IHN0YXRlLCBJIGNoZWNrIHRoZSBwb2RzIHdp
dGgga3ViZWN0bDoNCj4gPiA+DQo+ID4gPiBrdWJlY3RsIGdldCBub2Rlcw0KPiA+ID4gTkFNRSAg
ICAgICAgU1RBVFVTICAgUk9MRVMgICAgQUdFICAgVkVSU0lPTg0KPiA+ID4gcWVtdWFybTY0ICAg
UmVhZHkgICAgbWFzdGVyICAgMTFtICAgdjEuMTguOS1rM3MxDQo+ID4gPiByb290QHFlbXVhcm02
NDp+IyBscw0KPiA+ID4gcm9vdEBxZW11YXJtNjQ6fiMga3ViZWN0bCBnZXQgcG9kcyAtbiBrdWJl
LXN5c3RlbQ0KPiA+ID4gTkFNRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBS
RUFEWSAgIFNUQVRVUyAgICAgICAgICAgICAgUkVTVEFSVFMgICBBR0UNCj4gPiA+IGxvY2FsLXBh
dGgtcHJvdmlzaW9uZXItNmQ1OWY0N2M3LXh4dmJsICAgMC8xICAgICBDb250YWluZXJDcmVhdGlu
ZyAgIDAgICAgICAgICAgMTJtDQo+ID4gPiBjb3JlZG5zLTc5NDRjNjZkOGQtdGxybTkgICAgICAg
ICAgICAgICAgIDAvMSAgICAgQ29udGFpbmVyQ3JlYXRpbmcgICAwICAgICAgICAgIDEybQ0KPiA+
ID4gbWV0cmljcy1zZXJ2ZXItNzU2NmQ1OTZjOC1zdmtmZiAgICAgICAgICAwLzEgICAgIENvbnRh
aW5lckNyZWF0aW5nICAgMCAgICAgICAgICAxMm0NCj4gPiA+IGhlbG0taW5zdGFsbC10cmFlZmlr
LXM4cDVnICAgICAgICAgICAgICAgMC8xICAgICBDb250YWluZXJDcmVhdGluZyAgIDAgICAgICAg
ICAgMTJtDQo+ID4gPg0KPiA+ID4gVGhlbiBJIGRlc2NyaWJlIHRoZSBwb2RzIHdpdGg6DQo+ID4g
Pg0KPiA+ID4gRXZlbnRzOg0KPiA+ID4gICBUeXBlICAgICBSZWFzb24gICAgICAgQWdlICAgICAg
ICAgICAgICAgICAgRnJvbSAgICAgICAgICAgICAgIE1lc3NhZ2UNCj4gPiA+ICAgLS0tLSAgICAg
LS0tLS0tICAgICAgIC0tLS0gICAgICAgICAgICAgICAgIC0tLS0gICAgICAgICAgICAgICAtLS0t
LS0tDQo+ID4gPiAgIE5vcm1hbCAgIFNjaGVkdWxlZCAgICAxNm0gICAgICAgICAgICAgICAgICBk
ZWZhdWx0LXNjaGVkdWxlciAgU3VjY2Vzc2Z1bGx5IGFzc2lnbmVkIGt1YmUtDQo+IHN5c3RlbS9j
b3JlZG5zLTc5NDRjNjZkOGQtdGxybTkgdG8gcWVtdWFybTY0DQo+ID4gPiAgIFdhcm5pbmcgIEZh
aWxlZE1vdW50ICA1bTIzcyAoeDMgb3ZlciAxNG0pICBrdWJlbGV0ICAgICAgICAgICAgVW5hYmxl
IHRvIGF0dGFjaCBvciBtb3VudA0KPiB2b2x1bWVzOiB1bm1vdW50ZWQgdm9sdW1lcz1bY29yZWRu
cy10b2tlbi1iN25saF0sIHVuYXR0YWNoZWQgdm9sdW1lcz1bY29yZWRucy10b2tlbi0NCj4gYjdu
bGggY29uZmlnLXZvbHVtZV06IHRpbWVkIG91dCB3YWl0aW5nIGZvciB0aGUgY29uZGl0aW9uDQo+
ID4gPiAgIFdhcm5pbmcgIEZhaWxlZE1vdW50ICA1MHMgKHg0IG92ZXIgMTJtKSAgICBrdWJlbGV0
ICAgICAgICAgICAgVW5hYmxlIHRvIGF0dGFjaCBvciBtb3VudA0KPiB2b2x1bWVzOiB1bm1vdW50
ZWQgdm9sdW1lcz1bY29yZWRucy10b2tlbi1iN25saF0sIHVuYXR0YWNoZWQgdm9sdW1lcz1bY29u
ZmlnLXZvbHVtZQ0KPiBjb3JlZG5zLXRva2VuLWI3bmxoXTogdGltZWQgb3V0IHdhaXRpbmcgZm9y
IHRoZSBjb25kaXRpb24NCj4gPiA+ICAgV2FybmluZyAgRmFpbGVkTW91bnQgIDExcyAoeDE2IG92
ZXIgMTZtKSAgIGt1YmVsZXQgICAgICAgICAgICBNb3VudFZvbHVtZS5TZXRVcCBmYWlsZWQgZm9y
DQo+IHZvbHVtZSAiY29yZWRucy10b2tlbi1iN25saCIgOiBtb3VudCBmYWlsZWQ6IGV4ZWM6ICJt
b3VudCI6IGV4ZWN1dGFibGUgZmlsZSBub3QgZm91bmQgaW4gJFBBVEgNCj4gPiA+DQo+ID4gPiBJ
IGZvdW5kIHRoZSAibW91bnQiIGJpbmFyeSBpcyBub3QgZm91bmQgaW4gJFBBVEguIEhvd2V2ZXIs
IEkgY29uZmlybWVkIHRoZSAkUEFUSCBhbmQNCj4gbW91bnQgYmluYXJ5IG9uIG15IHFlbXVhcm02
NCBpbWFnZToNCj4gPiA+DQo+ID4gPiByb290QHFlbXVhcm02NDp+IyBlY2hvICRQQVRIDQo+ID4g
PiAvdXNyL2xvY2FsL2JpbjovdXNyL2JpbjovYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL3NiaW46
L3NiaW4NCj4gPiA+IHJvb3RAcWVtdWFybTY0On4jIHdoaWNoIG1vdW50DQo+ID4gPiAvYmluL21v
dW50DQo+ID4gPg0KPiA+ID4gV2hlbiBJIHR5cGUgbW91bnQgY29tbWFuZCwgaXQgd29ya2VkIGZp
bmU6DQo+ID4gPg0KPiA+ID4gL2Rldi9yb290IG9uIC8gdHlwZSBleHQ0IChydyxyZWxhdGltZSkg
ZGV2dG1wZnMgb24gL2RldiB0eXBlDQo+ID4gPiBkZXZ0bXBmcyAocncscmVsYXRpbWUsc2l6ZT0y
MDE2MjEyayxucl9pbm9kZXM9NTA0MDUzLG1vZGU9NzU1KQ0KPiA+ID4gcHJvYyBvbiAvcHJvYyB0
eXBlIHByb2MgKHJ3LHJlbGF0aW1lKSBzeXNmcyBvbiAvc3lzIHR5cGUgc3lzZnMNCj4gPiA+IChy
dyxyZWxhdGltZSkgZGVidWdmcyBvbiAvc3lzL2tlcm5lbC9kZWJ1ZyB0eXBlIGRlYnVnZnMNCj4g
PiA+IChydyxyZWxhdGltZSkgdG1wZnMgb24gL3J1biB0eXBlIHRtcGZzIChydyxub3N1aWQsbm9k
ZXYsbW9kZT03NTUpDQo+ID4gPiAuLi4NCj4gPiA+IC4uLiAoc2tpcHBlZCB0aGUgdmVyYm9zZSBv
dXRwdXQpDQo+ID4gPg0KPiA+ID4gSSB3b3VsZCBsaWtlIHRvIGtub3cgd2hldGhlciB5b3UgaGF2
ZSBtZXQgdGhpcyAibW91bnQiIGlzc3VlIGV2ZXI/DQo+ID4gPg0KPiA+ID4gQmVzdCBSZWdhcmRz
LA0KPiA+ID4gTGFuY2UNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiA+IEZyb206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KPiA+ID4gPiA8bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0K
PiA+ID4gPiBPbiBCZWhhbGYgT2YgQnJ1Y2UgQXNoZmllbGQgdmlhIGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcNCj4gPiA+ID4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI2LCAyMDIwIDExOjQ2IFBNDQo+
ID4gPiA+IFRvOiBKb2FraW0gUm91YmVydCA8am9ha2ltLnJvdWJlcnRAYXhpcy5jb20+DQo+ID4g
PiA+IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gPiA+ID4gU3Vi
amVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSCB2NV0gQWRkaW5nIGszcyByZWNp
cGUNCj4gPiA+ID4NCj4gPiA+ID4gT24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMjowMCBBTSBKb2Fr
aW0gUm91YmVydCA8am9ha2ltLnJvdWJlcnRAYXhpcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gT24gMjAyMC0xMC0yMSAwNToxMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+ID4g
PiA+ID4gPiBIYSEhISENCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGlzIGFwcGxpZXMuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBXb25kZXJmdWwsIHRoYW5rIHlvdSEgSSBndWVzcyB0aGlzIGlz
IHdoYXQgaXMgY2FsbGVkICJmaXZlIHRpbWVzIGx1Y2t5Ii4uLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJJ20gbm93IHRlc3RpbmcgYW5kIGNvbXBsZXRpbmcgc29tZSBvZiBteSBuZXR3b3JraW5n
DQo+ID4gPiA+ID4gPiBmYWN0b3JpbmcsIGFzIHdlbGwgYXMgaW1wb3J0aW5nIC8gZm9ya2luZyBz
b21lIHJlY2lwZXMgdG8NCj4gPiA+ID4gPiA+IGF2b2lkIGV4dHJhIGxheWVyIGRlcGVuZHMuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBFeGNlbGxlbnQhDQo+ID4gPiA+DQo+ID4gPiA+IEkndmUgcHVz
aGVkIHNvbWUgb2YgbXkgV0lQIHRvOg0KPiA+ID4gPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS12aXJ0dWFsaXphdGlvbi9sb2cNCj4gPiA+ID4gLz9oPWsz
cy13aXANCj4gPiA+ID4NCj4gPiA+ID4gVGhhdCBpbmNsdWRlcyB0aGUgc3BsaXQgb2YgdGhlIG5l
dHdvcmtpbmcsIHRoZSBpbXBvcnQgb2Ygc29tZSBvZg0KPiA+ID4gPiB0aGUgZGVwZW5kZW5jaWVz
IGFuZCBzb21lIHNtYWxsIHR3ZWFrcyBJJ20gd29ya2luZyBvbi4NCj4gPiA+ID4NCj4gPiA+ID4g
SSBkaWQgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnMgb24gdGhlIGszcyBwYWNrYWdpbmcgaXRz
ZWxmLCBJDQo+ID4gPiA+IHdhcyBnZXR0aW5nIHRoZSBmb2xsb3dpbmcNCj4gPiA+ID4gZXJyb3I6
DQo+ID4gPiA+DQo+ID4gPiA+IEVSUk9SOiBrM3MtdjEuMTguOStrM3MxLWRpcnR5LXIwIGRvX3Bh
Y2thZ2U6IFFBIElzc3VlOiBrM3M6DQo+ID4gPiA+IEZpbGVzL2RpcmVjdG9yaWVzIHdlcmUgaW5z
dGFsbGVkIGJ1dCBub3Qgc2hpcHBlZCBpbiBhbnkgcGFja2FnZToNCj4gPiA+ID4gICAvdXNyL2xv
Y2FsL2Jpbi9rM3MtY2xlYW4NCj4gPiA+ID4gICAvdXNyL2xvY2FsL2Jpbi9jcmljdGwNCj4gPiA+
ID4gICAvdXNyL2xvY2FsL2Jpbi9rdWJlY3RsDQo+ID4gPiA+ICAgL3Vzci9sb2NhbC9iaW4vazNz
DQo+ID4gPiA+DQo+ID4gPiA+IFNvIEkgYWRkZWQgdGhlbSB0byB0aGUgRklMRVMgb2YgdGhlIGsz
cyBwYWNrYWdlIGl0c2VsZiAoc28gYm90aA0KPiA+ID4gPiBrM3Mtc2VydmVyIGFuZCBrM3MtYWdl
bnQgd2lsbCBnZXQgdGhlbSksIGlzIHRoYXQgdGhlIHNwbGl0IHlvdSB3ZXJlIGxvb2tpbmcgZm9y
ID8NCj4gPiA+ID4NCj4gPiA+ID4gQnJ1Y2UNCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEJSLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gL0pvYWtpbQ0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+
ID4gSm9ha2ltIFJvdWJlcnQNCj4gPiA+ID4gPiBTZW5pb3IgRW5naW5lZXINCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IEF4aXMgQ29tbXVuaWNhdGlvbnMgQUINCj4gPiA+ID4gPiBFbWRhbGF2w6RnZW4g
MTQsIFNFLTIyMyA2OSBMdW5kLCBTd2VkZW4NCj4gPiA+ID4gPiBUZWw6ICs0NiA0NiAyNzIgMTgg
MDAsIFRlbCAoZGlyZWN0KTogKzQ2IDQ2IDI3MiAyNyA0OA0KPiA+ID4gPiA+IEZheDogKzQ2IDQ2
IDEzIDYxIDMwLCB3d3cuYXhpcy5jb20NCj4gPiA+ID4gPg0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAt
IFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1h
ZG5lc3MNCj4gPiA+ID4gYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQo+ID4gPiA+IC0gIlVzZSB0aGUg
Zm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo+ID4gPiBJTVBPUlRBTlQgTk9U
SUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBj
b25maWRlbnRpYWwgYW5kDQo+IG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlcg0KPiBpbW1l
ZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVy
c29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvcg0KPiBzdG9yZSBvciBjb3B5IHRoZSBpbmZv
cm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo+ID4NCj4gPg0KPiA+DQo+ID4gLS0N
Cj4gPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3Mg
YW5kIG1hZG5lc3MgYXdhaXQNCj4gPiB0aGVlIGF0IGl0cyBlbmQNCj4gPiAtICJVc2UgdGhlIGZv
cmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KPiA+DQo+ID4NCj4gPg0KPg0KPg0K
PiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hh
b3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQo+IC0gIlVzZSB0aGUgZm9yY2Ug
SGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29u
dGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwg
YW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90
IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFu
eSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVt
LiBUaGFuayB5b3UuDQo=

Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.56])
 by mx.groups.io with SMTP id smtpd.web12.2232.1596611796054502726
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 00:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=r45rKbnu;
 spf=pass (domain: arm.com, ip: 40.107.0.56, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDHwgU6spUkWsxm0YIwxkWOE798oynXL76J6m8f1WwY=;
 b=r45rKbnukYU7x8L6mwHsS5t8+PQeLOfpu4gSXJqy42m5fnPOD3OVZrJDEGtbxqFjTYf8VyeseRuJRMVmIjmV7WutlKhPl4ySBpqg4hxEz3NydEacZr+9+yYM/vgcy2PmIQ2l+yMuCPkW8V4lGfoP9UtwYvrs/N2lEjwqrxGIqa0=
Received: from PR3P193CA0059.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::34)
 by VE1PR08MB5022.eurprd08.prod.outlook.com (2603:10a6:803:114::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 5 Aug
 2020 07:16:32 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:51:cafe::40) by PR3P193CA0059.outlook.office365.com
 (2603:10a6:102:51::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Wed, 5 Aug 2020 07:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 07:16:32 +0000
Received: ("Tessian outbound cbf1bd92df60:v64"); Wed, 05 Aug 2020 07:16:32 +0000
X-CR-MTA-TID: 64aa7808
Received: from aae94f73c91b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C1D1A58-431E-4492-8840-8826D067C97A.1;
	Wed, 05 Aug 2020 07:16:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aae94f73c91b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 07:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5pccIqM50MF81+op0mslWaDUoJc84sr9skSAaMgrlAT2Ls52UAnsIxV9hANVQ3/OLVgRzVjtVP9KQ35wplHcv1XTSyX2ncmOG5Xel2kq9bKZhBcQJXG50R9DdBLtikAY4hfWC9p4TKY9G/KM4Nbx6H3tpxlK32HbdNwpLm/AUACMlUesdK/5JqqJzcz4mRLk2cYK8wF78m1XwOwHUQzblWcU7XH5rHI37rfwFgAYNUWhe1aA+y2wfiPiQvslHq/v38hDtsd8+PpdkY+0K0Q4vJLJ6a8l294VH8pVNeAdoLKihs+evLUZi7Hnyf+Hb6nycjPBujORDlTYlOB61tkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDHwgU6spUkWsxm0YIwxkWOE798oynXL76J6m8f1WwY=;
 b=F9WyBj1lY+NKB07CDND3y9mv+VCMv6pKOmIq/RTfH5syt2f37oZ1z0Vy9rOt5hWY82+QEi1G1rrRTyDSp1BsrrYmfNDgtzPl0tXURBSXZnXnacqziEnOjKwDv+Q5wIj5gDuRR6IsbpIXkXNyDT/xK161Jwjz2Hve1oYrV3TaRLalw3layWy8cNCvuR7RMg7n+LS7aSPiLzBtARVJSpP0iDpEFR7IUEm41Ue/DMV74cF4jhSOds2s/qXSvwnRCc1kOOIM2dnPEOyH8/RmBPMnAHVQmJ1t2iHBuy7wWW+NsfdXY0niNKe1I6WK7h/lU96Vw4wf03hr6pZK7/IDMFLS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDHwgU6spUkWsxm0YIwxkWOE798oynXL76J6m8f1WwY=;
 b=r45rKbnukYU7x8L6mwHsS5t8+PQeLOfpu4gSXJqy42m5fnPOD3OVZrJDEGtbxqFjTYf8VyeseRuJRMVmIjmV7WutlKhPl4ySBpqg4hxEz3NydEacZr+9+yYM/vgcy2PmIQ2l+yMuCPkW8V4lGfoP9UtwYvrs/N2lEjwqrxGIqa0=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3045.eurprd08.prod.outlook.com (2603:10a6:209:45::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Wed, 5 Aug
 2020 07:16:24 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 07:16:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, Doug Goldstein
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH 2/2] xen: Add support for config fragments and diffconfig
Thread-Topic: [meta-virtualization][PATCH 2/2] xen: Add support for config
 fragments and diffconfig
Thread-Index: AQHWamMbKTMZF1Z0P0mgO6PZvkH5QKkpCtUAgAANbGA=
Date: Wed, 5 Aug 2020 07:16:24 +0000
Message-ID: 
 <AM6PR08MB3461D8FC3053ED457681D588924B0@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
 <1596547693-87664-2-git-send-email-diego.sueiro@arm.com>
 <CACMJ4GayxGn82iNWFTELQ=8=QrdfNq4MojWDTdSGxjJUZteLBw@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GayxGn82iNWFTELQ=8=QrdfNq4MojWDTdSGxjJUZteLBw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2d03a36f-6921-4aa2-8804-57243f926393.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.193.87.36]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c431215-91fe-4519-a0b7-08d8390f7ad1
x-ms-traffictypediagnostic: AM6PR08MB3045:|VE1PR08MB5022:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB502265ADB19B353F3551D9CF924B0@VE1PR08MB5022.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JlL/ELhSBJUkDblybhHbxnMwXT4DGckC5VI/QdbpOfJl5h2NJ3NDrNs6I9EmKZCKgqQyHnV7lSYZN/lmuq8hFtqmh8TFndAyP+TU8fpIHyAyhZcvWhWuP724d2nzDRfalH9d4XMt2LjqYMCnYxuNZlbJBT/mbDlhLzYJVzb4syGBx83wuyrDU7Wx6fFwmUwgBBlIhHHVwBXmm7bi4tm0rnSmpR75FrYJGVyhlgTUanJzhTN/Rh+cY4PN8RA53e4nQUk6Cnm2XQI7RTk6bto6f8H828jJ3NL79+FfdGTl3jiKOSvOm1bSyWL2yqVf+PhCE68+pYAS+vWp9uu+W2RcSCx7rUe/prgqDkegPavUk1YcCgPBkg8yf0gpK9j6CnnDgkb3/V2pLaL/qD+LiLNtvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(33656002)(8676002)(26005)(76116006)(4326008)(66946007)(66556008)(9686003)(64756008)(5660300002)(71200400001)(66446008)(83380400001)(2906002)(186003)(478600001)(316002)(55016002)(966005)(54906003)(86362001)(8936002)(66476007)(7696005)(6506007)(52536014)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 4rlbBwPiospDZdIV1UgqMHVB14kZAJuS5YpR3bGKsUkKRN/5dL74HbW0wl0mnvF22UD0aPVJ50nX1oli2QjMklHUfizddEFVNhIh9eyVCe3o0MAx2vQ2B30oyE7ZzMCELZc2A3Gw0U9o2y2DVtcUpgzqMbo0Hbn5901zRLuC7R3ETiekOUhL0BqSxrlc82hRRPLa2Q/scOxu+NrwpEXXQy9fWcyj4EdrziStbg9V3vsFwURM3W//qNJ2aeVMvlFS42gHsqcfM6yjiobC53zFc8nGhJBRKFXsfCog2vkDt+17zfTu8DpPDsMUGtpKxfmOZKO2pjkFWLjsvCyrQzBE5PzoxzGhks7g+kfV2zCyemXrhiLd9uAoJcwaDrt1/8u9qKIx2PvkFRAvFwZw9yKYxOxFtyI+aPDIyw3NxpkSav9uzEkhtyXDF9vcJomvrwab4YJqOJZFK6zFJHZypO5vpiKc5auLu58jF0EFRGXzoVyRQRBY8ls8oRGp0v3+KfJQo3z1myOWClB5fiDcfxIdwd1+nyqJzasvfZezb3yEBCOps87YRDgX8CvF3C6DJeW0BJe5yq62eW9LcQq1ZfyS8HTdVKM197P7IsnmNUtXnjzpYAAqHpVrDctBPqVIJlBzmm3G2jm6IPKFPq5pHpTz4A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3045
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c2a4a20-b958-4ed7-2237-08d8390f762d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yu01ERbzfoozbmYJRD+OX7p0PNopd+VDZUAvFKD+I3KAssDPzGooebS+l+F4nKZvG8Sdm0nej95tTvevL6U+8zLtsn3NwtqiZF0pTJoAGuD/FIfcRs5AU0Yy4CuFz4+2vqOa+GLE1yqXpOXXfM5W5N3yAKg8raCGADgd+4p8zlWUwsG8sOuagB953Z3kJM1tDrWPPRJUy02w04dWC+kZK2glusbkTK2r4T3ZYI14U5WntoRys6i2M3nAv8l0qKTDd7BRq403cMimt01209ImaLafJIv/3dHco6uPJRyz0E+IflMr8/wavBZS4gMplCte32m3SyDl1iH/EE9i4zRRw2K5ntcp6PVOeISwE0XItjCR/7L0pPmoPlDkLg6rbzrKs8zoFOmFmk+yTkTYbx2Xc2xj+mFJYm2IV3f0ExZzn6gzIYcmyUqmXjm9AwImCV4Dkg/ig+1bOvL56Q3D1fdFr9cWG7HG0BnL3GfyV6PMCNA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966005)(70206006)(4326008)(55016002)(9686003)(5660300002)(70586007)(8936002)(7696005)(52536014)(478600001)(186003)(83380400001)(6862004)(336012)(33656002)(86362001)(8676002)(81166007)(6506007)(356005)(82310400002)(316002)(82740400003)(47076004)(107886003)(2906002)(54906003)(26005)(966005)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 07:16:32.0036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c431215-91fe-4519-a0b7-08d8390f7ad1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5022
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlLCBmaW5kIG15IGNvbW1lbnRzIGlubGluZS4NCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+RnJvbTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21h
aWwuY29tPg0KPlNlbnQ6IDA1IEF1Z3VzdCAyMDIwIDA3OjE1DQo+VG86IERpZWdvIFN1ZWlybyA8
RGllZ28uU3VlaXJvQGFybS5jb20+DQo+Q2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZzsgbmQgPG5kQGFybS5jb20+OyBEb3VnDQo+R29sZHN0ZWluIDxjYXJkb2VA
Z2VudG9vLm9yZz4NCj5TdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIIDIv
Ml0geGVuOiBBZGQgc3VwcG9ydCBmb3IgY29uZmlnDQo+ZnJhZ21lbnRzIGFuZCBkaWZmY29uZmln
DQo+DQo+T24gVHVlLCBBdWcgNCwgMjAyMCBhdCA2OjI4IEFNIERpZWdvIFN1ZWlybyA8ZGllZ28u
c3VlaXJvQGFybS5jb20+IHdyb3RlOg0KPj4NCj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUg
Zm9sbG93aW5nIGNoYW5nZXM6DQo+Pg0KPj4gMS4gQnkgaW5oZXJpdGluZyBjbWwxLmJiY2xhc3Mg
d2UgY2FuIGRyb3Agc29tZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMNCj4+ICAgIHNldHRpbmdzIGlu
IHhlbi1oeXBlcnZpc29yLmluYyBmb3IgdGhlIG1lbnVjb25maWcgdGFzaywgYW5kIGFsc28gYmUN
Cj4+ICAgIGFibGUgdG8gc2VhcmNoIGZvciBjb25maWcgZnJhZ21lbnMgYW5kIHVzZSB0aGUgZGlm
ZmNvbmZpZyB0YXNrLg0KPj4NCj4+IDIuIENoYW5nZSB0aGUgZG9fY29uZmlndXJlIHRvIHByZS1n
ZW5lcmF0ZSB0aGUgeGVuLy5jb25maWcgaW4gb3JkZXINCj4+ICAgIHRvIGVuYWJsZSB0aGUgbWVy
Z2VfY29uZmlnLnNoIHRvIHJ1biBzdWNjZXNzZnVsbHkgd2hlbiBjb25maWcNCj4+ICAgIGZyYWdt
ZW50cyBhcmUgbGlzdGVkIGluIFNSQ19VUkkuDQo+Pg0KPj4gMy4gQ29weS1hbmQtUGFzdGUgdGhl
IGRvX2RpZmZjb25maWcgZnVuY3Rpb24gZnJvbQ0KPm1ldGEvY2xhc3Nlcy9jbWwxLmJiY2xhc3MN
Cj4+ICAgIGFuZCBtb2RpZnkgdGhlIHBhdGggb2YgdGhlIC5jb25maWcub3JpZyBhbmQgLmNvbmZp
ZyBmaWxlcy4NCj4NCj5UaGFua3MgZm9yIGFub3RoZXIgaW50ZXJlc3Rpbmcgc3VibWlzc2lvbiEN
Cj4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0u
Y29tPg0KPj4gLS0tDQo+PiAgcmVjaXBlcy1leHRlbmRlZC94ZW4vUkVBRE1FICAgICAgICAgICAg
IHwgIDMgKysrDQo+PiAgcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLWh5cGVydmlzb3IuaW5jIHwg
NDYNCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPj4gIDIgZmlsZXMgY2hh
bmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL1JFQURNRSBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL1JF
QURNRQ0KPj4gaW5kZXggMzRlNzk3Ny4uZjg2ZDI2OSAxMDA2NDQNCj4+IC0tLSBhL3JlY2lwZXMt
ZXh0ZW5kZWQveGVuL1JFQURNRQ0KPj4gKysrIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4vUkVBRE1F
DQo+DQo+SSBub3RlIHRoYXQgeW91IGhhdmUgZm91bmQgdGhlIFJFQURNRSBmaWxlLiBQbGVhc2Ug
Y291bGQgeW91IENDIGJvdGggRG91Zw0KPmFuZCBJLCBhcyBpdCByZXF1ZXN0cyBpbiB0aGF0IGZp
bGUsIHdpdGggZnV0dXJlIHN1Ym1pc3Npb25zIGZvciB0aGUgWGVuIHJlY2lwZXM/DQo+DQoNCkkg
bm90aWNlZCB0aGUgZmlsZSBidXQgZGlkbid0IHBheSBhdHRlbnRpb24gdG8gdGhpcy4gOy0pDQpJ
J2xsIG1ha2Ugc3VyZSB0aGF0IGZvciB0aGUgbmV4dCBwYXRjaGVzIEkgd2lsbCBhZGQgeW91IGFu
ZCBEb3VnIGluIENDLg0KDQo+PiBAQCAtMjUsNiArMjUsOSBAQCBTZWxlY3QgdGhlIGNvbmZpZyBz
ZXR0aW5ncyB0aGF0IHlvdSB3YW50IGFuZCBTYXZlDQo+PiB0aGUgZmlsZS4gSWYgeW91IHNhdmUg
aXQgdG8gIHRoZSBkZWZhdWx0ICIuY29uZmlnIiBmaWxlIHdoZW4gcHJvbXB0ZWQNCj4+IGJ5IG1l
bnVjb25maWcsIHlvdSBjYW4gZmluZCBpdCBpbiB0aGUgICd4ZW4nIHN1YmRpcmVjdG9yeSBvZiB0
aGUgYnVpbGQgdHJlZS4NCj4+DQo+PiArQ29uZmlndXJhcmlvbiBmcmFnbWVudHMgYXJlIGFsc28g
c3VwcG9ydGVkLiBUbyB1c2UgdGhlbSB5b3UgbmVlZCB0bw0KPj4gK2xpc3QgdGhlDQo+DQo+c3Bl
bGxpbmc6ICdDb25maWd1cmF0aW9uJyBwbGVhc2UNCj4NCg0KQ2hlY2tlZC4NCg0KPj4gKy5jZmcg
ZmlsZXMgaW4gdGhlIFNSQ19VUkkuDQo+PiArDQo+PiAgc2VjdXJpdHkgcGF0Y2hlcw0KPj4gIC0t
LS0tLS0tLS0tLS0tLS0NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRlZC94ZW4v
eGVuLWh5cGVydmlzb3IuaW5jDQo+PiBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZp
c29yLmluYw0KPj4gaW5kZXggNzg0MDU5Yi4uNTVlZmZlMyAxMDA2NDQNCj4+IC0tLSBhL3JlY2lw
ZXMtZXh0ZW5kZWQveGVuL3hlbi1oeXBlcnZpc29yLmluYw0KPj4gKysrIGIvcmVjaXBlcy1leHRl
bmRlZC94ZW4veGVuLWh5cGVydmlzb3IuaW5jDQo+PiBAQCAtMzEsOSArMzEsMTMgQEAgRklMRVNf
JHtQTn0tZWZpID0gIiBcDQo+PiAgICAgIC9ib290L3hlbi5lZmkgXA0KPj4gICAgICAke2V4ZWNf
cHJlZml4fS9saWI2NC9lZmkveGVuKiBcDQo+PiAgICAgICINCj4+ICtpbmhlcml0IGNtbDENCj4N
Cj5Db3VsZCB0aGlzIGJlIGFkZGVkIHRvIHRoZSBleGlzdGluZyBpbmhlcml0IHN0YXRlbWVudD8N
Cg0KQ2hlY2tlZC4NCg0KPg0KPj4NCj4+ICBkb19jb25maWd1cmUoKSB7DQo+PiAgICAgIGRvX2Nv
bmZpZ3VyZV9jb21tb24NCj4+ICsgICAgY2QgJHtTfS94ZW47IFhFTl9DT05GSUdfRVhQRVJUPXkg
bWFrZQ0KPg0KPlRoaXMgbG9va3MgcXVpdGUgYSBiaXQgbGlrZSBidWlsZGluZy4gSXQgc2VlbXMg
dG8gYnVpbGQgcXVpdGUgYSBsb3Qgd2hlbiBJIHJ1biBpdCBpbg0KPnRoZSBkZXZzaGVsbC4gV2hh
dCBkb2VzIHRoaXMgYnVpbGQ/DQo+SXMgdGhlcmUgYSBzcGVjaWZpYyBidWlsZCB0YXJnZXQgeW91
IGNhbiBzcGVjaWZ5PyBTaG91bGQgaXQgdXNlIG9lX3J1bm1ha2U/DQo+DQoNClRvIGdldCB0aGUg
bWVyZ2VfY29uZmlnLnNoIHdvcmtpbmcgd2UgbmVlZCBhIC5jb25maWcgaW4gcGxhY2UuIEknbGwg
aW52ZXN0aWdhdGUNCmlmIHRoZSB4ZW4gYnVpbGQgc3lzdGVtIHN1cHBvcnRzIGdlbmVyYXRpbmcg
dGhlIC5jb25maWcgd2l0aG91dCBjb21waWxpbmcgdGhlDQp3aG9sZSBwcm9qZWN0Lg0KDQo+PiAr
ICAgICR7U30veGVuL3Rvb2xzL2tjb25maWcvbWVyZ2VfY29uZmlnLnNoIC1tICR7U30veGVuLy5j
b25maWcgJHtAIg0KPj4gKyAiLmpvaW4oZmluZF9jZmdzKGQpKX0NCj4NCj5QbGVhc2UgY291bGQg
eW91IHRlc3QgZm9yIHRoZSBwcmVzZW5jZSBvZiBhdCBsZWFzdCBvbmUgY29uZmlnIGZyYWdtZW50
IGJlaW5nDQo+cHJlc2VudCBpbiB0aGUgU1JDX1VSSSBiZWZvcmUgcnVubmluZyB0aGUgbWVyZ2Ug
c2NyaXB0Lg0KPg0KDQpDaGVja2VkLg0KDQo+PiArICAgIGNtbDFfZG9fY29uZmlndXJlDQo+PiAg
fQ0KPj4NCj4+ICBkb19jb21waWxlKCkgew0KPj4gQEAgLTc3LDE1ICs4MSwxMSBAQCBkb19kZXBs
b3lbZGVwZW5kc10gKz0gInhlbi0NCj50b29sczpkb19wb3B1bGF0ZV9zeXNyb290Ig0KPj4gIGRv
X2RlcGxveVtkZXBlbmRzXSArPSAieGVuLXRvb2xzOmRvX2RlcGxveSINCj4+DQo+PiAgIyBFbmFi
bGUgdXNlIG9mIG1lbnVjb25maWcgZGlyZWN0bHkgZnJvbSBiaXRiYWtlIGFuZCBhbHNvIHdpdGhp
biB0aGUNCj4+IGRldnNoZWxsIC1PRV9URVJNSU5BTF9FWFBPUlRTICs9ICJIT1NUX0VYVFJBQ0ZM
QUdTIEhPU1RMREZMQUdTDQo+VEVSTUlORk8gQ1JPU1NfQ1VSU0VTX0xJQiBSRUNJUEVfU1lTUk9P
VF9OQVRJVkUiDQo+PiAtSE9TVF9FWFRSQUNGTEFHUyA9ICIke0JVSUxEX0NGTEFHU30gJHtCVUlM
RF9MREZMQUdTfSINCj4+IC1IT1NUTERGTEFHUyA9ICIke0JVSUxEX0xERkxBR1N9Ig0KPj4gLVRF
Uk1JTkZPID0gIiR7U1RBR0lOR19EQVRBRElSX05BVElWRX0vdGVybWluZm8iDQo+PiArT0VfVEVS
TUlOQUxfRVhQT1JUUyArPSAiUkVDSVBFX1NZU1JPT1RfTkFUSVZFIg0KPg0KPlNlZSBmZWVkYmFj
ayBvbiB0aGUgZWFybGllciBwYXRjaCBpbiB0aGlzIHNlcmllcyBwbGVhc2UuDQo+DQoNCkNoZWNr
ZWQuDQoNCj4+ICBkb19kZXZzaGVsbFtkZXBlbmRzXSArPSAibmN1cnNlcy1uYXRpdmU6ZG9fcG9w
dWxhdGVfc3lzcm9vdCINCj4+DQo+PiAtQ1JPU1NfQ1VSU0VTX0xJQiA9ICItbG5jdXJzZXMgLUwk
UkVDSVBFX1NZU1JPT1RfTkFUSVZFL3Vzci9saWIiDQo+PiArQ1JPU1NfQ1VSU0VTX0xJQiArPSAi
LUwkUkVDSVBFX1NZU1JPT1RfTkFUSVZFL3Vzci9saWIiDQo+Pg0KPj4gLUtDT05GSUdfQ09ORklH
X0NPTU1BTkQgPz89ICJtZW51Y29uZmlnIg0KPj4gIHB5dGhvbiBkb19tZW51Y29uZmlnKCkgew0K
Pj4gICAgICBpbXBvcnQgc2h1dGlsDQo+Pg0KPj4gQEAgLTEwNyw3ICsxMDcsMzMgQEAgcHl0aG9u
IGRvX21lbnVjb25maWcoKSB7DQo+PiAgICAgICAgICBiYi5ub3RlKCJDb25maWd1cmF0aW9uIGNo
YW5nZWQsIHJlY29tcGlsZSB3aWxsIGJlIGZvcmNlZCIpDQo+PiAgICAgICAgICBiYi5idWlsZC53
cml0ZV90YWludCgnZG9fY29tcGlsZScsIGQpICB9DQo+PiAtZG9fbWVudWNvbmZpZ1tkZXBlbmRz
XSArPSAibmN1cnNlcy1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCINCj4+IC1kb19tZW51Y29u
ZmlnW25vc3RhbXBdID0gIjEiDQo+PiAtZG9fbWVudWNvbmZpZ1tkaXJzXSA9ICIke0J9Ig0KPj4g
LWFkZHRhc2sgbWVudWNvbmZpZyBhZnRlciBkb19jb25maWd1cmUNCj4+ICsNCj4+ICtweXRob24g
ZG9fZGlmZmNvbmZpZygpIHsNCj4+ICsgICAgaW1wb3J0IHNodXRpbA0KPj4gKyAgICBpbXBvcnQg
c3VicHJvY2Vzcw0KPj4gKw0KPj4gKyAgICB3b3JrZGlyID0gZC5nZXRWYXIoJ1dPUktESVInKQ0K
Pj4gKyAgICBmcmFnbWVudCA9IHdvcmtkaXIgKyAnL2ZyYWdtZW50LmNmZycNCj4+ICsgICAgY29u
Zmlnb3JpZyA9ICd4ZW4vLmNvbmZpZy5vcmlnJw0KPj4gKyAgICBjb25maWcgPSAneGVuLy5jb25m
aWcnDQo+PiArDQo+PiArICAgIHRyeToNCj4+ICsgICAgICAgIG1kNW5ld2NvbmZpZyA9IGJiLnV0
aWxzLm1kNV9maWxlKGNvbmZpZ29yaWcpDQo+PiArICAgICAgICBtZDVjb25maWcgPSBiYi51dGls
cy5tZDVfZmlsZShjb25maWcpDQo+PiArICAgICAgICBpc2RpZmYgPSBtZDVuZXdjb25maWcgIT0g
bWQ1Y29uZmlnDQo+PiArICAgIGV4Y2VwdCBJT0Vycm9yIGFzIGU6DQo+PiArICAgICAgICBiYi5m
YXRhbCgiTm8gY29uZmlnIGZpbGVzIGZvdW5kLiBEaWQgeW91IGRvIG1lbnVjb25maWcgP1xuJXMi
DQo+PiArICUgZSkNCj4+ICsNCj4+ICsgICAgaWYgaXNkaWZmOg0KPj4gKyAgICAgICAgc3RhdGVt
ZW50ID0gJ2RpZmYgLS11bmNoYW5nZWQtbGluZS1mb3JtYXQ9IC0tb2xkLWxpbmUtZm9ybWF0PSAt
LW5ldy0NCj5saW5lLWZvcm1hdD0iJUwiICcgKyBjb25maWdvcmlnICsgJyAnICsgY29uZmlnICsg
Jz4nICsgZnJhZ21lbnQNCj4+ICsgICAgICAgIHN1YnByb2Nlc3MuY2FsbChzdGF0ZW1lbnQsIHNo
ZWxsPVRydWUpDQo+PiArICAgICAgICAjIE5vIG5lZWQgdG8gY2hlY2sgdGhlIGV4aXQgY29kZSBh
cyB3ZSBrbm93IGl0J3MgZ29pbmcgdG8gYmUNCj4+ICsgICAgICAgICMgbm9uLXplcm8sIGJ1dCB0
aGF0J3Mgd2hhdCB3ZSBleHBlY3QuDQo+PiArICAgICAgICBzaHV0aWwuY29weShjb25maWdvcmln
LCBjb25maWcpDQo+PiArDQo+PiArICAgICAgICBiYi5wbGFpbigiQ29uZmlnIGZyYWdtZW50IGhh
cyBiZWVuIGR1bXBlZCBpbnRvOlxuICVzIiAlIGZyYWdtZW50KQ0KPj4gKyAgICBlbHNlOg0KPj4g
KyAgICAgICAgaWYgb3MucGF0aC5leGlzdHMoZnJhZ21lbnQpOg0KPj4gKyAgICAgICAgICAgIG9z
LnVubGluayhmcmFnbWVudCkNCj4+ICt9DQo+DQo+QXQgdGhlIHBvaW50IHdoZXJlIHRoaXMgY29k
ZSBpcyBiZWluZyBjb3BpZWQgYWNyb3NzIGludG8gdGhpcyByZWNpcGUsIGl0IHdvdWxkIGJlDQo+
Z29vZCB0byBiZSB3b3JraW5nIG9uIGEgd2F5IHRvIGZvbGQgaXQgYmFjayB0b2dldGhlciB3aGVu
IHBvc3NpYmxlLiBTaW5jZQ0KPnlvdSdyZSBpbnRyb2R1Y2luZyBpbmhlcml0IG9mIHRoZSBjbWwx
IGNsYXNzLCB3aGF0IGRvIHlvdSB0aGluayB0byBzdWJtaXR0aW5nIGENCj5wYXRjaCB0byB0aGUg
Y2xhc3MgdG8gbWFrZSB0aGUgbWVudWNvbmZpZyBhbmQgZGlmZmNvbmZpZyBmdW5jdGlvbnMgZ2Vu
ZXJhbA0KPmVub3VnaCAtLSBlZy4gbWFraW5nIHRoZSBuYW1lcyBvZiB0aGUgY29uZmlnIGZpbGVz
IG92ZXJyaWRhYmxlIHZpYSB2YXJpYWJsZXMsDQo+anVzdCBsaWtlIHRoZSBLQ09ORklHX0NPTkZJ
R19DT01NQU5EIHZhcmlhYmxlLCBldGMgLS0gc28gdGhhdCB0aGUNCj5tZW51Y29uZmlnIGFuZCBk
aWZmY29uZmlnIGNvZGUgaW4gdGhpcyByZWNpcGUgY2FuIGJlIGRyb3BwZWQgbGF0ZXIgaW4gZmF2
b3VyIG9mDQo+anVzdCBzZXR0aW5nIGEgZmV3IHZhcmlhYmxlcyBmb3IgdGhhdCBjbGFzcz8NCj4N
Cg0KR29vZCBpZGVhLiBMZXQncyBzZWUgd2hhdCBJIGNhbiBjb21lIHVwIHdpdGggaW4gb2UtY29y
ZS4gVGhlIG9ubHkgY2F2ZWF0IHRoYXQNCkkgc2VlIHdpdGggdGhlIGN1c3RvbSBtZW51Y29uZmln
IHRhc2sgaXMgdGhlIGN1c3RvbSBvZV90ZXJtaW5hbCBjYWxsLg0KDQo+Q2hyaXN0b3BoZXINCj4N
Cj4NCj4+ICsNCj4+IC0tDQo+PiAyLjcuNA0KPj4NCj4+IA0K

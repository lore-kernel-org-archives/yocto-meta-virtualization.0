Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.42])
 by mx.groups.io with SMTP id smtpd.web12.11784.1582117795678460357
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 05:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8obI6mqO;
 spf=pass (domain: arm.com, ip: 40.107.9.42, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhKuUuE1sG+PmSkDmcs6zScidiWwcogqkaUg4c4XjXU=;
 b=8obI6mqOTmM8yMfXR5uRIGehn2BVmomll3HOjrygWywgn4ldirsJzTZ+xqphFG8hJrOu1daPmHTx1kbIsVpQoB00ChVfWmdifyvjkBtf2srBIls+DnJFTmw0mlnkFwOoyaqRaVpVLRRQ2h87jOIiYnj40fhaZTKjP5rXLvJ3Cu4=
Received: from VI1PR08CA0204.eurprd08.prod.outlook.com (2603:10a6:800:d2::34)
 by PR2PR08MB4763.eurprd08.prod.outlook.com (2603:10a6:101:20::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Wed, 19 Feb
 2020 13:09:53 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0204.outlook.office365.com
 (2603:10a6:800:d2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Wed, 19 Feb 2020 13:09:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Wed, 19 Feb 2020 13:09:51 +0000
Received: ("Tessian outbound 0420f1404d58:v42"); Wed, 19 Feb 2020 13:09:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ada6991fe37a23d2
X-CR-MTA-TID: 64aa7808
Received: from ecec594b927c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5C532A1-EB39-4E62-94BF-7399C945506E.1;
	Wed, 19 Feb 2020 13:09:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ecec594b927c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Feb 2020 13:09:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSyNil//3Ce02LeZ9KP1g7DF0fACxlVPmwVju+ZYjuQpWZTrF5WZWvSEtOws2ozuMmhwrCDO14PoyCtXvH+Po9yVrX7W0MyKaRe+AeN3Wb1+ki0NT6sejThKtgya/33ZTXxdc21ebt+UqLQpylZPUh3UDv7x4EJvyhyXfHByBgIvm3MdNUv6dywukpsLKrkQ2TKbS0oHZObbbXSEPp/XYDcK105xb9kl3PMAklLmTrsr43lc9Yo51wuz0nbknJ5KisuBzdgymW+jwsWVY48STqeMiDALWW5dvn5mMBuQjZpaicK0QYYWsP76l7yIe6E85rujTwZ44lCgLSS7oYZTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhKuUuE1sG+PmSkDmcs6zScidiWwcogqkaUg4c4XjXU=;
 b=aXZzSR8kgSVgZg2/eut/iHbgJ/gzmlx0uYhYrz1/E+Wc+dQRfNSqPgR4qZlJKhUK0QPkgqjOz78xkFNRw1UPczdSjwCeu338Gw2kgIADM6TDdTnIDhXDMv6JBcBFvymASViZ6ujUaGfsF/BABWxbPXx6urHFFx+ZQ1HC4wdb28JxID+FhyAV/pwswuxQ45Ksd8Ww0DOYMOGCckD/dpKZaS0mg8c3vrBK+Pcz6VMqL7uTnX60jSeyCyN0oQtR3/5YhYDIzaOUNQcKm+LxPCoMMgjREkfVzBJeMFnySm3qPjPL5iZHPMJXnN++zU4P5eck349jbqKXNEy+NgsV7Eck1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhKuUuE1sG+PmSkDmcs6zScidiWwcogqkaUg4c4XjXU=;
 b=8obI6mqOTmM8yMfXR5uRIGehn2BVmomll3HOjrygWywgn4ldirsJzTZ+xqphFG8hJrOu1daPmHTx1kbIsVpQoB00ChVfWmdifyvjkBtf2srBIls+DnJFTmw0mlnkFwOoyaqRaVpVLRRQ2h87jOIiYnj40fhaZTKjP5rXLvJ3Cu4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3834.eurprd08.prod.outlook.com (20.178.46.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 13:09:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757%5]) with mapi id 15.20.2729.033; Wed, 19 Feb 2020
 13:09:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
Thread-Topic: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
Thread-Index: AQHV4yAC3gKdgPudEESOac5rHgMHYagihXIA
Date: Wed, 19 Feb 2020 13:09:42 +0000
Message-ID: <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com>
References: <15F33D74C6BC534D.11355@lists.yoctoproject.org>
In-Reply-To: <15F33D74C6BC534D.11355@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3002de9-812e-47bc-50b8-08d7b53d0105
X-MS-TrafficTypeDiagnostic: DB7PR08MB3834:|PR2PR08MB4763:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47637DC7EAC5946F962B7AAC9D100@PR2PR08MB4763.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0318501FAE
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(36756003)(4326008)(53546011)(6506007)(86362001)(66556008)(66946007)(91956017)(5660300002)(66476007)(76116006)(2906002)(64756008)(66446008)(316002)(478600001)(33656002)(2616005)(71200400001)(8936002)(186003)(81166006)(26005)(6512007)(8676002)(6916009)(6486002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3834;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4V41n9bL/va7BhlGmXpoe7gJtJGYvRltCq+0dMcg13nw6kQipSASEkoxu3XqhPWEzlluMSWwF2gbcxZCoBY8EDg0UolQ+QOCGKyulhyMKITI6ZR90tu6sAujyVuXieIsKeHXNwMtrkLpwnSJ4qcq+WgscgcDcHOIL/tOnVjXBwWKHoPjsVRVgeJl+Y4RWyKn4/j0yfmHQnLE9komM7NBEHSTSxOYqZhT0BKT2ires5ohKTNZMf23Qs5NQSv6cbfGFmY1Bfj2uuTaLGe1AhxsvmIMqluW+KHuxDwXFJt3x/EdwBWPeAcsTla9Rp6asfM47/BuTIioKV/gB5AJ2Qq+VtGZrnTTuahM6fs5LxkzdNjFo1WB0dmNoFK9V1gzF0DSpXMltg2toW1/79td5dHAlL8sRwW4i97zUMbuj3PnuXTPwsiQ+abm6NHpqxHrNOtW
x-ms-exchange-antispam-messagedata: 
 8Rs1h1b+RWCcuXlqPN64wVed2lr8WQYv8NoPl7ZqabhH6EoBDpVWZV9AQqdi85lDEg91vhcRDOCW6+98F+GWtqiHuLmmuCvY9A2IqXM8fThasdwczedMfU5M/ubkIun1JORo3ZJleGRCCOiLhhEr+w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3834
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(199004)(189003)(2616005)(6486002)(2906002)(478600001)(6512007)(4326008)(336012)(107886003)(26826003)(36756003)(26005)(356004)(316002)(36906005)(5660300002)(33656002)(81166006)(8676002)(53546011)(6506007)(81156014)(8936002)(86362001)(70586007)(186003)(70206006)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:PR2PR08MB4763;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6483c033-2e41-4c8b-4b67-08d7b53cfc42
X-Forefront-PRVS: 0318501FAE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9mko6C918qmibm93b19Lhk49BXLRJmliqcrnqVVQ2mqm73u0nTwSID6GMO7m0rgiSbw+UfC/AnhIULTJbAP+fD5DbQaClx0nwf2fcTgonFm7/l0TCX/4eF4dyQcDB5Coj0XUstQOC55HubAWELBHIMidE13Aav3Zianjx/AKBOttL8zxv/gS0dA8v1YIPIBUhYlPUjDEknHv1AZcmcLCI5Z3uX9sKbjwYKaJwUIkrxBMnrJ4p1UX57mHL9FIAy0ZmEzXEzNF0HxCKew+GyF/yId5XGDxR+wVbjZDRQg9F8RaNc2yNWMufOgeYyU3+MVJKB+wLwOGt8DGHi0hveLLGMqiWyS7DcjtJKkTVHU8TkqzHcq66C50engrKOyGW1PhrObsSfeWMQ8tI3PivV3kSNixjMvALIOv4VyO9OPu9f7pyfvHMLC179259Wptohzu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 13:09:51.0372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3002de9-812e-47bc-50b8-08d7b53d0105
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4763
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <17E55B3A66E41B4FB1CE48782B267A72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQo+IE9uIDE0IEZlYiAyMDIwLCBhdCAxMDoxNywgQmVydHJhbmQgTWFycXVpcyB2aWEgTGlzdHMu
WW9jdG9wcm9qZWN0Lk9yZyA8YmVydHJhbmQubWFycXVpcz1hcm0uY29tQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IHdyb3RlOg0KPg0KPiBkb19kZXBsb3kgaXMgdXNpbmcgdGhlIGZpbGVzIGluc3Rh
bGxlZCBkdXJpbmcgZG9faW5zdGFsbCBhbmQgaXQgbXVzdCBiZQ0KPiBleGVjdXRlZCBhZnRlciBp
dCBidXQgYmVmb3JlIGRvX2J1aWxkLiBUaGlzIGlzIGZpeGluZyBTU1RBVEUgYmVoYXZpb3VyDQo+
IHdoaWNoIGhhZCBwcmV2aW91c2x5IGFuIGVtcHR5IHNjZW5lIGluIHNvbWUgY2FzZXMuDQoNCkFu
eSBjaGFuY2Ugc29tZWJvZHkgY291bGQgY2hlY2sgYW5kIGFjayBvbiB0aGlzID8NCg0KV2hpbGUg
dGhlcmUsIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gYWxzbyBwdXNoIHRoaXMgaW4gemV1cyBicmFu
Y2guDQoNCuKAlA0KQmVydHJhbmQgTWFycXVpcw0KDQo+DQo+IENoYW5nZS1JZDogSTA0YjFmNjUy
YzY5N2VkMGJjN2UyNjI1NzFkZDAzZTEyM2FjMDk2ZjYNCj4gU2lnbmVkLW9mZi1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiAtLS0NCj4gcmVjaXBlcy1l
eHRlbmRlZC94ZW4veGVuLmluYyB8IDQgKysrLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVk
L3hlbi94ZW4uaW5jIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLmluYw0KPiBpbmRleCAzNmFi
NzhlLi40MWIxOTgzIDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4uaW5j
DQo+ICsrKyBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi5pbmMNCj4gQEAgLTEwOTksNyArMTA5
OSw5IEBAIGRvX2RlcGxveSgpIHsNCj4gICAgIGZpDQo+IH0NCj4NCj4gLWFkZHRhc2sgZGVwbG95
IGFmdGVyIGRvX3BvcHVsYXRlX3N5c3Jvb3QNCj4gKyMgZG9fZGVwbG95IGlzIHVzaW5nIGZpbGVz
IGNyZWF0ZWQgZHVyaW5nIGRvX2luc3RhbGwgc28gZm9yY2UgaXQgdG8gYmUgY2FsbGVkDQo+ICsj
IGFmdGVyIGRvX2luc3RhbGwgYnV0IGJlZm9yZSBkb19idWlsZA0KPiArYWRkdGFzayBkZXBsb3kg
YmVmb3JlIGRvX2J1aWxkIGFmdGVyIGRvX2luc3RhbGwNCj4NCj4gIyBFbmFibGUgdXNlIG9mIG1l
bnVjb25maWcgZGlyZWN0bHkgZnJvbSBiaXRiYWtlIGFuZCBhbHNvIHdpdGhpbiB0aGUgZGV2c2hl
bGwNCj4gT0VfVEVSTUlOQUxfRVhQT1JUUyArPSAiSE9TVF9FWFRSQUNGTEFHUyBIT1NUTERGTEFH
UyBURVJNSU5GTyINCj4gLS0NCj4gMi4xNy4xDQo+DQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBj
b250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlh
bCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
IHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBu
b3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3Ig
YW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRp
dW0uIFRoYW5rIHlvdS4NCg==

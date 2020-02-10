Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.89])
 by mx.groups.io with SMTP id smtpd.web12.20508.1581333152092137426
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 03:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LFAz2dtn;
 spf=pass (domain: arm.com, ip: 40.107.14.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xezxm9dpCcfqcGDbK5DXLqeeMEC8ZmNl9MrmMQXa64=;
 b=LFAz2dtn4l71Q4HmDS9r0s5yk2YCjzaHWlurk+sqUgji2CwE9H0fLb8SMag6P3tmlRh2u9BKY8jGsDMgq39OwxDuBqVDGzXc4yL1pp9pb04rayoWH9yONr9A9fYDeisWy7wY9YQKpqZG+lQkV3vskksdiRlMHBpaAhOi0Qt8uos=
Received: from AM6PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:20b:b2::30)
 by VI1PR08MB4288.eurprd08.prod.outlook.com (2603:10a6:803:fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Mon, 10 Feb
 2020 11:12:28 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM6PR08CA0018.outlook.office365.com
 (2603:10a6:20b:b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via Frontend
 Transport; Mon, 10 Feb 2020 11:12:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 10 Feb 2020 11:12:28 +0000
Received: ("Tessian outbound 3a0cbd311638:v42"); Mon, 10 Feb 2020 11:12:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a7221b89a761b19
X-CR-MTA-TID: 64aa7808
Received: from 4d925bb343ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 310E427B-9880-463C-B8DE-3ED86D1EA339.1;
	Mon, 10 Feb 2020 11:12:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d925bb343ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Feb 2020 11:12:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1fvGk7e5gT8zWx+ukqc+l4x3rQ/IFvK3BC2SeUgaCVqC2N6Js3GdRDOKQL/ZVhUFMrkQDMlDbOaEWt3i3YnohuMJ0P6HaiwxkOkr781PS4DwAkmRCT6sqEUzde1muKNI1mP4JK/lck5j5w99adu6bfZSMQxIFioxIIJUqfWqBlgEEhWoFbZpk0zE9/fmY+H5JnIFH8IWM1OBB4Q6mTMbIvfeej0jjbttK6txoWZHKmKmPaRPrnINDmjmBfjWfNkNDlxvikLCVGUv4rTc2Xi2AAXOEyafwiDnFj7JhAm+qdnc9pwLMSz3KSApPs8kOYDoNQJDFTRUP2ur97lZ/UP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xezxm9dpCcfqcGDbK5DXLqeeMEC8ZmNl9MrmMQXa64=;
 b=kk4WY+PYld4PSPgNqghiGDbbll2V99AfBthlKnQw2D/RZRYKL5Isyv6LT3kjycBirfBfRpx5ZC03BMykpivX5hrLCxw+TPSXYZJvlIcbVp6tfzbPIySaEWDVM6fd2xmOz95cddarRiIE87W6Py/ZY8jis4mQgda3rgCupsFyul/5azicYANStt76eOc//npOuaIQBhCkVBhqo+VS3jrDDESJG/kg55NOj8Ht0olHz+lhZhHCwva4q6FgfKgqoAmYU4naZYw3tf0cQ4g4xi8OQOutpu/BXgiU33DhqBY+PJBdJv1pG9ZZZN2c7GcICPfiGJICjoMYk72md/Mh7BfZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xezxm9dpCcfqcGDbK5DXLqeeMEC8ZmNl9MrmMQXa64=;
 b=LFAz2dtn4l71Q4HmDS9r0s5yk2YCjzaHWlurk+sqUgji2CwE9H0fLb8SMag6P3tmlRh2u9BKY8jGsDMgq39OwxDuBqVDGzXc4yL1pp9pb04rayoWH9yONr9A9fYDeisWy7wY9YQKpqZG+lQkV3vskksdiRlMHBpaAhOi0Qt8uos=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3083.eurprd08.prod.outlook.com (52.135.131.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Mon, 10 Feb 2020 11:12:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757%5]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 11:12:21 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	Paul Barker <pbarker@konsulko.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
Thread-Topic: [meta-virtualization] Layer.conf require of
 meta-virt-default-versions.inc
Thread-Index: AQHV3c0tFm6QIvToJkiO/cM4th+yc6gUFjWAgAA0HAA=
Date: Mon, 10 Feb 2020 11:12:21 +0000
Message-ID: <87461434-6571-431A-996A-0236271C6F1B@arm.com>
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com>
 <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
In-Reply-To: 
 <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1936739b-eae5-4772-ed24-08d7ae1a1d7d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3083:|VI1PR08MB4288:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB42888BBAD8AC02AFC9715F249D190@VI1PR08MB4288.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 03094A4065
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(66556008)(66946007)(76116006)(91956017)(66476007)(66446008)(4326008)(81156014)(81166006)(6916009)(64756008)(186003)(478600001)(8936002)(6506007)(71200400001)(6486002)(26005)(8676002)(36756003)(53546011)(6512007)(86362001)(316002)(33656002)(2616005)(54906003)(2906002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3083;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /Toz62Hr2RmcbRmlBAbeyia1J1yk2J7GGCo1XKA2fX9FMrp6WA3lmTRU4yuTpdhg1G4AQcxWgvZRDkbhqss/p/Zz3ej/LoFfZgsOX9hxb7LVMets9pWrsbnJCQiAcdnR9BvwpKAzlzmp4RkAm+ppnkOaBp5HFi+/g7LhqcwyisXlTX7tLPROkwpm6nMKVSByQY6styplcaXp9TkgTVrOLju97hf2+U9U4CRDsS/q8Ut+mnF6MUXwBs4L9BJ/2jh6eHJKhEL7JEzCUja7ToiBNZsw8FwrICeKxSGC0sjDbQ2bnQO+dGvur3eFzO4pueF0OwbbKvjbktD9s858rm83BTa84y3k8RW6pgpv6dnLNej6Rqd2ThdAx6M4ggIhpSCQTEpIb8lQlmI5RBPAr/9EM7e8e7v+NvrdKJJPB3goppfsPtD4A1qw4VkkKg0zWmzG
x-ms-exchange-antispam-messagedata: 
 Sc9n6OkLH2fFjkFYjmjimvNHzyNBLzZKeKl5LEOVvKSef9yBQkE/EIGxPsNN9eeKWXGo95NFahPftXl7aGVMh89JA6tocwOpFjPH+9R5R6hg1Y7HAX24pBPclW975H67eLIKqPbU3dkoxQYeNtLaBw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3083
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(356004)(81166006)(478600001)(26826003)(8676002)(8936002)(81156014)(2616005)(336012)(2906002)(26005)(186003)(6916009)(86362001)(33656002)(53546011)(6506007)(4326008)(107886003)(6512007)(36756003)(70586007)(70206006)(5660300002)(316002)(54906003)(36906005)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4288;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7fc724b8-f8ff-4f63-9ed3-08d7ae1a1970
X-Forefront-PRVS: 03094A4065
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Po0RGeKiYSl4hJIUnXIIZ7RuXiBDxCX4qaqfKXRxqSbJzLWo7DXmg757e67eFjI9WTaGmo6vo17nbYDXUrahWTpLt2BRGntNJNubNS/gaBWyXdXS8Z/ya50xNbkTCqubWm0PY3/RT67sAeQKBgx0ltDadCKoo+IyxzAQirTtlbm9rs5ZL+hqLMX0gD6jyOalkBa2dtQOL0Jmp/YpANESvBp6ZZBPBo1F6sRqHneIJMGvd5qiK1TYP2JZNyacSOdm/vROkIuwat2ur/0zwlJd0jA6DQMCqbJnoR8JSUEP6zCglHxYk2W8gy46wHJiVIfCWJ3J0bPhoWld7IdS+GINceB6O5jZ/xphhF++m7cLlt9hbocJ5bHd0m0rDpgG/b/8hDVzb707yBVWO15xM2gdDujWM/0ewGXYYqY/7pXpm5cC83AMstFIQhVNzDhmvF0/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 11:12:28.2738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936739b-eae5-4772-ed24-08d7ae1a1d7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4288
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C00495655098A489D2F19B1668E1C03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gMTAgRmViIDIwMjAsIGF0IDA4OjA1LCBQYXVsIEJhcmtlciA8cGJhcmtlckBrb25z
dWxrby5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCA3IEZlYiAyMDIwIGF0IDE1OjQyLCBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBI
aSBFdmVyeW9uZSwNCj4+IA0KPj4gVHJ5aW5nIHRvIGRlc2lnbiBteSBvd24gbGF5ZXIgSSB1c2Vk
IHRoZSBleGFtcGxlIG9mIG1ldGEtdmlydHVhbGl6YXRpb24gbGF5ZXIgY29uZmlndXJhdGlvbiB0
byB0cnkgdG8gaW5jbHVkZSBhIGZpbGUgZGVwZW5kaW5nIG9uIGEgRElTVFJPX0ZFQVRVUkVTIHZh
bHVlLg0KPj4gDQo+PiBBZnRlciBzZXZlcmFsIHRlc3RzLCBJIGRpc2NvdmVyZWQgdGhhdCBhbGwg
dGhlIHZhbHVlcyB0aGF0IEkgZGlkIGRlZmluZWQgaW4gdGhlIGluY2x1ZGVkIGZpbGUgaGF2ZSBu
byBlZmZlY3QsIGluIGZhY3QgSSBnZXQgdGhlIGZlZWxpbmcgdGhhdCBESVNUUk9fRkVBVFVSRVMg
ZG9lcyBub3QgY29udGFpbiB0aGUgZW50cmllcyBJIGFkZCBpbiBsb2NhbC5jb25mIHdoZW4gbGF5
ZXIuY29uZiBpcyBwYXJzZWQuDQo+IA0KPiBUaGlzIGlzIGNvcnJlY3QgLSBsYXllci5jb25mIGlu
IGVhY2ggbGF5ZXIgaXMgcGFyc2VkIGJlZm9yZSBsb2NhbC5jb25mLg0KPiANCj4+IA0KPj4gTWV0
YS12aXJ0dWFsaXphdGlvbiBpcyB1c2luZyB0aGlzIHN5c3RlbSB0byBzZXQgUFJFRkVSUkVEX1ZF
UlNJT04gZm9yIHNvbWUgcGFja2FnZXMgYnV0IGl0IHNlZW1zIHRoYXQ6DQo+PiAtIHVzaW5nIHJl
cXVpcmUgd2l0aG91dCBhIGZ1bGwgcGF0aCBkb2VzIG5vdCB3b3JrIChtYXliZSB0aGUgcmVxdWly
ZSBzaG91bGQgYmUgY2hhbmdlZCB0byBjb25mL2Rpc3Ryby9pbmNsdWRlL21ldGEtdmlydC1kZWZh
dWx0LXZlcnNpb25zLmluYykNCj4+IC0gZXZlbiB3aXRoIHRoZSByaWdodCBwYXRoIHVzaW5nIGJi
LnV0aWxzLmNvbnRhaW5zIGRvZXMgbm90IHdvcmsgaWYgRElTVFJPX0ZFQVRVUkVTIGlzIHNldCBp
biBsb2NhbC5jb25mDQo+PiANCj4+IENvdWxkIGFueW9uZSBjb25maXJtIG9yIGV4cGxhaW4gbWUg
d2hlcmUgSSBhbSB3cm9uZyBoZXJlID8NCj4gDQo+IExvb2tpbmcgYXQgbGF5ZXIuY29uZiBpbiBt
ZXRhLXZpcnR1YWxpemF0aW9uIG9uIHRoZSBtYXN0ZXIgYnJhbmNoLCBpdA0KPiBkb2VzIHdvcnJ5
IG1lIGEgYml0IHRoYXQgdGhlc2UgbGluZXMgbWlnaHQgbm90IHdvcmsgYXMgZXhwZWN0ZWQ6DQo+
IA0KPiAgICBVU0VSX0NMQVNTRVNfYXBwZW5kID0gIiAke0BiYi51dGlscy5jb250YWlucygnRElT
VFJPX0ZFQVRVUkVTJywNCj4gJ3ZpcnR1YWxpemF0aW9uJywgJ21ldGEtdmlydC1jZmcnLCAnJywg
ZCl9Ig0KPiAgICBVU0VSX0NMQVNTRVNfYXBwZW5kID0gIiAke0BiYi51dGlscy5jb250YWlucygn
RElTVFJPX0ZFQVRVUkVTJywNCj4gJ2s4cycsICdtZXRhLXZpcnQtazhzLWNmZycsICcnLCBkKX0i
DQo+IA0KPiBQZXJoYXBzIHRoZXNlIHNob3VsZCBiZWNvbWUgdW5jb25kaXRpb25hbCBhcHBlbmRz
IHRvIFVTRVJfQ0xBU1NFUyBhbmQNCj4gdGhlIERJU1RST19GRUFUVVJFUyBjaGVja3Mgc2hvdWxk
IGJlIGRvbmUgaW5zaWRlIHRob3NlIGNsYXNzZXMuDQo+IA0KPiBCcnVjZSwgYW55IHRob3VnaHRz
IG9uIHRoaXMgb25lIGZvciBtZXRhLXZpcnR1YWxpemF0aW9uPw0KPiANCj4+IA0KPj4gSGVyZSBh
cmUgdGhlIHRlc3RzIEkgZGlkIHRvIGVuZCB1cCB3aXRoIHRob3NlIGNvbmNsdXNpb25zOg0KPj4g
LSAicmVxdWlyZSBtZXRhLXZpcnQtZGVmYXVsdC12ZXJzaW9ucy5pbmPigJ0gZGlyZWN0bHkgaW4g
bGF5ZXIuY29uZiBpcyBlbmRpbmcgd2l0aCBhIGJpdGJha2UgZXJyb3INCj4+ICBTbyB0aGUgZmls
ZSBpcyBub3QgZm91bmQgaGVyZS4NCj4+IC0g4oCccmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRl
L21ldGEtdmlydC1kZWZhdWx0LXZlcnNpb25zLmluY+KAnSBidWlsZCBjb3JyZWN0bHkNCj4+ICBT
byB0aGUgZmlsZSBpcyBwcm9wZXJseSBpbmNsdWRlZCBoZXJlLg0KPj4gLSBhZGRpbmcg4oCcVEVT
VD0iIOKAnCBpbiAgbWV0YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5jIGFuZCDigJxyZXF1aXJl
IGNvbmYvZGlzdHJvL2luY2x1ZGUvbWV0YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5j4oCdIGlu
IGxheWVyLmNvbmYgZW5kIHVwIGluIGFuIGVycm9yDQo+PiAgU28gdGhlIGZpbGUgaXMgcHJvcGVy
bHkgaW5jbHVkZWQgaGVyZS4NCj4+IC0gYWRkaW5nIOKAnFRFU1Q9IiDigJwgaW4gIG1ldGEtdmly
dC1kZWZhdWx0LXZlcnNpb25zLmluYyBhbmQg4oCccmVxdWlyZSAke0BiYi51dGlscy5jb250YWlu
cygnRElTVFJPX0ZFQVRVUkVTJywgJ3ZpcnR1YWxpemF0aW9uJywgJ21ldGEtdmlydC1kZWZhdWx0
LXZlcnNpb25zLmluYycsICcnLCBkKX3igJ0gaW4gbGF5ZXIuY29uZiBidWlsZCBjb3JyZWN0bHkN
Cj4+ICBTbyB0aGUgZmlsZSBpcyBub3QgaW5jbHVkZWQgaGVyZQ0KPj4gDQo+PiBJcyB0aGVyZSBh
IHJpZ2h0IHdheSB0byBhY2hpZXZlIHdoYXQgaXMgd2FudCBpbiBsYXllci5jb25mID8NCj4gDQo+
IFlvdSBuZWVkIHRvIGRlbGF5IHBhcnNpbmcgb2YgeW91ciB2YXJpYWJsZSB1bnRpbCBhZnRlciBi
aXRiYWtlLmNvbmYgaXMNCj4gcGFyc2VkICh3aGljaCBpbmNsdWRlcyBsb2NhbC5jb25mIGFuZCBv
dGhlciByZWxhdGVkIGZpbGVzKS4gVGhlDQo+IHNpbXBsZXN0IHdheSB0byBkbyB0aGlzIGlzIHRv
IHBsYWNlIHRoZSBsb2dpYyBpbiBhIGJiY2xhc3MgYW5kIGFkZA0KPiB0aGlzIHRvIHRoZSBJTkhF
UklUIHZhcmlhYmxlIGluIHlvdXIgbGF5ZXIuY29uZi4gVGhlIGNsYXNzZXMgaW4NCj4gSU5IRVJJ
VCBhcmUgcGlja2VkIHVwIGFzIGlmIHRoZXkgd2VyZSBhdCB0aGUgc3RhcnQgb2YgZWFjaCByZWNp
cGUgdGhhdA0KPiBpcyBwYXJzZWQuDQo+IA0KDQpUaGFua3MgYSBsb3QsIEkgd2lsbCBnaXZlIHRo
aXMgYSBsb29rIGJ1dCBlbmZvcmNpbmcgUFJFRkVSUkVEX1ZFUlNJT04gaW4gYSBiYmNsYXNzIGRv
ZXMgbm90IHJlYWxseSBzZWVtIHRvIGJlIHNvbWV0aGluZyBzdGFuZGFyZC4NCg0KRG9lcyBzb21l
b25lIGtub3dzIG1ldGEtdmlydHVhbGl6YXRpb24gdHJpZXMgdG8gZW5mb3JjZSB2ZXJzaW9ucyBv
biBweXRob24gPyANCkl0IHNlZW1zIHRoYXQgbWV0YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5j
IGlzIGluIGZhY3QgbmV2ZXIgaW5jbHVkZWQgKGluIFpldXMgb3IgaW4gbWFzdGVyIGF0IGxlYXN0
KSBzbyBJIGFtIHdvbmRlcmluZyBpZiB0aGUgY29udGVudCBzaG91bGQgbm90IGJlIHJlbW92ZWQg
YWxsIHRvZ2V0aGVyID8NClRoZSBmaWxlIHdhcyBpbnRyb2R1Y2VkIGluIGNhc2UgYW4gb3RoZXIg
bGF5ZXIgaXMgcHJvdmlkaW5nIGEgZGlmZmVyZW50IHZlcnNpb24gb2Ygc29tZSBwYWNrYWdlcyB0
byBlbmZvcmNlIHRoZSBvbmVzIHByb3ZpZGVkIGJ5IG1ldGEtdmlydHVhbGl6YXRpb24gYnV0IGlu
IGZhY3QgaW4gbWFzdGVyIHRoZSBmaWxlIGlzIGVtcHR5Lg0KDQpBIHRoZSBlbmQgdGhlIGNvbXBs
ZXRlIHN5c3RlbSB3aXRoIGEgY2xhc3MgdG8gaW5jbHVkZSBtZXRhLXZpcnQtZGVmYXVsdC12ZXJz
aW9ucy5pbmMgaWYgdmlydHVhbGl6YXRpb24gaXMgaW4gRElTVFJPX0ZFQVRVUkVTIGNvdWxkIGJl
IHJlbW92ZWQuDQoNClRoYW5rcywNCkJlcnRyYW5kDQoNCg==

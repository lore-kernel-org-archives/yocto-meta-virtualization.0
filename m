Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10818.1593504839418082767
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 01:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6ZTirm4j;
 spf=fail (domain: arm.com, ip: 140.211.169.56, mailfrom: bertrand.marquis@arm.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBD00E01DBF; Tue, 30 Jun 2020 01:13:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,UNPARSEABLE_RELAY,
	URIBL_RED autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [40.107.2.45 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
	*  1.0 FORGED_SPF_HELO FORGED_SPF_HELO
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20045.outbound.protection.outlook.com [40.107.2.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5912E01DBD
	for <meta-virtualization@yoctoproject.org>; Tue, 30 Jun 2020 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGYztc/2EP5/OKBjyS0md4Q6a38QuE9DIsWkSXTierY=;
 b=6ZTirm4jfxHKKMBjm9yQUEx5182auMWlxsySTLbPGEHzVjAlZG2nZxoAvFcBoL6hMg1ynvwUS++FmT2TnE3E8XPjxPWgIVDy4FHN5y4Z4a0zYkKa0PNAebk4hkQhNKlhXFbWaHli9Q3zw3GdSCgNLEs8xsmlqe29a6eaE6xSztM=
Received: from DB6PR07CA0084.eurprd07.prod.outlook.com (2603:10a6:6:2b::22) by
 DB8PR08MB5260.eurprd08.prod.outlook.com (2603:10a6:10:e6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Tue, 30 Jun 2020 08:13:52 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::45) by DB6PR07CA0084.outlook.office365.com
 (2603:10a6:6:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.10 via Frontend
 Transport; Tue, 30 Jun 2020 08:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 08:13:52 +0000
Received: ("Tessian outbound 1e00bf306733:v60"); Tue, 30 Jun 2020 08:13:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3cd4b99ffcec376
X-CR-MTA-TID: 64aa7808
Received: from cd8c9ce93ea6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 568E6503-3244-4496-B111-B1E266828BA2.1;
	Tue, 30 Jun 2020 08:13:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd8c9ce93ea6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 30 Jun 2020 08:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwP5Vwcp9Ssp/8FeERvWCA205Rq4coLpZmjR2822qSH8G3SsgMBrmGx/2MTv8av2HlSLfCjJE6rTcCKrfrx0uCkuVNF5v1pGlj7YuSuAr1i9HvxBXDnX3K6XXKWxfNAfWGcab6lj8YY4efdRDw1He9cfG9/a1rEz0K8zSsIU2A5TZcCfvDYbFed0EEMfSh5C056caZLsEGYgfgnrPmvn8jepU+Qf6aer0682z4d0im4h2wCoNTKcUHyF3ihRKbs8l+N7oqQ7n0rleL5xKqmaUwCGQqJa3tsreltFJLPZbsNRU5gGkh7pnPZ/2vIyvaer3PG2lEMiByVpMbxTlREEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGYztc/2EP5/OKBjyS0md4Q6a38QuE9DIsWkSXTierY=;
 b=Bnt9dNJBGj95y6YuP32as4D4RTRYVwy3Jc7+pkEPrqccLPVPOvNcwqazWF8dZIY1sejV3W4lkzDqtDRJQDXz3SWQh9oejxWNbvLpRQY5FneJ23ckyDEtQiWj7kHPmMI9yFpkyi0QmcBHHEdM5DVqNjkNDCLXTYDEdYDlTHoefYmPybW3YT8LWQPgyTmENHM0ZRqpIK1dRVmMGnqJB12BhFcol5X+SazWjiF10kOaCL0FfvXPChi8NxLIHT8jG9qJImjqjp8NcZedibIvVtWqpkoQz9Y4ZJd8uV7RzCNgOZWb3vq0AQU8PFNHphqGuDtkNDO6E/yaqJ8sg9ei3oCUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGYztc/2EP5/OKBjyS0md4Q6a38QuE9DIsWkSXTierY=;
 b=6ZTirm4jfxHKKMBjm9yQUEx5182auMWlxsySTLbPGEHzVjAlZG2nZxoAvFcBoL6hMg1ynvwUS++FmT2TnE3E8XPjxPWgIVDy4FHN5y4Z4a0zYkKa0PNAebk4hkQhNKlhXFbWaHli9Q3zw3GdSCgNLEs8xsmlqe29a6eaE6xSztM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2568.eurprd08.prod.outlook.com (2603:10a6:4:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 08:13:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 08:13:45 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Corey Minyard
	<cminyard@mvista.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Topic: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Index: AQHWToGd8qCvStWRpU6rq5VgdcmZ3Kjwz7oA
Date: Tue, 30 Jun 2020 08:13:45 +0000
Message-ID: <EB4F91E7-AEB9-428E-9483-A43192462ED8@arm.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56c40bbd-2f57-44eb-2f2f-08d81ccd86cb
x-ms-traffictypediagnostic: DB6PR0802MB2568:|DB8PR08MB5260:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5260A05E9428BEC4DBACB9D79D6F0@DB8PR08MB5260.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AI4pEDclkjjEOejiE0nJkBE12ewQpuba8lgPZ14eReLUjHgfYIxeqjS2hSGajsHEeHqYENxiFWHEJL9jUa8glbyHu7zcp0pimaYuLI0a5qd7egTo5z3a/akVRCBPqDFoDW4rVOCvLSXdr8fNXAkszh1u1KxYOvwZOHNcffXk9cKbq8G5IShVL5s8I3p8NDalyuZNyxdraa1cZKyiX5oEVYDzxai+QRKu02IR21IWn/OMwmUJM1FUDIKWhjdTT7L88bG9O1mnOeqs9uh6LYYFuPKx2ii7+CGCuCkj8pVHXFOh4xxIfwqroYYUYdIULViYDbPp27zCklJEaG0b0kdeWy+LAC0gj4SECwpVj4Wzq6AWniQdNwkq3un1IQCAvMsL00En3j6IoDi9xUMDa+TPNA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(83380400001)(26005)(8676002)(8936002)(966005)(2616005)(6916009)(5660300002)(186003)(6512007)(91956017)(2906002)(478600001)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(71200400001)(53546011)(6506007)(33656002)(54906003)(316002)(4326008)(6486002)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 T6jstwZQOjU1s8CmCOsEo9gs73HrECv8ZZblpjmWAQD30ClenZkxFhXZk3n+JlP8MMgmP7xk3yQYiWAa65IKhqe5W7pAtXume58JiD7nsvdIqVsODUBicQriWisAP4ME42ayn3Tu3O/8l+ZPmacvYfzq3aUSino2huxDRjQl/WQWRqDUu22pKSro/hBCo9iuLQNcQth6zypMguw95qOzY4d5OBYMiymzLzG7KJG7Zlflt/PDLJABKYk51lkEzlV/WbfWH2udDHcQR0LX5r1wQXqjSDRcWFJw3v4maVHb8A6+7+J0DOwd5nDOkWf/v6XTlJUD0aCROMmjSZiehWi3QFn0cF2nusdukWIqf/QJiVO9J1Dqnne1Jp4OA/T1t7nmnG/50A1n0j3B01kNkAK7v1Ki0PBr+nvh0A6PlJdq6W2trNJnXVl5dTaeZHy2z4pVNCk/oibotY5HO8HaSBar3amSfAZlBxUlLXvXpC/AVQvnaRH//xj6l3O2FCpkHQUk
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2568
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(6512007)(356005)(70586007)(70206006)(6486002)(6862004)(4326008)(86362001)(2906002)(36756003)(478600001)(8676002)(8936002)(966005)(33656002)(81166007)(26005)(2616005)(5660300002)(82310400002)(316002)(82740400003)(54906003)(6506007)(47076004)(186003)(83380400001)(336012);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9b35079-f810-493a-0f7c-08d81ccd8252
X-Forefront-PRVS: 0450A714CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m0x/bNb1vd+tEG1lG6DYqaRnE4EcDCXp66zGZzAXIa7ognipR+cnuwXmSUdEUvctOn1n6lqpLwOzLL2Z6hNFpWPNCRnxwDZrMsDmAmWmW959WLZ1hrrTyDhfc7aGKI+TxjLU+CSEN5XVOes+MrU7jguvJIgMrzcvlMz81yJ0yEmBYvjFySsg3yyle0SU+eQP/IOs5UE0lhxFozvgyjp6n645D73k21VSaaws5q7KnFn4BlUU3wej2RcvyCO+XGQeyAS1L5gceqF1wyUSHzRei4XWJg7ymr4DfRQ2FGne/dtCR1cXJgRkmSFTwse7GtQbpIDfyraphPctXUzyD9GyGVw8OBfje/JRVEAWHw47lKwC7CIBs2UxS0OX3n8MwBgcMNnWSdO6saMKEALUWjxn8FZotYIpensNQMTxG2ZxPm2sdqeS9T/DPSSyhFSv3iruUqk9m/gcWZU1nqtnPr9oJAGWUeq0bZvQJXy5O/xRle0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 08:13:52.8141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c40bbd-2f57-44eb-2f2f-08d81ccd86cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5260
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB75192D26B41C40BCFEE1C19529E75E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SEkNCg0KPiBPbiAzMCBKdW4gMjAyMCwgYXQgMDI6NTQsIENocmlzdG9waGVyIENsYXJrIHZpYSBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxjaHJpc3RvcGhlci53LmNsYXJrPWdtYWlsLmNvbUBsaXN0
cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMg
c3VwcG9ydCBmb3IgcnVubmluZyBYZW4gb24gdGhlIFJhc3BiZXJyeSBQaSA0DQo+IGJvYXJkLCB3
aXRoIG1ldGEtdmlydHVhbGl6YXRpb24gYW5kIG1ldGEtcmFzcGJlcnJ5cGksIHVzaW5nIHRoZQ0K
PiBsaW51eC1yYXNwYmVycnlwaSBrZXJuZWwgYXQgdmVyc2lvbiA1LjQgd2hpY2ggaXMgdGhlIGN1
cnJlbnQNCj4gbGludXgteW9jdG8ga2VybmVsIHZlcnNpb24gc3VwcG9ydGVkIGluIHRoaXMgbGF5
ZXIuDQo+IA0KPiBJdCBpbnRyb2R1Y2VzIHVzZSBvZiBkeW5hbWljIGxheWVycyB0byBoYW5kbGUg
Y29uZmlndXJhdGlvbiB0aGF0IGlzDQo+IGJvdGggWGVuIGFuZCBSYXNwYmVycnkgUGkgc3BlY2lm
aWMsIGFuZCBpbmNsdXNpb24gb2YgWGVuLXNwZWNpZmljDQo+IGNvbmZpZ3VyYXRpb24gd2hlbiB0
aGUgJ3hlbicgRElTVFJPX0ZFQVRVUkUgaXMgZW5hYmxlZCB0byBzaW1wbGlmeQ0KPiBYZW4gaW1h
Z2UgYnVpbGRzLg0KPiANCj4gSXQgYXBwbGllcyBhIGJhY2twb3J0ZWQgc2V0IG9mIFhlbi1zcGVj
aWZpYyBMaW51eCBrZXJuZWwgcGF0Y2hlcywNCj4gZGV2ZWxvcGVkIGJ5IHVwc3RyZWFtIFhlbiBk
ZXZlbG9wZXJzIHdvcmtpbmcgd2l0aCB0aGUgTGludXggRm91bmRhdGlvbg0KPiBFdmUgUHJvamVj
dCwgdGhhdCBhcmUgY3VycmVudGx5IGJlaW5nIGl0ZXJhdGVkIG9uIGZvciBpbmNsdXNpb24gaW4g
dGhlDQo+IExpbnV4IGtlcm5lbC4NCj4gDQo+IFhlbiBpcyB1cHJldidkIHRvIHZlcnNpb24gNC4x
MzsgdGhpcyBpcyBjdXJyZW50bHkgY29tcGlsZS1hbmQtYm9vdC10ZXN0ZWQNCj4gb25seSBvbiB0
aGlzIFJQaTQgYm9hcmQuDQoNCg0KQ291bGQgeW91IGdpdmUgYSBzdW11cCBvZiB3aGF0IHdhcyBj
aGFuZ2VkIGluIHYyID8NClRoYXTigJlzIGEgYmlnIHNlcmllIGFuZCByZXZpZXdpbmcgaXQgd291
bGQgYmUgZWFzaWVyIHdpdGggc29tZSBpbmZvcyBvbiB3aGF0IGhhcyBiZWVuIGNoYW5nZWQuDQoN
ClRoYW5rcw0KQmVydHJhbmQNCg0KPiANCj4gQ2hyaXN0b3BoZXINCj4gDQo+IENocmlzdG9waGVy
IENsYXJrICgxMSk6DQo+ICB4ZW46IGFwcGx5IGxheWVyIHNldHRpbmdzIHdoZW4geGVuIERJU1RS
T19GRUFUVVJFIGlzIGVuYWJsZWQNCj4gIHhlbi10b29sczogYWRkIFJSRUNPTUVORFMgcWVtdSBv
biBBUk0gYW5kIHg4NiB3aGVuIEhWTSBpcyBlbmFibGVkDQo+ICB4ZW4tdG9vbHM6IHVzZSBub24t
YnVzeWJveCBpZnVwZG93biB0b29sIGlmIGF2YWlsYWJsZQ0KPiAgeGVuLCB4ZW4tdG9vbHM6IHVw
ZGF0ZSByZXZpc2lvbiB0byBYZW4gNC4xMw0KPiAgbWV0YS12aXJ0LXhlbi5pbmM6IGFkZCBSYXNw
YmVycnkgUGkgc2V0dGluZ3MNCj4gIHhlbiwgcmFzcGJlcnJ5IHBpOiBhZGQgZHluYW1pYy1sYXll
ciBmb3IgWGVuIGNvbmZpZ3VyYXRpb24gZm9yIFJwaTQNCj4gIHhlbiwgcmFzcGJlcnJ5IHBpIDQ6
IHByb3ZpZGUgYSBkZWZhdWx0IGRlZmNvbmZpZyBmb3IgcmFzcGJlcnJ5cGk0DQo+ICB4ZW4sIGxp
bnV4LXJhc3BiZXJyeXBpOiBhZGQgTGludXgga2VybmVsIDUuNCBwYXRjaGVzIGZvciBYZW4gc3Vw
cG9ydA0KPiAgeGVuLCByYXNwYmVycnkgcGk6IGFkZCBYZW4tc3BlY2lmaWMgU0QgY2FyZCBjbGFz
cw0KPiAgbGludXgtcmFzcGJlcnJ5cGk6IHByZWZlciBrZXJuZWwgdmVyc2lvbiA1LjQNCj4gIHhl
bjogYWRkIHBhdGNoIHRvIGZpeCBidWlsZCBvbiBBUk02NCB3aXRoIGdjYyAxMC4xLjANCj4gDQo+
IGNsYXNzZXMvbWV0YS12aXJ0LXhlbi1jZmcuYmJjbGFzcyAgICAgICAgICAgICB8ICAgNiArDQo+
IGNsYXNzZXMvc2RjYXJkX2ltYWdlLXJwaS14ZW4uYmJjbGFzcyAgICAgICAgICB8IDEyMCArKysr
DQo+IGNvbmYvZGlzdHJvL2luY2x1ZGUvbWV0YS12aXJ0LXhlbi5pbmMgICAgICAgICB8ICAxOSAr
DQo+IGNvbmYvbGF5ZXIuY29uZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxOSAr
LQ0KPiAuLi4vYm9vdGZpbGVzL3JwaS1jb25maWdfZ2l0LmJiYXBwZW5kICAgICAgICAgfCAgIDYg
Kw0KPiAuLi4vcnBpLXUtYm9vdC1zY3IvZmlsZXMvYm9vdC5jbWQueGVuLmluICAgICAgfCAgNDkg
KysNCj4gLi4uL3JwaS11LWJvb3Qtc2NyL3JwaS11LWJvb3Qtc2NyLmJiYXBwZW5kICAgIHwgIDE3
ICsNCj4gLi4uL3hlbi9maWxlcy9kZWZjb25maWdfcmFzcGJlcnJ5cGk0LTY0ICAgICAgIHwgMTE3
ICsrKysNCj4gLi4uL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmJhcHBlbmQgICAgIHwg
IDExICsNCj4gLi4udm1hbGxvY190b19wYWdlLW9uLXZtYWxsb2MtdmlydC1hZGRyLnBhdGNoIHwg
IDQ0ICsrDQo+IC4uLjAyLXN3aW90bGIteGVuLXJlbW92ZS1zdGFydF9kbWFfYWRkci5wYXRjaCB8
ICA0NyArKw0KPiAuLi5zdHJ1Y3QtZGV2aWNlLXBhcmFtZXRlci10by14ZW5fcGh5c18ucGF0Y2gg
fCAgNzggKysrDQo+IC4uLnN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLXhlbl9idXNfdC5wYXRj
aCB8ICA2NiArKysNCj4gLi4uc3RydWN0LWRldmljZS1wYXJhbWV0ZXItdG8taXNfeGVuX3N3LnBh
dGNoIHwgIDU3ICsrDQo+IC4uLm9kdWNlLXBoeXNfdG9fZG1hLWRtYV90b19waHlzLXRyYW5zbC5w
YXRjaCB8ICA4OCArKysNCj4gLi4udHJhbnNsYXRpb25zLWluLXhlbl9kbWFfc19rZXJuZWxfNS40
LnBhdGNoIHwgIDY4ICsrKw0KPiAuLi5fdG9fcGh5cy1vbi10aGUtZG1hX2FkZHJfdC1wYXJhbWV0
ZXIucGF0Y2ggfCAgNzUgKysrDQo+IC4uLi8wMDExLWFkZGluZy1wYWdlLWNvaGVyZW50LXBhdGNo
LnBhdGNoICAgICB8ICAzOSArKw0KPiAuLi4vbGludXgvbGludXgtcmFzcGJlcnJ5cGlfJS5iYmFw
cGVuZCAgICAgICAgfCAgIDUgKw0KPiAuLi4vbGludXgvbGludXgtcmFzcGJlcnJ5cGlfNS40LmJi
YXBwZW5kICAgICAgfCAgMTkgKw0KPiAuLi54ZW4tYnVpbGQtdGVtcG9yYXJpbHktaW5oaWJpdC1X
ZXJyb3IucGF0Y2ggfCAgMTggKy0NCj4gLi4ueGVuLWFybTY0LWltcGxlbWVudC1hdG9taWMtZmV0
Y2gtYWRkLnBhdGNoIHwgIDUwICsrDQo+IC4uLmctMC1hcnJheXMtdG8tYWNjZXNzLXBhY2tldC1j
b250ZW50cy5wYXRjaCB8ICA2MCArKw0KPiAuLi4vZmlsZXMveGVuLXRvb2xzLWxpYnhsLWdlbnR5
cGVzLXB5My5wYXRjaCAgfCAxNDAgLS0tLS0NCj4gLi4udG9vbHMtcHlncnViLWNoYW5nZS10YWJz
LWludG8tc3BhY2VzLnBhdGNoIHwgIDQwIC0tDQo+IC4uLi1weXRob24tc2NyaXB0cy13b3JrLXdp
dGgtMi42LWFuZC11cC5wYXRjaCB8IDUyOSAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gLi4uL3hlbi9m
aWxlcy94ZW4tdG9vbHMtcHlncnViLXB5My5wYXRjaCAgICAgIHwgMjMzIC0tLS0tLS0tDQo+IC4u
LmxzLXB5dGhvbi1maXgtV3NpZ24tY29tcGFyZS13YXJuaW5ncy5wYXRjaCB8IDEzNiAtLS0tLQ0K
PiAuLi5uLXRvb2xzLXVwZGF0ZS1weXRob24tc2NyaXB0cy10by1weTMucGF0Y2ggfCAxNDAgLS0t
LS0NCj4gcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzLmluYyAgICAgICAgICAgIHwgIDE2
ICsNCj4gcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzX2dpdC5iYiAgICAgICAgIHwgIDEz
ICstDQo+IHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmIgICAgICAgICAgICAgICB8ICAx
MSArLQ0KPiAzMiBmaWxlcyBjaGFuZ2VkLCAxMTAyIGluc2VydGlvbnMoKyksIDEyMzQgZGVsZXRp
b25zKC0pDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjbGFzc2VzL21ldGEtdmlydC14ZW4tY2ZnLmJi
Y2xhc3MNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGNsYXNzZXMvc2RjYXJkX2ltYWdlLXJwaS14ZW4u
YmJjbGFzcw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kaXN0cm8vaW5jbHVkZS9tZXRhLXZp
cnQteGVuLmluYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5
cGkvcmVjaXBlcy1ic3AvYm9vdGZpbGVzL3JwaS1jb25maWdfZ2l0LmJiYXBwZW5kDQo+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWJzcC9ycGkt
dS1ib290LXNjci9maWxlcy9ib290LmNtZC54ZW4uaW4NCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5
bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMtYnNwL3JwaS11LWJvb3Qtc2NyL3JwaS11
LWJvb3Qtc2NyLmJiYXBwZW5kDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9y
YXNwYmVycnlwaS9yZWNpcGVzLWV4dGVuZGVkL3hlbi9maWxlcy9kZWZjb25maWdfcmFzcGJlcnJ5
cGk0LTY0DQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9y
ZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fZ2l0LmJiYXBwZW5kDQo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8w
MDAxLXN3aW90bGIteGVuLXVzZS12bWFsbG9jX3RvX3BhZ2Utb24tdm1hbGxvYy12aXJ0LWFkZHIu
cGF0Y2gNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMDItc3dpb3RsYi14ZW4tcmVtb3ZlLXN0YXJ0X2Rt
YV9hZGRyLnBhdGNoDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVy
cnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDAzLXN3aW90bGIteGVuLWFkZC1zdHJ1
Y3QtZGV2aWNlLXBhcmFtZXRlci10by14ZW5fcGh5c18ucGF0Y2gNCj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4L2ZpbGVz
LzAwMDQtc3dpb3RsYi14ZW4tYWRkLXN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLXhlbl9idXNf
dC5wYXRjaA0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkv
cmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAwNy1zd2lvdGxiLXhlbi1hZGQtc3RydWN0LWRl
dmljZS1wYXJhbWV0ZXItdG8taXNfeGVuX3N3LnBhdGNoDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBk
eW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDA4
LXN3aW90bGIteGVuLWludHJvZHVjZS1waHlzX3RvX2RtYS1kbWFfdG9fcGh5cy10cmFuc2wucGF0
Y2gNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lw
ZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMDkteGVuLWFybS1pbnRyb2R1Y2UtcGh5cy1kbWEtdHJh
bnNsYXRpb25zLWluLXhlbl9kbWFfc19rZXJuZWxfNS40LnBhdGNoDQo+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxl
cy8wMDEwLXhlbi1hcm0tY2FsbC1kbWFfdG9fcGh5cy1vbi10aGUtZG1hX2FkZHJfdC1wYXJhbWV0
ZXIucGF0Y2gNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBp
L3JlY2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMTEtYWRkaW5nLXBhZ2UtY29oZXJlbnQtcGF0
Y2gucGF0Y2gNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBp
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXJhc3BiZXJyeXBpXyUuYmJhcHBlbmQNCj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVs
L2xpbnV4L2xpbnV4LXJhc3BiZXJyeXBpXzUuNC5iYmFwcGVuZA0KPiBjcmVhdGUgbW9kZSAxMDA2
NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLWFybTY0LWltcGxlbWVudC1hdG9taWMt
ZmV0Y2gtYWRkLnBhdGNoDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4dGVuZGVkL3hl
bi9maWxlcy94ZW4tdG9vbHMta2RkLXN0b3AtdXNpbmctMC1hcnJheXMtdG8tYWNjZXNzLXBhY2tl
dC1jb250ZW50cy5wYXRjaA0KPiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94
ZW4vZmlsZXMveGVuLXRvb2xzLWxpYnhsLWdlbnR5cGVzLXB5My5wYXRjaA0KPiBkZWxldGUgbW9k
ZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xzLXB5Z3J1Yi1jaGFu
Z2UtdGFicy1pbnRvLXNwYWNlcy5wYXRjaA0KPiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1l
eHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xzLXB5Z3J1Yi1tYWtlLXB5dGhvbi1zY3JpcHRzLXdv
cmstd2l0aC0yLjYtYW5kLXVwLnBhdGNoDQo+IGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4
dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMtcHlncnViLXB5My5wYXRjaA0KPiBkZWxldGUgbW9k
ZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xzLXB5dGhvbi1maXgt
V3NpZ24tY29tcGFyZS13YXJuaW5ncy5wYXRjaA0KPiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBl
cy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xzLXVwZGF0ZS1weXRob24tc2NyaXB0cy10by1w
eTMucGF0Y2gNCj4gDQo+IC0tIA0KPiAyLjE3LjENCj4gDQo+IA0KDQo=

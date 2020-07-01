Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.20837.1593608312819108676
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 05:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=SIBbbSKy;
 spf=fail (domain: arm.com, ip: 140.211.169.56, mailfrom: bertrand.marquis@arm.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE734E01DC8; Wed,  1 Jul 2020 05:58:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [40.107.6.61 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
	*  1.0 FORGED_SPF_HELO FORGED_SPF_HELO
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75C76E01D86
	for <meta-virtualization@yoctoproject.org>; Wed,  1 Jul 2020 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECKnZCrWD6AYA0l0MD7+vrfTs2ZhMGyVkdVVjocR1sc=;
 b=SIBbbSKyFMw9YHhctpVnq8rS7rvbTmbfnCRZzmKD9ltDkTlsUcaFSW+LZ3NviCQBC/vwyW+rcoJ6W5Xfrmx31/F/U5paBGbLcZEq2y2J7y9BuuEgDAui3OTSLVBq0LErDr4/H6byD39V2+k3f/mxFo+4IWj+O0drAZtQ8OfTQe8=
Received: from AM6PR0502CA0069.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::46) by VE1PR08MB5117.eurprd08.prod.outlook.com
 (2603:10a6:803:109::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Wed, 1 Jul
 2020 12:58:27 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::8) by AM6PR0502CA0069.outlook.office365.com
 (2603:10a6:20b:56::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Wed, 1 Jul 2020 12:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 12:58:27 +0000
Received: ("Tessian outbound b8ad5ab47c8c:v62"); Wed, 01 Jul 2020 12:58:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70533abfa7d95103
X-CR-MTA-TID: 64aa7808
Received: from e29f9be5acc8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 705F777A-4FDB-4C0B-95CE-8BC541438938.1;
	Wed, 01 Jul 2020 12:58:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e29f9be5acc8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 12:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONT/gWa3a/ryDKP9ZxcTtf0SXsE8i1JUjiBEgNf7Td36B5pqSnIa+nBdUNEpvV9Ygpw4NeY+H1KU0GxN3UR3QO8Lmktme/d0F3X40FhDbOAa0udAJkgtRImu9ujHCqlbW3n/kNMbaP87a/rnM+zE5QLrm3XpA2TGsw6YyrZwn2Jqt/WmzOgxhP2xwnsSBkjYoql5/jKmKq3q8FRwSZjJvGckoglHgkJ9i9+/PzaVyC4GYy0WhF5BfYE5xZ2eace9jtZiV9CdsrHF3Mvl89R6FavJYmUzFLO7J2LGPudSEMdaf4sRC8kqugeEZqs5oNvgB4F+M6aflIOgN/ffPU5VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECKnZCrWD6AYA0l0MD7+vrfTs2ZhMGyVkdVVjocR1sc=;
 b=h0JxyCaxRSrl9iJzoFRYusgMpWSx90wYVqmNh2pl2a01jk2GP1e1WBojnq/pvjuQE1CdJlwnNObhqZhyPw/Kpwbr6sfI0l+IRbajCOcUjoyWNJ8ae4rBTVNOzZOVkBgF9x10ypfeNdzuBq3+vqrXqAY0mUB/mdZEsshfWM6CH6Or81Edf13zrZ3UkkaBD19ckezKQsnCQzhO1qyyex80dhZyPlWgCxfj8WugIz10+DW02/G9yxR2ZWyZUSLjXUwDBoZG7LDOOIBzi/rCKyRidN0pLR6ndLHB73Mb820r+vRaCiptxfuYhJWEViw+ded7f6ehiQH7mSvtt9zRJMLGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECKnZCrWD6AYA0l0MD7+vrfTs2ZhMGyVkdVVjocR1sc=;
 b=SIBbbSKyFMw9YHhctpVnq8rS7rvbTmbfnCRZzmKD9ltDkTlsUcaFSW+LZ3NviCQBC/vwyW+rcoJ6W5Xfrmx31/F/U5paBGbLcZEq2y2J7y9BuuEgDAui3OTSLVBq0LErDr4/H6byD39V2+k3f/mxFo+4IWj+O0drAZtQ8OfTQe8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4711.eurprd08.prod.outlook.com (2603:10a6:10:d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 12:58:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3131.033; Wed, 1 Jul 2020
 12:58:20 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	Corey Minyard <cminyard@mvista.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Topic: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Index: AQHWToGd8qCvStWRpU6rq5VgdcmZ3Kjwz7oAgAFqy4CAAEZpgIAAL1AAgAABVIA=
Date: Wed, 1 Jul 2020 12:58:20 +0000
Message-ID: <B01C8464-ECBF-442C-A266-573D2FD09FBC@arm.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>
 <EB4F91E7-AEB9-428E-9483-A43192462ED8@arm.com>
 <CACMJ4GYg8yGgbDUgx5arnxuMqEbO2VvzE-sD_a9o6bf2H0LNDg@mail.gmail.com>
 <24C8EAE3-DF44-43D4-88EE-19472B3B0F84@arm.com>
 <CADkTA4P0C-UpMB6vT=dMwTamB7qb6Q6YP-JJNAOy0Ev_DhGxrg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P0C-UpMB6vT=dMwTamB7qb6Q6YP-JJNAOy0Ev_DhGxrg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d267078e-fafe-4115-6aa1-08d81dbe7273
x-ms-traffictypediagnostic: DBBPR08MB4711:|VE1PR08MB5117:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5117781B2306674E5E4BFEF89D6C0@VE1PR08MB5117.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4q9zi4f3BOjSd7mUWKfratxZ1BBjcKrblLBLiZhW/87/oRQ0WD4Vo4ZnxAnlFmRnM9wLI+5n38pATOXDgKshNMe947WBFm8zLLRDuCsXDSTIphZYKzml+iWxXs8tyu31Ze9CrThWyC5hL1siVw7qIVSPfPAKf2SPY5DsWs571FLPo8msLXtAnkFT+cbM8bb9ms8jJ7W8T1u4uoUxmosltuxrsDsH/cJkhXDfNUG6IfUhgeYzsOnNGGrRqpX3pvWIMJF+dJNY5odV3ehbvgrezvkHSGwYAEQdw0RoCAHIL8b9GxG3h2EBXsY5QP5zUdf/a0IQzIBSy0RiHyg2GCIGON9f6DLi3iSBUOse05S3vXnp1tFVIGci5VfzwTXxMJbXknNOs4LwxorKbCLhQQLLDg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(478600001)(966005)(5660300002)(8936002)(4326008)(54906003)(6486002)(6512007)(186003)(66446008)(66556008)(64756008)(66476007)(2906002)(66946007)(76116006)(71200400001)(91956017)(26005)(6916009)(6506007)(53546011)(36756003)(86362001)(8676002)(83380400001)(316002)(33656002)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 k4aFKyIiI57GEjotj+5fUbTVtCSSmcwanyauKeiXmQCt35dwhDUdGE2WgRe6dLeKwGX/CzIJzQ0WJgfOEyexDXVaXqj+aP8l+ebxzPD6F6fcL+FdN9VWFQ3ohTUuFlB9uT/+UN262F8LuT9m6LkJL/DWeTN60kRTrXR5VototzyOjiCev9KJ5mqcoeBTquq1/4pWn1DNKDMorLjboba7Ogp/zqqxcJHLwIcyXMoArPKT3+L3Po4h/99lWjRQ4OYRBAvCSk3472QM1gD6wYwPFFaImBsLYA86MC6U5bmiCGzQwq27xYfEJJWD8ZeEAmVSS72Fb6ZqWTIwQgwFQnmB+5+eXIIUGniWywlbiA0fSQoDtL6IEwAcee5WrhjOgCZiw3kTdmeoNZIdXQe/Q8ESMFDmhymz9WsdA9HxHL5GfU7Hb6qoMHLipw4i3LegrWFgdD6ppwoRnyZqGVDSZ25khEDLbBTIuRtISLqAi0AU7A0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4711
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(36906005)(316002)(6862004)(4326008)(2906002)(5660300002)(8676002)(6506007)(82310400002)(83380400001)(478600001)(966005)(86362001)(336012)(2616005)(70586007)(82740400003)(356005)(8936002)(47076004)(53546011)(6486002)(26005)(70206006)(36756003)(81166007)(33656002)(186003)(6512007)(54906003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b015f05c-7272-4b20-9dbe-08d81dbe6e46
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yc4JRLYL++NsXd8RkUO5kehTL4Z71dBWR67J2h4QlYOLxLXWAPa8EQ36EK91t3aaQ0Q7d/3/TLpjRN143IwC2vkgdDaVYod7ABNnDJLIxTgBlaI9IrKSZX8Kkr6kEr7//xFR1SFB0ZggSoJDV9BtJz0sXldVRlB1N6EunZrRbUXi8zrk8+qHcmk9Li65WVN/4NCgPrx3zZNbEVX46Vq8P7wot2v4lc6WK+SYsQzw9pVSpKfnTW4pOFdEQw3ElUl5Qmah5ccZTtJS7zhJYksF4wO99Y5cNAuDdVOUU/KPNxVGtap131YODZooP6ZXSnlFeYehd8QHdOXv+jamf7Ge6TdcBXDl3cWId2X8StAm4ZMYqJ0Hqe4CSFBXZIhMoZotmrBugM3i8jrQGUo3ARQbaw0A6sACK5/ydRjndF44uqSW4lr9hwtaOApwcqJHgyk0c/YuA/ejDu+NLGDhVDcNaLRCJNQKX7aYMzKC6BuyyL4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 12:58:27.3334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d267078e-fafe-4115-6aa1-08d81dbe7273
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5117
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D58EE4D6B65C044A20B29CA6EF7A8FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gMSBKdWwgMjAyMCwgYXQgMTM6NTMsIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hm
aWVsZEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKdWwgMSwgMjAyMCBhdCA2OjA0
IEFNIEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6
DQo+PiANCj4+IEhpIENocmlzdG9waGVyLA0KPj4gDQo+Pj4gT24gMSBKdWwgMjAyMCwgYXQgMDY6
NTIsIENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMToxMyBBTSBCZXJ0cmFuZCBN
YXJxdWlzDQo+Pj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+
PiBISQ0KPj4+PiANCj4+Pj4+IE9uIDMwIEp1biAyMDIwLCBhdCAwMjo1NCwgQ2hyaXN0b3BoZXIg
Q2xhcmsgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPGNocmlzdG9waGVyLncuY2xhcms9Z21h
aWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBUaGlz
IHNlcmllcyBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHJ1bm5pbmcgWGVuIG9uIHRoZSBSYXNwYmVy
cnkgUGkgNA0KPj4+Pj4gYm9hcmQsIHdpdGggbWV0YS12aXJ0dWFsaXphdGlvbiBhbmQgbWV0YS1y
YXNwYmVycnlwaSwgdXNpbmcgdGhlDQo+Pj4+PiBsaW51eC1yYXNwYmVycnlwaSBrZXJuZWwgYXQg
dmVyc2lvbiA1LjQgd2hpY2ggaXMgdGhlIGN1cnJlbnQNCj4+Pj4+IGxpbnV4LXlvY3RvIGtlcm5l
bCB2ZXJzaW9uIHN1cHBvcnRlZCBpbiB0aGlzIGxheWVyLg0KPj4+Pj4gDQo+Pj4+PiBJdCBpbnRy
b2R1Y2VzIHVzZSBvZiBkeW5hbWljIGxheWVycyB0byBoYW5kbGUgY29uZmlndXJhdGlvbiB0aGF0
IGlzDQo+Pj4+PiBib3RoIFhlbiBhbmQgUmFzcGJlcnJ5IFBpIHNwZWNpZmljLCBhbmQgaW5jbHVz
aW9uIG9mIFhlbi1zcGVjaWZpYw0KPj4+Pj4gY29uZmlndXJhdGlvbiB3aGVuIHRoZSAneGVuJyBE
SVNUUk9fRkVBVFVSRSBpcyBlbmFibGVkIHRvIHNpbXBsaWZ5DQo+Pj4+PiBYZW4gaW1hZ2UgYnVp
bGRzLg0KPj4+Pj4gDQo+Pj4+PiBJdCBhcHBsaWVzIGEgYmFja3BvcnRlZCBzZXQgb2YgWGVuLXNw
ZWNpZmljIExpbnV4IGtlcm5lbCBwYXRjaGVzLA0KPj4+Pj4gZGV2ZWxvcGVkIGJ5IHVwc3RyZWFt
IFhlbiBkZXZlbG9wZXJzIHdvcmtpbmcgd2l0aCB0aGUgTGludXggRm91bmRhdGlvbg0KPj4+Pj4g
RXZlIFByb2plY3QsIHRoYXQgYXJlIGN1cnJlbnRseSBiZWluZyBpdGVyYXRlZCBvbiBmb3IgaW5j
bHVzaW9uIGluIHRoZQ0KPj4+Pj4gTGludXgga2VybmVsLg0KPj4+Pj4gDQo+Pj4+PiBYZW4gaXMg
dXByZXYnZCB0byB2ZXJzaW9uIDQuMTM7IHRoaXMgaXMgY3VycmVudGx5IGNvbXBpbGUtYW5kLWJv
b3QtdGVzdGVkDQo+Pj4+PiBvbmx5IG9uIHRoaXMgUlBpNCBib2FyZC4NCj4+Pj4gDQo+Pj4+IA0K
Pj4+PiBDb3VsZCB5b3UgZ2l2ZSBhIHN1bXVwIG9mIHdoYXQgd2FzIGNoYW5nZWQgaW4gdjIgPw0K
Pj4+PiBUaGF04oCZcyBhIGJpZyBzZXJpZSBhbmQgcmV2aWV3aW5nIGl0IHdvdWxkIGJlIGVhc2ll
ciB3aXRoIHNvbWUgaW5mb3Mgb24gd2hhdCBoYXMgYmVlbiBjaGFuZ2VkLg0KPj4+IA0KPj4+IEhp
IEJlcnRyYW5kLA0KPj4+IA0KPj4+IFRoYW5rcyBmb3IgeW91ciBpbnRlcmVzdC4gSSB0aGluayB5
b3VyIHJlcGx5IGp1c3QgY2xpcHBlZCB0aGUgc3RhcnQgb2YNCj4+PiBteSBtZXNzYWdlIHRoYXQg
Y29udGFpbmVkIHRoZSBzdW1tYXJ5IG9mIHRoZSBjaGFuZ2VzIGluIHYyPyBUaGUgdGV4dA0KPj4+
IHdhczoNCj4+PiANCj4+PiBDaGFuZ2VzIHNpbmNlIHYxOg0KPj4+IC0gcmViYXNlZCBvbiB0byBj
dXJyZW50IG1ldGEtdmlydHVhbGl6YXRpb24sIG1ldGEtb3BlbmVtYmVkZGVkLCBwb2t5DQo+Pj4g
LSB1cGRhdGVkIFhlbiByZXZpc2lvbiB0byB0aGUgdGlwIG9mIHN0YWJsZSA0LjEzDQo+Pj4gLSBm
aXhlZCBYZW4gYnVpbGQgb24gQVJNNjQgd2l0aCBnY2MgMTAuMS4wDQo+Pj4gLSBhZGRlZCB1cHN0
cmVhbSBkZWJ1Z2dlciBwYXRjaCB0byBmaXggY29tcGlsZXIgd2FybmluZw0KPj4+IA0KPj4+IGll
LiBUaGUgbW9zdCBub3RhYmxlIGNoYW5nZSBpcyB0aGF0IHRoaXMgc2VyaWVzIGFwcGxpZXMgYW5k
IGJ1aWxkIHRvDQo+Pj4gY29tcGxldGlvbiB3aXRoIG11Y2ggbW9yZSB1cCB0byBkYXRlIHBva3kg
YW5kIG1ldGEtb3BlbmVtYmVkZGVkIHJlcG9zLg0KPj4+IFRoZSBsYXN0IHBhdGNoIGluIHRoZSBz
ZXJpZXMgaXMgbmVjZXNzYXJ5IHRvIGVuYWJsZSB0aGF0OiBpdCBhZGRzIGENCj4+PiBuZXcgaW1w
bGVtZW50YXRpb24gb2YgYW4gYXRvbWljIHByaW1pdGl2ZSB0byBYZW4gZm9yIHRoZSBzcGlubG9j
aw0KPj4+IGltcGxlbWVudGF0aW9uIG9uIEFSTTY0LCByZXBsYWNpbmcgdXNlIG9mIGEgYnVpbHRp
biB3aGljaCB0aGUgbmV3ZXINCj4+PiBjb21waWxlciBkb2VzIG5vdCBtYWtlIGF2YWlsYWJsZSBm
b3IgdGhlIGN1cnJlbnQgWGVuIGJ1aWxkLCBwb3NzaWJseQ0KPj4+IHNpbmNlIC1mbm8tYnVpbHRp
biBpcyBwcmVzZW50ZWQgYXMgYSBjb21waWxlciBvcHRpb24uDQo+Pj4gSSd2ZSBhbHNvIHB1bGxl
ZCB0aGUgWGVuIHJldmlzaW9uIGNsb3NlciB0byB0aGUgdGlwIG9mIHN0YWJsZSA0LjEzDQo+Pj4g
YnJhbmNoIGFuZCBhcHBsaWVkIGhhbmRsaW5nIGZvciB3YXJuaW5ncyB0aGF0IHRoZSBuZXcgZ2Nj
IHZlcnNpb24NCj4+PiByZXBvcnRzLg0KPj4+IA0KPj4gDQo+PiBUaGFua3MsIHRoaXMgaXMgYSB2
ZXJ5IGludGVyZXN0aW5nIHNlcmllIHdoaWNoIGNvdWxkIGRlZmluZSBob3cgYm9hcmRzIHNwZWNp
ZmljIHN1cHBvcnQgY291bGQgYmUgaGFuZGxlZC4NCj4+IA0KPj4gSSBhbSBub3QgcXVpdGUgc3Vy
ZSBpZiB0aGUgZHluYW1pYyBsYXllciBzaG91bGQgYmUgaW4gbWV0YS12aXJ0dWFsaXphdGlvbiBh
bmQgYWN0aXZhdGUgaWYgbWV0YS1ycGk0IGlzIHRoZXJlIG9yIGluIG1ldGEtcnBpNCBhY3RpdmF0
ZWQgaWYgbWV0YS12aXJ0dWFsaXphdGlvbiBpcyB0aGVyZS4NCj4+IA0KPj4gQEJydWNlOiBEbyB5
b3UgdGhpbmsgaXQgaXMgb2sgdG8gc3RhcnQgZGVmaW5pbmcgZHluYW1pYyBsYXllcnMgdGhpcyB3
YXkgaW4gbWV0YS12aXJ0dWFsaXphdGlvbiA/DQo+IA0KPiBZZXMsIHRoaXMgaXMgdGhlIHdheSB3
ZSBkZWNpZGVkIHRvIGRvIGl0IGluIHByZXZpb3VzIGRpc2N1c3Npb25zLg0KPiANCj4gV2UnZCAo
Zm9yIG5vdykgcmF0aGVyIGhhdmUgdGhlIGZ1bGwgc3RhY2sgaW4gb25lIHBsYWNlLCB2ZXJzdXMg
aGF2aW5nDQo+IGl0IHNwcmVhZCBhY3Jvc3MgbXVsdGlwbGUgcmVwb3MuICBUaGUgdGVzdCBtYXRy
aXggc3RhcnRzIHRvIGdldCB2ZXJ5DQo+IGRpZmZpY3VsdCBpZiB3ZSBoYXZlIHRoaW5ncyBzcHJl
YWQgYWJvdXQsIGFuZCB3aXRoIHRoaXMgb3V0IHN0YXRlbWVudA0KPiBvZiB3aGF0IGhhcyBiZWVu
IHRlc3RlZCBpcyB2ZXJ5IGNsZWFyLg0KDQpvayBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhh
dCB3YXMgY2xlYXIuDQoNCj4gDQo+IEknbGwgYmUgdGVzdGluZyBpdCBhbmQgc28gd2lsbCBDaHJp
c3RvcGhlci4NCj4gDQo+IElmIHRoZSBtb2RlbCBicmVha3MsIHdlJ2xsIG9mIGNvdXJzZSByZXZp
c2l0IGl0IGFuZCBhZGp1c3QgYXMgbmVjZXNzYXJ5IDpEDQoNClRoYXQgd29ya3MgZm9yIG1lIDot
KQ0KDQpCZXJ0cmFuZA0KDQo+IA0KPiBCcnVjZQ0KPiANCj4+IA0KPj4gSSB3b3VsZCBzZWUgYSBy
aXNrIG9mIHRoZW0gbm90IGJlaW5nIG1haW50YWluZWQgb3IgdGVzdGVkLg0KPj4gDQo+PiBCZXJ0
cmFuZA0KPj4gDQo+PiANCj4+PiBDaHJpc3RvcGhlcg0KPj4+IA0KPj4+PiANCj4+Pj4gVGhhbmtz
DQo+Pj4+IEJlcnRyYW5kDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBDaHJpc3RvcGhlcg0KPj4+Pj4g
DQo+Pj4+PiBDaHJpc3RvcGhlciBDbGFyayAoMTEpOg0KPj4+Pj4geGVuOiBhcHBseSBsYXllciBz
ZXR0aW5ncyB3aGVuIHhlbiBESVNUUk9fRkVBVFVSRSBpcyBlbmFibGVkDQo+Pj4+PiB4ZW4tdG9v
bHM6IGFkZCBSUkVDT01FTkRTIHFlbXUgb24gQVJNIGFuZCB4ODYgd2hlbiBIVk0gaXMgZW5hYmxl
ZA0KPj4+Pj4geGVuLXRvb2xzOiB1c2Ugbm9uLWJ1c3lib3ggaWZ1cGRvd24gdG9vbCBpZiBhdmFp
bGFibGUNCj4+Pj4+IHhlbiwgeGVuLXRvb2xzOiB1cGRhdGUgcmV2aXNpb24gdG8gWGVuIDQuMTMN
Cj4+Pj4+IG1ldGEtdmlydC14ZW4uaW5jOiBhZGQgUmFzcGJlcnJ5IFBpIHNldHRpbmdzDQo+Pj4+
PiB4ZW4sIHJhc3BiZXJyeSBwaTogYWRkIGR5bmFtaWMtbGF5ZXIgZm9yIFhlbiBjb25maWd1cmF0
aW9uIGZvciBScGk0DQo+Pj4+PiB4ZW4sIHJhc3BiZXJyeSBwaSA0OiBwcm92aWRlIGEgZGVmYXVs
dCBkZWZjb25maWcgZm9yIHJhc3BiZXJyeXBpNA0KPj4+Pj4geGVuLCBsaW51eC1yYXNwYmVycnlw
aTogYWRkIExpbnV4IGtlcm5lbCA1LjQgcGF0Y2hlcyBmb3IgWGVuIHN1cHBvcnQNCj4+Pj4+IHhl
biwgcmFzcGJlcnJ5IHBpOiBhZGQgWGVuLXNwZWNpZmljIFNEIGNhcmQgY2xhc3MNCj4+Pj4+IGxp
bnV4LXJhc3BiZXJyeXBpOiBwcmVmZXIga2VybmVsIHZlcnNpb24gNS40DQo+Pj4+PiB4ZW46IGFk
ZCBwYXRjaCB0byBmaXggYnVpbGQgb24gQVJNNjQgd2l0aCBnY2MgMTAuMS4wDQo+Pj4+PiANCj4+
Pj4+IGNsYXNzZXMvbWV0YS12aXJ0LXhlbi1jZmcuYmJjbGFzcyAgICAgICAgICAgICB8ICAgNiAr
DQo+Pj4+PiBjbGFzc2VzL3NkY2FyZF9pbWFnZS1ycGkteGVuLmJiY2xhc3MgICAgICAgICAgfCAx
MjAgKysrKw0KPj4+Pj4gY29uZi9kaXN0cm8vaW5jbHVkZS9tZXRhLXZpcnQteGVuLmluYyAgICAg
ICAgIHwgIDE5ICsNCj4+Pj4+IGNvbmYvbGF5ZXIuY29uZiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxOSArLQ0KPj4+Pj4gLi4uL2Jvb3RmaWxlcy9ycGktY29uZmlnX2dpdC5iYmFw
cGVuZCAgICAgICAgIHwgICA2ICsNCj4+Pj4+IC4uLi9ycGktdS1ib290LXNjci9maWxlcy9ib290
LmNtZC54ZW4uaW4gICAgICB8ICA0OSArKw0KPj4+Pj4gLi4uL3JwaS11LWJvb3Qtc2NyL3JwaS11
LWJvb3Qtc2NyLmJiYXBwZW5kICAgIHwgIDE3ICsNCj4+Pj4+IC4uLi94ZW4vZmlsZXMvZGVmY29u
ZmlnX3Jhc3BiZXJyeXBpNC02NCAgICAgICB8IDExNyArKysrDQo+Pj4+PiAuLi4vcmVjaXBlcy1l
eHRlbmRlZC94ZW4veGVuX2dpdC5iYmFwcGVuZCAgICAgfCAgMTEgKw0KPj4+Pj4gLi4udm1hbGxv
Y190b19wYWdlLW9uLXZtYWxsb2MtdmlydC1hZGRyLnBhdGNoIHwgIDQ0ICsrDQo+Pj4+PiAuLi4w
Mi1zd2lvdGxiLXhlbi1yZW1vdmUtc3RhcnRfZG1hX2FkZHIucGF0Y2ggfCAgNDcgKysNCj4+Pj4+
IC4uLnN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLXhlbl9waHlzXy5wYXRjaCB8ICA3OCArKysN
Cj4+Pj4+IC4uLnN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLXhlbl9idXNfdC5wYXRjaCB8ICA2
NiArKysNCj4+Pj4+IC4uLnN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLWlzX3hlbl9zdy5wYXRj
aCB8ICA1NyArKw0KPj4+Pj4gLi4ub2R1Y2UtcGh5c190b19kbWEtZG1hX3RvX3BoeXMtdHJhbnNs
LnBhdGNoIHwgIDg4ICsrKw0KPj4+Pj4gLi4udHJhbnNsYXRpb25zLWluLXhlbl9kbWFfc19rZXJu
ZWxfNS40LnBhdGNoIHwgIDY4ICsrKw0KPj4+Pj4gLi4uX3RvX3BoeXMtb24tdGhlLWRtYV9hZGRy
X3QtcGFyYW1ldGVyLnBhdGNoIHwgIDc1ICsrKw0KPj4+Pj4gLi4uLzAwMTEtYWRkaW5nLXBhZ2Ut
Y29oZXJlbnQtcGF0Y2gucGF0Y2ggICAgIHwgIDM5ICsrDQo+Pj4+PiAuLi4vbGludXgvbGludXgt
cmFzcGJlcnJ5cGlfJS5iYmFwcGVuZCAgICAgICAgfCAgIDUgKw0KPj4+Pj4gLi4uL2xpbnV4L2xp
bnV4LXJhc3BiZXJyeXBpXzUuNC5iYmFwcGVuZCAgICAgIHwgIDE5ICsNCj4+Pj4+IC4uLnhlbi1i
dWlsZC10ZW1wb3JhcmlseS1pbmhpYml0LVdlcnJvci5wYXRjaCB8ICAxOCArLQ0KPj4+Pj4gLi4u
eGVuLWFybTY0LWltcGxlbWVudC1hdG9taWMtZmV0Y2gtYWRkLnBhdGNoIHwgIDUwICsrDQo+Pj4+
PiAuLi5nLTAtYXJyYXlzLXRvLWFjY2Vzcy1wYWNrZXQtY29udGVudHMucGF0Y2ggfCAgNjAgKysN
Cj4+Pj4+IC4uLi9maWxlcy94ZW4tdG9vbHMtbGlieGwtZ2VudHlwZXMtcHkzLnBhdGNoICB8IDE0
MCAtLS0tLQ0KPj4+Pj4gLi4udG9vbHMtcHlncnViLWNoYW5nZS10YWJzLWludG8tc3BhY2VzLnBh
dGNoIHwgIDQwIC0tDQo+Pj4+PiAuLi4tcHl0aG9uLXNjcmlwdHMtd29yay13aXRoLTIuNi1hbmQt
dXAucGF0Y2ggfCA1MjkgLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+PiAuLi4veGVuL2ZpbGVzL3hl
bi10b29scy1weWdydWItcHkzLnBhdGNoICAgICAgfCAyMzMgLS0tLS0tLS0NCj4+Pj4+IC4uLmxz
LXB5dGhvbi1maXgtV3NpZ24tY29tcGFyZS13YXJuaW5ncy5wYXRjaCB8IDEzNiAtLS0tLQ0KPj4+
Pj4gLi4ubi10b29scy11cGRhdGUtcHl0aG9uLXNjcmlwdHMtdG8tcHkzLnBhdGNoIHwgMTQwIC0t
LS0tDQo+Pj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHMuaW5jICAgICAgICAgICAg
fCAgMTYgKw0KPj4+Pj4gcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzX2dpdC5iYiAgICAg
ICAgIHwgIDEzICstDQo+Pj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fZ2l0LmJiICAgICAg
ICAgICAgICAgfCAgMTEgKy0NCj4+Pj4+IDMyIGZpbGVzIGNoYW5nZWQsIDExMDIgaW5zZXJ0aW9u
cygrKSwgMTIzNCBkZWxldGlvbnMoLSkNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjbGFzc2Vz
L21ldGEtdmlydC14ZW4tY2ZnLmJiY2xhc3MNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjbGFz
c2VzL3NkY2FyZF9pbWFnZS1ycGkteGVuLmJiY2xhc3MNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBjb25mL2Rpc3Ryby9pbmNsdWRlL21ldGEtdmlydC14ZW4uaW5jDQo+Pj4+PiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1ic3AvYm9vdGZpbGVz
L3JwaS1jb25maWdfZ2l0LmJiYXBwZW5kDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1p
Yy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1ic3AvcnBpLXUtYm9vdC1zY3IvZmlsZXMvYm9v
dC5jbWQueGVuLmluDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFz
cGJlcnJ5cGkvcmVjaXBlcy1ic3AvcnBpLXUtYm9vdC1zY3IvcnBpLXUtYm9vdC1zY3IuYmJhcHBl
bmQNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9y
ZWNpcGVzLWV4dGVuZGVkL3hlbi9maWxlcy9kZWZjb25maWdfcmFzcGJlcnJ5cGk0LTY0DQo+Pj4+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1l
eHRlbmRlZC94ZW4veGVuX2dpdC5iYmFwcGVuZA0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5
bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMDEt
c3dpb3RsYi14ZW4tdXNlLXZtYWxsb2NfdG9fcGFnZS1vbi12bWFsbG9jLXZpcnQtYWRkci5wYXRj
aA0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMDItc3dpb3RsYi14ZW4tcmVtb3ZlLXN0YXJ0X2Rt
YV9hZGRyLnBhdGNoDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFz
cGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAwMy1zd2lvdGxiLXhlbi1hZGQt
c3RydWN0LWRldmljZS1wYXJhbWV0ZXItdG8teGVuX3BoeXNfLnBhdGNoDQo+Pj4+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGlu
dXgvZmlsZXMvMDAwNC1zd2lvdGxiLXhlbi1hZGQtc3RydWN0LWRldmljZS1wYXJhbWV0ZXItdG8t
eGVuX2J1c190LnBhdGNoDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMv
cmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAwNy1zd2lvdGxiLXhlbi1h
ZGQtc3RydWN0LWRldmljZS1wYXJhbWV0ZXItdG8taXNfeGVuX3N3LnBhdGNoDQo+Pj4+PiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwv
bGludXgvZmlsZXMvMDAwOC1zd2lvdGxiLXhlbi1pbnRyb2R1Y2UtcGh5c190b19kbWEtZG1hX3Rv
X3BoeXMtdHJhbnNsLnBhdGNoDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXll
cnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAwOS14ZW4tYXJtLWlu
dHJvZHVjZS1waHlzLWRtYS10cmFuc2xhdGlvbnMtaW4teGVuX2RtYV9zX2tlcm5lbF81LjQucGF0
Y2gNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDEwLXhlbi1hcm0tY2FsbC1kbWFfdG9fcGh5cy1v
bi10aGUtZG1hX2FkZHJfdC1wYXJhbWV0ZXIucGF0Y2gNCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8w
MDExLWFkZGluZy1wYWdlLWNvaGVyZW50LXBhdGNoLnBhdGNoDQo+Pj4+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGludXgvbGlu
dXgtcmFzcGJlcnJ5cGlfJS5iYmFwcGVuZA0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFt
aWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXJhc3BiZXJy
eXBpXzUuNC5iYmFwcGVuZA0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5k
ZWQveGVuL2ZpbGVzL3hlbi1hcm02NC1pbXBsZW1lbnQtYXRvbWljLWZldGNoLWFkZC5wYXRjaA0K
Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hlbi10
b29scy1rZGQtc3RvcC11c2luZy0wLWFycmF5cy10by1hY2Nlc3MtcGFja2V0LWNvbnRlbnRzLnBh
dGNoDQo+Pj4+PiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMv
eGVuLXRvb2xzLWxpYnhsLWdlbnR5cGVzLXB5My5wYXRjaA0KPj4+Pj4gZGVsZXRlIG1vZGUgMTAw
NjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hlbi10b29scy1weWdydWItY2hhbmdlLXRh
YnMtaW50by1zcGFjZXMucGF0Y2gNCj4+Pj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4
dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMtcHlncnViLW1ha2UtcHl0aG9uLXNjcmlwdHMtd29y
ay13aXRoLTIuNi1hbmQtdXAucGF0Y2gNCj4+Pj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
LWV4dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMtcHlncnViLXB5My5wYXRjaA0KPj4+Pj4gZGVs
ZXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hlbi10b29scy1weXRo
b24tZml4LVdzaWduLWNvbXBhcmUtd2FybmluZ3MucGF0Y2gNCj4+Pj4+IGRlbGV0ZSBtb2RlIDEw
MDY0NCByZWNpcGVzLWV4dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMtdXBkYXRlLXB5dGhvbi1z
Y3JpcHRzLXRvLXB5My5wYXRjaA0KPj4+Pj4gDQo+Pj4+PiAtLQ0KPj4+Pj4gMi4xNy4xDQo+Pj4+
PiANCj4+Pj4+IA0KPj4gDQo+IA0KPiANCj4gLS0gDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93
IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KPiB0aGVlIGF0
IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsg
SUkNCg0K

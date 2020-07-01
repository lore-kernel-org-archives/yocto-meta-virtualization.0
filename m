Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17998.1593597867514759310
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 03:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4i7C8NUx;
 spf=fail (domain: arm.com, ip: 140.211.169.56, mailfrom: bertrand.marquis@arm.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C674E01DCA; Wed,  1 Jul 2020 03:04:27 -0700 (PDT)
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
	*      [40.107.7.54 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
	*  1.0 FORGED_SPF_HELO FORGED_SPF_HELO
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5935E01DC8
	for <meta-virtualization@yoctoproject.org>; Wed,  1 Jul 2020 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xZDhQsxdPvmeKtdjtzLr9dFqzDIOQJvRnQz2xcFYws=;
 b=4i7C8NUx//9IJvKE4dMtexGuFBJYOoIBzMifoAwpdSPnQ+hZ8ZvbhOzRrsBELZ9uWftRCaOq0cKOeaOIeTJP/2vp1otziWyNvsXCpYIrBsCFdh05NI00jLbwcyaBckLvHlBjbBd5h+Y4Ss1VrBJQU3aQf8jD7haNrCYjs4HzuUI=
Received: from AM6PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:20b:c0::17)
 by DB6PR0801MB2038.eurprd08.prod.outlook.com (2603:10a6:4:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Wed, 1 Jul
 2020 10:04:22 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::2e) by AM6PR08CA0029.outlook.office365.com
 (2603:10a6:20b:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend
 Transport; Wed, 1 Jul 2020 10:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 10:04:21 +0000
Received: ("Tessian outbound db738e08fd2f:v61"); Wed, 01 Jul 2020 10:04:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd1ddfaa3a3bf715
X-CR-MTA-TID: 64aa7808
Received: from 8c1c722e649f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 64B3F4E2-7833-4701-A863-044E6877FA57.1;
	Wed, 01 Jul 2020 10:04:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c1c722e649f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 10:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHO/v5E+/N4NWn7cN0ffv383uKTVc0PvM1TdRNADNICpAzvGQqsxBRT9YEhHlWUoH4R1m/3vKpmU3DO/EvGsVa3b3uiSHCP/LeB2Mif1rk7GegdWzmChQuf0s3YDqX0bggvJknG4ZpFc1s/KVwYZolvtQv+mf1frYX5h2n/wwtUoZmXh3KfBr0ILq59FAy6nlhHDjl5MhON4dmwWfbqIrF2ELanAjh/wDQ3UKMmSGDZidp6bGbzNI3yLLRXHfxn6Cyxn8fpUU5YyHDWznF2oLJYPWoL90neV52ptrTmBdq0jCwcpUp8b2/UBZdlWcfKYKPX6rpV4P3UMZ5Ei9lEUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xZDhQsxdPvmeKtdjtzLr9dFqzDIOQJvRnQz2xcFYws=;
 b=odqIugvxIfqGmXLKPt2yfAfkFl0vJHtDZKX8Vu+5WxkZKPRfbOoj6YLf1vMX5S+pE6+oU6/MokwlM8A2YDfNEmjMYqgF83BvJtATBXWLngMItvUlObU1FvxWYLaN3tysLgs3Qn0GcnMHNZto5I4PkDB+FGhuH4aheG3MQHZf4pmszNNCmETjMblSlPvNly10AI/JXg9vHUpeMSeQWRBLjw4THw4Vj1UXjMdAzVt04bH0ZMIyjFmKeiumUx5W+LP8wbrqnjr8Y5g0wnbGDtFFfmoa2C3h7ixoT8u8NM2WSAk2Q3nTF0OzrQYatpl+28R1d5FI3GPUM58CzEl+9jZtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xZDhQsxdPvmeKtdjtzLr9dFqzDIOQJvRnQz2xcFYws=;
 b=4i7C8NUx//9IJvKE4dMtexGuFBJYOoIBzMifoAwpdSPnQ+hZ8ZvbhOzRrsBELZ9uWftRCaOq0cKOeaOIeTJP/2vp1otziWyNvsXCpYIrBsCFdh05NI00jLbwcyaBckLvHlBjbBd5h+Y4Ss1VrBJQU3aQf8jD7haNrCYjs4HzuUI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 10:04:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3131.033; Wed, 1 Jul 2020
 10:04:14 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Corey Minyard
	<cminyard@mvista.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Topic: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Thread-Index: AQHWToGd8qCvStWRpU6rq5VgdcmZ3Kjwz7oAgAFqy4CAAEZpgA==
Date: Wed, 1 Jul 2020 10:04:14 +0000
Message-ID: <24C8EAE3-DF44-43D4-88EE-19472B3B0F84@arm.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>
 <EB4F91E7-AEB9-428E-9483-A43192462ED8@arm.com>
 <CACMJ4GYg8yGgbDUgx5arnxuMqEbO2VvzE-sD_a9o6bf2H0LNDg@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GYg8yGgbDUgx5arnxuMqEbO2VvzE-sD_a9o6bf2H0LNDg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f79654e-87d0-470e-cd68-08d81da62073
x-ms-traffictypediagnostic: DB8PR08MB5371:|DB6PR0801MB2038:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20380B844E3452465594135F9D6C0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
x-forefront-prvs: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vOW6XLYKhfPF0Izdqj/dGuSpdiOI44W7joaCCQLwb+3PRSz/hode3K0+6E9+mJF/Ein+z/bvmlKuFDoCBzsbvju9Bpgp/Gv8VWnaqibj4UBHCGtD8IQxaJ4xEZs/RPgMqWFpuFiqhotJHhhSgqo7vt9SBvaRe58UjvtJSBmv8W+XUKyISoFagojrCVc0sWzUvU9o2/brtMnoxEC5jXkcz7eLEr3l3ldzxCQljFtF+2hJy2gpY9j+onp9Ilv5EXtW9dwHQ0Unmu5zH1dVMjFylID8Drsnp4Mp5bhRY/CQPVNdjKSlk/mu9D7kWxCJvWALCgSGAV838kHG40aaUXFZlkx9KMTPe2wmYp16ooQHH0HlkIoP4l2ILMOz2j8vyPZezLVuG0fGAVTyMaFz2SwGew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(53546011)(8936002)(4326008)(54906003)(316002)(66946007)(66446008)(33656002)(6486002)(64756008)(66476007)(66556008)(8676002)(966005)(36756003)(26005)(478600001)(83380400001)(186003)(6916009)(71200400001)(5660300002)(6506007)(2906002)(2616005)(91956017)(76116006)(86362001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 GjWpI3HxDJMLCvvVQP1j7SrOs5GNbm6EfS/QUMhGKlTE2oHXRFty+0ltprYi57NABibo7M0yg/iE+7+cUCtyahR2ffi5IChjxs8jIeD7Pm5I4d9FjwlaJ5859u/nfdTG2nh9Q1vZWF4UZR6bdSoBUYmzgIShSZuzdfnJqlTtD86axAHCQhCC/B3sLoS97GC9WIb/e9q0yk+qMfrHNnfwWS2UUX/pihlXaekDuzrkHyVkWqkoUV0V2NvUiYqDz2IC6TN3G6Veg362Qt+qb7BGZAvSGXrul3aMSBzQtPHLlk6EJ0xyZqSNdq21G4oXYiFLeaH2J/jFF/iiASXBakClhLOkwVs217bIkNijen5wXCokLSXjdS9xLoxOFoGzhqKl1u18aOatUR+k/l9qbEb3K90ZX2/lbnXqpAAWH6EqTxAoulnxly27fcwK6HvnFD6kr3+Yzrg8yAfHNFH6t+kQNBr051ATVtfgV4PJiv0CZ14=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(186003)(356005)(966005)(478600001)(82310400002)(47076004)(82740400003)(81166007)(36756003)(6862004)(6486002)(336012)(2616005)(83380400001)(4326008)(26005)(8936002)(2906002)(5660300002)(6512007)(33656002)(8676002)(86362001)(36906005)(316002)(53546011)(70586007)(70206006)(54906003)(6506007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	af285137-fd1e-482d-d28a-08d81da61bec
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jngBUnixbvk4bWFmk3/9cNQszir90SE90xQSijtS3ORfGP/0d9d1rKoIbveVPOGUW8Xgdas6BX7IIRz8ZVYAiBf8NB6oodqkEP/1pHpyXF5qSYAngZiMlKHVk7ebjqFnMJDAwfUUoCYZtfzUnBrj4g+f5idhjNo4f+ZSFduYYsbjJ1QUJS8EoImcnoU1zDxz6YQQMa1z3diUfjgNeOxWbMUmbWB9aUtSK0bVsfyjSiFDyRV17C3G56moAow8Hq8AiA5WG5zDbtKzAGsu0Z9FPBfbeYjYStFZDxiY3ZcGCFg6759s5cqe3qd5QU92UULKonkLc2mM8eHhADPQtkvsalry16G+dwwYcs928YTTuQyBrg+GmqvkkbZZ3QwRxYRl6xRGpWFCyKKhAJxbzvsQJIBKyz2RmCEWVEXtNfLiC0FVL6sxTioLSQ4uf4HG2+gQjqkIbxyGavcLNEqdwhmFmQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 10:04:21.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f79654e-87d0-470e-cd68-08d81da62073
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2038
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <774C19FC266574439BBCF38217BF7396@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0b3BoZXIsDQoNCj4gT24gMSBKdWwgMjAyMCwgYXQgMDY6NTIsIENocmlzdG9waGVy
IENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBU
dWUsIEp1biAzMCwgMjAyMCBhdCAxOjEzIEFNIEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhJDQo+PiANCj4+PiBPbiAzMCBKdW4g
MjAyMCwgYXQgMDI6NTQsIENocmlzdG9waGVyIENsYXJrIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnIDxjaHJpc3RvcGhlci53LmNsYXJrPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
PiB3cm90ZToNCj4+PiANCj4+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHJ1
bm5pbmcgWGVuIG9uIHRoZSBSYXNwYmVycnkgUGkgNA0KPj4+IGJvYXJkLCB3aXRoIG1ldGEtdmly
dHVhbGl6YXRpb24gYW5kIG1ldGEtcmFzcGJlcnJ5cGksIHVzaW5nIHRoZQ0KPj4+IGxpbnV4LXJh
c3BiZXJyeXBpIGtlcm5lbCBhdCB2ZXJzaW9uIDUuNCB3aGljaCBpcyB0aGUgY3VycmVudA0KPj4+
IGxpbnV4LXlvY3RvIGtlcm5lbCB2ZXJzaW9uIHN1cHBvcnRlZCBpbiB0aGlzIGxheWVyLg0KPj4+
IA0KPj4+IEl0IGludHJvZHVjZXMgdXNlIG9mIGR5bmFtaWMgbGF5ZXJzIHRvIGhhbmRsZSBjb25m
aWd1cmF0aW9uIHRoYXQgaXMNCj4+PiBib3RoIFhlbiBhbmQgUmFzcGJlcnJ5IFBpIHNwZWNpZmlj
LCBhbmQgaW5jbHVzaW9uIG9mIFhlbi1zcGVjaWZpYw0KPj4+IGNvbmZpZ3VyYXRpb24gd2hlbiB0
aGUgJ3hlbicgRElTVFJPX0ZFQVRVUkUgaXMgZW5hYmxlZCB0byBzaW1wbGlmeQ0KPj4+IFhlbiBp
bWFnZSBidWlsZHMuDQo+Pj4gDQo+Pj4gSXQgYXBwbGllcyBhIGJhY2twb3J0ZWQgc2V0IG9mIFhl
bi1zcGVjaWZpYyBMaW51eCBrZXJuZWwgcGF0Y2hlcywNCj4+PiBkZXZlbG9wZWQgYnkgdXBzdHJl
YW0gWGVuIGRldmVsb3BlcnMgd29ya2luZyB3aXRoIHRoZSBMaW51eCBGb3VuZGF0aW9uDQo+Pj4g
RXZlIFByb2plY3QsIHRoYXQgYXJlIGN1cnJlbnRseSBiZWluZyBpdGVyYXRlZCBvbiBmb3IgaW5j
bHVzaW9uIGluIHRoZQ0KPj4+IExpbnV4IGtlcm5lbC4NCj4+PiANCj4+PiBYZW4gaXMgdXByZXYn
ZCB0byB2ZXJzaW9uIDQuMTM7IHRoaXMgaXMgY3VycmVudGx5IGNvbXBpbGUtYW5kLWJvb3QtdGVz
dGVkDQo+Pj4gb25seSBvbiB0aGlzIFJQaTQgYm9hcmQuDQo+PiANCj4+IA0KPj4gQ291bGQgeW91
IGdpdmUgYSBzdW11cCBvZiB3aGF0IHdhcyBjaGFuZ2VkIGluIHYyID8NCj4+IFRoYXTigJlzIGEg
YmlnIHNlcmllIGFuZCByZXZpZXdpbmcgaXQgd291bGQgYmUgZWFzaWVyIHdpdGggc29tZSBpbmZv
cyBvbiB3aGF0IGhhcyBiZWVuIGNoYW5nZWQuDQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBpbnRlcmVzdC4gSSB0aGluayB5b3VyIHJlcGx5IGp1c3QgY2xpcHBlZCB0
aGUgc3RhcnQgb2YNCj4gbXkgbWVzc2FnZSB0aGF0IGNvbnRhaW5lZCB0aGUgc3VtbWFyeSBvZiB0
aGUgY2hhbmdlcyBpbiB2Mj8gVGhlIHRleHQNCj4gd2FzOg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2
MToNCj4gLSByZWJhc2VkIG9uIHRvIGN1cnJlbnQgbWV0YS12aXJ0dWFsaXphdGlvbiwgbWV0YS1v
cGVuZW1iZWRkZWQsIHBva3kNCj4gLSB1cGRhdGVkIFhlbiByZXZpc2lvbiB0byB0aGUgdGlwIG9m
IHN0YWJsZSA0LjEzDQo+IC0gZml4ZWQgWGVuIGJ1aWxkIG9uIEFSTTY0IHdpdGggZ2NjIDEwLjEu
MA0KPiAtIGFkZGVkIHVwc3RyZWFtIGRlYnVnZ2VyIHBhdGNoIHRvIGZpeCBjb21waWxlciB3YXJu
aW5nDQo+IA0KPiBpZS4gVGhlIG1vc3Qgbm90YWJsZSBjaGFuZ2UgaXMgdGhhdCB0aGlzIHNlcmll
cyBhcHBsaWVzIGFuZCBidWlsZCB0bw0KPiBjb21wbGV0aW9uIHdpdGggbXVjaCBtb3JlIHVwIHRv
IGRhdGUgcG9reSBhbmQgbWV0YS1vcGVuZW1iZWRkZWQgcmVwb3MuDQo+IFRoZSBsYXN0IHBhdGNo
IGluIHRoZSBzZXJpZXMgaXMgbmVjZXNzYXJ5IHRvIGVuYWJsZSB0aGF0OiBpdCBhZGRzIGENCj4g
bmV3IGltcGxlbWVudGF0aW9uIG9mIGFuIGF0b21pYyBwcmltaXRpdmUgdG8gWGVuIGZvciB0aGUg
c3BpbmxvY2sNCj4gaW1wbGVtZW50YXRpb24gb24gQVJNNjQsIHJlcGxhY2luZyB1c2Ugb2YgYSBi
dWlsdGluIHdoaWNoIHRoZSBuZXdlcg0KPiBjb21waWxlciBkb2VzIG5vdCBtYWtlIGF2YWlsYWJs
ZSBmb3IgdGhlIGN1cnJlbnQgWGVuIGJ1aWxkLCBwb3NzaWJseQ0KPiBzaW5jZSAtZm5vLWJ1aWx0
aW4gaXMgcHJlc2VudGVkIGFzIGEgY29tcGlsZXIgb3B0aW9uLg0KPiBJJ3ZlIGFsc28gcHVsbGVk
IHRoZSBYZW4gcmV2aXNpb24gY2xvc2VyIHRvIHRoZSB0aXAgb2Ygc3RhYmxlIDQuMTMNCj4gYnJh
bmNoIGFuZCBhcHBsaWVkIGhhbmRsaW5nIGZvciB3YXJuaW5ncyB0aGF0IHRoZSBuZXcgZ2NjIHZl
cnNpb24NCj4gcmVwb3J0cy4NCj4gDQoNClRoYW5rcywgdGhpcyBpcyBhIHZlcnkgaW50ZXJlc3Rp
bmcgc2VyaWUgd2hpY2ggY291bGQgZGVmaW5lIGhvdyBib2FyZHMgc3BlY2lmaWMgc3VwcG9ydCBj
b3VsZCBiZSBoYW5kbGVkLg0KDQpJIGFtIG5vdCBxdWl0ZSBzdXJlIGlmIHRoZSBkeW5hbWljIGxh
eWVyIHNob3VsZCBiZSBpbiBtZXRhLXZpcnR1YWxpemF0aW9uIGFuZCBhY3RpdmF0ZSBpZiBtZXRh
LXJwaTQgaXMgdGhlcmUgb3IgaW4gbWV0YS1ycGk0IGFjdGl2YXRlZCBpZiBtZXRhLXZpcnR1YWxp
emF0aW9uIGlzIHRoZXJlLg0KDQpAQnJ1Y2U6IERvIHlvdSB0aGluayBpdCBpcyBvayB0byBzdGFy
dCBkZWZpbmluZyBkeW5hbWljIGxheWVycyB0aGlzIHdheSBpbiBtZXRhLXZpcnR1YWxpemF0aW9u
ID8NCg0KSSB3b3VsZCBzZWUgYSByaXNrIG9mIHRoZW0gbm90IGJlaW5nIG1haW50YWluZWQgb3Ig
dGVzdGVkLg0KDQpCZXJ0cmFuZA0KDQoNCj4gQ2hyaXN0b3BoZXINCj4gDQo+PiANCj4+IFRoYW5r
cw0KPj4gQmVydHJhbmQNCj4+IA0KPj4+IA0KPj4+IENocmlzdG9waGVyDQo+Pj4gDQo+Pj4gQ2hy
aXN0b3BoZXIgQ2xhcmsgKDExKToNCj4+PiB4ZW46IGFwcGx5IGxheWVyIHNldHRpbmdzIHdoZW4g
eGVuIERJU1RST19GRUFUVVJFIGlzIGVuYWJsZWQNCj4+PiB4ZW4tdG9vbHM6IGFkZCBSUkVDT01F
TkRTIHFlbXUgb24gQVJNIGFuZCB4ODYgd2hlbiBIVk0gaXMgZW5hYmxlZA0KPj4+IHhlbi10b29s
czogdXNlIG5vbi1idXN5Ym94IGlmdXBkb3duIHRvb2wgaWYgYXZhaWxhYmxlDQo+Pj4geGVuLCB4
ZW4tdG9vbHM6IHVwZGF0ZSByZXZpc2lvbiB0byBYZW4gNC4xMw0KPj4+IG1ldGEtdmlydC14ZW4u
aW5jOiBhZGQgUmFzcGJlcnJ5IFBpIHNldHRpbmdzDQo+Pj4geGVuLCByYXNwYmVycnkgcGk6IGFk
ZCBkeW5hbWljLWxheWVyIGZvciBYZW4gY29uZmlndXJhdGlvbiBmb3IgUnBpNA0KPj4+IHhlbiwg
cmFzcGJlcnJ5IHBpIDQ6IHByb3ZpZGUgYSBkZWZhdWx0IGRlZmNvbmZpZyBmb3IgcmFzcGJlcnJ5
cGk0DQo+Pj4geGVuLCBsaW51eC1yYXNwYmVycnlwaTogYWRkIExpbnV4IGtlcm5lbCA1LjQgcGF0
Y2hlcyBmb3IgWGVuIHN1cHBvcnQNCj4+PiB4ZW4sIHJhc3BiZXJyeSBwaTogYWRkIFhlbi1zcGVj
aWZpYyBTRCBjYXJkIGNsYXNzDQo+Pj4gbGludXgtcmFzcGJlcnJ5cGk6IHByZWZlciBrZXJuZWwg
dmVyc2lvbiA1LjQNCj4+PiB4ZW46IGFkZCBwYXRjaCB0byBmaXggYnVpbGQgb24gQVJNNjQgd2l0
aCBnY2MgMTAuMS4wDQo+Pj4gDQo+Pj4gY2xhc3Nlcy9tZXRhLXZpcnQteGVuLWNmZy5iYmNsYXNz
ICAgICAgICAgICAgIHwgICA2ICsNCj4+PiBjbGFzc2VzL3NkY2FyZF9pbWFnZS1ycGkteGVuLmJi
Y2xhc3MgICAgICAgICAgfCAxMjAgKysrKw0KPj4+IGNvbmYvZGlzdHJvL2luY2x1ZGUvbWV0YS12
aXJ0LXhlbi5pbmMgICAgICAgICB8ICAxOSArDQo+Pj4gY29uZi9sYXllci5jb25mICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICstDQo+Pj4gLi4uL2Jvb3RmaWxlcy9ycGktY29u
ZmlnX2dpdC5iYmFwcGVuZCAgICAgICAgIHwgICA2ICsNCj4+PiAuLi4vcnBpLXUtYm9vdC1zY3Iv
ZmlsZXMvYm9vdC5jbWQueGVuLmluICAgICAgfCAgNDkgKysNCj4+PiAuLi4vcnBpLXUtYm9vdC1z
Y3IvcnBpLXUtYm9vdC1zY3IuYmJhcHBlbmQgICAgfCAgMTcgKw0KPj4+IC4uLi94ZW4vZmlsZXMv
ZGVmY29uZmlnX3Jhc3BiZXJyeXBpNC02NCAgICAgICB8IDExNyArKysrDQo+Pj4gLi4uL3JlY2lw
ZXMtZXh0ZW5kZWQveGVuL3hlbl9naXQuYmJhcHBlbmQgICAgIHwgIDExICsNCj4+PiAuLi52bWFs
bG9jX3RvX3BhZ2Utb24tdm1hbGxvYy12aXJ0LWFkZHIucGF0Y2ggfCAgNDQgKysNCj4+PiAuLi4w
Mi1zd2lvdGxiLXhlbi1yZW1vdmUtc3RhcnRfZG1hX2FkZHIucGF0Y2ggfCAgNDcgKysNCj4+PiAu
Li5zdHJ1Y3QtZGV2aWNlLXBhcmFtZXRlci10by14ZW5fcGh5c18ucGF0Y2ggfCAgNzggKysrDQo+
Pj4gLi4uc3RydWN0LWRldmljZS1wYXJhbWV0ZXItdG8teGVuX2J1c190LnBhdGNoIHwgIDY2ICsr
Kw0KPj4+IC4uLnN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLWlzX3hlbl9zdy5wYXRjaCB8ICA1
NyArKw0KPj4+IC4uLm9kdWNlLXBoeXNfdG9fZG1hLWRtYV90b19waHlzLXRyYW5zbC5wYXRjaCB8
ICA4OCArKysNCj4+PiAuLi50cmFuc2xhdGlvbnMtaW4teGVuX2RtYV9zX2tlcm5lbF81LjQucGF0
Y2ggfCAgNjggKysrDQo+Pj4gLi4uX3RvX3BoeXMtb24tdGhlLWRtYV9hZGRyX3QtcGFyYW1ldGVy
LnBhdGNoIHwgIDc1ICsrKw0KPj4+IC4uLi8wMDExLWFkZGluZy1wYWdlLWNvaGVyZW50LXBhdGNo
LnBhdGNoICAgICB8ICAzOSArKw0KPj4+IC4uLi9saW51eC9saW51eC1yYXNwYmVycnlwaV8lLmJi
YXBwZW5kICAgICAgICB8ICAgNSArDQo+Pj4gLi4uL2xpbnV4L2xpbnV4LXJhc3BiZXJyeXBpXzUu
NC5iYmFwcGVuZCAgICAgIHwgIDE5ICsNCj4+PiAuLi54ZW4tYnVpbGQtdGVtcG9yYXJpbHktaW5o
aWJpdC1XZXJyb3IucGF0Y2ggfCAgMTggKy0NCj4+PiAuLi54ZW4tYXJtNjQtaW1wbGVtZW50LWF0
b21pYy1mZXRjaC1hZGQucGF0Y2ggfCAgNTAgKysNCj4+PiAuLi5nLTAtYXJyYXlzLXRvLWFjY2Vz
cy1wYWNrZXQtY29udGVudHMucGF0Y2ggfCAgNjAgKysNCj4+PiAuLi4vZmlsZXMveGVuLXRvb2xz
LWxpYnhsLWdlbnR5cGVzLXB5My5wYXRjaCAgfCAxNDAgLS0tLS0NCj4+PiAuLi50b29scy1weWdy
dWItY2hhbmdlLXRhYnMtaW50by1zcGFjZXMucGF0Y2ggfCAgNDAgLS0NCj4+PiAuLi4tcHl0aG9u
LXNjcmlwdHMtd29yay13aXRoLTIuNi1hbmQtdXAucGF0Y2ggfCA1MjkgLS0tLS0tLS0tLS0tLS0t
LS0tDQo+Pj4gLi4uL3hlbi9maWxlcy94ZW4tdG9vbHMtcHlncnViLXB5My5wYXRjaCAgICAgIHwg
MjMzIC0tLS0tLS0tDQo+Pj4gLi4ubHMtcHl0aG9uLWZpeC1Xc2lnbi1jb21wYXJlLXdhcm5pbmdz
LnBhdGNoIHwgMTM2IC0tLS0tDQo+Pj4gLi4ubi10b29scy11cGRhdGUtcHl0aG9uLXNjcmlwdHMt
dG8tcHkzLnBhdGNoIHwgMTQwIC0tLS0tDQo+Pj4gcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRv
b2xzLmluYyAgICAgICAgICAgIHwgIDE2ICsNCj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4t
dG9vbHNfZ2l0LmJiICAgICAgICAgfCAgMTMgKy0NCj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94
ZW5fZ2l0LmJiICAgICAgICAgICAgICAgfCAgMTEgKy0NCj4+PiAzMiBmaWxlcyBjaGFuZ2VkLCAx
MTAyIGluc2VydGlvbnMoKyksIDEyMzQgZGVsZXRpb25zKC0pDQo+Pj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IGNsYXNzZXMvbWV0YS12aXJ0LXhlbi1jZmcuYmJjbGFzcw0KPj4+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBjbGFzc2VzL3NkY2FyZF9pbWFnZS1ycGkteGVuLmJiY2xhc3MNCj4+PiBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZi9kaXN0cm8vaW5jbHVkZS9tZXRhLXZpcnQteGVuLmluYw0KPj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWJzcC9ib290
ZmlsZXMvcnBpLWNvbmZpZ19naXQuYmJhcHBlbmQNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHlu
YW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1ic3AvcnBpLXUtYm9vdC1zY3IvZmlsZXMv
Ym9vdC5jbWQueGVuLmluDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jh
c3BiZXJyeXBpL3JlY2lwZXMtYnNwL3JwaS11LWJvb3Qtc2NyL3JwaS11LWJvb3Qtc2NyLmJiYXBw
ZW5kDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3Jl
Y2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL2RlZmNvbmZpZ19yYXNwYmVycnlwaTQtNjQNCj4+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1leHRl
bmRlZC94ZW4veGVuX2dpdC5iYmFwcGVuZA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWlj
LWxheWVycy9yYXNwYmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDAxLXN3aW90
bGIteGVuLXVzZS12bWFsbG9jX3RvX3BhZ2Utb24tdm1hbGxvYy12aXJ0LWFkZHIucGF0Y2gNCj4+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1r
ZXJuZWwvbGludXgvZmlsZXMvMDAwMi1zd2lvdGxiLXhlbi1yZW1vdmUtc3RhcnRfZG1hX2FkZHIu
cGF0Y2gNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkv
cmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAwMy1zd2lvdGxiLXhlbi1hZGQtc3RydWN0LWRl
dmljZS1wYXJhbWV0ZXItdG8teGVuX3BoeXNfLnBhdGNoDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAw
MDQtc3dpb3RsYi14ZW4tYWRkLXN0cnVjdC1kZXZpY2UtcGFyYW1ldGVyLXRvLXhlbl9idXNfdC5w
YXRjaA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNwYmVycnlwaS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDA3LXN3aW90bGIteGVuLWFkZC1zdHJ1Y3QtZGV2
aWNlLXBhcmFtZXRlci10by1pc194ZW5fc3cucGF0Y2gNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvMDAw
OC1zd2lvdGxiLXhlbi1pbnRyb2R1Y2UtcGh5c190b19kbWEtZG1hX3RvX3BoeXMtdHJhbnNsLnBh
dGNoDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzLzAwMDkteGVuLWFybS1pbnRyb2R1Y2UtcGh5cy1kbWEt
dHJhbnNsYXRpb25zLWluLXhlbl9kbWFfc19rZXJuZWxfNS40LnBhdGNoDQo+Pj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jhc3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4
L2ZpbGVzLzAwMTAteGVuLWFybS1jYWxsLWRtYV90b19waHlzLW9uLXRoZS1kbWFfYWRkcl90LXBh
cmFtZXRlci5wYXRjaA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkeW5hbWljLWxheWVycy9yYXNw
YmVycnlwaS9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy8wMDExLWFkZGluZy1wYWdlLWNvaGVy
ZW50LXBhdGNoLnBhdGNoDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGR5bmFtaWMtbGF5ZXJzL3Jh
c3BiZXJyeXBpL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXJhc3BiZXJyeXBpXyUuYmJhcHBl
bmQNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgtcmFzcGJlcnJ5cGlfNS40LmJiYXBwZW5kDQo+Pj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hlbi1hcm02NC1pbXBs
ZW1lbnQtYXRvbWljLWZldGNoLWFkZC5wYXRjaA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNp
cGVzLWV4dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMta2RkLXN0b3AtdXNpbmctMC1hcnJheXMt
dG8tYWNjZXNzLXBhY2tldC1jb250ZW50cy5wYXRjaA0KPj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCBy
ZWNpcGVzLWV4dGVuZGVkL3hlbi9maWxlcy94ZW4tdG9vbHMtbGlieGwtZ2VudHlwZXMtcHkzLnBh
dGNoDQo+Pj4gZGVsZXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hl
bi10b29scy1weWdydWItY2hhbmdlLXRhYnMtaW50by1zcGFjZXMucGF0Y2gNCj4+PiBkZWxldGUg
bW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xzLXB5Z3J1Yi1t
YWtlLXB5dGhvbi1zY3JpcHRzLXdvcmstd2l0aC0yLjYtYW5kLXVwLnBhdGNoDQo+Pj4gZGVsZXRl
IG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2ZpbGVzL3hlbi10b29scy1weWdydWIt
cHkzLnBhdGNoDQo+Pj4gZGVsZXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL2Zp
bGVzL3hlbi10b29scy1weXRob24tZml4LVdzaWduLWNvbXBhcmUtd2FybmluZ3MucGF0Y2gNCj4+
PiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4vZmlsZXMveGVuLXRvb2xz
LXVwZGF0ZS1weXRob24tc2NyaXB0cy10by1weTMucGF0Y2gNCj4+PiANCj4+PiAtLQ0KPj4+IDIu
MTcuMQ0KPj4+IA0KPj4+IA0KDQo=

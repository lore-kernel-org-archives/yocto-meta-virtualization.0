Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web09.6681.1618566090988591833
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 02:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GBMPLiz7;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jh9R6eeONLkKshrFTpodChlhE0Lm4XCjn9isI9M8pM=;
 b=GBMPLiz7BeiLrXUKr902r7kG0HHNM8DlHxdElKV5vbGWZL5JsWrocVErDHodBTyJraqsYn+iTLmzORVHW1/fthKp0/odcXTbSi/W5fBGnfJ+zBn3wFm05FlVJnLKkG5hwK3nQJRtMvw2xBIwRmVKmVgAUbUBWMBYeeFfpe9cW/g=
Received: from AM6PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:6e::36)
 by AM6PR08MB4817.eurprd08.prod.outlook.com (2603:10a6:20b:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 09:41:25 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::d8) by AM6PR02CA0023.outlook.office365.com
 (2603:10a6:20b:6e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 09:41:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 09:41:24 +0000
Received: ("Tessian outbound 34291f7cb530:v90"); Fri, 16 Apr 2021 09:41:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 949d847c2c7c3ca2
X-CR-MTA-TID: 64aa7808
Received: from a98b1627e62c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34F2E32D-465C-49EF-8841-DAA5065D3244.1;
	Fri, 16 Apr 2021 09:41:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a98b1627e62c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Apr 2021 09:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUAYho4bvwdLPRdyaiT0TxlH8/+Kb8a1rFLKhE2UQLs9Kg/Rd31mZcDtmQ7oRgWVUJt/MoYxxITbd1spcHXQ+hzEPMMgktgDiBtQ3WqtGdPxTw4zSHlJk4VrjEA3fOHbat125C5h3n7gXsfdbtqdwal4+tJPv0EVE+oznd1MW3d3motHpeMac06MPTQqnKPGoJFOlOz1yDf2Z0wuRCuLaY74mD1ilFbhTKkoT6sIxyGFLJCz01jJJfBnPK5g7wQ2gt/z8WDsmFiYCpYzdrnAu/Rf0blJmNxjf4PsDcjCzkTcFn1jhse+YrkrgzsyQkS6wHC09mWGJEKYK8XBNcxWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jh9R6eeONLkKshrFTpodChlhE0Lm4XCjn9isI9M8pM=;
 b=KQ6p0CcfFDt0Kkwav57qhxBRhVh6PmEl0QpGa5GbeemrHJRb/3+Tv8B56e6ug0VdHz8gaScLm1lNEeLVakvlgaNx5J6zPEaKcYph2OshfTaJuPtplroyzMXUO45nZCN4k5EKSv75IBNy9TIJh9sBUH33r+w5/BibBIl5S587Cf2ZU9rkojPhSjardXMk0T7HtcSlN4sPhV50j5p07cSGyyBKStVWJU1s+JJnA5qbvLQfXalTawOzo7UM3xFoQGiZv/WE7fOxF3KauPoMo7cswY5VJGDqFNaYy523mGvmHxssv2PfLmK/+kZba8RRv9pXiSXopSIxGZ45H8BeVVunYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jh9R6eeONLkKshrFTpodChlhE0Lm4XCjn9isI9M8pM=;
 b=GBMPLiz7BeiLrXUKr902r7kG0HHNM8DlHxdElKV5vbGWZL5JsWrocVErDHodBTyJraqsYn+iTLmzORVHW1/fthKp0/odcXTbSi/W5fBGnfJ+zBn3wFm05FlVJnLKkG5hwK3nQJRtMvw2xBIwRmVKmVgAUbUBWMBYeeFfpe9cW/g=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 09:41:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 09:41:16 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
Thread-Topic: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes
 for new stable Xen 4.15 release
Thread-Index: AQHXMYeD2WCkSCcMjEmYs0aCW1a32aq1S+YAgACq8gCAAHVdAIAAQVYAgAA4r4A=
Date: Fri, 16 Apr 2021 09:41:16 +0000
Message-ID: <A8906E3B-37CE-44B3-8649-B607ED9D9129@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com>
 <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
 <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com>
 <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
 <CACMJ4GaLA1=wm5v8uHkNSMBNNqBnHhvKm6Lmf+zTa8Rz0o5tiA@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GaLA1=wm5v8uHkNSMBNNqBnHhvKm6Lmf+zTa8Rz0o5tiA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b3d18cb2-27cc-492d-28f9-08d900bbcce8
x-ms-traffictypediagnostic: VE1PR08MB5696:|AM6PR08MB4817:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB48177BC71E08EA50F97927F39D4C9@AM6PR08MB4817.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rmQu0mvoePnHVCCzQyHyJII67lkew76e7Rs6ehM8cSQapZQqFoK2oiHN8cbucqPr9LytvSkmg66QDirWXZw9QsC11217F3O2mbfPtlF0rzgfJiWt2ZUMVbvifpAb8ZpyLsA0v1ridOxC2yyZEiAzyldTe3QpeTTo6a1+gsrkbkkGYyudnqKPpLg6V07dqenu/9PIqxlpwLaev6cxxbgwQKPLyrxZGJAu4A9rf5vmnim7EgTurrQ4o3HcWqSh3D4jWtgZ1ukRB/e8wZ802l1w8fUxzICr1rl8umWC7p9ZSyO4pVdMRKBoCHgERaODakk2LyMH3TefPKQOhoyiB5QTRcGN8a7XuojGGPVOjCFI7b1X30k2UIcyKUorG+RNa1Okg09WAp75VYpChdnVDH1do0iDF3B9CkWV41Wp8p1LLDvMveuP+nUddGYDKOcVdJ7/GGZvRlWa64dpUhTyuzvktfeqAaPugSc/AS31f5igpYSemDLODrzfEJ5dV73V7A98LTMaBE+oWJMKlBEscsGkpRGDSf4ViBvZLel/6GUwmKRBWr58RBJNY4LDVWYjNGTZHibXIsBwMjA4ARNrdnRcUbwL5VAisMXHzwt0/sDkwznwJYcahw8E/xSGp8Fm0IF76T4uQOaqfbANwicUV4+vDT2LFR1HQyCDTqELjaNolfApujDY6wq83avDKWqK8fReqGICKLh3SWTMnjSrGfrVUTZf9FrgmSadsD4+FA/Fxn0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(86362001)(91956017)(36756003)(66556008)(2616005)(66476007)(76116006)(71200400001)(66446008)(64756008)(186003)(66946007)(6916009)(2906002)(26005)(6506007)(966005)(53546011)(33656002)(5660300002)(4326008)(38100700002)(478600001)(8676002)(8936002)(122000001)(83380400001)(6486002)(54906003)(6512007)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?SzREMHN3VE5MYUVSaDJzS2FuMGt3VVdkTFFIS1pXamNUM2tlNFdoVTl5Yngx?=
 =?utf-8?B?aVhmaEhzZFdsb3gzcndiN1ZyMFhqbmloTWZNUmNObUVyV29meE00WnNNWS9L?=
 =?utf-8?B?OGk3TTZPZUlkSm95V0lKSVVpazBWV2xlQVNib3YxN2NtTE5kOUoyTWk4dVRu?=
 =?utf-8?B?Z3ZiUzZlMFJMY3c3RW9aRHYvenFyQjZhSVZFK3Zpb0Z4dDJZN3JXZEJCVWtO?=
 =?utf-8?B?NjNrbHFHY0dFYzdpWUZoalQrUVV4SERLRSs0eWRSOUl6d2NML2srZVNtN3p6?=
 =?utf-8?B?UVh2M2FqWmlXeCszTk9FTVV4UFpDTFllMGFuNDQ1MmxEOFFEempXcWdYWHZ3?=
 =?utf-8?B?RDVXU0ZNaXcrZjVVWFVYcjZZK0Q1VGVpd1NBR0wwZlRrdUp3c2tOVmVRVXBU?=
 =?utf-8?B?Q2FBSU9IRXJQRk40cFB6VGtVU3oxQmlMN1duck83S1k3aGZFWE9oTkNwZjZt?=
 =?utf-8?B?T0RFbGhRK2h2aTlZc1pud3FYVnZtQlZ5bmRNVGxOLzRCUkRIRlc1aGdQOXE5?=
 =?utf-8?B?R2k3aG92d0xmeUpyUXExVEUwTjFUcy80UEQ1Wm5CZlNHMDM4TTVaY3cxNXR1?=
 =?utf-8?B?b3RmaWhjcitIRE8rdE96NmVlMW5PTXlvZkxoT3pTZEF2TGhtUzFTakVwVHR6?=
 =?utf-8?B?UHRHb1NKbHYxM0tSOVVTWDUzUVk2V2t0dkJNQnoxemhlTXAyd0Zia2poMWlD?=
 =?utf-8?B?ei80djFmWEhGVlF1WVdkazg5MlpmQnBSQVF6QUZHSkNBT29EMG1jQWZZY2t2?=
 =?utf-8?B?STFHbDM5UEt0a1JZRUg5bFpFdWw1M0xsMUViKy83YUZVL0xmcnhHNXQwNVNk?=
 =?utf-8?B?ZWpDN3R5S1kzRmN2ZGRtVE1tVDJyTGp5YTJ0dmFRRHlRVlFMR3R5eEtIUWIv?=
 =?utf-8?B?U28yQlZRRDJoSW1sdTNHWDlwR0gveHMrSG5xUGV0Mk9UVmZTNFRabTBKOGdm?=
 =?utf-8?B?WDk1L2Y0OWUybnFIMFc4Zm1vT01kTEFlUTFGS3lBWllaUERrVXd0RkYxQU9C?=
 =?utf-8?B?ZlpqZTVzWEZpQkNWL0laZjRNVGlXd09hSGkvNGI0VURLT2NneG9rTDQyMm5T?=
 =?utf-8?B?aVh0N2o2SDhma0I2V2kxNThHcnQ3Lyt5Z0wwdWFRaHNpeE1vZmhlcnIvMW5k?=
 =?utf-8?B?ZnZXdnlPVFoxYW1nOU5VVk80MjJsejViV3pIQmNZZnQ0cFVYUVNlakFLcVVD?=
 =?utf-8?B?NVJ1NG5xakF6ZW1BVTNXNWVXenJpbEVTdnEySXBZNXFORHN2OUNwSFVFaEQ2?=
 =?utf-8?B?bDdUNVJXTEpEL1Qyd09wbnJlUjBUem5rNmZFUjhmZmJvTXE0OVJ0QkprYkI4?=
 =?utf-8?B?Qld3U0cydVZQdlRZV0lIWGV2eFZ5d1JJUlBpT0tmRVFXREhsaUZQbVBuY0gr?=
 =?utf-8?B?SW5rY2MrY0hrUDJOdG9WTU9veXdSSTFyQmlMN2krRTNyQTJzNTdsb1JYLzJK?=
 =?utf-8?B?RHBqM1VHSlVxS1hrRVZvZ3RSZkZYTkxOMDVTNVpGWWp5THBPMW54UW5zOFRK?=
 =?utf-8?B?dzVJOUdvQ2t6RzB6L2R0cUZCMk1MakVKM2hOb085RnVvR09FQjQwR1VhSTF5?=
 =?utf-8?B?R2Z6QXNXTVBIWVBTK0JScnJGTHU0dlpTejVNRTlSQ3VBTDdpVVdNdXQvekJL?=
 =?utf-8?B?NUVtUVlvcXQySFBoaFQrMCtMMjc0ZTJpdVdwOGt5YXp5OG1DUTk4eFZCSUFS?=
 =?utf-8?B?STkya05LZ3d1aVlGdEx1Z1IyRUE0NStGSzhNMjdEelBLLzd5ZjhUYlhqQ2xW?=
 =?utf-8?B?a3g0N0FRelg5VCtrS0lqVXErZkFwai9mZVhWTFY1YXA3UXFmcHdHK1hseTFL?=
 =?utf-8?B?TEgxNVBIT3pHRFplNnI1Zz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5696
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	543e4fa2-9b15-4fb5-6dd8-08d900bbc818
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CnhFuX+HiyL8u73KJoTGPArGpeReh6c94FYRqhPSb/zawE+GhgwF3Ys2N42EQJjMM6kVXoQAzGk1IXI+FxJ7gpsxOGxj/KJJ9xQhmD8aCwKPbgzCbCGGUzbTehad0pTQeEXyLOlbNeYdn4SmbTJ8PYVixI1tvNCYVKv05UwiRItGYpO+ytdTLHEREfgp2Gx2PHBwKIePZNX9vkq4c8Vlhu3TlPxkKjKwB11JmZ8RHCSgZr/Ycbhh/UoMf+aTv9CIEPeWdSZOf7bCxi9XSGvBHduVfFDsW3v/2SISSafzuuZ06KS7rbGZu52d2rmqYEhduBCsPDZaQWf6632Asp/RX+Pluta1kpLJRZr5NXvzBBzFDAX9E3R+2TlTGuNaapITelO+1d+f5HK5gYQdeQi7LMvz7LtgxxbDkC1ijlYHVuPjW9sIT9BKBz6ppoG8FoxIhI25Ze4dMx1kAha0PQwiku9kl3bBYysXZ7/xZgtwi4qPuo0tQbAg22+Ldq+AfPPP0qLzLRnto5knhKbQRkH+9GX+xDNhpyJG+X5S6QoTQjv2Aau4OCUlyqd/ii4e3fOI7/tEk3oBPzL8nBBc10OrSk+gZnRvSKZUTa0vvALrGe0rlVkoQTla7jH8LlMMA+23EHcs418VPoazhnfmM9dyu7g0rzLSNN3MVOMtxNLWZl5lcWOtVLm306WSsJuBnufkIHGF9HsQEhefTHP+UEK45ihX6BsTgf3wQ5/8fk9CwYQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(8936002)(478600001)(2906002)(6512007)(82310400003)(4326008)(356005)(8676002)(26005)(966005)(6862004)(33656002)(83380400001)(70206006)(2616005)(86362001)(36860700001)(70586007)(186003)(336012)(5660300002)(54906003)(81166007)(47076005)(53546011)(6486002)(316002)(107886003)(82740400003)(36756003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 09:41:24.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d18cb2-27cc-492d-28f9-08d900bbcce8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4817
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9948A938110733439D74E700A08DE252@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCj4gT24gMTYgQXByIDIwMjEsIGF0IDA3OjE4LCBDaHJpc3RvcGhlciBDbGFyayB2aWEg
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8Y2hyaXN0b3BoZXIudy5jbGFyaz1nbWFpbC5jb21AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+DQo+IE9uIFRodSwgQXByIDE1LCAyMDIxIGF0
IDc6MjQgUE0gQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pg0KPj4gT24gVGh1LCBBcHIgMTUsIDIwMjEgYXQgMzoyNCBQTSBDaHJpc3RvcGhlciBDbGFy
aw0KPj4gPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToNCj4+Pg0KPj4+IE9u
IFRodSwgQXByIDE1LCAyMDIxIGF0IDI6MTIgQU0gQmVydHJhbmQgTWFycXVpcw0KPj4+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBDaHJpc3RvcGhlciwN
Cj4+Pj4NCj4+Pj4+IE9uIDE1IEFwciAyMDIxLCBhdCAwMDozOSwgQ2hyaXN0b3BoZXIgQ2xhcmsg
dmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPGNocmlzdG9waGVyLncuY2xhcms9Z21haWwuY29t
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+IEFkZGVkIGFzIG5v
bi1kZWZhdWx0LCByZXRhaW5pbmcgdGhlIFhlbiA0LjE0IHJlY2lwZXMgYXMgdGhlIGRlZmF1bHQN
Cj4+Pj4+IHByZWZlcnJlZCB2ZXJzaW9uIGZvciB0aGUgSGFyZGtub3R0IHJlbGVhc2UuDQo+Pj4+
Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncu
Y2xhcmtAZ21haWwuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiByZWNpcGVzLWV4dGVuZGVkL3hlbi94
ZW4tdG9vbHNfNC4xNS5iYiB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+Pj4+PiByZWNpcGVz
LWV4dGVuZGVkL3hlbi94ZW5fNC4xNS5iYiAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysr
Kw0KPj4+Pj4gMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+Pj4+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTUuYmINCj4+Pj4+
IGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fNC4xNS5iYg0KPj4+
Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHNfNC4x
NS5iYiBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi10b29sc180LjE1LmJiDQo+Pj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPj4+Pj4gaW5kZXggMDAwMDAwMC4uZDhjYjg0Ng0KPj4+Pj4gLS0t
IC9kZXYvbnVsbA0KPj4+Pj4gKysrIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQu
MTUuYmINCj4+Pj4+IEBAIC0wLDAgKzEsMjAgQEANCj4+Pj4+ICtTUkNSRVYgPz0gImUyNWFhOTkz
OWFlMGNkODMxNzYwNWJlM2Q1YzU2MTFiNzZiYzRhYjQiDQo+Pj4+PiArDQo+Pj4+PiArWEVOX1JF
TCA/PSAiNC4xNSINCj4+Pj4+ICtYRU5fQlJBTkNIID89ICJzdGFibGUtJHtYRU5fUkVMfSINCj4+
Pj4+ICsNCj4+Pj4+ICtTUkNfVVJJID0gIiBcDQo+Pj4+PiArICAgIGdpdDovL3hlbmJpdHMueGVu
Lm9yZy94ZW4uZ2l0O2JyYW5jaD0ke1hFTl9CUkFOQ0h9IFwNCj4+Pj4+ICsgICAgZmlsZTovLzAw
MDEtcHl0aG9uLXB5Z3J1Yi1wYXNzLURJU1RVVElMUy14ZW4tNC4xNS5wYXRjaCBcDQo+Pj4+PiAr
ICAgICINCj4+Pj4+ICsNCj4+Pj4+ICtMSUNfRklMRVNfQ0hLU1VNID89ICJmaWxlOi8vQ09QWUlO
RzttZDU9NDE5NzM5ZTMyNWE1MGYzZDdiNDUwMTMzOGU0NGE0ZTUiDQo+Pj4+PiArDQo+Pj4+PiAr
UFYgPSAiJHtYRU5fUkVMfStzdGFibGUke1NSQ1BWfSINCj4+Pj4+ICsNCj4+Pj4+ICtTID0gIiR7
V09SS0RJUn0vZ2l0Ig0KPj4+Pj4gKw0KPj4+Pj4gK0RFRkFVTFRfUFJFRkVSRU5DRSA/Pz0gIi0x
Ig0KPj4+Pg0KPj4+PiB3ZSBoYXZlIGEgZmlsZSBtZXRhLXZpcnQtZGVmYXVsdC12ZXJzaW9ucy5p
bmMgaW4gY29uZi9kaXN0cm8vaW5jbHVkZQ0KPj4+Pg0KPj4+PiBTaG91bGRu4oCZdCB3ZSB1c2Ug
dGhhdCBmaWxlIGFuZCBzZXQgUFJFRkVSUkVEX1ZFUlNJT04gaW5zdGVhZCBvZiB1c2luZyBkZWZh
dWx0DQo+Pj4+IHByZWZlcmVuY2UgaW4gZWFjaCByZWNpcGUgPw0KPj4+DQo+Pj4gSSB3YXNuJ3Qg
YXdhcmUgb2YgdGhhdCBmaWxlIHNvIGhhZG4ndCBjb25zaWRlcmVkIGl0IC0tIGl0J3Mgbm90DQo+
Pj4gb2J2aW91cyBhcyBhIHBsYWNlIHRvIGxvb2sgdG8gdW5kZXJzdGFuZCBob3cgdGhlIHZlcnNp
b24gb2YgWGVuIGlzDQo+Pj4gYmVpbmcgc2V0LCBvciB0aGF0IGl0IHdpbGwgY2hhbmdlIHRoZSBk
ZWZhdWx0IHZlcnNpb24gb2YgWGVuIGFjY29yZGluZw0KPj4+IHRvIHdoZXRoZXIgdGhlIERJU1RS
T19GRUFUVVJFUyBpbmNsdWRlcyAndmlydHVhbGl6YXRpb24nLiBTbyBJIGFtIG5vdA0KPj4+IHN1
cmUgdGhhdCB3ZSBzaG91bGQgZG8gdGhhdC4NCj4+DQo+PiBIYXZpbmcgLmluYyBmaWxlcyB3aXRo
IGxpc3RzIG9mIGNlbnRyYWxpemVkIHZlcnNpb25zIGlzIGhpc3RvcmljYWxseQ0KPj4gd2hhdCBo
YXMgYmVlbiBkb25lIGFuZCB0Y21vZGUtZGVmYXVsdC5pbmMgc3RpbGwgZG9lcy4NCj4+DQo+PiBX
ZSBhY3R1YWxseSBkbyBvbmx5IHdhbnQgdGhvc2UgcHJlZmVycmVkIHZlcnNpb25zIHRvIGtpY2sg
aW4gd2hlbiBhDQo+PiBkaXN0cm8gZmVhdHVyZSBpcyBzZXQgKHhlbiwgdmlydHVhbGl6YXRpb24g
Li4gd2hhdGV2ZXIpLCBzaW5jZSB0aGF0DQo+PiBtZWFucyB3ZSBjYW4gaW5jbHVkZSB0aGUgbGF5
ZXIgYW5kIGl0IHdvbid0IGNoYW5nZSBhbnl0aGluZyB1bmxlc3MgdGhlDQo+PiBmZWF0dXJlcyBh
cmUgdHVybmVkIG9uLg0KPg0KPiBJIHNlZSAtIHRoYXQgZG9lcyBtYWtlIGEgZGlmZmVyZW5jZSB0
aGVuLg0KPg0KPj4+IChBcyBhbiBhc2lkZSwgdGhlcmUncyBtZXRhLXZpcnQteGVuLmluYyBpbiB0
aGF0IGRpcmVjdG9yeSB0aGF0IEkgd291bGQNCj4+PiBsaWtlIHRvIHJldGlyZSBhbmQgcmVtb3Zl
IGJ5IG1ha2luZyBpbXByb3ZlbWVudHMgZWxzZXdoZXJlLCBmb3INCj4+PiBzaW1pbGFyIHJlYXNv
bnMuKQ0KPj4+DQo+Pj4+IFNvbWV0aGluZyBsaWtlOg0KPj4+PiBQUkVGRVJSRURfVkVSU0lPTl94
ZW4gPz0gIjQuMTQlIg0KPj4+PiBQUkVGRVJSRURfVkVSU0lPTl94ZW4tdG9vbHMgPz0gIjQuMTQl
Ig0KPj4+Pg0KPj4+PiBUaGlzIHdvdWxkIHByZXZlbnQgbW9kaWZ5aW5nIHRoZSByZWNpcGVzIHdo
ZW4gd2UgY2hhbmdlIHRoZSBkZWZhdWx0IHZlcnNpb24uDQo+Pj4NCj4+PiBJIHRoaW5rIEkgd291
bGQgcHJlZmVyIHRvIG1vZGlmeSB0aGUgcmVjaXBlcyB3aGVuIHRoZSBkZWZhdWx0IHZlcnNpb24N
Cj4+PiBpcyBjaGFuZ2VkLCB0byBtYWtlIGl0IGEgY2xlYXIgbG9jYWxpemVkIGNoYW5nZSBpbiB0
aGUgWGVuIHJlY2lwZQ0KPj4+IGRpcmVjdG9yeS4NCj4+DQo+PiBJIGNhbiBzZWUgdGhlIGFkdmFu
dGFnZSBvZiBib3RoIGFwcHJvYWNoZXMuDQo+Pg0KPj4gVGhlIHByb2JsZW0gd2l0aCB0aGUgREVG
QVVMVF9QUkVGRVJFTkNFLCBpcyB0aGF0IGp1c3QgYXMgbWFueSBwZW9wbGUNCj4+IGhhdmUgbm8g
aWRlYSB3aGF0IGl0IGRvZXMsIGhvdyBsYXllciBvcmRlcmluZyBkb2VzIChvciBkb2Vzbid0KSBp
bXBhY3QNCj4+IGl0LCBldGMuICBJdCBpcyBhIGJpdCBoYXJkZXIgdG8gZ3JvayB0aGFuIGFuIGV4
cGxpY2l0bHkgbGlzdGVkIHZlcnNpb24NCj4+IChhbmQgeW91J2xsIGdldCBhIHdhcm5pbmcgaWYg
YSByZXF1ZXN0ZWQgdmVyc2lvbiBpc24ndCBhdmFpbGFibGUsDQo+PiBldGMpLiAgQnV0IG9mIGNv
dXJzZSBERUZBVUxUX1BSRUZFUkVOQ0UgZXhpc3RzIGZvciBhIHJlYXNvbiAuLiBhbmQNCj4+IHRo
aXMgaXMgb25lIG9mIHRoZW0uIEkgdGhpbmsgaXQgZG9lcyBjb21lIGRvd24gdG8gcHJlZmVyZW5j
ZSBhbmQNCj4+IGNvbnNpc3RlbmN5Lg0KPj4NCj4+IEkgZG8gbGVhbiB0b3dhcmRzIHRoZSAuaW5j
IG15c2VsZiwgc2luY2Ugd2UgbmVlZCB0aGVtIGZvciBvdGhlcg0KPj4gY29vcmRpbmF0aW5nIGZl
YXR1cmVzIGluIHRoZSBsYXllcihzKSwgYnV0IEknbSBmYXIgZnJvbSBpbnNpc3Rpbmcgb24NCj4+
IHRoYXQgYXBwcm9hY2guDQo+DQo+IE9LIC0tIEknbGwgbWFrZSB0aGUgY2hhbmdlLg0KDQpHcmVh
dCwgdGhhbmtzIGEgbG90Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4NCj4gQ2hyaXN0b3BoZXIN
Cj4NCj4NCj4+DQo+PiBCcnVjZQ0KPj4NCj4+PiBXb3VsZCB0aGF0IGJlIGFjY2VwdGFibGU/DQo+
Pj4NCj4+PiBDaHJpc3RvcGhlcg0KPj4+DQo+Pj4+DQo+Pj4+IENoZWVycw0KPj4+PiBCZXJ0cmFu
ZA0KPj4+Pg0KPj4+Pj4gKw0KPj4+Pj4gK3JlcXVpcmUgeGVuLmluYw0KPj4+Pj4gK3JlcXVpcmUg
eGVuLXRvb2xzLmluYw0KPj4+Pj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hl
bl80LjE1LmJiIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuXzQuMTUuYmINCj4+Pj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+Pj4+PiBpbmRleCAwMDAwMDAwLi40OTI2OGNjDQo+Pj4+PiAtLS0g
L2Rldi9udWxsDQo+Pj4+PiArKysgYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fNC4xNS5iYg0K
Pj4+Pj4gQEAgLTAsMCArMSwyMSBAQA0KPj4+Pj4gK1NSQ1JFViA/PSAiZTI1YWE5OTM5YWUwY2Q4
MzE3NjA1YmUzZDVjNTYxMWI3NmJjNGFiNCINCj4+Pj4+ICsNCj4+Pj4+ICtYRU5fUkVMID89ICI0
LjE1Ig0KPj4+Pj4gK1hFTl9CUkFOQ0ggPz0gInN0YWJsZS0ke1hFTl9SRUx9Ig0KPj4+Pj4gKw0K
Pj4+Pj4gK1NSQ19VUkkgPSAiIFwNCj4+Pj4+ICsgICAgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hl
bi5naXQ7YnJhbmNoPSR7WEVOX0JSQU5DSH0gXA0KPj4+Pj4gKyAgICBmaWxlOi8veGVuLWFybTY0
LWltcGxlbWVudC1hdG9taWMtZmV0Y2gtYWRkLnBhdGNoIFwNCj4+Pj4+ICsgICAgZmlsZTovLzAw
MDEtbWVudWNvbmZpZy1tY29uZi1jZmctQWxsb3ctc3BlY2lmaWNhdGlvbi1vZi1uY3Vyc2VzLWxv
Y2F0aW9uLnBhdGNoIFwNCj4+Pj4+ICsgICAgIg0KPj4+Pj4gKw0KPj4+Pj4gK0xJQ19GSUxFU19D
SEtTVU0gPz0gImZpbGU6Ly9DT1BZSU5HO21kNT00MTk3MzllMzI1YTUwZjNkN2I0NTAxMzM4ZTQ0
YTRlNSINCj4+Pj4+ICsNCj4+Pj4+ICtQViA9ICIke1hFTl9SRUx9K3N0YWJsZSR7U1JDUFZ9Ig0K
Pj4+Pj4gKw0KPj4+Pj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+Pj4+PiArDQo+Pj4+PiArREVG
QVVMVF9QUkVGRVJFTkNFID8/PSAiLTEiDQo+Pj4+PiArDQo+Pj4+PiArcmVxdWlyZSB4ZW4uaW5j
DQo+Pj4+PiArcmVxdWlyZSB4ZW4taHlwZXJ2aXNvci5pbmMNCj4+Pj4+IC0tDQo+Pj4+PiAyLjI1
LjENCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IElNUE9SVEFOVCBOT1RJ
Q0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNv
bmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVz
ZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGlu
IGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCj4+DQo+Pg0KPj4NCj4+IC0tDQo+PiAtIFRob3Ugc2hh
bHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdh
aXQNCj4+IHRoZWUgYXQgaXRzIGVuZA0KPj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5k
YWxmLCBTdGFyIFRyZWsgSUkNCj4NCj4gDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50
cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQg
bWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlz
Y2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1
cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRo
YW5rIHlvdS4NCg==

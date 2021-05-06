Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web11.1289.1620316134253899940
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6Ow8mQHh;
 spf=pass (domain: arm.com, ip: 40.107.6.87, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db+wbUt0OSZioEylZhczcJxEDlrZisdVUX0x1m3b8rA=;
 b=6Ow8mQHhw7tJhTwJCCP9C/AQ8GcYlkOpzgr98ux9Ih3DV3W2znYECky8M4aPW5NHjE4N4aDgoJ09imaS/HDf/TUhskpRQzNdYMQz3nVTrgfx0ANZBk9ggJdWXejhI9zhmw4hG/zBB7R4dKKG4lKu2zlIZEh/6NJx1IbGFo4Mp0s=
Received: from MR2P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::31) by
 AS8PR08MB7252.eurprd08.prod.outlook.com (2603:10a6:20b:343::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 15:48:48 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::6c) by MR2P264CA0192.outlook.office365.com
 (2603:10a6:501::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 15:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:48:48 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91"); Thu, 06 May 2021 15:48:47 +0000
X-CR-MTA-TID: 64aa7808
Received: from 0d567b16b279.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AB324F81-B75D-442E-B842-DFB9A72183C8.1;
	Thu, 06 May 2021 15:48:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d567b16b279.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 May 2021 15:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEpAPCw4hrHCWHapwRwS/XLqJUtn0Au5TXpxzYK5bWOEkHtH/bvN2xjZM9x7Wim/WLQ8f/DJDE8gJ/23GJjhOAE6Oa0wZOA3Fj48uW1ZOCw2cwtlnizfqxpAlSTfFyFQmMYXOkm1mNm20RWV9PoN8phw6+4C7GcwHeN6kpRDpXI6QL/b2c8xOpbhGwqqQlwzaer7yNOh1rbzEGyNPvjNtxRkM50wW+XtuBV7+9xWma0mpJW64f3yyEhHbGfBFoLaxGQo4i916g596kNmmkoND9ZHpSFaY/d1Kj/12ZS+LqDzZxUpCejYOAnRCn/46jO89AJFEUugCWkitx9GHdsWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db+wbUt0OSZioEylZhczcJxEDlrZisdVUX0x1m3b8rA=;
 b=GUw6tp13tRfWnckttWAMWuYxHcmuPf4aqa/EnOkEFhKcZXzYRkAR7dmJ77dZNX52getul19zNv1Fy9PlUARax/12tF6/Jkl8fmeN7nmNLbqAOn2TpgXra/wjAP3rPocHuFKezUuRCEGfGSFZFp9eg+3zARJWwBN+qHlYjo3/6QLqkVzDJGmhKbKixl0UVIXkpDGocdv3vEdPak1tuKucIjyPiIGz5YSSKjYN5rlyOVncFsNbPOaizLndwPXhqFNkdoFy5gRkRR/I5Ae4lIQbCAj25ZGQyjdfWnW32sPJqjE+Zzo9kLTS8POXwqCEeHecKj3A0rQiYDBkHSzuj33QLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db+wbUt0OSZioEylZhczcJxEDlrZisdVUX0x1m3b8rA=;
 b=6Ow8mQHhw7tJhTwJCCP9C/AQ8GcYlkOpzgr98ux9Ih3DV3W2znYECky8M4aPW5NHjE4N4aDgoJ09imaS/HDf/TUhskpRQzNdYMQz3nVTrgfx0ANZBk9ggJdWXejhI9zhmw4hG/zBB7R4dKKG4lKu2zlIZEh/6NJx1IbGFo4Mp0s=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4738.eurprd08.prod.outlook.com (2603:10a6:20b:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 15:48:40 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 15:48:40 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Christopher Clark
	<christopher.w.clark@gmail.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter to workaround when compiling with gcc-11
Thread-Topic: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter
 to workaround when compiling with gcc-11
Thread-Index: AQHXQo3N9ol4mEj3oE+3WJPm6lGv6qrWmCeAgAAAqJA=
Date: Thu, 6 May 2021 15:48:40 +0000
Message-ID: 
 <AM6PR08MB3461DD67AAB435B31A06EC7592589@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <aa94d0e5d2b32687aeb60654ca22ac0d009fb8d7.1620315173.git.diego.sueiro@arm.com>
 <CADkTA4PBqriL1Dc6ihF7wdf+RhTBJjg4sU2bw9z1oXcRSGFngg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PBqriL1Dc6ihF7wdf+RhTBJjg4sU2bw9z1oXcRSGFngg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 664E026F8D6A0243A1F1FF1064EE81A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [5.68.2.5]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d68e5db8-4f3b-4942-baa4-08d910a67035
x-ms-traffictypediagnostic: AM6PR08MB4738:|AS8PR08MB7252:
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB7252A762935DFD95EF0BA7C792589@AS8PR08MB7252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 h5lUKwLe6ukUkpRazGgqRq5IM6fW6X7h56XxeiTQpu8LnSIEOkOhtnvcBYZNCgwUxViZHPzcDDB9BVb3von6lofnhSXlgBRxSbpbObj8l0Cr9Y0PbZmcP8VlVur720wvQr6TjYbMYj6/BQcFhWfplEsjdDgc+Exgytigqi5kNZZXkPpbZjMFEFFQQxn8mdZ71xHH0CCS4UDr3Z2T0sAV8wM5cAdIlByDybO+Y5z0ysWAknfrS1G6ByALUHHWBQjrTvOBxQTjMA+u+uU2390+c4iLu+F8QxCjRxnerIAql6fB9KS0t0Doq51xd2IQ9TksPhYpTOI5ZLJfhw16zZiuU0l7EqRj5DalVXYNfH38Sc5Dw2ASskTBcr2QO1riRk+JgFbz6OqjqebzqysIYNs6t6BqJKzjJ6BHwr24iC85ZcjDJIsg7v1Kba1S7X2idQOIlsajEUqpNVCHzotOJceVWVfOFRCvV6gzTPFvqT0E7K3TnP/AsKwPDIylokTsApGCNK1eg4nuDxpumwZkoKvIvBkcVY4beXHBftykq+C8SW2pgmCaddBwbMvQQ1yAkD6o64O/NU5ufCoZLJ6VKuVa1ne2MUXoTdEc6SIuRPrz6syn/v6r0rR6OFWlmwwa1SPrp7WqQPDVeXyVDV6VG4Nf/AnuSDK6MN85ZkgJuNMKwe9N8bFNo/X6ZcUefSBq5JGT
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(2906002)(64756008)(86362001)(6916009)(66476007)(5660300002)(52536014)(76116006)(66446008)(66556008)(66946007)(33656002)(55016002)(122000001)(38100700002)(9686003)(7696005)(186003)(6506007)(478600001)(316002)(54906003)(8676002)(8936002)(4326008)(26005)(55236004)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?N1UyRVJWdHhMaGVySGdoMTliTWtLbnJHU2VqMTk4ZCtNK1hCM3lTb0MyTDBu?=
 =?utf-8?B?Wm0xbm1PZ3JNTEJ4dE0wMmthZ3dwYXkwYk56Sy9rczRoWmRwUzY1aUFIZExl?=
 =?utf-8?B?cE9FeHd2L09DVUtibkxQdU9najFDYkVHUiswRDM2MEltQm94LzFKWE02K1lz?=
 =?utf-8?B?MjFVRUZtZGdmbktwb0hqM2N4YSthYmM2cDlmem1KRkJHL1hJanZ0SXFpZU9r?=
 =?utf-8?B?QS9aenFtQmhqdW9ScFJQbEJTNjBiVVBNRUpseHRwQWhvNDdna1hDRjU1SWwy?=
 =?utf-8?B?S1lLNFhjbThCR3hlaG0wU3FUcmNYUmJEMHVNRDdYbnVqN1pPRGo0bGxiNGVM?=
 =?utf-8?B?VTUrUm9HaTg5aGMrTWI2S1djS044MWJBZmtsZ3BDVi9qVGIrd2FIdHYvei9K?=
 =?utf-8?B?cDV4UHhHNUg5aERwMVpKZnR5TC9tUE1tZFgxWURYalRheU1SOTdiMmJuS0d4?=
 =?utf-8?B?NE9RYUQ5U081TGpoVWxQY1duMHR2b1pXZ1JoTy9BZHhSNUN1OWp5ekxrUXk4?=
 =?utf-8?B?czFIVnRZMUc0N1hNbmd3Q0NnYi9pQWFkNExWMnlsU1pVRFlQNVZpeVBCSVc1?=
 =?utf-8?B?NUNFV1M0SDdzT08xcWpPQzdMSWx0dURWUTFKT0xLZ05oOWhITlNQdHRDeGpp?=
 =?utf-8?B?OUxoTys0MGZDRXJwakl1cDdqQ1c4ajBuTVdZYU1lWnFqQlBPLzVyMm1xUi9i?=
 =?utf-8?B?amJLNk0vSGM2b3RrclN0NHlTUnZRc3pPblZtcTNyeDYxd0tMSlVGMlQwUEt4?=
 =?utf-8?B?TnA5Q2dubWV4dGZPNEpmQ1A5WW9yMUVGT0lqTmJQOGlMbEl1ejRXNkl6L3BZ?=
 =?utf-8?B?b0lDZXhubGR4dVFkSTZNZE1QeVhqNGNqaHF1L1JoVzlGNEYwTzZETWZScW5m?=
 =?utf-8?B?b01kRXdmbjFRL2V2OG9tSlBLdDU0TmpWNWNMWGlsZkNscW4vUnowbWV3Z0c2?=
 =?utf-8?B?eDVVZ2gzenowdXZ4YWVsQTdtbUxLMWFHU2RLby9wMEhrMlZ2OWEwT2tqRVRh?=
 =?utf-8?B?Uk1qT2xQWDM2OGNsZlZXZmlMMVNPM2dNRDJ3ZncySmdhcFlnVTJaMlFzUmo3?=
 =?utf-8?B?QTNuYzN2U0J3MnlYRTQzdWpyOUpqcE1KRERGeDJvN0RNVkxRQWlleUdjaHBm?=
 =?utf-8?B?eERMNDR5cUJKYUZScDRPZ1gzK1pIek9CRFp5RUtYdTBhVmtSQVk1ZVJrTXla?=
 =?utf-8?B?ZFhmU25QVm5pbFY4bHdxWWtna1FoVTZmaVdiNTFiTnBmbFhlNkhXWTkyaVJy?=
 =?utf-8?B?WEJSb0NtWkxTL3FDVXh6Wkgra04weU5nUU02dWxQb0hqa1oxTVJwZXR3WnZz?=
 =?utf-8?B?bmF6WTA4aGMxL2ZhZkQ3a3BDQVZSa1l3cFVNTlg1MlQzVTg4eVIwVFlqcklv?=
 =?utf-8?B?OThDU2E5UVRtZWJXSVlKUHIzR3lhL3IxT1Z5aWMzTlRyMndkdUxFVUl6TWJC?=
 =?utf-8?B?Q01jRjVEV1NpVkhyMjA3UWl4OHludUg4c1VMZm9TK0oxK3F0Z28zOVhJRW55?=
 =?utf-8?B?UzF1UTJoV0dKOEk0RGx5SnFxaUFNdzZ6b2g2M1YwTVFiaVlzM2NTc09RMS8z?=
 =?utf-8?B?Tk9RZmcrK0JFVDZTMkNqWmg1dlBGcS92c1h6NTRpV3dSS0lBQmlHVGx0VXdC?=
 =?utf-8?B?RmlBdE9DaFhzTDVIYUdDbGExVzRpK1RzUGExZHRTSXJsYUREd3F3TVgxRk14?=
 =?utf-8?B?dXh2dSt3ejlWUnhrbm5SVlJZbTNVQWtDK1FCSkhlcG9zMDZqQ3B3akorZEpr?=
 =?utf-8?Q?TuiQ0DL5DSy4TJYkTo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4738
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90ae5c18-c4c9-4fe6-a453-08d910a66bbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j1FBGcNox9/nrYagAm/4anMCF0PHXxkX3p/Ep1yy+QPaGobzIDC+l1psxPLaikSS4me/XQFlVe6ZuhGlcsMC+q9+y41YQVq/kUs1fVnKvUL9zj7nzrRtC45sWq0TZCtEZ8TtYvCQkRKdbnvzesAT96t+KhSYSdPO+G3kQmexYfABj9eWh3RG+e8DZCL3BH5sFkuFpiCDFI6nAsgt36bqX2v96tJaMDqNOoJuf/sygrpit5VJzuhhsb4WlF7wSFEHTTqax+3fLuK9PG5hoN0TbtWsGRVBZHptNL6zppTnreOSTmKa8Q1M1einY/bCgvIchNRcX5GiN8X8uhdaV9o40OGk7ILw9U+5X7ZDJzGCxtoZbRtaaxlmn3uChKBVHaIAdJFah8SgfCxFgsYo50/A255t2P7eXi5L1b0VCItg57KFKoMpjY3BoWWurQfIhrHnuQe/5COjStDxETqjlCyiFnDZ62TwEGJE5zEYpg2lm1CtoawuGJH6q3BpLcbwzXS6ZKQC7KbCXRU8m8POE1qvCm1Kk2x2lvtqAHxWu3M16Hou0SGvxiTBzT1NryZ9HHh3JBSWMyCSclYsG9o/euvtgQakD9YwFmdBh34M5Hg++xXy7Ej5YAGfoiojUGvF7g9j3UJGln44S9/q9zxlfcSpOYUbcfafA6vTaV7/U4P7pXDjqmCeor78NBFrRiZp81gFbeMb0oxOdW7YHVLeS17Xu27XwDES5K72q+sAbYiBpxQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(336012)(356005)(81166007)(82740400003)(70586007)(70206006)(478600001)(82310400003)(55236004)(26005)(83380400001)(86362001)(36860700001)(54906003)(33656002)(7696005)(186003)(52536014)(4326008)(8676002)(5660300002)(47076005)(6862004)(2906002)(55016002)(9686003)(8936002)(6506007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:48:48.1538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d68e5db8-4f3b-4942-baa4-08d910a67035
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7252
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPnZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZSBBc2hmaWVsZCB2aWENCj5saXN0cy55b2N0
b3Byb2plY3Qub3JnDQo+U2VudDogMDYgTWF5IDIwMjEgMTY6NDQNCj5UbzogRGllZ28gU3VlaXJv
IDxEaWVnby5TdWVpcm9AYXJtLmNvbT4NCj5DYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55
b2N0b3Byb2plY3Qub3JnOyBDaHJpc3RvcGhlciBDbGFyaw0KPjxjaHJpc3RvcGhlci53LmNsYXJr
QGdtYWlsLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPlN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFs
aXphdGlvbl1bUEFUQ0hdIHhlbi10b29sczogUGFzcyAtV25vLXZsYS1wYXJhbWV0ZXINCj50byB3
b3JrYXJvdW5kIHdoZW4gY29tcGlsaW5nIHdpdGggZ2NjLTExDQo+DQo+Um9zcyBhbHNvIG1lbnRp
b25lZCBvbiBJUkMsIHRoYXQgZmVkb3JhIGlzIGNvb2tpbmcgc29tZXRoaW5nIHVwOg0KPg0KPmh0
dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3JwbXMveGVuL2Jsb2IvcmF3aGlkZS9mL3hlbi5n
Y2MxMS5maXhlcy5wYXRjaA0KPg0KPkJ1dCBJIGhhdmUgbm8gaWRlYSBhYm91dCB0aGUgdXBzdHJl
YW0gc3RhdHVzLCBldGMuDQo+DQoNCkknbSBub3QgY29tZm9ydGFibGUgaW4gYWRkaW5nIHRoZSBt
ZW50aW9uZWQgcGF0Y2ggc2luY2UgdGVzdHMgbmVlZCB0byBiZQ0KZG9uZSB0byBlbnN1cmUgdGhh
dCBpdCBkb2VzIG5vdCBpbnRyb2R1Y2UgYW55IHJlZ3Jlc3Npb25zLg0KDQotLQ0KRGllZ28NCg0K
PkJydWNlDQo+DQo+T24gVGh1LCBNYXkgNiwgMjAyMSBhdCAxMTozOCBBTSBEaWVnbyBTdWVpcm8g
PGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KPndyb3RlOg0KPj4NCj4+IFdoZW4gY29tcGlsaW5nIHhl
bi10b29scyAoNC4xNCBhbmQgNC4xNSkgd2l0aCBnY2MtMTEgdGhlIGZvbGxvd2luZw0KPj4ga2lu
ZCBvZiBlcnJvcnMgYXJlIHByb2R1Y2VkOg0KPj4NCj4+IGxpbnV4LmM6MTY0OjUwOiBlcnJvcjog
YXJndW1lbnQgNyBvZiB0eXBlICdjb25zdCB4ZW5fcGZuX3RbXScge2FrYSAnY29uc3QgbG9uZw0K
PnVuc2lnbmVkIGludFtdJ30gZGVjbGFyZWQgYXMgYW4gb3JkaW5hcnkgYXJyYXkgWy1XZXJyb3I9
dmxhLXBhcmFtZXRlcl0NCj4+ICAgMTY0IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgeGVuX3Bmbl90IGFyclsvKm51bSovXSwgaW50IGVyclsvKm51bSovXSkNCj4+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fl5+
fn5+fn5+fn5+fg0KPj4NCj4+IFdvcmthcm91bmQgaXQgYnkgcGFzc2luZyAtV25vLXZsYS1wYXJh
bWV0ZXIgdG8gdGhlIGNvbXBpbGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERpZWdvIFN1ZWly
byA8ZGllZ28uc3VlaXJvQGFybS5jb20+DQo+PiAtLS0NCj4+ICByZWNpcGVzLWV4dGVuZGVkL3hl
bi94ZW4tdG9vbHMuaW5jIHwgNSArKysrLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRl
ZC94ZW4veGVuLXRvb2xzLmluYw0KPj4gYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHMu
aW5jDQo+PiBpbmRleCAzNTYwZTc5Li5lOTM5YzQ1IDEwMDY0NA0KPj4gLS0tIGEvcmVjaXBlcy1l
eHRlbmRlZC94ZW4veGVuLXRvb2xzLmluYw0KPj4gKysrIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4v
eGVuLXRvb2xzLmluYw0KPj4gQEAgLTcyNSw5ICs3MjUsMTIgQEAgZG9fY29uZmlndXJlKCkgew0K
Pj4gICAgICBkb19jb25maWd1cmVfY29tbW9uDQo+PiAgfQ0KPj4NCj4+ICsjIFdvcmthcm91bmQg
d2hlbiBjb21waWxpbmcgd2l0aCBnY2MtMTENCj5FWFRSQV9DRkxBR1NfWEVOX1RPT0xTX2FwcGVu
ZA0KPj4gKz0gIiAtV25vLXZsYS1wYXJhbWV0ZXIiDQo+PiArDQo+PiAgZG9fY29tcGlsZSgpIHsN
Cj4+ICAgICAgY2QgJHtTfQ0KPj4gLSAgICBvZV9ydW5tYWtlIHRvb2xzIFBZVEhPTj0iJHtQWVRI
T059Ig0KPj4gKyAgICBvZV9ydW5tYWtlIHRvb2xzDQo+RVhUUkFfQ0ZMQUdTX1hFTl9UT09MUz0i
JHtFWFRSQV9DRkxBR1NfWEVOX1RPT0xTfSINCj5QWVRIT049IiR7UFlUSE9OfSINCj4+ICB9DQo+
Pg0KPj4gIGRvX2luc3RhbGwoKSB7DQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KPj4NCj4+DQo+Pg0K
Pg0KPg0KPi0tDQo+LSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9y
IGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQNCj5pdHMgZW5kDQo+LSAiVXNlIHRoZSBm
b3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==

Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EAEC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:31:38 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web11.127.1651674682799413091
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=BwcyQMV8;
 spf=pass (domain: arm.com, ip: 40.107.13.52, mailfrom: diego.sueiro@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UrfDxfmrMmY0W7m1pt8SNCwuI8zOu1ci6xZc1GuJynveTzVBjg5iwj4ugV78dEphqRDMMOJiUOHStmVheGS5ADqM8gN3chq3l8m1lLI3Kdrd63zC7IjZ12XBm0CDWKPLDeetFuK5AAxpim+Ri2EG0TAxKrlAaanqNKH1IhMzj7klks9aOdKwzQCH0fSoxrS57t6I6jr6Y2K9X7j9hbCfVZKGmajGL0jYuBorGl10+n2jfoFfjjdEFXprWLeAGktrXzuaz+Kocjs5nqRkogshUS1QbQAyvbUk9SDeqP+NRnUgVqBUIaC/WsNjZvtWC8FPOFANFJeWjthiqKb2L7CS8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eszIIeMIGYuunIc8yXuIGozKLzwYtGfy+MJkwuOFvEs=;
 b=MLaOR04QiiUkfnwjxfl7hqaPE8QTpbscLA4MhYrKlCckXSfahybYS3RL/VpmUSL1utIZZdMQMrLHJ1mghXEyPZSo5R0Er+qitTq9XP/tBeZsj5gmDb7YhmEqJY7S4oXVIw8t3ZyeHHjoJ3ZoxBPYg3h5/NvWjaOQuDp2m8jF0e6KnNE7VYkxuqzxxCec1TP+A4+SFHJtFjQ6s6VdK7Ikqsg3uNv1nkWGnXJPMGkv14pIYM5kfPAroa0NR2npDCNXtrdCIWXRYN56BfqYr4LSejZyU4tdHEi3ywaF+2tU4Mg20Y9ALTlPsj4nojX2uJC56YVjBWAvKL2NSrv7WNnQCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eszIIeMIGYuunIc8yXuIGozKLzwYtGfy+MJkwuOFvEs=;
 b=BwcyQMV8SyeWQjw7i4YCl/wFOaMChFAMUMafJ9o5dn+PJkbPBAH/wKpaL0hhnkAo2HwYOGWG5rsZzsQ5LqgQg6V9456tcVBS2205ZPNSqY3mXnYsS3K6U3HRkYrCMtUKVvJnps+f+kdTyWjA4U3jQjMBYCnX+5VVF+QvOxeykCE=
Received: from AM6P192CA0056.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::33)
 by HE1PR0801MB1835.eurprd08.prod.outlook.com (2603:10a6:3:7c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 4 May
 2022 14:31:10 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::75) by AM6P192CA0056.outlook.office365.com
 (2603:10a6:209:82::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 14:31:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 14:31:10 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 04 May 2022 14:31:09 +0000
X-CR-MTA-TID: 64aa7808
Received: from d4b8c9f3adc3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 431623E8-AB6D-4BDB-9004-D878DC72EB8E.1;
	Wed, 04 May 2022 14:30:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d4b8c9f3adc3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 May 2022 14:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0Yn8ljW6zvug67gfUSrhlNxzlDbM9OnhzazdsUT5kzxb3KXVzNWyGj1d8kd43BZexIFTtk2zqUKiYtOUYxZGgT+123LG3Uijx+XzyHEX6TWXKW6kN7YtQPdAwPHJEg0i+vlTzRhu3WjoaTNcw2L7ogF1xZRWHnIvuPolE9VOJm1s1UCSlE6aiXIfoUAx1VPs98S/5b/onY72lQw13MckNcPSfQHQQU3/EHWvVDy+/5scunlhrnRSRPtjyzp1OGpOJkwYvhR5zXf3P1iPWC/3XYSzbcRdVcvKSqNGSGlIp5aDp6W4UvP3LsH/Afp6COBIKPLRHrtWB2Cu0ep5p1kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eszIIeMIGYuunIc8yXuIGozKLzwYtGfy+MJkwuOFvEs=;
 b=UGZZnJMExqb+FUY8mrMw0Ur4NE8PmtPG6NCW5IBlhmczdN8OV8azepw1ga+LMYahrEAugdCtwpXAoD5Up9bo+DvwTLGdRXJjRn4hmoQscANs58Q+j7kOjFN1/Y3Kw3ploKTRDpIGdHFu2jadp/a6WSDFE1LfSNVefjdBTZBCz43tVE8dod68MHYXZLMqs7fImwkQZN+q5WWQrvg06ZiJKUWzF5NCjky8LGak5QkzUuK/NWxTmf30/T9TyEokScVv9XIu/Aw548hfudPz0IYw2v0zQoXOIW4eSdhkavh8rs5/OMBAyyYI1a4qLs9RQOzzp/9+QSGrmVajfVmTcoiTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eszIIeMIGYuunIc8yXuIGozKLzwYtGfy+MJkwuOFvEs=;
 b=BwcyQMV8SyeWQjw7i4YCl/wFOaMChFAMUMafJ9o5dn+PJkbPBAH/wKpaL0hhnkAo2HwYOGWG5rsZzsQ5LqgQg6V9456tcVBS2205ZPNSqY3mXnYsS3K6U3HRkYrCMtUKVvJnps+f+kdTyWjA4U3jQjMBYCnX+5VVF+QvOxeykCE=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by VI1PR08MB3487.eurprd08.prod.outlook.com (2603:10a6:803:88::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Wed, 4 May
 2022 14:30:52 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7%2]) with mapi id 15.20.5206.014; Wed, 4 May 2022
 14:30:52 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Richard Neill
	<Richard.Neill@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: RE: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Topic: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Index: AQHYX8CS44bd/TpvUkyDmVWSlAxM/a0OxnCAgAAAXZA=
Date: Wed, 4 May 2022 14:30:52 +0000
Message-ID: 
 <AM6PR08MB34615D470F44C038458E30DB92C39@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20220504140917.623536-1-richard.neill@arm.com>
 <CADkTA4MRs3UWyZYOAEcSuSsnDfuyL+38e_OJOi8W-898jCUxxg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MRs3UWyZYOAEcSuSsnDfuyL+38e_OJOi8W-898jCUxxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 6CF894D5B3C73F4389B3C9E679084D71.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 056c1ba8-0b01-445a-0ecd-08da2ddabba9
x-ms-traffictypediagnostic: 
	VI1PR08MB3487:EE_|AM5EUR03FT013:EE_|HE1PR0801MB1835:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB18355E84EBE4FB8AB3F68CE592C39@HE1PR0801MB1835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZSnEDPjx85L6COha98yoWFTe3SNrj2hpZ8Kv4yvnpGTy/BnZc+oIVUrxwBXXEiPmN+3dUT8Qv6gSZ3Dxp0PrIOCqiZTAIjqiRnbgt1yqdhVmThvdFCr/zKIW6npBI1W0lkpVjh/IHdmqbLCv9XVj0IlQq358FCe3hXFOO5PVcTHufhSqBTAp7LKDJi8a6jzX/+Y+rzfyr9Ze07IifNrog5K1dnNhHh445PplTz2xuYULn8+FvDoRSu3fj+kVO7YpXaDrv/Up55A2k92vN3UD2ZLFAS/Frj1w2LJxkgPnjt8mdZMTQO8yyKw/HZDFfYRUlKgrCh3HUfC/eoWxhyFMKbXm74s3W7Y5mSoYIofc1k65e0BK4qRdPogWNYx590o4fjPp7r1xGMhYreQnqRL52vNhhIumgDsBc1aqiXuRNjQjatSzgB37KCkpPcrw/YUSM66gQzo412xvjS6hCQrSn/3cwHutioZLQlhWY9EyKbBMQGJGnQM4dsFFDG5z9e4PRo4QLtJ5ey5b1tLsZwnh/WvoxF/gKdrR2CjeFInt4pZZ+fwzyEq+evt9oPIzEUSfBShFbQG4vbQDyT3+RiJ7ovEEPu4GZoQQbkVdLeQlmmc3K0yyOEf0YsoEASyQuNb+CMjrzq9/i00FCX0P2UT27VZVCjUGqP98riaTubtXLMyDoI+3+c6pPp89oh5tB3sUHDxQCz1oL8jqv5qPbke12SkP/K/cqjJUic0wJDSivomoBOcOEsTOLdnL0V3co1eACGlovxLB1rSadM+cCNZsIkKdh3LvNwZqnWz8WOUVFJxTPODISWIREhz2atCrlScl
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6636002)(66476007)(64756008)(316002)(66556008)(66446008)(8676002)(66946007)(4326008)(76116006)(508600001)(26005)(55236004)(71200400001)(6506007)(38100700002)(38070700005)(9686003)(186003)(110136005)(122000001)(54906003)(33656002)(5660300002)(83380400001)(8936002)(52536014)(2906002)(55016003)(7696005)(547064002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3487
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b34acc26-22c7-4547-7e83-08da2ddab12a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	js8WD6pewyljQTaBIyqMD5Kbd6FnioJFDUvV0k5lLcZ12qjCiHaoMCv36H/KrAkSYX8DIjml6jdZUiYMAj3ubHayEg/okVhMWbVX7KGAjRA5fysYS5sKpSLJDGL4umtWxZaa7Bq5aGxb67fO9worl/BUP2lZ8yI5K5ImGJwR8BjmEMq8g8owP5syKy2BBuOqLbVWr6/8cEyd+I293GbdZeT0PlKbhk0aF25HXG75weC3QnqKV8pUoOfc0YsH1Sk1S8/25Cn+aqGnV2jhwzEKD/EEQRVqJWrR8cz1rwBoLS6bC0A0CpWtbe2RjZSyHi66RwD61qfySKpaFo725NcpP+aD+p5KuyZIXkuilBjscB0mfqH2T2nWCysKLL8fdVktk5QcwJYnTkrcTcwo4RHQZAY9i6Qa/TKAr0Z1wnS/o/+ouncOKsz2ybnU3TRGxA1EBqoxK3Ig6+9P8odFEVqAQV6ERIkFpaCuIgkZV14rzgV7lpnX+Deis74EDiz0pu+8IWtKtgCrHr5hhsVX+F3Q/sxGWq0qRJkGElA1WMUKgPTSFJdMsixU9HcVETHFfIMOOdER+gvSCdgYBjrIfUqQNL+CnyknlGj5daGZ1ZvmGpMReWoilGbNW/LC0lOW8FmIgHXfLKJatHZFyo8pVVXmzi2rPDn9iB9yJUBD6COmFnrtzi/SZGY4PNXreG1HEj9FoGCGTk8jRF/VqcPgXSTPrlZaozdkGwmCaQwA0NerM1z9nycvIzzBHWR/hsQGWzZyN9Bs7fmY0OFFm1ORvZrtg5EnFn1k5KO2SCXHW9RkvgI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70586007)(70206006)(2906002)(47076005)(82310400005)(4326008)(8676002)(52536014)(6636002)(356005)(316002)(86362001)(26005)(81166007)(33656002)(40460700003)(8936002)(5660300002)(36860700001)(508600001)(54906003)(110136005)(83380400001)(336012)(186003)(6506007)(55016003)(9686003)(7696005)(547064002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 14:31:10.0260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 056c1ba8-0b01-445a-0ecd-08da2ddabba9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1835
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 14:31:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7244

SGkgQnJ1Y2UsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG1ldGEtdmly
dHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS0NCj52aXJ0dWFsaXphdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQnJ1Y2UgQXNoZmllbGQgdmlh
DQo+bGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPlNlbnQ6IDA0IE1heSAyMDIyIDE1OjI3DQo+VG86
IFJpY2hhcmQgTmVpbGwgPFJpY2hhcmQuTmVpbGxAYXJtLmNvbT4NCj5DYzogbWV0YS12aXJ0dWFs
aXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBuZCA8bmRAYXJtLmNvbT4NCj5TdWJqZWN0
OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFtQQVRDSF0gZG9ja2VyOiBBZGQgcnVudGltZSBw
cm92aWRlIGZvcg0KPnZpcnR1YWwtZG9ja2VyDQo+DQo+T24gV2VkLCBNYXkgNCwgMjAyMiBhdCAx
MDowOSBBTSBSaWNoYXJkIE5laWxsIDxyaWNoYXJkLm5laWxsQGFybS5jb20+DQo+d3JvdGU6DQo+
Pg0KPj4gVGhpcyBwYXRjaCBlbmFibGVzIHN1Y2Nlc3NmdWwgcnVudGltZS1kZXBlbmRlbmN5IG9u
IHRoZSBEb2NrZXINCj4+IHByZWZlcnJlZCBwcm92aWRlciwgYXMgdmlydHVhbC9kb2NrZXIgZG9l
cyBub3QgcmVzb2x2ZS4gRG9pbmcgc28NCj4+IGFsaWducyB3aXRoIG90aGVyIHZpcnR1YWwgcGFj
a2FnZSBwcm92aWRlcnMgKGUuZy4gdmlydHVhbC1ydW5jKSwgYW5kDQo+PiBmb2xsb3dzIHRoZSBZ
b2N0byBQcm9qZWN0IGRvY3VtZW50YXRpb24NCj4+IChodHRwczovL2RvY3MueW9jdG9wcm9qZWN0
Lm9yZy9zaW5nbGVpbmRleC5odG1sI3ZpcnR1YWwtcnVudGltZS1wcm92aWRlcykuDQo+DQo+V2Ug
ZG9uJ3QgaGF2ZSBhIHZpcnR1YWwtZG9ja2VyIHJwcm92aWRlcyBieSBkZXNpZ24uIFNpbmNlIHRo
ZXJlIGFyZQ0KPmRpZmZlcmVuY2VzDQo+KGhpc3RvcmljYWxseSkgYmV0d2VlbiBkb2NrZXItY2Ug
YW5kIGRvY2tlci1tb2J5Lg0KPg0KPllvdXIgcGFja2FnZSBsaXN0cyBhbmQgaW1hZ2VzIHNob3Vs
ZCBiZSByZWZlcnJpbmcgdG8gdGhlIG9uZSB0aGV5IHdhbnQsIG5vdA0KPnZpcnR1YWwtZG9ja2Vy
IGFzIGEgcmRlcGVuZHMuDQoNCkluIHRoaXMgY2FzZSBoYXZpbmcgYCBQUkVGRVJSRURfUFJPVklE
RVJfdmlydHVhbC9kb2NrZXIgPz0gImRvY2tlci1jZSJgIGFuZCBgIFBST1ZJREVTICs9ICJ2aXJ0
dWFsL2RvY2tlciJgIGlzIHVzZWxlc3M/DQoNCi0tDQpEaWVnbw0KDQo+DQo+QnJ1Y2UNCj4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIE5laWxsIDxyaWNoYXJkLm5laWxsQGFybS5jb20+
DQo+PiAtLS0NCj4+ICByZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlci5pbmMgfCAxICsN
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
cmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jDQo+PiBiL3JlY2lwZXMtY29udGFp
bmVycy9kb2NrZXIvZG9ja2VyLmluYw0KPj4gaW5kZXggNDBhMzY0Mi4uZTE5NmY5YiAxMDA2NDQN
Cj4+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXIvZG9ja2VyLmluYw0KPj4gKysrIGIv
cmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jDQo+PiBAQCAtMzIsNiArMzIsNyBA
QCBSREVQRU5EUzoke1BOfSArPSAidmlydHVhbC1jb250YWluZXJkIHZpcnR1YWwtcnVuYyINCj4+
ICBSUkVDT01NRU5EUzoke1BOfSA9ICJrZXJuZWwtbW9kdWxlLWRtLXRoaW4tcG9vbCBrZXJuZWwt
bW9kdWxlLW5mLQ0KPm5hdCBrZXJuZWwtbW9kdWxlLW5mLWNvbm50cmFjay1uZXRsaW5rIGtlcm5l
bC1tb2R1bGUteHQtYWRkcnR5cGUga2VybmVsLQ0KPm1vZHVsZS14dC1tYXNxdWVyYWRlIg0KPj4N
Cj4+ICBQUk9WSURFUyArPSAidmlydHVhbC9kb2NrZXIiDQo+PiArUlBST1ZJREVTOiR7UE59ICs9
ICJ2aXJ0dWFsLWRvY2tlciINCj4+DQo+PiAgIyB3ZSB3YW50IGFsbCB0aGUgZG9ja2VyIHZhcmlh
bnQgcmVjcGVzIHRvIGJlIGluc3RhbGxhYmxlIHZpYSAiZG9ja2VyIg0KPj4gIFBBQ0tBR0VfTkFN
RSA9ICJkb2NrZXIiDQo+PiAtLQ0KPj4gMi4yNS4xDQo+Pg0KPj4NCj4+DQo+Pg0KPg0KPg0KPi0t
DQo+LSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFu
ZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQNCj5pdHMgZW5kDQo+LSAiVXNlIHRoZSBmb3JjZSBIYXJy
eSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==


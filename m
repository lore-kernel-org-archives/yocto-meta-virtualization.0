Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web12.18815.1597250631942411613
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 09:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wSqYLJ6Y;
 spf=pass (domain: arm.com, ip: 40.107.8.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3IyPnpke5kYS4r3nyxGT7acVIm+kam2Z/G75qq5hdc=;
 b=wSqYLJ6YSpqTDaUs1kWFwoVqZoLVmpExinmF55gRM9ZI79qTQaK31OgsuS/Hm8ULWpppboELg1x7YlpUjgRFUPcyubPyzeE8Viwr8nm7vTpTpQHe0+6RAiP804xqqxHYCJBrzU6Q8bPZq69QTgkuxLb1lAk4WLRODTlfr+XSBf4=
Received: from AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17)
 by HE1PR08MB2937.eurprd08.prod.outlook.com (2603:10a6:7:2d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 12 Aug
 2020 16:43:49 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::d3) by AM5PR04CA0004.outlook.office365.com
 (2603:10a6:206:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Wed, 12 Aug 2020 16:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 16:43:49 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Wed, 12 Aug 2020 16:43:48 +0000
X-CR-MTA-TID: 64aa7808
Received: from f54c1d675f29.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 917E2F4B-1785-4394-99F3-12891DB1D75D.1;
	Wed, 12 Aug 2020 16:43:43 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f54c1d675f29.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Aug 2020 16:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PM613qbiqZdDjkKMcvtmrXtecrQRaBlK/vQOOZqe8KZPSGycz0kDSlX0LZtrSG57AWNGMJqRBOiuizYHTMz8AzEoHXZSWs2J/aZDZCcdr1szq3+Yl82AymjzBPBqvl482jeyvhkD0mw8UAd6cV19NPV8pJZu3TJrxzKtaqAcSayzy9G/renQVmZq4Y+X/96yLAfK9laIkQJc77tx5GADCEM+zEO/oLovB7ib1Y6jLh68CuHiNTMnHXaJLLJ8NbGIgiUf09lwu7ivc/YquKaY7gF6u70fsdpRAFKlSuHowjzYF938WOEfNMXp+YMlNHJWnNYdBa1CJQHCxCwgTdpBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3IyPnpke5kYS4r3nyxGT7acVIm+kam2Z/G75qq5hdc=;
 b=cnAhnUPXJRFrS3eWT9QocPeybpm5J51/xCrtyd6DoTqHLrYzqPR6Rv2+YPk4Cs6IWi9tSTf8Bp+xsAvuPL+YuX5FxKT+4B6TpTZeCV56oLe45H3Awj7cir7VRtiqUrWSJ/jqmYeGSVT2CWZhsGMYivxNzh7w8Pa/d+25V8Lb3B/44eZ1zqHej1TfDSbkAk4BQWI97EEYMZUfv+tgGkgLioGnKFfoH8OzIiJz3q1DGA/xBsCPPq1ZFymWLhCThyvwifB+GttupjmHInl5j9MnjgKDxGuF0cV65UOZUVRXbbbQ7GcUFHQAWT0HS+3INATPEWsN6IlPCLWRYA/XT4Uhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3IyPnpke5kYS4r3nyxGT7acVIm+kam2Z/G75qq5hdc=;
 b=wSqYLJ6YSpqTDaUs1kWFwoVqZoLVmpExinmF55gRM9ZI79qTQaK31OgsuS/Hm8ULWpppboELg1x7YlpUjgRFUPcyubPyzeE8Viwr8nm7vTpTpQHe0+6RAiP804xqqxHYCJBrzU6Q8bPZq69QTgkuxLb1lAk4WLRODTlfr+XSBf4=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1619.eurprd08.prod.outlook.com (2603:10a6:203:3b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Wed, 12 Aug
 2020 16:43:42 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 16:43:42 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, Doug Goldstein
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH 2/2] xen: Add support for config fragments and diffconfig
Thread-Topic: [meta-virtualization][PATCH 2/2] xen: Add support for config
 fragments and diffconfig
Thread-Index: AQHWamMbKTMZF1Z0P0mgO6PZvkH5QKkpCtUAgAANbGCAC6H+sA==
Date: Wed, 12 Aug 2020 16:43:42 +0000
Message-ID: 
 <AM6PR08MB34611A990C49A78F3C45FAFD92420@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
 <1596547693-87664-2-git-send-email-diego.sueiro@arm.com>
 <CACMJ4GayxGn82iNWFTELQ=8=QrdfNq4MojWDTdSGxjJUZteLBw@mail.gmail.com>
 <16284DF874C5220F.19850@lists.yoctoproject.org>
In-Reply-To: <16284DF874C5220F.19850@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: b5446383-3309-4734-adfb-9c33e973eed5.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 973acf74-774b-44f7-d8ac-08d83edee363
x-ms-traffictypediagnostic: AM5PR0801MB1619:|HE1PR08MB2937:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB2937C6710246317FEF65B1AA92420@HE1PR08MB2937.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iOEwbo9O7oSsSjsghUz4qHqVHlGsTN/DXsirUlSJ4SzatAH6MRlHYGF6Ib62Mn+qzmcF8ivB9w6EFyv27+T2kIHrWrf/sTc1rlQpWD8mDgoHqe7I7fW8OwrlRKt275NUXU1WVpQU7+c48g3TeZSd4CjxAUoZIbpjIst8UrWadhya5Y4E4d4w9GdMsrqf2dBANITQmMYGfksiFXCiUMyuVBFJjqII4DS9ykuJHzhym3rijL6iBdT/Q4rDpcxZKSJzKydt8DylCB6j9tBixHWO8A3lq9+ixSmyoK1tX4XtqT68D4Hc3A6fbyWlBf/WKURqGeaMwKaZdQme+8kmBvr3f0T66esPqrJDQuNJifWlR1xefkwO4K3UspRY7qJWAm/t+XgUfls3IcAFPo8hNSVu+Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(2906002)(4326008)(66446008)(64756008)(66556008)(316002)(66476007)(83380400001)(76116006)(71200400001)(186003)(26005)(6506007)(66946007)(52536014)(33656002)(54906003)(9686003)(110136005)(8676002)(7696005)(86362001)(5660300002)(478600001)(55016002)(8936002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 7zHmSKb3aU6Yaf/qvTtrXGR+E27H1hoFi7ZFURBIujs50OOTiQLkNRIqRF/2BKpyK1qwhU03llMf7UCVsPJszbYaX7G+jdGRrYjUsB5noVf0WyTLFA29XSUy5JIAGRFR2DOCpuGETuZS9CPbv9tehYWgdsjDY6ZlEuk9bCy5BNmn1ZdVTKzdGwY11lNcGvUj7d0uYWqLZIjmVv+JUXlAhtIqDaXoq0OkExpT9gWWgsaKyBjZZKU/4jBtJzAeB1ljuQ+Omp5v3sOZ882SaZWJGBDrIfOzIYoferaQddamVfZ2qBzjI2SCD+Jstxf8xUaH6QKc7m+LMMo+7KIZhN0u3CIGdshgeU7oiBX6l1HLQIq74vR89xt/xc1Yi5YYo/rLvS1/ifzqzsiADJdmYsdVODPcHNOYUCx37L6HvBBTRoE7LWIxTuh1ZcknJcFQNXHXLiSka6YnuI8I2op5BGbuFFPeshKlh3PtdaGW4TROUOoMpt2TTA/5Ypdmv19e106RZzUK/2bYJrwXYZtRl6qQ80sOJEFiHYJKmOTzbCHDaIdYhcudEJNK863b6zqfLexG/KwL3kOu89sVjWfcH9YiPyCxc0gI77bg7zGKq61/I7kWH01tPjC+pGSbz3JPf82EYIgmNcCKhQaUbqPslXsj9Q==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1619
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e8884a16-db00-4b30-9983-08d83ededf30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fjR/EYig0Ok4lmWRqd6dbQPvNLlD8JTWuAhz7FS/SB3cl003hvBqb/plHv3/+FYLQ01F2RXkECGO3Ci9AfC3mWfFPo/rm+M1cB49GUKvc0UN2UURGRGLx3zchRRKUuKAF8Kl3vqxlBc8rDZHhs1HXbu7ux2I921AEOzPHZYaQKLWz6ULGHxHKrS608OfdVFIn9eDNTqRgmqCOSAbnxeYX1H9csJcAUTvd6AnsMTB7QnkewZ7xB2/0qOMdMBhHZkaWjEAgAT8CWR6bYyGh3SMqMmcsQ8nzRX0EaKzpsQ8udtMfA3LXwpMO9ff0GchiaS5pSTlxEMYZKhJRp23vsQ9cdmyG8e9j/2ejRhRM4poQJedSE1vNyn8RC8vutg7NwQvWnvT9x+NdybXWca1IFIyIYsgazaH7FKG1phruNGh66xxSF8e9TaeWzXeX23yoi80GR+abHkFyS+LVTZEro2De23iDPn9Bd2qKtj1Kld/PcM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(54906003)(8936002)(336012)(356005)(2906002)(4326008)(55016002)(9686003)(70206006)(70586007)(186003)(107886003)(6506007)(82310400002)(7696005)(33656002)(81166007)(26005)(966005)(83380400001)(82740400003)(5660300002)(52536014)(36906005)(8676002)(86362001)(478600001)(316002)(110136005)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 16:43:49.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973acf74-774b-44f7-d8ac-08d83edee363
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2937
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPnZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBEaWVnbyBTdWVpcm8gdmlhDQo+bGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPlNlbnQ6IDA1IEF1Z3VzdCAyMDIwIDA4OjE2DQo+VG86IENocmlzdG9waGVy
IENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4NCj5DYzogbWV0YS12aXJ0dWFs
aXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBuZCA8bmRAYXJtLmNvbT47IERvdWcNCj5H
b2xkc3RlaW4gPGNhcmRvZUBnZW50b28ub3JnPg0KPlN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFs
aXphdGlvbl1bUEFUQ0ggMi8yXSB4ZW46IEFkZCBzdXBwb3J0IGZvciBjb25maWcNCj5mcmFnbWVu
dHMgYW5kIGRpZmZjb25maWcNCj4NCj5QbGVhc2UsIGZpbmQgbXkgY29tbWVudHMgaW5saW5lLg0K
Pg0KPj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj5Gcm9tOiBDaHJpc3RvcGhlciBDbGFy
ayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+DQo+PlNlbnQ6IDA1IEF1Z3VzdCAyMDIw
IDA3OjE1DQo+PlRvOiBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPg0KPj5DYzog
bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBuZCA8bmRAYXJtLmNv
bT47IERvdWcNCj4+R29sZHN0ZWluIDxjYXJkb2VAZ2VudG9vLm9yZz4NCj4+U3ViamVjdDogUmU6
IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSCAyLzJdIHhlbjogQWRkIHN1cHBvcnQgZm9yDQo+
PmNvbmZpZyBmcmFnbWVudHMgYW5kIGRpZmZjb25maWcNCj4+DQo+Pk9uIFR1ZSwgQXVnIDQsIDIw
MjAgYXQgNjoyOCBBTSBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPiB3cm90ZToN
Cj4+Pg0KPj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+
Pj4NCj4+PiAxLiBCeSBpbmhlcml0aW5nIGNtbDEuYmJjbGFzcyB3ZSBjYW4gZHJvcCBzb21lIGVu
dmlyb25tZW50IHZhcmlhYmxlcw0KPj4+ICAgIHNldHRpbmdzIGluIHhlbi1oeXBlcnZpc29yLmlu
YyBmb3IgdGhlIG1lbnVjb25maWcgdGFzaywgYW5kIGFsc28gYmUNCj4+PiAgICBhYmxlIHRvIHNl
YXJjaCBmb3IgY29uZmlnIGZyYWdtZW5zIGFuZCB1c2UgdGhlIGRpZmZjb25maWcgdGFzay4NCj4+
Pg0KPj4+IDIuIENoYW5nZSB0aGUgZG9fY29uZmlndXJlIHRvIHByZS1nZW5lcmF0ZSB0aGUgeGVu
Ly5jb25maWcgaW4gb3JkZXINCj4+PiAgICB0byBlbmFibGUgdGhlIG1lcmdlX2NvbmZpZy5zaCB0
byBydW4gc3VjY2Vzc2Z1bGx5IHdoZW4gY29uZmlnDQo+Pj4gICAgZnJhZ21lbnRzIGFyZSBsaXN0
ZWQgaW4gU1JDX1VSSS4NCj4+Pg0KPj4+IDMuIENvcHktYW5kLVBhc3RlIHRoZSBkb19kaWZmY29u
ZmlnIGZ1bmN0aW9uIGZyb20NCj4+bWV0YS9jbGFzc2VzL2NtbDEuYmJjbGFzcw0KPj4+ICAgIGFu
ZCBtb2RpZnkgdGhlIHBhdGggb2YgdGhlIC5jb25maWcub3JpZyBhbmQgLmNvbmZpZyBmaWxlcy4N
Cj4+DQo+PlRoYW5rcyBmb3IgYW5vdGhlciBpbnRlcmVzdGluZyBzdWJtaXNzaW9uIQ0KPj4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERpZWdvIFN1ZWlybyA8ZGllZ28uc3VlaXJvQGFybS5jb20+
DQoNClBsZWFzZSwgZGlzcmVnYXJkIHRoaXMgcGF0Y2guIEknbGwgYmUgc2VuZGluZyBhIG5ldyBw
YXRjaCBzaG9ydGx5IHVuaWZ5aW5nIGJvdGggdGhpcw0KYW5kIGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS81NjgzIGNvbnNpZGVyaW5n
DQpDaHJpc3RvcGhlcidzIGNvbW1lbnRzLg0KDQo+Pj4gLS0tDQo+Pj4gIHJlY2lwZXMtZXh0ZW5k
ZWQveGVuL1JFQURNRSAgICAgICAgICAgICB8ICAzICsrKw0KPj4+ICByZWNpcGVzLWV4dGVuZGVk
L3hlbi94ZW4taHlwZXJ2aXNvci5pbmMgfCA0Ng0KPj4+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQ0KPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL1JF
QURNRQ0KPj4+IGIvcmVjaXBlcy1leHRlbmRlZC94ZW4vUkVBRE1FIGluZGV4IDM0ZTc5NzcuLmY4
NmQyNjkgMTAwNjQ0DQo+Pj4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC94ZW4vUkVBRE1FDQo+Pj4g
KysrIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4vUkVBRE1FDQo+Pg0KPj5JIG5vdGUgdGhhdCB5b3Ug
aGF2ZSBmb3VuZCB0aGUgUkVBRE1FIGZpbGUuIFBsZWFzZSBjb3VsZCB5b3UgQ0MgYm90aA0KPj5E
b3VnIGFuZCBJLCBhcyBpdCByZXF1ZXN0cyBpbiB0aGF0IGZpbGUsIHdpdGggZnV0dXJlIHN1Ym1p
c3Npb25zIGZvciB0aGUgWGVuDQo+cmVjaXBlcz8NCj4+DQo+DQo+SSBub3RpY2VkIHRoZSBmaWxl
IGJ1dCBkaWRuJ3QgcGF5IGF0dGVudGlvbiB0byB0aGlzLiA7LSkgSSdsbCBtYWtlIHN1cmUgdGhh
dCBmb3IgdGhlDQo+bmV4dCBwYXRjaGVzIEkgd2lsbCBhZGQgeW91IGFuZCBEb3VnIGluIENDLg0K
Pg0KPj4+IEBAIC0yNSw2ICsyNSw5IEBAIFNlbGVjdCB0aGUgY29uZmlnIHNldHRpbmdzIHRoYXQg
eW91IHdhbnQgYW5kIFNhdmUNCj4+PiB0aGUgZmlsZS4gSWYgeW91IHNhdmUgaXQgdG8gIHRoZSBk
ZWZhdWx0ICIuY29uZmlnIiBmaWxlIHdoZW4gcHJvbXB0ZWQNCj4+PiBieSBtZW51Y29uZmlnLCB5
b3UgY2FuIGZpbmQgaXQgaW4gdGhlICAneGVuJyBzdWJkaXJlY3Rvcnkgb2YgdGhlIGJ1aWxkIHRy
ZWUuDQo+Pj4NCj4+PiArQ29uZmlndXJhcmlvbiBmcmFnbWVudHMgYXJlIGFsc28gc3VwcG9ydGVk
LiBUbyB1c2UgdGhlbSB5b3UgbmVlZCB0bw0KPj4+ICtsaXN0IHRoZQ0KPj4NCj4+c3BlbGxpbmc6
ICdDb25maWd1cmF0aW9uJyBwbGVhc2UNCj4+DQo+DQo+Q2hlY2tlZC4NCj4NCj4+PiArLmNmZyBm
aWxlcyBpbiB0aGUgU1JDX1VSSS4NCj4+PiArDQo+Pj4gIHNlY3VyaXR5IHBhdGNoZXMNCj4+PiAg
LS0tLS0tLS0tLS0tLS0tLQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQv
eGVuL3hlbi1oeXBlcnZpc29yLmluYw0KPj4+IGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLWh5
cGVydmlzb3IuaW5jDQo+Pj4gaW5kZXggNzg0MDU5Yi4uNTVlZmZlMyAxMDA2NDQNCj4+PiAtLS0g
YS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4taHlwZXJ2aXNvci5pbmMNCj4+PiArKysgYi9yZWNp
cGVzLWV4dGVuZGVkL3hlbi94ZW4taHlwZXJ2aXNvci5pbmMNCj4+PiBAQCAtMzEsOSArMzEsMTMg
QEAgRklMRVNfJHtQTn0tZWZpID0gIiBcDQo+Pj4gICAgICAvYm9vdC94ZW4uZWZpIFwNCj4+PiAg
ICAgICR7ZXhlY19wcmVmaXh9L2xpYjY0L2VmaS94ZW4qIFwNCj4+PiAgICAgICINCj4+PiAraW5o
ZXJpdCBjbWwxDQo+Pg0KPj5Db3VsZCB0aGlzIGJlIGFkZGVkIHRvIHRoZSBleGlzdGluZyBpbmhl
cml0IHN0YXRlbWVudD8NCj4NCj5DaGVja2VkLg0KPg0KPj4NCj4+Pg0KPj4+ICBkb19jb25maWd1
cmUoKSB7DQo+Pj4gICAgICBkb19jb25maWd1cmVfY29tbW9uDQo+Pj4gKyAgICBjZCAke1N9L3hl
bjsgWEVOX0NPTkZJR19FWFBFUlQ9eSBtYWtlDQo+Pg0KPj5UaGlzIGxvb2tzIHF1aXRlIGEgYml0
IGxpa2UgYnVpbGRpbmcuIEl0IHNlZW1zIHRvIGJ1aWxkIHF1aXRlIGEgbG90DQo+PndoZW4gSSBy
dW4gaXQgaW4gdGhlIGRldnNoZWxsLiBXaGF0IGRvZXMgdGhpcyBidWlsZD8NCj4+SXMgdGhlcmUg
YSBzcGVjaWZpYyBidWlsZCB0YXJnZXQgeW91IGNhbiBzcGVjaWZ5PyBTaG91bGQgaXQgdXNlIG9l
X3J1bm1ha2U/DQo+Pg0KPg0KPlRvIGdldCB0aGUgbWVyZ2VfY29uZmlnLnNoIHdvcmtpbmcgd2Ug
bmVlZCBhIC5jb25maWcgaW4gcGxhY2UuIEknbGwgaW52ZXN0aWdhdGUgaWYNCj50aGUgeGVuIGJ1
aWxkIHN5c3RlbSBzdXBwb3J0cyBnZW5lcmF0aW5nIHRoZSAuY29uZmlnIHdpdGhvdXQgY29tcGls
aW5nIHRoZQ0KPndob2xlIHByb2plY3QuDQo+DQo+Pj4gKyAgICAke1N9L3hlbi90b29scy9rY29u
ZmlnL21lcmdlX2NvbmZpZy5zaCAtbSAke1N9L3hlbi8uY29uZmlnICR7QCINCj4+PiArICIuam9p
bihmaW5kX2NmZ3MoZCkpfQ0KPj4NCj4+UGxlYXNlIGNvdWxkIHlvdSB0ZXN0IGZvciB0aGUgcHJl
c2VuY2Ugb2YgYXQgbGVhc3Qgb25lIGNvbmZpZyBmcmFnbWVudA0KPj5iZWluZyBwcmVzZW50IGlu
IHRoZSBTUkNfVVJJIGJlZm9yZSBydW5uaW5nIHRoZSBtZXJnZSBzY3JpcHQuDQo+Pg0KPg0KPkNo
ZWNrZWQuDQo+DQo+Pj4gKyAgICBjbWwxX2RvX2NvbmZpZ3VyZQ0KPj4+ICB9DQo+Pj4NCj4+PiAg
ZG9fY29tcGlsZSgpIHsNCj4+PiBAQCAtNzcsMTUgKzgxLDExIEBAIGRvX2RlcGxveVtkZXBlbmRz
XSArPSAieGVuLQ0KPj50b29sczpkb19wb3B1bGF0ZV9zeXNyb290Ig0KPj4+ICBkb19kZXBsb3lb
ZGVwZW5kc10gKz0gInhlbi10b29sczpkb19kZXBsb3kiDQo+Pj4NCj4+PiAgIyBFbmFibGUgdXNl
IG9mIG1lbnVjb25maWcgZGlyZWN0bHkgZnJvbSBiaXRiYWtlIGFuZCBhbHNvIHdpdGhpbiB0aGUN
Cj4+PiBkZXZzaGVsbCAtT0VfVEVSTUlOQUxfRVhQT1JUUyArPSAiSE9TVF9FWFRSQUNGTEFHUyBI
T1NUTERGTEFHUw0KPj5URVJNSU5GTyBDUk9TU19DVVJTRVNfTElCIFJFQ0lQRV9TWVNST09UX05B
VElWRSINCj4+PiAtSE9TVF9FWFRSQUNGTEFHUyA9ICIke0JVSUxEX0NGTEFHU30gJHtCVUlMRF9M
REZMQUdTfSINCj4+PiAtSE9TVExERkxBR1MgPSAiJHtCVUlMRF9MREZMQUdTfSINCj4+PiAtVEVS
TUlORk8gPSAiJHtTVEFHSU5HX0RBVEFESVJfTkFUSVZFfS90ZXJtaW5mbyINCj4+PiArT0VfVEVS
TUlOQUxfRVhQT1JUUyArPSAiUkVDSVBFX1NZU1JPT1RfTkFUSVZFIg0KPj4NCj4+U2VlIGZlZWRi
YWNrIG9uIHRoZSBlYXJsaWVyIHBhdGNoIGluIHRoaXMgc2VyaWVzIHBsZWFzZS4NCj4+DQo+DQo+
Q2hlY2tlZC4NCj4NCj4+PiAgZG9fZGV2c2hlbGxbZGVwZW5kc10gKz0gIm5jdXJzZXMtbmF0aXZl
OmRvX3BvcHVsYXRlX3N5c3Jvb3QiDQo+Pj4NCj4+PiAtQ1JPU1NfQ1VSU0VTX0xJQiA9ICItbG5j
dXJzZXMgLUwkUkVDSVBFX1NZU1JPT1RfTkFUSVZFL3Vzci9saWIiDQo+Pj4gK0NST1NTX0NVUlNF
U19MSUIgKz0gIi1MJFJFQ0lQRV9TWVNST09UX05BVElWRS91c3IvbGliIg0KPj4+DQo+Pj4gLUtD
T05GSUdfQ09ORklHX0NPTU1BTkQgPz89ICJtZW51Y29uZmlnIg0KPj4+ICBweXRob24gZG9fbWVu
dWNvbmZpZygpIHsNCj4+PiAgICAgIGltcG9ydCBzaHV0aWwNCj4+Pg0KPj4+IEBAIC0xMDcsNyAr
MTA3LDMzIEBAIHB5dGhvbiBkb19tZW51Y29uZmlnKCkgew0KPj4+ICAgICAgICAgIGJiLm5vdGUo
IkNvbmZpZ3VyYXRpb24gY2hhbmdlZCwgcmVjb21waWxlIHdpbGwgYmUgZm9yY2VkIikNCj4+PiAg
ICAgICAgICBiYi5idWlsZC53cml0ZV90YWludCgnZG9fY29tcGlsZScsIGQpICB9DQo+Pj4gLWRv
X21lbnVjb25maWdbZGVwZW5kc10gKz0gIm5jdXJzZXMtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jv
b3QiDQo+Pj4gLWRvX21lbnVjb25maWdbbm9zdGFtcF0gPSAiMSINCj4+PiAtZG9fbWVudWNvbmZp
Z1tkaXJzXSA9ICIke0J9Ig0KPj4+IC1hZGR0YXNrIG1lbnVjb25maWcgYWZ0ZXIgZG9fY29uZmln
dXJlDQo+Pj4gKw0KPj4+ICtweXRob24gZG9fZGlmZmNvbmZpZygpIHsNCj4+PiArICAgIGltcG9y
dCBzaHV0aWwNCj4+PiArICAgIGltcG9ydCBzdWJwcm9jZXNzDQo+Pj4gKw0KPj4+ICsgICAgd29y
a2RpciA9IGQuZ2V0VmFyKCdXT1JLRElSJykNCj4+PiArICAgIGZyYWdtZW50ID0gd29ya2RpciAr
ICcvZnJhZ21lbnQuY2ZnJw0KPj4+ICsgICAgY29uZmlnb3JpZyA9ICd4ZW4vLmNvbmZpZy5vcmln
Jw0KPj4+ICsgICAgY29uZmlnID0gJ3hlbi8uY29uZmlnJw0KPj4+ICsNCj4+PiArICAgIHRyeToN
Cj4+PiArICAgICAgICBtZDVuZXdjb25maWcgPSBiYi51dGlscy5tZDVfZmlsZShjb25maWdvcmln
KQ0KPj4+ICsgICAgICAgIG1kNWNvbmZpZyA9IGJiLnV0aWxzLm1kNV9maWxlKGNvbmZpZykNCj4+
PiArICAgICAgICBpc2RpZmYgPSBtZDVuZXdjb25maWcgIT0gbWQ1Y29uZmlnDQo+Pj4gKyAgICBl
eGNlcHQgSU9FcnJvciBhcyBlOg0KPj4+ICsgICAgICAgIGJiLmZhdGFsKCJObyBjb25maWcgZmls
ZXMgZm91bmQuIERpZCB5b3UgZG8gbWVudWNvbmZpZyA/XG4lcyINCj4+PiArICUgZSkNCj4+PiAr
DQo+Pj4gKyAgICBpZiBpc2RpZmY6DQo+Pj4gKyAgICAgICAgc3RhdGVtZW50ID0gJ2RpZmYgLS11
bmNoYW5nZWQtbGluZS1mb3JtYXQ9DQo+Pj4gKyAtLW9sZC1saW5lLWZvcm1hdD0gLS1uZXctDQo+
PmxpbmUtZm9ybWF0PSIlTCIgJyArIGNvbmZpZ29yaWcgKyAnICcgKyBjb25maWcgKyAnPicgKyBm
cmFnbWVudA0KPj4+ICsgICAgICAgIHN1YnByb2Nlc3MuY2FsbChzdGF0ZW1lbnQsIHNoZWxsPVRy
dWUpDQo+Pj4gKyAgICAgICAgIyBObyBuZWVkIHRvIGNoZWNrIHRoZSBleGl0IGNvZGUgYXMgd2Ug
a25vdyBpdCdzIGdvaW5nIHRvIGJlDQo+Pj4gKyAgICAgICAgIyBub24temVybywgYnV0IHRoYXQn
cyB3aGF0IHdlIGV4cGVjdC4NCj4+PiArICAgICAgICBzaHV0aWwuY29weShjb25maWdvcmlnLCBj
b25maWcpDQo+Pj4gKw0KPj4+ICsgICAgICAgIGJiLnBsYWluKCJDb25maWcgZnJhZ21lbnQgaGFz
IGJlZW4gZHVtcGVkIGludG86XG4gJXMiICUgZnJhZ21lbnQpDQo+Pj4gKyAgICBlbHNlOg0KPj4+
ICsgICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKGZyYWdtZW50KToNCj4+PiArICAgICAgICAgICAg
b3MudW5saW5rKGZyYWdtZW50KQ0KPj4+ICt9DQo+Pg0KPj5BdCB0aGUgcG9pbnQgd2hlcmUgdGhp
cyBjb2RlIGlzIGJlaW5nIGNvcGllZCBhY3Jvc3MgaW50byB0aGlzIHJlY2lwZSwNCj4+aXQgd291
bGQgYmUgZ29vZCB0byBiZSB3b3JraW5nIG9uIGEgd2F5IHRvIGZvbGQgaXQgYmFjayB0b2dldGhl
ciB3aGVuDQo+PnBvc3NpYmxlLiBTaW5jZSB5b3UncmUgaW50cm9kdWNpbmcgaW5oZXJpdCBvZiB0
aGUgY21sMSBjbGFzcywgd2hhdCBkbw0KPj55b3UgdGhpbmsgdG8gc3VibWl0dGluZyBhIHBhdGNo
IHRvIHRoZSBjbGFzcyB0byBtYWtlIHRoZSBtZW51Y29uZmlnIGFuZA0KPj5kaWZmY29uZmlnIGZ1
bmN0aW9ucyBnZW5lcmFsIGVub3VnaCAtLSBlZy4gbWFraW5nIHRoZSBuYW1lcyBvZiB0aGUNCj4+
Y29uZmlnIGZpbGVzIG92ZXJyaWRhYmxlIHZpYSB2YXJpYWJsZXMsIGp1c3QgbGlrZSB0aGUNCj4+
S0NPTkZJR19DT05GSUdfQ09NTUFORCB2YXJpYWJsZSwgZXRjIC0tIHNvIHRoYXQgdGhlIG1lbnVj
b25maWcgYW5kDQo+PmRpZmZjb25maWcgY29kZSBpbiB0aGlzIHJlY2lwZSBjYW4gYmUgZHJvcHBl
ZCBsYXRlciBpbiBmYXZvdXIgb2YganVzdCBzZXR0aW5nIGENCj5mZXcgdmFyaWFibGVzIGZvciB0
aGF0IGNsYXNzPw0KPj4NCj4NCj5Hb29kIGlkZWEuIExldCdzIHNlZSB3aGF0IEkgY2FuIGNvbWUg
dXAgd2l0aCBpbiBvZS1jb3JlLiBUaGUgb25seSBjYXZlYXQgdGhhdCBJDQo+c2VlIHdpdGggdGhl
IGN1c3RvbSBtZW51Y29uZmlnIHRhc2sgaXMgdGhlIGN1c3RvbSBvZV90ZXJtaW5hbCBjYWxsLg0K
Pg0KPj5DaHJpc3RvcGhlcg0KPj4NCj4+DQo+Pj4gKw0KPj4+IC0tDQo+Pj4gMi43LjQNCj4+Pg0K
Pj4+DQo=

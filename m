Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.611.1605246538315839974
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 21:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OkreDVhO;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 27F5038C08A4
	for <meta-virtualization@yoctoproject.org>; Fri, 13 Nov 2020 05:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eg1u9B2SYWFGwy/O5siws2y1BOIJRtO4hOjHgQhbYU=;
 b=OkreDVhOV5Mh8oqGQgZe9JWs8n+bf65poEee7ddbaYpO+NxZ2NWQwULYekAKpawd29UrsUjeFW0tS7cwkvvlYMXjAr1ZZ6Cvs94SlzSMJKusf7Ve7PQo8jXE01vLvql4muURW6iRcjcgoMv3TO2qnjWLGVMLkDuV+bzp9oE81zo=
Received: from AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14)
 by AM0PR08MB3123.eurprd08.prod.outlook.com (2603:10a6:208:5b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 05:48:52 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::4b) by AM6P193CA0037.outlook.office365.com
 (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Fri, 13 Nov 2020 05:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 05:48:52 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Fri, 13 Nov 2020 05:48:51 +0000
X-CR-MTA-TID: 64aa7808
Received: from c0d4087c4385.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2DA4A944-35E7-4777-AE2F-AD1D5185CF0D.1;
	Fri, 13 Nov 2020 05:48:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0d4087c4385.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Nov 2020 05:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcP76VESnQ/oDJMcylrjJ7f5PAnRg/gs+H3dAZnzDcRW3FhtO6cLfR7hzxyoe5uvwu+w+L+BnVNEdRa97HpmxGHsyx07wlZlp80DFGiFC3DpNCmZzS5SBwwG+KJmCuCL5q+e2K9lKFgLoq0ifNjcUxRkBcxOOzFWUTvTENAqdWQupaUj39xQBjseX8qVv2httbcFVNET5T8qkHvXFADgennFq94cKB3bi0Rn+ZQ+pj3/1wNFW3eIb1jGjcVVzEka0EpcYdlm/AleB3P56do6GV/+VkDiOLnuGT844clPmYSKubrV5/ETfMzxlr3GaR/nBPqsrnMgFQyVMpwgq3J+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eg1u9B2SYWFGwy/O5siws2y1BOIJRtO4hOjHgQhbYU=;
 b=cXPupNWQS1XgkTQaZjutvaTi0JgXOczQsKO037Zw/jkThmshr2MU7Wen/FsakXSyHc8YHY9+MECahlxqbR5JvkbjrzyWgpOsG8YDZBgTGLW2zZTneSHLOJeg5Q4Iu3woB3SXioUpigMqawW7MZTal2Eaoc41i7j60KFWN8dzVMZX40mhjSsDzHOAsVhrQHczQHwBb5v6VaJGdDEPiwfAbPv6eZpzIuUnCTh3KbBd/OMyuAQHG2JrgUhRgXVjX7InCoND41IDWqNC/YBqO6PGznT9edV2nifosa2ygNLeY8AWIC27kFAuzokcB5W6xvpLLJVSAqHNmLEzZe7N7PMkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eg1u9B2SYWFGwy/O5siws2y1BOIJRtO4hOjHgQhbYU=;
 b=OkreDVhOV5Mh8oqGQgZe9JWs8n+bf65poEee7ddbaYpO+NxZ2NWQwULYekAKpawd29UrsUjeFW0tS7cwkvvlYMXjAr1ZZ6Cvs94SlzSMJKusf7Ve7PQo8jXE01vLvql4muURW6iRcjcgoMv3TO2qnjWLGVMLkDuV+bzp9oE81zo=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DB8PR08MB4188.eurprd08.prod.outlook.com (2603:10a6:10:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 05:48:44 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 05:48:44 +0000
From: "Lance Yang" <Lance.Yang@arm.com>
To: Joakim Roubert <joakim.roubert@axis.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Topic: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Index: AQHWq69fcPQ8C1m0vkKsSMY3RAelSKnA/LdQgABzxceAAr5JoIAAbWcAgAANTBA=
Date: Fri, 13 Nov 2020 05:48:44 +0000
Message-ID: 
 <DBBPR08MB472572C4277C1705270EA8D591E60@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
 <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <fc77738c-810e-6e67-7710-573a4610faec@axis.com>
In-Reply-To: <fc77738c-810e-6e67-7710-573a4610faec@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 629D408ABA5114479D6AF1758DAF7593.0
x-checkrecipientchecked: true
Authentication-Results-Original: axis.com; dkim=none (message not signed)
 header.d=none;axis.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [103.73.66.85]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 35a72279-8e29-4726-2513-08d88797cd0b
x-ms-traffictypediagnostic: DB8PR08MB4188:|AM0PR08MB3123:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB31238CE579C64E65D8D41BCF91E60@AM0PR08MB3123.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QY4mn7akTGdij1sohaZ3Km1RdRoOzGxk//RQTc9aqUOI6eEWQFUdH0Db+eYe78JR6UmgPD9H3Sp0e11aS5G/CedIHTOlmIrUx/TcdsAmRIxBZ31ZaC/1+WBdHabAQ2mFINcHUkeWmSZFZguyItr4HZnNfxL3f0sUvmyGvROQAScf6uYzwA2p7Jzx8kqwW7Av9guomlrZgXo0S5F5uj1YHVI0tCj2Oye8Vp+Y7w/5hhnmx/b+mT2cVUEk8K5CWefgDH+BLbf/zvOhxQCmfecxR8fKv2crTiuUleeMNmDKhhlOKEQwed46G2h1UY8b5bLcECZ7p9NqX0+xF0qxCasGUWj4nzz+qEc2Qgpw9v9pZBjPZs8w9EjjOcnb1RG+pskACgTcmDlcGKnMweeNfR6R5w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(478600001)(86362001)(71200400001)(83380400001)(316002)(33656002)(8936002)(6916009)(8676002)(4001150100001)(54906003)(186003)(2906002)(64756008)(26005)(53546011)(6506007)(7696005)(4326008)(76116006)(5660300002)(66446008)(52536014)(9686003)(55016002)(66476007)(66556008)(66946007)(42413003)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 3Fp5jg9YbAJ8oNGSlirDm6V48C/qXgCN9k70UHigJssMQ9n0iZIEZXrq3sGa0ObrJTM0RiHgcg7LiBU+ezNA2ThvP6+KENCawD28ZuWUPOwH+UyeMPL7EDnYwiNT50Ka80ddIk+ErUsicKn660dhqJdwZtuhjDaCBrXiNMQ1qsWQrnpAqtJ99jhZqxI/H5lg6RyOMfKGcMHdUm/ZwQXIGwkXtomtm6bDN5+nypXI9xgAfZTWL1ubaBzYtMfaWj41n3YDaVOHXT3tA6zJc1LNPE2FNu3K5x6S78CozzTbnY4eF7ueGDLAcRPxFfiVSLY0obIJZ+s3BMm8ORxZYPeXVll6g6UHFMq6bMYbte97ctB3dgUKAYhjerB8qzxASY5bisehqRBiA7bxIZq57zadoR7/BxrTZlBM3D/8e8tAX0/fC0YhujUSRO6ynRAD5KN/a14fdxTn1fLTtbtMqNz0v8YSW6yi+omPoOLBcFxeCRDl/IRLr+TCVQ7Tpvq9p/cW/p/57lJky5N1IUfG/ZMat5lHAX4Ks19LOWHDnbi59fhyTn5Lac3joo3gLo93MdbGSKuw/PyHgAvFcKDW3zTVPWa8ZaHfnApQ3zm23JK17hPmO1pxp7YU+T7z+aqYc/VKM1DEu4+6rt2bQTGgcy1tPQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4188
Original-Authentication-Results: axis.com; dkim=none (message not signed)
 header.d=none;axis.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f88757b-6fab-4a4d-719b-08d88797c842
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yrQ0C00smjlACGqY2xqH+aeNCOeEKhdJAubi/PM/Ljr/jZ2j2UTvjfBaUO6zXcHwzKsNM35kDOOtrpsmoepIEysJyu1bHZwLUApX5ft8Q2qzBKhwRx7S+0rvv24B0qrfNLZxFQvD+qo92Rd0pALk0cWEITfnXIFgboEEE3O1dub/5zUw/yYV1/yDiVc/Y7EFM37yjL6WDKzrM7N7s56/U56RCu8t041BuCWfF6eGkWux32WFy5yS85E0D3KYTx3lh7tljeNgHqsOyXMIDQ47K/hQR07ual8bHhdtgpnwyCO3o/7L4AqoZC73OkKIKjiZjbHOU4t4DUl4iFKA4V46dbNWgzktVJU0H9St/pX5SdJsAYb4i8Xo7RJ86wF5kIWdbQJMlnQNavFzrbOleNunNYE2+5euKqwRqwEi0dFUpy7u5Z2InBdXCZaUctNpWkcu
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(107886003)(54906003)(82740400003)(4326008)(83380400001)(336012)(356005)(316002)(81166007)(7696005)(33656002)(26005)(186003)(6862004)(47076004)(478600001)(8676002)(55016002)(36906005)(6506007)(86362001)(53546011)(82310400003)(70586007)(70206006)(8936002)(5660300002)(4001150100001)(52536014)(2906002)(9686003)(42413003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 05:48:52.1506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a72279-8e29-4726-2513-08d88797cd0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3123
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9ha2ltLA0KDQpQbGVhc2Ugc2VlIHRoZSBjb21tZW50cyBpbmxpbmUuDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvYWtpbSBSb3ViZXJ0IDxqb2FraW0ucm91YmVy
dEBheGlzLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDEyLCAyMDIwIDk6NDMgUE0N
Cj4gVG86IExhbmNlIFlhbmcgPExhbmNlLllhbmdAYXJtLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6
YXRpb25dW1BBVENIIHY1XSBBZGRpbmcgazNzIHJlY2lwZQ0KPg0KPiBPbiAyMDIwLTExLTEyIDA4
OjMwLCBMYW5jZSBZYW5nIHdyb3RlOg0KPiA+DQo+ID4gUHJvYmxlbSAxOiBjb25mbGljdGluZyBy
ZXF1ZXN0cw0KPiA+ICAgIC0gbm90aGluZyBwcm92aWRlcyBrZXJuZWwtbW9kdWxlLWlwLXNldCBu
ZWVkZWQgYnkgaXBzZXQtNi4zOC1yMA0KPg0KPiBEbyB5b3UgaGF2ZQ0KPg0KPiBDT05GSUdfSVBf
U0VUPW0NCg0KWyBVaCEgVGhhdCB3b3JrcyEgSSB0aG91Z2h0IEkgc2V0IGl0IGJ1dCB3aGVuIEkg
ZG91YmxlIGNoZWNrZWQgdGhlIG1lbnVjb25maWcsIEkgZm91bmQgSSBmb3Jnb3QgdG8gc2V0IGl0
Lg0KDQpBcyBmYXIgYXMgSSBrbm93LCBpcHNldCBpcyBhIHRvb2wgdG8gc2ltcGxpZnkgaXB0YWJs
ZXMgY29uZmlndXJhdGlvbnMuIChlLmcuIGlwdGFibGVzIC10IG5hdCAtQSBQUkVST1VUSU5HIC1t
IHNldCAtLW1hdGNoLXNldCBwb2RuZXQgZHN0ICAtaiB4eHgpIHdoaWNoIGRlY3JlYXNlcyB0aGUg
bnVtYmVyIG9mIGlwdGFibGVzIHJ1bGVzLg0KDQpCZWNhdXNlIG9mIG15IGxpbWl0ZWQga25vd2xl
ZGdlIG9mIGszcy9rOHMsIEkgaGF2ZSBhIHF1ZXN0aW9ucyBhYm91dCBpcHNldC4NCg0KSXMgaXQg
YSBtdXN0IGluc3RhbGxlZCBjb21wb25lbnQgZm9yIGszcy9rOHM/DQpdDQo+DQo+IGluIHlvdXIg
a2VybmVsIGNvbmZpZz8NCj4NCj4gQlIsDQo+DQo+IC9Kb2FraW0NCklNUE9SVEFOVCBOT1RJQ0U6
IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZp
ZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFu
ZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBp
dCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFu
eSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

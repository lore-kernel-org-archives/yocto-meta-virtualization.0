Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EDBC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:10:54 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.78])
 by mx.groups.io with SMTP id smtpd.web11.7044.1699351844539777353
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 02:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UC6J2Y1e;
 spf=pass (domain: siemens.com, ip: 40.107.249.78, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWGmMFOKjrnga9EDEKY/kuTG952UDICVdSpOwqtsXiQmGl40P5G0T+UkPyIcGhogAekd0qXWq3fOVfNot8aXzCp7EfF2gSMZLNrcRommTvE1AhU8lzNqnlhGUnBKdk/2pPuRDUKSEAdJMNfxrh6YOf9RIEUq1awjZ8rEZiEIlit4ZMeBQvtGfFWEJqfrmiyxUBtnXA24dqaoR5NLUOIoVBo2aJEOlIIHsC5SC+fL3ICaCE3TXVqcKdqQ8ki9n+DbhhuDd3Gv0DVvflG45wbujxzXxPNSiFUuTn1uOefi5ixMdTqz6fs+KYiXEq/a9Wi+0Txh/0T9i/kmQmoEVK1NQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjniH/P5JROes8QeXW80su8VP+mYljqQr0ErvfA9FnI=;
 b=fWQstm2Id8fN8IuNIng6aHaoAtn8ChtCxziL90vuGPyOZi5ghE++idxUt7Cbp6o9yuDyPvMVnCTMk71Dq0QA8IDCsraga43BxgVMYI+Bwv9Y/osyCHlGxd9Yyf5ksx6juYqs/wz0vb0TF39e2kIwhGxFZFNPz2cYluVXi7pWeKjSr3DRmcJEJByu99VtajQ8auHpkA3aD1J1jr7nkuwQwo2ZFBPi+TCvu5P0GCfptkY5YjTi6qGydmBSCOYYUZraA0dqAtNUqpN2F6LhTUlSkIYWH9lI2DpqkFgyGJ/jhTXpxBvQl07khhtdirGTtfRjOdhuWP/L01o2873Kjhb+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjniH/P5JROes8QeXW80su8VP+mYljqQr0ErvfA9FnI=;
 b=UC6J2Y1eGnw6V/TGnJ4e9fspjP7VjEnuKjc7HWt1hDQh8C3du0AfaJQQTfKvTcal8vFVlam6e/u1rxppb1un0ypz3OL/kQvf8tbex5frSkpnHDdLCKGF0wwoP3Y26bRwhy1Uy62dUqtEU/lIZuW/8rQFTdXrlXG4cvWAt/0ZgPH7LF6YV8pAxSZK6LAR1xb/DWg229z1SzUjvVYkMd5NgRIzMj4iGOdQkAAz/VZplYJRAeN/+FJ8FT6Vd4y/a1T7n6dFzllaaAkldeuIdt3eUKejXSZJK1oSBERXAzNjDyT8tiXTFaJXO8cL+BEllIco+CZVBPdnR2xoQuf1u22ogg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB5571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 10:10:41 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 10:10:41 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE
 redefinition
Thread-Topic: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE
 redefinition
Thread-Index: AQHaEJKa1mPxXUZD10eoHO87VOmOV7BuCdGDgACaWQA=
Date: Tue, 7 Nov 2023 10:10:40 +0000
Message-ID: <8b75984f95e392f776d732e43bcf60fbc7573b44.camel@siemens.com>
References: 
 <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
	 <20231106092058.1209687-1-alexander.sverdlin@siemens.com>
	 <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
	 <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB5571:EE_
x-ms-office365-filtering-correlation-id: 5c8f782e-5cb6-4cdd-5d7f-08dbdf79cc10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 l6BEpd+1dqPDfNl4lgd/vyDP5mvqy3zlgUBkwzJE8kBZjzBD481KzEOfn81O+CKR5lVQ4aiJwtFPqH0zItdMDz3R6jwWPrYCv5m2uzmJyE7uqummuhKSXvPIcOn7YJVJg5hblDGRC7AtMvvEXV5TPlJGkXmRSMPS7MXfNf2rXHVc7hbwnsKBNJdxYFr+yZPmFo46SksKqaO2badxhRvH8jI9332fnRyrLZwq9NJQECKtaroYk9WD+HUS9Bvr0CQGho5qnrVqXW7vl+dDLwuCWsqYe2Y+6YRjyEbbkbRU5bnFqyb+Vj/KQsrXdCoUT7WdI2liXZ+SvU0MVEgDZmQmqwVSNUKnaLRQ0PEb3W+xe1iVWjj99/ooeCxXhEqyvQSeK6aEooD+6xY9d485XPpnnmYGbLtWsQgpJneSn7nsLn/9N0OzrZOYbN3n5haPtY1WYR0EWM2LTDw9eENcmyzdDXr0+/sftbZHDyf8ZKFQC0UOIfVs8//le/F/5GNrmCfW3Hq/dfdV81KwNOvc0AxCJKj4vKLZuKvO9ULxWk7jT0+4DZgZYq2hFDeeArwv+KYmIDoDlMRTT3K8TsbtoXMOEf4m1BGwV0Wrv8RUX0L62eR/K/uUkj+BXBlDqC3pLSwGyHKmwWjU1vJ34wY2EBsHaaEdur3IdzL54IvD9123hpZ2edz/1g57cDKG4aJ5hE5E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799009)(186009)(2906002)(5660300002)(8676002)(4326008)(86362001)(83380400001)(38100700002)(15974865002)(41300700001)(82960400001)(76116006)(122000001)(6512007)(8936002)(2616005)(91956017)(66946007)(316002)(66556008)(64756008)(66476007)(66446008)(54906003)(6916009)(6506007)(55236004)(71200400001)(38070700009)(6486002)(26005)(966005)(478600001)(36756003)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WGg2WjlraDRjZXZNWnBvVEpkZzhTOVFFaEI4WEh1Ly9XZDJMVURheStjQVIv?=
 =?utf-8?B?a1FaalR3SDZFZEwrMThCQWVDcW1aeGZoTlpGWXFML1V4aHlpUU5rRjFGYUQ3?=
 =?utf-8?B?VTc0NGROYU0rVjVudHB2dmlzNkhGUDZpL3E2NG5nanRzbzZVSUJnSzdMSVZv?=
 =?utf-8?B?d2RSK1J6RFdJWS9hYU43Umc5TjVvdktLSXlnQTU4VUdwY0w2MmVPVE11TVBI?=
 =?utf-8?B?a3ZJTWVHd3ZyU1VabXZOWXgyM2RHazBtbGgxV3U5QXVPS1VBZURLVC91Tkk2?=
 =?utf-8?B?RXMvTG5NSUVqekNpcGJFMCtadVNta0VuNnJhMHZmZkZudm12RU1FWG5WUzUv?=
 =?utf-8?B?aUpDUlIrN1JNV0FzWnV5RXQxMzE4WExyWGo5OStCNjRkK3IzZHo2bDB4YktU?=
 =?utf-8?B?akladFcvcitqNkV3WmIrcnlVWGowR3BrZ2Z6cWh0Ui9Ub0o5clRQbGZyZ0o2?=
 =?utf-8?B?VmFCUXJLOWFXMnFrNjVJQ0duVGlpRTVxWExBNXQ0QUF6Zy9LbmY5MnlYVFdr?=
 =?utf-8?B?Rk80YzNxUk1KckQyUmo5RUFiZTJxdFZZWkdjcUo2dnhJc0RMcVdKNlEyZytD?=
 =?utf-8?B?YUdlRmtjKzgyT05KQ1NMVjltdU1sOCtwbGxwQ0U2clZMeGNNMk9McjU4c3Ja?=
 =?utf-8?B?TC9ZYUg4blJtTElTYjByT1BUdGNwSWJYU3hsU3pqQ0pWKzZvWTRXTFJGTG53?=
 =?utf-8?B?OXdNN1oxZEQwVE9MTG42ZWJrT0JrZHBxcVh4Zm0zdVBSVzZWcFczL0IrMGp2?=
 =?utf-8?B?bmx4MzU3Y0diU2l0bVNwSEFDZ0lKVE8zalVNM0czSkVYWTZNMUFQQk1kQW1B?=
 =?utf-8?B?QUdNOHdCamFZTHZYcmxNcnZKR0VVZ3E3eTFmMU5GaWI1cjkzM3dieDNyd295?=
 =?utf-8?B?aFVhSkExejQxNllHdXdNMVcvQmx5eEZXbnBJc0N0QjM0LzFSYTZaNjlnZGNp?=
 =?utf-8?B?MzlvaGw2bVFkeDFpbXRPazdNUnZmMUhJQTY4dUo3RGV0SHRWUCtFNGRjN3lD?=
 =?utf-8?B?VDZoQk83bmMrSmZnQ2hDL2hKUlUzYzNFMi95S3p0NTZrblRIMzcvcGk2QXhJ?=
 =?utf-8?B?UnB1Tm91dlZBTUIzK1FlYnpzRHc5N1JsZ0hRUlpmc0VHa3dGNEloTjVCczk1?=
 =?utf-8?B?THovTzViNW9zdmxjM25lT0xUOGpHNkFvdmliZXAybWpvMnhTbUlFTERCbStW?=
 =?utf-8?B?dWtNT0hZOVl0dnRFTmZwNDFqMkZ3OG94ZmRqYnFnbTdtRzBSUE43ZzFMY09o?=
 =?utf-8?B?N2hoc2hrWXhjdU1PM2dZNUNsZE41MXVlLzFNQTdtZDlsT0JEcUg1MTdHK0Ns?=
 =?utf-8?B?V1l6OGhSUUd2YWJqVzIraFhpbU1ocTdWSnNjenE4R3RPM0VtRU5td3pPQ3dr?=
 =?utf-8?B?Kzh5NFJRVHNaRGU2TDlUREVIYzZSeVlUOGNTVHhYRFVoMThXbHlyQ1dwRzNY?=
 =?utf-8?B?TlJrak1lcndlWm4zWm9lb3dXcy8zUlRXaEt6ektQeEhrOVdDTjRiMFVkM095?=
 =?utf-8?B?YWI0U2JuRTlXZm04UmJIajZWbnVId0NFRkRnY0ovbmh0OHRPa1hseHJjMlBT?=
 =?utf-8?B?TUlaRzhtdU4wR2hBVjJGWGhpREROUk9aUlFiMmYvOHdNMVBxTVpLTFIrbC9o?=
 =?utf-8?B?Z2dxbVdFd09KZVJGWm9DNnQwb2JWOHcyNm5hclV1b01DbWR1UjdqL1htdnBl?=
 =?utf-8?B?UnUxdTdvZGRraTN5VXM5K2FLd09oOTJuTk9GMDBQUWlJSm45MmJKdm5Vc25m?=
 =?utf-8?B?VUVzVWlUTmRBOThmd0FZZzZ3RWUrb1k3MG1zeHRqTmdzUkNGaFhHVVFCSjFQ?=
 =?utf-8?B?ZW9SVVVlajB2aVIrMFZ2N2pSUU1rcDF4YzZVV25vRzNDUHNXMEZiZkhFcDU4?=
 =?utf-8?B?dnhGanVTUzVlUWZTWktkZ2FYdjN6K0VEeGdtY2U5YVJkSkxrODdlcGRXcFF5?=
 =?utf-8?B?Q0FCM0xnc3lhbTh1RlJqdE9tUEFqV2FFZWF2a1Vjb1FVYSttN0d3STNXZFFw?=
 =?utf-8?B?c3E4MjV2bU5KOWk0ZHFKTFZBSlVYeXpnQ1o5bTdhQzg3ZGxxY2pvZDV2Mm5Q?=
 =?utf-8?B?dDFOclZyUGU4T1R4TCsvM3VORzNrd3VNaGo3YS8rcU0xWlFyTzV5QXZPY3o0?=
 =?utf-8?B?dzhGTmhJYWgzMEQwNGFNeExqemFTTkppYS85ck5zSXRuVlFDenpoK3dlNTI5?=
 =?utf-8?Q?X0I7KYtj7GBh7Sllp90Oc2Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1414AE476537B549BE7C0AA2F5BF2B0D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8f782e-5cb6-4cdd-5d7f-08dbdf79cc10
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 10:10:41.0149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ci1TN0XRHE5i7Si3jiYGyuIu/kiqmeFEN+53+qnrBF1mUVTcbsw/6DfMB0QKJZqs5cMbXU+10l76lVEeKie/T0/dLT3CiU+C4z/+sL5pGUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5571
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 10:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8434

SGkgQnJ1Y2UhDQoNCk9uIE1vbiwgMjAyMy0xMS0wNiBhdCAxOTo1NyAtMDUwMCwgQnJ1Y2UgQXNo
ZmllbGQgd3JvdGU6DQo+ID4gQXMgSSBrZWVwIGxvb2tpbmcgYXQgaXQsIHRoZXJlJ3MgdmVyeSBs
aXR0bGUgaW4gdGhlIC5pbmMgZmlsZSB0aGF0IGlzbid0DQo+ID4gY29udHJvbGxlZCBieSBhIGRp
c3RybyBmZWF0dXJlLCBzbyB0aGVyZSdzIG9ubHkgc21hbGwgdHdlYWtzIG5lZWRlZA0KPiA+IHRv
IG1ha2Ugc3VyZSB0aGF0IG9ubHkgZnJhZ21lbnRzIGFuZCBrZXJuZWwgZmVhdHVyZXMgdGhhdCBh
cmUNCj4gPiBxdWl0ZSB3ZWxsIHRhcmdldGVkIGFyZSBlbmFibGVkLg0KPiA+IA0KPiA+IEhhdmlu
ZyB0aGUga2VybmVsLWNhY2hlIGFzIGEgZGVwZW5kZW5jeSBpcyBub3QgbXVjaCB0byBhc2ssDQo+
ID4gY29tYmluZWQgd2l0aCB0aGUgYWJpbGl0eSB0byB1c2UgdGhlbSB0byBjb25maWd1cmUga2Vy
bmVscw0KPiA+IHByb3Blcmx5IGFuZCBhdWRpdCB0aGUgcmVzdWx0cy4NCj4gPiANCj4gPiBUaGUg
aG91cnMgKG1vcmUgbGlrZSB3ZWVrcyBhbmQgbW9udGhzKSBzcGVudCBkZWJ1Z2dpbmcgcnVudGlt
ZQ0KPiA+IGlzc3VlcyBkdWUgdG8gaW5jb3JyZWN0bHkgY29uZmlndXJlZCBrZXJuZWxzIGhhcyBi
ZWVuIGh1Z2Ugb3Zlcg0KPiA+IHRoZSBsaWZldGltZSBvZiBtZXRhLXZpcnR1YWxpemF0aW9uLiBB
c2tpbmcgZm9yIGEgZmV3IGZyYWdtZW50cyB0bw0KPiA+IGJlIGRvd25sb2FkZWQgKHdoaWNoIGNh
biBiZSBtaXJyb3JlZCkgaXMgbWlub3IgaW4gdGhlIHNjb3BlIG9mDQo+ID4gdGhpbmdzLg0KPiA+
IA0KPiA+IFdoaWNoIGlzIHdoeSBpZiBhIGtlcm5lbCB0eXBlIHRoYXQgY2FuIG1lcmdlIGZyYWdt
ZW50cywgYnV0IHlldA0KPiA+IGlzIGRpc2FibGluZyB0aGUgZmVhdHVyZSBzcGVjaWZpY2F0aW9u
LCB0aGUgbGF5ZXIgc2hvdWxkIGVtaXQgYQ0KPiA+IHdhcm5pbmcuIEknZCB0aGVuIGhhdmUgYW5v
dGhlciB2YXJpYWJsZSB3aGljaCBpbmhpYml0cyB0aGUgd2FybmluZw0KPiA+IG1lc3NhZ2UuIFNp
bmNlIHRoYXQgaXMgc29tZXRoaW5nIEkgY2FuIGFzayBhYm91dCBpbiBidWcgcmVwb3J0cw0KPiA+
IGFuZCB1bnRpbCB0aGUgd2FybmluZyBtZXNzYWdlIGlzIHJlLWVuYWJsZWQsIHRoZSByZXBvcnRl
ciBpcyBvbg0KPiA+IHRoZWlyIG93bi4NCj4gDQo+IE15IHNvbHV0aW9uIGlzIG5vdyBpbiBtYXN0
ZXItbmV4dDoNCj4gDQo+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS12aXJ0dWFs
aXphdGlvbi9jb21taXQvP2g9bWFzdGVyLW5leHQmaWQ9NDVjMjI5N2E5MTY1MTZlNWZjN2I4MmRh
YjQ2YzQ3MTk1OTA4MTNiNw0KDQpJJ3ZlIHRlc3RlZCB5b3VyIHNvbHV0aW9uIGFuZCBpdCBzb2x2
ZXMgdGhlIGlzc3VlIG9uIG15IHNpZGUsDQp0aGFuayB5b3UgZm9yIGFkZHJlc3NpbmcgaXQgc28g
cXVpY2tseSENCg0KVGhlcmUgaXMgYSBwcm9ibGVtIGluIHRoZSB3YXJuaW5nIGNvZGUgdGhvdWdo
LCBuYW1lbHkgYSB0eXBvIGhlcmU6DQoNCnNraXBfa2VybmVsX2luY2x1ZGVfZW5hYmxlZCA9IGQu
Z2V0VmFyKCdTS0lQX01FVEFfVklSVF9LRVJORUxfSU5MVURFJykNCg0KaWYgaXQgd291bGQgYmUN
Cg0Kc2tpcF9rZXJuZWxfaW5jbHVkZV9lbmFibGVkID0gZC5nZXRWYXIoJ1NLSVBfTUVUQV9WSVJU
X0tFUk5FTF9JTkNMVURFJykNCg0KdGhlIHdhcm5pbmcgd291bGQgYmUgZW1pdHRlZCBhcyBleHBl
Y3RlZC4gQWZ0ZXIgdGhlIGNoYW5nZSBib3RoIGVtaXR0aW5nDQphbmQgc2lsZW5jaW5nIHRoZSB3
YXJuaW5nIHdvcmtzIGZpbmUuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFH
DQp3d3cuc2llbWVucy5jb20NCg==


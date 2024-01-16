Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26225C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:19:26 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.53])
 by mx.groups.io with SMTP id smtpd.web11.22460.1705425556684206490
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 09:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ArP95WVW;
 spf=pass (domain: axis.com, ip: 40.107.14.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9r8iXf3QO+m5veoTIQYfFPb3Xb24DvtcZ4NDfy4siuMOoLPuteMv4mn1IPTqns9d96TA+VMX48OXY5JvivDZe/6iCdvefL3Z1Mck4DPiKuGDlkBT0hPqF/acoUgWDEfs8G48SqviLjWOJxCaOiwFjK+9XPo6Yu/3ZgA60ga7JETTMAEjnV66pNtjZHLkrsK9gGZ+a8IArs7+o++ACuByZqXa4yxLXj1Xcv2m0vDgvjxsuitDz8qc+Yq4kpPHp4VgA/gWTCmZMJ06hDDnFoI9/MIaA58hTRaPRngK+2TVjS2WiMIR2taCuRRzTe0xdTV30xS8bqf9TJ/vA5XfFt6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5bFxE1U824aE0rUYxW1u4YyEESpmX4+KDtomOcbaZI=;
 b=TkJ7YO6XJAkBRfSsq6fOyq718Dz/Z44H4ymsGcak2bLZf7Lrp8swcnX8sK7Vi261WF1+f9fthQ3P+rMfJ49Cuhu0m4K142aQ4O9FsRtNmuoxgdBpdrJFdUqRyLtJOUfsKa6ntovgejHMKLJK7Foc+RCQE7CmwSYyhSn8DNKgfJgno2mqMFcLH+54MSoXOz/6DOEkwxMwU86s+gX4oY7PA3J1fKzAVBQbGWYL/tbybZgt4kz/IAYl1IFzMZ04aKlNlu8tTBHfJFV5BQ77dLale7iVzetoff2QB8P63jtJdsbKKyimOVU1Aa/jms2feu5Xgt1vxEGmD3TgfjvF7XaDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5bFxE1U824aE0rUYxW1u4YyEESpmX4+KDtomOcbaZI=;
 b=ArP95WVWMLBWSuA2dgaktDPjvJbcaP3X+MkQ0Z0d48f0f4O0O9w+m9nJqM87VBn5I5OV302kTblP/kD10txlzLu7MypxoaiSnxwqaLpMloolITBNEb1W7KIFAirGRMOv/KsAw2jPC7tzyWK5T+044k4fP8BA3RA/vzu6IJy83K4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6351.eurprd02.prod.outlook.com (2603:10a6:800:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 17:19:11 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 17:19:11 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Thread-Topic: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Thread-Index: AQHaR9WzI2hJj3yE006iw5iHkvxeCrDcTfFggABB2gCAAB7BMA==
Date: Tue, 16 Jan 2024 17:19:11 +0000
Message-ID: 
 <DB5PR02MB10213F86140ABC5443371835EEF732@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240115170030.3531505-1-pkj@axis.com>
 <CADkTA4PkPBXp1tVuth0Cj8WvTTX4J-NhHmDHoHm-gGdiD3==MA@mail.gmail.com>
 <DB5PR02MB102132B690BBC1F8EE9F6DDF8EF732@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CADkTA4MDpubrL2R7a9UU5uQci7Fh6zxdvJa3HYhzOaWC5ZdE_w@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MDpubrL2R7a9UU5uQci7Fh6zxdvJa3HYhzOaWC5ZdE_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6351:EE_
x-ms-office365-filtering-correlation-id: f32ab6a6-c4b8-4807-6cf0-08dc16b741c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wWibBRHkjBpq5220UjCAGZCJ8f0VxZPtbLaHdc1kReaFaT49En4DaggJcn+cEpZGrOtOc/LkjCaNc3cED76ebmu9qDN35zgvidJ8lRexJhTms4vPKUzj7sSR66Ryv+G9IT6ibS7CQ65ld728Mv7XnKRAZSCMLs68FtlEOMvqXv3xTwPv8gcINXQ1EPSr5ylHF4UkgVtmwaV/mettNXTSqj1N8Q5Iz1zCBAFMWvE5iuXJPNeNjilqA49NpiGD4dvUaxXfAQEx2+Fhwcm5z9Wv2e6h8CQLZYdbLQSfznqlNgOtU8nyC4jk4H11MRrGUMBGerotG7uXXuzQ/WILHYLv5b0DVyVX0qk8MWqdmlfClty9qe40E6iXLF0ICAck/w/ZYGtpBYJvK5Cz0mrEqM9j3fn3We+9+75UEPOWkax/xlxaBTKeesKqgqNMkxOuPxVzAZgj5iGz/jCjb7ETcMMu4v14+bn2MyDJrn9kRnsvdYfXrv4MgoArDTqdV4IEE3GQA8s0vnMc/tvtg/6ly7J3IzJ2+R3gWLO7RCMNW9AJqtabt3cUzn4pSTlbUCnWz83NLRQVxESiIjj5ThSZiY2lW1yyKZTnBqM9ZkbD3Fo6PzOyyFZkDOhXbJDVQ39LYtRCUPdnBdXX6Y62vZdn720UtA9OHXG7+S6XQH+FJ9qkXGlSgbDnLDrvMVl1K3t2k1uG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(7696005)(26005)(122000001)(44832011)(38100700002)(8676002)(76116006)(4326008)(71200400001)(5660300002)(52536014)(8936002)(41300700001)(2906002)(6916009)(53546011)(9686003)(478600001)(6506007)(66476007)(316002)(66446008)(66556008)(64756008)(66946007)(33656002)(38070700009)(86362001)(55016003)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RW92SHhwQktVWWpvemROOFg0eGdub1RXdUtRUEFabHNTZVY5c3loN3NhSS9i?=
 =?utf-8?B?WTFCSGhQSndqTmc4cHRtcG81bDE0VlZ6eDFhbjBhNFJlN2RBNWJaNTNjSlkz?=
 =?utf-8?B?eklFalliTEh4blQ5ZjBsVDZyQVBMSmptVks4cmZ2eDhHSVJCZ3I0QWJIWWx5?=
 =?utf-8?B?dVBCR2FNWEsyc2FsYVdlcktmQkpUeHE2TTcxcGRuOHg3bEtiOTVHdk83WlRr?=
 =?utf-8?B?bVJKUVdZOW9GLzFpdTZGbm9SSlZjZ2dPcVBFSjREN2N1ZTE1YWFld0wwM1hh?=
 =?utf-8?B?Q1BNVEYvWUErdnUveC9hNnRLTnFyYzB0UnYveG4wT3I1L0dFS3ZuTUtWbW9D?=
 =?utf-8?B?VS9EaE8xWlIvT0VaMWNEdzVZNWRsdm1DZGlJQmhySk9qbC9NZDB6a3hFTGcz?=
 =?utf-8?B?MSs2MHdJQWVPRnZnQjlrOUVYNG5WaW1SajdXZDlmT21XNFNrQmFVdkt6OTRF?=
 =?utf-8?B?RWY2OVdlVHZjaXFUSklSZzQxV2VCWUZ5MXlHbHV0ZzFDUFBpeC9VZXgydTAz?=
 =?utf-8?B?MXVzUm9ZWkttbUUwZHlrb2ZsQTNaNlNKN0JSZ21kZ2ZBTjRWdHhpTm5xYUJr?=
 =?utf-8?B?OVpJM3VVSktBRnUyVjQ4ZmpIcXI2TjVOemRnSVhTQTBuUUlickN5TTllRWhJ?=
 =?utf-8?B?Rk1oMDRoTzhzL1lGRDhSZHVaazVWY3Z6TFlNTDg1RWNWNkpTZ1hTYUxocFZL?=
 =?utf-8?B?bmltR3FEQVdkRTRBNnlhblpMNlRlekVWckgxN0JWZzFCTVRmSVVYOHpFR0Mr?=
 =?utf-8?B?NitCSlZzZnd5d1E5dXREMkpOOENYSHFGVGFGa3hhM0V5amdNdllHcEMzWGFU?=
 =?utf-8?B?RkM0UWdKR3Q4YzdBSWoxRDhHTjkzNENadXFJZEdMTU5DSklwRDVWWnJ1UzAv?=
 =?utf-8?B?enJVcDZ4V3lMcnk4eSt4ZFlzaExKeGhGMUdURWE4V0RjVzZ3L0NwM0doekNI?=
 =?utf-8?B?SEVoTEtLRDFKWDRTeEd0ZWozcHh0Um1BLzR1aWJZZ0FTL3ZnMURYSVN4VW5k?=
 =?utf-8?B?bGFBaWp3NEx4dWlsOHFvTXQ4OERwYTF2TmI5c3FPMEwxcVl3U01vZ21YZVZR?=
 =?utf-8?B?MDR3ZmtYMzZHRWNDMjVtSEMrdzhrQnltbmczc1ZESUZGcklybnIyNnlBc3FI?=
 =?utf-8?B?dStPOTlLM1hNeW5lWHNhMHlvTlJHZzcyOWRzYnZNUWhhMDRneW5RMTFBdHZS?=
 =?utf-8?B?d0grdzlrMEZjM1hVZTBxelpPT2J5Q013ZjBxaGNZMGw0YStKMWZOZCtEc0lI?=
 =?utf-8?B?enRQSUdaNHZML3Z6QXpqMVlLVU5IYXZLVktZeDFVZnhrdm8zSVRwWWpPaXVq?=
 =?utf-8?B?VTdxVmh2ek1ia2xtRHY1eFMxZjc1enc5M3phYWdTZnB4VVlFcytJa0tGaWEv?=
 =?utf-8?B?alNkWW1VeENtVU00TFNOdWZSOHovVEdzLzlmcy9vRWdRUXF2QWVlV0RjenA4?=
 =?utf-8?B?amQ4OVNZU3V2L2VYSTk5QWU1YVRobzNETG1YV0dhajhUZzdBeEcyc0I3SHF3?=
 =?utf-8?B?Tkg4Uytsci9kY2RVV2lYR01aS09LYlhPQzVuNkEzR1AybGdyaWZLQkhrNjBq?=
 =?utf-8?B?S2F1R3loRkZtLzJjMzAyUzIxNFNnbm11SlJxZjFiUkIrOEh1VHA4WTdTVXBS?=
 =?utf-8?B?ajFTM1IyR1lPWVZrMFVENXI1MTVIM3dPWFZwSGJwMUphb2FNNnJzWWszWUJY?=
 =?utf-8?B?QS9EdCtBd1FJa2h3Sk5IQzdndXRTaTA2N0dRQjloNG5xNFkwa042OTBlRExi?=
 =?utf-8?B?MnVJdmZEY2t5cWhyWWIvK2w2SnRHRkNaWjMzR0pLbW96TFZ0VFg0TitqV3Fi?=
 =?utf-8?B?YTVCNkQwN3Nob0FxZEdGOWdZeXNJNFdGMHpaM0pEa1V6UWlGd3pkUCtLbjRv?=
 =?utf-8?B?ZkMxTnZTMU9ybTY0SlVEZ201SmVyVDFOcFNFYjJrbVlsbHR5RitFdVlVbVEw?=
 =?utf-8?B?REVhWGVBMHNjK1NiZVF1R0o5ZXQ1eWN3VjhNcFJySlZadFRMbEJJR0krS2NE?=
 =?utf-8?B?RmZPTUtlbU5LSXBxMXBvNll6bnVkUUMwMUpibDZJcjI2ZTVlYU1nd0l1MURE?=
 =?utf-8?B?TzhXVDVoMmNmMUhCZWJkcmlkMUs0Q2NoZW5Ua2NEZmlDNkZWNUVYMjUxd1dY?=
 =?utf-8?Q?8wPQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32ab6a6-c4b8-4807-6cf0-08dc16b741c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 17:19:11.7650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmfWPsohILt03WkWTbtgam1YJfsJzCqxfsKdG7v+P5iE+ILbI19oMHJcPH9NEd4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6351
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jan 2024 17:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8545

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1
Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMTYgamFudWFyaSAyMDI0IDE2OjIy
DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4N
Cj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFtQQVRDSF0gY29udGFpbmVyZC1vcGVuY29u
dGFpbmVyczogVXNlIFJERVBFTkRTOiR7UE59IGluc3RlYWQgb2YgUkRFUEVORFM6JHtCUE59DQo+
IA0KPiBPbiBUdWUsIEphbiAxNiwgMjAyNCBhdCA2OjM14oCvQU0gUGV0ZXIgS2plbGxlcnN0ZWR0
IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFz
aGZpZWxkQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IGRlbiAxNSBqYW51YXJpIDIwMjQgMTg6MTAN
Cj4gPiA+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4NCj4gPiA+IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1BBVENIXSBjb250YWlu
ZXJkLW9wZW5jb250YWluZXJzOiBVc2UgUkRFUEVORFM6JHtQTn0gaW5zdGVhZCBvZiBSREVQRU5E
Uzoke0JQTn0NCj4gPiA+DQo+ID4gPiBPbiBNb24sIEphbiAxNSwgMjAyNCBhdCAxMjowMOKAr1BN
IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToN
Cj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBhdm9pZHMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiA+
ID4gPg0KPiA+ID4gPiAgIFdBUk5JTkc6IC4uLi9jb250YWluZXJkLW9wZW5jb250YWluZXJzX2dp
dC5iYjogVmFyaWFibGUga2V5DQo+ID4gPiA+ICAgUkRFUEVORFM6JHtQTn0gKC4uLikgcmVwbGFj
ZXMgb3JpZ2luYWwga2V5DQo+ID4gPiA+ICAgUkRFUEVORFM6Y29udGFpbmVyZC1vcGVuY29udGFp
bmVycw0KPiA+ID4gPiAgICggICR7VklSVFVBTC1SVU5USU1FX2NvbnRhaW5lcl9ydW50aW1lfSku
DQo+ID4gPiA+DQo+ID4gPiA+IGlmLCBlLmcuLCBSREVQRU5EUzoke1BOfTphcHBlbmQgPSAiIC4u
LiIgaXMgdXNlZCBpbiBhIGJiYXBwZW5kIG9yDQo+ID4gPiA+IGJiY2xhc3MuDQo+ID4gPg0KPiA+
ID4gQWxsIHRoYXQgdGhlIGFib3ZlIGNvbW1pdCBtZXNzYWdlIGRvZXMgaXMgZXhwbGFpbiB0aGUg
c3ludGF4DQo+ID4gPiBvZiB3aGF0IHlvdSBhcmUgZml4aW5nIC4uIGJ1dCBub3Qgd2h5Lg0KPiA+
ID4NCj4gPiA+IFdlIGhhZCB0aGUgQlBOIHJkZXBlbmRzIG9uIHB1cnBvc2UsIHNob3dpbmcgd2h5
IHRoYXQNCj4gPiA+IG9yaWdpbmFsIHB1cnBvc2UgaXMgbm90IG5lZWRlZCAgLi4uIHNob3VsZCBi
ZSBpbiB0aGUgY29tbWl0DQo+ID4gPiBtZXNzYWdlLg0KPiA+DQo+ID4gSSBoYXZlIG5vIGlkZWEg
d2h5IGl0IHdhcyBSREVQRU5EUzoke0JQTn0gcmF0aGVyIHRoYW4gUkRFUEVORFM6JHtQTn0sDQo+
ID4gSSBvbmx5IGFzc3VtZWQgaXQgd2FzIGEgdHlwby4gVGhlcmUgaXMgbm90aGluZyBpbiB0aGUg
b3JpZ2luYWwgY29tbWl0DQo+ID4gdGhhdCBpbmRpY2F0ZXMgdGhhdCBpdCB3YXMgZG9uZSBvbiBw
dXJwb3NlLg0KPiANCj4gSSBkaWQgYSBiaXQgbW9yZSBkaWdnaW5nLCBhbmQgYXQgdGhlIHRpbWUg
dGhlcmUgd2VyZSB4MzIgbXVsdGlsaWJzIGF0IHBsYXksIGFuZA0KPiBJIHJlbWVtYmVyIHRoYXQg
c29sdmluZyBzb21lIHNvcnQgb2YgaW50ZXIgcGFja2FnZSBkZXBlbmRlbmN5IC4uIGJ1dCAgSQ0K
PiBhbHNvIGNhbid0IGZpbmQgdGhlIGRldGFpbHMuDQoNCkkgaGF2ZSBubyBleHBlcmllbmNlIHdp
dGggeDMyLCBzbyBub3Qgc29tZXRoaW5nIEknZCBoYXZlIGNvbnNpZGVyZWQuIA0KSSBvbmx5IGxv
b2tlZCBhdCB0aGUgcmVjaXBlIGFuZCBjb3VsZG4ndCBmaW5kIGFueSByZWZlcmVuY2VzIHRvIA0K
QkJDTEFTU0VYVEVORCBvciBzaW1pbGFyIHRoYXQgd291bGQgZXhwbGFpbiB3aHkgJHtCUE59IHdv
dWxkIG1ha2UgYSANCmRpZmZlcmVuY2UgY29tcGFyZWQgdG8gJHtQTn0uDQoNCj4gPiA+IE15IGFu
c3dlciByaWdodCBub3cgd291bGQgYmUgLi4gLmRvbid0IHVzZSBQTiBpbiB5b3VyIGJiYXBwZW5k
DQo+ID4gPiBhbmQgeW91IGNhbiBhdm9pZCB0aGUgd2FybmluZy4NCj4gPg0KPiA+IFRoZSBwcm9i
bGVtIGluIG15IGNhc2UgaXMgdGhhdCBvdXIgYWRkaXRpb24gdG8gUkRFUEVORFM6JHtQTn0gaXMg
ZG9uZSBpbg0KPiA+IGEgY29tbW9uIGJiY2xhc3MsIHNvIEkgY2Fubm90IGNvbnRyb2wgaXQgcGVy
IHJlY2lwZS4NCj4gDQo+IEFoLCBzbyB5b3UgaGF2ZSBhIGNsYXNzIHRoYXQgaXMgZG9pbmcgYSBn
ZW5lcmljIFJERVBFTkRTIGFkZGl0aW9uDQo+IHRvIGFsbCBwYWNrYWdlcyBhbmQgdGhhdCB0cmln
Z2VycyB0aGUgZG91YmxlIHZhcmlhYmxlIGtleSB3YXJuaW5nLg0KPiANCj4gSSdsbCB0d2VhayB0
aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQgdG8gZXhwbGFpbiB0aGUgaGlzdG9yeSBhbmQgdHJpZ2dl
cg0KPiBvZiB0aGUgd2FybmluZyBhbmQgcXVldWUgaXQgdXAuDQoNClRoYW5rIHlvdS4gQ2FuIHlv
dSBhbHNvIGJhY2twb3J0IGl0IHRvIE5hbmJpZWxkIChhbmQgcG9zc2libHkgYWxzbyBvdGhlciAN
CmJyYW5jaGVzKSwgb25jZSBpdCBoYXMgbWFkZSBpdCBpbnRvIG1hc3Rlcj8NCg0KLy9QZXRlcg0K
DQo+IEJydWNlDQo+IA0KPiA+DQo+ID4gLy9QZXRlcg0KPiA+DQo+ID4gPg0KPiA+ID4gQnJ1Y2UN
Cj4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIHJlY2lwZXMtY29u
dGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiIHwgMiAr
LQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvY29udGFp
bmVyZC9jb250YWluZXJkLW9wZW5jb250YWluZXJzX2dpdC5iYiBiL3JlY2lwZXMtY29udGFpbmVy
cy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gPiA+IGlu
ZGV4IDVjMWUxMjcuLjFkYWRmMjggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3JlY2lwZXMtY29udGFp
bmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gPiA+
ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRh
aW5lcnNfZ2l0LmJiDQo+ID4gPiA+IEBAIC05NSw2ICs5NSw2IEBAIElOU0FORV9TS0lQOiR7UE59
ICs9ICJsZGZsYWdzIGFscmVhZHktc3RyaXBwZWQiDQo+ID4gPiA+DQo+ID4gPiA+ICBDT01QQVRJ
QkxFX0hPU1QgPSAiXig/IShxZW11KT9taXBzKS4qIg0KPiA+ID4gPg0KPiA+ID4gPiAtUkRFUEVO
RFM6JHtCUE59ICs9ICIgJHtWSVJUVUFMLVJVTlRJTUVfY29udGFpbmVyX3J1bnRpbWV9Ig0KPiA+
ID4gPiArUkRFUEVORFM6JHtQTn0gKz0gIiAke1ZJUlRVQUwtUlVOVElNRV9jb250YWluZXJfcnVu
dGltZX0iDQo+ID4gPiA+DQo+ID4gPiA+ICBDVkVfUFJPRFVDVCA9ICJjb250YWluZXJkIg0KPiA+
ID4gPg0KDQo=


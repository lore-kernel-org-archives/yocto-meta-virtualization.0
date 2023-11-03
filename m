Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701C8C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:15:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web10.45386.1699002917623024487
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qZ49K/Bq;
 spf=pass (domain: siemens.com, ip: 40.107.6.64, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxFdwO8IEI7kAE24hNYu3BgYUN+2dTvjScF4j5wN3Gvvi40UK/hGVvPlgTNejjvh1twve8qMVkL31w5vg/Bb9UygB1CNOcBT8YU7vdNjljNOLC3SKH0rxCcTI8Tz8G2yrW3zvGmj/o+lOUDa3PJOp6NBESarjV4NbYyd6apIVZwGwy/ixYvfQvNT82txRYNXYol/t1JpIaW10Fd7ZCtkz94RT8fHWPbAbpxDdStzRo43iyeUcrxiQQFCabAgui1BEaXE3PrKQBEtS2sZRsCW1DzervZoYKBdBmQuDqYSogG4JHo7H+zf5BE2CLduMxzJGYKaO1rJKGtQt4d0gaCjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvBxtq6erN+H/Qf67MhabtYkd78Vo81s18q5oiHWv8s=;
 b=SKS2iD68MCh5fhYi+huHYk9hfpBOC6Fn2anUXrwdzID+hoCVFEhpNGnBabVogTdCIx4gGYhfYd1yVmF6zRr96808Vpss0eYBf9HVvHPvJhHRS/es64jAgo++Ehi48+cZi7eNSKXpPVQRxQ07CrgnwTE4u8ARa1e+/UQ83HreCY1iV/ZTsdODfu/wPKSRjgzwJPHGgBIEAYFenPMbQuMyoxTG1mLlGU4xxs85w27DUfgsOWuAVn1OW1iW+NwHWIpXXULhzKeFs1IrbLDnXpaLgH2LfkbHWpaEfgRxylOdkiC5gMakBEarJBYuwYDd86VsTkYl7MLgwfIhjed6134mOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvBxtq6erN+H/Qf67MhabtYkd78Vo81s18q5oiHWv8s=;
 b=qZ49K/BqVatRMiKoWYtaYaxdqzmS7V7UPCIoPYN0zDGpIpihLGR02ORRbtW6IlABsXH5Ax8bGzoMBsjxpXOv/7ngL0SAF/helCrGSoPKjx4UAfJ/YWDElkeREU8DNtGoqPoki/8y9v4mJU8bpsNoDtyfaYAqEqWCOQMJGIAzkdWy3A1ly2SC1/G+Uw/K4SzvOT1fgJnfwyWGRNPXcOKEqqabaDhcR1LrJ/olLLp//7R04JcgILjWLX/afMpwy+75Zf6lZwiosIOOoSfAn0irxHv5a7Sj2qvr0rOaMa6if02H9gKVCuWTqvpqkyuUJbCIjYLoOfPn9Fld4u0Mvv+HhQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB5236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 09:15:14 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 09:15:14 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: use of yocto-cfg-fragments
Thread-Topic: use of yocto-cfg-fragments
Thread-Index: AQHaDXbDLSVFxUD5HE+bclx//pSk0LBnZmOAgADrL4A=
Date: Fri, 3 Nov 2023 09:15:14 +0000
Message-ID: <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
	 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB5236:EE_
x-ms-office365-filtering-correlation-id: b179b710-3dbf-4856-3d0e-08dbdc4d6374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lldnOmLL8dieg2NFqud14pazozSIxuAmOhvaS279CJMJIrVYcIyOxncQJKLTI63X4zyRTZJFmP8lTYGwocCEY5VRb0YR8nPOzpRVEbBoVfPJsx825Xwx0Ow3C8z+jmReVLY5o+WszQGQJdohRxG25fhaeNuyx1/V1TmoCHWMndBV8oviKSTNAPfPbA1V8hcKanm+WpEMl4tDq4Dvm1dmqWFxXA09KH20tfwfNw+zPeyN13BhuiNapYEWDyaVYwHru5i0EDzl3UB8UvYIfgRWEgqTnOmMbWrAMErRccvY5j2q9XX2/I8p+mLc0DwFDLAJVpvpYKnbotMoZuawxWnTko3HHIUf91B9Q8JM02hb55oT6vSFOL7kC4IgIh60u9pjmveys72C4KoFSJKoDe4U6oMUTlluIvI6++yB4z7oK08tPrd5D6uRG/w3soH6najWTRwZU+cEmgp26qw7pzbzgkr/30vyjk12alx7I1ksO+ta+I79IROxbaQBkV9w5bEWwD/1joo8hKQSx6i/f3Qw/WeMURzEDv4dH9q8VtqRBDfNJUBuZZVRkb2hUSVzhXoQIQi7euXspDwO57p7QqLthJbCzw7aDmD83gLoqY9hSykWO+jQXbCwbO6C5iB6FEj+PjDlNg8tKEUctLMh+jwgPw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(8936002)(2616005)(66446008)(64756008)(4326008)(8676002)(66556008)(66946007)(91956017)(66476007)(76116006)(5660300002)(478600001)(2906002)(6486002)(41300700001)(71200400001)(6512007)(66574015)(6506007)(83380400001)(54906003)(316002)(6916009)(82960400001)(122000001)(15974865002)(86362001)(36756003)(38070700009)(38100700002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cnAzQkFXeFVWRFlmSnk0QWdISWtyQm12SDliT0pFR09HQUdLeTdoWk9Rb1RF?=
 =?utf-8?B?eEpmVjZJZ3JMUk16UFdpMmUwa2pDMnE0T1E0M3VFdU5Gc01UMTJ4ak5ZM05I?=
 =?utf-8?B?Q1hOdUR1Nmg5NHIrMUVUUThUUFJxL1JWT1FEd3N1M05NcmdDZndxNHVhSGNY?=
 =?utf-8?B?U0UrZkVnVC83aVNLOWhnaDJRbW1JOXEyVFBxSDhhZ3Z3WUtONitKSzV4ZnFl?=
 =?utf-8?B?RW5qWUIzUTdLMTA1TE5SbzhJQVRXL2oyVzZHQlhROTcvbTdaMmw0cnVlL3Rl?=
 =?utf-8?B?VHB4ZS9SUVpxOWtyM29pSXhZR2ZHYXNEa3RMc1ZKQmIxbjhNZzBUQ0t0WXl2?=
 =?utf-8?B?WlNyaG9WV3ZQVkhYem1DRjRJVnVSWk8yWFhpUDhlUTFxVlFUOVhZY0xTN1A3?=
 =?utf-8?B?bmQ1RHUwcStiWFp6eDlaSU1CeW1UUHpZM1lSU1ZIOWlNVVo2UGJBaFlGNFpH?=
 =?utf-8?B?VUQ3SEltSFV0ZllTZWFyMGZMR2UyVklieGRoMFhSeDQ3aWZoaGZsRE0zRWRQ?=
 =?utf-8?B?QU4xUnQxY3dIbkFaTEloSjAvVTdEdGNsTE5ZeVFzYk9kamt3VEI5ZSszbU40?=
 =?utf-8?B?YkhqaHlYeVJjQkp1RUNxRzFLcWd0ZWxoSk53YldXN3ZrRm5uUmMvTGVwd2h5?=
 =?utf-8?B?TE8zQWduMnVUS3UyTmNxcFRDRStZc2M4b3J4d1djQmFEYnNjTE5Ha2M2WkpG?=
 =?utf-8?B?QzFwZE5yMVNwVXhtcVI3aGZ2MlhlRXZ1L3R2Kyt2RXlhSWx1eXNCT2ZIRm9Q?=
 =?utf-8?B?cE8xU3hjZ3RrQW1KL3U5dlFqUGMrc2p4NzQweWl0SU1ZWjZsTWRpcERWZTB5?=
 =?utf-8?B?cDhpakh5Q3psR0ppbDNxd1oyNWlUYWJpTlduQnBlYm1Mb2MzNU9oNzQ3QVNG?=
 =?utf-8?B?U1N0ZjY0aFF6dzErRTlpekJTZ3FJZ3hZOURncFRtVmxuWGRXTEkzTzNEb3g0?=
 =?utf-8?B?Y3dLa1FxYTRsamliemlQZTBDQWwrT2ZyQWVXdnIxQWk3OEdhOUc0Wmd1cE01?=
 =?utf-8?B?NXJHQmlEVnh2U0VKVXgzQ1NFYU10LzJDSXJDTDdGdnU1Mnh1WXg2OUt0U2Ew?=
 =?utf-8?B?V2dtUWovejVXMHBuNTY0c3Fqd0FJWmg4TDJyYkxJVFkrS25TSGtnVmk1WlZv?=
 =?utf-8?B?TXp0b00xZnJ6OExsNWczZVRZRXpKZ2tuL0pyN3JxZFhndVIrZWZqSW00Nm81?=
 =?utf-8?B?by9Xb1hWNDRNVzJFd3JZU1Q4bDF4VWpReVl1UnpzMTI4ODRpWTQxMlFpM01r?=
 =?utf-8?B?em9TWUVZSzBQZDNGL3JMK2JCRithb005THN1QWJWejVTemFrRERjKzhoVWRj?=
 =?utf-8?B?bTVzVy9zMVVpYlAxbnpzNGZrMzJ0djdDY0ZDN1lTUFZUSGU5Vld5WTMyZm5n?=
 =?utf-8?B?RytMZjhDRy9mUWtvZitBdFhWcWNCbzAwNkRFaWM4V1ZkS2NteW1LdFNyUGhH?=
 =?utf-8?B?WTZMZUp4VXJuR1hXZkw1WHV1Rzhybnl6cFNlbWdMYkJaajVrM2ZiOHIrQWpa?=
 =?utf-8?B?SGVvdmdNa0p6TG9YZXdaVDZaeE5rZ1hlMkx0Sm9tUDVwM3dkRkVGSTVZOTha?=
 =?utf-8?B?RFZLZ0NERzBpVWFhTzJWRkZjYi94TWhjRkJaeXNHTjdzNVZXOENZTWNzODQ5?=
 =?utf-8?B?NnhZUzdSU1c1YlRPUGM3VGkxQUc5Uk8wK1FWM0dpKzJraGtRUGM5VFI4Tk9h?=
 =?utf-8?B?Ry9nRkh2T3BQNFJ6dDEzYzhFNUJ3cE1saTVSenM0YWdHRFpLWmlsMVBuQzlL?=
 =?utf-8?B?TXZCaEZVSHlhaDRRSE1POVB2WkVMcmFMek9oNm1RQmNZN2RtRUE5N3d6SEF3?=
 =?utf-8?B?eU03Q21YalkwbU5LYWF0RFFZbUN3ZWYyUUlDSkJvU0JPclNEUHhybWVyS0Fn?=
 =?utf-8?B?SFcvNWgrVEFNdTBCckpwOFhmaVJhOXJJdkVFSzIweWEyMi9PUDRxNkVucWtO?=
 =?utf-8?B?VDB3SmFXR3J3bHNvUHNBdXlvQmhqTzJWYzNaU3JxeUU3V2FJVjRIeDNCcm5I?=
 =?utf-8?B?aVo4dUpmY0FBSzYyZFdmRGd2VjBmZmtqdWpQbHRHb0oxeXg4V1Q3ZTRrUVA4?=
 =?utf-8?B?WXJXaWtLQ1VaOGx0WWFpYzQ2MXZGR0EyT0owTnNFdm1aQW5nUWlxaTduc29l?=
 =?utf-8?B?ZnB0aVRSeCt6dk5nakhocVlhc1hTdWRYeURabTZ2TmxUTEVsUXpUT1pqUFhW?=
 =?utf-8?B?TGl3TDBzcG9tand2N3ZNcU5NVExVelV1cXFjMXR2eHhTQytKRHBiT1VpcFNm?=
 =?utf-8?Q?5y9yswwREBV2SR9RJxzS20S5TVgtXoSQcbh81Artr4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <743B619C33E7934DB276744E323FC291@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b179b710-3dbf-4856-3d0e-08dbdc4d6374
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 09:15:14.1645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HG4P70tfcTj+//VstjqPCeZzpKwX8DmbbDiEsYCBOVKZcomPdWF5gptvAsJTrE2wE3MLq0jkmlwRra+EoWL/tg8hdQ5X1a5YGzjrBsL6+JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5236
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8415

SGVsbG8gQnJ1Y2UsDQoNCnRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlcGx5IQ0KDQpPbiBUaHUsIDIw
MjMtMTEtMDIgYXQgMTU6MTMgLTA0MDAsIEJydWNlIEFzaGZpZWxkIHdyb3RlOg0KPiA+IE15IGN1
cnJlbnQgdW5kZXJzdGFuZGluZyBpcyB0aGF0DQo+ID4gbWV0YS12aXJ0dWFsaXphdGlvbi9yZWNp
cGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b192aXJ0dWFsaXphdGlvbi5pbmMNCj4gPiBtYWtl
cyBhbiBhc3N1bXB0aW9uIHRoYXQgYW55IHR5cGU9a21ldGEgd2lsbCBwb2ludCB0byB1cHN0cmVh
bQ0KPiA+IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWtlcm5lbC1jYWNoZSBidXQg
dGhpcyBkb2Vzbid0IGhvbGQNCj4gPiBmb3IgbXkgdXNlIGNhc2UuDQo+IA0KPiBjbG9zZS4NCj4g
DQo+IFRoZSBzdXBwb3J0IGFzc3VtZXMgdGhhdCBpZiBzb21ldGhpbmcgaXMgb24gdGhlIHNyY191
cmkgbmFtZWQNCj4gImtlcm5lbC1jYWNoZSIgdGhhdCBpdCBpcyBhIGNvbXBsZXRlLCBzaW1pbGFy
bHkgZm9ybWF0dGVkIHJlcG9zaXRvcnkNCj4gdG8gdGhlIHVwc3RyZWFtIC8gY2VudHJhbGl6ZWQg
b25lIHRoYXQgSSBtYWludGFpbg0KPiANCj4gSWYgdGhhdCBpcyBmb3VuZCwgaXQgaXMgcHJlZmVy
cmVkIG92ZXIgdGhlIHlvY3RvLWtlcm5lbC1jYWNoZSBwcm92aWRlZA0KPiBieSB0aGUgeW9jdG8t
Y2ZnLWZyYWdtZW50cyByZWNpcGUuDQoNClsuLi5dDQoNCj4gPiBUaGUgb25seSB0eXBlPWttZXRh
IGlzIG15IGxvY2FsIGZpbGU6Ly8gc3RvcmFnZSBhbmQgdGhlIGZvbGxvd2luZw0KPiA+IGxpbnV4
LXlvY3RvX3ZpcnR1YWxpemF0aW9uLmluYyBwYXJ0IGxlYWRzIHRvIGZldGNoIGZhaWx1cmUgKGZl
dGNoDQo+ID4gZnJvbSBJbnRlcm5ldCBub3QgZXhwZWN0ZWQvZm9yYmlkZGVuKToNCj4gPiANCj4g
PiAjIGlmIGtlcm5lbC15b2N0byBoYXMgYmVlbiBpbmhlcml0ZWQgKGhvdyB3ZSBjYW4gY2hlY2sg
Zm9yIGNvbmZpZ3VyYXRpb24NCj4gPiAjIGZyYWdtZW50IG1lcmdpbmcgc3Vwb3J0IGF0IHRoZSBt
b21lbnQsIHRoZW4gYWRkIGEgZGVwZW5kZW5jeSBvbiB0aGUNCj4gPiAjIGNvbmZpZ3VyYXRpb24g
ZnJhZ21lbnQgcmVwb3NpdG9yeS4gVGhpcyBhbGxvd3MgdXMgdG8gYmUgc3VyZSB0aGF0IG91cg0K
PiA+ICMgZmVhdHVyZXMgY2FuIGJlIGVuYWJsZWQgdmlhIHRoZSBmcmFnbWVudHMNCj4gPiBkb19r
ZXJuZWxfbWV0YWRhdGFbZGVwZW5kc10gKz0gIiR7QFsnJywgJ3lvY3RvLWNmZy1mcmFnbWVudHMt
bmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QnXVsoYmIuZGF0YS5pbmhlcml0c19jbGFzcygna2Vy
bmVsLXlvY3RvJywgZCkpXX0iDQo+ID4gDQo+ID4gU3VtbWFyeTogMSB0YXNrIGZhaWxlZDoNCj4g
PiB2aXJ0dWFsOm5hdGl2ZTouLi4vcHJvamVjdHMvY2NwLXNkLXZpcnQvLi4vLi4vbWV0YS12aXJ0
dWFsaXphdGlvbi9yZWNpcGVzLWtlcm5lbC9saW51eC95b2N0by1jZmctZnJhZ21lbnRzLmJiOmRv
X2ZldGNoDQo+IA0KPiBBdCBhIGdsYW5jZSwgSSdtIG5vdCBzZWVpbmcgaG93IHlvdXIgbG9jYWwg
a21ldGEgaXMgY2F1c2luZw0KPiB0aGUgZnVsbCBmcmFnbWVudHMgcmVjaXBlIHRvIGZhaWwgdG8g
ZmV0Y2guDQo+IA0KDQpGZXRjaCBmYWlsdXJlIGlzIGV4cGVjdGVkLCBhcyB0aGVyZSBpcyBzaW1w
bHkgbm8gYWNjZXNzIHRvIG91dHNpZGUgd29ybGQgYW5kDQphbGwgZXhwZWN0ZWQgcGFja2FnZXMg
YXJlIG1pcnJvcmVkLg0KTm93IHRoZSByZWFsIGlzc3VlIGlzIHRoYXQgcHJvdmlkaW5nIGxvY2Fs
IHR5cGU9a21ldGEgcHVsbHMNCmdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWtlcm5l
bC1jYWNoZSBhbmQgY3VycmVudGx5IHdlIHJlcXVpcmUgbm8NCm9mIHRoZSB1cHN0cmVhbSBmcmFn
bWVudHMsIHNvIHRoZXJlIGlzIG5vIHBvaW50IGluIG1pcnJvcmluZyB0aGUgeW9jdG8ta2VybmVs
LWNhY2hlDQpyZXBvIGp1c3QgdG8gc2F0aXNmeSBmZXRjaCBhcyB3ZSBkb24ndCByZXF1aXJlIHRo
ZXNlIGZlYXR1cmVzLg0KDQpDdXJyZW50bHkgSSBzZWUgbm8gd2F5IHRvIGNvbnRyb2wgdGhpcyBi
ZWhhdmlvdXIuLi4NCg0KPiA+IFdoZW4gSSByZWFkIHRoZSBjb21tZW50ICJpZiB0aGUga2VybmVs
LXlvY3RvIG1ldGEtZGF0YSByb3V0aW5lIGF1dG9tYXRpY2FsbHkNCj4gPiBzdGFydHMgdG8gYWRk
IHRoZSByZWNpcGUtc3lzcm9vdC1uYXRpdmUuLi4iIEkgZ2V0IGEgZmVlbGluZyB0aGF0DQo+ID4g
dGhpcyBmZWF0dXJlIGlzIHN0aWxsICJ3b3JrIGluIHByb2dyZXNzIi4gQXJlIHRoZXJlIGFueSBm
dXJ0aGVyIGRldmVsb3BtZW50cw0KPiA+IEkgY291bGQgdGVzdCBpbiB0aGlzIGRpcmVjdGlvbj8N
Cj4gDQo+IFRoZXJlJ3Mgbm90aGluZyB0aGF0IHdvdWxkIGZpeCB0aGF0IGlzc3VlLiBUaGUgaW4t
cHJvZ3Jlc3MgcGFydCBvZiB0aGF0DQo+IGlzIHRoYXQgSSBwbGFuIHRvIHJlbW92ZSBhbGwgb2Yg
dGhlIGxvY2FsIGZyYWdtZW50cyBpbiB0aGUgdmlydHVhbGl6YXRpb24NCj4gbGF5ZXIgYW5kIHJl
bHkgb24gdGhlIGNsb25lZCBrZXJuZWwtY2FjaGUgZnJvbSB0aGF0IHJlY2lwZS4NCj4gDQo+IEkg
ZG9uJ3Qgc3VwcG9zZSB0aGVyZSdzIGEgbGF5ZXIgSSBjYW4gbG9vayBhdCB3aGljaCBoYXMgeW91
ciBmcmFnbWVudHMNCj4gYW5kIHRoZSByZWxhdGVkIGtlcm5lbCBiYmFwcGVuZCA/IEknZCBsaWtl
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUNCj4gbG9jYWxseSBzbyBJIGNhbiBkZWJ1ZyBpdCBpbiBt
b3JlIGRldGFpbC4NCg0KSSBjYW5ub3QgZWFzaWx5IHBvaW50IHlvdSB0byBzb21ldGhpbmcgcHVi
bGljbHkgYXZhaWxhYmxlLi4uIEJ1dCByb3VnaGx5IGl0J3MgYQ0KY29tYmluYXRpb24gb2YgbWV0
YS12aXJ0dWFsaXphdGlvbiBhbmQgYSBrZXJuZWwgcmVjaXBlIGRlcml2ZWQgZnJvbSBrZXJuZWwt
eW9jdG8uYmJjbGFzcy4NCg0KTm93IEkgbG9uZyBhcyBvbmUgZG9lc24ndCBoYXZlIGFueSB0eXBl
PWttZXRhLCBtZXRhLXZpcnR1YWxpemF0aW9uIGRvZXNuJ3QgcHVsbA0KZ2l0Oi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcveW9jdG8ta2VybmVsLWNhY2hlIGFuZCBhZGRpbmcNCiJmaWxlOi8vZmVhdHVy
ZXMvZGVidWc7dHlwZT1rbWV0YTtkZXN0c3VmZml4PWZlYXR1cmVzL2RlYnVnIiB0byBTUkNfVVJJ
IGNhdXNlcw0KeW9jdG8ta2VybmVsLWNhY2hlIHRvIGJlIHB1bGxlZCBldmVuIHRob3VnaCB0aGVy
ZSBpcyBubyBsb2dpY2FsIHJlYXNvbiBmb3IgdGhpcy4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRs
aW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K


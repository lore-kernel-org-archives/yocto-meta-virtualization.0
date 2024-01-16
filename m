Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85270C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 11:35:54 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web11.11318.1705404943964138989
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 03:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=L38TEmR0;
 spf=pass (domain: axis.com, ip: 40.107.247.75, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7Wlr3VuuUKGJQ1FCiis7JcGQ0HMJ8yuuhTu9VYWPmXxHoZCCnvCaEi4Dmiz1DMOsUTFv7J5XOxckDHh/O6LD5Asvo/tBT6UFEqSYTpd8f21RlcSQ7tM4shtq7Li0haZVN7CRgXuOIeCEhbLsFzvDq3UqrO+KjbvJc2PnuwDX+njj3M2UCv5hDYYvFrci9EFfRJIBLCsKm7wW++MoNCqYMTeN2SJK2yvRBChVqiHZW1ILvp7pNBmAV1Ozl8JjZugv/xwu0z80WYDSDJCboSaZ7vpA9WT6ewQtP6SPJo/1a2Gb0WVBD8vzUdPfyEkLygRKeq3RA1g4WyDiDMYLJWmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7uNL09N8/XsPV+vW/t+NRgjg5zrLl2ZzW7rtC+6ThM=;
 b=LvDC8hwNsr4sLZoGf11PtR0CZXI+TEd4OxYuyPQY92mHQAyOlxfCDG+lCAxcUJFZXpE5GWf9hPBJLob1/fmkB6NBId0m0H1J31f99NzTDkZek2pXfNe4/LIiyuKC2DC0wCyl57BEkRKbdXnLG6ErolkoW8Ev204f6H+9kfjlxZrFpUkSgOfRT/sAtYDv/GmuWGNxyc2GAAUgc9qzNaGVdq2hS2qegZ+G7ZKb+jheraAoOYJD9tlIs61KcoYJDV66x4wRymO2RHR+otNDGIKOJUfuyXYsY9Te3thhJ7Jng/GRNPE3ekCbaxGyANAkYYj0AtxzF0TC70ZgNDNvMvfQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7uNL09N8/XsPV+vW/t+NRgjg5zrLl2ZzW7rtC+6ThM=;
 b=L38TEmR0mW7hXKgYXz4c6wPK38VChceTOSCzeWHoNh/XzA/izdvyoFuLrkD4vcZVUqR0gqjeQpSvLbU9JroXsYAlHcLFnH6LSBQ1iGyKIvTl3pgMh7ZnVvwBqb70fxzK1X8MlI+q9+URJXA5TdH0yVkCP8OqDGJOyabF8ZmEMxg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB5765.eurprd02.prod.outlook.com (2603:10a6:20b:102::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 11:35:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 11:35:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Thread-Topic: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Thread-Index: AQHaR9WzI2hJj3yE006iw5iHkvxeCrDcTfFg
Date: Tue, 16 Jan 2024 11:35:38 +0000
Message-ID: 
 <DB5PR02MB102132B690BBC1F8EE9F6DDF8EF732@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240115170030.3531505-1-pkj@axis.com>
 <CADkTA4PkPBXp1tVuth0Cj8WvTTX4J-NhHmDHoHm-gGdiD3==MA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PkPBXp1tVuth0Cj8WvTTX4J-NhHmDHoHm-gGdiD3==MA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB5765:EE_
x-ms-office365-filtering-correlation-id: 31e256eb-9e84-4b0f-27a4-08dc1687431e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kBQi5naixRIV1t3Hj/7kp7f38csHZNFA0C+5yIkpfQHCxeUuuNXkHedqT/AgpMXINewk0D57MNrv4LWB8mwPHXOyJTvpJWpKzDp/3nCLuuaeZzNnwGtIbnAUW7gsDT+ce0VROLCa6NGFOxU7kNh8X36p+/RQbwoXhReVNwL7VWtI74QFa3OIhIbMSp2I6a+QDZlz5Fdd/HJmTPgBTyEKPaP5p7P8bqC3oZpzZMv9aHPjyrrlvh+tGG7UxfWGxH57mKdnh2kdolpasT4a2XyNytD/5bVZoMO0xj95azZU3/lZ/vSLt/TI6WZVhZJpGmKy4tpZmezn7k00h1XCLyCSyPJGMi0dwZ0GlaR2r5lgtf78+h1ViQqxZDVGmEopaEnB13J+x7O808YafN1SH+YWGOqpW1LhKSa3AXr7AOqs66z1hjHqUrYVun+7RgarN0PpgMHojhkOv6Tb3iZ09+S6wfVmMH8O/ttRbnlpF5WGX9RHXkjt0ZZv3Bo76I27HQYt1KPSRjvYeoFthAvyk7R/H4g858RVEkCF9KWpV4tgghinJeQcJfISP5piMDpExqDqKAo1aKmN+7qdavHs4eQWro/4lLuXN1BK8JOb0Fb63lODlBPxtJ6L2+T1/tky8zoHvMASKJ3IR3tgToJ4368IolVNjdt58xzyEUhs7bfRiq8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66899024)(122000001)(41300700001)(2906002)(33656002)(86362001)(38100700002)(7696005)(53546011)(66446008)(6506007)(66946007)(64756008)(6916009)(8676002)(316002)(66556008)(8936002)(9686003)(71200400001)(66476007)(966005)(478600001)(83380400001)(5660300002)(52536014)(4326008)(44832011)(26005)(76116006)(38070700009)(55016003)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dTZ3M2dld0xNYmdDVGpiMUg0N1p3UGdsT0h0VUdNNWNVeXFJWjIvQzFBRk82?=
 =?utf-8?B?MVNaUk5KUTVYbW5udE5sbXluOUgwQ04wcEpmOTI1ZHlMZmNMN3l5bjJzWm4v?=
 =?utf-8?B?WnFOVEZDR0huOERoSlNsYlRaN2tZVmtYck01ZzlRWXpzMzgwdTlDZUVQd3A1?=
 =?utf-8?B?Rm1zT1RKOWtnajU2Mnp1ZnplK1YvV2QrRTVmSHlsS1VCSEZMeXF2ak80S2tN?=
 =?utf-8?B?cUhsSmZFLzNmNE5aNlFER1EvRXpjd1pMQ2ZWL1RZY3ZhMTE5dkZDQmVqN0pB?=
 =?utf-8?B?VXdxQkdNcjVNSHNBZWRkNk45Zi9uSE5HWFBBT2tmY1pEK01YT0J5QUx2TndC?=
 =?utf-8?B?d2s5RC9aSFdodis2bWJicWZCT1BFZmhUN3BJM1dZWkJiNEZEdkEyUlZZL2ZT?=
 =?utf-8?B?TCtEdERxMC9JYmZVNXRONEYrRlBmczNiU095TVpjWFY2R1d3eXhCUGhoWEdH?=
 =?utf-8?B?MGs1ejJKbW5ydnNLd3YrU3RndGxJMW5QbFdVeVp6aGxra3laRFRnYUdNR0Fz?=
 =?utf-8?B?dGRJT2FSYU42eXlsYmtPSVVtakRUTlk4S2RFTlFBT25JYlFUcis4MGtXcWZV?=
 =?utf-8?B?WnZ5TzZmU3BGUE1TeS9tdHJjUHpZbTVuQmdUWERQRHpsVFV1dWNEZHZJb2NZ?=
 =?utf-8?B?dnR3N2haNElhVitaRDVqWlpSVDlpZ1hneklZZ3ltZERHR2l4eEo4aEpPOE96?=
 =?utf-8?B?TDNvRlZyUXBOdFQ4aXUwUWR5LzcrcEZaNkdWVWN6YXBtKzc3aUZQODJDM1BF?=
 =?utf-8?B?MzBLKzREZm9nN3M1RnZicy8wa25vOUx0dXJlKzFKZVRDMjYrdkEzeFdaMEhj?=
 =?utf-8?B?RW9CMnhOdGVsdUFJRm1UaCtZM0E1djJQK3EyMEJEUlgvbFNEeWlHb2daOVRy?=
 =?utf-8?B?NHJKUmJGbzIvdDRRVGFiK3M0OGZETWJPQWVzTmxVYTJRL00ySEFVYmtXaGdW?=
 =?utf-8?B?RlJZZkM1TVg3TkNVVHdIRlZoMTk2c0VUUlpoOS96RGJNZ3E2bFk0STk5cmRs?=
 =?utf-8?B?a0N1TldOQ3c4UWozSThPOWdlTkUveVlDWUVsV3pMYkJwSFpDSGlYYitvSXJk?=
 =?utf-8?B?NFhRTkE4Y1crOENRUGUxWEtIMlZFQlpzZTM5UUFNL2hCOFk3eTA2c3ZBYVor?=
 =?utf-8?B?UzRKbU4vMm9IWjMvN2FvRUhpMlZaYjJnN1RweGJENHBFSklUTjFaaHEyeExT?=
 =?utf-8?B?TEpmZ1YxT2FXVVJCRGttcUx5ek1kalBrUzcxN05Tc0EwS1lXUEhSQjVQNTQy?=
 =?utf-8?B?K1NoZWdCVUsvOEJrblFvZVhZUDNkeUtmYUhiRkduRjVaK0hYNWhIaHlLMHMy?=
 =?utf-8?B?Rks1NHNUY0FyUHJXaHRYVTEvWjlzSVlrb2wrdXdnaUdqbkVqV1Y1QmVuNW1H?=
 =?utf-8?B?WTZKY3o0YllNMStrWGszc3IvNTY1dkpheE9XZW1XWi95MmR6ayt6Z0htYlBt?=
 =?utf-8?B?L0Z5THZvZlBzQkFkV09XQVIyeUdPYkEzMVhhNVpiV1ZYZXBOUC9QMzYwTERr?=
 =?utf-8?B?NmdOMWlUZ2xzWEM3TW9NN21QZGw5YzVOT21iTitVUHJ4bFhPWHJPcFNVTkxV?=
 =?utf-8?B?dmdpNExHSEovVXArLzFZN1hmSnA4YlVTSDZIdVVCa2UyS1FVN2dTeHFWaHZv?=
 =?utf-8?B?TW5zM1FaQkhRWTI5S0FPbjBDNEx4OHBPdVdoajNFY1luSDA0c201bysxemJQ?=
 =?utf-8?B?TkR0TFZlQW91a29yS1VFT1J0WEJwSW1HWndMZDhackpvWDB6bzFNcWIwc0l0?=
 =?utf-8?B?VjNtZFNvY2FoNjVZdkRYSXNGelVlQVd2YkoyazhzOWRaSEFFbllWcjlWT2I5?=
 =?utf-8?B?dTFJNFpYVjBQeUxXT0xKNExDZ2wrclpRUTRRY29WY0pjUC92T3JYZXd2UFlZ?=
 =?utf-8?B?czJsbEJZWUJCNXVKWGdFcDNCWEFhZlRyaS9hV2xteEsraE1meThwZFRwaHNS?=
 =?utf-8?B?bGtjcnZRbnA1dGJxSllVeHVyNFppOXQyclNjL2lqRFZCRWNHSUNQUlZYR1Nq?=
 =?utf-8?B?eE5vdmdrOGZrS0F5a29ha0lZaThuSjY5WVcxMTBiMDdiL0NaeW1wZUxqWGVi?=
 =?utf-8?B?L0NsZUtpQ2FnV3oyc2syWE5SZktEaEpRK3VrRExnV3QxV1dqZEZEWWZVcllq?=
 =?utf-8?Q?VD/M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e256eb-9e84-4b0f-27a4-08dc1687431e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 11:35:38.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnYlypX8x2c4Svetp8NsynUiXPkDQ67Kwi7E+uAPzbOKaC3pP2G1V5EbvxI1oAlq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5765
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jan 2024 11:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8543

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1
Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMTUgamFudWFyaSAyMDI0IDE4OjEw
DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4N
Cj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFtQQVRDSF0gY29udGFpbmVyZC1vcGVuY29u
dGFpbmVyczogVXNlDQo+IFJERVBFTkRTOiR7UE59IGluc3RlYWQgb2YgUkRFUEVORFM6JHtCUE59
DQo+IA0KPiBPbiBNb24sIEphbiAxNSwgMjAyNCBhdCAxMjowMOKAr1BNIFBldGVyIEtqZWxsZXJz
dGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRo
aXMgYXZvaWRzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoNCj4gPg0KPiA+ICAgV0FSTklORzogLi4u
L2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiOiBWYXJpYWJsZSBrZXkNCj4gPiAgIFJE
RVBFTkRTOiR7UE59ICguLi4pIHJlcGxhY2VzIG9yaWdpbmFsIGtleQ0KPiA+ICAgUkRFUEVORFM6
Y29udGFpbmVyZC1vcGVuY29udGFpbmVycw0KPiA+ICAgKCAgJHtWSVJUVUFMLVJVTlRJTUVfY29u
dGFpbmVyX3J1bnRpbWV9KS4NCj4gPg0KPiA+IGlmLCBlLmcuLCBSREVQRU5EUzoke1BOfTphcHBl
bmQgPSAiIC4uLiIgaXMgdXNlZCBpbiBhIGJiYXBwZW5kIG9yDQo+ID4gYmJjbGFzcy4NCj4gDQo+
IEFsbCB0aGF0IHRoZSBhYm92ZSBjb21taXQgbWVzc2FnZSBkb2VzIGlzIGV4cGxhaW4gdGhlIHN5
bnRheA0KPiBvZiB3aGF0IHlvdSBhcmUgZml4aW5nIC4uIGJ1dCBub3Qgd2h5Lg0KPiANCj4gV2Ug
aGFkIHRoZSBCUE4gcmRlcGVuZHMgb24gcHVycG9zZSwgc2hvd2luZyB3aHkgdGhhdA0KPiBvcmln
aW5hbCBwdXJwb3NlIGlzIG5vdCBuZWVkZWQgIC4uLiBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdA0K
PiBtZXNzYWdlLg0KDQpJIGhhdmUgbm8gaWRlYSB3aHkgaXQgd2FzIFJERVBFTkRTOiR7QlBOfSBy
YXRoZXIgdGhhbiBSREVQRU5EUzoke1BOfSwgDQpJIG9ubHkgYXNzdW1lZCBpdCB3YXMgYSB0eXBv
LiBUaGVyZSBpcyBub3RoaW5nIGluIHRoZSBvcmlnaW5hbCBjb21taXQgDQp0aGF0IGluZGljYXRl
cyB0aGF0IGl0IHdhcyBkb25lIG9uIHB1cnBvc2UuIA0KDQo+IA0KPiBNeSBhbnN3ZXIgcmlnaHQg
bm93IHdvdWxkIGJlIC4uIC5kb24ndCB1c2UgUE4gaW4geW91ciBiYmFwcGVuZA0KPiBhbmQgeW91
IGNhbiBhdm9pZCB0aGUgd2FybmluZy4NCg0KVGhlIHByb2JsZW0gaW4gbXkgY2FzZSBpcyB0aGF0
IG91ciBhZGRpdGlvbiB0byBSREVQRU5EUzoke1BOfSBpcyBkb25lIGluIA0KYSBjb21tb24gYmJj
bGFzcywgc28gSSBjYW5ub3QgY29udHJvbCBpdCBwZXIgcmVjaXBlLg0KDQovL1BldGVyDQoNCj4g
DQo+IEJydWNlDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+ICByZWNpcGVzLWNvbnRhaW5l
cnMvY29udGFpbmVyZC9jb250YWluZXJkLW9wZW5jb250YWluZXJzX2dpdC5iYiB8IDIgKy0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2NvbnRhaW5lcmQvY29udGFpbmVyZC0N
Cj4gb3BlbmNvbnRhaW5lcnNfZ2l0LmJiIGIvcmVjaXBlcy1jb250YWluZXJzL2NvbnRhaW5lcmQv
Y29udGFpbmVyZC0NCj4gb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gaW5kZXggNWMxZTEyNy4u
MWRhZGYyOCAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC9j
b250YWluZXJkLW9wZW5jb250YWluZXJzX2dpdC5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFp
bmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gQEAg
LTk1LDYgKzk1LDYgQEAgSU5TQU5FX1NLSVA6JHtQTn0gKz0gImxkZmxhZ3MgYWxyZWFkeS1zdHJp
cHBlZCINCj4gPg0KPiA+ICBDT01QQVRJQkxFX0hPU1QgPSAiXig/IShxZW11KT9taXBzKS4qIg0K
PiA+DQo+ID4gLVJERVBFTkRTOiR7QlBOfSArPSAiICR7VklSVFVBTC1SVU5USU1FX2NvbnRhaW5l
cl9ydW50aW1lfSINCj4gPiArUkRFUEVORFM6JHtQTn0gKz0gIiAke1ZJUlRVQUwtUlVOVElNRV9j
b250YWluZXJfcnVudGltZX0iDQo+ID4NCj4gPiAgQ1ZFX1BST0RVQ1QgPSAiY29udGFpbmVyZCIN
Cj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUg
KCM4NTM4KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS0NCj4gdmlydHVh
bGl6YXRpb24vbWVzc2FnZS84NTM4DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
LnlvY3RvcHJvamVjdC5vcmcvbXQvMTAzNzQzMjM1LzEwNTA4MTANCj4gPiBHcm91cCBPd25lcjog
bWV0YS12aXJ0dWFsaXphdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gVW5z
dWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6
YXRpb24vdW5zdWINCj4gW2JydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+DQo+IA0KPiANCj4gLS0NCj4gLSBUaG91IHNoYWx0IG5vdCBmb2xs
b3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0DQo+IHRoZWUg
YXQgaXRzIGVuZA0KPiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJl
ayBJSQ0K


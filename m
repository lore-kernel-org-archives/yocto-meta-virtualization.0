Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0257C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:14:15 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web10.51527.1699017245565571928
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 06:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fEKugnAB;
 spf=pass (domain: siemens.com, ip: 40.107.13.52, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO9qJn4B/Fe7BvWU0oxi1x6mZgEdy0UGrJScYsypF5HoH2UuiS8TRuCStmAtdXXsG80JLNNmeDm4WlPaviuEwhXWLhev8/XzLzit2VBZoRRf4ckw5o17Bip+tPGiiENr2wRt3XibvJ62sa1T1AchZjrAGWtnZFXpAEvKp2GeT1b5g+iReYSLfGonGvlBZ0DT8PZ2Z9dsH1IoOIUcOVzVjD7faG1YDCqhq1TEkZoQKYvJk346t9OGYrJugVLRpqznfu7B4DU130FEF9KgmIJKh7MfVsSBdZm83c2J4z3frfzlp6ejGJUPzYhSFjRPrXAUMfLZQL7um/RPbyCZhrX0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOzXuUpRjQZD3FBEYk03HAtaQ+EnmimeOx1LJpgfdKc=;
 b=eGzGEke5F2osh2fGbwmyI6ZRSOgS/z4yyBRn1iWf/vJkjIaWzhk5BIgYpaazCuHq8Zw8FnyGn7aJYnTVQ7tRPX14eLVo9nEHH9QRaJ/2KzlqT/RWkrdwT7kvb3/rVod0OCWHZ5bDS1DPJRt8Nzjao1lRw5scN40VGdcBR8JWo2/U7BEKqmf0VTZ6dbxnC8tYbVcFVKtBnJNcDR74b604ER8GlLic1zfScJH/wDj1PwjgXDy86bJGuK5M5Z8sqkJUuJ3NsryFMZUII+Vz1468OtaPB24JDSX1/CuLwkHitDDnR1+GNK4GmOE3jXwLKA79ZulG/09B7m6bWJjHr9g/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOzXuUpRjQZD3FBEYk03HAtaQ+EnmimeOx1LJpgfdKc=;
 b=fEKugnABrNJQGx4bqIHuD07B7YK6qRT1hoBOYSI8MikHT168DBEO5npgAe5VlPlLrJXqPNeCaom2nhJjTGNJI53fVSqSvn8QX2TlUDQMz0GqyHFZPf7s3em+UqIGvnbYi2Im4ELfmlo9QZSXAu4y+/1VpXeTslwQydMTblwQ0/b41h2KL4sB0eTPYfTH4TqyRp2//nWw5zIoAl9qpVoyOnU7EPmaSjvG1KrmCHUmewJmS4yUOk/tPeOhmxhfRpDJtiLsD8Kauax3aJp207P5Bj61/VydmAEf3YUXg84xuZVZKeeSZ/sSmkznijYtJyW+XNm7lg4woigVUiCXy0bXIg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS1PR10MB5722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 13:13:59 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 13:13:59 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: [meta-virtualization] use of yocto-cfg-fragments
Thread-Topic: [meta-virtualization] use of yocto-cfg-fragments
Thread-Index: AQHaDXbDLSVFxUD5HE+bclx//pSk0LBnZmOAgADrL4CAAD8ke4AAA5EA
Date: Fri, 3 Nov 2023 13:13:59 +0000
Message-ID: <632b380ea47e25224c67e6c7358ae5ea25a27663.camel@siemens.com>
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
	 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
	 <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
	 <17941DFC88BEAF3E.3650@lists.yoctoproject.org>
	 <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS1PR10MB5722:EE_
x-ms-office365-filtering-correlation-id: 503ab880-03fa-428a-976a-08dbdc6ebdec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qgThLv+QZxyDE/rEVSfPMJbLSYkaOxo96T2wvCxXEZEt3EPnH9cUnj39qUTF9iDrfBjeoBZoj09A4AH29JWkQ16infdOD+4Ne9ymnYg1dh9JhOyUX4TbJO9uq4k5934o64mK670+3S+6BlD0k6phjdHxrN7hwqRBpU81fhTx891PXGJauetbwzuWQBq7gezsW2KHu489ech/35QWZcugMnBPCiRl41RzTftRg70/g0Df8DmfGX/bm+C2bDUWQwp3SrJvDCjKEs3d845p7jmHISiYr6jag4YVV2Oz8gvJQO5xTCaKLzwMa47FgPTOUbY6gIMhK8E06Hpeo41cmdgNj2vcA/iDz+ELPQs7o5tLwz/SyUzctC0Y+pJ4LuUpePKFwm4KbLbcUFvDOIps58j5XHxS0eLiq25w8ye2CxVd5gfCGOzRFH4fSYkeSKtW/cNwUJhA7l3VYntDDeBaCQv6TZIpiEHf4gGQFLU0GAX9v3nFguOzRLhOCPRvodyS007CfQ0c2R8b5K612B1lONbIurPy33sWV6D4jpW3rdct1RWz9E0LkIdZQUlYPvXmkIlQPcQNAvTG3f2YKUVQumt4msvYqZH6GxWnBoqPvaDo96I4J1m4UWaZOcWc4aoxb4Q+wTK/5YN3NL+ebB//l4ANCQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(2616005)(66556008)(71200400001)(66446008)(4326008)(2906002)(64756008)(76116006)(91956017)(8936002)(41300700001)(54906003)(8676002)(6506007)(478600001)(6486002)(6916009)(66946007)(316002)(38070700009)(38100700002)(5660300002)(66476007)(82960400001)(86362001)(122000001)(15974865002)(36756003)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L0VpZUdHTzlybm5tb2dQdWpGOG1KajU1L1JzaWw4WnZCazBQNzY3YlIva3RP?=
 =?utf-8?B?K1JyTStuMzh2SkFxWEhHTWNxSURuWHlKcmVYQlFOUVRWdTA1b3RMcEx5RWwx?=
 =?utf-8?B?aDBwMS9sWThETytON243bXJsc0NjUUxVbSsyTzNhbWZ4dE5rdzJ4VVVJVHpW?=
 =?utf-8?B?OHVVbWg3OXV2WFVLVTgzY1RJNGZ5bjA5anNtZVdROGYzS2gxaWlEZ3Y3SHlK?=
 =?utf-8?B?YUxmQ1hZMHV4Z1RsaEl4NXpPeUIzR2V1WXMwdU9VRDZIYWhZZ3duZldFV0xn?=
 =?utf-8?B?SGdVMi9ya2oxdzJVU0hxdXh6WjRmd1J0L2ZGNWtpNFhkWWtFYzZRa3dLQUQ4?=
 =?utf-8?B?VkhvNnNyeEd1emR2YmNhUXVnbEYxK3JzSE5icHIzeXkxZUZHT1hqdzZqTDlo?=
 =?utf-8?B?dkJZbHNVNi9QUjRHQVdDR1hpKzFyOFdGMmt2N0RVa0FRMlRqdkIrOS9VeFdS?=
 =?utf-8?B?UlB5UVZkK3RiMS9oUVFYYTJ0S0VuNFZaNHZYUm9UcTE3Yll3L2dLTVlyZ0wx?=
 =?utf-8?B?bDNieEpFYkJnRjNSZGpWNTZTNUtsYnBrcER5cHdVcXJzRzRqdmdRSHpDelQz?=
 =?utf-8?B?SHNDdnp0V0hCTWJod3dScTF0WVNsSnAxVjlQSUlXVG1HSGV1aUVtTjJBTEhG?=
 =?utf-8?B?TEJNbWV3cG5zaUtUZlhtajBzaXBpQ0liRkRjMHk1aWp6S3FMV3NwcFEwQmRj?=
 =?utf-8?B?MTZIZUxFMlNQbW4yRDlCYThmYUVUdlRRWnIySVNJdTJzM0xFc1pWOFFhbHd0?=
 =?utf-8?B?d0Z5M0c1QUR2Z3lEKzVwZnRyY3l6Mks0ejl3V2g0TWF2emVrR09sblJ1bSt0?=
 =?utf-8?B?WUdPYXg5Y2VTMEJDdVFHOGJsc3cyTm4wRVE0dFQwdUwvRk1RZzBhOWo2b1Jj?=
 =?utf-8?B?cWk0WGRXZ2xYNzVacFR1ZGF4ZDJwUExwOXA2Vk13a21XQXJHWnYvYTh3a1Vx?=
 =?utf-8?B?MFcyM3BlamtjL2Y3UWNsUVgxdGIxQjUzTmNGb2s1cDIya1NJcU84YmVpNHNt?=
 =?utf-8?B?cE05SHgrMXRpS1dOOUVyN3QvaTQzdHErTHRNVHRTR0dHTXFaOXovNkZTRldI?=
 =?utf-8?B?VFIvWUNIQnRBT1ZUc1pXeFJwYkZBUzdBN2YyOENabHdPYUQrRDgvNHhOVCtt?=
 =?utf-8?B?a3czd3luWWQ3UjhzT096cVhScHoxd05GbjhhbThvRUtaMjRWUXFVQXFteFBI?=
 =?utf-8?B?OFEvRGxKaDJYd0cyZVhqWGNzV3VJYVNNTlYzc0FHK1I4dEdFWmh4S1pPZXBj?=
 =?utf-8?B?VUpNYmgzMHdKYVZwYTJKdkd5YUJSa1VBTm5DMTVoN2RrZFgvaFhGN0wrdmRV?=
 =?utf-8?B?LzBNK3ZPQ2o4Q1BYcHNFZGxvek9EUnAwU0wwL0YranR0Ynk2VURmc2YwMGVI?=
 =?utf-8?B?ZXpIVnFxalMydGJSZzQrd2Y4Rndobkt2MUZFSEZveW16TjJFTjNXOFZQWStQ?=
 =?utf-8?B?a3pEa1E5cjN1ZGI5aStCTTc1ZUtwcnl5UG5lRTNBOFNCdWxBZlBCL3IvbGpK?=
 =?utf-8?B?WHcvWmIzU2RHTUpnTEFJcDZOcG8xUUx2U0JJdzFncDVIZjBKRFM0N1pyUEtq?=
 =?utf-8?B?SFNGWU16VGxCenBlNDVndGJOcFRRRTRVZ3B6TURIQ3JEOW94R1pUNlYxcUwr?=
 =?utf-8?B?WXRkZm4yNVFUTXdCOWxmSDZjZytpUmxYVkxvcU5aWXQ1RGRoRkpGQzNUbGND?=
 =?utf-8?B?ZFlmbmZ5SVRkdzFqWnBpa3lrOUR3ZW8zWFdtZGlZVXozWmpJQWF6UXZKT1V2?=
 =?utf-8?B?a3hRRFVXODJLZXY5RldpSkxnK3BJT2xGM3JLY3hJbWg5aG9nZjJ6TDVJL0NB?=
 =?utf-8?B?ZitmUHdmYmwyazI0VURnamZrMGtCd3c0YWpac2RWSllTaSt6TzczdmFKYkx3?=
 =?utf-8?B?dXNvU2dReWtnUGFVNUFzSmRGcnQzVlZwNS9rRmVFeXVYYXhBVjlmd21MLzRy?=
 =?utf-8?B?ZFlQTVVRdXVDSDFPSklMQnpEZzBMODdRU2I2UlFSK3MxVjdTaURRdVAxYTdO?=
 =?utf-8?B?OTlIcFRRUWhtTDFVMUUyb3RadU9uRGtUZkprVDBCcjVmMUFPaHUvZ0NBcG5U?=
 =?utf-8?B?NmRseHQvT0o3cGpuaWU2MzBTVVFUYlozdHlKZGxDcmVISHI0ejNJakxqczFC?=
 =?utf-8?B?Vk9wNEVpaG1kWjZtTjlUa1ltclZpL1kzZVdCZkIwZE5vRStMc2VKTjBMcEZo?=
 =?utf-8?B?aWJyTFFrcDVXYU1FUTdFcFNscTM1VW5YVGNWN0hBTDNyeWdkY25HRTlUbXc1?=
 =?utf-8?Q?K0SSrhO852C2h2q85o0DDW1LEoTPipEmU147+v+Pg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF749981A73EC648A55A8BCB0B5574D7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 503ab880-03fa-428a-976a-08dbdc6ebdec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 13:13:59.3725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9caSFpPDroplC6HdpRYlgKHHrFcJUZgApdWpWcY1Ya8dDCdE1Q5rsnueJ66FzDmd5Z329DyWZ2gnL8HKgUJ7o9+HB0QkQeC0hSviphO58I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5722
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 13:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8418

SGVsbG8gQnJ1Y2UsDQoNCnRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMhDQoNCk9uIEZyaSwg
MjAyMy0xMS0wMyBhdCAwOTowMCAtMDQwMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+ID4gPiBJ
IGNhbm5vdCBlYXNpbHkgcG9pbnQgeW91IHRvIHNvbWV0aGluZyBwdWJsaWNseSBhdmFpbGFibGUu
Li4gQnV0IHJvdWdobHkgaXQncyBhDQo+ID4gPiBjb21iaW5hdGlvbiBvZiBtZXRhLXZpcnR1YWxp
emF0aW9uIGFuZCBhIGtlcm5lbCByZWNpcGUgZGVyaXZlZCBmcm9tIGtlcm5lbC15b2N0by5iYmNs
YXNzLg0KPiA+ID4gDQo+ID4gPiBOb3cgSSBsb25nIGFzIG9uZSBkb2Vzbid0IGhhdmUgYW55IHR5
cGU9a21ldGEsIG1ldGEtdmlydHVhbGl6YXRpb24gZG9lc24ndCBwdWxsDQo+ID4gPiBnaXQ6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1rZXJuZWwtY2FjaGUgYW5kIGFkZGluZw0KPiA+ID4g
ImZpbGU6Ly9mZWF0dXJlcy9kZWJ1Zzt0eXBlPWttZXRhO2Rlc3RzdWZmaXg9ZmVhdHVyZXMvZGVi
dWciwqB0byBTUkNfVVJJIGNhdXNlcw0KPiA+ID4geW9jdG8ta2VybmVsLWNhY2hlIHRvIGJlIHB1
bGxlZCBldmVuIHRob3VnaCB0aGVyZSBpcyBubyBsb2dpY2FsIHJlYXNvbiBmb3IgdGhpcy4NCj4g
PiANCj4gPiBUaGF0J3Mgbm90IHdoYXQgbXkgbG9jYWwgdGVzdHMgc2hvdy4gSXQgaXMga2V5aW5n
IG9mZiBhbiBpbmhlcml0IG9mDQo+ID4ga2VybmVsLXlvY3RvLA0KPiA+IG5vdCBrbWV0YSwgYnV0
IGV2ZW4gYnkgZXh0ZW5zaW9uLCBzZWVpbmcgdGhhdCBmcmFnbWVudCBtZXJnaW5nIGlzIGF2YWls
YWJsZQ0KPiA+ICh3aGV0aGVyIGtleWVkIG9mIGttZXRhIG9yIHRoZSBpbmhlcml0IG9mIGtlcm5l
bC15b2N0byksIHRoYXQgaXMgdGhlIGxvZ2ljIGFzIHRvDQo+ID4gd2h5IGl0IHB1bGxzIGl0IGlu
IChhbmQgdGhlIHVzZSBvZiBpdCBpcyB3aGF0IEkgZXhwbGFpbmVkIGFib3ZlKS4NCj4gDQo+IENh
bmNlbCB0aGF0IGNvbW1lbnQsIEkgZG8gc2VlIGl0IG5vdy4gQW5kIHllcywgaWYgdGhlcmUncyBh
bnkga21ldGEgZnJhZ21lbnRzDQo+IGluIHRoZSBTUkNfVVJJIHRoYXQgaXMgdXNlZCB0byBjb25z
dHJ1Y3QgdGhlIGtlcm5lbCBpbmNsdWRlIGZpbGUgbmFtZSwgd2hpY2gNCj4gdGhlbiBkb3VibGUg
Y2hlY2tzIGlmIGtlcm5lbC15b2N0byBpcyBpbmhlcml0ZWQsIGFuZCB0aGUgY29tYmluYXRpb24g
b2YgdGhlIHR3bw0KPiBpbmRpY2F0ZXMgdGhhdCB0aGUgZnJhZ21lbnRzIHNob3VsZCBiZSBtYWRl
IGF2YWlsYWJsZSBmb3IgdGhlIHBhY2thZ2VzIGluIHRoZQ0KPiBsYXllciB0byBiZSBwcm9wZXJs
eSBzdXBwb3J0ZWQgYXQgcnVudGltZS4NCj4gDQo+IFRoZXJlIHNob3VsZCBiZSBhIHdheSBmb3Ig
eW91IHRvIG1hbmlwdWxhdGUgdGhlIGRvX2tlcm5lbF9tZXRhZGF0YVtkZXBlbmRzXQ0KPiB2YWx1
ZSBpbiB5b3VyIG93biBiYmFwcGVuZCB0byByZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gdGhlIHJl
cG8uDQo+IA0KPiBJIGNhbiBhbHNvIHRyeSBhbmQgdGhpbmsgdXAgYW5vdGhlciB2YXJpYWJsZSBv
ciBhIHdheSB0byBleGNsdWRlIHRoYXQNCj4gZGVwZW5kZW5jeQ0KPiAuLiBidXQgYWdhaW4sIGl0
IGlzIGFuIGludGVuZGVkIGRlcGVuZGVuY3ksIGFuZCBJIHdhcyB0cnlpbmcgZm9yIGEgbGlnaHRl
ciB0b3VjaA0KPiB3aXRoIHRoZSBleGlzdGluZyBjaGVja3MsIGFuZCBJIGRvbid0IHdhbnQgdG8g
bWFrZSB0aGVtIHRvbyBjb21wbGV4IG9yIGludHJvZHVjZQ0KPiBhIGJ1ZyB3aGVyZSB0aGUgZnJh
Z21lbnRzIHN0b3AgYmVpbmcgcHVsbGVkIGluIHdoZXJlIHRoZXkgaGF2ZSBjdXJyZW50bHkgYmVl
bg0KPiBwdWxsZWQgYXMgYSBkZXBlbmRlbmN5Lg0KDQpUaGlzIHVuZm9ydHVuYXRlbHkgbWVhbnMg
dW5kb2luZyB0aGUgd2hvbGUgbGludXgteW9jdG9fdmlydHVhbGl6YXRpb24uaW5jDQp3aXRoIGFs
bCBhcHBlbmRlZCBLRVJORUxfTU9EVUxFX0FVVE9MT0FEIGFuZCBLRVJORUxfRkVBVFVSRVMgYW5k
IHR1cm5zIHRvIGJlDQpxdWl0ZSBtZXNzeSBhdCB0aGUgZW5kLg0KDQpTbyB0aGUgbG9naWMgb2Yg
cHVsbGluZyB0aGUgd2hvbGUgbGludXgteW9jdG9fdmlydHVhbGl6YXRpb24uaW5jDQppZiBkLmdl
dFZhcignU1JDX1VSSScpLmZpbmQoJ3R5cGU9a21ldGEnKQ0KaXMgbm90IHNvIG9idmlvdXMuLi4g
Rm9yIHRob3NlIHJlLXVzaW5nIHR5cGU9a21ldGEgZm9yIHNvbWV0aGluZyBlbHNlIHRoYW4NCnlv
Y3RvLWtlcm5lbC1jYWNoZS4NCg0KV2UgdGVuZCB0byB0cnVzdCBvdXIga2VybmVsIGNvbmZpZ3Mg
YW5kIHdhbnQgdG8ga25vdyB3aGljaCBtb2R1bGVzIHdlIGxvYWQuLi4NCkZvciBpbnN0YW5jZSBp
ZiB3ZSBvbmx5IGRvIGNvbnRhaW5lcnMsIHdlIHN0aWxsIG1pZ2h0IHdhbnQgbWV0YS12aXJ0dWFs
aXphdGlvbiwNCmJ1dCBub3QgbmVjZXNzYXJ5IEtWTSwgcmlnaHQ/DQoNCi0tIA0KQWxleGFuZGVy
IFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==


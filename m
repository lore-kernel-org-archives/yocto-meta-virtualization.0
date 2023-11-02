Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C2FC4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:24:37 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web11.27453.1698920673407000831
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 03:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hIXc+Jhh;
 spf=pass (domain: siemens.com, ip: 40.107.14.79, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXJvOj33v2dYodBarmE4y4AlyFitOMt77uxHKmx6p1+iR2Gdl7y0TkJ8ku5vQxGv3sLB6r0rFMvy9Owzeb2qrcCCRz6czHxMtAcVkrvVde/d/SemSg5k3uTJbY2/7motO/zN0+ys4DAETjmGVoalo8Vyt/mw9yOSV4+LhlH+uNYJ7WVbmR3NJdb/uLxY5VK4LZpPQCI6zFtoV7bF0ZlliPyPyPhIN6pOkTvmYyzhfoFalOLCD3wrYTLCNXvK5+fGzgRvGDMu7pnLWdMhNwl638uIMqpRv9uHWsd98AIvweJbL0LBv2W4C0I65BzddDb4V7lI++3nsEoO+gmyla22kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kepWVE8Bem7L0eMEUsKvu3kJsRQrfbLAUeWIStrzNiE=;
 b=Rh1TeOj9ygz0BmmDieYwzDsvisstStHQF6y1F/Unisy8sC4I20K8S6TXtusy4saoRhCkEZ7zJ9ff+1KrVoevne6L0duWG0IeEx3cP7hlqYNW2HqJq5cxuO7q+cZbwOJOijazsObZJdDq9R2YnAH3OnO2kS4ksu6/ev/8R+l74mjW7F71szmGyiWnvc4USPMqiLssbuG8vj1aDIFvHKJtRdgS7uglKHpg9rgpV+LUyqQ7+fBRbyYZoaQfUBalmA9UVofe4rc2ntmshkPIlVELnr+CbBdtg8eKVqXnQ/pGmwsBonJZ/36ww7VrCrAxYDqPnR1hhBpye01kTH+4EsFGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kepWVE8Bem7L0eMEUsKvu3kJsRQrfbLAUeWIStrzNiE=;
 b=hIXc+JhhvGh2c4NLXmszf28MKwJB9fPLLpskincKUAa4NOZTA/v7NAPOsDSyHL6usSmXngndnV1PGaNIi9lPqqz1CYDRi+rLBI0O9FGNetWFH3RT1DsMJnDePPuuELq8qWB8eCcKfLnyxLSN3H0IMkIt4fnADoVBVbL2vQbbQ/ur0xtlXCuLDH2SWh0t2IIwmbB6NYHzEUhnjqaeCYbV5Xtfn2dNfDrviUCg7Nd5mGchaCOPk07bYiUKyidYYr5NlR0oO0uayiI/J/0ipihyd7oCrMxFWQmC2WttinGSSPl1v2ph85IlvSgTfrbPLJrEO4aR4SB4E6d8BjI/RzpfjQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB8106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Thu, 2 Nov
 2023 10:24:29 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 10:24:29 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Subject: use of yocto-cfg-fragments
Thread-Topic: use of yocto-cfg-fragments
Thread-Index: AQHaDXbDLSVFxUD5HE+bclx//pSk0A==
Date: Thu, 2 Nov 2023 10:24:29 +0000
Message-ID: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB8106:EE_
x-ms-office365-filtering-correlation-id: a962ecea-207e-4e67-d127-08dbdb8de5bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +z0MQR58cj01KCh+YT3Gi8Cx77UT1L9craOV7rA0ahAihlCTZd1Wkk8kRcLJ21As9/RMx0ItH0EyEo/crGXjW79krwwz5fKoyVb9veg8CBFUGPN8SHzzR6g3OhwE4D2tz9VdJvvgr3w8cmd6W0cxseeDieYPzvJs/xgnSfGPZqQvp5eUSASS8KiDN5bwVWLbqQ5oqgSrTg5Qjw/v6kvQEVH6iGg3B2L4xjXUkG3JzIrxYlBbxkkSGiXHSbq99soV05rXqZyBk6pcsA1hdQ4rsK1mmg/waFUTGC3iuNtIToleFr88W0OnjjtaVEaMKi7BMtn24RCC/C+eoS/mO7u5HSeyoDvES2/PJkVfa3ka8ezSvsjnlZHSjosrBnag8VtC1bnSUQB0dYdqkNiQybT+NWoP3F4u3am84etjPyqP4gkeayKOlNJK6Cmx4oPq8nacqRLxRPFhdlT3JGYQNV1yUU3CbKhv64iYjahUvjTyngtQku7L4e7cGDHcYgk4a52Z0N7AAgsQZhkciKrK975GJ3EehIwzsa6JkuR8UZv6WpyBK6obf//la5/y/od3xaQ4ye+CFYL+Uta0ysMlksw+g7iyLj9Z/fBfvKUJTcFiE+pOgg3I1ZNmXbaK0CpM22puPv1QWcYCiScoeHrHbP9cQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66446008)(316002)(66556008)(66476007)(64756008)(122000001)(41300700001)(38070700009)(82960400001)(8936002)(15974865002)(8676002)(478600001)(86362001)(91956017)(110136005)(6486002)(38100700002)(4326008)(76116006)(2906002)(66946007)(66574015)(5660300002)(36756003)(6512007)(83380400001)(2616005)(6506007)(71200400001)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckpydHFSNVp3VEk0c1owYlpVWTVZYUdjbDMvS3RPdzd5R3playthcWo3MW1V?=
 =?utf-8?B?V2JpUG9MMHAwbHBPd0NwTkhHcjFlMWliVFpVRVR2K0tLeVY3ZFJsQ3BuWkRy?=
 =?utf-8?B?YStzZGp3YVkrM1JkenR0eFFEZklVME1kbkl3K0VKVnROMG9LNDFTWENYY3pU?=
 =?utf-8?B?YkRNNnhSTDMxV0NiOEEvQ2pzRUhwb1VUUld0TnBETUxqWEVkc3crVFVvV29E?=
 =?utf-8?B?UmVxOU1FcnB3TXBZanhOdjR6YzJlcFg1bkI5bG9OeC84WUxNZk5BV2FwZnFD?=
 =?utf-8?B?TDFmSkd2L2x1NTZMZXY5U3NWTTV5OWQ0OTNUU2pFeUw1a2dRRFBPcUlicjZo?=
 =?utf-8?B?dE1GME52dU02OE1KOEtMVEU5emxOQkp0bDZwcytrUmhxSDBwbVkyMzVzWmxP?=
 =?utf-8?B?QWRmS1U4RmtEQWhhT051S1pXbnEwRTlrVzFaTDhSdWFmeHFyWUh2bmk2SmdO?=
 =?utf-8?B?UkQ5azZGcGk3c0RNL3NSOE15UWMvYjV5Wk5KMllwNjh6c0dBQlFSalYrMGdx?=
 =?utf-8?B?MFpBWWpnbkpNMnJjN1pveXlra0Ird3RDUFN3dWVmdERkUTBTVGd5NVY3N2M3?=
 =?utf-8?B?R01qV0xUeElXdXhTeGF6V05PWjJmUkQxKzVMd0QxcmNIMlE0RFJBZFBHYkwv?=
 =?utf-8?B?YVVwOWQ4Q3NONlI2bDloSW1CMTViU05XYWtCY0lTYXNQK2Fsb09IR05haGFm?=
 =?utf-8?B?NmtMZW9rd1Z4ZTFzMTVROHFxbVlxNVlQZjRUNGd6YUxaMi8wNFROY0VSZmdO?=
 =?utf-8?B?clFKNFlDMzVnUW1iWGV4M3hNbjZ0K1JsWnlKM09MakJ4Q0hORmpWRloxYzdH?=
 =?utf-8?B?Nk8xTlB1SEdmbzEzRmRHNC9RU3dOeXJ0SGM4RnVGMmE3aFJNVm1yM2tMa0Y4?=
 =?utf-8?B?THpONXk4cXZyVU9MbnkxZ0prdHlVTlhZK1JzWGZ1dkhndTNsZXRaclNVTFA4?=
 =?utf-8?B?bzNVemtIaTU0T1VkRTVIRGZHc2Zpc08wSjk2bEtzUWRYWkFZazcwUHdaeDFN?=
 =?utf-8?B?U2ltN1djbUp6WHRVMkZCZENGenZzZGZHOXhrSk5yejZRQkJtTFFwWjRQRjJT?=
 =?utf-8?B?aC95T1BpZlhEWnV2V0lreDBmNDNGM1UvbDZsOUNZL0pRMUttS05yZlZmSXFJ?=
 =?utf-8?B?Zm1SbG5hTmEwdEhZNUdBeC9PVEdlREw1cFpkYmNJNC9nM0dybW82a3RINUpU?=
 =?utf-8?B?NmxTN09TdXBZaFMzL1ZlY1E1QnRiWStYRFhqR2ZsU2FBemNZYlBzZkxnRENS?=
 =?utf-8?B?Wm1PZ0dGaUN0ZjFRZHRyK28yU1l3R0gzOURNckt0alBOUUZjOHZGRTRQcTFF?=
 =?utf-8?B?bW16Q1JLeDl6K2w4YUNJMy9mZ3FycHlQOGZGUXoyQU40ekJkMDMrQnZWYmRT?=
 =?utf-8?B?UGhyZ0VYR0NlSHhqSTk5ZjJ5WTZHSGFyVmpRdG5WTkU5VjdGZndLcTgrY0dz?=
 =?utf-8?B?WDY0SDhzWHJyc2lGS214QlFNeU42VUZKNlNOcndwOStqUXpweUp0eDlPVVhB?=
 =?utf-8?B?UGJyVEtkejNEbVQrNW5pc25XYkE0SWRpaitWQ3RuQjJwdVNQZm94TDRqMDNX?=
 =?utf-8?B?MFhPRnp6cnJMTGljSFpMV1RycFg5Y2JQTmdRR2xUR2ZMaHdEVk9SV0xUNlJn?=
 =?utf-8?B?b1JKL1NXNTAyRWxNWUJWZnFVWmRZL202czJjaHdKTmd3cTdnYW9RUDFMSm8z?=
 =?utf-8?B?MTVNQk9nOXFBZHNvdkdCRnB5SzM2SStpQzR0dndLaXNQT254UHdNZVp3RHA1?=
 =?utf-8?B?ZW1taTluMmJvdlUwVUxOOXROdCtzc00yeThubmJQMGEySzBWMVlRRDJDdllN?=
 =?utf-8?B?c0FLWW42a0JwZW9wNUEzRnhpTVBkTksveGwvcUhvbVpRZU04aGNjTDRHTmRF?=
 =?utf-8?B?RjRMdnhzaUhzU3hOdmE2SUxvM09Za0ZKY0RKTlRCK2hrTkViRlcrRGV4UVJ6?=
 =?utf-8?B?QnVjdjJCQ2JIc1QxZzZUM21EOW8reUU3aVBpRmM3aUdWakUxaXdQL0pDeXF3?=
 =?utf-8?B?blN1TVZGdFhWMzEveERMeW5USzZESmxjK2V0eFlidlNjazJqQW5oSlRqajFn?=
 =?utf-8?B?SGRmd0hVTEtFYk5SckVRUzZ4clhwU21za1ptY0pjVStUMGNGWkRSUExyQU5h?=
 =?utf-8?B?d1B3QlNuQ3NqVXQ3TlNERUJPSzAvWjBScnFuVFd2MXdZKzEzbi82SVo1VVZ5?=
 =?utf-8?B?WE1OUE4rS2R5YXVMdDVuR2Z5NHRDZU9HL1dVWFdMdmZ6R29tYS9MUEp3Q3l4?=
 =?utf-8?Q?nLP2kig61+gE42tkHpNJE10utpEgyflUejKEMWD28Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4789E6DF8EA1D42B560F687D5F176EE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a962ecea-207e-4e67-d127-08dbdb8de5bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 10:24:29.4217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4GR8o5tipvN0HLbjRquzNoTuEHgHPLsODCzgcOLWW5/n8jtM4YPL1WgPIEgCkzjLKbb3cn3hduOkoWc6tCjs6wjO3reygYre5uaFudkNKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8106
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 10:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8409

SGVsbG8gQnJ1Y2UhDQoNClRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSB1c2FnZSBvZiBTUkNfVVJJ
IHR5cGU9a21ldGEva2VybmVsLWNhY2hlIGluDQpjb21taXRzDQo1YzIxMjkxMTg3OTcgKCJ2aXJ0
dWFsaXphdGlvbi9jb25maWc6IGFsbG93IGNvbmRpdGlvbmFsIHVzZSBvZiB5b2N0by1jZmctZnJh
Z21lbnRzIikNCmFuZCA1YmU4Njg2ZTY1OWMgKCJrZXJuZWw6IGZpeCBjb25kaXRpb25hbCBhcHBs
aWNhdGlvbiBvZiBmcmFnbWVudHMiKS4NCg0KSSBoYXZlIGFuIGlzc3VlIGltcGxlbWVudGluZyBz
b21lIGxvY2FsbHktbWFpbnRhaW5lZCBmcmFnbWVudHMsIEknbSBhZGRpbmcNCiJmaWxlOi8vZmVh
dHVyZXMvZGVidWc7dHlwZT1rbWV0YTtkZXN0c3VmZml4PWZlYXR1cmVzL2RlYnVnIiB0byBTUkNf
VVJJIGluIG15DQprZXJuZWwgcmVjaXBlIGRlcml2ZWQgZnJvbSBrZXJuZWwteW9jdG8gY2xhc3Mg
YW5kIHRoaXMgYWN0dWFsbHkgd29ya3MNCmZpbmUgZm9yIG1lIHVudGlsIEkgdHJ5IHRvIGNvbWJp
bmUgdGhpcyB3aXRoIG1ldGEtdmlydHVhbGl6YXRpb24uDQoNCk15IGN1cnJlbnQgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0DQptZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvX3ZpcnR1YWxpemF0aW9uLmluYw0KbWFrZXMgYW4gYXNzdW1wdGlvbiB0aGF0IGFu
eSB0eXBlPWttZXRhIHdpbGwgcG9pbnQgdG8gdXBzdHJlYW0NCmdpdDovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL3lvY3RvLWtlcm5lbC1jYWNoZSBidXQgdGhpcyBkb2Vzbid0IGhvbGQNCmZvciBteSB1
c2UgY2FzZS4NCg0KVGhlIG9ubHkgdHlwZT1rbWV0YSBpcyBteSBsb2NhbCBmaWxlOi8vIHN0b3Jh
Z2UgYW5kIHRoZSBmb2xsb3dpbmcNCmxpbnV4LXlvY3RvX3ZpcnR1YWxpemF0aW9uLmluYyBwYXJ0
IGxlYWRzIHRvIGZldGNoIGZhaWx1cmUgKGZldGNoDQpmcm9tIEludGVybmV0IG5vdCBleHBlY3Rl
ZC9mb3JiaWRkZW4pOg0KDQojIGlmIGtlcm5lbC15b2N0byBoYXMgYmVlbiBpbmhlcml0ZWQgKGhv
dyB3ZSBjYW4gY2hlY2sgZm9yIGNvbmZpZ3VyYXRpb24NCiMgZnJhZ21lbnQgbWVyZ2luZyBzdXBv
cnQgYXQgdGhlIG1vbWVudCwgdGhlbiBhZGQgYSBkZXBlbmRlbmN5IG9uIHRoZQ0KIyBjb25maWd1
cmF0aW9uIGZyYWdtZW50IHJlcG9zaXRvcnkuIFRoaXMgYWxsb3dzIHVzIHRvIGJlIHN1cmUgdGhh
dCBvdXINCiMgZmVhdHVyZXMgY2FuIGJlIGVuYWJsZWQgdmlhIHRoZSBmcmFnbWVudHMNCmRvX2tl
cm5lbF9tZXRhZGF0YVtkZXBlbmRzXSArPSAiJHtAWycnLCAneW9jdG8tY2ZnLWZyYWdtZW50cy1u
YXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCddWyhiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdrZXJu
ZWwteW9jdG8nLCBkKSldfSINCg0KU3VtbWFyeTogMSB0YXNrIGZhaWxlZDoNCnZpcnR1YWw6bmF0
aXZlOi4uLi9wcm9qZWN0cy9jY3Atc2QtdmlydC8uLi8uLi9tZXRhLXZpcnR1YWxpemF0aW9uL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L3lvY3RvLWNmZy1mcmFnbWVudHMuYmI6ZG9fZmV0Y2gNCg0KV2hl
biBJIHJlYWQgdGhlIGNvbW1lbnQgImlmIHRoZSBrZXJuZWwteW9jdG8gbWV0YS1kYXRhIHJvdXRp
bmUgYXV0b21hdGljYWxseQ0Kc3RhcnRzIHRvIGFkZCB0aGUgcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
Li4uIiBJIGdldCBhIGZlZWxpbmcgdGhhdA0KdGhpcyBmZWF0dXJlIGlzIHN0aWxsICJ3b3JrIGlu
IHByb2dyZXNzIi4gQXJlIHRoZXJlIGFueSBmdXJ0aGVyIGRldmVsb3BtZW50cw0KSSBjb3VsZCB0
ZXN0IGluIHRoaXMgZGlyZWN0aW9uPw0KDQpXaGF0IHdvdWxkIGJlIGEgcHJvcGVyIHJlc29sdXRp
b24gb2YgdGhlIGFib3ZlIHR5cGU9a21ldGEgdXNhZ2UgY29uZmxpY3QgZnJvbQ0KeW91ciBQb1Y/
DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20N
Cg==


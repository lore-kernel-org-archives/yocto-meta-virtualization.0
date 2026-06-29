Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4722AC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 00:21:29 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82551.1782692487064554250
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2026 17:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=kb8afcAJ;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.58, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3M2R8banGQpQJrzVJNRj5pA2GELcaqosx6pbaJW8yiVlro5CiqYB9B/ALLHxNAgIYxF9zKn8wQRbnh8X7vfDtOGq/SXS8ZUz7NYWvrYRefCNBF9rOSdqL0Wv9XEYZLR3bKa1w2aURs7R1QAwuHjoBXvBiBOwYAT6Azl811k7vCbofVdUZtC/86RTWpYHIsPZFSNidGKQdAYzYWrvz/DmH6gbmnVI4QLGPAEpFjv0weu8IBEHdyp4QZFaUJ+ruv22WTQ/zOM2xZwC1hNskclsXjwsl2G4dSW07U5KK8oHSu5P6ihkn8gBHt2Du2HqNpq1K6jdcRVBrvnlq9xoxKZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJAjEnpBQDmss/Xs1LMlb1aaNvHYEiuJv/xSbfmxH6E=;
 b=uFRgKlPK4QO2hOsJDd7ovokhk8RR1aGxszeTDUifva4nfxuRbCgWLDhQESDyoYxi+OKKOrjvmt2jkj0tRYukpB8mW064P0rnK7/ojzkYa36H+SiiDCUCuP+YlQF/nWsQuFdhRPa/kXgZEZFj4sCFlCUnm9ziTpHSa8MBoYWJex92B0P1EkB3fBXpiGEODKXycvG3zh+SDUXYEe3A80Hvq7SrLs71z+lLbJ3OWVdmwsp5T1VUKEGb8idy7HsB6dc5IvvH2r8HorJ8bsblUbefoepSKL9spMK+nYZ8Hu8nK77Ji9l60qpC6BoVt7podfHwPGXGOoq/HW9uAKh8wM9qYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJAjEnpBQDmss/Xs1LMlb1aaNvHYEiuJv/xSbfmxH6E=;
 b=kb8afcAJefiWcsAC20PoalSzw9cSfXm1127zXWe/HV+N2t1yMR0v+q5ZDnEtF1Jwvk3bIqoHuEawRRzcdOx4tsl7oyHL565G3LGZCZnake7LV2WBUR7AHlW8CLHIKoVhoWJc/Qd35bubU6Rkjvba6GQ1fDUcAAVuFNGbzTMUrF8WcFm3ADJ7CpMU5MBH4fwTg7T/Qw+XVXYRY0B51D33YzJ2pzg99lXgXyLEwhDszVmkY6FBNqP8k9D2+T3fumAL2NiDFrhMeA/ARAb849FPZ8xd9+6IzG5EyMPgs39YqAQhuSJ0sRwsQIwZ7aApQdXq6hoT7v571jHudmfVBCB1BA==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by TYYPR01MB12161.jpnprd01.prod.outlook.com (2603:1096:405:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 00:21:21 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 00:21:21 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH] qemu:
 upgrade bbappend to 11.%
Thread-Topic: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH]
 qemu: upgrade bbappend to 11.%
Thread-Index: AQHdAtUWapJxeexZTUivTD023UNLQbZUtLQQ
Date: Mon, 29 Jun 2026 00:21:21 +0000
Message-ID: 
 <TYYPR01MB1341975C97E9A5113CF8C46FFDCE82@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <18BBA0305BE410F4.1048178@lists.yoctoproject.org>
In-Reply-To: <18BBA0305BE410F4.1048178@lists.yoctoproject.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=aec3299c-2982-4433-b40b-91d9e0cf9270;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-29T00:21:09Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|TYYPR01MB12161:EE_
x-ms-office365-filtering-correlation-id: 654a3ecc-d4ed-41ab-91f9-08ded57458b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|18002099003|11063799006|22082099003|6133799003|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 Oc80aviCzFO7FTDV+J0FmK7acc57j9ltLXTEgS4cd7+R8raDYpIvBQC7lc0GeFdg5V6/kF8P1kzcbxY3VYL8z5UmpR+YKVmY+fGVkpyPLsH0sdL1U4W/Xb6QSmmOX2k3WjxHW/PvhOJ+3BfqA106x+x91O7GjzB0yZlGYr6NvH8qbf88wSdK7dNdUjJRiBHXIhwA2ys7mcK3pkQgZg51YAGoCD3qu2oBr437+bMgYtohWfVkystAIGno4M1Qjeife+BERqXSqBxcotQxsqlenWiHUh0eml+EbxuhD44tdBYISgKPKkHUPyNeXo4B/2TvSNJe5OW8R1NKQfiAFTASIjebiwZDauVm4ouT4ym1+povYiRd9kVMK2am2U6rfo9tFppEC/ehhbwoyPJRh9y45Fr8B67RvANiIVBoqkMq42tbxV8ppRozXEB8KyhWmvZefQ3zzLIe6ENB4gqPZUTpfWKnYzsy85NZiOIa7gMQFYnvdaFAmv0HShf2u9C1l4T0nbBkHftzZsxMTAYxVBsUIUdXBsLMLprPle4YxCHM0AqUfTE1oEpvgpQWFg8IMNQsv+KVhRD5QBN3NXmfWrQxNkyags5BQXTdo8xpRBnhBdtUnEuJKNZbhk19rpQX3OoxlvQRc3Ris4dpbbZ3IO0yv6r+Rom4sUjIMJNXpiJj5N+vZxgclLl1o4WaR/jwHRerLJZiCBNsF5yhtwlHKOY+sbp667jS5l/PhBiEcm0iNIDZvtfsvlea1aHNf0xQG86j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(18002099003)(11063799006)(22082099003)(6133799003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bitUUSt0QVgybzdWaXk5dy91VGFCeUNwdGxXV2QxbHZXeTJralVqeElDUk0r?=
 =?gb2312?B?MXNtNkdTRUJNK3BYa0ErUjBGeSs1NExpUkhjc0dIM2RmNnpwVEpBSFhzTjVW?=
 =?gb2312?B?dk80dHhvMUMxaTBqdFgwUWJCV3k1UUpTZm0xUVpJTG1DOThhWmxDSmVXUCs2?=
 =?gb2312?B?TkY5eHpDcjFIalptK051ck5hZXlHOXl3VUE5Y25UbFZYNmNHNWIzY0NOdHpa?=
 =?gb2312?B?djNRd3FVblNrZExpRit4Z3BIMTdVZmdRMnVxa2p6bHVQQTdJbHJQYkFrOVlt?=
 =?gb2312?B?UUhZM0dZZHdCTXJzRzVWRkR2YnRkQVBsZ1VwSk5IdEFJT0VHWVA5VWVoam4y?=
 =?gb2312?B?TjhzTldWWDhxZ3o2THhhcmVCUGZ1ZmRFTTJmRnZqS2ZHRE9yUXJVRlB2aXRz?=
 =?gb2312?B?d2x3dmgyNEM5c0I3TVFneXBPcFlQeGxuNmhEQnRCVGRUaGRrOEhuMTBCSTF3?=
 =?gb2312?B?c29UR3NBeUc5TDRONUNDZ2xwRUI4N1FXRkRPbHRLaTI0SFhLVWlWUUFkM0xj?=
 =?gb2312?B?VjdMNWJveDJYK3hlNDdUYVR5QUIwZnFqUzBxQU9jamJHN0ZSOHpsQXFXWmlv?=
 =?gb2312?B?TTQ1TUNiYnVYOGhad0JNbjkrbnBKMzJvalNIZUN5bktkRVVzVzJCb1JOQWtv?=
 =?gb2312?B?UHBnR1g1ZmY5QkVUTGpCQnY5NVBJdCtzWjcyLzk2TnR5U1c3UndWdVhFYms2?=
 =?gb2312?B?SG5SSW9TU0RMcUtyS29jUy9mQkYyT01CNEJFWklMcnpMTm1xQ1Y1MmlxS01v?=
 =?gb2312?B?NURlcmJCdEdzV3hyeGFBaVRORi9yVzBWMFdFR1NhYWt2b1BYSkR5a2J5VEJk?=
 =?gb2312?B?NnJLV3prdmtjbFUxM2RUdEd1cHlIeGRvNVRLWVJsZ1VBMWl6M2hXR0ZOTmtP?=
 =?gb2312?B?bC9nVWNkdDJIL0d0dmVkSVAyS2pHb05TOFhjdnJmMFBGWWtPcUJyYnpORlhs?=
 =?gb2312?B?byt0enZaakpxdk02NXFCcEVKcmZ1WkVIanpQN05mQ1pCM2JURmVrMFpFVmxm?=
 =?gb2312?B?eDVUT2EvWkR1Qkljc2NIZEM4am5JaFZHRXZjSis2L3prTTRKaUFpR3E0SUxZ?=
 =?gb2312?B?djd2Y1RQT3RsRGM2d3FxUm0zV3dZb3cvbWFaUXo3UlpRWGVvT2V3UkkxLy8w?=
 =?gb2312?B?Um5HSUxVVDBzeHc5MFdRbkFxMWhlNzNBbUFEMWdXaThIM0hxUGVHTTNRUzRn?=
 =?gb2312?B?dk11NzFCREdiMjdzWmpGSjFZZlRheERDQlhQNTdYWS8vOVU0YnN3NlNiWnZt?=
 =?gb2312?B?MEplZ1hqbGM0bVl1K1c2VElySEFqZnVtYmZCZndPbFowNFNsZEtWTzFWd3dM?=
 =?gb2312?B?TzVkMytvbFdwQ2xJdWNzKzZRbUVqZk92TUxoL1lZZnpJbC9qamJuSzlEc3d6?=
 =?gb2312?B?LzdvMVM5dS9kTDJLR2tQczBaQllBUE5kbHBWRWFsdzBTdm4rRC9JZk5VQXNz?=
 =?gb2312?B?aldwanFzbGwyL2xIajM5b0JmS3JnMG04WjdFZERLR0RjRCt0bC9hOUtrVjRo?=
 =?gb2312?B?TE9UYkVaTlVTRlRJbHRscmhhaTZJY2Jjd1FvWmdOZjFpR2ZoWFFYSENHeHpG?=
 =?gb2312?B?S2pVK29KRHhhQ2NQMmZtcGhmS2k1TWN1bi9Ld25vWXlZREVVSC96dXdzdU1R?=
 =?gb2312?B?V09pS0V4alhERzRQNTVPYWFQUmpWdXdjRERtZXdBcGlBVlViL2tsajJJSUFz?=
 =?gb2312?B?OUVCU2p0UGkrd05zNHZGZE9Cb1k4OHpuQ3MvREtpb1hxdkd1OVNROUhEVTJU?=
 =?gb2312?B?b3JRMmdOYll5S0NWMXNNQ0ptcU5RRjZkeG55eDY1VGNGeDJicGtQdjdQMXVB?=
 =?gb2312?B?SzFjR05sS2F4OUNWeUIvZU1vMG16dVBIR29rL2hhOG51c25aS0RqTDNDdTRX?=
 =?gb2312?B?VC9ubm5FVTZraHkxTm9sWnF0V0dKNjlvbVByYkdKelRIN0Q5ZjNFMjJRZUhQ?=
 =?gb2312?B?eGdxeEFDRHNwZG9BSmQwTGhqUTJvdXN6bmJ6SlJjU3lDblo2U3ZXNk9WZm5Q?=
 =?gb2312?B?WHFnMnJMc0Z4ZFlZcUMzcEpRL1ZwODJ4a1MySkV5Y1ZFYVQ0a3ZqOTl6NnlU?=
 =?gb2312?B?YlFFcm1WM2lEcW5lT2s5eXpYTjBBeTNIMmlYb2hZQ3RrN3c0eU5IYlRLeVpz?=
 =?gb2312?B?S2NlWWxWNzFmbHh5ZDlrRXdlNWFXSnBJeDErZDUrU0Q3UkU2RkNia3lERFZJ?=
 =?gb2312?B?dHNJdkdSRnFzVVR5VXR0RytYTWpWZHhNTmpnQjcxdU94SUEwcmdZb05nbGcz?=
 =?gb2312?B?NlNpNHI2TExpQS9wbFpOcXJWdmRFMlozVUVrTGlqbDd0Zi81V1REczZ4R21X?=
 =?gb2312?Q?D8KsZnDmf7qzGkDe9Y?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	YsRBeBe4qmqvsmxXZl/vFPPrYWFtnMxcLfHazdLaFGkaWFG/OEC9G0WHOBoJOLtr2ri2V9Gj1ywWtsAb0a14y86ApfFo/6geoZwdXR5s6G00BuBAajqumpfxoj/87KCa9hkwPi7Z9qRhMsVxT1KTgvZFp0jrWxh90dtlsPxNUSCI1r2srS2YKEzTCG1HprJ3dcYoHEvaPrVHMTvfXI6b/mrVZ6pek7e/a1FCLaEWzhuAbx/tS+ippk0zprk+ggLD1zZbFvXcGHcmAmmk3+7MylEBrPkGCg4jGp5cbd0Nh+DS6l7SMYG9xWgF6MaN0E3QwukSNQ9HwqAREqBrb0lp4g==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654a3ecc-d4ed-41ab-91f9-08ded57458b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 00:21:21.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oynDIfcXAOICEHG5PnpiTwMjmKYz188LnE4p2iTvqMvzf7RLOPAiX9VZRPLqbpmKVUcLicQPsMBJ4PqjOyGq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12161
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2026 00:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9906

UGluZw0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZU
V0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENClRFTKO6Kzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzogNzk5
ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLXZpcnR1YWxpemF0aW9u
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gPG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIHdhbmdteSB2aWENCj4gbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDIzLCAyMDI2IDE6NTcgUE0NCj4gVG86IG1l
dGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBDYzogV2FuZywgTWlu
Z3l1L831IMP56KQgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBbbWV0
YS12aXJ0dWFsaXphdGlvbl0gW21ldGEtY2xvdWQtc2VydmljZXNdIFtQQVRDSF0gcWVtdToNCj4g
dXBncmFkZSBiYmFwcGVuZCB0byAxMS4lDQo+IA0KPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215
QGZ1aml0c3UuY29tPg0KPiANCj4gQ29tcGF0aWJpbGl0eSB3aXRoIE9FLWNvcmUuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4g
IC4uLi9xZW11L3txZW11XzEwLiUuYmJhcHBlbmQgPT4gcWVtdV8xMS4lLmJiYXBwZW5kfQ0KPiB8
IDANCj4gIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pICBy
ZW5hbWUNCj4gbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11XzEwLiUu
YmJhcHBlbmQgPT4NCj4gcWVtdV8xMS4lLmJiYXBwZW5kfSAoMTAwJSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW9wZW5zdGFjay9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4lLmJiYXBw
ZW5kDQo+IGIvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTEuJS5i
YmFwcGVuZA0KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gcmVuYW1lIGZyb20gbWV0YS1vcGVu
c3RhY2svcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTAuJS5iYmFwcGVuZA0KPiByZW5hbWUg
dG8gbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTEuJS5iYmFwcGVu
ZA0KPiAtLQ0KPiAyLjQzLjANCg0K


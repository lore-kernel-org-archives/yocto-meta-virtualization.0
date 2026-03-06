Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F65F5140F
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:38 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64268.1772780670265854791
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 23:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=L2yBoter;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.40, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTg+EIfSlEihFgxeSr5BB/MeI8vu74u9jNTVBQTmr/KyAXyYbNcQxnvlDvwQq9Le4UyLZfAuKAV26I+wu7t5toWLhk07rbP7XZ47GJU4Dw3tY74L5aTXdwqzqMzIfeg26HMocvJdfh+sDh+1xt5/1O6IWGlNgRuRvEl9BEmXF7XN0wsQxlzUFIf/C7cdVeB19sAMfgWY2ve/BRw84HG+Sc1QBjU6pPOmeoxCS5rm77iDEpOE4j826s61NB48nkaedhS0+6Uql6qN2ZqWHOpJL1UR5vntWrfXp+3onw/R6uyydF5YKq7u8dP7oizwlEXtUghkpi7YIf4NO1ViBDfB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A86vU+/LLoZv7Zqa96VnRWPFAbVeLokgMhR/6Z3izT0=;
 b=islKixHM1ee1NwTdJnU02LPoovgPJQT3i+g7IThwfJzR/OwSAyHWCUZRjbdMWMS6Ip1sK92kkxbGu2XZCpEqP7ogcbzhBssSoaLuzJg6ijsmIOcnsThI9KgQx16DzFtQQAZGY2MthCuRYer/7xsAopRWWcngYoHbC0HPMF7D7Ycw/tYqA6AfrNBvQnC0EOYHwwjtX34d6XZEVsS1eNG0M+Nf+NTyTT/cQsTNhVT9iIkcLzI6JM68g3QMRqa44V8Mfp5oHrs9nOl0rAUr8WvBTiE4JbBVDYS85S1j3CdUkhYjLpyqQT03zAj3frYzsD9ehFX63E2/UXZJTFE5KNfBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A86vU+/LLoZv7Zqa96VnRWPFAbVeLokgMhR/6Z3izT0=;
 b=L2yBoterUnD+Wy3q+ZdYLNdCLjea0sB6yek+yTxhyZaRm3wk3gvpasnr6S35LpyCaKFH67PYcaY+vLkkLS5kOCM8iOxgp3xvz1MrEEjHRYUr8UZh3iAOe8lkugjNy5pp4C7x978CjcBU6pQLPiwCNTbMNLqoEn98jcbyIJhq9pAVrGqtKfYd6ManR3Qh34Yln5U8NwdGw6pfeh+g1xfGysuPbVPaSLMtB7Em45S5iV4xuq05Eo0FoOWPZ8mf92FI/1DXHHdfNHiFbX/3UftCdTsT/c5G7+pkPb1GdsNSJI/DGo+v1LUJltew+gNHB/si761cwvcJcnweqLBKKuk36g==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by OS9PR01MB17002.jpnprd01.prod.outlook.com (2603:1096:604:409::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 07:04:21 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:04:21 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Depends about podman rootless
Thread-Topic: Depends about podman rootless
Thread-Index: AQHcrTbdvoPvbP8D9EuAyq1NRJf9Lg==
Date: Fri, 6 Mar 2026 07:04:21 +0000
Message-ID: 
 <TY3PR01MB101107358F0B9DB8423E4529A9B7AA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-06T07:04:20.893Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|OS9PR01MB17002:EE_
x-ms-office365-filtering-correlation-id: 6df96107-8df8-4707-abde-08de7b4e978e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|14052099004|38070700021|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 gmJnjJ6r8pwzfMJjIh9t3MgwVguw7xmRTfj51sx27YHmHkyK4eAr2saLJxQGW7PpXtvR0xSzcdTQeuVtPE9BiOg88iXY+2DRhZB6qW+REtfP7GNM23R2N+8pvZVk3/0ZXb+LVxbdvS1GKQsmqO6E0NxAGN+VOEyXAMQMEVMFTcEGZ3ClZdcXaVLXGftJgxDfSnvxcn9OB8ox/jx38b1onoIkbBd5ve0AKoJDerpFdTAl0V2QOEvzgMvQKocNx1e/BrmQWl6VXGRCDjo7Rx8yCsclpdFDfa2N/FL1dwc9iZuFrIRXi8LZzfRZ43y4Ed+ShZuFO6jb8yDZE+a21DHWvIiU60kPNJohGrVX2KXFUuoQfvNnyGD5sIuFZtjaWphoCqRGjG21oQxKhf9MuelSGDEQYe1jLwuxs4ZzxFGNxfwT17QA6Fc6eZIFQwBPGYhlOaA0fY+INnpPyhApIUwuDMF2iXV6jGO0MKOxuhSsoexw03QkT1r2BgP4WUs2lg9yKWd8COt99YDhLsPm8F/qNthJXUyh4CdJnwdgMj5x9YD40XqMN9VvnKqEmSIIQzlR7ql1eqsDJb18Q/t5QoF/e/jGuCKbXbIEKFjA6YG6Mc3TiwsKCzeItKwlu4fMCUgqmuZEeIOhlAVO3WDUO36yUo0cZjqpbd7rcLgxj9X6cx/dmYD2kixfb4uQhFY8o81CDZ7krQ0C8Vs7oRm0MVvrrKiP6smNpK4LIWjNCbWmWWWmMNADdo4G5K+v2eFH4jbPT6ok7LHUbvZnNdeORLoXOIqUAf+bISEr3wl0I+6FBIgJwoUCHL1s1UnAz3gOc9Im
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(14052099004)(38070700021)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZDY3ZkI3OWZPSG9PZVRCSGhYV1E3ZEZha2kyT2F4a3hxOUpRM1ZHZ0FiVGda?=
 =?gb2312?B?TXZoNk1NbkhOdnFPWTdwakFBMzVPQ1ZBd1NhR1l1VFdSNXJMN1U4eGQ2WjYv?=
 =?gb2312?B?b1hGc0ZDUzVFT2UralpiVktaTHByR0xpMVJ5SWMwbSs5YUQ3OFZjNWYzZ3A1?=
 =?gb2312?B?ZEdVWWxIbGdpTnB5dlIzRmEydWN5M0xDbXFYRFEzUXpzeS9rNEpOQmV5RVJj?=
 =?gb2312?B?MXNDR3VWdnpxZTIxcmRYc0JYdFkyZE8vT1pKWWJwVDhYanhTSW53bG9wQ0pz?=
 =?gb2312?B?NkZxbmdVVVJUZGJiQ0ZIS3RYWm8vNXZXbW83cVdrZVNuRUVLRWVuTjRLM0o4?=
 =?gb2312?B?ckxSbzdnSXFVb1MvVDVQZXRTaE9yMCs5QUpLcVY3OVJCTWhwMm9IUG1DMThU?=
 =?gb2312?B?K1ljWmpuUzhlcGVpVUdhYzIvTmpBVFgzUjRpNURJSXY3S1NnRVZENHh6emZR?=
 =?gb2312?B?ZUZneWJSZkJ5ZmEvc2Ixb29TeXFOVDlhbUxxUkFiYVJUY09XdDI4MjdGQjk0?=
 =?gb2312?B?Z2RaR05tK1VwVXc3QmlLdVJrb1BqUHQ0NXcycndyOE0vNkdpOW91NUxjSElt?=
 =?gb2312?B?OGZXMUc0ZW9kRXNkTFI2SllIbWgrOTc4KzZWMCtVUnZib1FucnRoOWs1UjU2?=
 =?gb2312?B?SFhXNHNpVVRyNkFmT2dJZ3ZiQXY5aVlsR2IxMHhzUXhUTXZjdUxTOTN4Ny9v?=
 =?gb2312?B?ZzdLdzFSUmhGLytQa09VR0padnhpQk5hL2hqeXJsR3V5Ly9ZLzM5Q2NKYkFK?=
 =?gb2312?B?NURTQklnRVVJK3hwbEllWjZQYTBDVXNQZ2x4TWxVSHQ5ckhLeUk0by8vNmo5?=
 =?gb2312?B?NThkZGJxV0sxMGtYS3JzZ2JUUDhuZFMvd1IvSWxIUS8rci9uclA0dk0wUi9U?=
 =?gb2312?B?VkxwY2JXSU90YmZ3MUVxRFFQd3F2M2IvZGMzVTlrYzF3eVlqSFBJbUdRTkpH?=
 =?gb2312?B?eGVXb2ExeVlrNm9YNXkyWWtJT3Y0THFneGJJMDhFOFVoRTI4eWFaeHEwNWhh?=
 =?gb2312?B?Y1FKL1dwS1ZISE05U09kWVZUbHVrTUl5Smd6WFg2ZDZ4Y1hSUmg5YUlMQjVC?=
 =?gb2312?B?T3o5dGJCajRmaTlZdVJ5Z1hId0FodFhZRFY5UmFETzR5L1NjWHdmOHlhR0s3?=
 =?gb2312?B?QkhSVEdlQXgzS3RFTzN1NGRPWG9pSlN0RzZnYTN5QTBQOEhUVENrMk0wbVhx?=
 =?gb2312?B?VktTRXRDY2ZTTWt6YVgzdU9neHhvRTFseithYXVLS1lndUN1bEE2eXk3c1ho?=
 =?gb2312?B?cy9SRHNJZThEWEdlbDRudVdsaHBSejBrbk5ITDJ1Rytvb3pZTFphUmlpMXdk?=
 =?gb2312?B?S05LNDc4YVI0RktiQUl3dmdDU0YyVnArbFFmZDZmMEl2ZmszeisxZ25ML1JO?=
 =?gb2312?B?cFBoTGh2MHdSMjYzdkJFQkRpTktNd0doKzZBTnBwTHFOZUZSWHBpZ3pzdDVu?=
 =?gb2312?B?QlRNdWNRZUNVZm0zcWdOL2lQalJtVlMxdzBRaG9vbGZGRi9TQ1Q0VmRadFpm?=
 =?gb2312?B?ZzdYVFVjTjNTck16cEtLSVcxUEtuRVJaSHR4UldyUE50dDdUd0lUcW9XUndR?=
 =?gb2312?B?UG5acWtJOVFHTGhOMlZZa0hIQXNTMWpTLzNTU2R1VDFHYldacnBMNEdKRjFr?=
 =?gb2312?B?OTRYWERrQUJVekswZDNvZ0pyRExsbm1aS0RYY1hFaHlSRDQ3bC9IQ01XaXI2?=
 =?gb2312?B?MStXOVpSSGt3MHJXZktZcTNZSkRYaFVEOVBxQURqY0VGM292ajI0cVUzajFz?=
 =?gb2312?B?a0ZINjdJdmxNcHN4MkdwUkoyUFAxSjR2NGE0SHVvTWZWaWxvTHJZdmdreGsw?=
 =?gb2312?B?T3dMcDloV0MrWmJWTTJEUk1ubEJIZnpOT1B0WlBvdS91ai91azdXWWphRzl3?=
 =?gb2312?B?bjR3dUNUNDc0blhvbFNlVzRJQ2RuVU9SdW1UazRCWnNkalo0N1B0czRFbjE2?=
 =?gb2312?B?U2dqTVZqOXpYSmJJaXU0NmFyeWpBclRNQXFiU25rcDF0dFdhWWsyOGpWa2Np?=
 =?gb2312?B?OGM3a3l0UUZyQXQ0WnVOUDdqR0liZVJFdTdZRXFNMGhjQUtVN0FRNW1lSDJP?=
 =?gb2312?B?Zno4TktRdTFuUEFXNDQ0d1VVaEtrcExiNFlhbUVzZ1BjdkJVRXdiTFpoYVNH?=
 =?gb2312?B?cUJGNjgzZ3lkblZWUUI2ano4MGFzU2tsMmgzcjh3V3RYenNveTdjdWV6c0dB?=
 =?gb2312?B?dE12QXJwRklJWnI2RDhrYzBjTUhDQXZmNVNldDlabm5xeDlNSTVUVGNUS0Jx?=
 =?gb2312?B?NVlkaGpzNTA4amxTTmp2cWduQlhNZmdGdWVVdTZZZU4zeFRsYzBVWTV2WHFV?=
 =?gb2312?B?YzgxbUxOekdiT3pxNUtkT2tLbktaWFY5dEZ0QVpMbW9jZnNDN0x3Zz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB101107358F0B9DB8423E4529A9B7AATY3PR01MB10110jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	M4+dn0gWuukLGQCeK7KUnhxyQFdPdvgXVfp9rYDkqJd2FO//ternUFTub3pohVmE0lIPUdyqbj0JKoOtb5W5ucxhXKTRS9VSAyluaCzccfj909aRR02BkGs64UHoq1+dwIjYCaR9co1ITpz6w9EjPrRA76YfG6c7W6X4XvfQ5lTxgzhJPuQ992affPq8biIRTNRfq6/n9GCplKut5VthKG0nzdKiZxQdHXAlji83E1ixOt0AVTxbp3AQZXijsp4hqla+z6NAPtKpSvoHNySxpF5DaQezlv6p+FQ82+ivg1RGYhK3s7FA3VDwcSsfje/E5lEtTepThkbYwo7RrTABQA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df96107-8df8-4707-abde-08de7b4e978e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 07:04:21.3285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WPRAR5j5XG7u5gjxAWByV7s4B/zG7F6aIQkfgPIt7dGLPaZuAR5R0hLzdJenIuQe5h9tju8fQgewSRNOynJhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17002
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2026 07:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9622

--_000_TY3PR01MB101107358F0B9DB8423E4529A9B7AATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCiAgICBXaGVuIEkgdHJ5IHRvIHJ1biBjb250YWluZXIgd2l0aCAgcG9kbWFuIHJv
b3RsZXNzLCBpdCBzaG93ZWQgZm9sbG93aW5nIGVycm9yOg0KICQgcG9kbWFuIHJ1biAtaXQgeHh4
DQogRXJyb3I6IGNvdWxkIG5vdCBmaW5kIHBhc3RhLCB0aGUgbmV0d29yayBuYW1lc3BhY2UgY2Fu
J3QgYmUgY29uZmlndXJlZDogZXhlYzogInBhc3RhIjogZXhlY3V0YWJsZSBmaWxlIG5vdCBmb3Vu
ZCBpbiAkUEFUSA0KDQogICBXaGljaCBtZWFucyBwYXN0YSBpcyByZXF1aXJlZCBieSAgcG9kbWFu
IHJvb3RsZXNzLg0KICAgUGFzdGEgY29tbWFuZCBpcyBwcm92aWRlZCBieSBwYXNzdCByZWNpcGUs
IHNvIEkgd2FudCB0byBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoaXMgaXNzdWUgbGlrZQ0KDQogIGRp
ZmYgLS1naXQgYS9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtY29udGFp
bmVyLmJiIGIvcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvbnRhaW5l
ci5iYg0KaW5kZXggYjk0ZTY3OTkuLmM4NjFlNTA4IDEwMDY0NA0KLS0tIGEvcmVjaXBlcy1jb3Jl
L3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvbnRhaW5lci5iYg0KKysrIGIvcmVjaXBlcy1j
b3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvbnRhaW5lci5iYg0KQEAgLTM5LDYgKzM5
LDcgQEAgUkRFUEVORFM6cGFja2FnZWdyb3VwLWRvY2tlciA9ICIgXA0KDQogUkRFUEVORFM6cGFj
a2FnZWdyb3VwLXBvZG1hbiA9ICIgXA0KICAgICBwb2RtYW4gXA0KKyAgICBwYXNzdCBcDQogIg0K
DQogV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgbXkgc3VnZ2VzdGlvbqO/DQo=

--_000_TY3PR01MB101107358F0B9DB8423E4529A9B7AATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif, serif, EmojiFont; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
<span style=3D"background-color: white;">Hi Bruce</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; When I try to run container with &nbsp;podman rootless, it sh=
owed following error:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;$ podman run -it xxx</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;Error: could not find pasta, the network namespace can't be configure=
d: exec: &quot;pasta&quot;: executable file not found in $PATH</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;Which means pasta is required by &nbsp;podman rootless.&nbsp;<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;Pasta command is provided by passt recipe, so I want to send a=
 patch to fix this issue like</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/=
recipes-core/packagegroups/packagegroup-container.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
index b94e6799..c861e508 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--- a/recipes-core/packagegroups/packagegroup-container.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+++ b/recipes-core/packagegroups/packagegroup-container.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-docker =3D &quot; \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;RDEPENDS:packagegroup-podman =3D &quot; \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;podman \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+ &nbsp; &nbsp;passt \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-size: 12pt;" class=3D"elementToProof"><span style=3D"fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&nbsp;</span><span style=3D"font-famil=
y: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans=
-serif, serif, EmojiFont; color: black; background-color: white;">What
 do you think about my suggestion=A3=BF</span></div>
</body>
</html>

--_000_TY3PR01MB101107358F0B9DB8423E4529A9B7AATY3PR01MB10110jp_--


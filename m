Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B295CA5FCE
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 07:47:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19634.1791100047117154644
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Oct 2026 00:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Qh5ZL+n0;
 spf=pass (domain: siemens.com, ip: 52.101.83.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tItTZuEVoYjJoidlJ1XtuwJUDOhWzyDdx0v3AMWF0n5eIiMHG3PicyFTm4h0nzRqt7x4q4WT15iu1pjL+duN/EUR2k0llINuIEMNsMqXCSuVkMM/BQdbQzcJJt6Slj4sGojHTR5/1/MZR8ix7EP7IxK7x17yUsyolcJBJnp3F53v/7sXKHvYjO8IN336BJvOzkwWg0mzvsTnrIILKwyWPXX8mhL8Yzxrog+i4j/PiOVas+FuRNmcwPfNOXKCJGkH397oNOPBnxFMvy6s8lrBhrQZAWGHs3e8Dl+j91wP/1yfaflCY5KaeX/TQAffkLCQ8VQ0dD2Rx9z3357y7s+CDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUP+Ajc6EkLWMxOaESGJ3P8THJ/3t9KqhQbgrNfWZpY=;
 b=QQ1SoHfFeqInczF39+0QlffxDs1y8SBytoR1px4zDR304V8VBHGT/U+skihenfr7dUU+fnO+uOZjD+/XSK1+dN9K+fO/YTt9mqYPH3JGH5PfLGQCwyOadq1UmL1Lrzg7ySnMOaAYyCMF+vZUjtOs6Ml4copGT7Pt6mvgP+G+aSYTKOFtfkvQoM/6qCqgnV4CzNRYR/5Y+xEdQS2WEOffsKbl+UwBqrZSGatX/44GC25akGAXYAHSRZ5sJWTa3wPxWwJCZ6iInPYV6h6XvowosA0vu9TxVSMstkMegp0Pxu9pOfgZtJxY81ngn33wZAkDZ8xzGv2lALXltgYWF67fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUP+Ajc6EkLWMxOaESGJ3P8THJ/3t9KqhQbgrNfWZpY=;
 b=Qh5ZL+n0HawQMFNtXB5gEuW/lPfz7EpnjlXUgJl2qDmPjCeXEIrr7UlO1Y52RE1uP6sHXUOIbP1v/291/lTJsv47MQAEmFgwxl3sqilzsg1ohYuuUrPTTjx1gLVXtYnoGCj5P4ThgZircYadQvqF+ewNN8NXzrACi8ZpSr6ixqjPyfO7L2nIu0Pm8a8TnivToFyq2t2xltD+7ahQwufP3N/PLskVSUErX82Y6gPJULKF/ERScALvIWMFs8UjBEO5WKOmhe8SDEIUd65e8V1c349zgaZ5radATpQanHpa5tttnVpZ8zn1tiaU1jpPizMpqHk9OMsV1iMi0zIJIGb3aw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS8PR10MB6891.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sun, 4 Oct
 2026 07:47:22 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 07:47:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][scarthgap][PATCH] crun: patch
 CVE-2026-88264
Thread-Topic: [meta-virtualization][scarthgap][PATCH] crun: patch
 CVE-2026-88264
Thread-Index: AQHdT44V5XWv7XWZY0qv2/9mGqMjwrbsogMAgABnsnA=
Date: Sun, 4 Oct 2026 07:47:21 +0000
Message-ID: 
 <AS8PR10MB507396718D6370006BA98C5AFD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260928211145.679470-1-peter.marko@siemens.com>
 <6ac1ad40.5fb20c3f.19ad37.fbd7@mx.google.com>
In-Reply-To: <6ac1ad40.5fb20c3f.19ad37.fbd7@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c365df1d-5bed-4c85-8d0c-8d951ccb6110;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-04T07:46:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS8PR10MB6891:EE_
x-ms-office365-filtering-correlation-id: 93f05657-e527-4bf1-8888-08df21ebb944
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 xYZ4ccNJVe6+Hl89cLtthh6IPVnc8UKiLbgOlEtiFjp2Q1Kssf0iedCQpu3GDv+6xljKuNwT4nFpU4s+6y2lPyBIu+C6TT3+yqWL44cUT+EbssI+kBUckV4HHSRmxeTSWjDCH4b8Jof8BzDM5hfoZpe0MMOiVs/4D6DEt5V8a9+V1zHEMGlzBCqYPzacdJnLncWhNGsKUkyCA9I+XbT9HwXW5skARcZtwmd1Qb2BLcuCK+jmrCqqr0x5LQ918yotGWcz0UjsG3iFuZphzEG3IM0BDLuz+fpkmlzo1sWaFvdxyNym6zxgc99MllyYcabq3gaL2Pwu2TZO0SZhWZtiR94aonB7mrWIbuEzNN3rXtV00OW5B2FY7uvGgNSg6HhfaJTH2OdcrAWxDKUm67txr9fTTPzp9uo2B8hs34Oo8TpUtyTKU85Izr62WnPl+F4AHQ37DdQv0kmQZsjpzeWWICKHLKLT8VS0jzTO8kMXt2i9Yyy6s7Ug+xWUk2yOklEBkdu5ZZTFkU3IrmnrlWc188xlyX3e+umd4VODyGR/pGm3pe8R0OH6/oZ/Dk9rGaR/cHAWDEf8Vo5pCqRBt0a5+BJn1frXCIOrunhVycnkvtSnsVf1+u2M64O1dJfLQQzeX9rQofz6ETJ8uNJQGRSKoCZTkLvWRUYPqaeUFu1Jz+g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnpSVU84UHhwR3J3RmRWbkFRaHk1cmk2S3JCVjZ1Yi9kU05DTUlIemJOaXY4?=
 =?utf-8?B?REhNbjk0dldzRlBJQkkwWEI3S1lDRm56czgvbE9hZWI4QXEvVDExZldzUWhl?=
 =?utf-8?B?RlNDK2JURjg1M25velgvejc5VGVTaS8weEVuMEs5aHZVOXFpUno0UkJsWW5D?=
 =?utf-8?B?QUQ0bDFQWUZnUEo1MGsxQU1iMmU1QXF4QUZaVDJ6dEEzQlZ0MnFPRkh5cnFw?=
 =?utf-8?B?QTZxNFZsN29YSlFBVkhwRmdieDlRc1ZIdkREZVY0eE5oTGJNN05JaUFyWXVN?=
 =?utf-8?B?dVFlYWZDd2V5SjhIZnFuS2pUc1A2cWw1NFNUY1pWMkx2Yys0ejBweVdFc3l3?=
 =?utf-8?B?dkM4VThZd2hRcWZzbFBldDEyWE5nak9sdEZiOUdRUTJEQ29IaDBaN3BFampS?=
 =?utf-8?B?L3R0VTdLWnlZMDE2MjZDOHAwQWc1ZXg3VFFJSDNWN3A2YUdYUzVVeURHNWdQ?=
 =?utf-8?B?d2s0UEJGcUhDMHNwZ2trdFk3dmdHbFY4ZmdDVGNLbU9ERytMWkVGbWZUc3ps?=
 =?utf-8?B?OHF4NFFBS3BNdWc0SHhDR1UzMkFKbVk1RUQ1TUovdE9BWXlzSnFuWDJNeDU3?=
 =?utf-8?B?UTJyTmxRZm9zd3Y1cmlUWVR0V2hUZDNYRnU0d0N3eXZqb0tMRE51UUxGSDN2?=
 =?utf-8?B?TGpTN0pKSUM4ZWF5V2dLcmRzakUvNmZTcDNKaTZHNURueURrVmpkV2RVN1FJ?=
 =?utf-8?B?WGVReW5vTUpOdVJLd3JHK0xwU3JKU0t2dUFkRHJLTVJER0ZWeDBoZWdrWVh4?=
 =?utf-8?B?ZFFqdEFVMHpvY3RPV0RNQXlHbHI1cktvbFJtNklpRzFXakg0L25BZlFKR1JD?=
 =?utf-8?B?MlhRRGpzTlVNZ0tkWVNTWFplblZNS3RoSmdpekV5OStqRzFIR2RDN3Z2Qk42?=
 =?utf-8?B?TG05VE5hM0I0amVjZmdZRXRvdlZOaWY2NWtUVWJpcm9lcVNOdE5rdUhldnl2?=
 =?utf-8?B?ejJtQzlLNFZRcHI5R1QzUWhwbkNoTUE1dWZzdENyUStMK3Z5bFY2OU1uQmtI?=
 =?utf-8?B?NkdOUElNQ09CQ3k4Y3ZSWk9ML0kxOUpSMWdLUDZvUEwyY0JRODFLWkdSeVJz?=
 =?utf-8?B?TUs1Zis3QklPSWIzSDhES0tJd05xZzM0MzUvRXREUzkvVUNEWnN0bmRTaGdx?=
 =?utf-8?B?VmtKWHJwY0NMQmxlTFQwMFVSNFBNZW9rZlAxOG1Jd3psNlRiWVhQc2FxaUZD?=
 =?utf-8?B?NUIvMGFxUkhnK1pZRUJRVnQvVExoRmRlVmErVmpoNHVZY1NpanhqYUZHREFL?=
 =?utf-8?B?amxTWGZZY1dxUGlUc1BKbXBEQUZaaGxVTllpays3aEVzUEUvU1cvMHBmUVo0?=
 =?utf-8?B?WU01TFRwZDlUTW1EcEdkRnZhenRMYi90NlBPSDdiVUdkV1lWbFl5V2xQamFj?=
 =?utf-8?B?V3hGOHJvVW51UkZtUFdORU1xaXVwUEwwTEF2UHZ6UkdkamFxMFh2aU5BNWxx?=
 =?utf-8?B?QnQ2WFNNVVY5Y1ZjTk13dFNFT2hXcUxNVUU0cGZQTFU0cGtlajd1dFdnNVZJ?=
 =?utf-8?B?SnBzeUtWSUZSYlMvdmxjQUNxV3VsVGFrV0NnNjk3eVdUMU8rWnlaQmhQL3BK?=
 =?utf-8?B?ckJQY0lkUllZOXNqVFdHTWxKY2ZvVnMrZWtPcElPbncwZDI2dUpKQ0ZIWFV6?=
 =?utf-8?B?YXhEUUJVay9CVTdIUWJDOUl3UFRIOGFUSisyUkVoc2VKN09UNzF1K0hTTXk3?=
 =?utf-8?B?VW9MT3U3STk5OWRrQ3RMa3RIY243N1JjdUFuV2xraXpXWEJma3FOYUdjc25p?=
 =?utf-8?B?SlUwUGlxejgyMHBpY1lTczJoMW83V0x2TnA5UUxvNXFJMlRKNzE2N2ZiaVdm?=
 =?utf-8?B?VXhsNTZERENZUHVFRGxZV29JekIwSzVQcjVlZlYzRW5RN0dvV2VrT2trYUZI?=
 =?utf-8?B?UUlaOFJxSVhMbXVCSDNyWTdVa0dlcm9Kbmh1MFNJdzUrYnZDdlRDSlBSdVM0?=
 =?utf-8?B?ZXVhSTR0VDNHZlJ5VGpvUXhhZHEwK1Rua0JkNWNTanBzcDJRS1pGbUp5OGI1?=
 =?utf-8?B?dzZrRFlpWnVna1pSR1U0ZHc4QjZvZ3VJYXZjNmZObCtRRGdTMFh5MmpnY3I2?=
 =?utf-8?B?WUUwVU5xSHcyOC9qRndFdU5WeTkrSHltcENOa0hYakN5dGM1Tm9xM0dMVHhV?=
 =?utf-8?B?U2ZleUNXMHhLMWQyQ3NCaytycmFvdlM3QXBNUlQ2WW5na2w0bjV1cnhqR3hs?=
 =?utf-8?B?RlZvQnhlY1VzNDhVWk1uSTRCajdleXdOalYxb2lKSkRjSGc2VVhiR21kRG5n?=
 =?utf-8?B?TG8ydXNpVE5vNGhXeW5ZWVkralJEOHRhWDJMdGtTcVRoNVpHQVZCcXZvN25j?=
 =?utf-8?B?RnFCaFBYc2oyMmJVQ3pCZDZoZ1NsRFA1VlhpQUVYNG5zQXJ5Zm1VQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f05657-e527-4bf1-8888-08df21ebb944
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 07:47:21.9124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ym+h/hIErq3gYtu8m/1aDahQ3IZS27IDAfKfU0bJo2fTM/dJ1/tbZNUA2AvDuC3bZUsk6YxjA0tX+2QtCMh7/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6891
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 07:47:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10105

SGkgQnJ1Y2UsDQoNCkNvdWxkIHlvdSBhbHNvIG1lcmdlIHRoaXMgQ1ZFIHBhdGNoIGZvciB3cnlu
b3NlIG9yIHNob3VsZCBJIHJlc2VuZCBpdD8NCmh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS8xMDA5Ng0KDQpQZXRlcg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hm
aWVsZEBnbWFpbC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgT2N0b2JlciA0LCAyMDI2IDM6MzUgQU0N
Cj4gVG86IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBDYzog
TWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtzY2FydGhnYXBdW1BBVENIXSBj
cnVuOiBwYXRjaCBDVkUtMjAyNi04ODI2NA0KPiANCj4gbWVyZ2VkDQo+IA0KPiBCcnVjZQ0K


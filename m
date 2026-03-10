Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415C4FCC9D1
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 06:49:44 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34368.1773125376163757141
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 23:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=g7NYOyd0;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.35, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOaj/ACZM9FLE6QQZRRMHVQ99Puqvd92f5TCKZyqP2mrJWyXrEF0C/t7Mc20rpCg1P3nlbo2Pk2C9xTjq/tRj1Y7mdG980VWLKQWInvw9jP2Chl5epUg/w7i8uhWeQTGJ3tgpMSRoCAyWFhFB1o10TDHZ6jnCLT2JonI6AGm9vTGvuaKMkoxK/Z/DfsTxhgBxTDoBrtaQ267lJSj+iktX5xSkEvA5U+nDf89pELldxgiwREVUIKwQo77V+umquMt6ClC9Ny0wlDgzK0kJuwTe2swdM8R+qEm42upWKD97EF58+FgJeN28Idg/0gKlrlO3D9x2yoUWun6JvHS1/CgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqDD4Rny2FiqeVg2E5jdZIAIvOijkx1sfB3KJi+wbUY=;
 b=yESXhdD3oK0QRT6UXo+W6JiMr/oYEj5gP0noUg5amYA5E3uXLl2T0EPZ1UasTPhVPl8MMRzMGZz3dt8JVIq/4yRG1ZSUjyD6/Qls2+9jBr7gTqX++hFxzCFGZ2VoIfrAGEWK1RqMqOxWLJA6B0u83+OVQwSuVog9kiPOO7JQhF/wcC0wPtVLxEYYbPX9hEu900cSgS00AMD8HVckHaKTElQ9FoKUjxLZTN/JtQNnojw0A2Swie9Lj5LZePusyEFnMBiBX/K64ukYGTuiHqK4KQuRxp+XWPeSn6QyUetzwCfWK6xpD+e/rNHrTaRqD8YvNGowwel0FC/l149wMCJTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqDD4Rny2FiqeVg2E5jdZIAIvOijkx1sfB3KJi+wbUY=;
 b=g7NYOyd0T3qvos95zkHscnvj3d1xDUQBqdU7K/DcpZ7h37/T0aZDluGB8NGYkREkMrijWLxxT+xiutnpKrwQzZ7xtci0lHst+251ygvn/6IVuFW41qZxwWUkh+yv0Lh83tUFl5Wqv1SncTs0ymXSxgZZ6ziB0W3nGwI/o1PaaXhLj6pb4121U6rwQjug0ZkLKvFRTt1+0H8KmXTlRzDflYy+hc1d75jAsbv3e7pkdU6YHC8c0dNZxkcaiO9exbHunwIukfU/axc6gdj0lt+8LupE5MB2EWhDM3vGsm5fFkM6VqeisyYXYZQYOjmfx4sbod74cFNbKrkhZrp98+jo1w==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by TYCPR01MB6835.jpnprd01.prod.outlook.com (2603:1096:400:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:49:32 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 06:49:32 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: issue about classes/image-oci.bbclass
Thread-Topic: issue about classes/image-oci.bbclass
Thread-Index: AQHcsFfKNJd6qUSG9Ey43pvThCuo7g==
Date: Tue, 10 Mar 2026 06:49:32 +0000
Message-ID: 
 <OS7PR01MB14444C313A7F44936A3D8EBB99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-10T06:49:31.465Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|TYCPR01MB6835:EE_
x-ms-office365-filtering-correlation-id: fd6463b1-a621-4446-a54e-08de7e712f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 zpeMEbeEOvsog8TXvtRVCrU7PwtGx1lCOeF5jJKDztaRwiGhWF29VicUwakY/kSWZVIc3Qm8g3NqRUyeMyVOOzyWR/XZ5P27/xYgntNekNfV5vVaXB83sTPqaIRaECqUO/QeRetfSgwp959eYokTZjiKTU22Iv5lf+Exb28NdBvH/rVnv16bhv/Ml9ZQV+/arOAtI4rC2epnhjc6eTVtPJWbJF/OSTmUt/xFWwjk+32QNdg+xz8CH/oIXdcRb4oZyPd38K7OKmKw3mo3rT4ukN5fW/G3YbpHXfTY/m68jAQX/i+S7i2/qeLfqXGRSA623q24yYpBsHthUXV90M7LGoyWl++ZCb6WnjGgZNHbH2BUkptsXDGeLb/24F1RZt7WcgvH4Cfl2TjmYGCUTuQ6/f99WlnYKzK4Dt97DwJ82ikxax6nW4OsL5b+VyGSTcRU3sogQWd51JEqAD+1oXjb+hqOsWiQC+u4vLysvMwsrLRZlpHa+1Sxe4Q0Pmp9WvuQWEimfJLDeXV/otuMUKsBuTH8Tv+168OXT69beO3AEPqS91x5O35rJdNyyR/o9hljF8IKZzj+iXVbv9v1pqHemaqiGr5Eapb68JzTNv7h4C9E8fHI2TGmONtEMyY9b6gAecfYZd+AT07TqKbnBVStDWPvG6GASJTi9Lwqh9YdyRpHZa3imH595ErWZNrP8/VVxdR6UGlk7xynK+gP3iiSmhaTegPucqsHyxo31xlL2x4AxdFzEoKIqT1TTslvvo8uhUO8sB3Hwe336p8rtGBnHF6uPpvdYTDTRR2KD6r7XDkiE67FwIfAQbUpovE08GKU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?dkovQ0ZONHVCUzNRNUpWZDlQOXVzNmVlVldCdzQrODgwVkdTU1czSzhzYnJT?=
 =?gb2312?B?aDd6QW9oMkUwQ3pMdmxFWnR5cGptWDRYeFJuUnljTVNvM2xHQzZ4Q1pyZXBk?=
 =?gb2312?B?b3ZNc2hCcW1obE4wUm0xRWo0ZlZGQjE2T3BCNmI4UmxmYjE4RzNOM1puTFV1?=
 =?gb2312?B?Y1MxMGFyd0tLemRTbzJwRE9Ic2YzRE1ycE1IZkF3anAxTkpNR28zY3I5SXRI?=
 =?gb2312?B?RFk0QVcvR1lyRXlCdWMyVlVRWk5UblVKTzd5UVJvVmY2bk83c0tjaFFELy9W?=
 =?gb2312?B?aW0xb3M5c0o1Ym9XVk1MTVlybkhtRXAzZWFlcjBKTHdMaG0xYjFCc2IxTStv?=
 =?gb2312?B?UUVRSzUzMlNkcnY1NDNEVFRiYWFSaW1UM2NFSGZvNytmdkhDOXphTW12NHB6?=
 =?gb2312?B?SVJHSE4ySU16ekphQWlTTGN4YVc3NXVFZVJITmpSd1Z5eDJHT1pQWnZmTUZy?=
 =?gb2312?B?YzluNlhrSzVQaW8xZURDaXJ6Ry96REV1U1R6eHRYZnRteDJHa0xMOE1yVHRC?=
 =?gb2312?B?bUcwRUJscjR2RTdqaE1KcVVHS3piclV3OUxjUHhROHpHdGducUZNdlU2ZjZq?=
 =?gb2312?B?OEx2UTM2dDdlNDdDUXIzWkI1SVdXaStmR2xVUHZKYkVkNG1ZZk9mMHIzVHp5?=
 =?gb2312?B?MU1aMDBOODAyOExPV1g1U2E2ZVhjeGFOeVN3N2w3dlhsSlNLNzlNdkY4UjB0?=
 =?gb2312?B?SDhyZVRJWlY2YXVvMjJscHNhY3ZHVHp2WGFrclYxQlFhSG1YY05nL1BySWtt?=
 =?gb2312?B?UCtCUTBGVEtrbmZzZXlSTm1YN1A5dGljU1VFVTA5OXZtdGQvSEhhK3B5YnVu?=
 =?gb2312?B?ekhIdStxdjI2VDZFNERYaisxZFZHMzAvd1RzeUd2a1UvWEYzRnRYc0hwQ1Nq?=
 =?gb2312?B?Tlp4a2FVR1Y4RFJGOVdFVXlROWdLdFJXb2ZZQjNOMW51eENWZmw5Mm9lalgx?=
 =?gb2312?B?ZnlsLzRlVmVwQzlKZFVTd0RKbWE4UE93QkIvMDJscXZIVkFCYzFza1R3TTk4?=
 =?gb2312?B?cXluSDY4OURBcVZ3VEw3UTlrQ3NiU2pJOGZXZDArM2ZLd1IzTDVzeHUrWThW?=
 =?gb2312?B?eXVhRld0a3ExSXBmdmVRTHJPckpZeTB6Y3B0STVlamlzdEs4UHhNWEFjbDg2?=
 =?gb2312?B?QVZ3dTJobzJNRHkzK3FCeDhWMVhYbGNXd3dVdU5CaytGVjZUdHp0WjVUOVMv?=
 =?gb2312?B?RjJRWElSNnNVVkg4anU3cXg5VDlxTlVVQWthbHZnc01wNWNoaE5sME9HaXNa?=
 =?gb2312?B?SlA0U090ODQ5c2NFWUtmTWRuVFI3K2FFd2dtWExBdkxGOWVSWWVHWG1LclFz?=
 =?gb2312?B?c21EeHVEM1k2VnI1ZWVzdnZUVG5aYklDNnE2SmpGQ25MNi9idXQ0eitiTTVJ?=
 =?gb2312?B?MTFzZ21uOEt5SmZLZkpwMzFldGF1bnc0VVFvSVNGSWlZRi9FZytySlVtR3Jj?=
 =?gb2312?B?SDJiazNzeEx2R29DMnpLbnJGOTY4NFhJanFFdW5Ndmp0L0lvYmhzWEkzZkxv?=
 =?gb2312?B?S1UyN2VZcS9EM1l5SEJEOE5pc2MvMUxxRzZkYUVmdE9HQ1hFWnF4azgwQ0hF?=
 =?gb2312?B?Wjh5ZDU4K21kaXlZeFhnT3htKy8ySzE3Q1JzZ1FhNHMyOHNoeS9nZ1RkdVhV?=
 =?gb2312?B?RXdKL1VuNDFNNnZ2RkpST0pQakt5ZlpTKyszVXpoZmd3UG9sdHQ2d0c1cE9m?=
 =?gb2312?B?VzFjRk43a2E0NUZxeUJVVDkxcC90Mmc2WVZBSXp4Unl4T28ya01aR3g5ekx6?=
 =?gb2312?B?WUVJSFZ0YUVhV1pwNU5UUElDdkI4NXF5Q2ZjMC9VNjYzR1VkSThDNXFENkNi?=
 =?gb2312?B?WHdDQmY2OXgrVFppOWtOSEVZREloa0t2VlJ4K3VVZ2ZnVDBHUWdGOHdndmF0?=
 =?gb2312?B?M3habUJzOS92elVGeFR4b1Z4OEVIUHVHYkdYSytFQXhGWTUydWtCY3E5c0Zm?=
 =?gb2312?B?OThCdFFrRGNUc0dkL1JUN01KdEdYdzZDMlVsT28vSTgxd0dlUlhsOTVkR2Zi?=
 =?gb2312?B?bVlySzRhRG0xM1cvajFXSEVENGlZYTNsYjR4VEFwS0hsNDRPRHY0cmtKM0sy?=
 =?gb2312?B?eWJFR2tiWFNKWjVVYWtKam1TeHNabGtjT1c2Y1lSY2c0cTl4RkZsa0Zuam1q?=
 =?gb2312?B?bW5QOHZxMTFPRk1oZUVtSWp3MlJMYVB2UktBMlF3VVpTSkg0MWx1REhtQVpn?=
 =?gb2312?B?RXB2dDllZVpIMUFndTFVMDJncjJtMDZuZ2xlSFlIeWJFQklFdWZMa0h3c0tx?=
 =?gb2312?B?VmlvTGRWdHRUY1hLZ3ZMbjFwc3pXM2xYT1J3KytRSFFNaTdmeWFLaHZxR1hQ?=
 =?gb2312?B?dGwvbkxVdk1JNEp5RlBrUmtmU3VyMWJ0ZnluaDNOcVltMWdHamZBUT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444C313A7F44936A3D8EBB99B46AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	VAcYN5C6bVzE1lGandNk3Ll5iTUq/v6oJIryHiuUYoxx8b/zBY6rVxb097g1EXXLTKTPkesOZ8grmsWiT8IrRE/rKH3XzXxTISxUZ2UwKSJvFXtEeDCJHxsCMkNAoc3CrdAO580IPdWSqwYpcOeoadCe1IysHlmEegGgv5kspL4rb3ifc4OWA2C89cKjuuqiqdoaK/MCK9JP+pzAtqSc5eXUTXwY20BrVgkkWB3Ybfsg3kTENavUv1Py2CRK/9Ek2d8AKdp3G028TdO1JGinUdniPq3PtJbyLtwjlYbz8CStu31CDn6tMBZBi/QqMfQIRphnKWKAoXdlLZvG35q2/g==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6463b1-a621-4446-a54e-08de7e712f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 06:49:32.0218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3SFXwMrReLKhwC2J/aSe+MKN7H+Ti0xbMyonhJBYBnOlh1YLKm8jsuqIWYdmAmjqfVtKWol9N2mTRCM9Wslmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6835
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 06:49:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9630

--_000_OS7PR01MB14444C313A7F44936A3D8EBB99B46AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCiAgICAgSSBmb3VuZCBhbiBpc3N1ZSBhYm91dCBPQ0lfSU1BR0VfQ01EID89ICIv
YmluL3NoIiB3aGVuIEkgdXNlIHRoZSBjb250YWluZXItYXBwLWJhc2UgaW1hZ2UuDQoNCiAgICAk
IHBvZG1hbiBydW4gLS1ybSBmMGQ3OTI5MWVmMDgNCiAgICAgZGF0ZTogaW52YWxpZCBkYXRlICcv
YmluL3NoJw0KDQogICAgVGhlIGlzc3VlIHdhcyBjYXVzZWQgYnkgdGhlIEVudHJ5cG9pbnQgYW5k
IENtZCBhcmUgYm90aCBkZWZpbmVkLCBhbmQgY21kIHdpbGwgYmUgdGhlIGFwcGVuZCBhcmdzIG9m
IGRhdGUsDQogICAgV2hpY2ggY2F1c2VkIHRoZSBvdXRwdXQgZXJyb3IuDQoNCiAgICQgcG9kbWFu
IGluc3BlY3QgZjBkNzkyOTFlZjA4DQogICAgICAuLi4NCiAgICAgICAgICAiQ29uZmlnIjogew0K
ICAgICAgICAgICAgICAgIkVudHJ5cG9pbnQiOiBbDQogICAgICAgICAgICAgICAgICAgICJkYXRl
Ig0KICAgICAgICAgICAgICAgXSwNCiAgICAgICAgICAgICAgICJDbWQiOiBbDQogICAgICAgICAg
ICAgICAgICAgICIvYmluL3NoIg0KICAgICAgICAgICAgICAgXSwNCiAgICAuLi4NCg0KICAgSSB0
aGluayBtYWtlIE9DSV9JTUFHRV9DTUQgYXMgZW1wdHkgY2FuIHNvbHZlIHRoaXMgaXNzdWUsIHdo
YXQgZG8geW91IHRoaW5rIGFib3V0IGl0Pw0KICAgT0NJX0lNQUdFX0NNRCA/PSAiIg0KDQogICAk
IHBvZG1hbiBydW4gLS1ybSA3MDMwNmRhY2RjNGENCiAgIFR1ZSBNYXIgMTAgMDY6Mjc6NDIgVVRD
IDIwMjYNCg0KTGl1DQoNCg==

--_000_OS7PR01MB14444C313A7F44936A3D8EBB99B46AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Bruce</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;I found an issue about OCI_IMAGE_CMD ?=3D &quot;/bin/sh=
&quot; when I use the container-app-base image.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; $ podman run --rm f0d79291ef08<br>
&nbsp; &nbsp; &nbsp;date: invalid date '/bin/sh'</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; The issue was caused by the Entrypoint and Cmd are both defin=
ed, and cmd will be the append args of date,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; Which caused the output error.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;$ podman inspect f0d79291ef08</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Config&quot;: {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Entrypoint&quo=
t;: [</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot=
;date&quot;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;],</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Cmd&quot;: [</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot=
;/bin/sh&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;],</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;I think make OCI_IMAGE_CMD as empty can solve this issue, what=
 do you think about it?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;OCI_IMAGE_CMD ?=3D &quot;&quot;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;$ podman run --rm 70306dacdc4a<br>
&nbsp; &nbsp;Tue Mar 10 06:27:42 UTC 2026</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Liu</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_OS7PR01MB14444C313A7F44936A3D8EBB99B46AOS7PR01MB14444jp_--


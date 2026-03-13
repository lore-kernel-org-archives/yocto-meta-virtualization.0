Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F82105F782
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 08:57:04 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11781.1773392219248138945
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=UPr9PsnW;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.22, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzYfs6aYH/4WOaR5441+T2RyhF81b0W28ZQ8e4bgveo1IbKesqBzsHtqz53X/ogBZdk3TrjWNoHJe9Vk2hksBnjbhtR8tDio5G+nT9iBZrASV9J53XR2TNCDqwSN2nc8Xz0a/TkCxCi3WnBiX0REH5IU8Mplg9iY03Cq2e6Fcwpti0WNXNWIZV/6oT+p5YUKFitSo+VFjma8N1ml66Ci9zeyVfdN2t9wceQG2q9lUFalBdwUC3IbFARtc8WB9NzVjGArW+1xPo9CeBh8MKENvQt+nIc+pvcGVNiOcnmj8QhgFYK1ZabvtZpgtw88LIyse/geBUcapKZCSwdDgI1J2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWuC45jYCz1M05fZVUKjp3EDqXoNikGIOk2l7+CzAj0=;
 b=YHg64OHIEEhTJ5pm87KlL+xnyizcDxpxC27DeMK3MtZDG/1R1uNAaP17AVDiFDesMUc94Xo4KfcXqxMIld97yEBxXO0jgo7vgC9geTLYmO+m6l36ifOb/cT90QMAbWU6Sj4ueWG4Y2KGXckJynAWuXw5NqOBn0cL9N6NKosV/iJnusbqWkbtfsavopkLAGuLD5snO4BRmI3aR/ruH7qao3Kr1pkscxNJKCP+E2CcV/jkWOm/+fheOs8fZqBmql9+U0mOaqobfI+p4pKvJQi4S1i+1z19cgohB0nHUqrf18sDKfa7hv95p0MVxnNTk086cp8xr+2xpn0v3UPEKzieMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWuC45jYCz1M05fZVUKjp3EDqXoNikGIOk2l7+CzAj0=;
 b=UPr9PsnWYX+rzmcOjrAHKWCXJpuAS7JqIFA5woxrXe+kqZgjsEq8GMV2Q6mrWjYPBL+C1+7PADBzgvSYrpWmYm+4HkzD2ZNIM01NqB0sSbADgkI5zRYMH39eYFI0gpLUtRGd2fsnkcaXI1QfQU+xlVh/DufE7fn1MJoe38ehZn95YaQhGkpwGsOWBLyzJ6OfVlGUlNAhbiIUTpKeyWBqatIJp6r9v2F6qJkuUbnb63ZavVFZDsOxcrOeAyHtAP2o+bUn5nHx6C8/hjwsWU9T/F7JluykdnyZzqEQLi722Psg3Bgm07ZIuX3uMZfWE+UB69PFb2SpK/UHsoYjvXcJKQ==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OSZPR01MB7115.jpnprd01.prod.outlook.com (2603:1096:604:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 08:56:51 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 08:56:42 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Question about podman load
Thread-Topic: Question about podman load
Thread-Index: AQHcssY3CU6irxnmBkCWBZUwMT3xGA==
Date: Fri, 13 Mar 2026 08:56:42 +0000
Message-ID: 
 <OS7PR01MB14444531B5782AB7319573E0E9B45A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-13T08:56:52.961Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OSZPR01MB7115:EE_
x-ms-office365-filtering-correlation-id: 2d17f98b-1986-4c6f-30d5-08de80de72bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|1580799027|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 adPMpHINSYUwo+aX699WaGPVdHQyrJiTup7sd3TBsUyBWYWGArCTOISGe9HjnrElc+8W+uJR3EOlE/X8meAVi9JEmzGFpkoN9UViWQx2u/tHI20ZBGosokA9gETk51Uwh1b+XVAVPPGbzqXaSAQ2kyd2OY84SDIQSTgtWpDA73muCmCmaAYAKgScoRLF+efQd6N7z1DwhUF0uJ1oFTxrwWzpDaQwgn2AHI3N6VXKCuU5ve6JD4vLU5PILk0w4sMAXm+8hvaO7TkqGogcQ0pG1NeA2qFyHjwSj+3KDYhZcYUsc8fZrzMKaa0MnhBMXetfWdWg5RnrL3gFXk6kQeoDTlWY+mcSflP/rGEVeYafT32U4UBoecf/c6R/J6rSBabH3Cf0O9mea/UbrbfDtTjh3efjsHuI4qbcJhlbyoLaf4zTqH1tifC1zMeq7HLHRgDjkxGftY8syne2xfiftP3ZxxHX81UDzdaYJedcmOUIOOXitUa7WC9N/ycguT1tVoviH453yN3fdg6Ve002ACvVMuxHSYqDkx7M2H7CXliQtO5g3jAsBY4B45c0LgKve/wLxrF/QXsLmi+S1886yS2XrWVmVltZEnycIITuotjBH578a6akvzgD3kWoarxHlVGHqA+0VBdm6NA4QQyC2U0Dz407UohNnZ6J6W2PJe5tL67TqJqZDwPF/IvsLRyeCoX1tYKA8gB+gyoam9rh+M48wxnW5tD0lA6EB1YZPrrm+rw6qYsaFZ81I5I2WiwfxoXqt9rnIy736RMvY7BFBRuM4plaQMJDykW9BXiN8DyT7dxdDo+pnujo9AaadbiUsrrG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(1580799027)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?M3U3ZmF4NTV6aXJuUGt1Y2FSQ3BYd2Z6dnFtVGZGMzFsUkpDTkx6WEJrWHkv?=
 =?gb2312?B?VHJhTyt3N2hrKzhDazlRQlZIODFsZnpUZFJxY1NnOEdNeGJWV3lWd0ZSS291?=
 =?gb2312?B?TlVYYXN0cmpZMUpFVGh3b0JFcWl0dll6OVVIWjM3akdVS3RXS3hyVHZzbW5m?=
 =?gb2312?B?V2VMRk90QUdaclBweWh5R1FhTTNnODhrTFUyL0VMa214YXU0RjNvOFZvRWdH?=
 =?gb2312?B?QUdLMFBScnpjREh5Qis2a2c3c3QySlhVTlZUbW95LzBvV1hTZ0RIVTJYNWVj?=
 =?gb2312?B?eHM4Z1JGcmFySlRiRHRiY1NvSlgzRGJwUEhjczlESzZCT1BWTzJPRXorVmVV?=
 =?gb2312?B?eWRmQ0srZk84Wm5pUC9TMlF1eldqZGpOS2tjaG44L3VDVTJFOXo4T0lwa1Bu?=
 =?gb2312?B?TDQxZlpZMysxNE9RcWcyTnlZdFdXQWlLUndrV1JWTThZVG1xbkE2ZGRpNTls?=
 =?gb2312?B?ckc0Nk1TYzhoUUcyYWN2UEJ4Uy9KNHFHd09oeUs0RXZmNlhYL1N4RXI2N3lU?=
 =?gb2312?B?NVZGQVc3OWNxamhPdTNDNXcrWWZ1WnlrUXBmbEl0TlZsYUIzNUdTQXhiQmZ0?=
 =?gb2312?B?VHAxK2daSmczbjRMdGt1Rk50TU1ISlRKT3Jma2VqRXdxdVF3bDJMVERWY1Zy?=
 =?gb2312?B?dzQva09LNXY1K2hPNTlTbnVNODNBbE1OY3hNakV2STQrRU0rbnIwdlhsVFpx?=
 =?gb2312?B?Sm9BQzR1aEY3SnVFcEJ0Y01YbmtNMjZza0ZXbGdYKzFFOG1vYzlaQ1lYTjNQ?=
 =?gb2312?B?UTB0NUlRMHZZU2dKTUtYRXRCbmQvTUNPdnIzYWQxQmExSkJVb1p6aGE3QlVP?=
 =?gb2312?B?bjJlRk9OUWsyeDVneTVXT29pdSs4dk9mVnZ2VDJpcXdaVnorbjJ3Y3lGa3l3?=
 =?gb2312?B?Y3lJSEp5bHZSSHZxODhVNG1aRDJmSGdUYjFxVUk0Tys0WmNhWk5ETkk5bXpj?=
 =?gb2312?B?ZEQ2ZTIvMzQwNExJZVBBejdLclNBSHlrM2JXN2FFd2QyNGNCSUZaek1RSm5s?=
 =?gb2312?B?cWRCR3BRdDFxTXMvcHpjSVZ5OENEcEZad21CU0tQS3RKdjNRNStLYkdkNzFS?=
 =?gb2312?B?blY3SFJ6OFIzeWFoaGF2cHpyZTd6OE5ZaXJibUVvRUZkSDl5OXN0RktZcEww?=
 =?gb2312?B?NmZpL2ljMXM3WEk1NCs2NFdvT05aTG9JMlh4ZE02eUtyR0ZtZlRqeEZObEU1?=
 =?gb2312?B?d0hVRE9LRE5wQVdnUnlMYWtpVDhycWcyWVFmTjFXZks2V2JiYWJlYTlOM3o5?=
 =?gb2312?B?MHNGUXJhOWtQZzhjSnlORjVsQ3dFZUZTdU9tUU5SNExZNVErWjVGQ3NxNDJ3?=
 =?gb2312?B?TnlBRXlBNWZJZElmSnBtdEtNZ05IYXYvTzJGRndSUFpyR0xvYzF6dTJhZXY3?=
 =?gb2312?B?QW84aUdNYUhKa1BQTDVNdTRTR09ndUZqTDl5cm9iZ3BtOEo4RmNPSDBRTXFm?=
 =?gb2312?B?cHRiSFVXUms2dDhHUnpQSzZEeno1V2FwS3R2a1JsMzJWT2VKTTh3a2NBNExX?=
 =?gb2312?B?T2xmNTU2dGNjY2lZNm5kNkZjZmVCcDFlenNzRWNIVlNNN2JEQmZIelBDRE5O?=
 =?gb2312?B?Y3RQMWZKVXloY25hbVBTL1VzbXdyYWN4QWNJUFB2bTF1WFo4YmxWcFM0WVZJ?=
 =?gb2312?B?WGhWOHV3RHBLUmJ1OExXV1pPVTJBc205UEVGMHJmWmpzaWhHMVgzVHNjSEVE?=
 =?gb2312?B?MHlnZTZ3Y1dBZTFOYUR1TktLTW1MS1hWaGFvRG5rK3Bya3FVZFhMeW9wME5p?=
 =?gb2312?B?MlRmYUl0U0p3K0NBM3NoaCs5blB0b0tyMmNWY28yMWRaSEM3K3gxYWlOZ3Nz?=
 =?gb2312?B?Z0lVZCtjTnRKV3A3UU9MbG1vME96Tjd6czAxSzNhdDZndTJWb2tIdUNYeE5k?=
 =?gb2312?B?UnQ4ejVxVFFmNi9WSHoyQ0ZwbHdTNFg2SHJkMmxUNy80emFvanhTMFhxYU1m?=
 =?gb2312?B?WTlkaktsUmRNR1pkRFpkSE5LT3AraWkwQ01RTjZDZitZWktOdGJJMFBLV0Zk?=
 =?gb2312?B?WE9YWGNnZ0lTMFRzVWROZXk5dUFDUFBhUE9JV01ybWErWWg5aXViOS9IRVd2?=
 =?gb2312?B?dnJQM2liQk4vaktBZVZpS0U4MWhJZXlVT0IvVjZwc2lJQ3RLVUsxZno0K3Jl?=
 =?gb2312?B?UmR0WldwSGtKM0cxbzVicWExZnJDblVTVVBFYVAwMG52TjdKWlhhMFdOTlp3?=
 =?gb2312?B?UjBaSGxPS29uM0dOQ2MrbUVTazQ3NFFGbGZ1eEJ1citlT1UzdG5EOXYrWkhi?=
 =?gb2312?B?ZU50N3FPekJib1dJUjIrSU9mYzJjcDlZeTMreWlnYnQwZmNaaE1UY0IzZ0dR?=
 =?gb2312?B?UUhRRGV0WEJVRHg4Mm1YNWZsRTc3aERMWFJSa3VWWVVIQ1BRNmRVQT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444531B5782AB7319573E0E9B45AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Mua0CVqR0GTR6PFVUu6n8356G+bUWxR3i03zPI380LnV0FOzDi9L50ewl8d37nlAg35icDfLAt9Cg6gTQnZjtiN96Ve9FmyWb4s8VbztPbaplt5+bgOi1UiGFTtV4kD7eepXOm4kHKPVo5jGXvqT0qCSlUaTRfwQeVZK5kv0taGuoH5uQD5Xzs5YUJo30asem22un3PlFthfvOvgdO859VHAQRlinzSDGF0z8P05zFAdCbvH9S6mnOWsnHE0VpJlaOTjYBfRw9WrNFwfn5YgBlpyUrCFlYfiIjuTmZmTKMd5wFirwEcSPYq3/5NQOBCd8JYP9xA7doiIys0HRJ8DzQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d17f98b-1986-4c6f-30d5-08de80de72bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:56:42.9020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Mi0FNo33woHV2vIt+nEkNH/YlFW1ZuqzLAV1e5zBF23g9SPvCi5dnFpeK/vsIepnVikAnh2wR3w2L+AyB7Y6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7115
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2026 08:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9652

--_000_OS7PR01MB14444531B5782AB7319573E0E9B45AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCiAgICBJIHRyeWVkIHRvIGxvYWQgaW1hZ2UgYnVpbGQgZnJvbSBtZXRhLXZpcnR1
YWxpemF0aW9uIGFzIGZvbGxvd2luZyBzdGVwcy4NCg0KICAxLg0KU2V0IE9DSV9JTUFHRV9UQUcg
dG8gYSBuZXcgdmFsdWUNCk9DSV9JTUFHRV9UQUcgPSAicmVwbzoyLjAiDQoNCiAgMi4NCkxvYWQg
dGhlIGltYWdlDQoNCiAgICAgICAgIyBwb2RtYW4gbG9hZCAtaSBjb250YWluZXItYmFzZS1yZXBv
XzIuMC1vY2kudGFyDQoNCiAgICAgICAgIyBwb2RtYW4gaW1hZ2VzDQogICAgICAgIGxvY2FsaG9z
dC9yZXBvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyLjAgICAgICAgICAwMzlkMzkyNTRj
MDQgIDE0IHllYXJzIGFnbyAgIDUuNTggTUINCg0KICAgIEkgZm91bmQgT0NJX0lNQUdFX1RBRyBj
YW4gc3BlY2lmeSB0aGUgaW1hZ2UucmVmLm5hbWUgZm9yIG9jaSBpbWFnZSBhbmQgbG9hZGVkIGJ5
IHBvZG1hbiwNCiAgICBpdCB3aWxsIGhhdmUgYSBmb3JtYXQgbGlrZSAgbG9jYWxob3N0L3JlcG86
IDIuMC4NCg0KICAgIE15IHF1ZXN0aW9uIGlzIHRoYXQgaG93IHRvIHNwZWNpZnkgdGhlIFJFUE9T
SVRPUlkgImxvY2FsaG9zdCIgdG8gYW5vdGhlciBuYW1lPw0KICAgIEZvciBleGFtcGxlDQogICAg
ICAgICMgcG9kbWFuIGltYWdlcw0KICAgICAgICBidWlsZG1hY2hpbmUvcmVwbyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMi4wICAgICAgICAgMDM5ZDM5MjU0YzA0ICAxNCB5ZWFycyBhZ28g
ICA1LjU4IE1CDQoNCg0KTGl1DQo=

--_000_OS7PR01MB14444531B5782AB7319573E0E9B45AOS7PR01MB14444jp_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Bruce</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; I tryed to load image build from meta-virtualization as follo=
wing steps.</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">Set OCI_IMAGE_TAG to a =
new value</div>
<div role=3D"presentation" class=3D"elementToProof">OCI_IMAGE_TAG&nbsp;=3D =
&quot;repo:2.0&quot;</div>
<div role=3D"presentation" class=3D"elementToProof"><br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">Load the image</div>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; # podman load -i container-base-repo_2.0-oci.ta=
r</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; # podman images</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;localhost/repo &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.0 =
&nbsp; &nbsp; &nbsp; &nbsp; 039d39254c04 &nbsp;14 years ago &nbsp; 5.58 MB<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; I found OCI_IMAGE_TAG can specify the image.ref.name&nbsp;for=
 oci image and loaded by podman,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; it will have a format like &nbsp;localhost/repo: 2.0.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; My question is that how to specify the REPOSITORY &quot;local=
host&quot; to another name?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; For example</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; # podman images</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; buildmachine/repo &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.0 &n=
bsp; &nbsp; &nbsp; &nbsp; 039d39254c04 &nbsp;14 years ago &nbsp; 5.58 MB</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Liu</div>
</body>
</html>

--_000_OS7PR01MB14444531B5782AB7319573E0E9B45AOS7PR01MB14444jp_--


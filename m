Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C54C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 19:37:03 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4648.1785267413634881336
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 12:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hvtP44+U;
 spf=pass (domain: siemens.com, ip: 52.101.66.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yg5Kvh2pk858GiiLMyMX14W+pSxA/ZhlSznabsgMn40CeUVXqF0UyqHkLUoVTBlEKXactDuuQALnX/LDh+ZFnrPOJ4DnnvlifkmmptgE9/vf5gSE+CaZZyXXjds+zpXrCP/mQjjOnRmWD92C6o40Rze374hAC4ohj5AofLooP+iMIZeH8OD819jm08R1fNf33vLHuNn4WM8XtBff1AvI4ygUiU57GAuQ6sh9qN2gW8mAD1g75zSmo58rV8WkOXHo8XtJA25k3y6lGBX4ScYpClue3PHoohSMTj6gl654XDKgRdJ6Usn4MvOYIGb1DyZIJZSi0E2+3DJkRg//dJ26JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uU+FojAAmpiHhC8jW2GJQFXLMo89BBxCAjPxqFS8ms=;
 b=XnI8E+6Sfl5VPoxeiRflES0LtJQrch3enuoRMWKhC/SMkDQQFFjLcofS2EdnwhxQ3x2NN5uhmHJuFJeTQlFUSlrR3SFiwAwSxG9hErQc4iaOb5Dt3oYAhroe7Y/6yVmqIwqM/dQOAzjKA75t6prxuOUQQIkkGfQgLukcjFWPZsQ0U5uQFhoNwHF1mQL1SJk5+vAyWfTEs7amP0ktGJ7d3d0rpC/YVBDocdiqBrOd3SUFckXxhPmNV86t9LBAOlBGlnnumdQhEsGD2RZZXV/K+g5Q4sfGHOD2TByZ+Xr1EFm7bQCYnrhJt+PaKUskj/DKoDIhmVyTkJ56t5cULf/1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uU+FojAAmpiHhC8jW2GJQFXLMo89BBxCAjPxqFS8ms=;
 b=hvtP44+UykMsmuNi2Ci6Zh2wSmMKUrEVQ8RP4/hI/usfqo0ufG5FwedgLycSMYeSOs8QvOaO7hWPuSCamhONieWu3nIdq/KVn+LpdDPtJPIW53mTUlC9qmMLIDomWPPQm8BKXKIRawZlnSTo7xcJjfDTDxiEoN7GiDpcttfQQ2b9/hbJDaKGAP4v9S2uUo9pmUrFa3enMeO3ZxBaI27TcfaQMYbsolpxlRyBuP1vhDSzaF4yg6iURz38PQXmqtqvVbCVkHKGgOhCiERfbQplPhCbNyBsFn8SJ2zRT4E0xm4ZIXsjsOyfcwm2KPvdglVYVQp280JdBsIYlXX1AUXtyA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AM0PR10MB3684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 19:36:50 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:36:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][wrynose][PATCH] crun: set status for
 CVE-2025-24965
Thread-Topic: [meta-virtualization][wrynose][PATCH] crun: set status for
 CVE-2025-24965
Thread-Index: AQHdF8AjqL1m9NmKdUexbmAlqvsDT7aDUTfwgAALtICAAANVYA==
Date: Tue, 28 Jul 2026 19:36:49 +0000
Message-ID: 
 <AS8PR10MB507360A09481289B6190BB7FFDCB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <18C3CBFF4B8615C4.1217577@lists.yoctoproject.org>
 <AM9PR10MB508230EAF658EC9F54AE9E5DFDCB2@AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM>
 <CADkTA4P952ony90eA8geWYSeG9uK8Q5gshXk1oO6B_dUCQhYew@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P952ony90eA8geWYSeG9uK8Q5gshXk1oO6B_dUCQhYew@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a4dfbc02-dcc6-4306-ba9a-7a8d785e90af;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-28T19:32:50Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AM0PR10MB3684:EE_
x-ms-office365-filtering-correlation-id: 2af17e5e-bccf-477b-8b94-08deecdf9144
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 JrAadv4okD3Mv6ovTi/uoiobJOOZdDfcxoE22BUB1elrm9COypCvzRnyP8Z2kUeXgDt5RZDsIcYqvCbeIoRvxNo/kuS9qF7VdqATmU6cUnMRH05+nOCQ0vJxRLI3tBYiUjxR7wjl+2om7FSBlmB8jDcvpIXTuWCOBrZ6JFVc7uyqEGmG6KZet58LfslXNTlCjmVoi8pAFsd4pn3K3Gt9+q1y/l3e+gn7PffE1O+dULLWd8knLsGubQ8AJQjp05s5l56/319kjy56qH09Efqyo8rFLnU1RtcoeQaP646Va1CbCcepLYGSPl+kdu/offLo8VsPlKimQxGW0wMtWelZJDZ2kkh4rxBweCrogcCH4gH2N3JVlO8dRDAzJ5Uh4C7pChm3ca7CNrwfD6CxbqghmN+iMfUB2+zneJ447g5UHCH/c03XPZuijGJHdR5T+eEkATKo+866i03GCfelAOkmYZiwdHvcLuA2+GBkygsTAWH7FdbdoM3v+pA8yfzcygCG54ftaj5imyb8i0BQYv6UrD37Y3BLSJyjUFknq7M+Spn6LrmJgciTnwsFnY5R1/aO0B7f/Dil3RNpre302gs+cT/SRkvRmd+oOA9N6YS/W7OXkbbq2XP2xzOY4GDMTwuYSbynHziTr5OFLQpos34ZxNss0D1IhTQ5pz/ud8t2G9Mjq42XkDDvVqCQoxuPTk8a6gzGmowuS4i/GkfzxTSyh3zivXd+bla09/+FQ4N7ols=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SmMvUTBnaVZYVnlnclAxZFJLVEJ2clUxckFBQ0hWV0t3YkNSSGM2U0ZQQ3RF?=
 =?utf-8?B?b0RDN1NGOWsvMmcrNkZHR2M3UWI0R0RNdGRwL3JjSUhRZ2k2TjJXQXVXbysx?=
 =?utf-8?B?RDhld1A5QWQ2dk0vVUVTbXhSamRJRUZQZEZVQjZ2V2dkYXQ0MWIwZVNMNVgv?=
 =?utf-8?B?VVM0Wkp1cnV0NDU0WnpxbHZKamFyMnZWTkJCVXdjc0twdkxFQi9nSEczRVRy?=
 =?utf-8?B?L2c1YXZkN3RVSVZPc2NRWWVNa2JYdTEySVBIUGhxSEw5djNMQ3BVR2FSUHA3?=
 =?utf-8?B?R0sxVGpFRTBQb1BhRGo5SEkyeE9jUW5wSTJ6NHRWdTY5NmN0QjFJNjBjeWVT?=
 =?utf-8?B?dzFaSDE0VjRBcUZWMzFzUkJIaysrWGt1bHlwbnlYMVREU1h3azVMQm9RZ2tm?=
 =?utf-8?B?VHQyK2FFbHI5d0Zqa2w4akRNbU44dnptYTEwZ1ZpcDMvMjVTNHFtWVNCeHlK?=
 =?utf-8?B?QW9tODFlT1BrcmxJd1R6MTk1YzJiR0NiRVJ6aS9uZVo3YzkvRDZuaE1sbGcv?=
 =?utf-8?B?UUw1RFArSUxmK0dZNWxHTEd6dEl6TUJpYjdQRU9yYnBlV0ZpMGZYTng5aDZK?=
 =?utf-8?B?U1JaWTVMeTBtd0hDMmVrV3R1UlV2ZkRqZG96TEhDbmVCaFdhYzJKK1dsOVRH?=
 =?utf-8?B?Y0VrUG81dXJYbTNTTDcrMDA5YnRBbUNwYzUrZUpKamZnM3B0VGpVMVRQc0xr?=
 =?utf-8?B?Z0o1a1Z3MWFWcHhtdy9FZTh1U2ZKbG5ud3pvUVR4WmIvV1F0bmpnbW5rQlQx?=
 =?utf-8?B?MmF4QlJRVm9TY0c5VHpQSWsyejFPM0E3aU5rVFNCM1lmZThRVXZIWmx2RGtE?=
 =?utf-8?B?MnJMSVdpWHBYNGVOdkg2elFmdWxBZnBPS05EYkl5Vy9hNCtiRTlHZzZ3cktE?=
 =?utf-8?B?UFVlMmg4WkVUaUYrbTY4Q0JKKzl5UVBoYklKa2w2NGFzSjB6K1dobk5VZCtT?=
 =?utf-8?B?UHBZM1NtR2Qyc0JGWmYwRnpxK0xySnpyMWt4TjQrbUxXbGFVbENMMXRiSnAx?=
 =?utf-8?B?OTdLRlJoTVZGQVhYUFZ3TnFFNmNSc3VlaVBYRWZPWC8zbkZFRm9NU1pOU2dl?=
 =?utf-8?B?cEl0MGoveWpZR282T0dxK0RrWnRMZU9jVU5zN0xiVnlkZFZmOER2dU1hNEJT?=
 =?utf-8?B?NGpxRlJWWjZaZm9BaFpidkMwSTN0R2xDNVIxcUp0UE45NkZxVVExU1BkOWtS?=
 =?utf-8?B?cTNJK1BNcWNjZzRHdkhReDZDd1pqVjUrUnB3K2xYb29idmx4U01PdHVJQVRR?=
 =?utf-8?B?SXp3WVp6REFDbjVabGx4WHhpQTVMdlB1NW42SzlWMGplTmMxa0ZrSm1EMDdT?=
 =?utf-8?B?cERYNlB2UG9rU2JSNVdDd1ZzcTZtUWxSRzBuN0RScThlOE9rOUNqUmlraFov?=
 =?utf-8?B?NkNybmFURkpINk1mQnQrQWlRd1ZqZVJXUjBvYlNKd0pyc2NsdzQrOVpMdHN3?=
 =?utf-8?B?QklSbGI0OFJsNHJtQmZleVVkaGRPWngrRGFwN2x6UkI2dUpuK1A1VGxWdEZM?=
 =?utf-8?B?SHNsbTM4am1RZnRzUW5hdWV2TEdpM1V4TG55T3VoWk9qcEhoVWxnUmlsYVdW?=
 =?utf-8?B?dCtMeDE3QlVWNXpOUHFNVDUxSGZUdFYxVzV6Y2hjL0hVWVNFMDdHSTNTdEVP?=
 =?utf-8?B?K24ySFkxS3RUbGJWb0xlNUEwUmEwMnYvckI4RDB5SEpldGxOdHFnVHkzVUZ3?=
 =?utf-8?B?cEZVUkVmSS9YR0RXSWJXNFR5U0Z2dm1HNUlZMml1M2RuM3pTVm5RemxwcnFP?=
 =?utf-8?B?V3o5dEJBMnRTalVFZldMbzBiNUdrcldLMDc0R1Rzc0N0MVVCalBEV2tiNGVC?=
 =?utf-8?B?blR4MGNValhJQjU3NGcrejA0cHo5dlFLVnR4MGxISHkvRzJSbWR3ZUwvM0Mw?=
 =?utf-8?B?QitlMm9TeisxMG5aWmdMWDFpU3gyb3JDSjRkUlhwYkw4NzdYUXFURjREOGla?=
 =?utf-8?B?QStvN3JtbjVvMk92Qi85Zmt1SUlGOVRpVVlFNVBmaWJoY1lCMkQ2VHlESE9D?=
 =?utf-8?B?ZnFlQUtuVUJ2WHZvT1puWUtPLzV5bWtrMm92RnpNTEtYNEhsS0c2S1Z3ZkFj?=
 =?utf-8?B?VS92ZVVRVjhlL0lZMmVncVBJNXJONWVWeXNLREMyd2l5ZFc5YWYxZGFMcCt5?=
 =?utf-8?B?UkNub3pTMHlUSjFWTk5ZK0h1aDAyQm94QTdoVEdzUW9zZEFmZmVVSmoya1Uz?=
 =?utf-8?B?VjlxLzNYa1ZvUmMyanBoY0taVVR0MTloSEFsdk0vRlU3aEpQNllOb09keUdX?=
 =?utf-8?B?VXJmSFp4ZmdVS0tKQ0Y4N3RucW1QaFFNMDU2YzhzVTBmSkVicXlKNVppTUxI?=
 =?utf-8?Q?CE811MJmFxWj/C+sxe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af17e5e-bccf-477b-8b94-08deecdf9144
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 19:36:49.2201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qit/naLgEkTvdTzX/ejVZYlDNfyTYSV6bT/5SRM+2NbN8c1jy69uevjMbubehWpWg4xWRfx9KRQ4cBJryT6hZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3684
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 19:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10011

U2hvdWxkIGJlIHRoaXMgb25lIC0gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0
YS12aXJ0dWFsaXphdGlvbi9tZXNzYWdlLzk5NTgNCk5vdyByZXNlbnQgdW5kZXIgLSBodHRwczov
L2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL21lc3NhZ2UvMTAw
MTANCg0KUGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFz
aGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+IA0KU2VudDogVHVlc2RheSwgSnVseSAy
OCwgMjAyNiA5OjIxIFBNDQpUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRl
ci5NYXJrb0BzaWVtZW5zLmNvbT4NCkNjOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bd3J5bm9zZV1b
UEFUQ0hdIGNydW46IHNldCBzdGF0dXMgZm9yIENWRS0yMDI1LTI0OTY1DQoNCkkgaGF2ZSBubyBy
ZWNvcmQgb2YgdGhlIG9yaWdpbmFsIGVtYWlsLg0KDQpDYW4geW91IHJlc2VuZCA/DQoNCkJydWNl
DQoNCk9uIFR1ZSwgSnVsIDI4LCAyMDI2IGF0IDI6NDDigK9QTSBNYXJrbywgUGV0ZXIgPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPiB3cm90ZToNCj4NCj4gR2VudGxlIHBpbmcuDQo+DQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgTWFya28gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj4gU2VudDogU3VuZGF5LCBKdWx5IDE5LCAyMDI2IDEwOjQ5IFBNDQo+IFRvOiBtZXRhLXZpcnR1
YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gQ2M6IE1hcmtvLCBQZXRlciAoRlQg
RCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IFN1YmplY3Q6IFttZXRh
LXZpcnR1YWxpemF0aW9uXVt3cnlub3NlXVtQQVRDSF0gY3J1bjogc2V0IHN0YXR1cyBmb3IgQ1ZF
LTIwMjUtMjQ5NjUNCj4NCj4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMu
Y29tPg0KPg0KPiBUaGlzIENWRSB3YXMgZml4ZWQgaW4gdjEuMjAuDQo+IFRoaXMgaXMgbWVudGlv
bmUgaW4gTlZEIHJlcG9ydCBkZXNjcmlwdGlvbiBbMV0gYW5kIGdpdGh1YiBhZHZpc29yeSBbMl0u
DQo+IEV4cGxpY2l0bHkgc2V0IENWRV9TVEFUVVMgYmVjYXVzZSBjdmUtY2hlY2sgc3RpbGwgcmVw
b3J0cyBpdCBhcyBvcGVuLg0KPg0KPiBbMV0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh
aWwvQ1ZFLTIwMjUtMjQ5NjUNCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2Ny
dW4vc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNBLWY0MmctcjVqai1xaDRqDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gLS0tDQo+ICBy
ZWNpcGVzLWNvbnRhaW5lcnMvY3J1bi9jcnVuX2dpdC5iYiB8IDIgKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVy
cy9jcnVuL2NydW5fZ2l0LmJiIGIvcmVjaXBlcy1jb250YWluZXJzL2NydW4vY3J1bl9naXQuYmIN
Cj4gaW5kZXggZDJmN2I2M2IuLmVhMTRlOGVjIDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWNvbnRh
aW5lcnMvY3J1bi9jcnVuX2dpdC5iYg0KPiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvY3J1bi9j
cnVuX2dpdC5iYg0KPiBAQCAtNjcsMyArNjcsNSBAQCBSQ09ORkxJQ1RTOiR7UE59ID0gIiR7QCdy
dW5jJyBpZiBkLmdldFZhcignQ1JVTl9BU19SVU5DJykgZWxzZSAnJ30iDQo+ICBSRVFVSVJFRF9E
SVNUUk9fRkVBVFVSRVM6Y2xhc3MtbmF0aXZlID89ICIiDQo+ICBERVBFTkRTOmNsYXNzLW5hdGl2
ZSArPSAieWFqbCBsaWJjYXAgZ28tbWQybWFuIG00IGxpYnNlY2NvbXAiDQo+ICBCQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSINCj4gKw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNS0yNDk2NV0gPSAiZml4
ZWQtdmVyc2lvbjogRml4ZWQgc2luY2UgMS4yMCINCg0KDQoNCi0tIA0KLSBUaG91IHNoYWx0IG5v
dCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0DQp0
aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBU
cmVrIElJDQo=


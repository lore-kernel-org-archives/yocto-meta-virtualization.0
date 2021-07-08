Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.6916.1625712526896364328
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 19:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KyExki8M;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A7C5C38C0882
	for <meta-virtualization@yoctoproject.org>; Thu,  8 Jul 2021 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1625712526; x=1657248526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K6rNTCtLvwVrzB7J1hOPFbmH9Aiu9ibEsj+cwcWA5GQ=;
  b=KyExki8MzrMcuNXE5glTnALrWm0FykLWf1ZhQaf00EB/+V+Es7Gyr8kn
   8Vc0EvrDCCMRhBzlh/49D3vF/7yw6g2Srhd1POHt1R7KpsLbNYcd1EruX
   WM5i4a5ouMtHZd0t2qLqczgh68OLX9eIgR/RLPEZ77vFtSyVoabpAWE4F
   8kIaTiB+EWr1v3B0EEWyUJ5lNuMv4vgIm2SxoIPjFEXWfUOuBe7Xgrmul
   9lncRpBd5zkk4rRo7sQiejVeAcjqcdrngrZ+K9R4sMiNoUf9Vj5iokhl5
   I461MNJJppwC9vXd2jqOnPPNV0t+/SRgMQilcrbBZdvvUQJqpUgIe4W4X
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="34598080"
X-IronPort-AV: E=Sophos;i="5.84,222,1620658800"; 
   d="scan'208";a="34598080"
Received: from mail-hk2apc01lp2055.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 11:48:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZf9OPjCZe+iminnAw2P5OyzqupbyTEL8ymw5Mfe72Ad5wpUIvSQnn8f69RY9lE3m+Fo2j1NjFQ6XZNPcSusNvJ4uooJYs+gS5pNIpn7B6j+SKCqNiihlGQe1BDqejAWO1UQMiBY5z5mhz7bWZpICEQdE3shb59LSYRDGCnERF5CBAPqamD/vrM8Jsv8o0JYwlskMknXDs0TwM4z6QTTIXZoWMO4/O3IH+gdaoM2Vh8AFA+xLxgc6mEKUsEt+V1RbWehuOrbmS855Uon2c+Zv14MeARDM0GqAslH1gzWyJ432VmbZx+5v4VBHwmqgcFh2DmCcDK5LPjJuOhUnlC4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6rNTCtLvwVrzB7J1hOPFbmH9Aiu9ibEsj+cwcWA5GQ=;
 b=Emi1cAhra5/DZ6tWaIJMxfoem/oJAwdTgFr3MHCLV4CQ6RPX85aPzBYfgbqXgXFoEuNrV88EThikkUeddnXyzte7qpE6oP76CyPX1B/vBtbFbbxY71vxxs13hQsjV1BpubdxzykVQJtgOlkwThuWyhMs52jJEeb9WSFz6PPKLQ9GVVC3vV13aL05rC5Z4mmEluRdtKiVopmn+lglIEnMyc1hqKOBnjBn/cYSXAHK0a3yG8NQT7RBy8hg7XDa8REWwXEwa2/8NEZHJ+uOsPJNDcpkreWhqOHfHi5pZN1PQwYROp6QCPlMQ80b1zZXzD+7yCZwWivkVy184Aj2TQfwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6rNTCtLvwVrzB7J1hOPFbmH9Aiu9ibEsj+cwcWA5GQ=;
 b=mCG5NZcCy4K6tAjpIg+2BzM/ksA5Mc4sAcHB6Kj13Btm3GHXqQMNux4dEKb+SdkQRR2AshXr9qMFsj050Ty0XJYMhO3w3zWMAJKqvoGSLLPX/zmZvFaqtKgK4DQhHq/yW51uWGxJ4at+bZeeLkuj+8ec9B1TI5p/mZ54sjlvtnw=
Received: from TYCPR01MB5792.jpnprd01.prod.outlook.com (2603:1096:400:45::9)
 by TY2PR01MB4763.jpnprd01.prod.outlook.com (2603:1096:404:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 02:48:39 +0000
Received: from TYCPR01MB5792.jpnprd01.prod.outlook.com
 ([fe80::d8de:c80f:670c:5a8e]) by TYCPR01MB5792.jpnprd01.prod.outlook.com
 ([fe80::d8de:c80f:670c:5a8e%3]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 02:48:39 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH] criu: skip QA checks textrel
Thread-Topic: [meta-virtualization] [PATCH] criu: skip QA checks textrel
Thread-Index: AQHXc2hk+kVgdcoLrkie5OEujqH89qs4XeSw
Date: Thu, 8 Jul 2021 02:48:38 +0000
Message-ID: 
 <TYCPR01MB5792CE203141A0CA10FB0B4CF5199@TYCPR01MB5792.jpnprd01.prod.outlook.com>
References: <1625638084-8262-1-git-send-email-zangrc.fnst@fujitsu.com>
 <20210707194334.GC55535@gmail.com>
In-Reply-To: <20210707194334.GC55535@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d43ff6d0-355b-4b37-4606-08d941bae3c2
x-ms-traffictypediagnostic: TY2PR01MB4763:
x-microsoft-antispam-prvs: 
 <TY2PR01MB47637F719886DB19663085F3F5199@TY2PR01MB4763.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:198;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UO8FaeIvYQXyIs2BpivgW0abXnXM+2/dCK5dOthvZBqYTy7LuMw7IqSbNA2SH3fVMOE/78oj6WpAJcPrZzo1/En0KS1MbnsfDyBmOwicbFSnbOjirXjP4B6/CXeLny6b/+vTtvHmgaNGL8RXF/EFfohBjVAYQufadZcTFif/0vq6FBrgIYlTgZMVpfXbUu52rrs+1v4jRdPuCrlMugzqYHnmcGd15uirQkW5HbwhdLTPFQBebVU1gIbMSXnzd8wfWFrF8/MBJUBOFnb1z5UX2f6G/+0xOhuNRNiE/SjURDfCc6mLTgbYLYzqrLkBC7JKArAVXPMmBbHMXCWuyH4ElaxB1gMVKWI2E6Xhpb9IXMST+pv4FI3KJDJUzOBvAZCAS+HO9dxpMa0GPSSSXlg8cxAf+B8tNN/rHHqvqkP10vnWNcP6fJ/gvQY0Jj8I1E5zJon8Sb3d5Ay7YTX0CHgEfe5YvFY9l//qzQi7dGLE0/ejv9yG6M6KnVG2CG1aA2VNZCdmvf/q5H8No5DlWNdC+c8L41to7Sc0zQ6f7Mur5QejK/XMNG78/rwEIX0JvhLwYaJMS72z8gCwuwB58kNMnUhX/TtExqinnN1vM4UX303l41KMNr8xx5Qp2WEhIVrW+W/KMr4d5K3evy9I5oq858bC88rq5KDVG+men/00MTgY2u/mIOhAXOoYo5JWLpCvda4MTA2OOtag7W58m2QirZNOJRydi1UR7igHWY/3PAI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5792.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(53546011)(33656002)(6506007)(85182001)(4326008)(71200400001)(9686003)(6916009)(2906002)(52536014)(8936002)(8676002)(26005)(66946007)(7696005)(55016002)(122000001)(86362001)(76116006)(5660300002)(316002)(66476007)(38100700002)(83380400001)(66556008)(186003)(66446008)(966005)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?TWN2Qi8weG41cys2Q3QwclJYQkdDeTRRYm4rOUJlUW5TQ3l2NmNzQVZiQVhQ?=
 =?gb2312?B?a3JLaGViTFlsWnptT3dLTVJISWRJMVZDUnhSMEZ3SitjM2Nvak1zbmgvU3Q4?=
 =?gb2312?B?eUY4dUFhUVlESWgrUExKN0lQM2xKMmRUYStDYW9TdXlVSmhBUzFYQkVSTkw5?=
 =?gb2312?B?MCsyUTZyLzlMNVlUdTlLc2w5T1J1SG0wZ3NBMnJNTWYxbXZidTZhTkxNTUxi?=
 =?gb2312?B?L2FMVTdvelYxTVQ3OWplOXFyQ011NzVRcGpDL3VLelk1MVAvWGtaY2trTFJK?=
 =?gb2312?B?WldEbUNDcEkwUlB6TERaS0c5YTVMU3JITjd0T3o4L1A3dUg4K0xLdzFNZzNh?=
 =?gb2312?B?NzJEN1o0cWJOSzdkU0NYdnkrQkhoNjkzODJIaEoxRllpQjJ0aHFYd3h2YmtM?=
 =?gb2312?B?SnhLbk0ya0xsQXA3QmgyS0RMR0E1STc0Y1ZnWGpkak43TFRpTmMwS1g3djlB?=
 =?gb2312?B?SFd3OC9JZjU1TldQeWFEQUFMb3AyaThiTUhsUzg5NFNZUWJ5bXZKVFZQeEFS?=
 =?gb2312?B?OGNFNU00ck9ZZzlJbTNkTTJDcXFHaE1FU0I5b2Y0UHo1aC9zM3h2Z3E1OFVB?=
 =?gb2312?B?Y1MvZ0doUHh4cEJuSFAvUnpWY2lEMnBwcWd2UUkwelFDeFR2b3pUeDRkblVU?=
 =?gb2312?B?bWNnSzg4N21TT2xhSjBRd1NEeFp3ajBsUnd1Wkl5eW91UTFkRUNMTFpTb1Iz?=
 =?gb2312?B?UWJLM1ExcWRQTTNWWXlScGpkcUpjSUJNd1RkSkRYQi9VMnZUTEdOdVBkQysv?=
 =?gb2312?B?K09rTHlDSm9PKzFHcklGQ2ZJaVgvaitYdDA0T2Y4TUN1b0ZTY3JVQ1pVK3pE?=
 =?gb2312?B?ZFVzMHJsWm0zQlh0M0pGUSt5d0NvT2YwUXA2cC8yZWgwRmVOckllYnB5TGJ1?=
 =?gb2312?B?aTc0aVdMRkZ5SlNaaDVYeVBtTjF5bHRWSGt0QVkxVWRmcExXNElzdmc3VVpO?=
 =?gb2312?B?UE83Q0tPVFBTUXBNcGFYamRrQUsrSVVqcnBzUHhNMmdsM0tuRkYrU082WEJG?=
 =?gb2312?B?TE1GWkJuV1ExYXdPWmtSZTVHa0dVQXFCdm1mZ2V0eVZyS2lGUkdFZWNvWkI4?=
 =?gb2312?B?SzJ1aWN1RkZhbi95Qk1DZCtta0VsbUNmSFY3SGVDMXRjbVpjcWdOQzhHM2cz?=
 =?gb2312?B?cEFvV3hiVmZoa21KUlVGQ0dNeFZtZ2VhUGpKWXBWMzN2VkZiekJSODB2NTBT?=
 =?gb2312?B?dVo1TUhlT2RkdlJCOUcwd2lSdzVVb1o1SjJ2VXc5N3NzZExYb0JoMU9rQjUy?=
 =?gb2312?B?bHh1Qis2aml4K0xtay8vRmpjMlhzTTdPUnBVY3lMOTlUVEFTY01jeVVNZG93?=
 =?gb2312?B?TWFaczU2R1lMcUNoSjdIWW5BbU93OUNmSEdXMDBKWm9OSlE0UmJOZmI2OUVQ?=
 =?gb2312?B?dHgzdWI5S3crKy9tUWpDYzZqT2JMa1N1NXhrN1VoclJTNnhOc2ZFREVzTXdB?=
 =?gb2312?B?bTF6a2draUx4ZWVCa0JTRHFkQU5xRXVtSm41SHBZOTNvMVB3bS8zN1hSaEox?=
 =?gb2312?B?QXBFSkNNWXNlYUZKUUNHOW1QMUZQc0lvRS9JOThmM0N1UlJKM1ArZmVkbnF6?=
 =?gb2312?B?aE5aTE1GV05lZmkvN1pzWUVSVVNhS1hJcTdrMWdSLzFlcGNreHFWM1Z2YXhS?=
 =?gb2312?B?Wnpac2xCckNsbTN2WVhSMHdnOGFWUEZLYUJTWE1ySDNWeno2SEphMG5UWEVE?=
 =?gb2312?B?RnJwcGhDZ0wvTGtzODkvOTNMMlVvS3FDTkIvT3RIS0VsVzZxendyWExBVit4?=
 =?gb2312?Q?OvI7EegWm8+PjSMT7c=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5792.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43ff6d0-355b-4b37-4606-08d941bae3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 02:48:39.0139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2WiFOetkjk9Y1D57EuaAqywu0su2ydoPiq7HqvPmKs2UuCQkSR50vTzUf+z1QCThn+Nl7TTnftm2DFmk6jnLyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4763
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhpcyB3YXJuaW5nIGFsd2F5cyBleGlzdHMuIEkgdGhpbmsgaXQgaXMgY2F1c2VkIGJ5IG5vdCBl
bmFibGluZyBwaWUgb24gQVJNIHBsYXRmb3JtLg0KDQojIEZvciBzaW1wbGljaXR5IC0gY29tcGls
ZSBjb2RlIGluIEFybSBtb2RlIHdpdGhvdXQgaW50ZXJ3b3JrLg0KIyBXZSBjb3VsZCBjaG9vc2Ug
VGh1bWIgbW9kZSBhcyBkZWZhdWx0IGluc3RlYWQgLSBidXQgYSBkaXJ0eQ0KIyBleHBlcmltZW50
IHNob3dzIHRoYXQgd2l0aCA5MEtiIFBJRXMgVGh1bWIgY29kZSBkb2Vzbid0IHNhdmUNCiMgZXZl
biBvbmUgcGFnZS4gU28sIGxldCdzIHN0aWNrIHNvIGZhciB0byBBcm0gbW9kZSBhcyBpdCdzIG1v
cmUNCiMgdW5pdmVyc2FsIGFyb3VuZCBhbGwgZGlmZmVyZW50IEFybSB2YXJpYXRpb25zLCB1bnRp
bCBzb21lb25lDQojIHdpbGwgZmluZCBhbnkgdXNlIGZvciBUaHVtYiBtb2RlLiAtZGltYQ0KDQpa
YW5nIFJ1b2NoZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVj
ZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
SnVseSA4LCAyMDIxIDM6NDQgQU0NCj4gVG86IFphbmcsIFJ1b2NoZW4v6rAgyPSzviA8emFuZ3Jj
LmZuc3RAZnVqaXRzdS5jb20+DQo+IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbUEFUQ0hdIGNyaXU6
IHNraXAgUUEgY2hlY2tzIHRleHRyZWwNCj4gDQo+IFdlcmUgdGhlc2Ugd2FybmluZ3MgYWx3YXlz
IHRoZXJlID8gb3IgaGFzIGl0IGJlZW4gc29tZXRoaW5nIGludHJvZHVjZWQgYnkNCj4gcmVjZW50
IHVwcmV2cyBvZiBjcnVpID8NCj4gDQo+IEJydWNlDQo+IA0KPiANCj4gSW4gbWVzc2FnZTogW21l
dGEtdmlydHVhbGl6YXRpb25dIFtQQVRDSF0gY3JpdTogc2tpcCBRQSBjaGVja3MgdGV4dHJlbCBv
bg0KPiAwNy8wNy8yMDIxIHphbmdyYyB3cm90ZToNCj4gDQo+ID4gV0FSTklORzogY3JpdS0zLjE0
K2dpdEFVVE9JTkMrZTQ5Y2U1MTNjOC1yMCBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZToNCj4gPiBj
cml1OiBFTEYgYmluYXJ5IC91c3Ivc2Jpbi9jcml1IGhhcyByZWxvY2F0aW9ucyBpbiAudGV4dCBb
dGV4dHJlbF0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFphbmcgUnVvY2hlbiA8emFuZ3JjLmZu
c3RAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIHJlY2lwZXMtY29udGFpbmVycy9jcml1L2Ny
aXVfZ2l0LmJiIHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2NyaXUvY3JpdV9naXQuYmIN
Cj4gPiBiL3JlY2lwZXMtY29udGFpbmVycy9jcml1L2NyaXVfZ2l0LmJiDQo+ID4gaW5kZXggZmVi
ZjgxZS4uNjM0MjYyMCAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvY3JpdS9j
cml1X2dpdC5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jcml1L2NyaXVfZ2l0LmJi
DQo+ID4gQEAgLTIyLDYgKzIyLDggQEAgU1JDX1VSSSA9DQo+ICJnaXQ6Ly9naXRodWIuY29tL2No
ZWNrcG9pbnQtcmVzdG9yZS9jcml1LmdpdDticmFuY2g9Y3JpdS1kZXYgXA0KPiA+ICAgICAgICAg
ICAgIGZpbGU6Ly9saWItTWFrZWZpbGUtb3ZlcndyaXRlLWluc3RhbGwtbGliLXRvLWFsbG93LW11
bHRpYXJjLnBhdGNoDQo+IFwNCj4gPiAgICAgICAgICAgICINCj4gPg0KPiA+ICtJTlNBTkVfU0tJ
UF8ke1BOfSArPSAidGV4dHJlbCINCj4gPiArDQo+ID4gIENPTVBBVElCTEVfSE9TVCA9ICIoeDg2
XzY0fGFybXxhYXJjaDY0KS4qLWxpbnV4Ig0KPiA+DQo+ID4gIERFUEVORFMgKz0gImxpYm5sIGxp
YmNhcCBwcm90b2J1Zi1jLW5hdGl2ZSBwcm90b2J1Zi1jIHV0aWwtbGludXgtbmF0aXZlIGxpYmJz
ZA0KPiBsaWJuZXQiDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiANCj4gPg0KPiA+IA0KPiA+
DQoNCg==

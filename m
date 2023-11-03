Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309EAC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:21:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.52596.1699021265314851310
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KKuRxwgH;
 spf=pass (domain: siemens.com, ip: 40.107.20.45, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C112FBpoweYjcgxdAVdTG7o1trYRDJskdkWbgkYqizxz5oSSqsmYWN3H4W57+Uq0W3x56k2S3SJRfRiPOsNrA+VAmG3YgLr9HzlH63gUS1C/V9tvDmiM5pVkmTMV5IE/n5P34Zi5OVulmd/851dTUA67oTRHEhmE2u3ARdBl80B4ZUOuEULpeE117AB6f0i4wzyyWqgbPTIpTg2b1zv02QUa3AWU8+wGvXUVbSBL8zke1taQG5nIQlRW60UaibzqUJGDYK8jXLJC6b02+E8ALagi18DpncVJ5ZntUVzlmK7exCBDT0FjZ+s/OP0s4QMJRJ2sFFqfym9HcnIuRisZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKUZJgUPNlSdPBif+BbbRJ5yQrjb93Ah9MVUVtFhEHo=;
 b=Im5hvhNPruC/jf36BWFwnhzJMIVM492sMiiR02Zi0ilUKeNY8UUtrhenO1yAJlQDQaJ6X2WwAdqKPAX2Zs2dlNXbxfFh3nQhyjRuBc1yp+7+rpt4nu4JlG3h91QmIgi0zt8rlic9Y2+ytxAgHlaFedX/rkdLAUIxCkE0Wvpd3wOv/jo555W2xU2WgsHCacw0xpBn9aw46iUyxlftwujbBsd/+BgHjov+n51ksQjSea+pgTQcD6bFs0UwZmKfOxFlCGDhxd4mA24SLg1dhIn1Qaw+w3A2xbn1erlgdk6gLyrGPaxs4E1VGn2kpVnECMfpfT1C/hOIr3VyG9h1BGF72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKUZJgUPNlSdPBif+BbbRJ5yQrjb93Ah9MVUVtFhEHo=;
 b=KKuRxwgHuoL2Pq+1WaZuIRObL+ZvV+LFtUn/KP4PIkRSj6fIGUlI2TTEvkX6gfpkX6x2s4RyI8Tg5yNzRwVohF0+dv6Xm2j+tKy2ve5HZ36QUZfJApbJKyQkeIOIa77KnvOx0WaXlIDFVOG77m7VGAvDhHXiaicEauAHXRud6WbMe37E4ypnCO9Iaq0x9NPTkOYx7tBOsPOJqU+7LSDtZXzJ7IRFKUKCqQEkUzKyO34v0PB+FoDNhpMCyBseW3Pvn8jr12zL6OMksFsxVqHh0yzwGsxBCI7G0aZJW/6/POSYTcJGwG0Jh9NwPiN8jDl8Jt7XIvHjwUVFtDzHtAo3ng==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB6008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:16::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 14:21:02 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 14:21:02 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: [meta-virtualization] use of yocto-cfg-fragments
Thread-Topic: [meta-virtualization] use of yocto-cfg-fragments
Thread-Index: 
 AQHaDXbDLSVFxUD5HE+bclx//pSk0LBnZmOAgADrL4CAAD8ke4AAA5EAgAAM0wCAAAXpgA==
Date: Fri, 3 Nov 2023 14:21:02 +0000
Message-ID: <c3b717c980568fb8d6d82fdd778cf3715d107ade.camel@siemens.com>
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
	 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
	 <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
	 <17941DFC88BEAF3E.3650@lists.yoctoproject.org>
	 <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
	 <632b380ea47e25224c67e6c7358ae5ea25a27663.camel@siemens.com>
	 <CADkTA4PffsPrmCrHeAM9A5zivxPeuHJk497mEyY2Uf=Za3NRUw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PffsPrmCrHeAM9A5zivxPeuHJk497mEyY2Uf=Za3NRUw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB6008:EE_
x-ms-office365-filtering-correlation-id: 00de7e3f-b034-4672-5aa5-08dbdc781bb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G8Udo0EwtYtdKtChya71/FKZySKmPRJ84jvLwannXPuhjYjMHRcPZ6D76RIEMLO5vnHkGbFAi5NYXx3DYH55zmIltDCK70H7jff177q+6RsST4IazAaMD2B5Fh9C8PCNVobhYGjXGlgZ16k56I4I9TNJaZLV3sEOwYbTC0O7dbI4AshAMeE1plLzH9cmL613uLpXspSEXbzdAhRybLtHSHdzgUgz+5d6wsj7gJi42otwATn8bJ4uNckQFbcu9HP6q/1P2Wh+iA1c+pRPxD+mdQS5lO41ZsvLLmf4Ldp6nRzNWsXBK5DGBbP2EeZBLXEP4qw8cVfNKp4P8uXxVAVkOwD3ZE+5kvMe/ByPlC/n1knU+YRAkgf2/vMeTjtA+bkJBT+30rQ9P2W6Sf/Z9Lkrv61uWL8K2/myS50Y6C+ZNdvTRLT4pw/q6BIeLoscJ5Vnzmct5Bbs2m1xA82gVXOo3D7IsXOjVWVrtZCcWiC4sLsKY772xMtoudqmFGndI1hPovfxf5Z+NtYJMntPocq+FW5Z+IEIwAQJw6vxqA4ahyBanRlFWh46sCYtA7FCT3/LGTgBzg4W5VCZ3UJEW4GZbtZrdNld/wEqOYCkGPPLdb++imjK/OPFHoXEMJ47vzMdN8kDMWpAjI+DKSpqw1f/MQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(15974865002)(2616005)(6512007)(316002)(71200400001)(4326008)(478600001)(83380400001)(5660300002)(2906002)(6506007)(41300700001)(6486002)(91956017)(66476007)(8936002)(76116006)(64756008)(66446008)(8676002)(54906003)(66556008)(66946007)(6916009)(38070700009)(38100700002)(82960400001)(122000001)(86362001)(36756003)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TGQ0T2lVRmp0NmhSbUdCaFE1VFNXVmFPOWpZdTJjbUw4NmdzU0NIRXEvQU5s?=
 =?utf-8?B?SmExcVJVUkVTOGlSRTBmb3dxWndTTlN0ZGJQWktyajJoN3UzenYxcW9jUUJx?=
 =?utf-8?B?R1NHcVY0bEFoajFkZjRSa3g2OUY5Rlc4czVJb3dTajV1VWtGNE1vWm1zbmc5?=
 =?utf-8?B?WFp2a2RXdnJKdUlkOFpKbjRCNU4ydUIwamtlamV5dDJuU1VJK2Uvdk5meGds?=
 =?utf-8?B?L3pibnd1ZWtwYUpQVzB6aWRwM1RZUWM0NzZtRFJhc2NKei9HdHY5OUk2Z3ky?=
 =?utf-8?B?YlJGUFJpNHhWWmtaRHdEK3I5dXdOaE5DRHBFaWIzTlFNdWFoekhqcjF6UkJN?=
 =?utf-8?B?cWhYTVNUWGRzcWVmS2RvSFBPL0phdHZhTjBCQklZUDdDRGIzdjFla1ZiNFlT?=
 =?utf-8?B?STZNR3dhQldzNnhUYVk5SVZTR2lNY3JkeERjWVhSK1Z1bXZpZGx5REVVVStw?=
 =?utf-8?B?aEpkTytVeXI2Tm1id0hzazgyWVhHdTZESEg5Y1Bud292ZTZRRXJrdFRTRkFm?=
 =?utf-8?B?aUF0L2R6VmM2YUlSMmU3R2xRbUN4Y3pISzY5YVM4Y1A2d0JPOTFnUUNlNzQ0?=
 =?utf-8?B?akFRVGxtM1BRZDJvREthd3RNZW9kVmd2cDlkUHplVGhwNjA4K1FCS3gwZExw?=
 =?utf-8?B?b2YybC9BUUNZOXBUTFdrcUw1R09zdlBMWm82WHJGcFh5Y2JmWWJCTTgxMFhn?=
 =?utf-8?B?Y3Y0MXo1WkUxcWt2WTRuL2tVOER2ejNRN24wOHhLUmZSY2pBTWFHeDVKTmhP?=
 =?utf-8?B?QlFCeHZrbmJZeXdFUnM0STVZMnB6TThzNGU2bWlYaWlxOVJOWTVWY05OMmxX?=
 =?utf-8?B?M3FBbFZQQVQxL3IwRXZ2WTFSMk50UTE5OWtETmpDNzE5NlNadDhqQlJjSnVi?=
 =?utf-8?B?MklJZHNMRXhiR3NVR29hZjcxSm5sazhmR1haNVptNk9CYml3azFpQWRLMnE2?=
 =?utf-8?B?bDZJRENzWlV5ZHplT0MwZElIS3BUK2JROVpDMWdaNmdEUlR6L1dTR0xmb0lm?=
 =?utf-8?B?c2t5dEJqNHh2VGpQSkx2dU1LU0hOaTd5S2ZtM245bHhkdGZnUkxuNktRbXRr?=
 =?utf-8?B?TG93WXFJMGNKVEwvaUFMOHlOMjgwbEp0eUpKZ1ZpOGlBMWpJRlFwWCtDMjc0?=
 =?utf-8?B?SnBiOUV1ZS9Ta205a29uZk9paXcwejJJbGczME5LOHBveHFsSmpCS0ZQRW9t?=
 =?utf-8?B?SFBmWUtrTGZLTkN5VlpTem5KNkdnQmFEZlk3bUZEMEVCYnJGWnJObGdXYkJD?=
 =?utf-8?B?K1hoV1F3cFdzcUp6WEhLb29LS1BFTDY4QkMyMEtpSm51UWxMdU5pSDFLQWxS?=
 =?utf-8?B?YWJTZXFtTzJ5d0F1SEtyT0xtWnJHV0VRWUYvblJNNjRkMFJUU1J4TzQ4RUpm?=
 =?utf-8?B?dlVrSWRBODNOeEF2L3hkejR4V05PT3p3RVl2R1lRZXpmcHlibFJrdDdCcXFM?=
 =?utf-8?B?dFJWdktzdU9YUXI5TXpSKytyUXptUWt6RWhEQ1QvNnliL29hdlpkQWJmVHJT?=
 =?utf-8?B?VkV5c0hVSkVXSjF2b2pLLzVFSEtKL3gvYVdHaXp3Q0E4M1VLMzVkTzJWRStQ?=
 =?utf-8?B?MjFBWnl6b0tUVkFPTU91Nm9WaWtpY3F2ak5VYk1NK0RBZTNmN0RYUnJGVzR6?=
 =?utf-8?B?eXFBOEkydnZBQnJ0bnNoVW1CSkNwc2xmZzAxeDB2YklTc0NlbFBVUXpoSjY4?=
 =?utf-8?B?N3dZbnJVM1IrOXFwT3NrNnVTVldJcWdBNU81ZFM1MWFzRDh6OHFrNzY3N2hr?=
 =?utf-8?B?NTR5YWl4MnNwUzhGQzVHc21obTlrTi9BZ1lpSHY5RHRzMmo3VFY3RkEzUlhS?=
 =?utf-8?B?Yk8zZjBWUmVneHpJZ29wSVdyZnZ2UXV2RVNEeVJIRVlLNmdDSTQ1TXcrSE1K?=
 =?utf-8?B?bkdJVGFyL1IyQ3gxeHRHVDBGa1hXR1E0VUJhT291VEdJZFQvVzRyQzZZSW5V?=
 =?utf-8?B?cTZWRFhZekZndGQ2dDRqMkw1YmJGWjFvWDlvM2M5bWwzVzd0ZkFuQkV0RWhF?=
 =?utf-8?B?TjZseWdvMjd6UDVVRG5nZEp4Sm5vR1loNU9BbDFuTjNNbmxjT2VDWFFzQ0dU?=
 =?utf-8?B?SXp1d0w5bDBEeDV4VFd0R2NNVmFuQmNHRjRIUHV6TGZOTTJVVlRGUTVvbXhN?=
 =?utf-8?B?YUtCc00yZ0N3WTdEZ014K1RpUFNQajJ2RWVzMkJPTVVPWHdNNlp0Ymk2VGg1?=
 =?utf-8?B?Y2pFYW9aYzMwZVBRb05mY0RnL2ZZTXZFbitIU3UzMTZlUEd1QjlveDQyYXVW?=
 =?utf-8?Q?OBT47+d3NTwbMP6WB9+OYs57ZIN+Mil+bnIJGTNnQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AB6758003059B4B9A163A70B3D88DF5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00de7e3f-b034-4672-5aa5-08dbdc781bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 14:21:02.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAPS9s81xXCKQi9TENXzc/rptAOmZ8wLinMKQZK9d0FcT8+GYuxgGmnlezy/ShQefBWi37Jv9csCSTqPfg9r+AdcZPIkiUjzA6lVi1Zty/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB6008
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:21:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8420

SGVsbG8gQnJ1Y2UsDQoNCk9uIEZyaSwgMjAyMy0xMS0wMyBhdCAwOTo1OSAtMDQwMCwgQnJ1Y2Ug
QXNoZmllbGQgd3JvdGU6DQo+IEluIHRoZW9yeSwgSSBjcmVhdGVkIHRoZSB0eXBlPWttZXRhIGZv
ciBqdXN0IHRoYXQgcHVycG9zZSwga2VybmVsLWNhY2hlIGFuZA0KPiBmcmFnbWVudCBleHRlbnNp
b25zLCBzbyBrZXlpbmcgb24gaXQgaXMgYXQgbGVhc3QgY29uc2lzdGVudCA6KQ0KDQpJIGhhZCB0
aGlzIGZlZWxpbmcgcmVnYXJkaW5nIHR5cGU9a21ldGEsIHRyeWluZyB0byB1bmRlcnN0YW5kIHRo
ZSBsaW1pdGVkDQpkb2N1bWVudGF0aW9uIGFuZCBob3cgdG8gdXNlIGl0IHdpdGggZmlsZTovLyBh
bmQgbmVzdGVkIGRpcmVjdG9yaWVzLg0KDQpIb3dldmVyLCBJIGZpbmQgaXQgZXh0cmVtZWx5IHVz
ZWZ1bCB0byBoYXZlIGN1c3RvbSAuc2NjIGZpbGVzIHdpdGgNCnRoZSB3aG9sZSB2ZXJpZmljYXRp
b24gbWFjaGluZXJ5IGluIGtlcm5lbC15b2N0by5iYmNsYXNzLg0KDQpJIGRvdWJ0IHRoYXQgZWFj
aCBhbmQgZXZlcnkgdXNlIGNhc2UgbXVzdCBiZSB1cHN0cmVhbWVkIGFuZCBnbw0KdmlhIHlvY3Rv
LWtlcm5lbC1jYWNoZSwgSSBiZWxpZXZlIHVzZXJzIG1heSBoYXZlIHZhbGlkIGJ1dCB2ZXJ5DQpz
cGVjaWZpYyAuc2NjIHRhaWxvcmVkIGZvciB0aGVpciB1c2UgY2FzZXMuDQoNCj4gPiBJIGNhbiBh
bHNvIHRyeSBhbmQgdGhpbmsgdXAgYW5vdGhlciB2YXJpYWJsZSBvciBhIHdheSB0byBleGNsdWRl
IHRoYXQNCj4gPiBkZXBlbmRlbmN5DQoNClNvIG1heWJlIGFub3RoZXIgdmFyaWFibGUgY291bGQg
YmUgYW4gYW5zd2VyLg0KQmVjYXVzZSBpdCdzIGhhcmQgdG8gZGlzdGluZ3Vpc2ggcmVhbCB0eXBl
LWttZXRhIHlvY3RvLWtlcm5lbC1jYWNoZQ0KKGVzcGVjaWFsbHkgaWYgcGVvcGxlIHdvdWxkIGhh
dmUgdGhlaXIgbG9jYWwsIG1heWJlIHBhcnRpYWwgbWlycm9ycykNCmZyb20ganVzdCBjb3VwbGUg
b2YgLnNjYyBmaWxlcy4NCg0KPiBCdXQgSSBkbyBhZ3JlZSB0aGF0IGl0IGlzIHB1bGxpbmcgaW4g
KHBvdGVudGlhbCkgc3VwcG9ydCBmb3IgQUxMIG9mIHRoZSBmZWF0dXJlcw0KPiBpbiBtZXRhLXZp
cnQuIFRoYXQncyBhIGJhbGFuY2UgYmV0d2VlbiBoYXZpbmcgdG9vIG1hbnkgZmluZSBncmFpbmVk
DQo+IGRpc3RybyBmZWF0dXJlcywgdmVyc3VzIHRoZSBvbmUgYmlnIHN3aXRjaCAidmlydHVhbGl6
YXRpb24iLg0KPiANCj4gSXQgY291bGQgYmUgZmluZXIgZ3JhaW5lZCwgbGV0IG1lIHNlZSB3aGF0
IEkgY2FuIGNvbWUgdXAgd2l0aCB0byBzbGltIHRoaW5ncw0KPiBkb3duIGEgYml0IC4uIGJ1dCBh
cyBpdCByZWxhdGVzIHRvIHRoZSBrZXJuZWwtY2FjaGUsIGV2ZW4gYSBtb3JlIGZpbmUgZ3JhaW5l
ZA0KPiB0cmlnZ2VyIHdpbGwgd2FudCB0aGUga2VybmVsLWNhY2hlIGZvciBlaXRoZXIgdmlydHVh
bGl6YXRpb24sDQo+IGNvbnRhaW5lcnMsIHhlbiwgZXRjLg0KPiANCj4gSSdsbCBmb2xsb3cgdXAg
bGF0ZXIgdG9kYXksIG9uY2UgSSd2ZSB0aG91Z2h0IGFib3V0IHRoaXMgYSBiaXQgbW9yZS4NCg0K
LS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K


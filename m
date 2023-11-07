Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47819C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:57:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web10.11493.1699365463353344825
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 05:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H/clC+v5;
 spf=pass (domain: siemens.com, ip: 40.107.21.45, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWvX7WG4PdTQOFPCxt1e3KQ0SkZnCi3juT3xBXS4CDKF1GTm82JtjgFFQXPgsfvnxOFzWFsvBK/eW60BIqKpFxkhpnunKi72Xd56CfHNuSQjf8YeD253uJx9IM0fo2QB5sx2w9vl9BAIUJrWqGC2CiKO/AqJH+WXuN087F/PC8EEHdKdaFFb0fp69fjt7Fq/Tx4gnmztKbAYhgkP2tuvcfNC4xxu4VAMN5iPjQY7PM2wzsvUAKEi4ptPZqGsljgfNqZbGh0pnr72KN1nf2Z9l2GoZlcRbPSNUU89RKMpNOdKBFwecCbL9uLlhOPllDmsVSSUJbUNlTGEze9ukAtCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48mL5Q17Xa5Yvla78aH6SKduCC1Ed/hDWecYEsuEJho=;
 b=Fcf99/xkQxDLDfxSTrvwOfgmbZef3SQwOuqON4rYNxAJNDq/ujrhiNtrRwZIS2hFZtJXwIp9HEgpkVFn8xtgwqmCOxNFQa+EIaQp+N+SLmUBno7CiI+BXqxyk3bbJORw6zCbGSgNqEIxDa3Zll3ziJuxjXkftbjS/gyHN17mpF2FWOyuUyBKlvSAdit+4wfLGTz8+jZF6WCUM9DlQl7dc6rLESJ5A9KMSIX5BoOaxiW+nzluRqsLl8J56LN38Na9P1zMl6XXnyhEEhr8xqKfyppStgPLK7DxCx/gUtDmMJRXaHvBPS8TTcZZ/fG01SNp4nVAi9bMsfDsxk86vvEykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48mL5Q17Xa5Yvla78aH6SKduCC1Ed/hDWecYEsuEJho=;
 b=H/clC+v5Nt/zqY8mH9+amUFV+JGM1NnbKrvpsBh+zfws3uUbQhDqL3btmw5cpCIb4nfmuBLz5ptgj7nOeJSl5tZMFnaYj2FWKpK6uFR1M7KqN/2MQkLs4ndTRFVixXMgp2f6vKP0jJJ/VhgXM+hzYU9svDZKLeO5aFFCzKkNulFex2zGPH/27yeCv8w3FClfqGNqZgXB6EXQqWy3qxujZZY65/ab9Lbzh7ploPfvdV74bi5/CO9JRgmYdpVjU85jbYMkIMbMjTXenWR5ONj74fF3bJJ0XIz5WznxNZrXFLeVmU6f2E/HrTKmq9oxCpprxg6aE0aoaW00NRsyoFIOjg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV2PR10MB7991.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Tue, 7 Nov
 2023 13:57:39 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 13:57:39 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE
 redefinition
Thread-Topic: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE
 redefinition
Thread-Index: AQHaEJKa1mPxXUZD10eoHO87VOmOV7BuCdGDgACaWQCAADXTgIAACZkA
Date: Tue, 7 Nov 2023 13:57:39 +0000
Message-ID: <642e2c00f27c5897f333d3f73a1c723fd0740c4d.camel@siemens.com>
References: 
 <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
	 <20231106092058.1209687-1-alexander.sverdlin@siemens.com>
	 <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
	 <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com>
	 <8b75984f95e392f776d732e43bcf60fbc7573b44.camel@siemens.com>
	 <CADkTA4NK7z7obH3-9OE8LRRKNJ=7mJVz5XFbn36Nog4OkfS0Qg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NK7z7obH3-9OE8LRRKNJ=7mJVz5XFbn36Nog4OkfS0Qg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV2PR10MB7991:EE_
x-ms-office365-filtering-correlation-id: 1abf50d5-e55f-471d-449c-08dbdf998148
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lvXqfS+OC4Y7QnPthpdqCysb1iGN4CCU/lqSeIlgJvjjl+F9HFV3nuOA2jJ6whnSJq6ZpPIeePFmeXvf51BZrQJ+dlzgnAZOVwyIK0SwBHQjSqpLjY75UU0jNDFkAKCSw41QwVkedn65XALh82OgJfQVmm+W/LT2tAF5W2vMKPgRN3FuG2MCoec4vJBjq33kwaEz68KUhiIjoCVRPVTTLxJrtBqy5czHlRw803DuF+vBHAaBgAO0MyAD2LlmU5ZCdZyZskFLIQjtTRvISPeVU9xEENYtzm5jpJDAKhwxZVTSmIVHXoUmnZcICz+r0cpJXt/b4NBuKPON4GmyDc1qytQoQrwjCCm7k27Tf8gpnB30w5AfngrFa5wk7uOHKB5Jd90WsfX3dvTluSEiL6iAQbPxapWyx+ZTX70sHujwFBfaJuBxZLHNzLL6F6mT+KIi9WZveUegibyS20/VgnjHdl1mKejXcPpTQhiAN9vbtPqi30F/zqBQl8c3/pbuUat+RmsNOZXqRRN2X9thjjZF0CS75+HbdkPQ3WRQtsPnQqVfLSi355eDU10PSvzgj+1ujX5XHvr5GFmkzmI5+zbBmDu9JSGk6IbUu6gKxRgTz6jhBdrlbVijbrIL6gV8/pN2ybNGeVkday7luFw8BiLH1duM9ZJLAhYLywy1mkqB69oEdQXEkr3UcEJKbgwu9OM9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(451199024)(186009)(26005)(54906003)(66476007)(15974865002)(2906002)(41300700001)(8676002)(4326008)(38070700009)(86362001)(5660300002)(8936002)(478600001)(966005)(71200400001)(38100700002)(6486002)(66556008)(122000001)(316002)(36756003)(6916009)(55236004)(6512007)(83380400001)(66946007)(91956017)(66446008)(76116006)(64756008)(82960400001)(2616005)(6506007)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0ppOThOMkNVWkl5RVRpTjE0YmZFQnVGbkkway9DRnRPdnNFWGc1MGJjVlZo?=
 =?utf-8?B?RWhVUEZwT3V6cGUvQVJZUTIxMERyNGFtWTVTVEp3dzVXdm1wOUVOQnhLS0ZB?=
 =?utf-8?B?Ukk2Yy8yZVVybUdUUENwZDRXZWQ2VGdOYndOV2ZySytaRGNFMnZvdFFTbCs3?=
 =?utf-8?B?cmN6VU96U1k2S2VDbHFOMmFGZndEcTQzUkhVWHFyUERybnBibk5zNHZxS0JL?=
 =?utf-8?B?ZjcrM1ZoWXNKdHUwUkZIS29qL1ZUb2YzL2JUN3JlbjYxQlBlSFdJMGNsRFlQ?=
 =?utf-8?B?K0dwVmZFbm1Leml1ZzV5cEUzc0cwZ041RXFaUDg0MW9TNmYwa0JjRUhVUkJ1?=
 =?utf-8?B?NStUQ0tBNmVpK09FTVVyWktuU0x0UTZIVy9LcVJvQUUwWEVXY0FaZGRZUnh0?=
 =?utf-8?B?dU5LMTVOQnd2VEVXajBIS0YrS2tXSzJrOGMwR1Z2RUVUSUM1eEZVOXlmSlp4?=
 =?utf-8?B?MnhhNU9OanU5eUZmcnBFd3hHRGxNSzB5T1JONTJva0d5QnhteTRKWE0zRDRv?=
 =?utf-8?B?WFc4VzJNbm9mdHBDbHh5OVhpWndXa3FlcmVJcE1jUldFYncrSDJPblNmaTRa?=
 =?utf-8?B?VSt2UVBnb1d0SkNTdzQzMkpnMm8yaCt2dVZYTEpuQmtVN1dWbE5zaTlkUHJr?=
 =?utf-8?B?RU1EYnBMSjFheDFrNElxUGJlMDFvZzBVV0pjT1R4Z2dUL082VHNBUlIyeUIy?=
 =?utf-8?B?NXkwb01iQzRHemI0MTBtMmJjd24xRXRlY2NMSGw2NnAxWUtTeko3akpVM2c4?=
 =?utf-8?B?alo3eGV2ZHVVVGxYSE9FMjU4WFZQUTBZa2l4c0FPNitlRHVhRzNFeEtGLzA4?=
 =?utf-8?B?KzZlbUZ5OUFGQVpuR202b3JyT2pORkJQY2RlM2xOS3BudDFNTG5saTVSWm5m?=
 =?utf-8?B?QWhSemdROFBXUzZKcEl0VGZBU2FxRWpRaGExQm9Vdkp5b21mOHFyd09iMGNo?=
 =?utf-8?B?YnNVQjNjeisxbDgyRi9DdElrMHl5aXhsaXJ2WjNaRDZYdG0vK21CcDJESjN1?=
 =?utf-8?B?R0cvQzFKMHpZWGNrNS82QjJvNzRNTUJ2U2RDbEJOYWNQb29JMmI0TlBERUJv?=
 =?utf-8?B?VG9PcThhTWVsajFkTjQwdWNCQUxVdGYyQ2FzMEJmU2dBWkVLNk9sT3grQVBs?=
 =?utf-8?B?WHBocWRCNkc4Mml1Y293QlF6Z1JiWmdjWXJqUkdFUS9HL3dSRmJyU09CTjhj?=
 =?utf-8?B?VytZdjh0SGx6d0V0SUlUVVh4b2FGc2NPOGhMRktIWDA2U0JJN2NqWkdUNUhE?=
 =?utf-8?B?WUFsdjIwWXFtQ0lzU0psUFN0VHVoQ2FXMDA1eTFLQ3NnUm04cHZEMkVTaXdQ?=
 =?utf-8?B?Q1d5U3NybkxjSExUdG5sb0xpeE9XbENjWjREbERQZnpiWWRyZ213VEEyTjhD?=
 =?utf-8?B?MkNNZ1FOTDRpVWZCWFNXOUoyc0gzS09ZTjU1VVZwQS9IdmhJZWNDdU5nNWU3?=
 =?utf-8?B?Z3NnQ0VJdzRPWHcwcnlSNXdpczdmTDFIMFczL2M4Y2RWd2d3T3Q1Y2VINENn?=
 =?utf-8?B?bERvS3Vlb1BOWER4alo3VDVuTm5Dd2Y4Mmg2NzlUaHVrb0xvaGdiRklwc2xm?=
 =?utf-8?B?U2ZTd2t0L20yc29FVUtXUkt6VHNBdVRqR3V0MUdpYzk0QzNNMVRsNHd4UStP?=
 =?utf-8?B?Z25maXIzWTIxL1dscXRMbDQwVXlWYkFURlVtU3YraUdOMjYwN2pzd2JNb0dM?=
 =?utf-8?B?TDFIai9BbTd3a3RzdHIzclVxbHJ0VDRXTGJIQkdPdmFNS1JuOEtXS3NiYkFT?=
 =?utf-8?B?MENPS1kwZ1pqaVZ4RDgxTmozZkZYQUF1clQ4THA4bjdiTlNmMGhKaEdWYzdh?=
 =?utf-8?B?VzN5ZkpiTkdmejlPdHdBNEV1aVg3RFhvZlQzREhCTTBPUUxuY3dZNk9hZ0RP?=
 =?utf-8?B?dDJJbzdacFZ0TEorc0N1eDJGTGp6aFNKNG5Wb2JMQ0QxQjM5YXd6eUdQeFoz?=
 =?utf-8?B?cmZJY0VjYXJzTlNvYWhKa0xRYko0Y0ZVcndZLzlVcVZEUUFRUUdMWUFPR1lX?=
 =?utf-8?B?bEVRL2htbVptRXpUTXYzWGRlTkZUTURQVlo0akduTitoNkpKRk1saVBOOEhI?=
 =?utf-8?B?QnR6RnNCbnFlQVVCSzhqRUZtenI1T1lCQmhCWk5TeC8reVppZUNZaUdzSmdC?=
 =?utf-8?B?Y3FEMzYxeVJ3QXRkTHVINWVnREM1SVVoTlU1OTM2c2tqUHdLWmhVVy9qQVoy?=
 =?utf-8?Q?L6GpnI+mG8Q7YhHYrcQD2HQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64F2EF64E1FA724488AE834EA0FB64FA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf50d5-e55f-471d-449c-08dbdf998148
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 13:57:39.4814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PM60mSy0qLlScjMKfI1WQjD4pQb+wE+HmOko1DYBkKYXGKbdemybJj4yEKCTltCA/V50EDchNImbyIRqkX/eEmfyQ5FZs0rhTTjq8H8D6Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7991
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 13:57:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8442

VGhhbmtzIEJydWNlLA0KDQpPbiBUdWUsIDIwMjMtMTEtMDcgYXQgMDg6MjMgLTA1MDAsIEJydWNl
IEFzaGZpZWxkIHdyb3RlOg0KPiA+ID4gPiBXaGljaCBpcyB3aHkgaWYgYSBrZXJuZWwgdHlwZSB0
aGF0IGNhbiBtZXJnZSBmcmFnbWVudHMsIGJ1dCB5ZXQNCj4gPiA+ID4gaXMgZGlzYWJsaW5nIHRo
ZSBmZWF0dXJlIHNwZWNpZmljYXRpb24sIHRoZSBsYXllciBzaG91bGQgZW1pdCBhDQo+ID4gPiA+
IHdhcm5pbmcuIEknZCB0aGVuIGhhdmUgYW5vdGhlciB2YXJpYWJsZSB3aGljaCBpbmhpYml0cyB0
aGUgd2FybmluZw0KPiA+ID4gPiBtZXNzYWdlLiBTaW5jZSB0aGF0IGlzIHNvbWV0aGluZyBJIGNh
biBhc2sgYWJvdXQgaW4gYnVnIHJlcG9ydHMNCj4gPiA+ID4gYW5kIHVudGlsIHRoZSB3YXJuaW5n
IG1lc3NhZ2UgaXMgcmUtZW5hYmxlZCwgdGhlIHJlcG9ydGVyIGlzIG9uDQo+ID4gPiA+IHRoZWly
IG93bi4NCj4gPiA+IA0KPiA+ID4gTXkgc29sdXRpb24gaXMgbm93IGluIG1hc3Rlci1uZXh0Og0K
PiA+ID4gDQo+ID4gPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdmlydHVhbGl6
YXRpb24vY29tbWl0Lz9oPW1hc3Rlci1uZXh0JmlkPTQ1YzIyOTdhOTE2NTE2ZTVmYzdiODJkYWI0
NmM0NzE5NTkwODEzYjcNCj4gPiANCj4gPiBJJ3ZlIHRlc3RlZCB5b3VyIHNvbHV0aW9uIGFuZCBp
dCBzb2x2ZXMgdGhlIGlzc3VlIG9uIG15IHNpZGUsDQo+ID4gdGhhbmsgeW91IGZvciBhZGRyZXNz
aW5nIGl0IHNvIHF1aWNrbHkhDQo+ID4gDQo+ID4gVGhlcmUgaXMgYSBwcm9ibGVtIGluIHRoZSB3
YXJuaW5nIGNvZGUgdGhvdWdoLCBuYW1lbHkgYSB0eXBvIGhlcmU6DQo+ID4gDQo+ID4gc2tpcF9r
ZXJuZWxfaW5jbHVkZV9lbmFibGVkID0gZC5nZXRWYXIoJ1NLSVBfTUVUQV9WSVJUX0tFUk5FTF9J
TkxVREUnKQ0KPiA+IA0KPiA+IGlmIGl0IHdvdWxkIGJlDQo+ID4gDQo+ID4gc2tpcF9rZXJuZWxf
aW5jbHVkZV9lbmFibGVkID0gZC5nZXRWYXIoJ1NLSVBfTUVUQV9WSVJUX0tFUk5FTF9JTkNMVURF
JykNCj4gPiANCj4gPiB0aGUgd2FybmluZyB3b3VsZCBiZSBlbWl0dGVkIGFzIGV4cGVjdGVkLiBB
ZnRlciB0aGUgY2hhbmdlIGJvdGggZW1pdHRpbmcNCj4gPiBhbmQgc2lsZW5jaW5nIHRoZSB3YXJu
aW5nIHdvcmtzIGZpbmUuDQo+IA0KPiBvb3BzIQ0KPiANCj4gSSBqdXN0IGZvcmNlIHB1c2hlZCB0
aGUgZml4IHRvIG1hc3Rlci1uZXh0Lg0KDQpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8
YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KDQppZiBpdCBtYXR0ZXJzDQoNCi0tIA0K
QWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==


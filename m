Return-Path: <MANJUKUM@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1FB6E00D30; Thu, 11 Apr 2019 07:44:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.68.74 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 10842 seconds by postgrey-1.32 at yocto-www;
	Thu, 11 Apr 2019 07:44:14 PDT
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680074.outbound.protection.outlook.com [40.107.68.74])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 132F3E00CB9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2019 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XcaYPpsCgv0fTTi32vibURLX/VvEIGX6aQTOL5iT+4Y=;
	b=f7Bcmski0Cky+aGaS/NkzmXzk7UvBfJvlQFXl83PCj8T7/ZAxipUGGFxvPmXFGgPY4Owz00Yy5Cmj5eb0QGYucQSA2AfujIUGwft8OIQSiOG6Me/xmKqbTy7S44j2WhV+D5jk+hVatJp//UGb+qln5lUhuZ6/FAzHueCL/pFz+Y=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4150.namprd02.prod.outlook.com (20.176.249.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.15; Wed, 10 Apr 2019 05:06:23 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c%4]) with mapi id 15.20.1771.016;
	Wed, 10 Apr 2019 05:06:23 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Sathees Balya
	<Sathees.Balya@arm.com>
Thread-Topic: [meta-virtualization] Issues with 50cdecc
	sysvinit-inittab_xen.inc: fix hypervisor console
Thread-Index: AQHU6pgPkXVMldPFpUej15S2gb+NvKYxnKkAgACayoD///FJgIACuAxQ
Date: Wed, 10 Apr 2019 05:06:22 +0000
Message-ID: <BYAPR02MB600588C5E1DE4A6768FC9298B92E0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
	<CADkTA4NirbuwMTw-ZpuSqz548qbUMZu-3rqw0Uk6Z8w2kRqQeA@mail.gmail.com>
	<CF877014-38CB-405B-9DCB-99E957BA0339@arm.com>
	<CADkTA4MwZoAEpNpm2bLtziN=vUrWCWMkkDJawxm9Zcr4Z6nXDQ@mail.gmail.com>
In-Reply-To: <CADkTA4MwZoAEpNpm2bLtziN=vUrWCWMkkDJawxm9Zcr4Z6nXDQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffca8c6a-8b46-4761-181f-08d6bd7246cb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB4150; 
x-ms-traffictypediagnostic: BYAPR02MB4150:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR02MB415073AC5AB511312787E658B92E0@BYAPR02MB4150.namprd02.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(13464003)(33656002)(52536014)(14454004)(478600001)(966005)(54906003)(97736004)(71190400001)(71200400001)(72206003)(6436002)(5660300002)(81156014)(8676002)(8936002)(81166006)(25786009)(4326008)(68736007)(229853002)(6246003)(6116002)(3846002)(66066001)(486006)(5024004)(256004)(7696005)(186003)(106356001)(14444005)(86362001)(93886005)(476003)(11346002)(446003)(74316002)(2906002)(55016002)(53936002)(99286004)(7736002)(110136005)(305945005)(102836004)(26005)(76176011)(9686003)(316002)(6306002)(6506007)(53546011)(105586002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4150;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uGJpHdJ3uwEfXc7AHdxt5ddcrlPubZj8yL+oGdCyS/0FYA8EU9VNgmX1zxK2Ysji8lYkDwdVPgBMErp1faODcKZ6k4UCzYSWHwi0SxWLtSWFzhGG23hQn8C5uAg9Q2Au4TWAANf1yCHcjRLCjkgK9+/jOR4RdIrbUjQcuiMRKevMuMeyrdDZ3DZPbGmFgx10XOdoNfxwBvTF5kPVjjIzpDI2N3d+2Xbdk56j6x7S3hR3wW0i2vde5XUBtTRSzkReGENe1161VdAzU4vbMzqem/RrI1pSqX1ka1Yv8y5nGX07OyBGTxufK5SI/WwAQqzjxdtL9ElcZ4bi2zPsjHb31j4JKt4BGuBR+BC8qhLUAz+rNDzaAsPAXZs+izIdWLqiHu9Otk5ambbprgLm5W2MP3a15bwZiR/IdRZu6al9GcA=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffca8c6a-8b46-4761-181f-08d6bd7246cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 05:06:23.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4150
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, nd <nd@arm.com>
Subject: Re: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor console
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2019 14:44:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2Ug
QXNoZmllbGQgW21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRh
eSwgQXByaWwgOCwgMjAxOSA0OjM0IEFNDQo+IFRvOiBTYXRoZWVzIEJhbHlhIDxTYXRoZWVzLkJh
bHlhQGFybS5jb20+DQo+IENjOiBGaWxpcGUgUmluYWxkaSA8RmlsaXBlLlJpbmFsZGlAYXJtLmNv
bT47IG1ldGEtDQo+IHZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmc7IE1hbmp1a3VtYXIg
SGFydGhpa290ZSBNYXRoYQ0KPiA8TUFOSlVLVU1AeGlsaW54LmNvbT47IG5kIDxuZEBhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIElzc3VlcyB3aXRoIDUwY2Rl
Y2Mgc3lzdmluaXQtaW5pdHRhYl94ZW4uaW5jOiBmaXgNCj4gaHlwZXJ2aXNvciBjb25zb2xlDQo+
IA0KPiBPbiBNb24sIEFwciA4LCAyMDE5IGF0IDc6MjYgQU0gU2F0aGVlcyBCYWx5YSA8U2F0aGVl
cy5CYWx5YUBhcm0uY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEhpIEJydWNlLA0KPiA+DQo+ID4g
V2UgcmV2ZXJ0ZWQgdGhlIGNvbW1pdCAiNTBjZGVjY2E3YjJhMGUxYmI1ZWFjYmVjMTMyZjI2Yjgw
MmY5NTBmYyIgYW5kDQo+IHRoZSBjb25zb2xlIHN0YXJ0cyBhcyBleHBlY3RlZC4gVGhhbmtzLg0K
PiA+DQoNCldlIHNob3VsZCByZXZlcnQgdGhpcyBjb21taXQsIGFuZCB3ZSBjYW4gdXBkYXRlIHRo
ZSBwYXRjaCBsYXRlciBhZnRlciB0ZXN0aW5nIGl0IG91dCBvbiBkaWZmZXJlbnQgY2FzZXMuIA0K
DQpUaGFua3MsDQpNYW5qdQ0KDQo+IA0KPiBXZSBoYWQgYWxyZWFkeSBlc3RhYmxpc2hlZCB0aGF0
IHdpdGhvdXQgdGhlIGNvbW1pdCB0aGluZ3Mgc3RhcnQsIHRoZXkgd2VyZQ0KPiBzdGFydGluZyBi
ZWZvcmUgd2UgbWFkZSB0aGF0IGNoYW5nZS4gSXQgd2FzIGZvciBmaXhpbmcgYSBkaWZmZXJlbnQg
aXNzdWUgYW5kIGZvcg0KPiBzdGFuZGFyZGl6aW5nIG9uIHRoZSB1c2Ugb2YgdGhlIHZhcmlhYmxl
Lg0KPiANCj4gSSdtIHRyeWluZyB0byBmaW5kIG91dCBpZiB3ZSBjaGFuZ2UgdGhlIHN0YXJ0dXAg
Y2hlY2ssIGlmIHRoZSBjb25zb2xlIHN0aWxsIHdvcmtzLg0KPiANCj4gQnJ1Y2UNCj4gDQo+ID4N
Cj4gPiBSZWdhcmRzLA0KPiA+IFNhdGhlZXMNCj4gPg0KPiA+IO+7v09uIDA4LzA0LzIwMTksIDA0
OjEyLCAiQnJ1Y2UgQXNoZmllbGQiIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gICAgIE9uIFRodSwgQXByIDQsIDIwMTkgYXQgNDoxMSBQTSBGaWxpcGUgUmluYWxk
aSA8RmlsaXBlLlJpbmFsZGlAYXJtLmNvbT4NCj4gd3JvdGU6DQo+ID4gICAgID4NCj4gPiAgICAg
PiBIaSwNCj4gPiAgICAgPg0KPiA+ICAgICA+DQo+ID4gICAgID4gV2l0aCByZWdhcmRzIGNvbW1p
dCAiNTBjZGVjYyBzeXN2aW5pdC1pbml0dGFiX3hlbi5pbmM6IGZpeCBoeXBlcnZpc29yDQo+IGNv
bnNvbGUiLi4uDQo+ID4gICAgID4NCj4gPiAgICAgPg0KPiA+ICAgICA+IFdlIGFyZSBoYXZpbmcg
aXNzdWVzIHdpdGggdGhpcyBwYXRjaC4gV2hlbiB1c2luZyBzdGFydF9nZXR0eSAoYSB3cmFwcGVy
IHRvDQo+IGdldHR5KSBpdCB3aWxsIGZpcnN0IGNoZWNrIGlmIHRoZSBjb25zb2xlIGRldmljZSBp
cyBhICJzZXJpYWwiIGRldmljZSBkcml2ZXIgWzFdLiBJdCB0aGVuDQo+IGZhaWxzIGJlY2F1c2Ug
aHZjMCBpcyBhICJzeXN0ZW0iIGRldmljZSwgbm90IGEgInNlcmlhbCIgWzJdLg0KPiA+ICAgICA+
DQo+ID4gICAgID4NCj4gPiAgICAgPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRl
ZC9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvYmxvYi9tYXN0ZXIvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dmluaXQvc3lzdmluaXQtaW5pdHRhYi9zdGFydF9nZXR0eSNMMTENCj4gPiAgICAgPg0KPiA+ICAg
ICA+IFsyXQ0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3R0DQo+IHkvaHZjL2h2Y19jb25zb2xl
LmMjbjEwMzYNCj4gPiAgICAgPg0KPiA+ICAgICA+DQo+ID4gICAgID4gQW55IHRob3VnaHRzPw0K
PiA+DQo+ID4gICAgIENhbiB5b3UgY29uZmlybSB0aGF0IGlmIHRoYXQgY2hlY2sgaXMgcmVtb3Zl
ZCB0aGF0IHRoZSBjb25zb2xlIHN0aWxsDQo+ID4gICAgIGZ1bmN0aW9ucyBhcyBleHBlY3RlZCA/
DQo+ID4NCj4gPiAgICAgUmF0aGVyIHRoYW4gYm91bmNpbmcgYmFjayBhbmQgZm9ydGggYmV0d2Vl
biBmaXhpbmcgb25lIGlzc3VlLCBhbmQNCj4gPiAgICAgY3JlYXRpbmcgYW5vdGhlciwgSSdtIHRl
bXB0ZWQgdG8ganVzdCBiYmFwcGVuZCBhbmQgcGF0Y2ggdGhlDQo+ID4gICAgIHByb2JsZW1hdGlj
IGNoZWNrIG91dCBvZiB0aGUgc3RhcnR1cC4gQnV0IEknbSBub3QgY3VycmVudGx5IHNldHVwIHRv
DQo+ID4gICAgIHRlc3QgdGhlIGlzc3VlLg0KPiA+DQo+ID4gICAgIEJydWNlDQo+ID4NCj4gPiAg
ICAgPg0KPiA+ICAgICA+DQo+ID4gICAgID4gQ2hlZXJzLA0KPiA+ICAgICA+DQo+ID4gICAgID4g
RmlsaXBlDQo+ID4gICAgID4NCj4gPiAgICAgPg0KPiA+ICAgICA+IElNUE9SVEFOVCBOT1RJQ0U6
IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlDQo+IGNv
bmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkIHJlY2lwaWVudCwNCj4gcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0
ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueQ0KPiBvdGhlciBwZXJz
b24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0
aW9uIGluIGFueQ0KPiBtZWRpdW0uIFRoYW5rIHlvdS4NCj4gPiAgICAgPiAtLQ0KPiA+ICAgICA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gICAg
ID4gbWV0YS12aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QNCj4gPiAgICAgPiBtZXRhLXZpcnR1
YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gPiAgICAgPiBodHRwczovL2xpc3RzLnlvY3Rv
cHJvamVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0KPiA+DQo+ID4NCj4gPg0K
PiA+ICAgICAtLQ0KPiA+ICAgICAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2lu
dGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQNCj4gPiAgICAgdGhlZSBhdCBpdHMgZW5k
DQo+ID4gICAgIC0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJ
DQo+ID4NCj4gPg0KPiANCj4gDQo+IC0tDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBO
VUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0DQo+IGl0cyBl
bmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==


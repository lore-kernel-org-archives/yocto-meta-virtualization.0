Return-Path: <Sathees.Balya@arm.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 858B4E00D45; Wed, 17 Apr 2019 12:11:25 -0700 (PDT)
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
	*      [40.107.13.71 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 52689 seconds by postgrey-1.32 at yocto-www;
	Wed, 17 Apr 2019 12:11:23 PDT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84243E00CD5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Np8ODjmBJaHQcOvK5Om1vyCDvUUORvCpFM9DEN4UAg0=;
	b=paDIF9VZKKpLAfesIfYCO44dnknFrsFH9Y/f9m2O8cGTop9cJdAqpzXzuEmo86CJLi8eELYr1EUqAld5XVm2agggBzVl4akuGihwm5a+GtAy53i3/b3s5GF2Z3AdM0PsgiysVIiIb3090kUHKd16lri3+MedH+hMk8M1I7JXy+E=
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com (20.177.112.218) by
	AM6PR08MB3496.eurprd08.prod.outlook.com (20.177.114.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.15; Wed, 17 Apr 2019 16:38:00 +0000
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95]) by
	AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95%3]) with mapi id 15.20.1792.018;
	Wed, 17 Apr 2019 16:38:00 +0000
From: Sathees Balya <Sathees.Balya@arm.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>, Christopher Clark
	<christopher.w.clark@gmail.com>
Thread-Topic: [meta-virtualization] Dev86-native dependency
Thread-Index: AQHU86MAWT+LRFxBPEiFbpO5NpJoDaY+BSyAgAE/3gCAAQgtgIAAVBuA
Date: Wed, 17 Apr 2019 16:38:00 +0000
Message-ID: <2F2DB6C9-8B9B-42A3-AA61-2D00C50B0CE0@arm.com>
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
	<CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
	<CAPuovEJ6rA7j7uURyrGfHJhVENSZ8XVuzRzLhRYFrFr1o5R6tA@mail.gmail.com>
In-Reply-To: <CAPuovEJ6rA7j7uURyrGfHJhVENSZ8XVuzRzLhRYFrFr1o5R6tA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Sathees.Balya@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a70aa15-51fb-451a-29b4-08d6c3530e15
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB3496; 
x-ms-traffictypediagnostic: AM6PR08MB3496:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR08MB3496B0913F45DF07D8BA4717EF250@AM6PR08MB3496.eurprd08.prod.outlook.com>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(39860400002)(376002)(396003)(366004)(40434004)(189003)(199004)(486006)(966005)(102836004)(14454004)(8676002)(6116002)(93886005)(446003)(76176011)(81166006)(3846002)(6246003)(110136005)(229853002)(6512007)(476003)(11346002)(81156014)(8936002)(6306002)(6436002)(2616005)(68736007)(4326008)(186003)(26005)(6486002)(53546011)(316002)(6506007)(66066001)(97736004)(7736002)(83716004)(256004)(305945005)(25786009)(106356001)(2906002)(5660300002)(71190400001)(71200400001)(82746002)(5024004)(14444005)(33656002)(105586002)(99286004)(478600001)(53936002)(36756003)(86362001)(72206003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3496;
	H:AM6PR08MB3381.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LLUhVF20J0mkBi8BeM20fQdQeIiJTylU1x8B5bt9CdnzHQPFPfrH77KTqNkA333dHuvlC6FqiYR+wTosl3AWfGwKxm7iBlpAdOqrMRuSruguipzSt/ZpxyDBUI09YC+PJFzRaKmV26Nmk2Gu0g8082JMHR6u+55Tm2w4zkz1C7bMIhOCKTnvkFQKjeN3ky1sbH34eGg4nZX7nxEHfv+mKAOS+JOatX7YKLv+WUstFBnb3CLuclgbobSl0uWxeWUN5XQyHPOs8LioxCcRNfjnwgiXTnlf+CtdUeBRWiLyPntLgbE+cq8Wo7JRblzCF4ON3srNkqsRIF9A7A2fc21YnEsI+SKOXAae9cJikXHNqmM71QeF7eFHKN7fw7BcQncDZ+cw9zDT+l9Hbd9FLacl+5YVYhvY+8Hkt7OiKmnSSaM=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a70aa15-51fb-451a-29b4-08d6c3530e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 16:38:00.3812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3496
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dev86-native dependency
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
X-List-Received-Date: Wed, 17 Apr 2019 19:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5B94F87268F2D4EB177376CA9E52A8B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhhbmtzIE1hcmsgYW5kIENocmlzLg0KDQpJIGFwcGxpZWQgdGhlIHBhdGNoIGZyb20gQ2hyaXMg
YW5kIHdhcyBhYmxlIHRvIGJ1aWxkIGZvciBhcm0uDQoNCkFsc28sIGFzIE1hcmsgc2FpZCBiaXRi
YWtlIC1lIHhlbiByZXR1cm5lZCB0aGUgZm9sbG93aW5nIGZvciB0aGUgT1ZFUlJJREVTIHdpdGgg
dGhlIGFhcmNoNjQuDQoNCk9WRVJSSURFUz0ibGludXg6YWFyY2g2NDpwbi14ZW46ZnZwOmFhcmNo
NjQ6cG9reTpjbGFzcy10YXJnZXQ6bGliYy1nbGliYzpmb3JjZXZhcmlhYmxlIg0KDQoNClJlZ2Fy
ZHMsDQpTYXRoZWVzDQoNCu+7v09uIDE3LzA0LzIwMTksIDEzOjM3LCAiTS4gQXNzZWxzdGluZSIg
PGFzc2Vsc21AbWNtYXN0ZXIuY2E+IHdyb3RlOg0KDQogICAgT24gVHVlLCBBcHIgMTYsIDIwMTkg
YXQgNDo1MSBQTSBDaHJpc3RvcGhlciBDbGFyaw0KICAgIDxjaHJpc3RvcGhlci53LmNsYXJrQGdt
YWlsLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gT24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgNjo0
NyBQTSBNLiBBc3NlbHN0aW5lIDxhc3NlbHNtQG1jbWFzdGVyLmNhPiB3cm90ZToNCiAgICA+ID4g
T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgOTowNSBQTSBTYXRoZWVzIEJhbHlhIDxTYXRoZWVzLkJh
bHlhQGFybS5jb20+IHdyb3RlOg0KICAgID4gPiA+IEhpLA0KICAgID4gPiA+DQogICAgPiA+ID4g
VGhlIHhlbiByZWNpcGUgaGFzIGEgaGFyZCBkZXBlbmRlbmN5IG9uIGRldjg2LW5hdGl2ZSBwYWNr
YWdlIChtZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi5pbmMpLiBJ
dCBkb2VzIG5vdCBhbGxvdyB1cyB0byBidWlsZCBmb3IgYWFyY2g2NCBuYXRpdmVseSBmb3IgQXJt
LiBBdCB0aGUgbW9tZW50LCB3ZSBoYXZlIGEgd29ya2Fyb3VuZCBpbiB0aGUgYmJhcHBlbmQgZmls
ZSBmb3IgeGVuIHRvIHJlbW92ZSB0aGUgZGVwZW5kZW5jeS4NCiAgICA+ID4gPg0KICAgID4gPiA+
IERFUEVORFNfcmVtb3ZlID0gImRldjg2LW5hdGl2ZSINCiAgICA+ID4gPg0KICAgID4gPiA+IENh
biB0aGUgcmVjaXBlIGJlIG1hZGUgZ2VuZXJpYyBzbyB0aGF0IGJvdGggeDg2IGFuZCBBcm0gY2Fu
IGJlIGJ1aWx0IHdpdGhvdXQgdGhlIG5lZWQgZm9yIHRoZSBhYm92ZSB3b3JrYXJvdW5kPyBUaGFu
a3MuDQogICAgPiA+DQogICAgPiA+IEkgYW0gbm90IHN1cmUgSSBhbSBmb2xsb3dpbmcgeW91IGNv
cnJlY3RseS4gQnV0IEkgYmVsaWV2ZSB3aGF0IHlvdSBhcmUNCiAgICA+ID4gbG9va2luZyBmb3Ig
aXMgdG8gZHJvcCAiZGV2ODYtbmF0aXZlIiBmcm9tIERFUEVORFMsIHdoZXJlIGl0IGlzDQogICAg
PiA+IGN1cnJlbnRseSBsaXN0ZWQsIGFuZCBpbnN0ZWFkIGxpc3QgaXQgaW4gc29tZXRoaW5nIGxp
a2UNCiAgICA+ID4NCiAgICA+ID4gREVQRU5EU194ODYgPSAiZGV2ODYtbmF0aXZlIg0KICAgID4g
Pg0KICAgID4gPiBpbiB0aGUgeGVuLmluYyBmaWxlLiBpZS4gbWFrZSB1c2Ugb2YgdGhlIG92ZXJy
aWRlcyBtZWNoYW5pc20gdG8gb25seQ0KICAgID4gPiByZXF1aXJlIGl0IGZvciB4ODYgYXJjaC4g
QW0gSSBjbG9zZT8NCiAgICA+DQogICAgPiBTdWdnZXN0OiByZXBsYWNlIHRoZSBzdHJpbmcgJ2Rl
djg2LW5hdGl2ZScgd2l0aGluIHhlbi5pbmMncyBERVBFTkRTDQogICAgPiBkZWZpbml0aW9uIHdp
dGg6DQogICAgPg0KICAgID4gJHtAYmIudXRpbHMuY29udGFpbnMoJ1hFTl9UQVJHRVRfQVJDSCcs
ICd4ODZfNjQnLCAnZGV2ODYtbmF0aXZlJywgJycsIGQpfQ0KDQogICAgRG9lcyBYRU5fVEFSR0VU
X0FSQ0ggZXZlciBhY3R1YWxseSBkZXZpYXRlIGZyb20gVEFSR0VUX0FSQ0g/IEkgZG8NCiAgICBw
cmVmZXIgdXNpbmcgdGhlIG92ZXJyaWRlcyBhcyBpdCB0ZW5kcyB0byBiZSBvdmVyYWxsIG1vcmUg
Y2xlYXIgdG8NCiAgICByZWFkLCBidXQgdGhlIHdpbGwgd29yayB0b28uDQoNCiAgICBTYXRoZWVz
LCB0aGVyZSBpc24ndCBtdWNoIHRvIHRoZSBvdmVycmlkZXMsIGRvIGEgJ2JpdGJha2UgLWUgeGVu
JyBhbmQNCiAgICBwaXBlIHRoZSBvdXRwdXQgdG8gYSBmaWxlLiBUaGVuIHNlYXJjaCBmb3IgIk9W
RVJSSURFUyIgYW5kIHlvdSBzaG91bGQNCiAgICBmaW5kIGEgbGlzdCBvZiBvdmVycmlkZSB3b3Jk
cywgYXBwZW5kaW5nIG9uZSBvZiB0aGVzZSB3b3JkcyB0byBhDQogICAgdmFyaWFibGUgc3VjaCBh
cyBERVBFTkRTIHdpbGwgb25seSBzZXQgdGhlIGFzc2lnbm1lbnQgaWYgdGhlIG92ZXJyaWRlDQog
ICAgaXMgcHJlc2VudC4gUmVhZCBhIGZldyB0dXRvcmlhbHMgYW5kIGV4YW1pbmUgc29tZSBleGFt
cGxlcyBhbmQgeW91DQogICAgc2hvdWxkIGJlIGFibGUgdG8gc29ydCBpdCBvdXQgcmF0aGVyIHF1
aWNrbHkuDQoNCiAgICBNYXJrQQ0KDQogICAgPg0KICAgID4gd2hpY2ggd2lsbCB0b2dnbGUgdGhl
IHJlcXVpcmVtZW50IGZvciB0aGUgZGV2ODYtbmF0aXZlIHRvb2xzIGJhc2VkIG9uDQogICAgPiB0
aGUgdGFyZ2V0IGFyY2ggdGhlIGh5cGVydmlzb3IgaXMgYmVpbmcgYnVpbHQgZm9yLg0KICAgID4g
SWYgdGhhdCBsb29rcyBPSywgSSBjYW4gc2VuZCBhIHBhdGNoIG9uIHRvcCBvZiB0aGUgNC4xMiB2
ZXJzaW9uIHVwcmV2DQogICAgPiB0aGF0IEkganVzdCBwb3N0ZWQuDQogICAgPg0KICAgID4gQ2hy
aXN0b3BoZXINCiAgICA+DQogICAgPiA+DQogICAgPiA+IE1hcmtBDQogICAgPiA+DQogICAgPiA+
ID4NCiAgICA+ID4gPg0KICAgID4gPiA+DQogICAgPiA+ID4NCiAgICA+ID4gPiBSZWdhcmRzLA0K
ICAgID4gPiA+DQogICAgPiA+ID4gU2F0aGVlcw0KICAgID4gPiA+DQogICAgPiA+ID4gSU1QT1JU
QU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50
cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1t
ZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBl
cnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3Jt
YXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0KICAgID4gPiA+IC0tDQogICAgPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAgICA+ID4g
PiBtZXRhLXZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KICAgID4gPiA+IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KICAgID4gPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQogICAgPiA+IC0tDQogICAg
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogICAg
PiA+IG1ldGEtdmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0DQogICAgPiA+IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KICAgID4gPiBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0KDQoNCklNUE9SVEFOVCBOT1RJ
Q0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNv
bmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVz
ZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGlu
IGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==


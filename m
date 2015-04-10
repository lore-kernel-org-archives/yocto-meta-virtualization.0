Return-Path: <Petr.Gotthard@Honeywell.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B45DE009A1; Fri, 10 Apr 2015 13:44:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [65.55.169.125 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1063 seconds by postgrey-1.32 at yocto-www;
	Fri, 10 Apr 2015 13:44:30 PDT
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0125.outbound.protection.outlook.com [65.55.169.125])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E428E00961
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 13:44:30 -0700 (PDT)
Received: from BN1PR07CA0076.namprd07.prod.outlook.com (10.255.193.51) by
	SN1PR07MB1470.namprd07.prod.outlook.com (25.161.223.144) with Microsoft
	SMTP Server (TLS) id 15.1.136.25; Fri, 10 Apr 2015 20:11:26 +0000
Received: from BN1BFFO11FD049.protection.gbl (2a01:111:f400:7c10::1:131) by
	BN1PR07CA0076.outlook.office365.com (2a01:111:e400:45::51) with
	Microsoft SMTP Server (TLS) id 15.1.136.25 via Frontend Transport;
	Fri, 10 Apr 2015 20:11:25 +0000
Authentication-Results: spf=neutral (sender IP is 199.61.26.154)
	smtp.mailfrom=Honeywell.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
Received-SPF: Neutral (protection.outlook.com: 199.61.26.154 is neither
	permitted nor denied by domain of Honeywell.com)
Received: from DE08W1026.honeywell.com (199.61.26.154) by
	BN1BFFO11FD049.mail.protection.outlook.com (10.58.145.4) with Microsoft
	SMTP Server (TLS) id 15.1.142.12 via Frontend Transport;
	Fri, 10 Apr 2015 20:11:25 +0000
Received: from de08ex5002.global.ds.honeywell.com (10.216.34.43) by
	DE08W1026.honeywell.com (10.221.248.37) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Apr 2015 16:11:07 -0400
Received: from DE08W1303.global.ds.honeywell.com ([169.254.10.149]) by
	de08ex5002.global.ds.honeywell.com ([10.216.14.57]) with mapi id
	14.03.0224.002; Fri, 10 Apr 2015 16:11:08 -0400
From: "Gotthard, Petr" <Petr.Gotthard@Honeywell.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] interest to integrate virt-manager?
Thread-Index: AdBzgTeokLzcb9BhTomfkSnn/kh0qgANfR2AAAQH3qA=
Date: Fri, 10 Apr 2015 20:11:06 +0000
Message-ID: <F9E85480F62349458DF67CE8BA000D8D4076DE74@DE08W1303.global.ds.honeywell.com>
References: <F9E85480F62349458DF67CE8BA000D8D4076D50F@DE08W1303.global.ds.honeywell.com>
	<CADkTA4NsatnZUvVxPZFap=O33LPkhTa0rLJwhE4oPSQ-07+tzw@mail.gmail.com>
In-Reply-To: <CADkTA4NsatnZUvVxPZFap=O33LPkhTa0rLJwhE4oPSQ-07+tzw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.130.180]
MIME-Version: 1.0
X-CFilter-Loop: Forwarded
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.61.26.154; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(52044002)(377424004)(199003)(377454003)(189002)(51704005)(13464003)(24454002)(51164003)(2656002)(87936001)(15975445007)(77096005)(102836002)(19580395003)(19580405001)(76176999)(47776003)(2900100001)(2950100001)(92566002)(2920100001)(86362001)(50466002)(77156002)(33656002)(16796002)(106466001)(105586002)(110136001)(62966003)(6806004)(50986999)(54356999)(46102003)(23676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR07MB1470;
	H:DE08W1026.honeywell.com; FPR:; SPF:Neutral; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR07MB1470;
X-Microsoft-Antispam-PRVS: <SN1PR07MB1470D71D93B3A3921B1E62A9F8FA0@SN1PR07MB1470.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:SN1PR07MB1470; BCL:0;
	PCL:0; RULEID:; SRVR:SN1PR07MB1470; 
X-Forefront-PRVS: 054231DC40
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2015 20:11:25.4765 (UTC)
X-MS-Exchange-CrossTenant-Id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
	Ip=[199.61.26.154]; Helo=[DE08W1026.honeywell.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB1470
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: interest to integrate virt-manager?
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
X-List-Received-Date: Fri, 10 Apr 2015 20:44:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aG91Z2h0IEkgd2FzIG5vdCB0aGUgb25seSBvbmUgdHJ5aW5nIHRvIG1ha2UgdGhpcyB3b3Jr
aW5nLiA7LSkNCg0KKDEpIEkgbWFkZSBhIHRlbXBvcmFyeSBnaXRodWIgcmVwb3NpdG9yeSB3aXRo
IG15IHdvcmsNCmh0dHBzOi8vZ2l0aHViLmNvbS9nb3R0aGFyZHAvcmVjaXBlcy12aXJ0LW1hbmFn
ZXINCkl0J3Mgbm90IGEgc3RhbmRhbG9uZSBsYXllcjsgeW91IG5lZWQgaXMgdG8gY2xvbmUgdGhp
cyBpbnRvIG1ldGEtdmlydHVhbGl6YXRpb24gKG9yIGFueSBvdGhlciBsYXllcikuDQoNCigyKSBJ
dCByZXF1aXJlcyBweXRob24gc3VwcG9ydCBpbiBsaWJ4bWwyLCB3aGljaCB3YXMgbm90IGVuYWJs
ZWQgYnkgZGVmYXVsdCBpbiB0aGUgZGl6enkgcmVsZWFzZS4gVGhlcmUgaXMgYWxyZWFkeSBhIHBh
dGNoIGZvciB0aGF0IEknbSB1c2luZzoNCmh0dHA6Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9y
Zy9wYXRjaC84MjQwNy8NCkkgYWxzbyBoYWQgdG8gZW5hYmxlIHB5dGhvbiBpbiBsaWJ4bWwyIGV4
cGxpY2l0bHkgaW4gbXkgbG9jYWwuY29uZiwgYnV0IEkgc3VzcGVjdCB0aGVyZSBpcyBhIGJldHRl
ciB3YXkNClBBQ0tBR0VDT05GSUdfYXBwZW5kX3BuLWxpYnhtbDIgPSAiIHB5dGhvbiINClBBQ0tB
R0VDT05GSUdfYXBwZW5kX3BuLWxpYnhtbDItbmF0aXZlID0gIiBweXRob24iDQoNCigzKSBJbiBh
ZGRpdGlvbiB0byB0aGF0LCB0aGUgbWV0YS12aXJ0dWFsaXphdGlvbi9yZWNpcGVzLWV4dGVuZGVk
L2ZvbnRjb25maWcgaGFzIG9uZSBtaW5vciBidWcgdGhhdCBuZWVkcyB0byBiZSBmaXhlZC4gSSB1
c2UgdGhlIGZvbGxvd2luZyBwYXRjaCAoYWdhaW4sIHRoaXMgbWF5IG5vdCBiZSB0aGUgY2xlYW5l
c3Qgd2F5KQ0KDQpkaWZmIC11IG9sZC9mb250Y29uZmlnLnBjLmluIG5ldy9mb250Y29uZmlnLnBj
LmluDQotLS0gb2xkL2ZvbnRjb25maWcucGMuaW4gICAgICAgIDIwMTQtMDEtMjAgMDk6MTQ6MjAu
MDAwMDAwMDAwICswMTAwDQorKysgbmV3L2ZvbnRjb25maWcucGMuaW4gICAgICAgIDIwMTUtMDMt
MjUgMTA6NDI6MzguMjg1OTcwNTc1ICswMTAwDQpAQCAtMTUsNCArMTUsNCBAQA0KIFJlcXVpcmVz
LnByaXZhdGU6IEBQS0dDT05GSUdfUkVRVUlSRVNfUFJJVkFURUxZQA0KIExpYnM6IC1MJHtsaWJk
aXJ9IC1sZm9udGNvbmZpZw0KIExpYnMucHJpdmF0ZTogQEVYUEFUX0xJQlNAIEBGUkVFVFlQRV9M
SUJTQCBASUNPTlZfTElCU0AgQExJQlhNTDJfTElCU0ANCi1DZmxhZ3M6IC1JJHtpbmNsdWRlZGly
fSBARVhQQVRfQ0ZMQUdTQCBARlJFRVRZUEVfQ0ZMQUdTQCBASUNPTlZfQ0ZMQUdTQCBATElCWE1M
Ml9DRkxBR1NADQorQ2ZsYWdzOiAtSSR7aW5jbHVkZWRpcn0gQEVYUEFUX0NGTEFHU0AgLUkke2lu
Y2x1ZGVkaXJ9L2ZyZWV0eXBlMiBASUNPTlZfQ0ZMQUdTQCBATElCWE1MMl9DRkxBR1NADQoNCih0
aGUgZ2VuZXJhdGVkIGZvbmNvbmZpZy5wYyBjb250YWlucyBwYXRocyB0byB0aGUgYnVpbGRpbmcg
bWFjaGluZTsgSSBzdXNwZWN0IHRoZSAqLnBjLmluIHNob3VsZCBub3QgaW5jbHVkZSBhbnkgQE1B
Q1JPU0ApDQoNCg0KVGhhdCdzIGFsbC4gTm93IHlvdSBzaG91bGQgYmUgYWJsZSB0byBidWlsZCB0
aGUgdmlydC1tYW5hZ2VyLiBJJ20gdXNpbmcgdGhlIGRpenp5IHJlbGVhc2Ugb2YgcG9reS4gSWYg
aXQgZG9lcyBub3Qgd29yayBmb3IgeW91LCBwbGVhc2UgbGV0IG1lIGtub3c7IEkgd2VudCB0aHJv
dWdoIHNldmVyYWwgdHJvdWJsZXMsIHNvIEkgbWF5IGtub3cgYSBzb2x1dGlvbi4NCg0KSXQgd291
bGQgYmUgZ3JlYXQgaWYgdGhpcyBnZXQgZXZlbnR1YWxseSBtZXJnZWQgaW50byBtZXRhLXZpcnQu
DQoNCg0KQ2hlZXJzLA0KUGV0cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
QnJ1Y2UgQXNoZmllbGQgW21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dIA0KU2VudDog
MTAuIGR1Ym5hIDIwMTUgMTU6NTMNClRvOiBHb3R0aGFyZCwgUGV0cg0KQ2M6IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0
aW9uXSBpbnRlcmVzdCB0byBpbnRlZ3JhdGUgdmlydC1tYW5hZ2VyPw0KDQpPbiBGcmksIEFwciAx
MCwgMjAxNSBhdCA4OjE5IEFNLCBHb3R0aGFyZCwgUGV0cg0KPFBldHIuR290dGhhcmRAaG9uZXl3
ZWxsLmNvbT4gd3JvdGU6DQo+IEhlbGxvLA0KPg0KPg0KPg0KPiBJIG1hbmFnZWQgdG8gYnVpbGQg
dmlydC1tYW5hZ2VyIChwbHVzIHZpcnQtdmlld2VyIGFuZCB0aGUgdmlydC0qIHNjaXB0cykgZm9y
DQo+IFlvY3RvLCBzbyBJIHdvbmRlciBpZiB5b3Ugd291bGQgYmUgaW50ZXJlc3RlZCB0byBpbnRl
Z3JhdGUgdGhlIHZpcnQtbWFuYWdlcg0KPiAoYW5kIHJlbGF0ZWQgYml0YmFrZSByZWNpcGVzKSBp
bnRvIHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uPyBPciBpcyB0aGVyZQ0KPiBhbm90aGVyIHJlY29t
bWVuZGVkIGdyYXBoaWNhbCBtYW5hZ2VyIGZvciBLVk0/DQoNCkknbSBkZWZpbml0ZWx5IGludGVy
ZXN0ZWQgLi4gc2VlIGJlbG93Lg0KDQo+DQo+IGh0dHBzOi8vdmlydC1tYW5hZ2VyLm9yZy8NCj4N
Cj4NCj4NCj4gTmV3IHZpcnQtbWFuYWdlciByZWxlYXNlcyB1bmZvcnR1bmF0ZWx5IHJlcXVpcmUg
cHl0aG9uLXB5Z29iamVjdCAzLjAsIHdoaWNoDQo+IGlzIChzZWVtcyB0byBiZSkgbm90IHN1cHBv
cnRlZCBpbiBZb2N0byAoeWV0KS4gSSB3YW50ZWQgdG8gYXZvaWQgdGhlIEdPYmplY3QNCj4gSW50
cm9zcGVjdGlvbiAoZGVwZW5kZW5jeSBvbiBtZXRhLWdpciksIHNvIEkgaGF2ZSBzY3JpcHRzIGZv
ciB2aXJ0LW1hbmFnZXINCj4gMC45LjUgb25seSwgd2hpY2ggaXMgdGhlIGxhdGVzdCBHVEsyIHJl
bGVhc2UuIChJdOKAmXMgYmV0dGVyIHRoYW4gbm90aGluZy4pDQoNCjopDQoNCldlIGFsc28gaGF2
ZSB2aXJ0LW1hbmFnZXIgcmVjaXBlcyBhbmQgdW5jb21wbGV0ZWQgd29yayBoZXJlLCBpdCBzbGFt
bWVkDQppbnRvIGctaS1yIGFuZCBzdG9wcGVkIC4uIG5lZWRpbmcgb24gdGFyZ2V0IGNvbXBpbGF0
aW9uIHRvIGZpbmlzaCB0aGUgcGFja2FnaW5nDQpvZiB2aXJ0LW1hbmFnZXIuDQoNClNvIEkgZmVl
bCB5b3VyIHBhaW4hDQoNCkF0IHNvbWUgcG9pbnQsIHdlIHdpbGwgbmVlZCB0byBmaWd1cmUgdGhp
cyBvdXQsIGJ1dCBoYXZpbmcgYW4gb2xkZXIgdmVyc2lvbiBpbg0KdGhlIHRyZWUgdW50aWwgdGhh
dCBoYXBwZW5zIG1ha2VzIGEgbG90IG9mIHNlbnNlLg0KDQpJJ2xsIGNvbXBhcmUgd2hhdCB5b3Ug
aGF2ZSB2ZXJzdXMgdGhvc2Ugb3RoZXIgY2hhbmdlcywgYW5kIHNlZSB3aGF0IHdlIGNhbg0KcHVs
bCB0b2dldGhlci4NCg0KPg0KPg0KPg0KPiBTaGFsbCBJIGp1c3QgcG9zdCB0aGUgLmJiIGZpbGVz
IChvciBhIGxvbmcgbGlzdCBvZiBwYXRjaGVzKSwgb3Igd291bGQgeW91DQo+IHByZWZlciBhbm90
aGVyIGFwcHJvYWNoPyBUaGUgdmlydC1tYW5hZ2VyIGRlcGVuZHMgb24gZ3RrLXZuYyBhbmQgZmV3
DQoNClBvc3QgdGhlIGJiIGZpbGVzLiBJZiB5b3Ugd2FudCB0byBjYXB0dXJlIGFueSBzaWduaWZp
Y2FudCBwb2ludHMgaW4NCnlvdXIgZGV2ZWxvcG1lbnQNCmhpc3RvcnksIGZlZWwgZnJlZSB0byBz
cGxpdCB0aGUgcGF0Y2hlcy4gQnV0IG90aGVyd2lzZSwgcG9zdCBhIHNlcmllcyB0aGF0IGlzDQpj
bGVhbiwgYW5kIGludHJvZHVjZXMgdGhlIHJlY2lwZXMgZnJvbSBzY3JhdGNoIGRpcmVjdGx5IHRv
IGEgd29ya2luZyB2ZXJzaW9uLg0KDQo+IHB5dGhvbi0qIHBhY2thZ2VzIHRoYXQgSSBhbHNvIGhh
ZCB0byBjcmVhdGUuIFNob3VsZCB0aGUgbmV3IHB5dGhvbi0qDQo+IHBhY2thZ2VzIHJlcXVpcmVk
IGJ5IHZpcnQtbWFuYWdlciBnbyBhbHNvIGludG8gbWV0YS12aXJ0dWFsaXphdGlvbiAoYXMgbm8N
Cj4gb25lIGVsc2UgaXMgYXBwYXJlbnRseSB1c2luZyB0aGVtKSwgb3Igc2hhbGwgdGhlc2UgZ28g
aW50byBzb21lIG90aGVyIGxheWVyPw0KDQpTdGFydCB0aGVtIGluIG1ldGEtdmlydCwgZm9yIGlu
aXRpYWwgaW50cm9kdWN0aW9uIEkgcHJlZmVyIHRvIGhhdmUNCnN1cHBvcnQgcHl0aG9uDQpsaWJy
YXJpZXMgbmVhciB0aGUgY29kZSB0aGF0IGFjdHVhbGx5IGV4ZXJjaXNlcyB0aGVtIQ0KDQpCcnVj
ZQ0KDQo+DQo+DQo+DQo+IFBsZWFzZSBhZHZpc2UuDQo+DQo+DQo+DQo+DQo+DQo+IENoZWVycywN
Cj4NCj4gUGV0cg0KPg0KPg0KPg0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBtZXRhLXZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dA0KPiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0
cy55b2N0b3Byb2plY3Qub3JnL2xpc3RpbmZvL21ldGEtdmlydHVhbGl6YXRpb24NCj4NCg0KDQoN
Ci0tIA0KIlRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3Mg
YW5kIG1hZG5lc3MgYXdhaXQNCnRoZWUgYXQgaXRzIGVuZCINCg==


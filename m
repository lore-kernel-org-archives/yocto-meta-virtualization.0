Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E70FE00CEE; Thu, 18 Apr 2019 18:18:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EB9BE0088B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 18:18:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3J1IO9I016335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Apr 2019 18:18:24 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Thu, 18 Apr 2019 18:18:23 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Kang, Kai"
	<Kai.Kang@windriver.com>
Thread-Topic: [meta-virtualization][m-c-s][PATCH] glusterfs/librdmacm: fix
	dependency issue with libibverbs
Thread-Index: AQHU9eiElcHzLT4kGESJdDyxHvOHmaZCrh1A
Date: Fri, 19 Apr 2019 01:18:23 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F37827F3@ALA-MBD.corp.ad.wrs.com>
References: <20190417075133.84331-1-kai.kang@windriver.com>
	<CADkTA4M2_79fvZSOuDisnKhe69O1ehKJUs0Y0Gg9CAh0Z59U2w@mail.gmail.com>
In-Reply-To: <CADkTA4M2_79fvZSOuDisnKhe69O1ehKJUs0Y0Gg9CAh0Z59U2w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.209.216]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] glusterfs/librdmacm: fix dependency issue with libibverbs
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
X-List-Received-Date: Fri, 19 Apr 2019 01:18:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29tbWVudHMgaW5saW5lLCBwcmVjZWRlZCBieSBbSm9lIFNsYXRlcl0uICBTb3JyeSwgYnV0IEkn
bSB1c2luZyBvdXRsb29rLi4uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBC
cnVjZSBBc2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0gDQpTZW50OiBU
aHVyc2RheSwgQXByaWwgMTgsIDIwMTkgNjoxMyBBTQ0KVG86IEthbmcsIEthaQ0KQ2M6IG1ldGEt
dmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZzsgU2xhdGVyLCBKb3NlcGgNClN1YmplY3Q6
IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bbS1jLXNdW1BBVENIXSBnbHVzdGVyZnMvbGlicmRt
YWNtOiBmaXggZGVwZW5kZW5jeSBpc3N1ZSB3aXRoIGxpYmlidmVyYnMNCg0KT24gV2VkLCBBcHIg
MTcsIDIwMTkgYXQgMzo1MSBBTSA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+DQo+
IEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KPg0KPiBnbHVzdGVyZnMg
YW5kIGxpYnJkbWFjbSBkZXBlbmQgb24gbGliaWJ2ZXJicy4gQnV0IGxpYmlidmVyYnMgaGFzIGJl
ZW4NCj4gc2V0IGltY29tcGF0aWJsZSB3aXRoIG1pcHNhcmNoIGFuZCBhcm0uIFVwZGF0ZSBnbHVz
dGVyZnMgYW5kIGxpYnJkbWFjbQ0KPiBhY2NvcmRpbmdseS4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
S2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgcmVjaXBlcy1leHRl
bmRlZC9nbHVzdGVyZnMvZ2x1c3RlcmZzLmluYyAgICAgIHwgMyArKysNCj4gIHJlY2lwZXMtZXh0
ZW5kZWQvbGlicmRtYWNtL2xpYnJkbWFjbV8xLjEuMC5iYiB8IDMgKysrDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRl
ZC9nbHVzdGVyZnMvZ2x1c3RlcmZzLmluYyBiL3JlY2lwZXMtZXh0ZW5kZWQvZ2x1c3RlcmZzL2ds
dXN0ZXJmcy5pbmMNCj4gaW5kZXggNTg0M2Q3YzYuLjNmYzA0ZmZiIDEwMDY0NA0KPiAtLS0gYS9y
ZWNpcGVzLWV4dGVuZGVkL2dsdXN0ZXJmcy9nbHVzdGVyZnMuaW5jDQo+ICsrKyBiL3JlY2lwZXMt
ZXh0ZW5kZWQvZ2x1c3RlcmZzL2dsdXN0ZXJmcy5pbmMNCj4gQEAgLTUxLDYgKzUxLDkgQEAgRVhU
UkFfT0VDT05GID0gImFjX2N2X2ZpbGVfX2V0Y19kZWJpYW5fdmVyc2lvbj1ubyBcDQo+ICAgICAg
ICAgICAgICAgICAiDQo+DQo+ICBQQUNLQUdFQ09ORklHID8/PSAiZ2VvcmVwbGljYXRpb24gbGli
aWJ2ZXJicyINCj4gK1BBQ0tBR0VDT05GSUdfcmVtb3ZlX21pcHNhcmNoID0gImxpYmlidmVyYnMi
DQo+ICtQQUNLQUdFQ09ORklHX3JlbW92ZV9hcm0gPSAibGliaWJ2ZXJicyINCg0KW0pvZSBTbGF0
ZXJdIA0KQmVjYXVzZSB0aGlzIHJlbW92ZXMgbGliaWJ2ZXJicyBmcm9tIGFsbCBQQUNLQUdFQ09O
RydzLCAgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc2V0IHRoZSBsYXp5IGRlZmF1bHQg
dmlhIGEgbG9jYWwgdmFyaWFibGUuDQoNCj4gKw0KPiAgUEFDS0FHRUNPTkZJR1tiZC14bGF0b3Jd
ID0gIi0tZW5hYmxlLWJkLXhsYXRvciwtLWRpc2FibGUtYmQteGxhdG9yLGx2bTIsIg0KPiAgUEFD
S0FHRUNPTkZJR1tkZWJ1Z10gPSAiLS1lbmFibGUtZGVidWcsLS1kaXNhYmxlLWRlYnVnLCwiDQo+
ICBQQUNLQUdFQ09ORklHW2dlb3JlcGxpY2F0aW9uXSA9ICItLWVuYWJsZS1nZW9yZXBsaWNhdGlv
biwtLWRpc2FibGUtZ2VvcmVwbGljYXRpb24sLHJzeW5jIg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBl
cy1leHRlbmRlZC9saWJyZG1hY20vbGlicmRtYWNtXzEuMS4wLmJiIGIvcmVjaXBlcy1leHRlbmRl
ZC9saWJyZG1hY20vbGlicmRtYWNtXzEuMS4wLmJiDQo+IGluZGV4IDMwYTBjOTQzLi5lZGY5MmYw
MSAxMDA2NDQNCj4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC9saWJyZG1hY20vbGlicmRtYWNtXzEu
MS4wLmJiDQo+ICsrKyBiL3JlY2lwZXMtZXh0ZW5kZWQvbGlicmRtYWNtL2xpYnJkbWFjbV8xLjEu
MC5iYg0KPiBAQCAtMzksMyArMzksNiBAQCBkb19pbnN0YWxsX2FwcGVuZCgpIHsNCj4gICAgICAg
ICAgcm0gLWYgJHtEfSR7bGliZGlyfS9saWJyZG1hY20ubGENCj4gICAgICAgICAgcm0gLWYgJHtE
fSR7bGliZGlyfS9yc29ja2V0L2xpYnJzcHJlbG9hZC5sYQ0KPiAgfQ0KPiArDQo+ICtDT01QQVRJ
QkxFX0hPU1RfbWlwc2FyY2ggPSAibm9uZSINCj4gK0NPTVBBVElCTEVfSE9TVF9hcm0gPSAibm9u
ZSINCltKb2UgU2xhdGVyXSANCk1heWJlIGFuIGV4Y2x1c2lvbiBmb3Igd29ybGQgd291bGQgYmUg
YmV0dGVyLCBiZWNhdXNlIHRoaXMgcmVzdHJpY3Rpb24gd2lsbCBiZSBnb25lIHdoZW4gdGhlIGxp
YmlidmVyYnMgcHJvdmlkZXIgaXMgZml4ZWQuDQoNClRoaXMgc2hvdWxkIGJlIGEgc2VwYXJhdGUg
Y29tbWl0LiBXZSBzaG91bGRuJ3QgbWl4IHRoZSBkZWZhdWx0DQpwYWNrYWdlY29uZmlnIGNoYW5n
ZQ0KYW5kIHRoZSBtYXJraW5nIG9mIGxpYnJkbWFjbSBhcyBpbmNvbXBhdGlibGUgd2l0aCBtaXBz
L2FybSBpbnRvIHRoZSBzYW1lIGNvbW1pdC4NCg0KSW4gcGFydGljdWxhciwgc2luY2UgSSdkIGxp
a2UgdGhlIGVycm9yIG1lc3NhZ2UgeW91IGdldCBpZiBsaWJyZG1hY20NCmlzIGNvbXBpbGVkIGZv
ciBhcm0vbWlwcw0KdG8gYmUgbG9nZ2VkIGluIHRoZSBjb21taXQgd2hlcmUgd2UgbWFrZSBpdCBp
bmNvbXBhdGlibGUuDQoNCkJydWNlDQoNCj4gLS0NCj4gMi4yMC4wDQo+DQoNCg0KLS0gDQotIFRo
b3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5l
c3MgYXdhaXQNCnRoZWUgYXQgaXRzIGVuZA0KLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5k
YWxmLCBTdGFyIFRyZWsgSUkNCg==


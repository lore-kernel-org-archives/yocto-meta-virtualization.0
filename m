Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4F88E00D68; Tue,  3 Sep 2019 16:52:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5791E00D67
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 16:52:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,464,1559491200"; d="scan'208";a="74784635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 07:52:48 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EA6FE4CE14E7;
	Wed,  4 Sep 2019 07:52:47 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Wed, 4 Sep 2019 07:52:54 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH] python-glanceclient: upgrade
	2.8.0 -> 2.16.0
Thread-Index: AQHVYYUXylLJpJN/0UO7wbkNEGwY26cZ5+UAgAC5+PA=
Date: Tue, 3 Sep 2019 23:52:55 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6D526@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1567425189-118862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAPuovELN1S+uxOTkdaE=-SohXru1fAdcN1hstGhriTHoTNVb6g@mail.gmail.com>
In-Reply-To: <CAPuovELN1S+uxOTkdaE=-SohXru1fAdcN1hstGhriTHoTNVb6g@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: EA6FE4CE14E7.AF560
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-glanceclient: upgrade 2.8.0 -> 2.16.0
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
X-List-Received-Date: Tue, 03 Sep 2019 23:52:51 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VG8gTWFyaw0KDQo+IFdoYXQncyB3aXRoIHRoZSBleHRyYSBjaHVybiBoZXJl
PyBXYXMgdGhlIG1vdmluZyBhcm91bmQgb2YgbGluZXMgZGVsaWJlcmF0ZSwg
aWYNCj4gc28gaXQgbmVlZHMgdG8gYmUgY292ZXJlZCBpbiB0aGUgbG9uZyBs
b2cuIElmIG5vdCB5b3Ugc2hvdWxkIGF2b2lkIHRoaXMgYXMgaXQgaXMgc2lt
aWxhcg0KPiB0byBtaXhpbmcgcmVhbCBjaGFuZ2VzIGFuZCBub24tcmVhbCBj
aGFuZ2VzLCBpdCBvbmx5IHNlcnZlcyB0byBtYWtlIHRoZSByZXZpZXcNCj4g
bW9yZSBkaWZmaWN1bHQuDQo+IA0KPiBNYXJrQQ0KDQpTb3Jyee+8jEkgd2ls
bCBiZSBjYXJlZnVsIG5leHQgdGltZS4NCg0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClpoZW5nIFJ1b3Fp
bg0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwg
THRkLihGTlNUKQ0KQUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJl
IEF2ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpNQUlM
IDogemhlbmdycS5mbnN0QGNuLmZ1amlzdHUuY29tDQoNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUg
W21haWx0bzptYXJrLmFzc2Vsc3RpbmVAd2luZHJpdmVyLmNvbV0NCj4gU2Vu
dDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMDQsIDIwMTkgNDo0NiBBTQ0KPiBU
bzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24u
ZnVqaXRzdS5jb20+DQo+IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uIDxtZXRh
LXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1BBVENIXSBweXRob24tZ2xh
bmNlY2xpZW50OiB1cGdyYWRlIDIuOC4wIC0+DQo+IDIuMTYuMA0KPiANCj4g
T24gTW9uLCBTZXAgMiwgMjAxOSBhdCA3OjUzIEFNIFpoZW5nIFJ1b3FpbiA8
emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0
QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcHl0aG9uL3B5
dGhvbi1nbGFuY2VjbGllbnRfZ2l0LmJiICAgICAgICAgIHwgMTggKysrKysr
KystLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLWdsYW5jZWNsaWVudF9naXQuYmINCj4gPiBiL21ldGEtb3BlbnN0
YWNrL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1nbGFuY2VjbGll
bnRfZ2l0LmJiDQo+ID4gaW5kZXggMDBlYTJhYi4uZTgyOGNiYSAxMDA2NDQN
Cj4gPiAtLS0NCj4gPiBhL21ldGEtb3BlbnN0YWNrL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbi1nbGFuY2VjbGllbnRfZ2l0LmJiDQo+ID4gKysr
IGIvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uLWdsYW5jZWNsaWVudF9naXQuYg0KPiA+ICsrKyBiDQo+ID4gQEAgLTMs
MjIgKzMsMjAgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5zdGFjay9weXRob24tDQo+IGdsYW5jZWNsaWVudCINCj4gPiAgU0VDVElP
TiA9ICJkZXZlbC9weXRob24iDQo+ID4gIExJQ0VOU0UgPSAiQXBhY2hlLTIu
MCINCj4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5T
RTttZDU9MzQ0MDBiNjgwNzJkNzEwZmVjZDBhMjk0MGEwZDE2NTgiDQo+ID4g
K1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9vcGVuc3RhY2svcHl0aG9u
LWdsYW5jZWNsaWVudC5naXQgXA0KPiA+ICsgICAgICAgICAgIGZpbGU6Ly9n
bGFuY2UtYXBpLWNoZWNrLnNoIFwNCj4gPiArICAgICAgICAiDQo+ID4gKw0K
PiA+ICtQViA9ICIyLjE2LjArZ2l0JHtTUkNQVn0iDQo+ID4gK1NSQ1JFViA9
ICI0NGE0ZGJkNmNlMjY0MmRhZWFjYTlmNDVhYzk5ZTJkMWIzOWU4MDVhIg0K
PiA+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ICsNCj4gPiAgREVQRU5E
UyArPSAiIFwNCj4gPiAgICAgICAgICBnbXAgXA0KPiA+ICAgICAgICAgIHB5
dGhvbi1waXAgXA0KPiA+ICAgICAgICAgIHB5dGhvbi1wYnIgXA0KPiA+ICAg
ICAgICAgICINCj4gPg0KPiA+IC1TUkNSRVYgPSAiMTNiMjVmZjFmZWQ5MDhj
ZmU3YjRlNzE5YTk3ZWZkNzEyMWUzYmU5NiINCj4gPiAtUFYgPSAiMi44LjAr
Z2l0JHtTUkNQVn0iDQo+ID4gLQ0KPiA+IC1TUkNfVVJJID0gIlwNCj4gPiAt
ICAgICAgIGdpdDovL2dpdGh1Yi5jb20vb3BlbnN0YWNrLyR7QlBOfS5naXQ7
YnJhbmNoPXN0YWJsZS9waWtlIFwNCj4gPiAtICAgICAgIGZpbGU6Ly9nbGFu
Y2UtYXBpLWNoZWNrLnNoIFwNCj4gPiAtICAgICAgICINCj4gPiAtDQo+ID4g
LVMgPSAiJHtXT1JLRElSfS9naXQiDQo+IA0KPiBXaGF0J3Mgd2l0aCB0aGUg
ZXh0cmEgY2h1cm4gaGVyZT8gV2FzIHRoZSBtb3ZpbmcgYXJvdW5kIG9mIGxp
bmVzIGRlbGliZXJhdGUsIGlmDQo+IHNvIGl0IG5lZWRzIHRvIGJlIGNvdmVy
ZWQgaW4gdGhlIGxvbmcgbG9nLiBJZiBub3QgeW91IHNob3VsZCBhdm9pZCB0
aGlzIGFzIGl0IGlzIHNpbWlsYXINCj4gdG8gbWl4aW5nIHJlYWwgY2hhbmdl
cyBhbmQgbm9uLXJlYWwgY2hhbmdlcywgaXQgb25seSBzZXJ2ZXMgdG8gbWFr
ZSB0aGUgcmV2aWV3DQo+IG1vcmUgZGlmZmljdWx0Lg0KPiANCj4gTWFya0EN
Cj4gDQo+ID4gLQ0KPiA+ICBpbmhlcml0IHNldHVwdG9vbHMgbW9uaXRvciBy
bWFyZ3BhcnNlDQo+ID4NCj4gPiAgRklMRVNfJHtQTn0gKz0gIiR7ZGF0YWRp
cn0vJHtTUkNOQU1FfSINCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+ID4N
Cj4gPg0KPiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBtZXRhLXZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdA0KPiA+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9w
cm9qZWN0Lm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9saXN0aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQo+IA0KDQoKCg==


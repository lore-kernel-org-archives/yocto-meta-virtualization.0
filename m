Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80174E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:18:02 -0800 (PST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jan 2013 06:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="283603944"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2013 06:17:55 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.20]) with mapi id
	14.01.0355.002; Tue, 29 Jan 2013 14:17:53 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: =?utf-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 2/2] qemu: Enabled VGA output
Thread-Index: AQHN/iX7zQgzs3KhqkyVgty9Yj/ExphgVByAgAAEwQCAAAFEwA==
Date: Tue, 29 Jan 2013 14:17:53 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF916754@IRSMSX101.ger.corp.intel.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
	<1359464500-16993-2-git-send-email-mihai.prica@intel.com>
	<5107D0DF.6040006@gmail.com>
	<CADkTA4OsbnmQCZ+2wkPjY6hoq-ZHE4PSt1ozYgsb=9Ur0Fcfqg@mail.gmail.com>
	<5107D8A6.6090900@gmail.com>
In-Reply-To: <5107D8A6.6090900@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] qemu: Enabled VGA output
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
X-List-Received-Date: Tue, 29 Jan 2013 14:18:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBOeXN0csO2bSBbbWFp
bHRvOmRhdmlkLmMubnlzdHJvbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkg
MjksIDIwMTMgNDoxMiBQTQ0KPiBUbzogQnJ1Y2UgQXNoZmllbGQNCj4gQ2M6IFByaWNhLCBNaWhh
aTsgbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
bWV0YS12aXJ0dWFsaXphdGlvbl0gW1BBVENIIDIvMl0gcWVtdTogRW5hYmxlZCBWR0Egb3V0cHV0
DQo+IA0KPiBPbiBUdWUgMjkgSmFuIDIwMTMgMDI6NTQ6NDkgUE0gQ0VULCBCcnVjZSBBc2hmaWVs
ZCB3cm90ZToNCj4gPiBPbiBUdWUsIEphbiAyOSwgMjAxMyBhdCA4OjM4IEFNLCBEYXZpZCBOeXN0
csO2bQ0KPiA8ZGF2aWQuYy5ueXN0cm9tQGdtYWlsLmNvbT53cm90ZToNCj4gPg0KPiA+PiBPbiAw
MS8yOS8yMDEzIDAyOjAxIFBNLCBNaWhhaSBQcmljYSB3cm90ZToNCj4gPj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IE1paGFpIFByaWNhIDxtaWhhaS5wcmljYUBpbnRlbC5jb20+DQo+ID4+PiAtLS0N
Cj4gPj4+ICAgIHJlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEuKiozLjAuYmJhcHBlbmQgfCAg
ICAzICsrKw0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEuKiozLjAu
YmJhcHBlbmQNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXVfKioxLjMuMC5iYmFwcGVuZA0KPiA+Pj4gYi9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dV8qKjEuMy4wLmJiYXBwZW5kDQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5k
ZXggMDAwMDAwMC4uMjEwNjgyNQ0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4gKysrIGIvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXVfKioxLjMuMC5iYmFwcGVuZA0KPiA+Pj4gQEAgLTAsMCAr
MSwzIEBADQo+ID4+PiArIyBFbmFibGVzIFFFTVUgdG8gZGlzcGxheSB0aGUgVkdBIG91dHB1dCBE
RVBFTkRTX2FwcGVuZCA9ICIgbGlic2RsIg0KPiA+Pj4gK1NETCA9ICItLWVuYWJsZS1zZGwiDQo+
ID4+Pg0KPiA+Pj4NCj4gPj4gU2hvdWxkIHRoaXMgcmVhbGx5IGJlIGluIG1ldGEtdmlydCwgdGhp
cyBzZWVtcyBhIGJpdCBkaXN0cm8gc3BlY2lmaWMgPw0KPiA+Pg0KPiA+DQo+ID4gQ2FuIFBBQ0tB
R0VDT05GSUcgb3IgYSBESVNUUk9fRkVBVFVSRVMgaGVscCBoZXJlID8gU0RMIGZvciBxZW11IGlz
DQo+ID4gcHJvYmFibHkgYSBiYWQgZXhhbXBsZSwgYnV0IGtlZXBpbmcgZXZlcnl0aGluZyB0aGF0
IHdlIHRoaW5rIGlzDQo+ID4gaW1wb3J0YW50IGZvciBvdXQgb2YgYm94IGV4cGVyaWVuY2UsIG9y
IHByb3BlciBvcGVyYXRpb24sIGNvbnRhaW5lZA0KPiA+IHdpdGhpbiBhIGxheWVyIGlzIGEgZ29v
ZCB0aGluZyAuLiBidXQgbGVhdmluZyBpdCBjb25kaXRpb25hbCBvbiBhDQo+ID4gZGlzdHJvIHNl
dHRpbmcgZm9yIHRob3NlIHRoYXQgcmVhbGx5IGRvbid0IHdhbnQgaXQsIHNlZW1zIHRvIHN0cmlr
ZQ0KPiA+IHRoZSByaWdodCBiYWxhbmNlLg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gQnJ1
Y2UNCj4gDQo+IEFncmVlLCBidXQgZXZlbiBpbiB0aGlzIGNhc2UsIHRoaXMgaXMgc29tZXRoaW5n
IGZvciBvZS1jb3JlIHRvIGZhY2lsaXRhdGUgaW4gdGhlDQo+IHFlbXUgcmVjaXBlLg0KPiBEb24n
dCBnZXQgbWUgd3JvbmcsIEknbSBub3QgbWlsaXRhbnQgYWJvdXQgYW55dGhpbmcsIGJ1dCBJIHdv
dWxkIHJhdGhlciBsaWtlIHRvDQo+IGF2b2lkIGJiYXBwZW5kcyB3aGVuIHBvc3NpYmxlLCBpZiBv
ZS1jb3JlIHdvbid0IGFjY2VwdCBhIFBBQ0tBR0VDT05GSUcNCj4gZW5hYmxpbmcgc2RsLCB0aGVu
IGxldHMgdGhlIG1lcmdlIGl0IGhlcmUuDQoNClllcywgeW91J3JlIHJpZ2h0LCB0aGF04oCZcyB0
aGUgcmlnaHQgd2F5IHRvIGdvLg0KSSdsbCB0d2VhayB0aGUgcGF0Y2ggd2l0aCBQQUNLQUdFQ09O
RklHIG9yIERJU1RST19GRUFUVVJFUyBhbmQgc2VlIGlmIHRoaXMgY2FuIGJlIG1lcmdlZCB0byBv
ZS1jb3JlIGFuZCBrZWVwIHlvdSB1cGRhdGVkLg0KDQpUaGFua3MsDQpNaWhhaQ0KDQo+IA0KPiBC
ciwNCj4gRGF2aWQNCg==


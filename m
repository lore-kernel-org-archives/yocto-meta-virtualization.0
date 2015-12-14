Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 233A5E00C0E; Sun, 13 Dec 2015 17:46:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AF04E0070F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Dec 2015 17:46:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1528087"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Dec 2015 09:46:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4247E41890EE;
	Mon, 14 Dec 2015 09:46:20 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Mon, 14 Dec 2015 09:46:20 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] Help (python-jsonschema do_compile Failed)
Thread-Index: AdEtjiHMEMtadIP6TMil2kBjIxC82wFiahkAAL2DDtA=
Date: Mon, 14 Dec 2015 01:46:19 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8014090843F@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E8011BCDCE58@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CAPuovELJU9_nEBkP90HjexOctVSfs5Pc72f6FdvdkaKy3hywpQ@mail.gmail.com>
In-Reply-To: <CAPuovELJU9_nEBkP90HjexOctVSfs5Pc72f6FdvdkaKy3hywpQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.98]
MIME-Version: 1.0
X-yoursite-MailScanner-Information: Please contact the ISP for more information
X-yoursite-MailScanner-ID: 4247E41890EE.A6989
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Help (python-jsonschema do_compile Failed)
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
X-List-Received-Date: Mon, 14 Dec 2015 01:46:48 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hcmsgYW5kIGFsbCwNCg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGhl
bHAuDQoNCj4+IFdoZW4gSSBiaXRiYWtlIHB5dGhvbi1qc29uc2NoZW1hLHRo
ZSBlcnJvciBpcyBvY2N1cnJlZCBpbiB0aGUgc3RlcCBvZg0KPj4gZG9fY29t
cGlsZSBhcyBmb2xsb3dpbmc6DQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+DQo+PiBERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1bmN0
aW9uIGRvX2NvbXBpbGUNCj4+DQo+PiBEb3dubG9hZCBlcnJvciBvbiBodHRw
czovL3B5cGkucHl0aG9uLm9yZy9zaW1wbGUvdmN2ZXJzaW9uZXIvOiBbRXJy
bm8NCj4+IC01XSBObyBhZGRyZXNzIGFzc29jaWF0ZWQgd2l0aCBob3N0bmFt
ZSAtLSBTb21lIHBhY2thZ2VzIG1heSBub3QgYmUgZm91bmQhDQo+Pg0KPj4g
Q291bGRuJ3QgZmluZCBpbmRleCBwYWdlIGZvciAndmN2ZXJzaW9uZXInICht
YXliZSBtaXNzcGVsbGVkPykNCj4+DQo+PiBEb3dubG9hZCBlcnJvciBvbiBo
dHRwczovL3B5cGkucHl0aG9uLm9yZy9zaW1wbGUvOiBbRXJybm8gLTVdIE5v
DQo+PiBhZGRyZXNzIGFzc29jaWF0ZWQgd2l0aCBob3N0bmFtZSAtLSBTb21l
IHBhY2thZ2VzIG1heSBub3QgYmUgZm91bmQhDQo+Pg0KPj4gTm8gbG9jYWwg
cGFja2FnZXMgb3IgZG93bmxvYWQgbGlua3MgZm91bmQgZm9yIHZjdmVyc2lv
bmVyDQo+Pg0KPj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3Qp
Og0KPj4NCj4+ICAgRmlsZSAic2V0dXAucHkiLCBsaW5lIDQ0LCBpbiA8bW9k
dWxlPg0KPj4NCj4+IHZjdmVyc2lvbmVyPXsidmVyc2lvbl9tb2R1bGVfcGF0
aHMiIDogWyJqc29uc2NoZW1hL192ZXJzaW9uLnB5Il19LA0KPj4NCj4+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+DQo+PiBJZiB5b3Ug
a25vdyBob3cgdG8gZml4IGl0LCBQbGVhc2UgdGVsbCBtZS4NCj4NCj5BIGRv
d25sb2FkIGVycm9yIGR1cmluZyBkb19jb21waWxlKCkuIE15IGd1ZXNzIGlz
IHRoYXQgd2UgaGF2ZSBhIG1pc3NpbmcNCj5kZXBlbmRlbmN5LiBXaXRoIHB5
dGhvbiwgUnVieSBhbmQgc29tZSBvdGhlciBwYWNrYWdlcyB3ZSBoYXZlIHRv
IGJlIGNhcmVmdWwNCj5hcyB0aGVpciBidWlsZHMgd2lsbCBhY3R1YWxseSBj
YXVzZSBkb3dubG9hZHMgdG8gaGFwcGVuIGlmIGEgZGVwZW5kZW5jeSBpcyBt
aXNzaW5nDQo+KHB5dGhvbiB3aWxsIGZldGNoIGVnZ3MsIHJ1Ynkgd2lsbCBm
ZXRjaCBnZW1zLi4uKS4gV2hlbiBJIGhhdmUgdGltZSBJIHVzdWFsbHkgZG8N
Cj5idWlsZHMgd2l0aCBJUCB0YWJsZXMgcnVsZXMgaW4gcGxhY2UgdG8gZm9y
Y2UgZXJyb3JzIHdoZW4gdGhlc2UgZmV0Y2hlcyBoYXBwZW4gc28NCj50aGF0
IEkgY2FuIGNhdGNoIHRoZW0gYW5kIGZpeCB0aGVtLiBEb3dubG9hZHMgc2hv
dWxkIG9ubHkgYmUgZG9uZSBieSB0aGUgZmV0Y2hlcg0KPmFuZCBub3QgYnVu
ZGxlciwgcGRiIGV0Yy4gSWYgeW91IHNlZSBhbiBlcnJvciBhYm91dCBkb3du
bG9hZGluZyBhbmQgeW91IGFyZSBub3QNCj5pbiBkb19mZXRjaCgpIHNvbWV0
aGluZyBpcyB3cm9uZy4NCj4NCj5TdGFydCBieSBhZGRpbmcgcHl0aG9uLXZj
dmVyc2lvbmVyIGFzIGEgREVQRU5EUyBpbiBweXRob24tanNvbnNjaGVtYSBh
bmQgeW91DQo+c2hvdWxkIGJlIGdvb2QgdG8gZ28uDQo+DQoNClRoZSBweXRo
b24tdmN2ZXJzaW9uZXIgaXMgYWxyZWFkeSBhcyBhIERFUEVORFMgaW4gcHl0
aG9uLWpzb25zY2hlbWEsIGFuZA0KSXQgaXMgc3RpbGwgZmFpbGVkLg0KDQpQ
ZXJoYXBzIGl0IGlzIHRoZSBwcm9ibGVtIGFib3V0IHByb3h5IHNldC4NCg0K
V2hlbiBJIGJpdGJha2UgcHl0aG9uLWpzb25zY2hlbWEsIHRoZSBlcnJvciBv
Y2N1cnMgaW4gdGhlIHN0ZXAgb2YgZG9fY29tcGlsZSwNCkJ1dCB3aGVuIEkg
aW50byBkaXJlY3RvcnkgInB5dGhvbi1qc29uc2NoZW1hLzIuNS4xLXIwL2pz
b25zY2hlbWEtMi41LjEvICIsIGFuZCBydW4uZG9fY29tcGxpZSwgbm8gZXJy
b3JzIG9jY3VyLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gDQok
IGNkIGJ1aWxkLXg4Nl82NC90bXAvd29yay94ODZfNjQgLWxpbnV4L3B5dGhv
bi1qc29uc2NoZW1hLzIuNS4xLXIwL2pzb25zY2hlbWEtMi41LjEvDQokIC4u
L3RlbXAvcnVuLmRvX2NvbXBpbGUNCnppcF9zYWZlIGZsYWcgbm90IHNldDsg
YW5hbHl6aW5nIGFyY2hpdmUgY29udGVudHMuLi4NCg0KSW5zdGFsbGVkICoq
Ki93b3JrL3g4Nl82NCAtbGludXgvcHl0aG9uLWpzb25zY2hlbWEvMi41LjEt
cjAvanNvbnNjaGVtYS0yLjUuMS8uZWdncy92Y3ZlcnNpb25lci0yLjE0LjAu
MC1weTIuNy5lZ2cNCnJ1bm5pbmcgYnVpbGQNCnJ1bm5pbmcgYnVpbGRfcHkN
CmNyZWF0aW5nIGJ1aWxkDQpjcmVhdGluZyBidWlsZC9saWINCmNyZWF0aW5n
IGJ1aWxkL2xpYi9qc29uc2NoZW1hDQouLi4uLi4NCiQgZWNobyAkPw0KMA0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIA0KDQpBbmQgSSBo
YXZlIHByb3h5IHNldCBpbiB+Ly53Z2V0cmMgbGlrZSB0aGlzOg0KaHR0cF9w
cm94eSA9IGh0dHA6Ly9yZXAucHJveHkubmljLmZ1aml0c3UuY29tOjgwODAv
DQpmdHBfcHJveHkgPSBodHRwOi8vcmVwLnByb3h5Lm5pYy5mdWppdHN1LmNv
bTo4MDgwLw0KaHR0cHNfcHJveHk9aHR0cHM6Ly9yZXAucHJveHkubmljLmZ1
aml0c3UuY29tOjgwODAvDQoNCklmIHlvdSBrbm93IGhvdyB0byBmaXggaXQs
IHBsZWFzZSBoZWxwIG1lLg0KDQpSZWdhcmRzLA0KTGkNCgoK


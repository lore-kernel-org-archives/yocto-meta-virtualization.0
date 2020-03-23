Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.49375.1584958956990532309
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 03:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bexkRdKy;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2780; q=dns/txt; s=axis-central1;
  t=1584958957; x=1616494957;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iMuu6EqvvftatfCOUtxQ9Sul8jM4QHQ/SnGJWwxJ/zE=;
  b=bexkRdKyDgJQKdB7vRm5oYN6cmqK+FWgE9QsBHdWkEHY4vOMXWtXBT3p
   H559Uh5rPZ93dOsyAtIuZGIz3MFX2naMtXpnTFMGu1bFUzW+jef2sfAQg
   AurRlKGBRSRFG4WbvSKDqfqE+fDXxR5oi2AQOMUnAziERREELYDSrkMEj
   RnCB38xoRoN31xzcH7J1nOSKFt4N/G7XjM002koCKPt+uAtL+mbc5d4MZ
   CTiaukCoDxZQLwJg8jthGdZIb/c3RO0NO3gvXyEJxyzfNdYsQvQQu03ni
   BjRrc+/kAW4zO6bAjJjwg7lmNvSIl4HSe5klqCvUyMKKJxsoMzZtXFM1l
   w==;
IronPort-SDR: jP34O8Y7muyJPtKKKsLCVM0oal0hXNmW1IbN53YTHcPRPefIv8j2xWsMNHUwxoeGP1VDVAAdiv
 ePK5dzZ+uCEVhS6COTIBhShWZ/Ux17LcXgtw3ARn2Q+9sNAzlm2NV/ooaBsiq6w5arrNL/aXwg
 jGWRQzUMcOXT+O6cCHgWZ09ToTkj+dTBuL2GSXFMNCO1lpW6AVtvxbfdzjuEV81G/guMjAGuyF
 D+AKy//iBoNhQ8+zCNrG+bhuhy4UvkS7lGHD9K5dxs5ciAjPdjykZQmSNjWoV+UFVVrvUEL0Q+
 8f4=
X-IronPort-AV: E=Sophos;i="5.72,296,1580770800"; 
   d="scan'208";a="6809485"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Joakim Roubert <Joakim.Roubert@axis.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] go: Enable different target dir by using variable
Thread-Topic: [meta-virtualization][PATCH] go: Enable different target dir by
 using variable
Thread-Index: AQHV/sjw7wTsy5KOhEygzeyCTzULVqhR0+SggAFk44CAApk4AIAAJ7Mg
Date: Mon, 23 Mar 2020 10:22:34 +0000
Message-ID: <18d10d5f69024b409b43975643c361a4@XBOX03.axis.com>
References: <20200320095124.3297-1-joakimr@axis.com>
 <7eba015ce34d41618ff6ed2d738b1696@XBOX03.axis.com>
 <CADkTA4P+oixEyD1XU9BuERrdTPHCFoPt-RCJNEwzt41Dhg_ghg@mail.gmail.com>
 <d237395c-a7a0-b647-3fb4-8088b87cd313@axis.com>
In-Reply-To: <d237395c-a7a0-b647-3fb4-8088b87cd313@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGVhc2llc3Qgc29sdXRpb24gdG8gYXZvaWQgaGF2aW5nIHRoZSB0YXJnZXQgcGFja2FnZXMg
aW5zdGFsbCBnbyANCmNvZGUgaW4gL3Vzci9sb2NhbC9nby9zcmMgd291bGQgYmUgdG8gY2hhbmdl
Og0KDQpGSUxFU18ke1BOfSArPSAiJHtwcmVmaXh9L2xvY2FsL2dvL3NyYy8ke1BLR19OQU1FfS8q
Ig0KDQp0bzoNCg0KRklMRVNfJHtQTn0tZGV2ICs9ICIke3ByZWZpeH0vbG9jYWwvZ28vc3JjIg0K
DQppbiBhbGwgcmVjaXBlcyBpbiByZWNpcGVzLWRldnRvb2xzIGFuZCByZWNpcGVzLWNvbnRhaW5l
cnMuDQoNCkFuZCBpZiBhbnlvbmUgd29uZGVycyB3aHkgd2UgaGF2ZSBhIFFBIHN0ZXAgdGhhdCBm
YWlscyB0aGUgcGFja2FnZSANCnRhc2sgaWYgYW55dGhpbmcgaXMgaW5zdGFsbGVkIHRvIC91c3Iv
bG9jYWwsIGl0IGlzIGJlY2F1c2Ugd2UgdXNlIA0KL3Vzci9sb2NhbCB0byBtb3VudCBhIHdyaXRh
YmxlIGZsYXNoIHBhcnRpdGlvbiB0aGVyZSAobWF5YmUgbm90IA0KdGhlIGJlc3QgZGVjaXNpb24s
IGJ1dCBpdCBzdGVtcyBiYWNrIHRvIGxvbmcgYmVmb3JlIHdlIHN0YXJ0ZWQgdXNpbmcgDQpiaXRi
YWtlKS4gVGh1cyBpdCB3b3VsZCBoaWRlIGFueXRoaW5nIGluc3RhbGxlZCBpbiAvdXNyL2xvY2Fs
IGluIHRoZSANCnJvb3Rmcy4NCg0KLy9QZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEpvYWtpbSBSb3ViZXJ0IDxKb2FraW0uUm91YmVydEBheGlzLmNvbT4NCj4g
U2VudDogZGVuIDIzIG1hcnMgMjAyMCAwOTo1MQ0KPiBUbzogQnJ1Y2UgQXNoZmllbGQgPGJydWNl
LmFzaGZpZWxkQGdtYWlsLmNvbT47IFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0hdIGdv
OiBFbmFibGUgZGlmZmVyZW50IHRhcmdldCBkaXINCj4gYnkgdXNpbmcgdmFyaWFibGUNCj4gDQo+
IE9uIDIwMjAtMDMtMjEgMTg6MTAsIEJydWNlIEFzaGZpZWxkIHdyb3RlOg0KPiA+DQo+ID4gSm9h
a2ltOiBpcyB0aGlzIHdoYXQgaXMgaGFwcGVuaW5nIHRvIHlvdSA/IFRoZXkgYXJlIGluIHRoZSBE
RVBFTkRTLA0KPiA+IGFuZCBoZW5jZSBnZXQgdGhlIFBOwqAgUkRFUEVORFMsIHRoZW4gYXJlIGlu
c3RhbGxlZCB0byB0YXJnZXQsIGFuZCB0aGF0DQo+ID4gaXMgY2F1c2luZyB5b3UgaXNzdWVzID8N
Cj4gDQo+IEkgYW0gd29ya2luZyBpbiBhIGJ1aWxkIGVudmlyb25tZW50IHNldCB1cCBieSBQZXRl
ciAmIGM6bywgd2hlcmUgdGhlcmUNCj4gaXMgYSBob29rIHJ1biBhdCB0aGUgZW5kIHRoYXQgd2ls
bCBmYWlsIGlmIGEgcGFja2FnZSBpbnN0YWxscyB0aGluZ3MgdG8NCj4gL3Vzci9sb2NhbC4gRm9y
IG1lIHRoYXQgaXMgYW4gaXNzdWUgd2hlbiBJIGJ1aWxkIGRvY2tlci1jZSwgc2luY2UNCj4gZG9j
a2VyLWNlIHdpbGwgdHJpZ2dlciB0aGVzZSBnbyBwYWNrYWdlcyBhbmQgSSBuZWVkIHRoZW0gbm90
IHRvIHB1dA0KPiBhbnl0aGluZyBpbiAvdXNyL2xvY2FsIGZvciB0aGUgYnVpbGQgdG8gcGFzcyB0
aGF0IGNoZWNrLiBGcm9tIG15IHZpZXcsDQo+IGl0IGRvZXMgbm90IHJlYWxseSBtYXR0ZXIgaG93
IHRoaW5ncyBhcmUgc29sdmVkLCBhcyBsb25nIGFzIEkgY2FuIGJ1aWxkDQo+IGRvY2tlci1jZS4g
V2hpY2ggSSBjYW5ub3Qgd2l0aCB0aGUgY3VycmVudCBtZXRhLXZpcnR1YWxpemF0aW9uIGluIG91
cg0KPiBidWlsZCBlbnZpcm9ubWVudC4NCj4gDQo+IEJSLA0KPiANCj4gL0pvYWtpbQ0KPiAtLQ0K
PiBKb2FraW0gUm91YmVydA0KPiBTZW5pb3IgRW5naW5lZXINCj4gDQo+IEF4aXMgQ29tbXVuaWNh
dGlvbnMgQUINCj4gRW1kYWxhdsOkZ2VuIDE0LCBTRS0yMjMgNjkgTHVuZCwgU3dlZGVuDQo+IFRl
bDogKzQ2IDQ2IDI3MiAxOCAwMCwgVGVsIChkaXJlY3QpOiArNDYgNDYgMjcyIDI3IDQ4DQo+IEZh
eDogKzQ2IDQ2IDEzIDYxIDMwLCB3d3cuYXhpcy5jb20NCg0K

Return-Path: <Tudor.Florea@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECA30E00825; Tue, 17 Feb 2015 04:12:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id EAD06E0080C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Feb 2015 04:12:48 -0800 (PST)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Tue, 17 Feb 2015 13:12:46 +0100
From: Tudor Florea <Tudor.Florea@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 1/1] tgt: Do not install the
	conflicting config files
Thread-Index: AQHQR9hIzS9yWJ2e30iNA0OsHJMEk5z0O1IAgAB11cA=
Date: Tue, 17 Feb 2015 12:12:45 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428B6ED4E@SESTOEX04.enea.se>
References: <1423864730-7582-1-git-send-email-tudor.florea@enea.com>
	<CADkTA4O-NuW2qwd-VgSz8o4CKrPKQPDx07PRus_WNw+qyiqqKg@mail.gmail.com>
In-Reply-To: <CADkTA4O-NuW2qwd-VgSz8o4CKrPKQPDx07PRus_WNw+qyiqqKg@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.15.34]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] tgt: Do not install the conflicting config files
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
X-List-Received-Date: Tue, 17 Feb 2015 12:12:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQg
W21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1
YXJ5IDE3LCAyMDE1IDA2OjU1DQo+IFRvOiBUdWRvciBGbG9yZWENCj4gQ2M6IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6
YXRpb25dIFtQQVRDSCAxLzFdIHRndDogRG8gbm90IGluc3RhbGwgdGhlDQo+IGNvbmZsaWN0aW5n
IGNvbmZpZyBmaWxlcw0KPiANCj4gT24gRnJpLCBGZWIgMTMsIDIwMTUgYXQgNDo1OCBQTSwgVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+DQo+IHdyb3RlOg0KPiA+IERvIG5vdCBp
bnN0YWxsIHRoZSAoZW1wdHkpIGNvbmZpZyBmaWxlcyBhcyBpdCB3aWxsDQo+ID4gY29uZmxpY3Qg
d2l0aCB0aGUgcmVhbCBjb25maWcgZmlsZSBpbnN0YWxsZWQgYnkgcHl0aG9uLWNpbmRlciBwYWNr
YWdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFA
ZW5lYS5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtb3BlbnN0YWNrL3JlY2lwZXMtc3VwcG9ydC90
Z3QvdGd0X2dpdC5iYiB8IDQgKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vcGVuc3RhY2sv
cmVjaXBlcy1zdXBwb3J0L3RndC90Z3RfZ2l0LmJiIGIvbWV0YS0NCj4gb3BlbnN0YWNrL3JlY2lw
ZXMtc3VwcG9ydC90Z3QvdGd0X2dpdC5iYg0KPiA+IGluZGV4IDhiZTlmZTQuLmI3OWNjY2MgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1zdXBwb3J0L3RndC90Z3RfZ2l0
LmJiDQo+ID4gKysrIGIvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1zdXBwb3J0L3RndC90Z3RfZ2l0
LmJiDQo+ID4gQEAgLTIyLDcgKzIyLDkgQEAgZG9fY29tcGlsZSgpIHsNCj4gPiAgfQ0KPiA+DQo+
ID4gIGRvX2luc3RhbGwoKSB7DQo+ID4gLSAgICBvZV9ydW5tYWtlIC1lIERFU1RESVI9IiR7RH0i
IGluc3RhbGwtcHJvZ3JhbXMgaW5zdGFsbC1jb25mIGluc3RhbGwtDQo+IHNjcmlwdHMNCj4gPiAr
ICAgICNza2lwIG9lX3J1bm1ha2UgaW5zdGFsbC1jb25mLiBUaGUgKGVtcHR5KSB0YXJnZXRzLmNv
bmYgZmlsZSB3aWxsIGNvbmZpbGN0DQo+IHdpdGgNCj4gDQo+IFR5cG86ICJjb25mbGljdCIuDQo+
IA0KPiA+ICsgICAgI3RoZSByZWFsIGZpbGUgcHJvdmlkZWQgYnkgcHl0aG9uLWNpbmRlcg0KPiA+
ICsgICAgb2VfcnVubWFrZSAtZSBERVNURElSPSIke0R9IiBpbnN0YWxsLXByb2dyYW1zIGluc3Rh
bGwtc2NyaXB0cw0KPiANCj4gLi4gYnV0IEknbSBub3QgY29udmluY2VkIG9mIHRoaXMgY2hhbmdl
LiBXaGVuIHlvdSBzYXkgImNvbmZsaWN0IiwgYXJlDQo+IHlvdSBnZXR0aW5nIGENCj4gcGFja2Fn
aW5nIGVycm9yIHRoYXQgSSdtIG5vdCBzZWVpbmcgaW4gbXkgYnVpbGRzLCBvciBzb21ldGhpbmcg
ZWxzZSA/DQpbVHVkb3IgRmxvcmVhXSBUaGUgZXJyb3IgSSdtIGdldHRpbmcgaXM6DQoqIGNoZWNr
X2RhdGFfZmlsZV9jbGFzaGVzOiBQYWNrYWdlIHRndCB3YW50cyB0byBpbnN0YWxsIGZpbGUgIDxw
YXRoX3RvPi9vcGVuc3RhY2staW1hZ2UtY29udHJvbGxlci8xLjAtcjAvcm9vdGZzL2V0Yy90Z3Qv
dGFyZ2V0cy5jb25mDQoJQnV0IHRoYXQgZmlsZSBpcyBhbHJlYWR5IHByb3ZpZGVkIGJ5IHBhY2th
Z2UgICogcHl0aG9uLWNpbmRlcg0KICogb3BrZ19pbnN0YWxsX2NtZDogQ2Fubm90IGluc3RhbGwg
cGFja2FnZSBwYWNrYWdlZ3JvdXAtY2xvdWQtY29udHJvbGxlci4NCkVSUk9SOiBGdW5jdGlvbiBm
YWlsZWQ6IGRvX3Jvb3Rmcw0KDQo+IA0KPiBTdXJlIGJvdGggcGFja2FnZXMgbWF5IGJlIHRyeWlu
ZyB0byB3cml0ZSB0aGUgc2FtZSBmaWxlLCBidXQgSSdtIGFsc28gYXdhcmUNCj4gb2YNCj4gc2Nl
bmFyaW9zIHdoZXJlIHlvdSBtaWdodCBub3Qgd2FudCBDaW5kZXIncyBmaWxlIHRvIHRha2UgcHJl
Y2VkZW5jZS4gU28gaW4NCj4gdGhhdA0KPiBjYXNlLCB3ZSBzaG91bGQgY29uc2lkZXIgcGF0Y2hp
bmcgYW5kIHJlbmFtaW5nIHRoZSBmaWxlcywgdmVyc3VzIHNpbXBseSBub3QNCj4gaW5zdGFsbGlu
ZyB0aGVtLg0KPiANCg0KW1R1ZG9yIEZsb3JlYV0gDQpUaGUgY29udGVudCBvZiAvZXRjL3RndC90
YXJnZXRzLmNvbmYgaW5zdGFsbGVkIGZyb20gdGd0IGlzIGtpbmQgb2YgZW1wdHk6DQojIEVtcHR5
IHRhcmdldHMgY29uZmlndXJhdGlvbiBmaWxlIC0tIHBsZWFzZSBzZWUgdGhlIHBhY2thZ2UNCiMg
ZG9jdW1lbnRhdGlvbiBkaXJlY3RvcnkgZm9yIGFuIGV4YW1wbGUuDQoNClRoZSBwYXJhZGlnbSB3
aWxsIGJlIHRoZSBzYW1lIGZvciB1c2luZyAgdHdvIGRpZmZlcmVudCBpbnN0YWxsIGxvY2F0aW9u
cy4gQXQgdGhlIGVuZCB3ZSBzaG91bGQgaGF2ZSBvbmx5IG9uZSBjb25maWcgZmlsZSBuYW1lZCAv
ZXRjL3RndC90YXJnZXRzLmNvbmYuIEkgYXNzdW1lIHRoYXQgb25lIHdpbGxpbmcgdG8gdXNlIGEg
cGFydGljdWxhciBjb25maWcgd2lsbCBjcmVhdGUgYmJhcHBlbmQgZmlsZXMgZm9yIHRndCBhbmQv
b3IgcHl0aG9uLWNpbmRlciBmb3IgaGlzL2hlciBzcGVjaWZpYyBjdXN0b21pemF0aW9uLg0KSSdt
IG5vdCBwYXJ0aWN1bGFybHkgY29udGVudCBhYm91dCBteSBmaXggYnV0IEkgZG9uJ3Qga25vdyB3
aGF0IGlzIHRoZSByaWdodCB3YXkgdG8gc29sdmUgdGhpcyBraW5kIG9mIGlzc3VlLg0KUmVnYXJk
cywNCiAgVHVkb3IuDQoNCj4gQnJ1Y2UNCj4gDQo+ID4NCj4gPiAgICAgIGlmICR7QGJhc2VfY29u
dGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN2aW5pdCcsICd0cnVlJywgJ2ZhbHNlJywgZCl9
Ow0KPiB0aGVuDQo+ID4gICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9pbml0
LmQNCj4gPiAtLQ0KPiA+IDEuOS4xDQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gbWV0YS12aXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QNCj4gPiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4g
PiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXph
dGlvbg0KPiANCj4gDQo+IA0KPiAtLQ0KPiAiVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxM
IHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KPiB0aGVlIGF0IGl0cyBlbmQi
DQo=


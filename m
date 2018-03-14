Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E772E00E0A; Wed, 14 Mar 2018 06:01:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [194.138.37.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 759 seconds by postgrey-1.32 at yocto-www;
	Wed, 14 Mar 2018 06:00:58 PDT
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2904E00DB1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 06:00:58 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id w2ECmHgj015261
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 14 Mar 2018 13:48:17 +0100
Received: from DEFTHW99ERKMSX.ww902.siemens.net
	(defthw99erkmsx.ww902.siemens.net [139.22.70.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w2ECmBkC015518
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 14 Mar 2018 13:48:16 +0100
Received: from DEFTHW99ER3MSX.ww902.siemens.net (139.22.70.74) by
	DEFTHW99ERKMSX.ww902.siemens.net (139.22.70.147) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 14 Mar 2018 13:48:00 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.4]) by
	DEFTHW99ER3MSX.ww902.siemens.net ([139.22.70.74]) with mapi id
	14.03.0361.001; Wed, 14 Mar 2018 13:48:00 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] docker: make aufs dependency
	depend on distro feature
Thread-Index: AQHTu5GtZazaE7QSYE+zHFjH9pZpLqPPreyw
Date: Wed, 14 Mar 2018 12:48:00 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61735E9EF@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314083912.16564-1-pascal.bach@siemens.com>
	<CADkTA4PV1WJiK50qz0bC5eo0_jwBaM+Kb-7j=WXAuzNgw9Nwuw@mail.gmail.com>
In-Reply-To: <CADkTA4PV1WJiK50qz0bC5eo0_jwBaM+Kb-7j=WXAuzNgw9Nwuw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.35]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: make aufs dependency depend on distro feature
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
X-List-Received-Date: Wed, 14 Mar 2018 13:01:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQg
W21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IE1pdHR3b2NoLCAxNC4g
TcOkcnogMjAxOCAxMzo0MQ0KPiBUbzogQmFjaCwgUGFzY2FsIChCVCBDUFMgUiZEIFpHIEZXIEND
UCkgPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkB5
b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1BB
VENIXSBkb2NrZXI6IG1ha2UgYXVmcyBkZXBlbmRlbmN5DQo+IGRlcGVuZCBvbiBkaXN0cm8gZmVh
dHVyZQ0KPiANCj4gVGhlIHByb2JsZW0gaXMgLi4gdGhhdCB0aGlzIGlzIG5vdyBhIG1hZ2ljIGRp
c3RybyBmZWF0dXJlIHRoYXQgbm8gb25lIGtub3dzDQo+IGFib3V0Lg0KPiANCj4gQXQgYSBtaW5p
bXVtLCB0aGlzIG5ldyBkaXN0cm8gZmVhdHVyZSB1c2UgbmVlZHMgdG8gYmUgZG9jdW1lbnRlZCBp
biB0aGUNCj4gbGF5ZXJzIFJFQURNRS4NCg0KVGhpcyBjaGVjayBpcyBhbHJlYWR5IHVzZWQgaW4g
cmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fdmlydHVhbGl6YXRpb24uaW5jIHdoZXJl
IGl0IGVuYWJsZXMgYXVmcyBzdXBwb3J0IGluIHRoZSBrZXJuZWwuDQpCdXQgeW91IGFyZSByaWdo
dCB0aGlzIHNob3VsZCBiZSBkb2N1bWVudGVkIGFzIGEgZGlzdHJvIGZlYXR1cmUgZm9yIHRoaXMg
bGF5ZXIuDQoNClBhc2NhbA0KDQo+IEJydWNlDQo+IA0KPiBPbiBXZWQsIE1hciAxNCwgMjAxOCBh
dCA0OjM5IEFNLCBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+DQo+IHdyb3Rl
Og0KPiA+IE9ubHkgaW5jbHVkZSBhdWZzLXV0aWxzIGlmIHRoZSBjb3JyZXNwb25kaW5nIGRpc3Ry
byBmZWF0dXJlIGlzIGVuYWJsZWQuDQo+ID4gV2l0aG91dCB0aGF0IHRoZSBhdWZzIGtlcm5lbCBk
cml2ZXIgaXMgbm90IGluY2x1ZGVkIHRvby4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhc2Nh
bCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgcmVjaXBlcy1j
b250YWluZXJzL2RvY2tlci9kb2NrZXJfZ2l0LmJiIHwgNSArKystLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXIvZG9ja2VyX2dpdC5iYg0KPiA+IGIvcmVjaXBl
cy1jb250YWluZXJzL2RvY2tlci9kb2NrZXJfZ2l0LmJiDQo+ID4gaW5kZXggNWMyMTEzOC4uMjA2
Yzg4NCAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlcl9n
aXQuYmINCj4gPiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlcl9naXQuYmIN
Cj4gPiBAQCAtNjQsOCArNjQsOSBAQCBERVBFTkRTID0gIiBcDQo+ID4gIFBBQ0tBR0VTID0rICIk
e1BOfS1jb250cmliIg0KPiA+DQo+ID4gIERFUEVORFNfYXBwZW5kX2NsYXNzLXRhcmdldCA9ICIg
bHZtMiINCj4gPiAtUkRFUEVORFNfJHtQTn0gPSAiY3VybCBhdWZzLXV0aWwgZ2l0IHV0aWwtbGlu
dXggaXB0YWJsZXMgXA0KPiA+IC0gICAgICAgICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlu
cygnRElTVFJPX0ZFQVRVUkVTJywnc3lzdGVtZCcsJycsJ2Nncm91cC0NCj4gbGl0ZScsZCl9IFwN
Cj4gPiArUkRFUEVORFNfJHtQTn0gPSAidXRpbC1saW51eCBpcHRhYmxlcyBcDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnYXVm
cycsICdhdWZzLXV0aWwnLCAnJywgZCl9DQo+IFwNCj4gPiArICAgICAgICAgICAgICAgICAgJHtA
YmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywNCj4gPiArJycs
ICdjZ3JvdXAtbGl0ZScsIGQpfSBcDQo+ID4gICAgICAgICAgICAgICAgICAgIg0KPiA+ICBSREVQ
RU5EU18ke1BOfSArPSAidmlydHVhbC9jb250YWluZXJkIHZpcnR1YWwvcnVuYyINCj4gPg0KPiA+
IC0tDQo+ID4gMi4xMS4wDQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gbWV0YS12aXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QNCj4gPiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gPiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0K
PiANCj4gDQo+IA0KPiAtLQ0KPiAiVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50
ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlDQo+IGF0IGl0cyBlbmQiDQo=


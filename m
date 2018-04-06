Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 159B2E00B8D; Fri,  6 Apr 2018 07:23:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5863E008E4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 07:23:48 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w36ENkCc020725
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Apr 2018 16:23:47 +0200
Received: from DEFTHW99ERLMSX.ww902.siemens.net
	(defthw99erlmsx.ww902.siemens.net [139.22.70.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w36ENbSn027810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Apr 2018 16:23:46 +0200
Received: from DENBGAT9ERAMSX.ww902.siemens.net (139.22.70.89) by
	DEFTHW99ERLMSX.ww902.siemens.net (139.22.70.136) with Microsoft SMTP
	Server (TLS) id 14.3.389.1; Fri, 6 Apr 2018 16:23:37 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.244]) by
	DENBGAT9ERAMSX.ww902.siemens.net ([139.22.70.89]) with mapi id
	14.03.0389.001; Fri, 6 Apr 2018 16:23:37 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 1/2] docker-proxy: add recipe for
	docker-proxy
Thread-Index: AQHTza3x7YLqSyXEjEKBIoSIaBDRaaPzyTJQ
Date: Fri, 6 Apr 2018 14:23:36 +0000
Message-ID: <355BE46A91031048906B695426A8D8E6173922CB@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
	<CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
In-Reply-To: <CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.55]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] docker-proxy: add recipe for docker-proxy
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
X-List-Received-Date: Fri, 06 Apr 2018 14:23:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gU2VudDogRnJlaXRh
ZywgNi4gQXByaWwgMjAxOCAxNTo0OA0KPiBUbzogQmFjaCwgUGFzY2FsIChCVCBDUFMgUiZEIFpH
IEZXIENDUCkgPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXph
dGlvbkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlv
bl0gW1BBVENIIDEvMl0gZG9ja2VyLXByb3h5OiBhZGQgcmVjaXBlIGZvcg0KPiBkb2NrZXItcHJv
eHkNCj4gDQo+IE9uIEZyaSwgQXByIDYsIDIwMTggYXQgOTo0MSBBTSwgUGFzY2FsIEJhY2ggPHBh
c2NhbC5iYWNoQHNpZW1lbnMuY29tPg0KPiB3cm90ZToNCj4gPiBCZWZvcmUgZG9ja2VyLXByb3h5
IHdhcyBidWlsdCBhcyBwYXJ0IG9mIHRoZSBkb2NrZXItcmVjaXBlIGJ1dCB0aGVyZQ0KPiA+IGlu
IHNvbWUgc2l0dWF0aW9ucyB3aGVuIGJ1aWx0IGZvciB4ODZfNjQgdW5kZXIgeDg2XzY0IGl0IGlu
Y29ycmVjdGx5DQo+ID4gbGlua2VkIGFnYWluc3QgaG9zdCBsaWJyYXJpZXMuDQo+ID4gVGhpcyBw
dXRzIGl0IGludG8gYSBzZXBhcmF0ZSByZWNpcGUgdGhhdCBtYWtlcyB1c2UgdGhlIGdvLmJiY2xh
c3MgdG8NCj4gPiBidWlsZCB0aGUgYmluYXJ5IHByb3Blcmx5Lg0KPiA+DQo+IA0KPiBBcyBJIGhp
bnRlZCwgSSdtIGdvaW5nIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGludGVncmF0ZSAvIGZpeCB0aGlz
IGluIHRoZSBtYWluDQo+IGRvY2tlciByZWNpcGUuDQo+IA0KPiBIYXZpbmcgdGhlIHZhcmlvdXMg
U1JDUkVWcyBtYW5hZ2VkIGluIG11bHRpcGxlIHJlY2lwZXMgaXMgYSBtYWludGVuYW5jZQ0KPiBw
YWluIGFuZCByZWNpcGUgZm9yIHJ1bnRpbWUgZXJyb3JzLg0KPiANCj4gSSdsbCBkaWcgaW50byB3
aGF0IHRoZSBnbyBjbGFzcyBpcyBkb2luZyB0aGF0IGlzIHNvIGRpZmZlcmVudCBmcm9tIHdoYXQg
SSd2ZSBiZWVuDQo+IHRyeWluZy4NCj4gDQo+IENhbiB5b3UgcHJvdmlkZSB0aGUgb3V0cHV0IG9m
IHlvdXIgcHJvcGVybHkgbGlua2VkIGRvY2tlci1wcm94eSwgc28gSSBjYW4NCj4gdXNlIGl0IGFz
IGEgcmVmZXJlbmNlID8NCg0KSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgb3V0cHV0Pw0K
DQpQYXNjYWwNCg0KQlRXIHlvdSBjYW4gYWxzbyBwaW5nIG1lIG9uIElSQyAjeW9jdG8gYXMgYmFj
aHAgbWlnaHQgYmUgcXVpY2tlciB0byBjbGFyaWZ5DQoNCg==


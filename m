Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.269.1599844277016188869
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Sep 2020 10:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=jlEuxULK;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: peter.kjellerstedt@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5048D38C1496
	for <meta-virtualization@yoctoproject.org>; Fri, 11 Sep 2020 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2570; q=dns/txt; s=axis-central1;
  t=1599844276; x=1631380276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ypXxA7aaucLdHEC3RxYTKvp0k/24wJWrjKUhr4ivgao=;
  b=jlEuxULKB4IIUI9FmgODhbbMD4IT67eLlKfRAR6s6kL4UX1XJnCGwNWa
   jf5XNImJCgxwjzFDqaAHBkCRs4NXfxhTvVn4NSPrgEkvZ4Bo46HYBpWE9
   VEvSTJ496MRXt051V/s+QdV6+sBjx636yX82z9Ltc6dUcstt8HjZ/eQzY
   v5jparX/J2eq7KQ+Z8RgemoojkpZzhdCvB+mINk/LkJRLYSg2qR2Id6jI
   T5tSTISWldFkeBMOhOhGK1gDrnQ/dcdFBT77FMiLBUShxGpxtbycl2mJ6
   72OZhoOwrYz45vwQMmrqxQgCtlL7+bqIZb8Q/Yc0MU265oAtWu3ztLa2+
   Q==;
IronPort-SDR: ycKud+YcJYGmrC8Iebpod46uaNxM6S5odaJ+XEWtYLjRxRhPqBAMQLZ8mCw2L0V+3AIXhZRFED
 MPftYp2uYE3CY2E6z3rp0FqqETvRLl9BgBoPCgGw1RqbSr9r+GUKPRws/xlGsJtOiAqDOSryRe
 HXLCLySf/QKPAsAyD6TflcVOhox+az9dBERUSYqclfa6ImdGncrGwDuDoOWm1kpGXVQo31k/ct
 CUaievUKt/ZRLBKBmAJ9cavs/6Oob7+a+Nzo2T8E0Ra0494r6PjZdAZ3+8E7X89dVnFDeIQsQF
 vM8=
X-IronPort-AV: E=Sophos;i="5.76,416,1592863200"; 
   d="scan'208";a="12842573"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Joe Slater
	<joe.slater@windriver.com>
CC: meta-virtualization <meta-virtualization@yoctoproject.org>, Randy MacLeod
	<randy.macleod@windriver.com>
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] container-base: rename recipe
Thread-Topic: [meta-virtualization] [meta-virt][PATCH 1/1] container-base:
 rename recipe
Thread-Index: AQHWhvUSdJFlBFlKwU67AieJ47nlEKlg2+sAgALOx8A=
Date: Fri, 11 Sep 2020 17:11:14 +0000
Message-ID: <f45e74f6adb043339b97f7c328a8c79c@XBOX03.axis.com>
References: <20200909220248.17026-1-joe.slater@windriver.com>
 <CADkTA4PcUcYvC2ZG0scMOvOZcPCLzdt9VQECwZiHO_V61chNeQ@mail.gmail.com>
In-Reply-To: <CADkTA4PcUcYvC2ZG0scMOvOZcPCLzdt9VQECwZiHO_V61chNeQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLXZpcnR1YWxpemF0aW9u
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtDQo+IHZpcnR1YWxpemF0aW9uQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBCcnVjZSBBc2hmaWVsZA0KPiBTZW50OiBkZW4g
MTAgc2VwdGVtYmVyIDIwMjAgMDI6MDMNCj4gVG86IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2lu
ZHJpdmVyLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb24gPG1ldGEtdmlydHVhbGl6YXRp
b25AeW9jdG9wcm9qZWN0Lm9yZz47IFJhbmR5DQo+IE1hY0xlb2QgPHJhbmR5Lm1hY2xlb2RAd2lu
ZHJpdmVyLmNvbT4NCj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbbWV0YS12
aXJ0XVtQQVRDSCAxLzFdIGNvbnRhaW5lci1iYXNlOg0KPiByZW5hbWUgcmVjaXBlDQo+IA0KPiBF
eGNlcHQgdGhhdCB0aGlzIGJyZWFrcyBleGlzdGluZyB1c2Vycy4NCj4gDQo+IFdlJ2xsIGxlYXZl
IHRoaXMgYXMtaXMuDQoNCldlbGwsIHlvdSBjb3VsZCBhZGQgYSBuZXcgY29udGFpbmVyLWJhc2Uu
YmIgcmVjaXBlIHRoYXQgb25seSBkb2VzOg0KDQojIFRoaXMgcmVjaXBlIGlzIGRlcHJlY2F0ZWQu
IFBsZWFzZSB1c2UgY29udGFpbmVyLWJhc2UtaW1hZ2UgaW5zdGVhZA0KDQpyZXF1aXJlIGNvbnRh
aW5lci1iYXNlLWltYWdlLmJiDQoNCnRvIGNhcmUgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
LiBZb3UgY291bGQgYWxzbyBhZGQgYW4gYW5vbnltb3VzIA0KUHl0aG9uIGZ1bmN0aW9uLCBvciBw
cm9iYWJseSBiZXR0ZXIsIGhvb2sgaW50byANClJPT1RGU19QUkVQUk9DRVNTX0NPTU1BTkQsIHdp
dGggYSBiYi53YXJuKCkgYWJvdXQgdGhlIGRlcHJlY2F0aW9uIA0Kc3RhdGUgb2YgdGhlIG9sZCBu
YW1lLg0KDQpSZWdhcmRpbmcgdGhlIG5hbWUgb2YgdGhlIGltYWdlIHJlY2lwZSwgd291bGRuJ3Qg
DQoiY29udGFpbmVyLWltYWdlLWJhc2UiIGJlIG1vcmUgaW4gbGluZSB3aXRoIGV4aXN0aW5nIGlt
YWdlIHJlY2lwZXM/DQoNCj4gQnJ1Y2UNCj4gDQo+IE9uIFdlZCwgU2VwIDksIDIwMjAgYXQgNjow
MyBQTSBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gQ2hhbmdlIHRvIGNvbnRhaW5lci1iYXNlLWltYWdlIHNpbmNlIHRoZSBjb252ZW50aW9u
IGlzIHRvDQo+ID4gaGF2ZSAiaW1hZ2UiIGluIGltYWdlIHJlY2lwZSBuYW1lcy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4g
PiAtLS0NCj4gPiAgcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMve2NvbnRhaW5lci1iYXNlLmJiID0+
IGNvbnRhaW4tYmFzZS1pbWFnZS5iYn0gfCAwDQoNCkkgYmVsaWV2ZSB0aGUgaW50ZW5kZWQgbmFt
ZSB3YXMgImNvbnRhaW5lci1iYXNlLWltYWdlLmJiIj8NCg0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KPiA+ICByZW5hbWUgcmVjaXBlcy1leHRl
bmRlZC9pbWFnZXMve2NvbnRhaW5lci1iYXNlLmJiID0+IGNvbnRhaW4tYmFzZS1pbWFnZS5iYn0g
KDEwMCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMvY29u
dGFpbmVyLWJhc2UuYmIgYi9yZWNpcGVzLWV4dGVuZGVkL2ltYWdlcy9jb250YWluLWJhc2UtaW1h
Z2UuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gPiByZW5hbWUgZnJvbSByZWNpcGVz
LWV4dGVuZGVkL2ltYWdlcy9jb250YWluZXItYmFzZS5iYg0KPiA+IHJlbmFtZSB0byByZWNpcGVz
LWV4dGVuZGVkL2ltYWdlcy9jb250YWluLWJhc2UtaW1hZ2UuYmINCg0KLy9QZXRlcg0KDQo=

Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6887.1617962655940152125
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 03:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=M+V9gQ1V;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1617962656;
  x=1649498656;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RVGyjStTxiOmdJ/YRcLfV3/i+h+GEnvkZ6yOJYrF34o=;
  b=M+V9gQ1VALmkrdmTu7ulDI6VjYL1+PDkb4lRzM3BqaW62Sl/v8W+BMyn
   sdETRc0ewsjwqLJ8vd78IhN2klvjl7+nfQR5jvgLRXzMa3qU16Z6N/Esn
   GOjoxoyaXTFJ+Zm/2iL+Ly2jVljBexz96/IPDpf7t5fd0uV+jZq5HBlqh
   Btq0fE/v7/TYBu3Ko43mzDi6DbAbW4KQOO65GBivneFpz+41NGIzavMRN
   qct2mBJmqD5kKdXAqh+FamZErjt08qJC9xp1qjUWFER1Jofj/6lJFBiCj
   uPYBk/OrlzIMEMuT2MYTH9iviTeU1T792GA0tRKxHly3GF6NGx5xumhAQ
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
Thread-Topic: [meta-virtualization] "FILESEXTRAPATHS_append" error in
 openvswitch_git.bb
Thread-Index: AQHXKsg/Q8Z3ygzX2U2MhdP/3dOAVqqnS9yAgAABAgCAAAQagIAAA2mAgAABvQCAAAylAIAElHxA
Date: Fri, 9 Apr 2021 10:04:13 +0000
Message-ID: <9f36d6a2b724481d9437b425145767f3@XBOX03.axis.com>
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
	 <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
	 <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
	 <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
	 <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
	 <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
 <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>
In-Reply-To: <d9f285551e4a9265bc225e8b02c18df1e16d753e.camel@linuxfoundation.org>
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
Y3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBkZW4g
NiBhcHJpbCAyMDIxIDE1OjU5DQo+IFRvOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRA
Z21haWwuY29tPjsgUm9iZXJ0IFAuIEouIERheQ0KPiA8cnBqZGF5QGNyYXNoY291cnNlLmNhPg0K
PiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gIkZJTEVTRVhUUkFQQVRIU19hcHBlbmQiIGVy
cm9yIGluDQo+IG9wZW52c3dpdGNoX2dpdC5iYg0KPiANCj4gT24gVHVlLCAyMDIxLTA0LTA2IGF0
IDA5OjEzIC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToNCj4gPiBPbiBUdWUsIEFwciA2LCAy
MDIxIGF0IDk6MDcgQU0gUm9iZXJ0IFAuIEouIERheSA8cnBqZGF5QGNyYXNoY291cnNlLmNhPg0K
PiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDYgQXByIDIwMjEsIEJydWNlIEFzaGZpZWxk
IHdyb3RlOg0KPiA+ID4NCj4gPiA+ID4gT24gVHVlLCBBcHIgNiwgMjAyMSBhdCA4OjQwIEFNIFJv
YmVydCBQLiBKLiBEYXkNCj4gPHJwamRheUBjcmFzaGNvdXJzZS5jYT4gd3JvdGU6DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBPbiBUdWUsIDYgQXByIDIwMjEsIEJydWNlIEFzaGZpZWxkIHdyb3RlOg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUdWUsIEFwciA2LCAyMDIxIGF0IDU6MzUgQU0gUm9i
ZXJ0IFAuIEouIERheQ0KPiA8cnBqZGF5QGNyYXNoY291cnNlLmNhPiB3cm90ZToNCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gwqDCoHRoaXMgZG9lc24ndCBsb29r
IHJpZ2h0LCBidXQgaSBkb24ndCBrbm93IGhvdyBvbmUgd2FudHMgdG8NCj4gcmVzb2x2ZQ0KPiA+
ID4gPiA+ID4gPiBpdDoNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBX
aGF0IHBhcnQgZG9lc24ndCBsb29rIHJpZ2h0ID8gSSBkb24ndCBzZWUgYW55IGlzc3VlcyB3aXRo
IGl0Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEJydWNlDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiDCoMKgRklMRVNFWFRSQVBBVEhTX2FwcGVuZCA6PSAiJHtUSElTRElSfS8ke1BOfS1n
aXQ6Ig0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gwqDCoGlzbid0IHRoZSBjb2xvbiBvbiB0aGUgd3Jv
bmcgZW5kPw0KPiA+ID4gPg0KPiA+ID4gPiBJbiBhIHF1aWNrIHNjYW4gb2Ygb3RoZXIgbGF5ZXJz
LCB0aGV5IGFyZSBhbGwgbGVhdmluZyB0aGUgdmFyaWFibGUNCj4gaW4NCj4gPiA+ID4gdGhlIHNh
bWUgc3RhdGUgKHdpdGggYSB0cmFpbGluZyBjb2xvbiksIHdoZXRoZXIgdGhleSBhcmUgdXNpbmcN
Cj4gPiA+ID4gX3ByZXBlbmQgb3IgX2FwcGVuZC4NCj4gPiA+DQo+ID4gPiDCoMKgaSBiZWcgdG8g
ZGlmZmVyIC0tIGhlcmUncyBhIHNpbmdsZSBleGFtcGxlOg0KPiA+ID4NCj4gPiA+IMKgwqBtZXRh
LWludGVsL3JlY2lwZXMtY29yZS96bGliL3psaWItaW50ZWxfMS4yLjExLjEuanRrdjYuMy5iYjoN
Cj4gPiA+IMKgwqDCoMKgRklMRVNFWFRSQVBBVEhTX2FwcGVuZCA9ICI6JHtDT1JFQkFTRX0vbWV0
YS9yZWNpcGVzLWNvcmUvemxpYi96bGliIg0KPiA+DQo+ID4gRG8gYSBidWlsZCB3aXRoIHRoYXQu
IFlvdSBoYXZlIGEgZG91YmxlIGNvbG9uLCBzbyB5b3UgZm91bmQgYSBiYWQNCj4gPiBleGFtcGxl
LCB1bmxlc3MgdGhlIGRvdWJsZSBjb2xvbiBpcyBleHBlY3RlZC4NCj4gPg0KPiA+IEZJTEVTRVhU
UkFQQVRIUz0iX19kZWZhdWx0OjovaG9tZS9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL3psaWIvemxp
YiINCj4gDQo+IEFueXRoaW5nIHVzaW5nIGFwcGVuZCBzaG91bGQgYmUgYWRkaW5nIGEgbGVhZGlu
ZyBjb2xvbiwgYW55dGhpbmcNCj4gcHJlcGVuZGluZyBzaG91bGQgYmUgYWRkaW5nIGEgdHJhaWxp
bmcgb25lLg0KPiANCj4gSSBzdXNwZWN0IHdlIG5lZWQgYW4gYXVkaXQgYW5kIGNsZWFudXAgb2Yg
c2V2ZXJhbCBsYXllcnMuLi4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KTm9ybWFs
bHksIEkgd291bGQgYWdyZWUgd2l0aCB5b3UuIEhvd2V2ZXIsIHRoZSBkZWZpbml0aW9uIG9mIEZJ
TEVTRVhUUkFQQVRIUyBpbiANCm1ldGEvY29uZi9iaXRiYWtlLmNvbmYgY29udHJhZGljdHMgdGhh
dDoNCg0KRklMRVNFWFRSQVBBVEhTID89ICJfX2RlZmF1bHQ6Ig0KDQpUaGUgYmVuZWZpdCBvZiB0
aGF0IChJIGd1ZXNzKSBpcyB0aGF0IHRoZSBhZGRlZCBzdHJpbmcgbG9va3MgdGhlIHNhbWUgd2hl
dGhlciANCl9wcmVwZW5kIG9yIF9hcHBlbmQgaXMgdXNlZC4gQXQgdGhlIHNhbWUgdGltZSBpdCBp
cyBhIGJpdCBjb25mdXNpbmcgc2luY2UgDQp0aGlzIGlzIG5vdCB0aGUgbm9ybWFsIHBhdHRlcm4g
Zm9yIGFkZGluZyB0byBhIGNvbG9uLXNlcGFyYXRlZCB2YXJpYWJsZS4NCg0KLy9QZXRlcg0KDQo=

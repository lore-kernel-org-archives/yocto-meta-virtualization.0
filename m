Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E345E00B8D; Fri,  6 Apr 2018 07:19:43 -0700 (PDT)
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
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F4D9E008E4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 07:19:41 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id w36EJdJX001980
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Apr 2018 16:19:39 +0200
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w36EJKgf015580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Apr 2018 16:19:39 +0200
Received: from DEFTHW99ERFMSX.ww902.siemens.net (139.22.70.67) by
	DEFTHW99ERGMSX.ww902.siemens.net (139.22.70.132) with Microsoft SMTP
	Server (TLS) id 14.3.389.1; Fri, 6 Apr 2018 16:19:29 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.244]) by
	DEFTHW99ERFMSX.ww902.siemens.net ([139.22.70.67]) with mapi id
	14.03.0389.001; Fri, 6 Apr 2018 16:19:28 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: docker-proxy links against host libraries
Thread-Index: AdPNnTEYbmkGr99fRwit5W5DAx7Psv//7HUAgAACOYD//84N4A==
Date: Fri, 6 Apr 2018 14:19:27 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61739229F@DEFTHW99EH4MSX.ww902.siemens.net>
References: <d08821dd-51e6-f69c-c2c4-27798bcb7794@siemens.com>
	<CADkTA4PmRh3uft80szZ7KqJU-V8wCcHpAAu6=3EFHcutWASHjA@mail.gmail.com>
	<CADkTA4MCvT_Pdx2BF67+yT9dg5XWnwqcSCi5=5YbK452X9Yf-A@mail.gmail.com>
In-Reply-To: <CADkTA4MCvT_Pdx2BF67+yT9dg5XWnwqcSCi5=5YbK452X9Yf-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.55]
MIME-Version: 1.0
Cc: Raymond Danks <ray.danks@se-eng.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: docker-proxy links against host libraries
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
X-List-Received-Date: Fri, 06 Apr 2018 14:19:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gU2VudDogRnJlaXRh
ZywgNi4gQXByaWwgMjAxOCAxNDo0Nw0KPiBUbzogQmFjaCwgUGFzY2FsIChCVCBDUFMgUiZEIFpH
IEZXIENDUCkgPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXph
dGlvbkB5b2N0b3Byb2plY3Qub3JnOyBSYXltb25kIERhbmtzIDxyYXkuZGFua3NAc2UtDQo+IGVu
Zy5jb20+DQo+IFN1YmplY3Q6IFJlOiBkb2NrZXItcHJveHkgbGlua3MgYWdhaW5zdCBob3N0IGxp
YnJhcmllcw0KPiANCj4gT24gRnJpLCBBcHIgNiwgMjAxOCBhdCA4OjM4IEFNLCBCcnVjZSBBc2hm
aWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBGcmksIEFw
ciA2LCAyMDE4IGF0IDc6NDggQU0sIFBhc2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNv
bT4NCj4gd3JvdGU6DQo+ID4+IEhlbGxvDQo+ID4+DQo+ID4+IEkgb2JzZXJ2ZWQgc29tZSBzdHJh
bmdlIGxpbmtpbmcgcHJvYmxlbSB3aXRoIHRoZSAiZG9ja2VyLXByb3h5IiB3aGVuDQo+IGJ1aWxk
aW5nIGZvciBxZW11eDg2LTY0Lg0KPiA+Pg0KPiA+PiBJdCBzZWVtcyB0aGF0IHRoZSBiaW5hcnkg
aXMgbGlua2VkIGFnYWluc3QgdGhlIGhvc3QgdmVyc2lvbiBvZg0KPiA+Pg0KPiA+PiBgYGANCj4g
Pj4gJCBmaWxlIGltYWdlL3Vzci9iaW4vZG9ja2VyLXByb3h5DQo+ID4+IGltYWdlL3Vzci9iaW4v
ZG9ja2VyLXByb3h5OiBFTEYgNjQtYml0IExTQiBleGVjdXRhYmxlLCB4ODYtNjQsIHZlcnNpb24g
MQ0KPiAoU1lTViksIGR5bmFtaWNhbGx5IGxpbmtlZCwgaW50ZXJwcmV0ZXIgL2xpYjY0L2xkLWxp
bnV4LXg4Ni02NC5zby4yLCBub3QNCj4gc3RyaXBwZWQNCj4gPj4NCj4gPj4gXl5eXl5eIGBgYA0K
PiA+Pg0KPiA+PiBJIG9ubHkgbm90aWNlZCB0aGUgaXNzdWUgb24gbXkgYnVpbGQgYXMgaXQgaXMg
YSBtdWx0aSBsaWIgRGViaWFuIHdoZXJlIHRoZQ0KPiBsaWJyYXJpZXMgYXJlIHVuZGVyIC9saWI2
NCBhbmQgL2xpYjMyLg0KPiA+PiBIb3dldmVyIG9uIHRoZSB0YXJnZXQgdGhlcmUgdGhlcmUgaXMg
b25seSAvbGliIHRvIHRoZSBiaW5hcnkgZGlkIG5vdCB3b3JrDQo+IHRoZXJlLg0KPiA+Pg0KPiA+
PiBPbmx5IHRoZSBkb2NrZXItcHJveHkgYmluYXJ5IGlzIGFmZmVjdGVkIGJ5IHRoaXMsIHRoZSBv
dGhlciBiaW5hcmllcw0KPiAoZG9ja2VyLCBkb2NrZXJkKSBhcmUgZmluZS4NCj4gPj4NCj4gPj4g
YGBgDQo+ID4+ICQgZmlsZSBpbWFnZS91c3IvYmluL2RvY2tlcg0KPiA+PiBpbWFnZS91c3IvYmlu
L2RvY2tlcjogRUxGIDY0LWJpdCBMU0IgZXhlY3V0YWJsZSwgeDg2LTY0LCB2ZXJzaW9uIDENCj4g
Pj4gKFNZU1YpLCBkeW5hbWljYWxseSBsaW5rZWQsIGludGVycHJldGVyIC9saWIvbGQtbGludXgt
eDg2LTY0LnNvLjIsDQo+ID4+IGZvciBHTlUvTGludXggMy4yLjAsDQo+ID4+IEJ1aWxkSURbc2hh
MV09YzExOGQyMzkzYzc5MzIxNzJjYTNlMTgzYmIzMDRmZTFjZmY3M2NlNSwgbm90IHN0cmlwcGVk
DQo+ID4+IGBgYA0KPiA+Pg0KPiA+PiBJIHRyaWVkIHRvIGZpeCB0aGUgcmVjaXBlIGJ5IHJlcGxh
Y2luZyB0aGUgYnVpbGQgY29tbWFuZCBmb3IgZG9ja2VyLXByb3h5DQo+IFsxXSB3aXRoIHRoZSBm
b2xsb3dpbmcgbGluZToNCj4gPj4NCj4gPj4gYGBgDQo+ID4+ICR7R099IGJ1aWxkICR7R09CVUlM
REZMQUdTfSAtbyAke1N9L3NyYy9pbXBvcnQvZG9ja2VyLXByb3h5DQo+ID4+IGdpdGh1Yi5jb20v
ZG9ja2VyL2xpYm5ldHdvcmsvY21kL3Byb3h5DQo+ID4+IGBgYA0KPiA+Pg0KPiA+PiBCdXQgd2l0
aG91dCBzdWNjZXNzIHRoZSBsaW5rZWQgbG9hZGVyIGlzIHN0aWxsIHdyb25nLg0KPiA+Pg0KPiA+
PiBJdCBpcyBhbHNvIHdvcnRoIG1lbnRpb25pbmcgdGhhdCB0aGlzIG9ubHkgaGFwcGVucyB3aXRo
IHg4Nl82NCBidWlsZHMNCj4gKHRyaWVkOiBxZW11eDg2LTY0LCBnZW5lcmljeDY0LTY0KSBidXQg
bm90IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlcyBsaWtlDQo+IGFybXY3Lg0KPiA+PiBJIHdhcyBh
bHNvIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgb24gcG9reSBtYXN0ZXIgdG9kYXkgKGNvbW1pdDoN
Cj4gOWVkMzRlMzE1YThkMmRiNThlMjEyYjA3NzBkZmE4ZjRhZDAwZjYzNykuDQo+ID4NCj4gPg0K
PiA+IEJ1dCB3aGF0IG1ldGEtdmlydCBjb21taXQgaXMgeW91ciBoZWFkID8NCg0KU29ycnkgZm9y
Z290IHRvIG1lbnRpb24sIEkgd2FzIHVzaW5nOiBlOWQ3NDE2MmE5YmZkYmYwYTUxZjIzMGFkOWJl
ZGVhYjkyMDU1MmY0DQoNCj4gPj4NCj4gPj4NCj4gPj4gVGhlIG9ubHkgc29sdXRpb24gSSBmb3Vu
ZCBzbyBmYXIgaXMgdG8gcHV0IHRoZSBkb2NrZXItcHJveHkgaW50byBhIHNlcGFyYXRlDQo+IHJl
Y2lwZSBhbmQgYWRkIGl0IGFzIGEgUkRFUEVORFMgdG8gZG9ja2VyLg0KPiA+PiBJIHdpbGwgc3Vi
bWl0IGEgcGF0Y2ggZm9yIHRoaXMgYW5kIHlvdSBjYW4gZGVjaWRlIGlmIHRoaXMgd291bGQgYmUg
YW4NCj4gYWNjZXB0YWJsZSBzb2x1dGlvbi4NCj4gPg0KPiA+IEkgZG9uJ3Qgc2VlIHdoYXQgYSBz
ZXBhcmF0ZSByZWNpcGUgaGFzIHRvIGRvIHdpdGggYSBmaXguIEknZCByYXRoZXINCj4gPiBrZWVw
IHRoZSBidWlsZCBhbGwgaW4gb25lIHBsYWNlLg0KPiA+DQo+ID4gSSBndWVzcyBJIGNhbiB3YWl0
IHRvIHNlZSB0aGUgcmVjaXBlLCBidXQgd2hhdCdzIGRpZmZlcmVudCBpbiB0aGF0DQo+ID4gcmVj
aXBlIGluIHRoZSB3YXkgdGhhdCBkb2NrZXItcHJveHkgaXMgYnVpbHQsIHRoYXQgY2FuJ3QgYmUg
ZG9uZSBpbg0KPiA+IHRoZSBleGlzdGluZyByZWNpcGUgPw0KPiA+DQpJIGd1ZXNzIHRoZXJlIGlz
IG5vdGhpbmcgdGhhdCBjb3VsZCBub3QgYmUgZG9uZSBpbiB0aGUgY3VycmVudCByZWNpcGUuDQpI
b3dldmVyIGFzIHRoZSBkb2NrZXItcHJveHkgaXMgYSBwcm9wZXIgZ28gcGFja2FnZSBpdCBjYW4g
ZWFzaWx5IGJlIGJ1aWx0IHdpdGggYSBzaW1wbGUgcmVjaXBlIHVzaW5nIGdvLmJiY2xhc3MuIFNv
IGZvciBtZSB0aGlzIHdhcyB0aGUgc2ltcGxlc3Qgc29sdXRpb24gYXMgSSBjb3VsZCBub3QgZmln
dXJlIG91dCBob3cgdG8gY2FsbCBnbyBidWlsZCBwcm9wZXJseS4NCg0KPiBJIGNhbiBzZWUgYSBz
aW1pbGFyIGxpbmsgcGF0dGVybiBoZXJlIChidXQgdGhpcyB3b3VsZCBoYXZlIGJlZW4gYW4gZXhp
c3RpbmcNCj4gaXNzdWUsIHVucmVsYXRlZCB0byB0aGUgcmVjZW50IGRvY2tlciB1cHJldnMpLCBz
byBJJ2xsIGhhdmUgYSBnbyBhdCBmaXhpbmcgaXQgdGhpcw0KPiBtb3JuaW5nLg0KDQpUaGUgaXNz
dWUgd2FzIGFscmVhZHkgdGhlcmUgYmVmb3JlIDE4LjAzIHVwcmV2LiBTbyBJIGRvbid0IHRoaW5r
IGl0IGlzIHJlbGF0ZWQuDQpJIHdhcyB1c2luZyBweXJvIGJlZm9yZSB3aXRoIGRvY2tlciAxLjF4
IHNvbWV0aGluZyB3aGVyZSBJIGRpZG4ndCBub3RpY2UgdGhlIGlzc3VlIHRoZXJlLg0KDQpQYXNj
YWwNCg==


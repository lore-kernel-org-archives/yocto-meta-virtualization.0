Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACCA6E008D2; Fri, 16 Mar 2018 02:31:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B6C5E00752
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Mar 2018 02:31:10 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2G9V9K4017271
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 16 Mar 2018 10:31:09 +0100
Received: from DEFTHW99ERKMSX.ww902.siemens.net
	(defthw99erkmsx.ww902.siemens.net [139.22.70.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w2G9UdSH008531
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 16 Mar 2018 10:31:08 +0100
Received: from DENBGAT9ERQMSX.ww902.siemens.net (139.22.70.196) by
	DEFTHW99ERKMSX.ww902.siemens.net (139.22.70.147) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 16 Mar 2018 10:30:48 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.4]) by
	DENBGAT9ERQMSX.ww902.siemens.net ([139.22.70.196]) with mapi id
	14.03.0361.001; Fri, 16 Mar 2018 10:30:47 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] style: make indention consistent
Thread-Index: AQHTu5EbE4SUyPTdNkq8uQtk3gpGaKPPm7gAgAL/jwA=
Date: Fri, 16 Mar 2018 09:30:47 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61736147C@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314084005.23014-1-pascal.bach@siemens.com>
	<CADkTA4Mom5R6DXGgH8i0xEEfY7bgSWtZ=6==q9T7an8QwC+wdg@mail.gmail.com>
	<CADkTA4O8eie3g1HE-T2DEZt8S=w0dPMLc-iDFiEkxU0=UJ_j8A@mail.gmail.com>
In-Reply-To: <CADkTA4O8eie3g1HE-T2DEZt8S=w0dPMLc-iDFiEkxU0=UJ_j8A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.33]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] style: make indention consistent
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
X-List-Received-Date: Fri, 16 Mar 2018 09:31:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gU2VudDogTWl0dHdv
Y2gsIDE0LiBNw6RyeiAyMDE4IDEzOjQyDQo+IFRvOiBCYWNoLCBQYXNjYWwgKEJUIENQUyBSJkQg
WkcgRlcgQ0NQKSA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+DQo+IENjOiBtZXRhLXZpcnR1YWxp
emF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0
aW9uXSBbUEFUQ0hdIHN0eWxlOiBtYWtlIGluZGVudGlvbiBjb25zaXN0ZW50DQo+IA0KPiBPbiBX
ZWQsIE1hciAxNCwgMjAxOCBhdCA4OjM2IEFNLCBCcnVjZSBBc2hmaWVsZA0KPiA8YnJ1Y2UuYXNo
ZmllbGRAZ21haWwuY29tPiB3cm90ZToNCj4gPiB1cmsuIFRoYW5rcywgYnV0IG5vIHRoYW5rcy4g
T24gdGhlIG5leHQgcGFja2FnZSB1cGRhdGUsIEknbGwgdGFrZSBjYXJlDQo+ID4gb2YgdGhlc2Us
IGJ1dCBJIGF2b2lkIGFsbCB3aGl0ZXNwYWNlIC8gY2xlYW51cCBwYXRjaGVzIGxpa2UgdGhlIHBs
YWd1ZS4NCj4gDQpGYWlyIGVub3VnaC4NCg0KPiBBbmQgSSBzaG91bGQgaGF2ZSBhZGRlZCwgdGhh
dCBJIGhhdmUgYSBzZXQgb2YgdXBkYXRlcyBhbG1vc3QgcmVhZHkgdG8gZ28sIHNvDQo+IEknbGwg
c3RhY2sgc29tZSBjbGVhbnVwIG9uIHRvcCBvZiB0aG9zZSBjaGFuZ2VzLg0KDQpDYW4geW91IGVs
YWJvcmF0ZSB3aGF0IHVwZGF0ZXMgeW91IGFyZSB3b3JraW5nIG9uPw0KQmFjYXVzZSBJJ20gYWxz
byBsb29raW5nIGludG8gZG9pbmcgc29tZSB1cGRhdGVzIGFyb3VuZCBkb2NrZXIgYW5kIGRvY2tl
ci1jb21wb3NlLiBTbyBub3QgdG8gZHVwbGljYXRlIHdvcmsuDQoNClBhc2NhbA0KDQo=


Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 959D7E01086; Wed, 14 Mar 2018 05:46:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73661E00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:46:31 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2ECkU7R004888
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 14 Mar 2018 13:46:30 +0100
Received: from DEFTHW99ERMMSX.ww902.siemens.net
	(defthw99ermmsx.ww902.siemens.net [139.22.70.142])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w2ECkP6E010192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 14 Mar 2018 13:46:30 +0100
Received: from DENBGAT9ERTMSX.ww902.siemens.net (139.22.70.192) by
	DEFTHW99ERMMSX.ww902.siemens.net (139.22.70.142) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 14 Mar 2018 13:46:04 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.4]) by
	DENBGAT9ERTMSX.ww902.siemens.net ([139.22.70.192]) with mapi id
	14.03.0361.001; Wed, 14 Mar 2018 13:46:03 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] containerd: remove redundant
	systemd detection
Thread-Index: AQHTu5Gh/1lTOQ2feUm23GxlGgrFM6PPrESQ
Date: Wed, 14 Mar 2018 12:46:03 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61735E9A1@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314083947.22458-1-pascal.bach@siemens.com>
	<CADkTA4O1ze=NKO61dL_C-h99G5Bx49gXrEVrHXDz4+Z6nP7h2w@mail.gmail.com>
In-Reply-To: <CADkTA4O1ze=NKO61dL_C-h99G5Bx49gXrEVrHXDz4+Z6nP7h2w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.35]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containerd: remove redundant systemd detection
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
X-List-Received-Date: Wed, 14 Mar 2018 12:46:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbiBXZWQsIE1hciAxNCwgMjAxOCBhdCA0OjM5IEFNLCBQYXNjYWwgQmFjaCA8cGFzY2FsLmJh
Y2hAc2llbWVucy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSB2YXJpYWJsZXMgb25seSB0YWtlIGVm
ZmVjdCBpZiBzeXN0ZW1kIGlzIGVuYWJsZWQgc28gdGhlIGNoZWNrIGNhbiBiZQ0KPiByZW1vdmVk
Lg0KPiA+DQo+IA0KPiBTYW1lIGNvbW1lbnQuDQo+IA0KPiBUaGlzIGxheWVyLCBhbmQgbWFueSBv
dGhlcnMsIGhhdmUgYWx3YXlzIGhhZCB0aGlzIGNoZWNrIHNpbmNlIHRoYXQncyBob3cgdGhlDQo+
IHN5c3RlbWQgY2xhc3NlcyB3b3JrZWQgYmVmb3JlLg0KPiANCj4gQ2FuIHlvdSBsb2cgdGhlIG9l
LWNvcmUgY29tbWl0IHRoYXQgY2hhbmdlcyB0aGUgYmVoYXZpb3VyIGluIHRoZSBsb25nIGxvZyBv
Zg0KPiB0aGUgdHdvIGNsZWFudXAgcGF0Y2hlcyA/DQoNCiBJIGNhbm5vdCBwb2ludCB5b3UgdG8g
YSBzcGVjaWZpYyBjb21taXQgaW4gb2UtY29yZS4gQnV0IEkgYWxzbyBkb24ndCBzZWUgYW55dGhp
bmcgbGlrZSB0aGlzIGFueXdoZXJlIGVsc2UuDQpBbGwgcmVjaXBlcyBpbiBvZS1jb3JlIEkgaGFk
IGEgbG9vayBhdCBqdXN0IHNldCB0aGVzZSB2YXJpYWJsZXMsIG5vIGNoZWNrcy4NCg0KU28geW91
IG1ha2UgYW55IG9ic2VydmF0aW9ucyB0aGF0IG1ha2VzIHRoZSBjaGVjayBuZWNlc3NhcnkgaW4g
dGhpcyBsYXllciBidXQgbm90IGluIG9lLWNvcmU/DQoNClBhc2NhbA0KDQoNCg==


Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE3B1E00C43; Wed, 20 Feb 2019 06:00:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D230E00BCC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 06:00:23 -0800 (PST)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x1KE0Lgp028910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 20 Feb 2019 15:00:22 +0100
Received: from DEFTHW99ERKMSX.ww902.siemens.net
	(defthw99erkmsx.ww902.siemens.net [139.22.70.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x1KE0LIN024598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 20 Feb 2019 15:00:21 +0100
Received: from DENBGAT9ERMMSX.ww902.siemens.net (139.22.70.140) by
	DEFTHW99ERKMSX.ww902.siemens.net (139.22.70.147) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Wed, 20 Feb 2019 15:00:21 +0100
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.221]) by
	DENBGAT9ERMMSX.ww902.siemens.net ([139.22.70.140]) with mapi id
	14.03.0435.000; Wed, 20 Feb 2019 15:00:20 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization][PATCH] docker: update 18.09.0 -> 18.09.2
Thread-Index: AQHUyR0nA1QegmrsKE+c/0KgYNCWsqXooUgAgAABewCAABMnoA==
Date: Wed, 20 Feb 2019 14:00:21 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61C439629@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190220130527.5770-1-pascal.bach@siemens.com>
	<CADkTA4MP0Wotw0ac+dPns81TBkWZWM9fqgdOULeqsvPAhNj-Hw@mail.gmail.com>
	<CADkTA4Mk6x_4DM5G=iMmcuuiNX---zR_cciaqEX-O5o+3SXOQg@mail.gmail.com>
In-Reply-To: <CADkTA4Mk6x_4DM5G=iMmcuuiNX---zR_cciaqEX-O5o+3SXOQg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.13]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: update 18.09.0 -> 18.09.2
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
X-List-Received-Date: Wed, 20 Feb 2019 14:00:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEluIHRoaXMgY2FzZSwgSSdtIGdvaW5nIHRvIHN0aWNrIHdpdGggbW9ieS4gVGhlIHJlYXNv
biB0aGF0IGl0IHdhcw0KPiA+IGJlaW5nIHVzZWQgd2FzIHRvIGtlZXAgdGhlIGxpbmthZ2UgYmV0
d2VlbiBtb2J5IGFuZCB0aGUgLWNlIGJ1aWxkcy4NCj4gPiBTaW5jZSB3ZSBoYXZlIHZhcmlvdXMg
b3RoZXIgY29tcG9uZW50cyB0aGF0IGFyZSBzb21ldGltZXMgaW4gc3luYywNCj4gPiBzb21ldGlt
ZXMgb3V0IG9mIHN5bmMsIGhhdmluZyB0aGF0IGNvbW1vbiByZXBvc2l0b3J5IHdhcyBpbXBvcnRh
bnQuDQo+ID4gVGhlIHBvaW50IG9mIGhhdmluZyB0aGUgZG9ja2VyLWNlIGFuZCAnZG9ja2VyJyBz
cGxpdCB3YXMgdGhhdCBvbmUNCj4gPiB0cmFja2VkIGNvbW11bml0eSwgYW5kIG9uZSBvbmx5IHRy
YWNrcyB3aGF0IGRvY2tlciAidGhlIGNvbXBhbnkiIHdhcw0KPiA+IGRvaW5nLg0KPiANCj4gVGhl
IGZvcm1hdHRpbmcgb2YgdGhhdCBlbWFpbCBjYW1lIG91dCBob3JyaWJseS4gU29ycnkgYWJvdXQg
dGhhdC4NCj4gKGxldCdzIHNlZSBpZiB0aGlzIG9uZSBjb21lcyBvdXQgbW9yZSByZWFkYWJsZSkN
Cj4gDQo+IEkgdGhvdWdodCBJIHNob3VsZCBhZGQgdGhhdCBJJ20gd29ya2luZyBvbiBhIHJlZnJl
c2ggb2YgdGhlIGRvY2tlcg0KPiBjb21wb25lbnRzIGFzIHdlbGwsIGFuZCB3YXMgY29uc2lkZXJp
bmcgdXNpbmcgc29tZSBuYW1pbmcgdG8gbWFrZSB0aGUNCj4gY29tbXVuaXR5L2RvY2tlci1jZSBz
cGxpdCBhIGJpdCBtb3JlIGNsZWFyLiBTbyBwZXJoYXBzIHRoYXQgd291bGQgaGVscA0KPiBtYWtl
IGh1bnRpbmcgZm9yIHRoZSByaWdodCBTUkNSRVYgaW4gbW9ieSBtYWtlIGEgYml0IG1vcmUgc2Vu
c2UuDQo+IA0KDQoNCkkgd2FzIHRyeWluZyB0byBkbyBteSBiZXN0IHRvIGZpZ3VyZSBvdXQgdGhl
IGNvcnJlY3QgcmV2aXNpb25zLiBCdXQgSSB0aGluayBpdCB3b3VsZCBoZWxwIHRvIGhhdmUgYSBi
aXQgbW9yZQ0KZG9jdW1lbnRhdGlvbiBvciBhdCBsZWFzdCBoaW50cyBvbiBob3cgdG8gZG8gYW4g
dXBkYXRlIHNvIG1vcmUgcGVvcGxlIGNhbiBoZWxwIHdpdGggbWFpbnRlbmFuY2UuDQoNCkJ1dCB5
b3UgY2FuIGlnbm9yZSB0aGlzIHBhdGNoIEkgd2lsbCB3YWl0IGZvciB5b3VyIHJlZnJlc2ggdGhl
biDwn5iKDQoNClBhc2NhbCANCg==


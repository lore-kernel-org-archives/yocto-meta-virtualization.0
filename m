Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A429E00956; Fri, 16 Mar 2018 02:28:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.2 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A825BE00752
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Mar 2018 02:28:33 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w2G9SVA8006934
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 16 Mar 2018 10:28:31 +0100
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w2G9SJTM032487
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 16 Mar 2018 10:28:31 +0100
Received: from DEFTHW99ERRMSX.ww902.siemens.net (139.22.70.199) by
	DEFTHW99ERGMSX.ww902.siemens.net (139.22.70.132) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 16 Mar 2018 10:27:55 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.4]) by
	DEFTHW99ERRMSX.ww902.siemens.net ([139.22.70.199]) with mapi id
	14.03.0361.001; Fri, 16 Mar 2018 10:27:54 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] containerd: remove redundant
	systemd detection
Thread-Index: AQHTu5Gh/1lTOQ2feUm23GxlGgrFM6PPrESQ///2tgCAAvdukA==
Date: Fri, 16 Mar 2018 09:27:54 +0000
Message-ID: <355BE46A91031048906B695426A8D8E617361466@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314083947.22458-1-pascal.bach@siemens.com>
	<CADkTA4O1ze=NKO61dL_C-h99G5Bx49gXrEVrHXDz4+Z6nP7h2w@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E61735E9A1@DEFTHW99EH4MSX.ww902.siemens.net>
	<CADkTA4MBqwhW_Pe+v_5dgja+osuTkbd_wjdOvs8ZQ23bs9fxhQ@mail.gmail.com>
In-Reply-To: <CADkTA4MBqwhW_Pe+v_5dgja+osuTkbd_wjdOvs8ZQ23bs9fxhQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.33]
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
X-List-Received-Date: Fri, 16 Mar 2018 09:28:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiA+PiBUaGlzIGxheWVyLCBhbmQgbWFueSBvdGhlcnMsIGhhdmUgYWx3YXlz
IGhhZCB0aGlzIGNoZWNrIHNpbmNlIHRoYXQncw0KPiA+PiBob3cgdGhlIHN5c3RlbWQgY2xhc3Nl
cyB3b3JrZWQgYmVmb3JlLg0KPiA+Pg0KPiA+PiBDYW4geW91IGxvZyB0aGUgb2UtY29yZSBjb21t
aXQgdGhhdCBjaGFuZ2VzIHRoZSBiZWhhdmlvdXIgaW4gdGhlIGxvbmcNCj4gPj4gbG9nIG9mIHRo
ZSB0d28gY2xlYW51cCBwYXRjaGVzID8NCj4gPg0KPiA+ICBJIGNhbm5vdCBwb2ludCB5b3UgdG8g
YSBzcGVjaWZpYyBjb21taXQgaW4gb2UtY29yZS4gQnV0IEkgYWxzbyBkb24ndCBzZWUNCj4gYW55
dGhpbmcgbGlrZSB0aGlzIGFueXdoZXJlIGVsc2UuDQo+ID4gQWxsIHJlY2lwZXMgaW4gb2UtY29y
ZSBJIGhhZCBhIGxvb2sgYXQganVzdCBzZXQgdGhlc2UgdmFyaWFibGVzLCBubyBjaGVja3MuDQo+
ID4NCj4gPiBTbyB5b3UgbWFrZSBhbnkgb2JzZXJ2YXRpb25zIHRoYXQgbWFrZXMgdGhlIGNoZWNr
IG5lY2Vzc2FyeSBpbiB0aGlzIGxheWVyDQo+IGJ1dCBub3QgaW4gb2UtY29yZT8NCj4gDQo+IFRo
cm91Z2hvdXQgdGhlIHZhcmlvdXMgc3lzdGVtZCBpbnRlZ3JhdGlvbnMsIHdlJ3ZlIGhhZCBzZXJ2
aWNlcyB0aGF0IGRpZG4ndA0KPiBzdGFydC9pbnN0YWxsIHdoZW4gdGhleSBzaG91bGQsIHdlJ3Zl
IGhhZCBzZXJ2aWNlcyB0aGF0IHdvdWxkIHN0YXJ0IHdoZW4gdGhlDQo+IHNob3VsZG4ndCwgYW5k
IGFsbCBzb3J0cyBvZiBvdGhlciBjb21iaW5hdGlvbnMuDQo+IA0KPiBQbHVzIGhpc3RvcmljYWxs
eSB3ZSBzdXBwb3J0ZWQgYm90aCBzeXN0ZW1kIGFuZCBzeXN2aW5pdCwgc28gYm90aCB0aGUNCj4g
cGFja2FnaW5nIGFuZCBpbnN0YWxsIHJ1bGVzIG5lZWRlZCB0byBiZSBjb25kaXRpb25hbCBvbiB0
aGUgaW5pdCBzeXN0ZW0uDQo+IA0KPiBJbiB0aG9zZSBzYW1lIHJlY2lwZXMsIHRoZSAuc2Vydmlj
ZSBmaWxlcyBhcmVuJ3QgYmVpbmcgaW5zdGFsbGVkIGlmIHN5c3RlbWQgaXNuJ3QNCj4gZW5hYmxl
ZC4NCj4gDQo+IEFsdGhvdWdoIEkgaGF2ZW4ndCB0ZXN0ZWQgaXQgbGF0ZWx5LCBJSVJDLCB0aGF0
IGxhY2sgb2YgLnNlcnZpY2UgZmlsZSArIHRoZQ0KPiBwYWNrYWdpbmcgYmVpbmcgZW5hYmxlZCB0
cmlnZ2VycyBhIHdhcm5pbmcgb3IgZXJyb3IuDQo+IA0KPiBJJ20gYWN0dWFsbHkgZmluZSBpbiB3
YWxraW5nIGF3YXkgZnJvbSBzeXN2aW5pdCBzdXBwb3J0LCBidXQgSSBrbm93IHRoZXJlIGFyZQ0K
PiBzdGlsbCBzb21lIHVzZXJzIG9mIGl0LCBzbyBJIHNob3VsZCBmaXJzdCBkb2N1bWVudCBpdCBh
cyBkZXByZWNpYXRlZCwgdGhyb3cgYQ0KPiB3YXJuaW5nIGFuZCB0aGVuIHJlbW92ZSBpdCBjb21w
bGV0ZWx5IGluIHRoZSBuZXh0IHJlbGVhc2UgKGkuZS4gbm90IGp1c3QNCj4gdGhlc2UgY2xlYW51
cHMsIGJ1dCByZW1vdmUgYWxsIHRoZSBzeXN0ZW1kIGluaXQgc3lzdGVtIGNoZWNrcykuDQoNCkkg
ZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBuZWVkIHRvIGRyb3Agc3lzdmluaXQuIFRoZXkgY2FuIGNv
ZXhpc3Qgd2l0aG91dCBwcm9ibGVtLg0KV2UgdXNlZCBtYW55IHJlY2lwZXMgdGhhdCBoYXZlIGJv
dGggc3lzdmluaXQgYW5kIHN5c3RlbWQgc2VydmljZSBhbmQgbmV2ZXIgaGFkIGFueSBpc3N1ZXMg
YXQgbGVhc3Qgc2luY2UgcHlyby4NCg0KUGFzY2FsDQo=


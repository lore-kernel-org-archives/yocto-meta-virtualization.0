Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 762FFE00B65; Mon,  9 Apr 2018 08:34:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [194.138.37.39 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F797E00994
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 08:34:15 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id w39FYEuq008475
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Apr 2018 17:34:14 +0200
Received: from DEFTHW99ERNMSX.ww902.siemens.net
	(defthw99ernmsx.ww902.siemens.net [139.22.70.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w39FYDHk025853
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Apr 2018 17:34:13 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.244]) by
	DEFTHW99ERNMSX.ww902.siemens.net ([139.22.70.141]) with mapi id
	14.03.0389.001; Mon, 9 Apr 2018 17:34:13 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 1/2] docker-proxy: add recipe for
	docker-proxy
Thread-Index: AQHTza3x7YLqSyXEjEKBIoSIaBDRaaPzyTJQgASXEQCAADSAMA==
Date: Mon, 9 Apr 2018 15:34:13 +0000
Message-ID: <355BE46A91031048906B695426A8D8E617397B18@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
	<CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E6173922CB@DEFTHW99EH4MSX.ww902.siemens.net>
	<CADkTA4NQGoRRsOxL9FisjV2Qz64AvmPRKiC5MxPK22hxF6bBSg@mail.gmail.com>
In-Reply-To: <CADkTA4NQGoRRsOxL9FisjV2Qz64AvmPRKiC5MxPK22hxF6bBSg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.34]
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
X-List-Received-Date: Mon, 09 Apr 2018 15:34:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiA+Pg0KPiA+PiBBcyBJIGhpbnRlZCwgSSdtIGdvaW5nIHRvIGZpZ3VyZSBv
dXQgaG93IHRvIGludGVncmF0ZSAvIGZpeCB0aGlzIGluDQo+ID4+IHRoZSBtYWluIGRvY2tlciBy
ZWNpcGUuDQo+ID4+DQo+ID4+IEhhdmluZyB0aGUgdmFyaW91cyBTUkNSRVZzIG1hbmFnZWQgaW4g
bXVsdGlwbGUgcmVjaXBlcyBpcyBhDQo+ID4+IG1haW50ZW5hbmNlIHBhaW4gYW5kIHJlY2lwZSBm
b3IgcnVudGltZSBlcnJvcnMuDQo+ID4+DQo+ID4+IEknbGwgZGlnIGludG8gd2hhdCB0aGUgZ28g
Y2xhc3MgaXMgZG9pbmcgdGhhdCBpcyBzbyBkaWZmZXJlbnQgZnJvbQ0KPiA+PiB3aGF0IEkndmUg
YmVlbiB0cnlpbmcuDQo+ID4+DQo+ID4+IENhbiB5b3UgcHJvdmlkZSB0aGUgb3V0cHV0IG9mIHlv
dXIgcHJvcGVybHkgbGlua2VkIGRvY2tlci1wcm94eSwgc28gSQ0KPiA+PiBjYW4gdXNlIGl0IGFz
IGEgcmVmZXJlbmNlID8NCj4gPg0KPiA+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IG91
dHB1dD8NCj4gDQo+IEkgc29ydGVkIHRoaW5ncyBvdXQgdXNpbmcgdGhlIGxpYm5ldHdvcmsgTWFr
ZSBpbmZyYXN0cnVjdHVyZSBhbmQgc29tZQ0KPiBzcGVsdW5raW5nIGludG8gZ28gaW50ZXJuYWxz
Lg0KPiBJIG5vdyBoYXZlIGl0IHVzaW5nIHRoZSBzeXNyb290IGluZnJhc3RydWN0dXJlLCBhbmQg
SSBjYW4gZm9sbG93IGFsb25nIHdpdGgNCj4gU1JDUkVWcyBhbmQgYW55IGJ1aWxkIGludGVybmFs
IGNoYW5nZXMgdG8gbGlibmV0d29yazoNCj4gDQo+IGZpbGUgYmluL2QqDQo+IGJpbi9kbmV0LS1h
bWQ2NDogICAgICAgICBFTEYgNjQtYml0IExTQiBleGVjdXRhYmxlLCB4ODYtNjQsIHZlcnNpb24g
MQ0KPiAoU1lTViksIGR5bmFtaWNhbGx5IGxpbmtlZCwgaW50ZXJwcmV0ZXIgL2xpYjY0L2xkLWxp
bnV4LXg4Ni02NC5zby4yLCBmb3INCj4gR05VL0xpbnV4IDMuMi4wLA0KPiBCdWlsZElEW3NoYTFd
PWJjNjA1OWQ3MmE5ZDYyMjQwNDk1NDIyMTQ0MjdiZjNjNjJhNDE4NjYsIG5vdCBzdHJpcHBlZA0K
PiBiaW4vZG9ja2VyLXByb3h5LS1hbWQ2NDogRUxGIDY0LWJpdCBMU0IgZXhlY3V0YWJsZSwgeDg2
LTY0LCB2ZXJzaW9uIDENCj4gKFNZU1YpLCBkeW5hbWljYWxseSBsaW5rZWQsIGludGVycHJldGVy
IC9saWI2NC9sZC1saW51eC14ODYtNjQuc28uMiwgZm9yDQo+IEdOVS9MaW51eCAzLjIuMCwNCj4g
QnVpbGRJRFtzaGExXT1jNTJlZDdjM2IyODI4NGE2ODNhZGU2YjRjNDZjYTRmNmJhZDhkMWZiLCBu
b3Qgc3RyaXBwZWQNCg0KSSBjYW4gY29uZmlybSB0aGF0IGl0IGlzIGNvcnJlY3RseSBsaW5raW5n
IG5vdy4NCg0KVGhhbmtzIGZvciB0aGUgZml4Lg0KDQpQYXNjYWwNCg==


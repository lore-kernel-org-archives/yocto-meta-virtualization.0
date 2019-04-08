Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C583BE00C43; Mon,  8 Apr 2019 03:43:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at https://www.dnswl.org/,
	high *      trust
	*      [194.138.37.39 listed in list.dnswl.org]
X-Greylist: delayed 855 seconds by postgrey-1.32 at yocto-www;
	Mon, 08 Apr 2019 03:43:32 PDT
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C89FE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 03:43:32 -0700 (PDT)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x38ATGS5012730
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 8 Apr 2019 12:29:16 +0200
Received: from DEFTHW99ERHMSX.ww902.siemens.net
	(defthw99erhmsx.ww902.siemens.net [139.22.70.133])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x38ASjSW014678
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 8 Apr 2019 12:29:15 +0200
Received: from DENBGAT9ER2MSX.ww902.siemens.net (139.22.70.79) by
	DEFTHW99ERHMSX.ww902.siemens.net (139.22.70.133) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Mon, 8 Apr 2019 12:29:10 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.89]) by
	DENBGAT9ER2MSX.ww902.siemens.net ([139.22.70.79]) with mapi id
	14.03.0435.000; Mon, 8 Apr 2019 12:29:09 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Stein, Christoph" <CStein@samson.de>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] [PATCH] python3-docker-compose: upgrade
	to 1.21.2
Thread-Index: AdTt1GYKhy74m2jGS6q05K6cpT4KrQAISr7w
Date: Mon, 8 Apr 2019 10:29:09 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA33C22@DENBGAT9EL2MSX.ww902.siemens.net>
References: <e5a5d6b7bd984f05bc7c7cdf6b7fda4c@A400S102.samsongroup.intra>
In-Reply-To: <e5a5d6b7bd984f05bc7c7cdf6b7fda4c@A400S102.samsongroup.intra>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
x-originating-ip: [139.22.70.26]
MIME-Version: 1.0
Subject: Re: [PATCH] python3-docker-compose: upgrade to 1.21.2
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
X-List-Received-Date: Mon, 08 Apr 2019 10:43:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQogDQogDQo+IHdoaWxlIHVwZGF0aW5nIGEgcHJvamVjdCB0byAyLjYgKHRodWQpIEkgZW5jb3Vu
dGVyZWQgYSBwcm9ibGVtIHJ1bm5pbmcNCj4gZG9ja2VyLWNvbXBvc2U6IFRoZSBpbWFnZSBidWls
ZHMgYW5kIGJvb3RzIHVwIHdpdGhvdXQgcHJvYmxlbXMuIEJ1dCBvbmNlDQo+IHdlIHRyeSB0byBy
dW4gZG9ja2VyLWNvbXBvc2Ugb24gdGhlIHRhcmdldCBpdCBjb21wbGFpbnMgdGhhdCB0aGUgcHl0
aG9uMy0NCj4gZG9ja2VyIHZlcnNpb24gZG9lcyBub3QgZml0Lg0KPiANCj4gLSBTZWVtaW5nbHkg
ZG9ja2VyLWNvbXBvc2UgKHJlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRob24z
LQ0KPiBkb2NrZXItY29tcG9zZV8xLjE2LjEuYmIpIGV4cGVjdHMgYSBweXRob24zLWRvY2tlciB2
ZXJzaW9uIHJhbmdpbmcgZnJvbQ0KPiAyLjUuMSB0byAzLjAuDQo+IC0gU2luY2UgdGhlIGluY2x1
ZGVkIHB5dGhvbjMtZG9ja2VyIHZlcnNpb24gaXMgMy40LjAgKHJlY2lwZXMtDQo+IGRldnRvb2xz
L3B5dGhvbi9weXRob24zLWRvY2tlcl8zLjQuMC5iYikgdGhpcyBpcyBvdXQgb2YgcmFuZ2UgYW5k
IGxlYWRzIHRvDQo+IGRvY2tlci1jb21wb3NlIGNvbXBsYWluaW5nLg0KPiANCj4gU28gaXQgc2Vl
bXMgdG8gYmUgYSBwcm9ibGVtIHdpdGggcHl0aG9uIHBhY2thZ2UgdmVyc2lvbnMgbm90IGZpdHRp
bmcgaW5zaWRlDQo+IHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyLiBOb3QgYmVpbmcgYSBw
eXRob24gZXhwZXJ0LCBidXQgSSB3YXMgYWJsZSB0byBmaXgNCj4gdGhpcyB3aXRoIHVwZGF0aW5n
IHB5dGhvbjMtZG9ja2VyLWNvbXBvc2UgdG8gMS4yMS4yLiBBbHNvIGhhZCB0byBhZGFwdA0KPiBQ
YXNjYWwgQmFjaHMgcGF0Y2ggdG8gZml4IHRoZSByZXF1ZXN0cyB2ZXJzaW9uIChub3Qgc3VyZSBp
ZiBwYXRjaGluZyBhIHBhdGNoIGlzDQo+IHRoZSB3YXkgdG8gZ2/igKYpLg0KDQpCZXN0IHdvdWxk
IGJlIHRvIHRlc3QgaWYgdGhlIG5ldyB2ZXJzaW9uIHJlc3RyaWN0aW9uIHdvcmtzIGFuZCB0aGVu
IHN1Ym1pdCB0aGUgY2hhbmdlIHVwc3RyZWFtLg0KDQpJcyB0aGVyZSBhIHJlYXNvbiB5b3UgZGlk
IHVwZGF0ZSB0byAxLjIxLjIgYW5kIG5vdCAxLjI0LjA/DQoNCj4gUGxlYXNlIGV4Y3VzZSB0aGUg
cGF0Y2ggZm9ybWF0LCBnaXQgc2VuZC1lbWFpbCBpcyBub3QgYXZhaWxhYmxlIHRvIG1lIHJpZ2h0
DQo+IG5vdy4NCj4gDQo+IA0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2RvY2tl
ci1jb21wb3NlL2ZpbGVzLzAwMDEtQWxsb3ctbmV3ZXItDQo+IHZlcnNpb25zLW9mLXJlcXVlc3Rz
LnBhdGNoIGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci0NCj4gY29tcG9zZS9maWxlcy8wMDAx
LUFsbG93LW5ld2VyLXZlcnNpb25zLW9mLXJlcXVlc3RzLnBhdGNoDQo+IGluZGV4IDZmYzdiYjQu
LmUzMzI5ZmUgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9z
ZS9maWxlcy8wMDAxLUFsbG93LW5ld2VyLXZlcnNpb25zLQ0KPiBvZi1yZXF1ZXN0cy5wYXRjaA0K
PiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvZmlsZXMvMDAwMS1BbGxv
dy1uZXdlci0NCj4gdmVyc2lvbnMtDQo+ICsrKyBvZi1yZXF1ZXN0cy5wYXRjaA0KPiBAQCAtMjIs
OCArMjIsOCBAQCBpbmRleCAxOTJhMGY2Li5mNDQ0NzU3IDEwMDY0NA0KPiAgICAgICAnY2FjaGVk
LXByb3BlcnR5ID49IDEuMi4wLCA8IDInLA0KPiAgICAgICAnZG9jb3B0ID49IDAuNi4xLCA8IDAu
NycsDQo+ICAgICAgICdQeVlBTUwgPj0gMy4xMCwgPCA0JywNCj4gLS0gICAgJ3JlcXVlc3RzID49
IDIuNi4xLCAhPSAyLjExLjAsIDwgMi4xMicsDQo+IC0rICAgICdyZXF1ZXN0cyA+PSAyLjYuMSwg
IT0gMi4xMS4wJywNCj4gKy0gICAgJ3JlcXVlc3RzID49IDIuNi4xLCAhPSAyLjExLjAsICE9IDIu
MTIuMiwgIT0gMi4xOC4wLCA8IDIuMTknLA0KPiArKyAgICAncmVxdWVzdHMgPj0gMi42LjEsICE9
IDIuMTEuMCwgIT0gMi4xMi4yLCAhPSAyLjE4LjAnLA0KPiAgICAgICAndGV4dHRhYmxlID49IDAu
OS4wLCA8IDAuMTAnLA0KPiAgICAgICAnd2Vic29ja2V0LWNsaWVudCA+PSAwLjMyLjAsIDwgMS4w
JywNCj4gICAgICAgJ2RvY2tlciA+PSAyLjUuMSwgPCAzLjAnLA0KPiBkaWZmIC0tZ2l0IGEvcmVj
aXBlcy1jb250YWluZXJzL2RvY2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2VyLQ0KPiBjb21wb3Nl
XzEuMTYuMS5iYiBiL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRob24zLWRv
Y2tlci0NCj4gY29tcG9zZV8xLjIxLjIuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4NCUNCj4gcmVu
YW1lIGZyb20gcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2Vy
LQ0KPiBjb21wb3NlXzEuMTYuMS5iYg0KPiByZW5hbWUgdG8gcmVjaXBlcy1jb250YWluZXJzL2Rv
Y2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2VyLQ0KPiBjb21wb3NlXzEuMjEuMi5iYg0KPiBpbmRl
eCA4NTFjMjUxLi5iMjUxYWY5IDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9j
a2VyLWNvbXBvc2UvcHl0aG9uMy1kb2NrZXItDQo+IGNvbXBvc2VfMS4xNi4xLmJiDQo+ICsrKyBi
L3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRob24zLWRvY2tlci0NCj4gY29t
cG9zZV8xLjIxLjIuYmINCj4gQEAgLTcsOCArNyw4IEBAIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAx
LUFsbG93LW5ld2VyLXZlcnNpb25zLW9mLQ0KPiByZXF1ZXN0cy5wYXRjaCINCj4gDQo+ICBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMNCj4gDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiOGRjYWRmMDkx
NDM2MDBmY2I1NzNiNDNmNDQ2YzhmOWEiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZmI0
NmE2YTJjNGQxOTNhM2ZmMWU0ZDcyMDhlZWE5MjBiNjI5YzgxZGM5MjI1N2M4N2YzZjkzMDk1Y2Zi
MGJkZiINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICJhMjQzZjU5YjJkMjg2YzQxZmY2ZWQxYzRkNGI1
MDk5NiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI2OGIwNzE5Mzc1NTQ0MGQ1ZjhkNGY0
N2U2ZjM0ODQyMTJhZmMyNTVkNWI3ODVhODEzNTNlYTFlOTI5OGMxYzJjIg0KPiANCj4gIFJERVBF
TkRTXyR7UE59ID0gIlwNCj4gICAgJHtQWVRIT05fUE59LWNhY2hlZC1wcm9wZXJ0eSBcDQo+IA0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBDaHJpc3RvcGggU3RlaW4NCj4gDQo+IA0KPiBTQU1TT04g
QUtUSUVOR0VTRUxMU0NIQUZUDQo+IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogRnJhbmtmdXJ0IGFt
IE1haW4NCj4gUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBGcmFua2Z1cnQgYW0gTWFpbiwg
TnIuIEhSQiA3MTMxIFZvcnNpdHplbmRlcg0KPiBkZXMgQXVmc2ljaHRzcmF0ZXM6IERyLiBOaWtv
bGF1cyBIZW5zZWwNCj4gVm9yc3RhbmQ6IERyLiBBbmRyZWFzIFdpZGwgKFZvcnMuKSwgUmF1bCBG
dWNocywgRHIuIEluZ28gS29jaCwgRHIuIFRob21hcw0KPiBTdGVja2VucmVpdGVyDQo+IA0KPiBE
ZXIgSW5oYWx0IGRpZXNlciBOYWNocmljaHQgaXN0IHZlcnRyYXVsaWNoIHVuZCBudXIgZsO8ciBk
ZW4gYW5nZWdlYmVuZW4NCj4gRW1wZsOkbmdlciBiZXN0aW1tdC4NCj4gSmVkZSBGb3JtIGRlciBL
ZW5udG5pc25haG1lIGR1cmNoIERyaXR0ZSBvZGVyIGRlciBXZWl0ZXJnYWJlIGFuIERyaXR0ZSBp
c3QNCj4gdW56dWzDpHNzaWcuDQo+IFNvbGx0ZSBkaWVzZSBOYWNocmljaHQgbmljaHQgZsO8ciBT
aWUgYmVzdGltbXQgc2Vpbiwgc28gYml0dGVuIHdpciBTaWUsIHNpY2ggbWl0DQo+IHVucyBwZXIg
RS1NYWlsIG9kZXIgdGVsZWZvbmlzY2ggaW4gVmVyYmluZHVuZyB6dSBzZXR6ZW4uDQo+IA0KPiAN
Cj4gU0FNU09OIEFLVElFTkdFU0VMTFNDSEFGVA0KPiBSZWdpc3RlcmVkIE9mZmljZTogRnJhbmtm
dXJ0IGFtIE1haW4NCj4gQ291cnQgb2YgcmVnaXN0cmF0aW9uOiBMb2NhbCBEaXN0cmljdCBDb3Vy
dCBGcmFua2Z1cnQgYW0gTWFpbiwgbm8uIEhSQiA3MTMxDQo+IENoYWlybWFuIG9mIHRoZSBTdXBl
cnZpc29yeSBCb2FyZDogRHIuIE5pa29sYXVzIEhlbnNlbCBFeGVjdXRpdmUgQm9hcmQ6IERyLg0K
PiBBbmRyZWFzIFdpZGwgKENoYWlybWFuKSwgUmF1bCBGdWNocywgRHIuIEluZ28gS29jaCwgRHIu
IFRob21hcw0KPiBTdGVja2VucmVpdGVyDQo+IA0KPiBUaGUgY29udGVudCBvZiB0aGlzIG1lc3Nh
Z2UgaXMgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBvbmx5IGZvciB0aGUNCj4gcmVjaXBpZW50
IGluZGljYXRlZC4NCj4gVGFraW5nIG5vdGljZSBvZiB0aGlzIG1lc3NhZ2Ugb3IgZGlzY2xvc3Vy
ZSBieSB0aGlyZCBwYXJ0aWVzIGlzIG5vdCBwZXJtaXR0ZWQuDQo+IEluIHRoZSBldmVudCB0aGF0
IHRoaXMgbWVzc2FnZSBpcyBub3QgaW50ZW5kZWQgZm9yIHlvdSwgcGxlYXNlIGNvbnRhY3QgdXMg
dmlhDQo+IGUtbWFpbCBvciBwaG9uZS4NCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gbWV0YS12aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QNCj4gbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQo=


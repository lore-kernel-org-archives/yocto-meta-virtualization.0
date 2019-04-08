Return-Path: <cstein@samson.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B5D1E00B77; Mon,  8 Apr 2019 05:59:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [95.131.99.5 listed in list.dnswl.org]
Received: from mailgate2.samson.ag (mailgate2.samson.ag [95.131.99.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A568E00AB0
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 05:59:05 -0700 (PDT)
Received: from mailgate2.samson.ag (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A745B3008B;
	Mon,  8 Apr 2019 14:59:03 +0200 (CEST)
Received: from SV00183.samsongroup.intra (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9126930089;
	Mon,  8 Apr 2019 14:59:03 +0200 (CEST)
Received: from smail1.samsongroup.intra (unknown [172.20.38.68])
	by SV00183.samsongroup.intra (Postfix) with ESMTPS;
	Mon,  8 Apr 2019 14:59:03 +0200 (CEST)
Received: from A400S100.samsongroup.intra (nsmpx-intra.samsongroup.intra
	[172.30.37.30]) by smail1.samsongroup.intra (Postfix) with ESMTPS;
	Mon,  8 Apr 2019 14:59:03 +0200 (CEST)
Received: from A400S101.samsongroup.intra (172.30.38.101) by
	A400S100.samsongroup.intra (172.30.38.100) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 8 Apr 2019 14:59:02 +0200
Received: from A400S101.samsongroup.intra ([fe80::f5f9:4fc9:fe99:cf61]) by
	A400S101.samsongroup.intra ([fe80::f5f9:4fc9:fe99:cf61%20]) with mapi
	id 15.00.1395.000; Mon, 8 Apr 2019 14:59:02 +0200
From: "Stein, Christoph" <CStein@samson.de>
To: "Bach, Pascal" <pascal.bach@siemens.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] [PATCH] python3-docker-compose: upgrade to
	1.21.2
Thread-Index: AdTt1GYKhy74m2jGS6q05K6cpT4KrQAISr7wAAOPADA=
Date: Mon, 8 Apr 2019 12:59:01 +0000
Message-ID: <6a651c608cc44feb8c8a1c45216169db@A400S101.samsongroup.intra>
References: <e5a5d6b7bd984f05bc7c7cdf6b7fda4c@A400S102.samsongroup.intra>
	<355BE46A91031048906B695426A8D8E62EA33C22@DENBGAT9EL2MSX.ww902.siemens.net>
In-Reply-To: <355BE46A91031048906B695426A8D8E62EA33C22@DENBGAT9EL2MSX.ww902.siemens.net>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.30.37.30]
x-exclaimer-md-config: 239fb7cf-dc1c-42df-8a6b-7e0668728443
x-tm-snts-smtp: C083D4159CD0F1E5D87BD855F25EF7C19C0D851B42F17DFE3CD7DFF2B4E723152000:8
MIME-Version: 1.0
X-TM-AS-GCONF: 00
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
X-List-Received-Date: Mon, 08 Apr 2019 12:59:07 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IHdoaWxlIHVwZGF0aW5nIGEgcHJvamVjdCB0byAyLjYgKHRodWQpIEkgZW5jb3VudGVyZWQg
YSBwcm9ibGVtIHJ1bm5pbmcNCj4gPiBkb2NrZXItY29tcG9zZTogVGhlIGltYWdlIGJ1aWxkcyBh
bmQgYm9vdHMgdXAgd2l0aG91dCBwcm9ibGVtcy4gQnV0DQo+ID4gb25jZSB3ZSB0cnkgdG8gcnVu
IGRvY2tlci1jb21wb3NlIG9uIHRoZSB0YXJnZXQgaXQgY29tcGxhaW5zIHRoYXQgdGhlDQo+ID4g
cHl0aG9uMy0gZG9ja2VyIHZlcnNpb24gZG9lcyBub3QgZml0Lg0KPiA+DQo+ID4gLSBTZWVtaW5n
bHkgZG9ja2VyLWNvbXBvc2UgKHJlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRo
b24zLQ0KPiA+IGRvY2tlci1jb21wb3NlXzEuMTYuMS5iYikgZXhwZWN0cyBhIHB5dGhvbjMtZG9j
a2VyIHZlcnNpb24gcmFuZ2luZw0KPiA+IGZyb20NCj4gPiAyLjUuMSB0byAzLjAuDQo+ID4gLSBT
aW5jZSB0aGUgaW5jbHVkZWQgcHl0aG9uMy1kb2NrZXIgdmVyc2lvbiBpcyAzLjQuMCAocmVjaXBl
cy0NCj4gPiBkZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2NrZXJfMy40LjAuYmIpIHRoaXMgaXMg
b3V0IG9mIHJhbmdlIGFuZA0KPiA+IGxlYWRzIHRvIGRvY2tlci1jb21wb3NlIGNvbXBsYWluaW5n
Lg0KPiA+DQo+ID4gU28gaXQgc2VlbXMgdG8gYmUgYSBwcm9ibGVtIHdpdGggcHl0aG9uIHBhY2th
Z2UgdmVyc2lvbnMgbm90IGZpdHRpbmcNCj4gPiBpbnNpZGUgdGhlIG1ldGEtdmlydHVhbGl6YXRp
b24gbGF5ZXIuIE5vdCBiZWluZyBhIHB5dGhvbiBleHBlcnQsIGJ1dCBJDQo+ID4gd2FzIGFibGUg
dG8gZml4IHRoaXMgd2l0aCB1cGRhdGluZyBweXRob24zLWRvY2tlci1jb21wb3NlIHRvIDEuMjEu
Mi4NCj4gPiBBbHNvIGhhZCB0byBhZGFwdCBQYXNjYWwgQmFjaHMgcGF0Y2ggdG8gZml4IHRoZSBy
ZXF1ZXN0cyB2ZXJzaW9uIChub3QNCj4gPiBzdXJlIGlmIHBhdGNoaW5nIGEgcGF0Y2ggaXMgdGhl
IHdheSB0byBnb+KApikuDQo+DQo+IEJlc3Qgd291bGQgYmUgdG8gdGVzdCBpZiB0aGUgbmV3IHZl
cnNpb24gcmVzdHJpY3Rpb24gd29ya3MgYW5kIHRoZW4NCj4gc3VibWl0IHRoZSBjaGFuZ2UgdXBz
dHJlYW0uDQoNCkRvY2tlci1jb21wb3NlIHNlZW1zIHRvIHdvcmsgZmluZSBhY2NvcmRpbmcgdG8g
bXkgb2JzZXJ2YXRpb24gd2l0aCBhIHNhbXBsZSBwcm9qZWN0LiBBIHB5dGhvbiBleHBlcnQgY291
bGQgcHJvYmFibHkgdGVzdCB0aGlzIG1vcmUgdGhvcm91Z2hseS4NCg0KPiBJcyB0aGVyZSBhIHJl
YXNvbiB5b3UgZGlkIHVwZGF0ZSB0byAxLjIxLjIgYW5kIG5vdCAxLjI0LjA/DQoNCjEuMjQuMCBh
bHNvIHJhaXNlZCB0aGUgcHl0aG9uMy1kb2NrZXIgcmVxdWlyZW1lbnQgdG8gMy43LjAsIHNvIDEu
MjEuMiBsb29rZWQgbGlrZSB0aGUgc2FmZXIgYmV0Lg0KDQo+ID4gUGxlYXNlIGV4Y3VzZSB0aGUg
cGF0Y2ggZm9ybWF0LCBnaXQgc2VuZC1lbWFpbCBpcyBub3QgYXZhaWxhYmxlIHRvIG1lDQo+ID4g
cmlnaHQgbm93Lg0KPiA+DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJz
L2RvY2tlci1jb21wb3NlL2ZpbGVzLzAwMDEtQWxsb3ctbmV3ZXItDQo+ID4gdmVyc2lvbnMtb2Yt
cmVxdWVzdHMucGF0Y2ggYi9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLQ0KPiA+IGNvbXBvc2Uv
ZmlsZXMvMDAwMS1BbGxvdy1uZXdlci12ZXJzaW9ucy1vZi1yZXF1ZXN0cy5wYXRjaA0KPiA+IGlu
ZGV4IDZmYzdiYjQuLmUzMzI5ZmUgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9yZWNpcGVzLWNvbnRh
aW5lcnMvZG9ja2VyLWNvbXBvc2UvZmlsZXMvMDAwMS1BbGxvdy1uZXdlci12ZXJzaW9ucy0NCj4g
PiBvZi1yZXF1ZXN0cy5wYXRjaA0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXIt
Y29tcG9zZS9maWxlcy8wMDAxLUFsbG93LW5ld2VyLQ0KPiA+IHZlcnNpb25zLQ0KPiA+ICsrKyBv
Zi1yZXF1ZXN0cy5wYXRjaA0KPiA+IEBAIC0yMiw4ICsyMiw4IEBAIGluZGV4IDE5MmEwZjYuLmY0
NDQ3NTcgMTAwNjQ0DQo+ID4gICAgICAgJ2NhY2hlZC1wcm9wZXJ0eSA+PSAxLjIuMCwgPCAyJywN
Cj4gPiAgICAgICAnZG9jb3B0ID49IDAuNi4xLCA8IDAuNycsDQo+ID4gICAgICAgJ1B5WUFNTCA+
PSAzLjEwLCA8IDQnLA0KPiA+IC0tICAgICdyZXF1ZXN0cyA+PSAyLjYuMSwgIT0gMi4xMS4wLCA8
IDIuMTInLA0KPiA+IC0rICAgICdyZXF1ZXN0cyA+PSAyLjYuMSwgIT0gMi4xMS4wJywNCj4gPiAr
LSAgICAncmVxdWVzdHMgPj0gMi42LjEsICE9IDIuMTEuMCwgIT0gMi4xMi4yLCAhPSAyLjE4LjAs
IDwgMi4xOScsDQo+ID4gKysgICAgJ3JlcXVlc3RzID49IDIuNi4xLCAhPSAyLjExLjAsICE9IDIu
MTIuMiwgIT0gMi4xOC4wJywNCj4gPiAgICAgICAndGV4dHRhYmxlID49IDAuOS4wLCA8IDAuMTAn
LA0KPiA+ICAgICAgICd3ZWJzb2NrZXQtY2xpZW50ID49IDAuMzIuMCwgPCAxLjAnLA0KPiA+ICAg
ICAgICdkb2NrZXIgPj0gMi41LjEsIDwgMy4wJywNCj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1j
b250YWluZXJzL2RvY2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2VyLQ0KPiA+IGNvbXBvc2VfMS4x
Ni4xLmJiIGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2Vy
LQ0KPiA+IGNvbXBvc2VfMS4yMS4yLmJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA4NCUNCj4gPiBy
ZW5hbWUgZnJvbSByZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvcHl0aG9uMy1kb2Nr
ZXItDQo+ID4gY29tcG9zZV8xLjE2LjEuYmINCj4gPiByZW5hbWUgdG8gcmVjaXBlcy1jb250YWlu
ZXJzL2RvY2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2VyLQ0KPiA+IGNvbXBvc2VfMS4yMS4yLmJi
DQo+ID4gaW5kZXggODUxYzI1MS4uYjI1MWFmOSAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNv
bnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvcHl0aG9uMy1kb2NrZXItDQo+ID4gY29tcG9zZV8xLjE2
LjEuYmINCj4gPiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvcHl0aG9u
My1kb2NrZXItDQo+ID4gY29tcG9zZV8xLjIxLjIuYmINCj4gPiBAQCAtNyw4ICs3LDggQEAgU1JD
X1VSSSArPSAiZmlsZTovLzAwMDEtQWxsb3ctbmV3ZXItdmVyc2lvbnMtb2YtDQo+ID4gcmVxdWVz
dHMucGF0Y2giDQo+ID4NCj4gPiAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzDQo+ID4NCj4gPiAt
U1JDX1VSSVttZDVzdW1dID0gIjhkY2FkZjA5MTQzNjAwZmNiNTczYjQzZjQ0NmM4ZjlhIg0KPiA+
IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ICJmYjQ2YTZhMmM0ZDE5M2EzZmYxZTRkNzIwOGVl
YTkyMGI2MjljODFkYzkyMjU3Yzg3ZjNmOTMwOTVjZmIwYmRmIg0KPiA+ICtTUkNfVVJJW21kNXN1
bV0gPSAiYTI0M2Y1OWIyZDI4NmM0MWZmNmVkMWM0ZDRiNTA5OTYiDQo+ID4gK1NSQ19VUklbc2hh
MjU2c3VtXSA9DQo+ID4gIjY4YjA3MTkzNzU1NDQwZDVmOGQ0ZjQ3ZTZmMzQ4NDIxMmFmYzI1NWQ1
Yjc4NWE4MTM1M2VhMWU5Mjk4YzFjMmMiDQo+ID4NCj4gPiAgUkRFUEVORFNfJHtQTn0gPSAiXA0K
PiA+ICAgICR7UFlUSE9OX1BOfS1jYWNoZWQtcHJvcGVydHkgXA0KPiA+DQo+ID4NCj4gPiBCZXN0
IHJlZ2FyZHMsDQo+ID4gQ2hyaXN0b3BoIFN0ZWluDQoNCg0KU0FNU09OIEFLVElFTkdFU0VMTFND
SEFGVA0KU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBGcmFua2Z1cnQgYW0gTWFpbg0KUmVnaXN0ZXJn
ZXJpY2h0OiBBbXRzZ2VyaWNodCBGcmFua2Z1cnQgYW0gTWFpbiwgTnIuIEhSQiA3MTMxDQpWb3Jz
aXR6ZW5kZXIgZGVzIEF1ZnNpY2h0c3JhdGVzOiBEci4gTmlrb2xhdXMgSGVuc2VsDQpWb3JzdGFu
ZDogRHIuIEFuZHJlYXMgV2lkbCAoVm9ycy4pLCBSYXVsIEZ1Y2hzLCBEci4gSW5nbyBLb2NoLCBE
ci4gVGhvbWFzIFN0ZWNrZW5yZWl0ZXINCg0KRGVyIEluaGFsdCBkaWVzZXIgTmFjaHJpY2h0IGlz
dCB2ZXJ0cmF1bGljaCB1bmQgbnVyIGbDvHIgZGVuIGFuZ2VnZWJlbmVuIEVtcGbDpG5nZXIgYmVz
dGltbXQuDQpKZWRlIEZvcm0gZGVyIEtlbm50bmlzbmFobWUgZHVyY2ggRHJpdHRlIG9kZXIgZGVy
IFdlaXRlcmdhYmUgYW4gRHJpdHRlIGlzdCB1bnp1bMOkc3NpZy4NClNvbGx0ZSBkaWVzZSBOYWNo
cmljaHQgbmljaHQgZsO8ciBTaWUgYmVzdGltbXQgc2Vpbiwgc28gYml0dGVuIHdpciBTaWUsIHNp
Y2ggbWl0IHVucyBwZXIgRS1NYWlsIG9kZXIgdGVsZWZvbmlzY2ggaW4gVmVyYmluZHVuZyB6dSBz
ZXR6ZW4uDQoNCg0KU0FNU09OIEFLVElFTkdFU0VMTFNDSEFGVA0KUmVnaXN0ZXJlZCBPZmZpY2U6
IEZyYW5rZnVydCBhbSBNYWluDQpDb3VydCBvZiByZWdpc3RyYXRpb246IExvY2FsIERpc3RyaWN0
IENvdXJ0IEZyYW5rZnVydCBhbSBNYWluLCBuby4gSFJCIDcxMzENCkNoYWlybWFuIG9mIHRoZSBT
dXBlcnZpc29yeSBCb2FyZDogRHIuIE5pa29sYXVzIEhlbnNlbA0KRXhlY3V0aXZlIEJvYXJkOiBE
ci4gQW5kcmVhcyBXaWRsIChDaGFpcm1hbiksIFJhdWwgRnVjaHMsIERyLiBJbmdvIEtvY2gsIERy
LiBUaG9tYXMgU3RlY2tlbnJlaXRlcg0KDQpUaGUgY29udGVudCBvZiB0aGlzIG1lc3NhZ2UgaXMg
Y29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcmVjaXBpZW50IGluZGljYXRl
ZC4NClRha2luZyBub3RpY2Ugb2YgdGhpcyBtZXNzYWdlIG9yIGRpc2Nsb3N1cmUgYnkgdGhpcmQg
cGFydGllcyBpcyBub3QgcGVybWl0dGVkLg0KSW4gdGhlIGV2ZW50IHRoYXQgdGhpcyBtZXNzYWdl
IGlzIG5vdCBpbnRlbmRlZCBmb3IgeW91LCBwbGVhc2UgY29udGFjdCB1cyB2aWEgZS1tYWlsIG9y
IHBob25lLg0K


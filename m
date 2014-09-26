Return-Path: <Hong-Hua.Yin@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A647E00796; Thu, 25 Sep 2014 18:32:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [157.56.110.148 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0148.outbound.protection.outlook.com [157.56.110.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E3E8E00769
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 18:32:27 -0700 (PDT)
Received: from CY1PR0301MB0730.namprd03.prod.outlook.com (25.160.159.148) by
	CY1PR0301MB1292.namprd03.prod.outlook.com (25.161.213.154) with
	Microsoft
	SMTP Server (TLS) id 15.0.1039.15; Fri, 26 Sep 2014 01:32:24 +0000
Received: from CY1PR0301MB0729.namprd03.prod.outlook.com (25.160.159.147) by
	CY1PR0301MB0730.namprd03.prod.outlook.com (25.160.159.148) with
	Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Fri, 26 Sep 2014 01:32:23 +0000
Received: from CY1PR0301MB0729.namprd03.prod.outlook.com ([25.160.159.147]) by
	CY1PR0301MB0729.namprd03.prod.outlook.com ([25.160.159.147]) with
	mapi id 15.00.1034.003; Fri, 26 Sep 2014 01:32:22 +0000
From: "Hong-Hua.Yin@freescale.com" <Hong-Hua.Yin@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Josep Puigdemont
	<josep.puigdemont@enea.com>
Thread-Topic: [meta-virtualization] [PATCH] libvirt: uprev to v1.2.8
Thread-Index: AQHP2Jm48r7fJJ8pZkSPqepQVI/3TJwRqIaAgAAakICAAN2NsA==
Date: Fri, 26 Sep 2014 01:32:21 +0000
Message-ID: <fcc161fe17104ad9a7a24cccfb9522f4@CY1PR0301MB0729.namprd03.prod.outlook.com>
References: <1411633276-18572-1-git-send-email-r63875@freescale.com>
	<20140925103837.GA2163@iapetus.enea.se>
	<CADkTA4PCaqGQnbTHuO_a6LG64Qiagcy5xBjf+fZUM_+ykNoyYw@mail.gmail.com>
In-Reply-To: <CADkTA4PCaqGQnbTHuO_a6LG64Qiagcy5xBjf+fZUM_+ykNoyYw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [123.151.195.49]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0730;UriScan:;
x-forefront-prvs: 03468CBA43
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(24454002)(189002)(51704005)(377454003)(13464003)(64706001)(107046002)(81542003)(85852003)(50986999)(2656002)(4396001)(83322001)(15975445006)(54356999)(81342003)(76176999)(46102003)(66066001)(74662003)(106356001)(74502003)(83072002)(77982003)(575784001)(20776003)(21056001)(85306004)(76482002)(92566001)(90102001)(76576001)(15202345003)(19580405001)(80022003)(79102003)(108616004)(15395725005)(86362001)(74316001)(99286002)(31966008)(77096002)(10300001)(19580395003)(106116001)(95666004)(101416001)(33646002)(120916001)(87936001)(97736003)(99396003)(105586002)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0730;
	H:CY1PR0301MB0729.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1292;
X-OriginatorOrg: freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Fri, 26 Sep 2014 01:32:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIEkgZGlkbid0IG1lYW4gdG8gcmVtb3ZlIHB0ZXN0Lg0KSSBqdXN0IGNvbmZ1c2Ugd2hl
biB0aGlzIHBhcnQgd2lsbCBiZSBtZXJnZWQgdG8gbGlidmlydCB1cHN0cmVhbS4NCkl0IHNlZW1l
ZCB0aGF0IHRoZXJlIGlzIG5vIGNvbmZsaWN0IHdpdGggcHRlc3QgcGF0Y2hlcyB0byB3b3JrIG9u
IGxpYnZpcnQtdjEuMi44Lg0KSSdsbCBzdWJtaXQgdGhlIHYyIHBhdGNoIHRvIHVwZ3JhZGUgdGhl
IHZlcnNpb24uDQoNCkJlc3QgUmVnYXJkcywNCk9saXZpYQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEJydWNlIEFzaGZpZWxkIFttYWlsdG86YnJ1Y2UuYXNoZmllbGRA
Z21haWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI1LCAyMDE0IDg6MTQgUE0N
Cj4gVG86IEpvc2VwIFB1aWdkZW1vbnQNCj4gQ2M6IFlpbiBPbGl2aWEtUjYzODc1OyBtZXRhLXZp
cnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1
YWxpemF0aW9uXSBbUEFUQ0hdIGxpYnZpcnQ6IHVwcmV2IHRvIHYxLjIuOA0KPiANCj4gT24gVGh1
LCBTZXAgMjUsIDIwMTQgYXQgNjozOCBBTSwgSm9zZXAgUHVpZ2RlbW9udA0KPiA8am9zZXAucHVp
Z2RlbW9udEBlbmVhLmNvbT4gd3JvdGU6DQo+ID4gT24gVGh1LCBTZXAgMjUsIDIwMTQgYXQgMDQ6
MjE6MTZQTSArMDgwMCwgT2xpdmlhIFlpbiB3cm90ZToNCj4gPj4gLS0tDQo+ID4+ICAuLi4vbGli
dmlydC97bGlidmlydF8xLjIuNC5iYiA9PiBsaWJ2aXJ0XzEuMi44LmJifSAgICAgIHwgMTcgKysr
LS0tLS0tLS0tLS0tLS0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKSAgcmVuYW1lDQo+ID4+IHJlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC97bGli
dmlydF8xLjIuNC5iYiA9PiBsaWJ2aXJ0XzEuMi44LmJifSAoOTElKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xpYnZpcnRfMS4yLjQuYmINCj4gPj4g
Yi9yZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQvbGlidmlydF8xLjIuOC5iYg0KPiA+PiBzaW1pbGFy
aXR5IGluZGV4IDkxJQ0KPiA+PiByZW5hbWUgZnJvbSByZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQv
bGlidmlydF8xLjIuNC5iYg0KPiA+PiByZW5hbWUgdG8gcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0
L2xpYnZpcnRfMS4yLjguYmINCj4gPj4gaW5kZXggNTZiNGQ0Yi4uY2RjZDU0YiAxMDA2NDQNCj4g
Pj4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xpYnZpcnRfMS4yLjQuYmINCj4gPj4g
KysrIGIvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xpYnZpcnRfMS4yLjguYmINCj4gPj4gQEAg
LTI0LDE2ICsyNCwxMiBAQCBSREVQRU5EU19saWJ2aXJ0LWxpYnZpcnRkX2FwcGVuZF94ODYgPSAi
IGRtaWRlY29kZSINCj4gPj4gIFJDT05GTElDVFNfJHtQTn1fbGlidmlydGQgPSAiY29ubm1hbiIN
Cj4gPj4NCj4gPj4gIFNSQ19VUkkgPSAiaHR0cDovL2xpYnZpcnQub3JnL3NvdXJjZXMvbGlidmly
dC0ke1BWfS50YXIuZ3o7bmFtZT1saWJ2aXJ0IFwNCj4gPj4gLSAgICAgICAgICAgZmlsZTovL3Rv
b2xzLWFkZC1saWJ2aXJ0LW5ldC1ycGMtdG8tdmlydC1ob3N0LXZhbGlkYXRlLXdoZW4ucGF0Y2gg
XA0KPiA+PiAgICAgICAgICAgICBmaWxlOi8vbGlidmlydGQuc2ggXA0KPiA+PiAgICAgICAgICAg
ICBmaWxlOi8vbGlidmlydGQuY29uZiBcDQo+ID4+IC0gICAgICAgICAgIGZpbGU6Ly9ydW5wdGVz
dC5wYXRjaCBcDQo+ID4+IC0gICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPiA+PiAtICAg
ICAgICAgICBmaWxlOi8vdGVzdHMtYWxsb3ctc2VwYXJhdGVkLXNyYy1hbmQtYnVpbGQtZGlycy5w
YXRjaCBcDQo+ID4+ICAgICAgICAgICAgIg0KPiA+Pg0KPiA+PiAtU1JDX1VSSVtsaWJ2aXJ0Lm1k
NXN1bV0gPSAiZGE3YTljYTUxOWRmNDVhNDYwNjU5MTg5ZmUwMDI0ZTYiDQo+ID4+IC1TUkNfVVJJ
W2xpYnZpcnQuc2hhMjU2c3VtXSA9DQo+ICJlNDNhYzVmNmIyYmFlYWZjZDAxNzc3YmUwM2E4OTdl
NjM2ZjhkNDhjMGNkZmI0YzRjYmI4MGQ0NWZhYTllODc1Ig0KPiA+PiArU1JDX1VSSVtsaWJ2aXJ0
Lm1kNXN1bV0gPSAiNzUxMTQ5OTEyOTBmN2M4ZjAxZGQ1MjIzNDMxYjljMDAiDQo+ID4+ICtTUkNf
VVJJW2xpYnZpcnQuc2hhMjU2c3VtXSA9DQo+ICIwMDQ5OTQwYjAxM2VhNTg1OGI1M2Q5YjU0MGM5
ZGY5Y2MzYzhjYjA4NzUwYWNmZDk2ZTk5OTFhMWY3MDllMTAwIg0KPiA+Pg0KPiA+PiAgaW5oZXJp
dCBhdXRvdG9vbHMgZ2V0dGV4dCB1cGRhdGUtcmMuZCBwa2djb25maWcgcHRlc3QNCj4gPj4NCj4g
Pj4gQEAgLTY4LDEwICs2NCw2IEBAIGFjX2N2X3BhdGhfTFZTPS91c3Ivc2Jpbi9sdnMgXA0KPiA+
PiBhY19jdl9wYXRoX1BBUlRFRD0vdXNyL3NiaW4vcGFydGVkIFwNCj4gPj4gYWNfY3ZfcGF0aF9E
TVNFVFVQPS91c3Ivc2Jpbi9kbXNldHVwIg0KPiA+Pg0KPiA+PiAtIyBFbnN1cmUgdGhhdCBsaWJ2
aXJ0IHVzZXMgcG9sa2l0IHJhdGhlciB0aGFuIHBvbGljeWtpdCwgd2hldGhlciB0aGUNCj4gPj4g
aG9zdCBoYXMgLSMgcGtjaGVjayBpbnN0YWxsZWQgb3Igbm90LCBhbmQgZW5zdXJlIHRoZSBwYXRo
IGlzIGNvcnJlY3QgcGVyIG91cg0KPiBjb25maWcuDQo+ID4+IC1DQUNIRURfQ09ORklHVVJFVkFS
UyArPQ0KPiAiYWNfY3ZfcGF0aF9QS0NIRUNLX1BBVEg9JHtiaW5kaXJ9L3BrY2hlY2siDQo+ID4+
IC0NCj4gPj4gICMgU29tZSBvdGhlciBwb3NzaWJsZSBwYXRocyB3ZSBhcmUgbm90IHlldCBzZXR0
aW5nDQo+ID4+ICNhY19jdl9wYXRoX1JQQ0dFTj0gICNhY19jdl9wYXRoX1hTTFRQUk9DPSBAQCAt
ODAsNiArNzIsNyBAQA0KPiA+PiBDQUNIRURfQ09ORklHVVJFVkFSUyArPQ0KPiAiYWNfY3ZfcGF0
aF9QS0NIRUNLX1BBVEg9JHtiaW5kaXJ9L3BrY2hlY2siDQo+ID4+ICAjYWNfY3ZfcGF0aF9FQlRB
QkxFU19QQVRIPQ0KPiA+PiAgI2FjX2N2X3BhdGhfUEtHX0NPTkZJRz0NCj4gPj4gICNhY19jdl9w
YXRoX2FjX3B0X1BLR19DT05GSUcNCj4gPj4gKyNhY19jdl9wYXRoX1BLQ0hFQ0tfUEFUSD0NCj4g
Pj4gICNhY19jdl9wYXRoX1BPTEtJVF9BVVRIPQ0KPiA+PiAgI2FjX2N2X3BhdGhfRFRSQUNFPQ0K
PiA+PiAgI2FjX2N2X3BhdGhfSVNDU0lBRE09DQo+ID4+IEBAIC0xNzIsNyArMTY1LDYgQEAgUEFD
S0FHRUNPTkZJR1tlYnRhYmxlc10gPQ0KPiA+PiAiYWNfY3ZfcGF0aF9FQlRBQkxFU19QQVRIPS9z
YmluL2VidGFibGVzLGFjX2N2X3BhdGhfRUINCj4gPj4gIFBBQ0tBR0VDT05GSUdbcHl0aG9uXSA9
ICIsLHB5dGhvbiwiDQo+ID4+ICBQQUNLQUdFQ09ORklHW3Nhc2xdID0gIi0td2l0aC1zYXNsLC0t
d2l0aG91dC1zYXNsLGN5cnVzLXNhc2wsY3lydXMtc2FzbCINCj4gPj4gIFBBQ0tBR0VDT05GSUdb
aXByb3V0ZTJdID0NCj4gImFjX2N2X3BhdGhfSVBfUEFUSD0vc2Jpbi9pcCxhY19jdl9wYXRoX0lQ
X1BBVEg9LGlwcm91dGUyLGlwcm91dGUyIg0KPiA+PiAtUEFDS0FHRUNPTkZJR1tudW1hY3RsXSA9
ICItLXdpdGgtbnVtYWN0bCwtLXdpdGhvdXQtbnVtYWN0bCxudW1hY3RsLCINCj4gPj4gIFBBQ0tB
R0VDT05GSUdbZnVzZV0gPSAiLS13aXRoLWZ1c2UsLS13aXRob3V0LWZ1c2UsZnVzZSwiDQo+ID4+
DQo+ID4+ICAjIEVuYWJsZSB0aGUgUHl0aG9uIHRvb2wgc3VwcG9ydA0KPiA+PiBAQCAtMjAzLDkg
KzE5NSw2IEBAIGRvX2luc3RhbGxfYXBwZW5kKCkgew0KPiA+PiAgICAgICAgICAgID4+ICR7RH0k
e3N5c2NvbmZkaXJ9L2RlZmF1bHQvdm9sYXRpbGVzLzk5X2xpYnZpcnQNCj4gPj4gICAgICAgZWNo
byAiZCByb290IHJvb3QgMDc1NSAke2xvY2Fsc3RhdGVkaXJ9L3J1bi9saWJ2aXJ0L3FlbXUgbm9u
ZSIgXA0KPiA+PiAgICAgICAgICAgID4+ICR7RH0ke3N5c2NvbmZkaXJ9L2RlZmF1bHQvdm9sYXRp
bGVzLzk5X2xpYnZpcnQNCj4gPj4gLQ0KPiA+PiAtICAgICAjIEFkZCBob29rIHN1cHBvcnQgZm9y
IGxpYnZpcnQNCj4gPj4gLSAgICAgbWtkaXIgLXAgJHtEfS9ldGMvbGlidmlydC9ob29rcw0KPiA+
PiAgfQ0KPiA+Pg0KPiA+PiAgRVhUUkFfT0VNQUtFID0gIkJVSUxEX0RJUj0ke0J9IERFU1RfRElS
PSR7RH0ke1BURVNUX1BBVEh9DQo+IFBURVNUX0RJUj0ke1BURVNUX1BBVEh9Ig0KPiA+DQo+ID4g
QXBhcnQgZnJvbSB0aGUgdmVyc2lvbiB1cGdyYWRlLCB0aGVyZSBhcmUgbWFueSB0aGluZ3MgYmVp
bmcgcmVtb3ZlZA0KPiA+IGZyb20gdGhlIHJlY2lwZSwgbGlrZSBwYXRjaGVzLCBwdGVzdHMsIG51
bWFjdGwgY29uZmlndXJhdGlvbi4uLi4gY291bGQNCj4gPiB5b3UgZXhwbGFpbiBhIGJpdCB0aGUg
cHVycG9zZSBvZiB0aGUgcmVtb3ZhbD8NCj4gDQo+IEFncmVlZC4gSW4gcGFydGljdWxhciwgSSdk
IHF1aXRlIGxpa2UgdG8ga2VlcCB0aGUgaG9va3MgZGlyZWN0b3J5IGNyZWF0aW9uIGFuZA0KPiBu
dW1hY3RsLg0KPiBTbyB1bmxlc3MgdGhlcmUncyBzb21lIHNvcnQgb2YgaG9ycmlibGUgZXJyb3Ig
dGhhdCBJJ3ZlIG5ldmVyIHNlZW4sIHdlIHdvdWxkbid0DQo+IG1lcmdlIHRoaXMgYXMtaXMuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiBCcnVjZQ0KPiANCj4gPg0KPiA+IFRoYW5rIHlvdSwNCj4gPg0K
PiA+IC9Kb3NlcA0KPiA+DQo+ID4+IC0tDQo+ID4+IDIuMS4wLjI3Lmc5NmRiMzI0DQo+ID4+DQo+
ID4+IC0tDQo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ID4+IG1ldGEtdmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0DQo+ID4+IG1ldGEtdmly
dHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiA+PiBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0KPiA+IC0tDQo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBtZXRhLXZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KPiA+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9q
ZWN0Lm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRh
LXZpcnR1YWxpemF0aW9uDQo+IA0KPiANCj4gDQo+IC0tDQo+ICJUaG91IHNoYWx0IG5vdCBmb2xs
b3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQg
aXRzDQo+IGVuZCINCg==


Return-Path: <cstein@samson.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41C9AE00C44; Sun,  7 Apr 2019 23:56:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [95.131.99.72 listed in list.dnswl.org]
Received: from mailgate.samson.ag (mailgate.samson.ag [95.131.99.72])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDF42E009A0
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Apr 2019 23:56:46 -0700 (PDT)
Received: from mailgate.samson.ag (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56EDDD0090
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 08:56:45 +0200 (CEST)
Received: from SV00182.samsongroup.intra (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A5DED008F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 08:56:45 +0200 (CEST)
Received: from smail2.samsongroup.intra (unknown [172.20.38.68])
	by SV00182.samsongroup.intra (Postfix) with ESMTPS
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 08:56:45 +0200 (CEST)
Received: from SP00056.samsongroup.intra (nsmpx-intra.samsongroup.intra
	[172.30.37.30]) by smail2.samsongroup.intra (Postfix) with ESMTPS
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 08:56:45 +0200 (CEST)
Received: from A400S102.samsongroup.intra (172.30.38.102) by
	SP00056.samsongroup.intra (172.30.38.39) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 8 Apr 2019 08:56:44 +0200
Received: from A400S102.samsongroup.intra ([fe80::e440:597e:d74d:6721]) by
	A400S102.samsongroup.intra ([fe80::e440:597e:d74d:6721%20]) with mapi
	id 15.00.1395.000; Mon, 8 Apr 2019 08:56:44 +0200
From: "Stein, Christoph" <CStein@samson.de>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] [PATCH] python3-docker-compose: upgrade to
	1.21.2
Thread-Index: AdTt1GYKhy74m2jGS6q05K6cpT4KrQ==
Date: Mon, 8 Apr 2019 06:56:43 +0000
Message-ID: <e5a5d6b7bd984f05bc7c7cdf6b7fda4c@A400S102.samsongroup.intra>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.30.37.30]
x-tm-snts-smtp: B4CA808E7E0B47C67818CEDD95D78DCF61259F267F37E58ED62DD9ADC3B5D5182000:8
x-exclaimer-md-config: 239fb7cf-dc1c-42df-8a6b-7e0668728443
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] python3-docker-compose: upgrade to 1.21.2
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
X-List-Received-Date: Mon, 08 Apr 2019 06:56:48 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCndoaWxlIHVwZGF0aW5nIGEgcHJvamVjdCB0byAyLjYgKHRodWQpIEkgZW5jb3VudGVy
ZWQgYSBwcm9ibGVtIHJ1bm5pbmcgZG9ja2VyLWNvbXBvc2U6IFRoZSBpbWFnZSBidWlsZHMgYW5k
IGJvb3RzIHVwIHdpdGhvdXQgcHJvYmxlbXMuIEJ1dCBvbmNlIHdlIHRyeSB0byBydW4gZG9ja2Vy
LWNvbXBvc2Ugb24gdGhlIHRhcmdldCBpdCBjb21wbGFpbnMgdGhhdCB0aGUgcHl0aG9uMy1kb2Nr
ZXIgdmVyc2lvbiBkb2VzIG5vdCBmaXQuDQoNCi0gU2VlbWluZ2x5IGRvY2tlci1jb21wb3NlIChy
ZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvcHl0aG9uMy1kb2NrZXItY29tcG9zZV8x
LjE2LjEuYmIpIGV4cGVjdHMgYSBweXRob24zLWRvY2tlciB2ZXJzaW9uIHJhbmdpbmcgZnJvbSAy
LjUuMSB0byAzLjAuDQotIFNpbmNlIHRoZSBpbmNsdWRlZCBweXRob24zLWRvY2tlciB2ZXJzaW9u
IGlzIDMuNC4wIChyZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY2tlcl8zLjQuMC5i
YikgdGhpcyBpcyBvdXQgb2YgcmFuZ2UgYW5kIGxlYWRzIHRvIGRvY2tlci1jb21wb3NlIGNvbXBs
YWluaW5nLg0KDQpTbyBpdCBzZWVtcyB0byBiZSBhIHByb2JsZW0gd2l0aCBweXRob24gcGFja2Fn
ZSB2ZXJzaW9ucyBub3QgZml0dGluZyBpbnNpZGUgdGhlIG1ldGEtdmlydHVhbGl6YXRpb24gbGF5
ZXIuIE5vdCBiZWluZyBhIHB5dGhvbiBleHBlcnQsIGJ1dCBJIHdhcyBhYmxlIHRvIGZpeCB0aGlz
IHdpdGggdXBkYXRpbmcgcHl0aG9uMy1kb2NrZXItY29tcG9zZSB0byAxLjIxLjIuIEFsc28gaGFk
IHRvIGFkYXB0IFBhc2NhbCBCYWNocyBwYXRjaCB0byBmaXggdGhlIHJlcXVlc3RzIHZlcnNpb24g
KG5vdCBzdXJlIGlmIHBhdGNoaW5nIGEgcGF0Y2ggaXMgdGhlIHdheSB0byBnb+KApikuDQoNClBs
ZWFzZSBleGN1c2UgdGhlIHBhdGNoIGZvcm1hdCwgZ2l0IHNlbmQtZW1haWwgaXMgbm90IGF2YWls
YWJsZSB0byBtZSByaWdodCBub3cuDQoNCg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVy
cy9kb2NrZXItY29tcG9zZS9maWxlcy8wMDAxLUFsbG93LW5ld2VyLXZlcnNpb25zLW9mLXJlcXVl
c3RzLnBhdGNoIGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1jb21wb3NlL2ZpbGVzLzAwMDEt
QWxsb3ctbmV3ZXItdmVyc2lvbnMtb2YtcmVxdWVzdHMucGF0Y2gNCmluZGV4IDZmYzdiYjQuLmUz
MzI5ZmUgMTAwNjQ0DQotLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyLWNvbXBvc2UvZmls
ZXMvMDAwMS1BbGxvdy1uZXdlci12ZXJzaW9ucy1vZi1yZXF1ZXN0cy5wYXRjaA0KKysrIGIvcmVj
aXBlcy1jb250YWluZXJzL2RvY2tlci1jb21wb3NlL2ZpbGVzLzAwMDEtQWxsb3ctbmV3ZXItdmVy
c2lvbnMtb2YtcmVxdWVzdHMucGF0Y2gNCkBAIC0yMiw4ICsyMiw4IEBAIGluZGV4IDE5MmEwZjYu
LmY0NDQ3NTcgMTAwNjQ0DQogICAgICAnY2FjaGVkLXByb3BlcnR5ID49IDEuMi4wLCA8IDInLA0K
ICAgICAgJ2RvY29wdCA+PSAwLjYuMSwgPCAwLjcnLA0KICAgICAgJ1B5WUFNTCA+PSAzLjEwLCA8
IDQnLA0KLS0gICAgJ3JlcXVlc3RzID49IDIuNi4xLCAhPSAyLjExLjAsIDwgMi4xMicsDQotKyAg
ICAncmVxdWVzdHMgPj0gMi42LjEsICE9IDIuMTEuMCcsDQorLSAgICAncmVxdWVzdHMgPj0gMi42
LjEsICE9IDIuMTEuMCwgIT0gMi4xMi4yLCAhPSAyLjE4LjAsIDwgMi4xOScsDQorKyAgICAncmVx
dWVzdHMgPj0gMi42LjEsICE9IDIuMTEuMCwgIT0gMi4xMi4yLCAhPSAyLjE4LjAnLA0KICAgICAg
J3RleHR0YWJsZSA+PSAwLjkuMCwgPCAwLjEwJywNCiAgICAgICd3ZWJzb2NrZXQtY2xpZW50ID49
IDAuMzIuMCwgPCAxLjAnLA0KICAgICAgJ2RvY2tlciA+PSAyLjUuMSwgPCAzLjAnLA0KZGlmZiAt
LWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRob24zLWRvY2tlci1j
b21wb3NlXzEuMTYuMS5iYiBiL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRo
b24zLWRvY2tlci1jb21wb3NlXzEuMjEuMi5iYg0Kc2ltaWxhcml0eSBpbmRleCA4NCUNCnJlbmFt
ZSBmcm9tIHJlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRob24zLWRvY2tlci1j
b21wb3NlXzEuMTYuMS5iYg0KcmVuYW1lIHRvIHJlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29t
cG9zZS9weXRob24zLWRvY2tlci1jb21wb3NlXzEuMjEuMi5iYg0KaW5kZXggODUxYzI1MS4uYjI1
MWFmOSAxMDA2NDQNCi0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXItY29tcG9zZS9weXRo
b24zLWRvY2tlci1jb21wb3NlXzEuMTYuMS5iYg0KKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2Rv
Y2tlci1jb21wb3NlL3B5dGhvbjMtZG9ja2VyLWNvbXBvc2VfMS4yMS4yLmJiDQpAQCAtNyw4ICs3
LDggQEAgU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtQWxsb3ctbmV3ZXItdmVyc2lvbnMtb2YtcmVx
dWVzdHMucGF0Y2giDQoNCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMNCg0KLVNSQ19VUklbbWQ1
c3VtXSA9ICI4ZGNhZGYwOTE0MzYwMGZjYjU3M2I0M2Y0NDZjOGY5YSINCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZmI0NmE2YTJjNGQxOTNhM2ZmMWU0ZDcyMDhlZWE5MjBiNjI5YzgxZGM5MjI1N2M4
N2YzZjkzMDk1Y2ZiMGJkZiINCitTUkNfVVJJW21kNXN1bV0gPSAiYTI0M2Y1OWIyZDI4NmM0MWZm
NmVkMWM0ZDRiNTA5OTYiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4YjA3MTkzNzU1NDQwZDVm
OGQ0ZjQ3ZTZmMzQ4NDIxMmFmYzI1NWQ1Yjc4NWE4MTM1M2VhMWU5Mjk4YzFjMmMiDQoNCiBSREVQ
RU5EU18ke1BOfSA9ICJcDQogICAke1BZVEhPTl9QTn0tY2FjaGVkLXByb3BlcnR5IFwNCg0KDQpC
ZXN0IHJlZ2FyZHMsDQpDaHJpc3RvcGggU3RlaW4NCg0KDQpTQU1TT04gQUtUSUVOR0VTRUxMU0NI
QUZUDQpTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEZyYW5rZnVydCBhbSBNYWluDQpSZWdpc3Rlcmdl
cmljaHQ6IEFtdHNnZXJpY2h0IEZyYW5rZnVydCBhbSBNYWluLCBOci4gSFJCIDcxMzENClZvcnNp
dHplbmRlciBkZXMgQXVmc2ljaHRzcmF0ZXM6IERyLiBOaWtvbGF1cyBIZW5zZWwNClZvcnN0YW5k
OiBEci4gQW5kcmVhcyBXaWRsIChWb3JzLiksIFJhdWwgRnVjaHMsIERyLiBJbmdvIEtvY2gsIERy
LiBUaG9tYXMgU3RlY2tlbnJlaXRlcg0KDQpEZXIgSW5oYWx0IGRpZXNlciBOYWNocmljaHQgaXN0
IHZlcnRyYXVsaWNoIHVuZCBudXIgZsO8ciBkZW4gYW5nZWdlYmVuZW4gRW1wZsOkbmdlciBiZXN0
aW1tdC4NCkplZGUgRm9ybSBkZXIgS2VubnRuaXNuYWhtZSBkdXJjaCBEcml0dGUgb2RlciBkZXIg
V2VpdGVyZ2FiZSBhbiBEcml0dGUgaXN0IHVuenVsw6Rzc2lnLg0KU29sbHRlIGRpZXNlIE5hY2hy
aWNodCBuaWNodCBmw7xyIFNpZSBiZXN0aW1tdCBzZWluLCBzbyBiaXR0ZW4gd2lyIFNpZSwgc2lj
aCBtaXQgdW5zIHBlciBFLU1haWwgb2RlciB0ZWxlZm9uaXNjaCBpbiBWZXJiaW5kdW5nIHp1IHNl
dHplbi4NCg0KDQpTQU1TT04gQUtUSUVOR0VTRUxMU0NIQUZUDQpSZWdpc3RlcmVkIE9mZmljZTog
RnJhbmtmdXJ0IGFtIE1haW4NCkNvdXJ0IG9mIHJlZ2lzdHJhdGlvbjogTG9jYWwgRGlzdHJpY3Qg
Q291cnQgRnJhbmtmdXJ0IGFtIE1haW4sIG5vLiBIUkIgNzEzMQ0KQ2hhaXJtYW4gb2YgdGhlIFN1
cGVydmlzb3J5IEJvYXJkOiBEci4gTmlrb2xhdXMgSGVuc2VsDQpFeGVjdXRpdmUgQm9hcmQ6IERy
LiBBbmRyZWFzIFdpZGwgKENoYWlybWFuKSwgUmF1bCBGdWNocywgRHIuIEluZ28gS29jaCwgRHIu
IFRob21hcyBTdGVja2VucmVpdGVyDQoNClRoZSBjb250ZW50IG9mIHRoaXMgbWVzc2FnZSBpcyBj
b25maWRlbnRpYWwgYW5kIGludGVuZGVkIG9ubHkgZm9yIHRoZSByZWNpcGllbnQgaW5kaWNhdGVk
Lg0KVGFraW5nIG5vdGljZSBvZiB0aGlzIG1lc3NhZ2Ugb3IgZGlzY2xvc3VyZSBieSB0aGlyZCBw
YXJ0aWVzIGlzIG5vdCBwZXJtaXR0ZWQuDQpJbiB0aGUgZXZlbnQgdGhhdCB0aGlzIG1lc3NhZ2Ug
aXMgbm90IGludGVuZGVkIGZvciB5b3UsIHBsZWFzZSBjb250YWN0IHVzIHZpYSBlLW1haWwgb3Ig
cGhvbmUuDQo=


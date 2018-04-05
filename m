Return-Path: <tpradeep@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE94EE00994; Thu,  5 Apr 2018 06:02:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [173.37.142.88 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B7EEE008A2
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Apr 2018 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=9964; q=dns/txt; s=iport;
	t=1522933335; x=1524142935;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=G8gkDcopAbyXOH7kuW696wA2et22Mb6DAcca0eNdz9M=;
	b=A2+f7A/Ztu38aAWjkX/QG2fw4laJk0JCAarRx7hyOXOXNCjM2TrVFqXW
	gXhK/A8Ozhv3CGde9Ppbwrw9AAfJlZYRcODpSqgD2EgMXYJjZK582ilnR
	iWbAmlfyHKrhCdztwZ+J1vBzcHCXhaaMVL08zXObf5uSwU26tJGIsolLz s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DvAADkHcZa/4ENJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8oCoNViACNCIF0dRqGYYt0gXoLGAuEYAIahA0hNBg?=
	=?us-ascii?q?BAgEBAQEBAQJsHAyFIgEBAQEDAQEhETMHCwwEAgEIEQEDAQEBAgIjAwICAh8?=
	=?us-ascii?q?GAQoUAQIGCAIEDgUIEoRbAxUPq2OCHIcIDYErgiAFgQmGWYITgQyCUDSCT0I?=
	=?us-ascii?q?BBIE5AQE1gmmCNCAChx6EV4EdgziGSiwIAoVRhQNegnWBOoNahzGJGjyGBgI?=
	=?us-ascii?q?REwGBJAEcOIFScBU6gkOCIBcRgzSFFIU+b4pagR+BFwEB?=
X-IronPort-AV: E=Sophos;i="5.48,411,1517875200"; d="scan'208";a="94531075"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 13:02:14 +0000
Received: from XCH-ALN-012.cisco.com (xch-aln-012.cisco.com [173.36.7.22])
	by alln-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id w35D2DoJ031691
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 5 Apr 2018 13:02:14 GMT
Received: from xch-rcd-011.cisco.com (173.37.102.21) by XCH-ALN-012.cisco.com
	(173.36.7.22) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Thu, 5 Apr 2018 08:02:13 -0500
Received: from xch-rcd-011.cisco.com ([173.37.102.21]) by
	xch-rcd-011.cisco.com ([173.37.102.21]) with mapi id 15.00.1320.000;
	Thu, 5 Apr 2018 08:02:13 -0500
From: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs
	pushed to master
Thread-Index: AQHTzBBK0HCU1uyqXUyzQ/F8vAFJLqPwiYFwgABf+QCAATeqwA==
Date: Thu, 5 Apr 2018 13:02:13 +0000
Message-ID: <3fd5560f842540be9fbead290ade1792@xch-rcd-011.cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
	<7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
	<CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
	<e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
	<CADkTA4NCE2QnnkvA7+0FUYG3Wf=Y73moeU8e5rQMCzAB-_V1OQ@mail.gmail.com>
In-Reply-To: <CADkTA4NCE2QnnkvA7+0FUYG3Wf=Y73moeU8e5rQMCzAB-_V1OQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.65.87.102]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: RFT/FYI: docker/containerd/runc uprevs pushed to master
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
X-List-Received-Date: Thu, 05 Apr 2018 13:02:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQnJ1Y2UsDQoNCldoaWNoIHZlcnNpb24gb2YgRG9ja2VyIGFyZSB5b3UgcnVubmluZy4N
Cg0KSSBqdXN0IG5vdGljZWQgSSBhbSBydW5uaW5nIERvY2tlciAxLjEzLjEgd2hpY2ggaXMgdG9v
IG9sZC4NCg0KSG93IGRvIEkgbWlncmF0ZSB0byBsYXRlc3QgdmVyc2lvbiBvZiBEb2NrZXIgJiBh
bHNvIGNvcnJlc3BvbmRpbmcgZGVwZW5kZW5jaWVzLg0KDQpSZWdhcmRzLA0KU2hha3RoaSANCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIFttYWlsdG86
YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMDQsIDIw
MTggNjo0NSBQTQ0KVG86IFNoYWt0aGkgUHJhZGVlcCAodHByYWRlZXApIDx0cHJhZGVlcEBjaXNj
by5jb20+DQpDYzogbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0
OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFJGVC9GWUk6IGRvY2tlci9jb250YWluZXJkL3J1
bmMgdXByZXZzIHB1c2hlZCB0byBtYXN0ZXINCg0KRXhjZWxsZW50IG5ld3MuDQoNClllcywgZXZl
cnl0aGluZyBpcyBpbiBtYXN0ZXIgb2YgbWV0YS12aXJ0dWFsaXphdGlvbiBub3cuIFRoYXQgd2F5
IGl0IHdpbGwgaGF2ZSB0aW1lIHRvIHNvYWsgYSBiaXQgYmVmb3JlIHRoZSB1cGNvbWluZyByZWxl
YXNlLg0KDQpDaGVlcnMsDQoNCkJydWNlDQoNCk9uIFdlZCwgQXByIDQsIDIwMTggYXQgODozMiBB
TSwgU2hha3RoaSBQcmFkZWVwICh0cHJhZGVlcCkgPHRwcmFkZWVwQGNpc2NvLmNvbT4gd3JvdGU6
DQo+IEhlbGxvIEJydWNlLA0KPg0KPiBZZXMgSSB3YXMgbWlzc2luZyB0aGUgYmJhcHBlbmQgZm9y
IGtlcm5lbCBjb25maWcuIEdvdCBpdCB3b3JraW5nIGFmdGVyIEkgd3JvdGUgdGhlIG1haWwgdG8g
eW91Lg0KPg0KPiBBcmUgeW91ciBjaGFuZ2VzIGNvbW1pdHRlZCB0byBnaXQgcmVwbz8gSXMgaXQg
aW4gdGhlIG1hc3RlciBicmFuY2ggb2YgWW9jdG8/DQo+DQo+IFJlZ2FyZHMsDQo+IFNoYWt0aGkN
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQg
W21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXBy
aWwgMDQsIDIwMTggNTo1NyBQTQ0KPiBUbzogU2hha3RoaSBQcmFkZWVwICh0cHJhZGVlcCkgPHRw
cmFkZWVwQGNpc2NvLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFJGVC9GWUk6IGRvY2tl
ci9jb250YWluZXJkL3J1bmMgDQo+IHVwcmV2cyBwdXNoZWQgdG8gbWFzdGVyDQo+DQo+IE9uIFdl
ZCwgQXByIDQsIDIwMTggYXQgMTI6NTcgQU0sIFNoYWt0aGkgUHJhZGVlcCAodHByYWRlZXApIDx0
cHJhZGVlcEBjaXNjby5jb20+IHdyb3RlOg0KPj4gSGVsbG8gQnJ1Y2UsDQo+Pg0KPj4NCj4+DQo+
PiBUaW1pbmcgaXMgUGVyZmVjdCAhISENCj4+DQo+Pg0KPj4NCj4+IEkgYW0gY3VycmVudGx5IHRy
eWluZyB0byBnZXQgRG9ja2VyIENFIHRvIHdvcmsgd2l0aCBZb2N0by4gSSBjb3VsZCANCj4+IGlu
Y2x1ZGUgdGhlIERvY2tlciBleGVjdXRhYmxlIGluIElTTyBidXQgd2hlbiBJIHJ1biBpdCBJIGdl
dCBzb21lIGVycm9ycy4NCj4+DQo+Pg0KPj4NCj4+IFdoZW4gSSBib290IHRoZSBpbWFnZSBsb29r
cyBsaWtlIERvY2tlciBzZXJ2aWNlIHN0YXJ0IGlzIGZhaWxpbmcgZHVlIA0KPj4gdG8gbWlzc2lu
ZyBrZXJuZWwgbW9kdWxlcy4gUGxlYXNlIHJlZmVyIGF0dGFjaGVkIHNjcmVlbnNob3QgYW5kIGJl
bG93IA0KPj4gZXJyb3IgbG9nLg0KPg0KPiBEbyB5b3UgaGF2ZSBhIGJiYXBwZW5kIGZvciB5b3Vy
IDQuOCBrZXJuZWwgdGhhdCBhZGRzIHRoZSBkb2NrZXIgY29uZmlndXJhdGlvbiBmcmFnbWVudHMg
Pw0KPg0KPiBUaGF0J3MgdGhlIG1vc3QgbGlrZWx5IHJlYXNvbiBmb3IgdGhlIGlzc3Vlcy4NCj4N
Cj4gSSB3YXMgYWJsZSB0byBydW4gYSB3aG9sZSBzdWl0ZSBvZiB0ZXN0cyBhZ2FpbnN0IDQuMTIs
IDQuMTQgYW5kIDQuMTUgc28gdGhvc2Uga2VybmVscyArIGZyYWdtZW50cyBhcmUga25vd24gdG8g
d29yay4NCj4NCj4gQnJ1Y2UNCj4NCj4+DQo+Pg0KPj4NCj4+ICogZG9ja2VyLnNlcnZpY2UgLSBE
b2NrZXIgQXBwbGljYXRpb24gQ29udGFpbmVyIEVuZ2luZQ0KPj4NCj4+ICAgIExvYWRlZDogbG9h
ZGVkICgvbGliL3N5c3RlbWQvc3lzdGVtL2RvY2tlci5zZXJ2aWNlOyBlbmFibGVkOyANCj4+IHZl
bmRvcg0KPj4gcHJlc2V0OiBlbmFibGVkKQ0KPj4NCj4+ICAgIEFjdGl2ZTogZmFpbGVkIChSZXN1
bHQ6IGV4aXQtY29kZSkgc2luY2UgVHVlIDIwMTgtMDQtMDMgMTM6MTc6NTEgDQo+PiBVVEM7IDE3
bWluIGFnbw0KPj4NCj4+ICAgICAgRG9jczogaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20NCj4+DQo+
PiAgIFByb2Nlc3M6IDMxNyBFeGVjU3RhcnQ9L3Vzci9iaW4vZG9ja2VyZCAtSCBmZDovLyAoY29k
ZT1leGl0ZWQsDQo+PiBzdGF0dXM9MS9GQUlMVVJFKQ0KPj4NCj4+IE1haW4gUElEOiAzMTcgKGNv
ZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFKQ0KPj4NCj4+DQo+Pg0KPj4gQXByIDAzIDEzOjE3
OjUxIGludGVsLXg4Ni02NCBkb2NrZXJkWzMxN106DQo+PiB0aW1lPSIyMDE4LTA0LTAzVDEzOjE3
OjUxLjAzNTE3ODc1NVoiIGxldmVsPXdhcm5pbmcgbXNnPSJSdW5uaW5nIA0KPj4gbW9kcHJvYmUg
eHRfY29ubnRyYWNrIGZhaWxlZCB3aXRoIG1lc3NhZ2U6IGBtb2Rwcm9iZTogV0FSTklORzogTW9k
dWxlIA0KPj4geHRfY29ubnRyYWNrIG5vdCBmb3VuZCBpbiBkaXJlY3RvcnkgDQo+PiAvbGliL21v
ZHVsZXMvNC44LjI0LVdSOS4wLjAuMTBfc3RhbmRhcmRgLCBlcnJvcjogZXhpdCBzdGF0dXMgMSIN
Cj4+DQo+PiBBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XToNCj4+IHRp
bWU9IjIwMTgtMDQtMDNUMTM6MTc6NTEuMDQwNzI3MzcyWiIgbGV2ZWw9aW5mbyBtc2c9IkZpcmV3
YWxsZCBydW5uaW5nOg0KPj4gZmFsc2UiDQo+Pg0KPj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4
Ni02NCBkb2NrZXJkWzMxN106DQo+PiB0aW1lPSIyMDE4LTA0LTAzVDEzOjE3OjUxLjE3MDU3NTM0
NFoiIGxldmVsPXdhcm5pbmcgbXNnPSJDb3VsZCBub3QgDQo+PiBsb2FkIG5lY2Vzc2FyeSBtb2R1
bGVzIGZvciBJUFNFQyBydWxlczogUnVubmluZyBtb2Rwcm9iZSB4ZnJtX3VzZXIgDQo+PiBmYWls
ZWQgd2l0aA0KPj4gbWVzc2FnZTogYG1vZHByb2JlOiBXQVJOSU5HOiBNb2R1bGUgeGZybV91c2Vy
IG5vdCBmb3VuZCBpbiBkaXJlY3RvcnkgDQo+PiAvbGliL21vZHVsZXMvNC44LjI0LVdSOS4wLjAu
MTBfc3RhbmRhcmRgLCBlcnJvcjogZXhpdCBzdGF0dXMgMSINCj4+DQo+PiBBcHIgMDMgMTM6MTc6
NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XToNCj4+IHRpbWU9IjIwMTgtMDQtMDNUMTM6MTc6
NTEuMTcyMzk3OTEzWiIgbGV2ZWw9aW5mbyBtc2c9IkRlZmF1bHQgYnJpZGdlDQo+PiAoZG9ja2Vy
MCkgaXMgYXNzaWduZWQgd2l0aCBhbiBJUCBhZGRyZXNzIDE3Mi4xNy4wLjAvMTYuIERhZW1vbiBv
cHRpb24gDQo+PiAtLWJpcCBjYW4gYmUgdXNlZCB0byBzZXQgYSBwcmVmZXJyZWQgSVAgYWRkcmVz
cyINCj4+DQo+PiBBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XTogRXJy
b3Igc3RhcnRpbmcgZGFlbW9uOg0KPj4gRXJyb3IgaW5pdGlhbGl6aW5nIG5ldHdvcmsgY29udHJv
bGxlcjogRXJyb3IgY3JlYXRpbmcgZGVmYXVsdCAiYnJpZGdlIiBuZXR3b3JrOg0KPj4gRmFpbGVk
IHRvIFNldHVwIElQIHRhYmxlczogVW5hYmxlIHRvIGVuYWJsZSBBQ0NFUFQgSU5DT01JTkcgcnVs
ZToNCj4+IChpcHRhYmxlcw0KPj4gZmFpbGVkOiBpcHRhYmxlcyAtLXdhaXQgLUkgRk9SV0FSRCAt
byBkb2NrZXIwIC1tIGNvbm50cmFjayAtLWN0c3RhdGUgDQo+PiBSRUxBVEVELEVTVEFCTElTSEVE
IC1qIEFDQ0VQVDogaXB0YWJsZXM6IE5vIGNoYWluL3RhcmdldC9tYXRjaCBieSB0aGF0IG5hbWUu
DQo+Pg0KPj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBkb2NrZXJkWzMxN106ICAoZXhp
dCBzdGF0dXMgMSkpDQo+Pg0KPj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1k
WzFdOiBkb2NrZXIuc2VydmljZTogTWFpbiBwcm9jZXNzIA0KPj4gZXhpdGVkLCBjb2RlPWV4aXRl
ZCwgc3RhdHVzPTEvRkFJTFVSRQ0KPj4NCj4+IEFwciAwMyAxMzoxNzo1MSBpbnRlbC14ODYtNjQg
c3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IERvY2tlciANCj4+IEFwcGxpY2F0aW9uIENvbnRh
aW5lciBFbmdpbmUuDQo+Pg0KPj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1k
WzFdOiBkb2NrZXIuc2VydmljZTogVW5pdCBlbnRlcmVkIA0KPj4gZmFpbGVkIHN0YXRlLg0KPj4N
Cj4+IEFwciAwMyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgc3lzdGVtZFsxXTogZG9ja2VyLnNlcnZp
Y2U6IEZhaWxlZCB3aXRoIA0KPj4gcmVzdWx0ICdleGl0LWNvZGUnLg0KPj4NCj4+DQo+Pg0KPj4g
UmVnYXJkcywNCj4+DQo+PiBTaGFrdGhpDQo+Pg0KPj4NCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPj4gRnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbi1ib3VuY2VzQHlvY3RvcHJv
amVjdC5vcmcNCj4+IFttYWlsdG86bWV0YS12aXJ0dWFsaXphdGlvbi1ib3VuY2VzQHlvY3RvcHJv
amVjdC5vcmddIE9uIEJlaGFsZiBPZiANCj4+IEJydWNlIEFzaGZpZWxkDQo+PiBTZW50OiBXZWRu
ZXNkYXksIEFwcmlsIDA0LCAyMDE4IDg6NDQgQU0NCj4+IFRvOiBtZXRhLXZpcnR1YWxpemF0aW9u
QHlvY3RvcHJvamVjdC5vcmcNCj4+IFN1YmplY3Q6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBSRlQv
RllJOiBkb2NrZXIvY29udGFpbmVyZC9ydW5jIHVwcmV2cyANCj4+IHB1c2hlZCB0byBtYXN0ZXIN
Cj4+DQo+Pg0KPj4NCj4+IEhpIGFsbCwNCj4+DQo+Pg0KPj4NCj4+IEFmdGVyIHNwZW5kaW5nIGEg
ZmV3IGRheXMgZGUtdGFuZ2xpbmcgdGhlIG1vYnkvZG9ja2VyL3J1bmMvY29udGFpbmVyZCANCj4+
IGFuZCBvZS1jb3JlIGdvIGluZnJhc3RydWN0dXJlIGNoYW5nZXMsIEkgd2FzIGFibGUgdG8gcnVu
IA0KPj4gZG9ja2VyL3J1bmMvY29udGFpbmVyZCB0aHJvdWdoIGEgc3lzdGVtL3N0cmVzcyB0ZXN0
IGFuZCBldmVyeXRoaW5nIHNlZW1zIHRvIGJlIHdvcmtpbmcuDQo+Pg0KPj4NCj4+DQo+PiBUaGVy
ZSB3ZXJlIGEgZmV3IHJlZ3Jlc3Npb25zIHRoYXQgSSB3b3JrZWQgdGhyb3VnaCwgYXMgd2VsbCBh
cyANCj4+IGJ1aWxkL3BhY2thZ2luZyBjaGFuZ2VzLCBidXQgSSdtIG5vIGxvbmdlciBzZWVpbmcg
YW55IGlzc3VlcyBhbmQgYWxsIA0KPj4gdGhlIHBhdGNoZXMvZnVuY3Rpb25hbGl0eSBoYXZlIGJl
ZW4gY2FycmllZCBmb3J3YXJkLg0KPj4NCj4+DQo+Pg0KPj4gT25lIHRoaW5nIG9mIG5vdGUgaXMg
dGhhdCB0aGUgZG9ja2VyIGFuZCBvcGVuIGNvbnRhaW5lcnMgY29udGFpbmVyZCANCj4+IHNwbGl0
L2ZvcmsgaXMgbm8gbG9uZ2VyIGFuIGlzc3VlLCBzbyBJJ3ZlIG1vZGlmaWVkIHRoZSBkZWZhdWx0
IHRvIGJlIA0KPj4gdGhlIG9wZW5jb250YWluZXJzIHZhcmlhbnQuIFNpbWlsYXJseSwgdGhlIGRv
Y2tlciBhbmQgb3BlbmNvbnRhaW5lcnMgDQo+PiBydW5jIGFyZSB2ZXJ5IHNpbWlsYXIuIEkndmUg
a2VwdCBib3RoIHZhcmlhbnRzIG9mIGJvdGggcmVjaXBlcyBmb3IgDQo+PiBub3csIHNpbmNlIEkn
ZCBsaWtlIHRvIHRyYWNrIHRoaW5ncyBmb3IgYSBiaXQgbG9uZ2VyIGJlZm9yZSBkZWNsYXJpbmcg
DQo+PiB0aGUgc3BsaXQgdW5uZWNlc3NhcnkuDQo+Pg0KPj4NCj4+DQo+PiBBbHNvIGZvciB0aG9z
ZSB0aGF0IGNhcmUsIEkgY3JlYXRlZCBhIHJlZmVyZW5jZSBkb2NrZXItY2UgcmVjaXBlIHRoYXQg
DQo+PiB0cmFja3MgdGhlIGRvY2tlci1jZSByZXBvIHZlcnN1cyB0aGUgY29tcG9uZW50cyB0aGVt
c2VsdmVzLiAgUmlnaHQgDQo+PiBub3cgaXQgaXMgcmVmZXJlbmNlIG9ubHksIHNpbmNlIGl0IG5l
ZWRzIGEgYml0IG1vcmUgd29yaywgYnV0IEkgDQo+PiB3YW50ZWQgdG8gZ2V0IGl0IG91dCB0aGVy
ZSwgaW4gY2FzZSBzb21lb25lIHJlYWxseSBjYXJlcyBhYm91dCANCj4+IGRvY2tlci1jZSAoSSBk
b24ndCByZWFsbHksIGJ1dCBzb21lb25lIG1pZ2h0ISkuDQo+Pg0KPj4NCj4+DQo+PiBTdW1tYXJ5
OiBJIGp1c3QgcHVzaGVkIHRoZSBmb2xsb3dpbmcgY2hhbmdlcyB0byBtYXN0ZXI6DQo+Pg0KPj4N
Cj4+DQo+PiAgIGQ3ZDMxMGFlNDExMyBtZXRhLXZpcnQ6IHByZWZlciBjb250YWluZXJkLW9wZW5j
b250YWluZXJzDQo+Pg0KPj4gICA5MzVlM2Q5NjllZjEgY29udGFpbmVyZDogdXByZXYgdG8gdjEu
MC4yDQo+Pg0KPj4gICBmNWZiZmE4YWM0ZGIgZG9ja2VyLWNlOiBpbnRyb2R1Y2UgcmVmZXJlbmNl
IHJlY2lwZS9idWlsZA0KPj4NCj4+ICAgYTUwNzRjZWNmMThmIGRvY2tlcjogdXByZXYgdG8gMTgu
MDMuMA0KPj4NCj4+ICAgZTNkOTYwZjRmY2Q5IHJ1bmM6IHVwcmV2IHRvIDEuMC4wLXJjNQ0KPj4N
Cj4+DQo+Pg0KPj4gSWYgYW55b25lIHNlZXMgcmVncmVzc2lvbnMsIGJ1aWxkIG9yIGFyY2hpdGVj
dHVyZSBpc3N1ZXMgLi4gcmVwb3J0IA0KPj4gdGhlbSB0byBtZSAoYW5kIHRoZSBsaXN0KSBhbmQg
d2UnbGwgZ2V0IHRoZW0gZml4ZWQgdXAuDQo+Pg0KPj4NCj4+DQo+PiBDaGVlcnMsDQo+Pg0KPj4N
Cj4+DQo+PiBCcnVjZQ0KPj4NCj4+DQo+Pg0KPj4gLS0NCj4+DQo+PiAiVGhvdSBzaGFsdCBub3Qg
Zm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCANCj4+
IHRoZWUgYXQgaXRzIGVuZCINCj4+DQo+PiAtLQ0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pg0KPj4gbWV0YS12aXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QNCj4+DQo+PiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcN
Cj4+DQo+PiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0
dWFsaXphdGlvbg0KPg0KPg0KPg0KPiAtLQ0KPiAiVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBO
VUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQi
DQoNCg0KDQotLQ0KIlRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3Ig
Y2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kIg0K


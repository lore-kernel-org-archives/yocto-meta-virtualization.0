Return-Path: <tpradeep@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24828E00932; Wed,  4 Apr 2018 05:32:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [173.37.86.80 listed in list.dnswl.org]
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
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBAA1E008A2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=8424; q=dns/txt; s=iport;
	t=1522845138; x=1524054738;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=4iLK6IG+ckEVWmTPIW+PLMeoDX6RjPx5/Z9PmRqJGxM=;
	b=MUFm8RyD863y6f7jDgU3nCQGmKhAC8RyPb6XTArDA0RULXYlpzw9UkgK
	roQ/iacEhxZg5K+CN+22bquW5+6NMIhZJeajZ16WGS/IZFo3YF6hVSClB
	Pwl22ViMBiizVrjwKsncxpy+bokdZVcqa04r8kOMaHuCaDGSYgHZqca5V A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AXAgAsxcRa/5xdJa1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8oCoNVlQiBdHUahmGLdIF6CxgLhGACGoQyITUXAQI?=
	=?us-ascii?q?BAQEBAQECbBwMhSIBAQEBAwEBIREzBwsMBAIBCBEBAwEBAQICIwMCAgIfBgE?=
	=?us-ascii?q?KFAECBggCBA4FCIRtAxUPq0+CHIcLDYErgiAFgQmGWYITgQyCUDSCT0IBBIE?=
	=?us-ascii?q?5AQE1gmmCNCAChxyEV4EdigIsCAKFUYUDXoJ1gTqDWYcxiRU7hgYCERMBgSQ?=
	=?us-ascii?q?BHQE2gVJwFTqCQ4IgFxGDNIUUhT5vizuBH4EXAQE?=
X-IronPort-AV: E=Sophos;i="5.48,406,1517875200"; d="scan'208";a="369584678"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 12:32:16 +0000
Received: from XCH-ALN-012.cisco.com (xch-aln-012.cisco.com [173.36.7.22])
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w34CWHMG032680
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 4 Apr 2018 12:32:17 GMT
Received: from xch-rcd-011.cisco.com (173.37.102.21) by XCH-ALN-012.cisco.com
	(173.36.7.22) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Wed, 4 Apr 2018 07:32:16 -0500
Received: from xch-rcd-011.cisco.com ([173.37.102.21]) by
	xch-rcd-011.cisco.com ([173.37.102.21]) with mapi id 15.00.1320.000;
	Wed, 4 Apr 2018 07:32:16 -0500
From: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs
	pushed to master
Thread-Index: AQHTzBBK0HCU1uyqXUyzQ/F8vAFJLqPwiYFw
Date: Wed, 4 Apr 2018 12:32:16 +0000
Message-ID: <e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
	<7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
	<CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
In-Reply-To: <CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.65.76.203]
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
X-List-Received-Date: Wed, 04 Apr 2018 12:32:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQnJ1Y2UsDQoNClllcyBJIHdhcyBtaXNzaW5nIHRoZSBiYmFwcGVuZCBmb3Iga2VybmVs
IGNvbmZpZy4gR290IGl0IHdvcmtpbmcgYWZ0ZXIgSSB3cm90ZSB0aGUgbWFpbCB0byB5b3UuDQoN
CkFyZSB5b3VyIGNoYW5nZXMgY29tbWl0dGVkIHRvIGdpdCByZXBvPyBJcyBpdCBpbiB0aGUgbWFz
dGVyIGJyYW5jaCBvZiBZb2N0bz8NCg0KUmVnYXJkcywNClNoYWt0aGkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIFttYWlsdG86YnJ1Y2UuYXNoZmll
bGRAZ21haWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMDQsIDIwMTggNTo1NyBQTQ0K
VG86IFNoYWt0aGkgUHJhZGVlcCAodHByYWRlZXApIDx0cHJhZGVlcEBjaXNjby5jb20+DQpDYzog
bWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW21ldGEt
dmlydHVhbGl6YXRpb25dIFJGVC9GWUk6IGRvY2tlci9jb250YWluZXJkL3J1bmMgdXByZXZzIHB1
c2hlZCB0byBtYXN0ZXINCg0KT24gV2VkLCBBcHIgNCwgMjAxOCBhdCAxMjo1NyBBTSwgU2hha3Ro
aSBQcmFkZWVwICh0cHJhZGVlcCkgPHRwcmFkZWVwQGNpc2NvLmNvbT4gd3JvdGU6DQo+IEhlbGxv
IEJydWNlLA0KPg0KPg0KPg0KPiBUaW1pbmcgaXMgUGVyZmVjdCAhISENCj4NCj4NCj4NCj4gSSBh
bSBjdXJyZW50bHkgdHJ5aW5nIHRvIGdldCBEb2NrZXIgQ0UgdG8gd29yayB3aXRoIFlvY3RvLiBJ
IGNvdWxkIA0KPiBpbmNsdWRlIHRoZSBEb2NrZXIgZXhlY3V0YWJsZSBpbiBJU08gYnV0IHdoZW4g
SSBydW4gaXQgSSBnZXQgc29tZSBlcnJvcnMuDQo+DQo+DQo+DQo+IFdoZW4gSSBib290IHRoZSBp
bWFnZSBsb29rcyBsaWtlIERvY2tlciBzZXJ2aWNlIHN0YXJ0IGlzIGZhaWxpbmcgZHVlIA0KPiB0
byBtaXNzaW5nIGtlcm5lbCBtb2R1bGVzLiBQbGVhc2UgcmVmZXIgYXR0YWNoZWQgc2NyZWVuc2hv
dCBhbmQgYmVsb3cgDQo+IGVycm9yIGxvZy4NCg0KRG8geW91IGhhdmUgYSBiYmFwcGVuZCBmb3Ig
eW91ciA0Ljgga2VybmVsIHRoYXQgYWRkcyB0aGUgZG9ja2VyIGNvbmZpZ3VyYXRpb24gZnJhZ21l
bnRzID8NCg0KVGhhdCdzIHRoZSBtb3N0IGxpa2VseSByZWFzb24gZm9yIHRoZSBpc3N1ZXMuDQoN
Ckkgd2FzIGFibGUgdG8gcnVuIGEgd2hvbGUgc3VpdGUgb2YgdGVzdHMgYWdhaW5zdCA0LjEyLCA0
LjE0IGFuZCA0LjE1IHNvIHRob3NlIGtlcm5lbHMgKyBmcmFnbWVudHMgYXJlIGtub3duIHRvIHdv
cmsuDQoNCkJydWNlDQoNCj4NCj4NCj4NCj4gKiBkb2NrZXIuc2VydmljZSAtIERvY2tlciBBcHBs
aWNhdGlvbiBDb250YWluZXIgRW5naW5lDQo+DQo+ICAgIExvYWRlZDogbG9hZGVkICgvbGliL3N5
c3RlbWQvc3lzdGVtL2RvY2tlci5zZXJ2aWNlOyBlbmFibGVkOyB2ZW5kb3INCj4gcHJlc2V0OiBl
bmFibGVkKQ0KPg0KPiAgICBBY3RpdmU6IGZhaWxlZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNl
IFR1ZSAyMDE4LTA0LTAzIDEzOjE3OjUxIA0KPiBVVEM7IDE3bWluIGFnbw0KPg0KPiAgICAgIERv
Y3M6IGh0dHBzOi8vZG9jcy5kb2NrZXIuY29tDQo+DQo+ICAgUHJvY2VzczogMzE3IEV4ZWNTdGFy
dD0vdXNyL2Jpbi9kb2NrZXJkIC1IIGZkOi8vIChjb2RlPWV4aXRlZCwNCj4gc3RhdHVzPTEvRkFJ
TFVSRSkNCj4NCj4gTWFpbiBQSUQ6IDMxNyAoY29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkUp
DQo+DQo+DQo+DQo+IEFwciAwMyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgZG9ja2VyZFszMTddOg0K
PiB0aW1lPSIyMDE4LTA0LTAzVDEzOjE3OjUxLjAzNTE3ODc1NVoiIGxldmVsPXdhcm5pbmcgbXNn
PSJSdW5uaW5nIA0KPiBtb2Rwcm9iZSB4dF9jb25udHJhY2sgZmFpbGVkIHdpdGggbWVzc2FnZTog
YG1vZHByb2JlOiBXQVJOSU5HOiBNb2R1bGUgDQo+IHh0X2Nvbm50cmFjayBub3QgZm91bmQgaW4g
ZGlyZWN0b3J5IA0KPiAvbGliL21vZHVsZXMvNC44LjI0LVdSOS4wLjAuMTBfc3RhbmRhcmRgLCBl
cnJvcjogZXhpdCBzdGF0dXMgMSINCj4NCj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBk
b2NrZXJkWzMxN106DQo+IHRpbWU9IjIwMTgtMDQtMDNUMTM6MTc6NTEuMDQwNzI3MzcyWiIgbGV2
ZWw9aW5mbyBtc2c9IkZpcmV3YWxsZCBydW5uaW5nOg0KPiBmYWxzZSINCj4NCj4gQXByIDAzIDEz
OjE3OjUxIGludGVsLXg4Ni02NCBkb2NrZXJkWzMxN106DQo+IHRpbWU9IjIwMTgtMDQtMDNUMTM6
MTc6NTEuMTcwNTc1MzQ0WiIgbGV2ZWw9d2FybmluZyBtc2c9IkNvdWxkIG5vdCANCj4gbG9hZCBu
ZWNlc3NhcnkgbW9kdWxlcyBmb3IgSVBTRUMgcnVsZXM6IFJ1bm5pbmcgbW9kcHJvYmUgeGZybV91
c2VyIA0KPiBmYWlsZWQgd2l0aA0KPiBtZXNzYWdlOiBgbW9kcHJvYmU6IFdBUk5JTkc6IE1vZHVs
ZSB4ZnJtX3VzZXIgbm90IGZvdW5kIGluIGRpcmVjdG9yeSANCj4gL2xpYi9tb2R1bGVzLzQuOC4y
NC1XUjkuMC4wLjEwX3N0YW5kYXJkYCwgZXJyb3I6IGV4aXQgc3RhdHVzIDEiDQo+DQo+IEFwciAw
MyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgZG9ja2VyZFszMTddOg0KPiB0aW1lPSIyMDE4LTA0LTAz
VDEzOjE3OjUxLjE3MjM5NzkxM1oiIGxldmVsPWluZm8gbXNnPSJEZWZhdWx0IGJyaWRnZQ0KPiAo
ZG9ja2VyMCkgaXMgYXNzaWduZWQgd2l0aCBhbiBJUCBhZGRyZXNzIDE3Mi4xNy4wLjAvMTYuIERh
ZW1vbiBvcHRpb24gDQo+IC0tYmlwIGNhbiBiZSB1c2VkIHRvIHNldCBhIHByZWZlcnJlZCBJUCBh
ZGRyZXNzIg0KPg0KPiBBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XTog
RXJyb3Igc3RhcnRpbmcgZGFlbW9uOiANCj4gRXJyb3IgaW5pdGlhbGl6aW5nIG5ldHdvcmsgY29u
dHJvbGxlcjogRXJyb3IgY3JlYXRpbmcgZGVmYXVsdCAiYnJpZGdlIiBuZXR3b3JrOg0KPiBGYWls
ZWQgdG8gU2V0dXAgSVAgdGFibGVzOiBVbmFibGUgdG8gZW5hYmxlIEFDQ0VQVCBJTkNPTUlORyBy
dWxlOiAgDQo+IChpcHRhYmxlcw0KPiBmYWlsZWQ6IGlwdGFibGVzIC0td2FpdCAtSSBGT1JXQVJE
IC1vIGRvY2tlcjAgLW0gY29ubnRyYWNrIC0tY3RzdGF0ZSANCj4gUkVMQVRFRCxFU1RBQkxJU0hF
RCAtaiBBQ0NFUFQ6IGlwdGFibGVzOiBObyBjaGFpbi90YXJnZXQvbWF0Y2ggYnkgdGhhdCBuYW1l
Lg0KPg0KPiBBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XTogIChleGl0
IHN0YXR1cyAxKSkNCj4NCj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1kWzFd
OiBkb2NrZXIuc2VydmljZTogTWFpbiBwcm9jZXNzIA0KPiBleGl0ZWQsIGNvZGU9ZXhpdGVkLCBz
dGF0dXM9MS9GQUlMVVJFDQo+DQo+IEFwciAwMyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgc3lzdGVt
ZFsxXTogRmFpbGVkIHRvIHN0YXJ0IERvY2tlciANCj4gQXBwbGljYXRpb24gQ29udGFpbmVyIEVu
Z2luZS4NCj4NCj4gQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1kWzFdOiBkb2Nr
ZXIuc2VydmljZTogVW5pdCBlbnRlcmVkIA0KPiBmYWlsZWQgc3RhdGUuDQo+DQo+IEFwciAwMyAx
MzoxNzo1MSBpbnRlbC14ODYtNjQgc3lzdGVtZFsxXTogZG9ja2VyLnNlcnZpY2U6IEZhaWxlZCB3
aXRoIA0KPiByZXN1bHQgJ2V4aXQtY29kZScuDQo+DQo+DQo+DQo+IFJlZ2FyZHMsDQo+DQo+IFNo
YWt0aGkNCj4NCj4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbWV0
YS12aXJ0dWFsaXphdGlvbi1ib3VuY2VzQHlvY3RvcHJvamVjdC5vcmcNCj4gW21haWx0bzptZXRh
LXZpcnR1YWxpemF0aW9uLWJvdW5jZXNAeW9jdG9wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIA0K
PiBCcnVjZSBBc2hmaWVsZA0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDA0LCAyMDE4IDg6NDQg
QU0NCj4gVG86IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0
OiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gUkZUL0ZZSTogZG9ja2VyL2NvbnRhaW5lcmQvcnVuYyB1
cHJldnMgDQo+IHB1c2hlZCB0byBtYXN0ZXINCj4NCj4NCj4NCj4gSGkgYWxsLA0KPg0KPg0KPg0K
PiBBZnRlciBzcGVuZGluZyBhIGZldyBkYXlzIGRlLXRhbmdsaW5nIHRoZSBtb2J5L2RvY2tlci9y
dW5jL2NvbnRhaW5lcmQgDQo+IGFuZCBvZS1jb3JlIGdvIGluZnJhc3RydWN0dXJlIGNoYW5nZXMs
IEkgd2FzIGFibGUgdG8gcnVuIA0KPiBkb2NrZXIvcnVuYy9jb250YWluZXJkIHRocm91Z2ggYSBz
eXN0ZW0vc3RyZXNzIHRlc3QgYW5kIGV2ZXJ5dGhpbmcgc2VlbXMgdG8gYmUgd29ya2luZy4NCj4N
Cj4NCj4NCj4gVGhlcmUgd2VyZSBhIGZldyByZWdyZXNzaW9ucyB0aGF0IEkgd29ya2VkIHRocm91
Z2gsIGFzIHdlbGwgYXMgDQo+IGJ1aWxkL3BhY2thZ2luZyBjaGFuZ2VzLCBidXQgSSdtIG5vIGxv
bmdlciBzZWVpbmcgYW55IGlzc3VlcyBhbmQgYWxsIA0KPiB0aGUgcGF0Y2hlcy9mdW5jdGlvbmFs
aXR5IGhhdmUgYmVlbiBjYXJyaWVkIGZvcndhcmQuDQo+DQo+DQo+DQo+IE9uZSB0aGluZyBvZiBu
b3RlIGlzIHRoYXQgdGhlIGRvY2tlciBhbmQgb3BlbiBjb250YWluZXJzIGNvbnRhaW5lcmQgDQo+
IHNwbGl0L2ZvcmsgaXMgbm8gbG9uZ2VyIGFuIGlzc3VlLCBzbyBJJ3ZlIG1vZGlmaWVkIHRoZSBk
ZWZhdWx0IHRvIGJlIA0KPiB0aGUgb3BlbmNvbnRhaW5lcnMgdmFyaWFudC4gU2ltaWxhcmx5LCB0
aGUgZG9ja2VyIGFuZCBvcGVuY29udGFpbmVycyANCj4gcnVuYyBhcmUgdmVyeSBzaW1pbGFyLiBJ
J3ZlIGtlcHQgYm90aCB2YXJpYW50cyBvZiBib3RoIHJlY2lwZXMgZm9yIA0KPiBub3csIHNpbmNl
IEknZCBsaWtlIHRvIHRyYWNrIHRoaW5ncyBmb3IgYSBiaXQgbG9uZ2VyIGJlZm9yZSBkZWNsYXJp
bmcgDQo+IHRoZSBzcGxpdCB1bm5lY2Vzc2FyeS4NCj4NCj4NCj4NCj4gQWxzbyBmb3IgdGhvc2Ug
dGhhdCBjYXJlLCBJIGNyZWF0ZWQgYSByZWZlcmVuY2UgZG9ja2VyLWNlIHJlY2lwZSB0aGF0IA0K
PiB0cmFja3MgdGhlIGRvY2tlci1jZSByZXBvIHZlcnN1cyB0aGUgY29tcG9uZW50cyB0aGVtc2Vs
dmVzLiAgUmlnaHQgbm93IA0KPiBpdCBpcyByZWZlcmVuY2Ugb25seSwgc2luY2UgaXQgbmVlZHMg
YSBiaXQgbW9yZSB3b3JrLCBidXQgSSB3YW50ZWQgdG8gDQo+IGdldCBpdCBvdXQgdGhlcmUsIGlu
IGNhc2Ugc29tZW9uZSByZWFsbHkgY2FyZXMgYWJvdXQgZG9ja2VyLWNlIChJIA0KPiBkb24ndCBy
ZWFsbHksIGJ1dCBzb21lb25lIG1pZ2h0ISkuDQo+DQo+DQo+DQo+IFN1bW1hcnk6IEkganVzdCBw
dXNoZWQgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRvIG1hc3RlcjoNCj4NCj4NCj4NCj4gICBkN2Qz
MTBhZTQxMTMgbWV0YS12aXJ0OiBwcmVmZXIgY29udGFpbmVyZC1vcGVuY29udGFpbmVycw0KPg0K
PiAgIDkzNWUzZDk2OWVmMSBjb250YWluZXJkOiB1cHJldiB0byB2MS4wLjINCj4NCj4gICBmNWZi
ZmE4YWM0ZGIgZG9ja2VyLWNlOiBpbnRyb2R1Y2UgcmVmZXJlbmNlIHJlY2lwZS9idWlsZA0KPg0K
PiAgIGE1MDc0Y2VjZjE4ZiBkb2NrZXI6IHVwcmV2IHRvIDE4LjAzLjANCj4NCj4gICBlM2Q5NjBm
NGZjZDkgcnVuYzogdXByZXYgdG8gMS4wLjAtcmM1DQo+DQo+DQo+DQo+IElmIGFueW9uZSBzZWVz
IHJlZ3Jlc3Npb25zLCBidWlsZCBvciBhcmNoaXRlY3R1cmUgaXNzdWVzIC4uIHJlcG9ydCANCj4g
dGhlbSB0byBtZSAoYW5kIHRoZSBsaXN0KSBhbmQgd2UnbGwgZ2V0IHRoZW0gZml4ZWQgdXAuDQo+
DQo+DQo+DQo+IENoZWVycywNCj4NCj4NCj4NCj4gQnJ1Y2UNCj4NCj4NCj4NCj4gLS0NCj4NCj4g
IlRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1h
ZG5lc3MgYXdhaXQgDQo+IHRoZWUgYXQgaXRzIGVuZCINCj4NCj4gLS0NCj4NCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4NCj4gbWV0YS12aXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QNCj4NCj4gbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2pl
Y3Qub3JnDQo+DQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRh
LXZpcnR1YWxpemF0aW9uDQoNCg0KDQotLQ0KIlRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVM
TCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kIg0K


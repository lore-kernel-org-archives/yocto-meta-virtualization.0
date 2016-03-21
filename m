Return-Path: <Arun.Biyani@us.bosch.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8875DE00A9C; Mon, 21 Mar 2016 06:41:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [139.15.237.11 listed in list.dnswl.org]
X-Greylist: delayed 8526 seconds by postgrey-1.32 at yocto-www;
	Mon, 21 Mar 2016 06:41:02 PDT
Received: from smtp6-v.fe.bosch.de (smtp6-v.fe.bosch.de [139.15.237.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36222E00803
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 06:41:02 -0700 (PDT)
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta23.fe.bosch.de (Postfix) with ESMTP id E412015801B0;
	Mon, 21 Mar 2016 14:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=us.bosch.com;
	s=2015-01-21; t=1458567661;
	bh=6taspdaw46ClaEDxI9P3yVsiHPGU9gicztN3gJ6DdGI=; l=10;
	h=From:From:Reply-To:Sender;
	b=ii96cAy3/lx7uaOvUl2OuBU/BHsGUGyPTEcbcHC8ITtIlzu9hqSqSwlLjy1T3DFYL
	emiEwK8HiPMtKtb+N5IDDMxae+DskTCHjMcV7KD+v05lZkklBrCPEfA4lEVz5FWNs/
	8PGwi9l0EGsMD18E/107lCimtQT0vEorDq1JiPvw=
Received: from SI-MBX1005.de.bosch.com (vsgw23.fe.internet.bosch.com
	[10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id CCFEA1B804BA; 
	Mon, 21 Mar 2016 14:41:01 +0100 (CET)
Received: from FE-MBX1005.de.bosch.com (10.3.230.25) by
	SI-MBX1005.de.bosch.com (10.3.230.22) with Microsoft SMTP Server (TLS)
	id 15.0.1104.5; Mon, 21 Mar 2016 14:41:01 +0100
Received: from FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17]) by
	FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17%24]) with mapi id
	15.00.1104.000; Mon, 21 Mar 2016 14:41:01 +0100
From: "Biyani Arun (CM/ESC-NA)" <Arun.Biyani@us.bosch.com>
To: SIVA SUBRAMANIAN.P <psiva87@gmail.com>
Thread-Topic: [meta-virtualization] Nothing PROVIDES 'libxl'
Thread-Index: AdGDYx4/mYYmRrZ5TH+Rk8woD4dDcAABu7YAAANM/RA=
Date: Mon, 21 Mar 2016 13:41:00 +0000
Message-ID: <d481d87e0b2d4f9cb810f7ed8907aab7@FE-MBX1005.de.bosch.com>
References: <749328d420b14773bc1a7a54138271a8@FE-MBX1005.de.bosch.com>
	<CAOorjZQMsZbrsiqbJJJKqi0tp7cyiT2iFOg-gL218HkKbVPrQQ@mail.gmail.com>
In-Reply-To: <CAOorjZQMsZbrsiqbJJJKqi0tp7cyiT2iFOg-gL218HkKbVPrQQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.225.160.17]
MIME-Version: 1.0
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22206.006
X-TMASE-MatchedRID: 9zTThWtzImsw1qqYDEcGJFoS15Sc+1wznjQstLm6Sv3Q6nVbd2O+86e7
	nmhJA6kz5xB8c/4SE6sXIJWO/t2WjrRMYdygSETeZlRzaO1xpJ0fbG+50hrCQw1xyQQ/F/PY5/U
	VG9sOrBX8eFOCNyGM7cFZZKyPECPUAXFCIIitZtAD2WXLXdz+AZJOcXMQc4jBavR/jURCwlajxY
	yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKSPzRlrdFGDwzuczBi0zdGXJ305BDcU3D7iwd
	ncMloX4EzIFenoOwxf3KhyswiSFLw==
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Nothing PROVIDES 'libxl'
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
X-List-Received-Date: Mon, 21 Mar 2016 13:41:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ2xpYnhsJyAoYnV0IC9ob21lL2RlbW9kZXYvd3JrL2Zj
YS9kZW1vMi9tZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2
aXJ0XzEuMi4xOS5iYiBERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkNCg0KQmVz
dCByZWdhcmRzDQoNCkFydW4gQml5YW5pDQpDTS9FU1ctTkEgIA0KDQpUZWwuICsxKDI0OCk4NzYt
NTUyMCANCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU0lWQSBTVUJSQU1B
TklBTi5QIFttYWlsdG86cHNpdmE4N0BnbWFpbC5jb21dIA0KU2VudDogTW9uZGF5LCBNYXJjaCAy
MSwgMjAxNiA5OjA2IEFNDQpUbzogQml5YW5pIEFydW4gKENNL0VTQy1OQSkgPEFydW4uQml5YW5p
QHVzLmJvc2NoLmNvbT4NCkNjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcN
ClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gTm90aGluZyBQUk9WSURFUyAnbGli
eGwnDQoNCkFzIGZhciBhcyBJIGtub3csIG1ldGEtdmlydHVhbGl6YXRpb24gZG9lc24ndCBwcm92
aWRlIHRoaXMuIERvIHlvdQ0KaGF2ZSBhbnkgYmJhcHBlbmQgZm9yIGxpYnZpcnQuYmIgd2hpY2gg
ZGVwZW5kcyBvbiBsaWJ4bD8NCg0KT24gTW9uLCBNYXIgMjEsIDIwMTYgYXQgNDo0OCBQTSwgQml5
YW5pIEFydW4gKENNL0VTQy1OQSkNCjxBcnVuLkJpeWFuaUB1cy5ib3NjaC5jb20+IHdyb3RlOg0K
PiBJIGFtIHRyeWluZyB0byBpbmNsdWRlIFhlbiBpbiBteSBZb2N0byBidWlsZC4gSSBoYXZlIGlu
Y2x1ZGVkIHRoZQ0KPiBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyLiBIb3dldmVyLCBJIGFtDQo+
IGdldHRpbmcgdGhpcyBlcnJvcjoNCj4NCj4gRVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ2xpYnhs
JyDigKYuDQo+IENsb3NlIG1hdGNoZXM6DQo+ICAgbGlieHNsdA0KPiAgIGxpYnhtbDINCj4gICBs
aWJ4dg0KPiBOT1RFOiBSdW50aW1lIHRhcmdldCAnbGlidmlydCcgaXMgdW5idWlsZGFibGUsIHJl
bW92aW5nLi4uDQo+IE1pc3Npbmcgb3IgdW5idWlsZGFibGUgZGVwZW5kZW5jeSBjaGFpbiB3YXM6
IFsnbGlidmlydCcsICdsaWJ4bCddDQo+DQo+IFdoYXQgYW0gSSBtaXNzaW5nPyBJcyBsaWJ4bCBp
biBtZXRhLXZpcnR1YWxpemF0aW9uIG9yIHNvbWV3aGVyZSBlbHNlPw0KPg0KPg0KPg0KPiAtLQ0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBtZXRh
LXZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KPiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3Rv
cHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2xpc3RpbmZvL21l
dGEtdmlydHVhbGl6YXRpb24NCj4NCg==


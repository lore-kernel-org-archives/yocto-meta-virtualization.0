Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C81DFE00949; Tue, 10 Feb 2015 00:31:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.67 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0067.outbound.protection.outlook.com [65.55.169.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BEB8E00596
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Feb 2015 00:31:40 -0800 (PST)
Received: from BN1BFFO11FD029.protection.gbl (10.58.144.32) by
	BN1BFFO11HUB027.protection.gbl (10.58.144.174) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Tue, 10 Feb 2015 08:31:38 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD029.mail.protection.outlook.com (10.58.144.92) with
	Microsoft SMTP Server (TLS) id 15.1.87.10 via Frontend Transport;
	Tue, 10 Feb 2015 08:31:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YL6Ak-0006ek-Lh; Tue, 10 Feb 2015 00:27:54 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Chris Patterson <cjp256@gmail.com>
Thread-Topic: [meta-virtualization] [RFC 0/8] Update to Xen 4.5.0 and add
	AArch64 support
Thread-Index: AQHQRBfpbnLiX8+hT0u1mgaEnelKUpzpibQw
Date: Tue, 10 Feb 2015 08:31:33 +0000
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
	<CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
	<CABZSBQc4u6OArq-jaz=WJCQ06RVmv3q3Z=Mw016LDvkz=FfPxA@mail.gmail.com>
	<CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
	<CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
	<4f5c5ef09adc4e219522de0788b5912d@BN1AFFO11FD019.protection.gbl>
	<CABZSBQf8-YR5T4JjUsUMf5ONLhP-GVH=Fu5Xo8aeetKYFTqyYw@mail.gmail.com>
	<8a863ca11d0b44828288dc519b97f610@BN1BFFO11FD007.protection.gbl>
	<CABZSBQdXa0VDKttMq32KQLnWxZ0zUjfo8_KtdYw6K87i6dhwzg@mail.gmail.com>
In-Reply-To: <CABZSBQdXa0VDKttMq32KQLnWxZ0zUjfo8_KtdYw6K87i6dhwzg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.180]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21318.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <8e289ea738d842ceb17b0568b2dcad13@BN1BFFO11FD029.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(52044002)(51914003)(51704005)(13464003)(377454003)(50986999)(54356999)(1411001)(110136001)(6806004)(19580395003)(19580405001)(87936001)(62966003)(2950100001)(33646002)(93886004)(47776003)(92566002)(77156002)(108616004)(15975445007)(2420400003)(102836002)(92726002)(104016003)(23676002)(53416004)(46102003)(50466002)(106116001)(74316001)(2656002)(86362001)(106466001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB027;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; LANG:en; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB027;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB027; 
X-Forefront-PRVS: 048396AFA0
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB027; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2015 08:31:37.7688 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB027
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Tue, 10 Feb 2015 08:31:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpcyBQYXR0ZXJzb24gW21h
aWx0bzpjanAyNTZAZ21haWwuY29tXQ0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDA5LCAyMDE1
IDE6MjQgUE0NCj4gVG86IE5hdGhhbiBSb3NzaQ0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkB5
b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW1JG
QyAwLzhdIFVwZGF0ZSB0byBYZW4gNC41LjAgYW5kIGFkZA0KPiBBQXJjaDY0IHN1cHBvcnQNCj4g
DQo+IA0KPiAJPg0KPiAJPg0KPiAJPiBUaGFua3MgZm9yIHRoYXQsIHRoYXQgbG9va3MgZ29vZCEg
Rm9yIHRoZSBjaGVycnktcGljayBvZiB0aGUgInhlbjoNCj4gYnJlYWsNCj4gCT4gb3V0IGZpcm13
YXJlIGJpdHMiIGNvdWxkIHlvdSBqdXN0IGFkZCBTaWduZWQtb2ZmIGJ5IGZvciBFcmljDQo+IENo
YW51ZGV0DQo+IAk+IDxlcmljLmNoYW51ZGV0QGdtYWlsLmNvbT4gZm9yIHRoZSBwb3J0aW9ucyBJ
IGJvcnJvd2VkIGZyb20gaGlzDQo+IG90aGVyIHdvcmsNCj4gCT4gb24gb3Blbnh0PyAgSSBtZWFu
dCB0byBkbyB0aGF0IGJlZm9yZSBJIHB1c2hlZC4gIEkgZml4ZWQgYW5kDQo+IHJlYmFzZWQgQA0K
PiAJPiBodHRwczovL2dpdGh1Yi5jb20vY2pwMjU2L21ldGEtdmlydHVhbGl6YXRpb24vdHJlZS9h
ZGQtYWFyY2g2NC0NCj4gc3VwcG9ydA0KPiAJPg0KPiAJPiBPdGhlcndpc2UsIHRoZXJlIGlzIGp1
c3Qgc29tZSBtaW5vciByZWNpcGUgY2xlYW51cCBhbmQgYW4gaXNzdWUNCj4gd2l0aA0KPiAJPiBo
dm1sb2FkZXIgcGlja2luZyB1cCBpcHhlIEkgd2FudGVkIHRvIGxvb2sgaW50byB3aGljaCBjb3Vs
ZCBiZQ0KPiBkb25lIHdpdGgNCj4gCT4gZm9sbG93IHVwIHBhdGNoZXMuDQo+IA0KPiANCj4gCUkg
aGF2ZSB1cGRhdGVkIG15IGJyYW5jaCBmcm9tIHlvdXJzLCBJIGhhdmUgYWxzbyByZWJhc2VkIGl0
IG9uIHRvcA0KPiBvZiBjdXJyZW50IG1hc3Rlci4NCj4gDQo+IA0KPiANCj4gDQo+IEkgcHVzaGVk
IGEgY291cGxlIG1pbm9yIGNsZWFudXAgcGF0Y2hlcyB0byBteSBicmFuY2gsIGZlZWwgZnJlZSB0
byBhYnNvcmINCj4gdGhlbSBvciBJIGNhbiBzdWJtaXQgdGhlbSBpbmRlcGVuZGVudGx5IGxhdGVy
Lg0KDQpJIHdpbGwgYWJzb3JiIHRoZW0gaW50byBteSBwYXRjaCBzZXJpZXMgOikuDQoNCj4gDQo+
IA0KPiANCj4gCT4NCj4gCT4NCj4gCT4gT3V0IG9mIGN1cmlvc2l0eSwgSSBub3RpY2VkIGluIHlv
dXIgcWVtdSBiYmFwcGVuZCB0aGF0IHlvdSB1c2UNCj4gCT4gUEFDS0FHRUNPTkZJR1tfZGVmYXVs
dHZhbF0uICBJJ3ZlIG5ldmVyIHNlZW4gdGhhdCBiZWZvcmUsIGlzIHRoYXQNCj4gCT4gc3VwcG9y
dGVkPyAgSSBoYXZlIHNlZW4gUEFDS0FHRUNPTkZJRyArPSB3aGljaCBJIGJlbGlldmUNCj4gYWNj
b21wbGlzaGVzIHlvdXINCj4gCT4gZ29hbC4gIFlvdXIgbWV0aG9kIGFwcGFyZW50bHkgd29ya3Mg
dGhvdWdoIDopDQo+IAk+DQo+IA0KPiAJVGhlIF9kZWZhdWx0dmFsIGZsYWcgaXMgYW4gYml0YmFr
ZSBpbnRlcm5hbCBvbmUsIGl0IGlzIGhvdyBiaXRiYWtlDQo+IHN0b3JlcyB0aGUgPz89IHZhbHVl
IHVudGlsIGl0cyBmaW5pc2hlZCBwYXJzaW5nLiBTbyArPSBvbnRvIGl0IHdvcmtzIGFzDQo+IGRl
c2lyZWQuIExvb2tpbmcgaW50byBpdCBJIGNhbm5vdCBmaW5kIGFueSB1c2Ugb3IgbWVudGlvbiBv
biB3aGV0aGVyIG9yDQo+IG5vdCBpbnRlcm5hbCBmbGFncyBhcmUgYWNjZXB0YWJsZSBmb3IgdXNl
IGluIHVzZXIgcmVjaXBlcy4gSSBsaWtlZCB0aGlzDQo+IG1ldGhvZCB0aGUgYmVzdCBhcyBpdCBh
bGxvd2VkIGZvciBmdXR1cmUgY29udHJvbCBvZiB3aGF0IGlzIGRvbmUgd2l0aGluIHRvDQo+IGJl
IGluIHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyLCB0aGUgYWx0ZXJuYXRpdmVzIHRvIGdl
dCB0aGUgc2FtZQ0KPiBmdW5jdGlvbmFsaXR5IGlzIHRvIGVpdGhlciBzdWJtaXQgdGhlIGNoYW5n
ZSB0byBvZS1jb3JlIG9yIHRvIHVzZSA/Pz0gYW5kDQo+IG92ZXJyaWRlIHRoZSBkZWZhdWx0ICh3
aGljaCBtZWFucyB0aGUgb3ZlcnJpZGUgbWlnaHQgZ2V0IG91dCBvZiBzeW5jIGFuZA0KPiBjYXVz
ZSBwZW9wbGUgaXNzdWVzKS4gSSBoYWQgaW5pdGlhbGx5IHBsYW5uZWQgb24gc3VibWl0dGluZyB0
aGUgcWVtdQ0KPiBjaGFuZ2VzIHRvIG9lLWNvcmUgKHVudGlsIEkgZm91bmQgdGhlIF9kZWZhdWx0
dmFsIHRyaWNrKSwgZG8geW91IHRoaW5rDQo+IHRoYXQgd291bGQgYmUgYSBiZXR0ZXIgYXBwcm9h
Y2g/DQo+IA0KPiANCj4gDQo+IA0KPiBJdCBtYXkgYmUgYSBiZXR0ZXIgYXBwcm9hY2ggKGlmIHRo
ZXknbGwgdGFrZSBpdCksIGJ1dCBpdCBkb2VzIG5vdCBtYXR0ZXINCj4gdG8gbWUuICBJdCdzIGEg
bGl0dGxlIHN1cnByaXNpbmcgdGhlcmUgaXNuJ3QgYSBidWlsdC1pbiBtZWNoYW5pYyB0bw0KPiBz
dXBwb3J0IHRoaXMgY2FzZSwgYnV0IHByb3BzIGZvciBmaWd1cmluZyBvdXQgaG93IHRvIGdldCBh
cm91bmQgdGhhdC4NCg0KV2Ugd2lsbCBzZWUsIEkgaGF2ZSBqdXN0IHNlbnQgdGhlIHBhdGNoLg0K
aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1jb3Jl
LzIwMTUtRmVicnVhcnkvMTAxNTc2Lmh0bWwNCg0KUmVnYXJkcywNCk5hdGhhbg0KDQo+IA0KPiAN
Cj4gDQo+IAlBbHNvIFBBQ0tBR0VDT05GSUcgKz0gInhlbiIgdW5mb3J0dW5hdGVseSBpZ25vcmVz
IHRoZSB2YWx1ZSBzZXQgYnkNCj4gPz89IGFuZCBiZWNvbWVzIGp1c3QgInhlbiIsIF9hcHBlbmQg
d291bGQgd29yayBmaW5lIGhvd2V2ZXIgaXQgd2lsbCBhbHdheXMNCj4gYXBwbHkgdGhlIGFwcGVu
ZCAoZXZlbiB3aGVuIG92ZXJyaWRpbmcgd2l0aCBfcG4tcWVtdSA9ICIiIGZyb20NCj4gbG9jYWwu
Y29uZikuIFdoaWNoIGlzIHdoeSB0aGUgcGF0Y2ggdXNlcyArPSB0byB0aGUgZGVmYXVsdHZhbC4N
Cj4gDQo+IA0KPiANCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGluZm8sIGdvb2QgdG8ga25vdy4NCj4g
DQo+IA0KPiANCj4gCVJlZ2FyZHMsDQo+IAlOYXRoYW4NCj4gDQo+IA0KDQo=


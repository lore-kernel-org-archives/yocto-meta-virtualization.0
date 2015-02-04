Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B90AE00985; Wed,  4 Feb 2015 01:11:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.80 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0080.outbound.protection.outlook.com [157.56.110.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7E77E0097F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Feb 2015 01:11:46 -0800 (PST)
Received: from BN1AFFO11FD019.protection.gbl (10.58.52.31) by
	BN1AFFO11HUB039.protection.gbl (10.58.52.150) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Wed, 4 Feb 2015 09:11:44 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD019.mail.protection.outlook.com (10.58.52.79) with Microsoft
	SMTP Server (TLS) id 15.1.87.10 via Frontend Transport;
	Wed, 4 Feb 2015 09:11:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YIvwN-0005Pi-1C; Wed, 04 Feb 2015 01:08:07 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Chris Patterson <cjp256@gmail.com>
Thread-Topic: [meta-virtualization] [RFC 0/8] Update to Xen 4.5.0 and add
	AArch64 support
Thread-Index: AQHQPEeEOBwapyQ00kGZS8jz+0knUZzccVeAgAME9wCAAAD4AIAAqYIg
Date: Wed, 4 Feb 2015 09:11:40 +0000
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
	<CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
	<CABZSBQc4u6OArq-jaz=WJCQ06RVmv3q3Z=Mw016LDvkz=FfPxA@mail.gmail.com>
	<CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
	<CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
In-Reply-To: <CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.65]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21302.006
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <4f5c5ef09adc4e219522de0788b5912d@BN1AFFO11FD019.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(164054003)(24454002)(51704005)(110136001)(106466001)(106116001)(92726002)(87936001)(2656002)(33646002)(46102003)(1411001)(23676002)(93886004)(50466002)(19580395003)(2950100001)(104016003)(74316001)(62966003)(77156002)(15975445007)(102836002)(6806004)(54356999)(47776003)(53416004)(92566002)(19580405001)(50986999)(76176999)(86362001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB039;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB039;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1AFFO11HUB039; 
X-Forefront-PRVS: 04772EA191
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB039; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2015 09:11:44.2073 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB039
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
X-List-Received-Date: Wed, 04 Feb 2015 09:11:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpcyBQYXR0ZXJzb24gW21h
aWx0bzpjanAyNTZAZ21haWwuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDA0LCAy
MDE1IDM6MjUgUE0NCj4gVG86IE5hdGhhbiBSb3NzaQ0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlv
bkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl0g
W1JGQyAwLzhdIFVwZGF0ZSB0byBYZW4gNC41LjAgYW5kIGFkZA0KPiBBQXJjaDY0IHN1cHBvcnQN
Cj4gDQo+IA0KPiANCj4gT24gV2VkLCBGZWIgNCwgMjAxNSBhdCAxMjoyMSBBTSwgQ2hyaXMgUGF0
dGVyc29uIDxjanAyNTZAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gDQo+IAlPbiBN
b24sIEZlYiAyLCAyMDE1IGF0IDI6MTUgQU0sIENocmlzIFBhdHRlcnNvbiA8Y2pwMjU2QGdtYWls
LmNvbT4NCj4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IA0KPiAJCU9uIFRodSwgSmFuIDI5LCAyMDE1
IGF0IDExOjQ0IFBNLCBDaHJpcyBQYXR0ZXJzb24NCj4gPGNqcDI1NkBnbWFpbC5jb20+IHdyb3Rl
Og0KPiANCj4gDQo+IAkJCU5pY2UhIDopICBJJ2xsIHRyeSB0byB0YWtlIHRoaXMgZm9yIGEgdGVz
dCBkcml2ZSB0aGlzDQo+IHdlZWtlbmQgYW5kIHByb3ZpZGUgc29tZSBmZWVkYmFjay4NCj4gDQo+
IAkJCU9uIFRodSwgSmFuIDI5LCAyMDE1IGF0IDEwOjMxIFBNLCBOYXRoYW4gUm9zc2kNCj4gPG5h
dGhhbi5yb3NzaUB4aWxpbnguY29tPiB3cm90ZToNCj4gDQo+IA0KPiAJCQkJVGhpcyBwYXRjaCBz
ZXJpZXMgdXBkYXRlcyB0aGUgWGVuIHJlY2lwZXMgdG8gdXNlDQo+IHZlcnNpb24gNC41LjAgYXMg
d2VsbCBhcw0KPiAJCQkJcmVmYWN0b3JpbmcgYW5kIGFkZGluZyBzdXBwb3J0IGZvciBBQXJjaDY0
Lg0KPiANCj4gCQkJCVRoZSBmaXJzdCA2IHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgYXJlIHJlbGF0
aXZlbHkNCj4gdHJpdmlhbCBjaGFuZ2VzOiBhZGRpbmcNCj4gCQkJCWFkZGl0aW9uYWwgZmlsZXMg
dG8gcGFja2FnZXMsIHVwZGF0aW5nDQo+IGRlcGVuZGVuY2llcyBhbmQgYWRkaW5nIHN1cHBvcnQg
Zm9yDQo+IAkJCQlhZGRpdGlvbmFsIGFyY2hpdGVjdHVyZXMgb250b3Agb2YgeDg2LTY0LiBUaGUg
bW9zdA0KPiBpbXBvcnRhbnQgY2hhbmdlIGlzIHRoZQ0KPiAJCQkJbW92aW5nIG9mIHNvbWUgeDg2
IG9mIHRoZSBwYWNrYWdlcyBmcm9tIHhlbi1iYXNlDQo+IFJERVBFTkRTIHRvIFJSRUNPTU1FTkRT
Lg0KPiANCj4gCQkJCVBhdGNoZXMgNyBhbmQgOCBhcmUgdGhlIHJlYXNvbiBmb3IgdGhpcyBzZXQg
YmVpbmcNCj4gYSBSRkMgaW5zdGVhZCBvZiBqdXN0IGEgcGF0Y2gNCj4gCQkJCXNldCwgSSBhbSBh
ZnRlciBmZWVkYmFjayByZWdhcmRpbmcgdGhlIGNoYW5nZXMgSQ0KPiBoYXZlIG1hZGUgZm9yIHRo
ZXNlIHBhdGNoZXMuDQo+IAkJCQlJbiB0aGVzZSB0d28gcGF0Y2hlcyBJIGRpc2FibGVkIHRoZSBi
dWlsZGluZyBvZg0KPiB4ZW4tcWVtdSBhbmQgc2VhYmlvcyBmcm9tDQo+IAkJCQl3aXRoaW4gdGhl
IHhlbiBidWlsZCBzeXN0ZW0uIFRoZXJlIGFyZSBhIG51bWJlciBvZg0KPiBpc3N1ZXMgaW4gd3Jh
cHBpbmcgdGhlIHhlbg0KPiAJCQkJYnVpbGQgc3lzdGVtIHdpdGhpbiBPRSAoaW5jbHVkaW5nIHNv
dXJjZSBmZXRjaGluZw0KPiBhbmQgY3Jvc3MgYnVpbGRpbmcpLg0KPiANCj4gDQo+IA0KPiANCj4g
DQo+IAkJKzEgd2l0aCB0aGlzIGFwcHJvYWNoLiBJJ20gc3VyZSB0aGF0IHRoZSBxZW11IHJldiBp
bmNsdWRlZA0KPiB3aXRoIHRoZSB4ZW4gcmVsZWFzZSBpcyBiZXR0ZXIgdGVzdGVkIGFuZCBoYXMg
c29tZSBhcHByb3ByaWF0ZSBwYXRjaGVzIGZvcg0KPiB4ZW4gdXNlcnMuICBIb3dldmVyLCB0aGUg
b2UtY29yZSBxZW11IHJlY2lwZSBpcyBpbiBtdWNoIGJldHRlciBzaGFwZS4NCj4gU29tZW9uZSBj
b3VsZCBicmVhayBpdCBvdXQgaW50byBpdHMgb3duIHJlY2lwZSwgaWYgc28gZGVzaXJlZC4NCj4g
DQo+IA0KPiANCj4gCQkJCUluc3RlYWQgb2YgYnVpbGRpbmcgcWVtdSBmcm9tIHdpdGhpbiB4ZW4s
IEkgaGF2ZQ0KPiBjb25maWd1cmVkIHRoZSBxZW11IHdoaWNoIGlzDQo+IAkJCQlwYXJ0IG9mIG9l
LWNvcmUgdG8gYnVpbGQgd2l0aCB4ZW4gc3VwcG9ydA0KPiAoUEFDS0FHRUNPTkZJR19hcHBlbmQg
PSAieGVuIikuIFNpbmNlDQo+IAkJCQl4ZW4gc3VwcG9ydCBpcyBhdmFpbGFibGUgaW4gbWFpbmxp
bmUgcWVtdSB0aGlzDQo+IGFsbG93cyBmb3IgZWFzaWVyIHN1cHBvcnQgb2YgdGhlDQo+IAkJCQl4
ZW4gZGV2aWNlIGVtdWxhdGlvbiB2aWEgcWVtdS4gVGhlIFBBQ0tBR0VDT05GSUcNCj4gb3B0aW9u
IGluIG9lLWNvcmUgZG9lcyBuZWVkIHRvDQo+IAkJCQliZSB1cGRhdGVkIHRvIHBvaW50IHRvIHRo
ZSBjb3JyZWN0IGRlcGVuZHMgKHdoaWNoDQo+IGlzIHNlcGVyYXRlIHRvIHRoaXMgcGF0Y2gNCj4g
CQkJCXNldCkuDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gCQlBZ3JlZWQsIG1heWJlIGRvY3VtZW50
IGluIFJFQURNRT8gSW4gbXkgbG9jYWwuY29uZiwgSSBhZGRlZDoNCj4gCQlQQUNLQUdFQ09ORklH
X2FwcGVuZF9wbi1xZW11ID0gIiB4ZW4gIg0KPiANCj4gDQo+IA0KPiAJCQkJU2VhQklPUyBpcyBk
aXNhYmxlZCBkdWUgdG8gZmV0Y2hpbmcgaXNzdWVzIGFzIHdlbGwNCj4gYXMgb25seSBiZWluZyBz
dXBwb3J0ZWQgb24NCj4gCQkJCXg4Ni4gSSBoYXZlIG5vdCB3b3JrZWQgb3V0IHRoZSBpc3N1ZXMg
YXJvdW5kIHRoaXMNCj4geWV0LiBJIGFtIHF1ZXJ5aW5nIGFzIHRvDQo+IAkJCQl3aGV0aGVyIHN1
cHBvcnRpbmcgaXQgaXMgZGVzaXJlZCwgaWYgc28gc2hvdWxkIGl0DQo+IGJlIHZpYSB0aGUgeGVu
IGJ1aWxkIHN5c3RlbQ0KPiAJCQkJb3IgYXMgYSBzZXBlcmF0ZSByZWNpcGU/DQo+IA0KPiANCj4g
DQo+IA0KPiANCj4gCQkrMSB0byBicmVha2luZyBpdCBvdXQgYXMgYSBzZXBhcmF0ZSByZWNpcGUs
IGJ1dCBpdCBpcw0KPiBpbXBvcnRhbnQgZm9yIHVzIHg4NiBodm0gdXNlcnMgOikgIElmIHlvdSdk
IGxpa2UsIEkgY291bGQgYXR0ZW1wdCB0byBwb3J0DQo+IHRoZSByZWNpcGUgd2UgdXNlIG9uIG9w
ZW54dCB0byBtZXRhLXZpcnR1YWxpemF0aW9uLg0KPiANCj4gDQo+IA0KPiANCj4gCUFjdHVhbGx5
LCBpdCBzZWVtcyB0byBnbyBiZXlvbmQganVzdCB0aGUgcm9tIGJpbihzKSB3aXRoIGh2bWxvYWRl
ci4NCj4gV2hhdCBhYm91dCBtYWtpbmcgaXQgYXJjaCBkZXBlbmRlbnQgZmVhdHVyZT8NCj4gDQo+
IA0KPiANCj4gDQo+IE15IG1haWxpbmcgbGlzdCBmb28gaXMgd2VhayB0aGlzIHdlZWsuICBQbGVh
c2UgaWdub3JlIHRoZSBhYm92ZSBjb21tZW50LCBJDQo+IGZvcmdvdCB0aGF0IHdhcyBpbiB0aGUg
b2xkIGRyYWZ0LiA6KQ0KPiANCj4gDQo+IA0KPiANCj4gDQo+IAkJCQlUaGFua3MsDQo+IA0KPiAJ
CQkJTmF0aGFuDQo+IA0KPiAJCQkJTmF0aGFuIFJvc3NpICg4KToNCj4gCQkJCSAgeGVuOiBGaXgg
YW5kIHJlZmFjdG9yIGNvbW1vbiBpbmNsdWRlDQo+IAkJCQkgIHhlbjogQWRkIEJ1aWxkIGFuZCBU
YXJnZXQgYXJjaGl0ZWN0dXJlIG1hcHBpbmcNCj4gCQkJCSAgeGVuOiBNb3ZlIHg4Ni9hcmNoIHNw
ZWNpZmljIGNvbXBvbmVudHMgaW50bw0KPiBSUkVDT01NRU5EUw0KPiAJCQkJICB4ZW46IEZpeCB1
cCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgc3RlcHMNCj4gCQkJCSAgeGVuOiBBZGQgYWFyY2g2NCBh
cyBjb21wYXRpYmxlIGhvc3QNCj4gCQkJCSAgeGVuLSppbWFnZS1taW5pbWFsOiBTZXR1cCBjb25k
aXRpb25hbCBiYXNlZCBvbg0KPiBNQUNISU5FX0ZFQVRVUkVTDQo+IAkJCQkgIHhlbjogVXBkYXRl
IHJlY2lwZSB0byA0LjUuMA0KPiAJCQkJICB4ZW4taW1hZ2UtbWluaW1hbDogSW5zdGFsbCBxZW11
IGluc3RlYWQgb2YgeGVuLQ0KPiBxZW11DQo+IA0KPiAJCQkJIHJlY2lwZXMtZXh0ZW5kZWQvaW1h
Z2VzL3hlbi1ndWVzdC1pbWFnZS0NCj4gbWluaW1hbC5iYiB8ICAgMiArLQ0KPiAJCQkJIHJlY2lw
ZXMtZXh0ZW5kZWQvaW1hZ2VzL3hlbi1pbWFnZS1taW5pbWFsLmJiDQo+IHwgICA2ICstDQo+IAkJ
CQkgLi4ubGFzay1hdm9pZC1pbnN0YWxsaW5nLXBvbGljeS1maWxlLWFzLQ0KPiBib290LnBhdGNo
IHwgIDI2IC0tLS0tDQo+IAkJCQkgcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLWFyY2guaW5jDQo+
IHwgIDE4ICsrKysNCj4gCQkJCSByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4uaW5jDQo+IHwgMTEz
ICsrKysrKysrKysrKysrKysrLS0tLQ0KPiAJCQkJIHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80
LjMuMS5iYg0KPiB8ICAyNCAtLS0tLQ0KPiAJCQkJIHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80
LjUuMC5iYg0KPiB8ICAzNiArKysrKysrDQo+IAkJCQkgNyBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5z
ZXJ0aW9ucygrKSwgNzUNCj4gZGVsZXRpb25zKC0pDQo+IAkJCQkgZGVsZXRlIG1vZGUgMTAwNjQ0
IHJlY2lwZXMtDQo+IGV4dGVuZGVkL3hlbi9maWxlcy9mbGFzay1hdm9pZC1pbnN0YWxsaW5nLXBv
bGljeS1maWxlLWFzLWJvb3QucGF0Y2gNCj4gCQkJCSBjcmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBl
cy1leHRlbmRlZC94ZW4veGVuLQ0KPiBhcmNoLmluYw0KPiAJCQkJIGRlbGV0ZSBtb2RlIDEwMDY0
NCByZWNpcGVzLQ0KPiBleHRlbmRlZC94ZW4veGVuXzQuMy4xLmJiDQo+IAkJCQkgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHJlY2lwZXMtDQo+IGV4dGVuZGVkL3hlbi94ZW5fNC41LjAuYmINCj4gDQo+IAkJ
CQktLQ0KPiAJCQkJMi4xLjENCj4gDQo+IAkJCQktLQ0KPiAJCQkJX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gCQkJCW1ldGEtdmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0DQo+IAkJCQltZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcN
Cj4gCQkJCWh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLQ0KPiB2
aXJ0dWFsaXphdGlvbg0KPiANCj4gDQo+IA0KPiANCj4gDQo+IAkJSSBkaWQgc29tZSByZWFsbHkg
YmFzaWMgdGVzdGluZyBvZiB4ZW4taW1hZ2UtbWluaW1hbC4gSSBidWlsdA0KPiBhZ2FpbnN0IG1h
c3RlciBvbiBhIHg4Ni02NCBob3N0IGZvciBhbiBpbnRlbCB4ODYtNjQgdGFyZ2V0Lg0KPiANCj4g
DQo+IAkJRm9yIG15IGJ1aWxkLCBJIGhhZCB0byBzZXQgVFVORV9DQ0FSR1M9IiIgZm9yIHhlbiBh
cyB0aGUgLW1uby0NCj4gc3NlIGZsYWcgcmVxdWlyZWQgaW4geGVuL2FyY2gveDg2L1J1bGVzLm1r
IHdhcyBjb25mbGljdGluZyB3aXRoIHRoZQ0KPiBzdGFuZGFyZCB0dW5lIGFyZ3MuICBJJ20gbm90
IHN1cmUgdGhlIG1vc3QgYXBwcm9wcmlhdGUgd2F5IHRvIGRvIHRoaXMsIGJ1dA0KPiB0aGF0J3Mg
aG93IEkgd29ya2VkIGFyb3VuZCBpdC4gIEFueSBpZGVhcyBvbiBhIGJldHRlciB3YXkgdG8gaGFu
ZGxlIHRoaXM/DQo+IA0KPiAJCVdpdGhvdXQgYWRkcmVzc2luZyBzZWFiaW9zLCBJIGNvdWxkbid0
IGRvIG11Y2ggdG8gdmFsaWRhdGUNCj4gcnVubmluZyBndWVzdHMsIGJ1dCBvdGhlcndpc2UgaXQg
c2VlbSB0byBydW4gZmluZS4gV2UnbGwgaGF2ZSB0byBmaWd1cmUNCj4gb3V0IHNvbWV0aGluZyBo
ZXJlLg0KPiANCj4gDQo+IAkJTmljZSB3b3JrIQ0KPiANCj4gCQlDaGVlcnMsDQo+IAkJLUNocmlz
DQo+IA0KPiANCj4gDQo+IA0KPiAJSGV5IE5hdGhhbi4gIEkgbWFkZSBzb21lIHByb2dyZXNzIG9u
IHNwbGl0dGluZyBvdXQgdGhlIGZpcm13YXJlLQ0KPiByZWxhdGVkIHBhY2thZ2VzIG9uIHRvcCBv
ZiB5b3VyIHBhdGNoZXMuICBJIGFkZGVkIGEgeGVuLWh2bWxvYWRlciByZWNpcGUNCj4gdGhhdCB3
b3VsZCBzb21laG93IG5lZWQgdG8gYmUgaW5jbHVkZWQgaW4gdGhlIGltYWdlLCBidXQgb25seSBm
b3IgeDg2LiBJDQo+IHN0aWxsIGhhdmUgc29tZSB3b3JrIHRvIGRvLCBidXQgbXkgbGF0ZXN0IGJ1
aWxkIHNlZW1zIHRvIGJlIHVzYWJsZSBmb3INCj4gYmFzaWMgeDg2IGh2bS4NCj4gDQo+IAlXb3Jr
IGluIHByb2dyZXNzIEAgaHR0cHM6Ly9naXRodWIuY29tL2NqcDI1Ni9tZXRhLQ0KPiB2aXJ0dWFs
aXphdGlvbi90cmVlL21hc3Rlcg0KPiANCg0KSGkgQ2hyaXMsDQoNCk5pY2Ugd29yaywgSSdtIGN1
cmlvdXMgaWYgdGhlcmUgd2FzIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiBmb3IgdGhlIHNwbGl0dGlu
ZyBvZiB4ZW4taHZtbG9hZGVyPyBBcyBJIHdhcyBhYmxlIHRvIGdldCBpdCBpbnRvIHRoZSBtYWlu
IHhlbiByZWNpcGUgd2l0aG91dCBhbnkgZnVzcywgYW5kICdjb25maWd1cmUnIGl0IHZpYSBQQUNL
QUdFQ09ORklHLiAoc2VlIGJyYW5jaCBtZW50aW9uZWQgYmVsb3cpDQoNCkkgaGF2ZSB1cGRhdGVk
IHRoZSBwYXRjaCBzZXJpZXMsIGFuZCBhZGRlZCBzb21lIGFkZGl0aW9uYWwgcGF0Y2hlcyBJIHdh
cyB3b3JraW5nIG9uIGluY2x1ZGluZyBzeXN0ZW1kIHN1cHBvcnQsIHFlbXUgUEFDS0FHRUNPTkZJ
RyBzZXR1cC9kZWZhdWx0cyBhbmQgYSBwYXRjaCBmb3IgdGhlIHhlbiAtbW5vLXNzZSBpc3N1ZS4g
SW5zdGVhZCBvZiBzZW5kaW5nIGFub3RoZXIgcGF0Y2ggc2VyaWVzIEkgaGF2ZSBqdXN0IHVwbG9h
ZGVkIGl0IHRvIGdpdGh1Yi4gQWxzbyBJIGhhdmUgdHdvIHBhdGNoZXMgb24gdGhlIHRvcCBvZiB0
aGUgYnJhbmNoIHdpdGggY2hhbmdlcyBjaGVycnktcGlja2VkIGZyb20geW91ciBicmFuY2guDQoN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9uYXRoYW5yb3NzaS9tZXRhLXZpcnR1YWxpemF0aW9uL2NvbW1p
dHMvbnJvc3NpL2FkZC1hYXJjaDY0LXN1cHBvcnQNCg0KUmVnYXJkcywNCk5hdGhhbg0K


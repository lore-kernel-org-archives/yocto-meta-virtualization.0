Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF4DDE0093B; Wed, 11 Feb 2015 16:30:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.64 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0064.outbound.protection.outlook.com [157.56.110.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98153E00815
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Feb 2015 16:30:13 -0800 (PST)
Received: from BL2FFO11FD008.protection.gbl (10.173.160.32) by
	BL2FFO11HUB016.protection.gbl (10.173.160.108) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Thu, 12 Feb 2015 00:30:09 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD008.mail.protection.outlook.com (10.173.161.4) with Microsoft
	SMTP Server (TLS) id 15.1.87.10 via Frontend Transport;
	Thu, 12 Feb 2015 00:30:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YLhbs-0003rJ-Cp; Wed, 11 Feb 2015 16:26:24 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Rob Weiss <j105.rob@gmail.com>
Thread-Topic: [meta-virtualization] Building xen-image-minimal problem
Thread-Index: AQHQRggIuvzKJ3ySyUK0wcIlS9GPs5zsJ6UA
Date: Thu, 12 Feb 2015 00:29:56 +0000
References: <CAOWu+mCXRMGc=34bW7sEYLZpecuwSmqM4+=_RvrQ4gMn9R4z9w@mail.gmail.com>
In-Reply-To: <CAOWu+mCXRMGc=34bW7sEYLZpecuwSmqM4+=_RvrQ4gMn9R4z9w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.180]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21324.000
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <31b67a7576df40e5b7b88081a671520e@BL2FFO11FD008.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(377454003)(51704005)(13464003)(76176999)(54356999)(92566002)(77156002)(108616004)(53416004)(2656002)(23676002)(6806004)(104016003)(86362001)(106466001)(106116001)(92726002)(2950100001)(62966003)(19580405001)(50986999)(110136001)(74316001)(19580395003)(50466002)(47776003)(230783001)(87936001)(102836002)(46102003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB016;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; LANG:en; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB016;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB016; 
X-Forefront-PRVS: 0485417665
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB016;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2015 00:30:09.5301 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB016
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Building xen-image-minimal problem
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
X-List-Received-Date: Thu, 12 Feb 2015 00:30:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLXZpcnR1YWxpemF0aW9u
LWJvdW5jZXNAeW9jdG9wcm9qZWN0Lm9yZyBbbWFpbHRvOm1ldGEtDQo+IHZpcnR1YWxpemF0aW9u
LWJvdW5jZXNAeW9jdG9wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFJvYiBXZWlzcw0KPiBTZW50
OiBUaHVyc2RheSwgRmVicnVhcnkgMTIsIDIwMTUgMTI6MzUgQU0NCj4gVG86IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbbWV0YS12aXJ0dWFsaXphdGlv
bl0gQnVpbGRpbmcgeGVuLWltYWdlLW1pbmltYWwgcHJvYmxlbQ0KPiANCj4gSSBhbSB0cnlpbmcg
dG8gYnVpbGQgeGVuLWltYWdlLW1pbmltYWwgdXNpbmcgcG9reSBkaXp6eSBhbmQgSSBhbSBnZXR0
aW5nDQo+IHRoZSBmb2xsb3cgZXJyb3I6DQo+IA0KPiB1YnVudHVAeW9jdG86L29wdC9yb2IvcG9r
eS9idWlsZCQgYml0YmFrZSAtdiB4ZW4taW1hZ2UtbWluaW1hbA0KPiBMb2FkaW5nIGNhY2hlOiAx
MDAlDQo+IHwjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyN8IEVUQTogIDAw
OjAwOjAwDQo+IExvYWRlZCAyMDc0IGVudHJpZXMgZnJvbSBkZXBlbmRlbmN5IGNhY2hlLg0KPiBO
T1RFOiBSZXNvbHZpbmcgYW55IG1pc3NpbmcgdGFzayBxdWV1ZSBkZXBlbmRlbmNpZXMNCj4gTk9U
RTogc2VsZWN0aW5nIHBpZ3otbmF0aXZlIHRvIHNhdGlzZnkgZ3ppcC1uYXRpdmUgZHVlIHRvDQo+
IFBSRUZFUlJFRF9QUk9WSURFUlMNCj4gTk9URTogc2VsZWN0aW5nIHBzZXVkby1uYXRpdmUgdG8g
c2F0aXNmeSB2aXJ0dWFsL2Zha2Vyb290LW5hdGl2ZSBkdWUgdG8NCj4gUFJFRkVSUkVEX1BST1ZJ
REVSUw0KPiBOT1RFOiBzZWxlY3RpbmcgbGludXgteW9jdG8gdG8gc2F0aXNmeSB2aXJ0dWFsL2tl
cm5lbCBkdWUgdG8NCj4gUFJFRkVSUkVEX1BST1ZJREVSUw0KPiBOT1RFOiBzZWxlY3Rpbmcgb3Br
Zy11dGlscy1uYXRpdmUgdG8gc2F0aXNmeSB2aXJ0dWFsL3VwZGF0ZS1hbHRlcm5hdGl2ZXMtDQo+
IG5hdGl2ZSBkdWUgdG8gUFJFRkVSUkVEX1BST1ZJREVSUw0KPiBOT1RFOiBzZWxlY3RpbmcgbGlu
dXgteW9jdG8gdG8gc2F0aXNmeSBydW50aW1lIGtlcm5lbC1tb2R1bGUteGVuLWFjcGktDQo+IHBy
b2Nlc3NvciBkdWUgdG8gUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwva2VybmVsID0gbGludXgt
eW9jdG8NCj4gTk9URTogc2VsZWN0aW5nIGxpbnV4LXlvY3RvIHRvIHNhdGlzZnkgcnVudGltZSBr
ZXJuZWwtbW9kdWxlLXhlbi1ibGtiYWNrDQo+IGR1ZSB0byBQUkVGRVJSRURfUFJPVklERVJfdmly
dHVhbC9rZXJuZWwgPSBsaW51eC15b2N0bw0KPiBOT1RFOiBzZWxlY3RpbmcgbGludXgteW9jdG8g
dG8gc2F0aXNmeSBydW50aW1lIGtlcm5lbC1tb2R1bGUteGVuLWdudGFsbG9jDQo+IGR1ZSB0byBQ
UkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9rZXJuZWwgPSBsaW51eC15b2N0bw0KPiBOT1RFOiBz
ZWxlY3RpbmcgbGludXgteW9jdG8gdG8gc2F0aXNmeSBydW50aW1lIGtlcm5lbC1tb2R1bGUteGVu
LWdudGRldg0KPiBkdWUgdG8gUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwva2VybmVsID0gbGlu
dXgteW9jdG8NCj4gTk9URTogc2VsZWN0aW5nIGxpbnV4LXlvY3RvIHRvIHNhdGlzZnkgcnVudGlt
ZSBrZXJuZWwtbW9kdWxlLXhlbi1uZXRiYWNrDQo+IGR1ZSB0byBQUkVGRVJSRURfUFJPVklERVJf
dmlydHVhbC9rZXJuZWwgPSBsaW51eC15b2N0bw0KPiBOT1RFOiBzZWxlY3RpbmcgbGludXgteW9j
dG8gdG8gc2F0aXNmeSBydW50aW1lIGtlcm5lbC1tb2R1bGUteGVuLXBjaWJhY2sNCj4gZHVlIHRv
IFBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5lbCA9IGxpbnV4LXlvY3RvDQo+IE5PVEU6
IHNlbGVjdGluZyBsaW51eC15b2N0byB0byBzYXRpc2Z5IHJ1bnRpbWUga2VybmVsLW1vZHVsZS14
ZW4td2R0IGR1ZQ0KPiB0byBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9rZXJuZWwgPSBsaW51
eC15b2N0bw0KPiBFUlJPUjogTm90aGluZyBSUFJPVklERVMgJ3hlbi1iYXNlJyAoYnV0IC9vcHQv
ZXh0cmFzL21ldGEtDQo+IHZpcnR1YWxpemF0aW9uL3JlY2lwZXMtZXh0ZW5kZWQvaW1hZ2VzL3hl
bi1pbWFnZS1taW5pbWFsLmJiIFJERVBFTkRTIG9uIG9yDQo+IG90aGVyd2lzZSByZXF1aXJlcyBp
dCkNCj4gTk9URTogUnVudGltZSB0YXJnZXQgJ3hlbi1iYXNlJyBpcyB1bmJ1aWxkYWJsZSwgcmVt
b3ZpbmcuLi4NCj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdhczog
Wyd4ZW4tYmFzZSddDQo+IE5PVEU6IFRhcmdldCAneGVuLWltYWdlLW1pbmltYWwnIGlzIHVuYnVp
bGRhYmxlLCByZW1vdmluZy4uLg0KPiBNaXNzaW5nIG9yIHVuYnVpbGRhYmxlIGRlcGVuZGVuY3kg
Y2hhaW4gd2FzOiBbJ3hlbi1pbWFnZS1taW5pbWFsJywgJ3hlbi0NCj4gYmFzZSddDQo+IEVSUk9S
OiBSZXF1aXJlZCBidWlsZCB0YXJnZXQgJ3hlbi1pbWFnZS1taW5pbWFsJyBoYXMgbm8gYnVpbGRh
YmxlDQo+IHByb3ZpZGVycy4NCj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNo
YWluIHdhczogWyd4ZW4taW1hZ2UtbWluaW1hbCcsICd4ZW4tDQo+IGJhc2UnXQ0KPiANCj4gU3Vt
bWFyeTogVGhlcmUgd2VyZSAyIEVSUk9SIG1lc3NhZ2VzIHNob3duLCByZXR1cm5pbmcgYSBub24t
emVybyBleGl0DQo+IGNvZGUuDQo+IA0KPiBBbnkgaW5zaWdodCBhcyB0byB3aHkgdGhpcyBpcyBo
YXBwZW5pbmc/IFdoYXQgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBpcw0KPiBuZWVkZWQgdG8gZGlh
Z25vc2UgdGhpcyBlcnJvci4gSSBhbSB2ZXJ5IG5ldyB0byB5b2N0byBhbmQgdGhpcyBpcyBteSBm
aXJzdA0KPiBhdHRlbXB0IGF0IGJ1aWxkaW5nIGFuIGltYWdlLg0KDQpIaSBSb2IsDQoNCkl0IGxv
b2tzIGxpa2UgaXQgY2FuJ3QgcmVzb2x2ZSB0aGUgcHJvdmlkZXIgZm9yIHhlbi1iYXNlLCB3aGlj
aCBtZWFucyBpdCBkb2Vzbid0IGtub3cgaG93IHRvIGJ1aWxkIHhlbiB3aXRoIHlvdXIgY29uZmln
dXJhdGlvbi4NCg0KV2hhdCBtYWNoaW5lL2FyY2hpdGVjdHVyZSBhcmUgeW91IGJ1aWxkaW5nIGZv
cj8gVGhlIGN1cnJlbnQgZGl6enkgb2YgbWV0YS12aXJ0dWFsaXphdGlvbiBvbmx5IHN1cHBvcnRz
IHhlbiBvbiB4ODZfNjQuDQoNClJlZ2FyZHMsDQpOYXRoYW4NCg==


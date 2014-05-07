Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 985D2E0070F; Wed,  7 May 2014 12:05:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
X-Greylist: delayed 700 seconds by postgrey-1.32 at yocto-www;
	Wed, 07 May 2014 12:05:24 PDT
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7985E00480
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 12:05:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s47IrXXZ005082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 May 2014 11:53:33 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.71]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 7 May 2014 11:53:33 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Josep Puigdemont
	<josep.puigdemont@enea.com>
Thread-Topic: [meta-virtualization] libvirt requires libssh2
Thread-Index: AQHPafI3WGGNqS8cp0SSBv0+yLLTuZs1jPmAgAABpwCAAAE0AP//5fHw
Message-ID: <007BD92917A2324FA403BCF9A464CF84565B7244@ALA-MBA.corp.ad.wrs.com>
References: <20140507124513.GA18437@iapetus.enea.se>
	<CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
	<20140507131642.GB18437@iapetus.enea.se>
	<CADkTA4P1UoOQP2FLQVv9_6JnLSKPmq4nYwHy2f1aPVR56sk_fg@mail.gmail.com>
In-Reply-To: <CADkTA4P1UoOQP2FLQVv9_6JnLSKPmq4nYwHy2f1aPVR56sk_fg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: libvirt requires libssh2
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
Date: Wed, 07 May 2014 19:05:30 -0000
X-Original-Date: Wed, 7 May 2014 18:53:33 +0000
X-List-Received-Date: Wed, 07 May 2014 19:05:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQg
W21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5
IDA3LCAyMDE0IDY6MjEgQU0NCj4gVG86IEpvc2VwIFB1aWdkZW1vbnQNCj4gQ2M6IG1ldGEtdmly
dHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZzsgU2xhdGVyLCBKb3NlcGgNCj4gU3ViamVjdDog
UmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBsaWJ2aXJ0IHJlcXVpcmVzIGxpYnNzaDINCj4gDQo+
IE9uIFdlZCwgTWF5IDcsIDIwMTQgYXQgOToxNiBBTSwgSm9zZXAgUHVpZ2RlbW9udA0KPiA8am9z
ZXAucHVpZ2RlbW9udEBlbmVhLmNvbT4gd3JvdGU6DQo+ID4gT24gV2VkLCBNYXkgMDcsIDIwMTQg
YXQgMDk6MTA6NDdBTSAtMDQwMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+ID4+IE9uIFdlZCwg
TWF5IDcsIDIwMTQgYXQgODo0NSBBTSwgSm9zZXAgUHVpZ2RlbW9udA0KPiA+PiA8am9zZXAucHVp
Z2RlbW9udEBlbmVhLmNvbT4gd3JvdGU6DQo+ID4+ID4gSGksDQo+ID4+ID4NCj4gPj4gPiBBIGRl
ZmF1bHQgZGVwZW5kZW5jeSBvbiBsaWJzc2gyIGZvciBsaWJ2aXJ0IHdhcyBhZGRlZCByZWNlbnRs
eS4gV2hlcmUgaXMgbGlic3NoMg0KPiA+PiA+IHByb3ZpZGVkPyBJIGNhbiBub3QgZmluZCBpdCBp
biBlaXRoZXIgbWV0YS1vZSBvciBvZS1jb3JlLg0KPiA+Pg0KPiA+PiBKb2UgPyBEaWQgdGhhdCBs
ZWFrIGluIGZyb20gc29tZXRoaW5nIGxvY2FsIHRvIHlvdSA/DQo+ID4+DQo+ID4+IFJlZ2FyZGxl
c3MsIEknbGwgcmV2ZXJ0IHRoZSBjaGFuZ2UgZm9yIG5vdy4NCj4gPg0KPiA+IE1heWJlIHdlIGNh
biBrZWVwIFBBQ0tBR0VDT05GSUdbbGlic3NoMl0NCj4gDQo+IElmIHRoYXQgZG9lc24ndCBtYXAg
dG8gYW55dGhpbmcgb2J2aW91cyBpbiB0aGUgeW9jdG8gZWNvc3lzdGVtLCB0aGVuIEkgd291bGRu
J3QNCj4gd2FudCBpdCB0byBiZSBhdmFpbGFibGUgYXQgYWxsLiBPdGhlcndpc2Ugd2UnbGwgcG9s
bHV0ZSB0aGUgb3B0aW9ucw0KPiB3aXRoIGludGVybmFsL3ByaXZhdGUNCj4gZmllbGRzIGluIGEg
cHVibGljIHJlY2lwZSAuLiB3aGljaCBpc24ndCB3aGF0IHdlIHdhbnQuDQoNCmxpYnZpcnQgY29u
ZmlndXJlIGRvZXMgY2hlY2sgZm9yIGFuZCB3aWxsIHNpbGVudGx5IHVzZSBsaWJzc2gyLCBzbyBp
dCBtaWdodCBiZSBnb29kDQp0byB0ZWxsIGl0IG5vdCB0by4NCg0KSm9lDQoNCg0KPiANCj4gSSBv
YnZpb3VzbHkgc2hvdWxkIGhhdmUgZG9uZSBhIGJ1aWxkIHRlc3Qgb24gdGhpcyBvbmUsIGJ1dCBp
bnN0ZWFkDQo+IGFzc3VtZWQgaXQgd2FzIHNhZmUNCj4gLi4uIGxlc3NvbiBsZWFybmVkLg0KPiAN
Cj4gQnJ1Y2UNCj4gDQo+ID4NCj4gPiAvSm9zZXANCj4gPj4NCj4gPj4gQnJ1Y2UNCj4gPj4NCj4g
Pj4gPg0KPiA+PiA+IFRoYW5rcywNCj4gPj4gPiBKb3NlcA0KPiA+PiA+IC0tDQo+ID4+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPj4gPiBtZXRh
LXZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KPiA+PiA+IG1ldGEtdmlydHVhbGl6YXRpb25A
eW9jdG9wcm9qZWN0Lm9yZw0KPiA+PiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9s
aXN0aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IC0tDQo+
ID4+ICJUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFu
ZCBtYWRuZXNzIGF3YWl0DQo+ID4+IHRoZWUgYXQgaXRzIGVuZCINCj4gDQo+IA0KPiANCj4gLS0N
Cj4gIlRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5k
IG1hZG5lc3MgYXdhaXQNCj4gdGhlZSBhdCBpdHMgZW5kIg0K


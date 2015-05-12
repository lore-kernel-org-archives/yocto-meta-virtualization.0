Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54D5DE00820; Mon, 11 May 2015 19:22:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8FE7E00477
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 May 2015 19:22:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2MYXw018068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 May 2015 19:22:34 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.141]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0224.002;
	Mon, 11 May 2015 19:22:33 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 00/10] core: update to the kilo
	release
Thread-Index: AQHQiPHAHCTvRdzStUyVUbABZ9VZC513onCw
Date: Tue, 12 May 2015 02:22:33 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF11A1285@ALA-MBA.corp.ad.wrs.com>
References: <cover.1430817811.git.jackie.huang@windriver.com>
	<CADkTA4Ov-AJ7AAD9=MZLvQ_p2oG+toeZE=MKSiyeXx8rZ+bY4A@mail.gmail.com>
In-Reply-To: <CADkTA4Ov-AJ7AAD9=MZLvQ_p2oG+toeZE=MKSiyeXx8rZ+bY4A@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.172]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 00/10] core: update to the kilo release
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
X-List-Received-Date: Tue, 12 May 2015 02:22:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQg
W21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgTWF5IDA4
LCAyMDE1IDI6MTUgQU0NCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gQ2M6IG1ldGEtdmly
dHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVh
bGl6YXRpb25dIFtQQVRDSCAwMC8xMF0gY29yZTogdXBkYXRlIHRvIHRoZSBraWxvIHJlbGVhc2UN
Cj4gDQo+IFRoYW5rcyBKYWNraWUsIEkndmUgbWVyZ2VkIHRoZXNlIHRvIHRoZSBtYXN0ZXIgYW5k
IGtpbG8gYnJhbmNoZXMuDQoNClRoYW5rcyBCcnVjZSwgYnV0IHNlZW1zIGxpa2UgeW91IG1pc3Nl
ZCB0aGlzIG9uZToNCg0KcHl0aG9uLWtleXN0b25lbWlkZGxld2FyZTogdXBncmFkZSB0byAxLjYu
MQ0KDQpDb3VsZCB5b3UgdGFrZSBhIGxvb2s/IFRoYW5rcyENCg0KVGhhbmtzLA0KSmFja2llDQoN
Cj4gDQo+IEJydWNlDQo+IA0KPiBPbiBUdWUsIE1heSA1LCAyMDE1IGF0IDk6NDQgUE0sICA8amFj
a2llLmh1YW5nQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+IEZyb206IEphY2tpZSBIdWFuZyA8
amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiB1cGRhdGUgdG8gdGhlIGtpbG8g
cmVsZWFzZSBhbmQgY2hhbmdlIHRvIHN0YWJsZS9raWxvIGJyYW5jaC4NCj4gPg0KPiA+IC0tDQo+
ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyZWQ5MzBmMjNlNGQ1Njc4ZWY5
NDNjZWY0MTNkMDljZDEwYzc4ZWI3Og0KPiA+DQo+ID4gICBweXRob24tc2V0dXB0b29scy1naXQ6
IHVwZ3JhZGUgdG8gMS4xICgyMDE1LTA0LTI5IDEyOjI5OjQyIC0wNDAwKQ0KPiA+DQo+ID4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4NCj4gPiAgIGdpdDovL2dp
dC5wb2t5bGludXgub3JnL3Bva3ktY29udHJpYiBqaHVhbmcwL3JfdXBfb3BlbnN0YWNrLWtpbG9f
MTUwNTA1LTANCj4gPg0KPiA+IGh0dHA6Ly9naXQucG9reWxpbnV4Lm9yZy9jZ2l0LmNnaS9wb2t5
LWNvbnRyaWIvbG9nLz9oPWpodWFuZzAvcl91cF9vcGUNCj4gPiBuc3RhY2sta2lsb18xNTA1MDUt
MA0KPiA+DQo+ID4gSmFja2llIEh1YW5nICgxMCk6DQo+ID4gICBweXRob24ta2V5c3RvbmVtaWRk
bGV3YXJlOiB1cGdyYWRlIHRvIDEuNi4xDQo+ID4gICBweXRob24tY2VpbG9tZXRlcjogdXBncmFk
ZSB0byAyMDE1LjEuMA0KPiA+ICAgcHl0aG9uLWNpbmRlcjogdXBncmFkZSB0byAyMDE1LjEuMA0K
PiA+ICAgcHl0aG9uLWdsYW5jZTogdXBncmFkZSB0byAyMDE1LjEuMA0KPiA+ICAgcHl0aG9uLWhl
YXQ6IHVwZ3JhZGUgdG8gMjAxNS4xLjANCj4gPiAgIHB5dGhvbi1ob3Jpem9uOiB1cGdyYWRlIHRv
IDIwMTUuMS4wDQo+ID4gICBweXRob24ta2V5c3RvbmU6IHVwZ3JhZGUgdG8gMjAxNS4xLjANCj4g
PiAgIHB5dGhvbi1uZXV0cm9uOiB1cGdyYWRlIHRvIDIwMTUuMS4wDQo+ID4gICBweXRob24tbm92
YTogdXBncmFkZSB0byAyMDE1LjEuMA0KPiA+ICAgcHl0aG9uLWJhcmJpY2FuOiB1cGdyYWRlIHRv
IDIwMTUuMS4wDQo+ID4NCj4gPiAgbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLWJhcmJpY2FuX2dpdC5iYiAgICAgIHwgNiArKystLS0NCj4gPiAgbWV0YS1vcGVu
c3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNlaWxvbWV0ZXJfZ2l0LmJiICAg
IHwgNiArKystLS0NCj4gPiAgbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLWNpbmRlcl9naXQuYmIgICAgICAgIHwgNiArKystLS0NCj4gPiAgbWV0YS1vcGVuc3Rh
Y2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWdsYW5jZV9naXQuYmIgICAgICAgIHwg
NiArKystLS0NCj4gPiAgbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uLWhlYXRfZ2l0LmJiICAgICAgICAgIHwgNiArKystLS0NCj4gPiAgbWV0YS1vcGVuc3RhY2sv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWhvcml6b25fZ2l0LmJiICAgICAgIHwgNyAr
KystLS0tDQo+ID4gIG1ldGEtb3BlbnN0YWNrL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bi1rZXlzdG9uZV9naXQuYmIgICAgICB8IDcgKysrLS0tLQ0KPiA+ICAuLi4vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uLWtleXN0b25lbWlkZGxld2FyZV9naXQuYmIgICAgICAgfCA0ICsr
LS0NCj4gPiAgbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLW5l
dXRyb25fZ2l0LmJiICAgICAgIHwgNyArKystLS0tDQo+ID4gIG1ldGEtb3BlbnN0YWNrL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1ub3ZhX2dpdC5iYiAgICAgICAgICB8IDcgKysrLS0t
LQ0KPiA+ICAxMCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IC0tDQo+ID4gMS45LjENCj4gPg0KPiA+IC0tDQo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBtZXRhLXZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdA0KPiA+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9y
Zw0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLXZpcnR1
YWxpemF0aW9uDQo+IA0KPiANCj4gDQo+IC0tDQo+ICJUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhl
IE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVu
ZCINCg==


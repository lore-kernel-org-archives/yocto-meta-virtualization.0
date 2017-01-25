Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF930E00BC1; Tue, 24 Jan 2017 18:43:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15A8EE00B79
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 18:43:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15076204"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2017 10:42:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 495F1477AE67;
	Wed, 25 Jan 2017 10:42:53 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Wed, 25 Jan 2017 10:42:53 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] [meta-cloud-services] [PATCH]
	python-oslo.serialization: 1.11.0 -> 2.13.0
Thread-Index: AQHSdgVxISYRZtw72UirQfdxXfIIgqFHHOYAgAFgX9A=
Date: Wed, 25 Jan 2017 02:42:52 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6DE9BD4@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1485236865-905-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAPuovELK2_wnnah9+f=e3K5cR0t4eiOxKa8ZtKHzgQAe8xv-Cw@mail.gmail.com>
In-Reply-To: <CAPuovELK2_wnnah9+f=e3K5cR0t4eiOxKa8ZtKHzgQAe8xv-Cw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 495F1477AE67.A7485
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-oslo.serialization: 1.11.0 -> 2.13.0
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
X-List-Received-Date: Wed, 25 Jan 2017 02:43:07 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLiBJIHdpbGwgc3VibWl0IGEgbW9k
aWZpZWQgcGF0Y2ggc29vbi4NCg0KSHVhbmcNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogYXNzZWxzbUBnbWFpbC5jb20gW21haWx0
bzphc3NlbHNtQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIE1hcmsNCj4gQXNz
ZWxzdGluZQ0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI0LCAyMDE3IDk6
NDEgUE0NCj4gVG86IEh1YW5nLCBRaXl1L+m7hCDnkKblrocgPGh1YW5ncXku
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRp
b25AeW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmly
dHVhbGl6YXRpb25dIFttZXRhLWNsb3VkLXNlcnZpY2VzXSBbUEFUQ0hdDQo+
IHB5dGhvbi1vc2xvLnNlcmlhbGl6YXRpb246IDEuMTEuMCAtPiAyLjEzLjAN
Cj4gDQo+IE9uIFR1ZSwgSmFuIDI0LCAyMDE3IGF0IDEyOjQ3IEFNLCBIdWFu
ZyBRaXl1IDxodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IHdyb3Rl
Og0KPiA+IFVwZ3JhZGUgcHl0aG9uLW9zbG8uc2VyaWFsaXphdGlvbiBmcm9t
IDEuMTEuMCB0byAyLjEzLjAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
dWFuZyBRaXl1IDxodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4g
LS0tDQo+IA0KPiBZb3UgbWlzc2VkIHVwZGF0aW5nIHRoZSBSREVQRU5EUyBw
ZXIgdGhlIHJlcXVpcmVtZW50cy50eHQuIFRoZXNlIHNob3VsZA0KPiBub3cg
YmU6DQo+IFJERVBFTkRTXyR7UE59ICs9ICIgXA0KPiAgICAgICAgcHl0aG9u
LXBiciBcDQo+ICAgICAgICBweXRob24tc2l4IFwNCj4gICAgICAgIHB5dGhv
bi1tc2dwYWNrLXB5dGhvbiBcDQo+ICAgICAgICBweXRob24tb3Nsby51dGls
cyBcDQo+ICAgICAgICBweXRob24tcHl0eiBcDQo+ICAgICAgICAiDQo+IA0K
PiBJIGhhdmUgYXR0YWNoZWQgYSBzY3JpcHQgSSB1c2UgdG8gaGVscCBwYXJz
ZSB0aGUgcmVxdWlyZW1lbnRzLnR4dCBmaWxlLiBZb3UgY2FuDQo+IHVzZSBp
dCBmb3IgZXhhbXBsZToNCj4gDQo+ICAuL3JlcXVpcmVzLnB5DQo+IHRtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcHl0aG9uLW9zbG8uc2VyaWFsaXph
dGlvbi8yLjEzLjArZ2l0QVVUT0lOQytiDQo+IGUwMmZkYmViYy1yMC9naXQv
cmVxdWlyZW1lbnRzLnR4dA0KPiANCj4gUGxlYXNlIHNlbmQgYSB2MiB3aXRo
IHRoZSB1cGRhdGVkIFJERVBFTkRTLg0KPiANCj4gTWFyaw0KPiANCj4gDQo+
ID4gIC4uLi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tb3Nsby5z
ZXJpYWxpemF0aW9uX2dpdC5iYiAgICAgICAgfCA2DQo+ICsrKy0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS1vcGVuc3Rh
Y2svcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLW9zbG8uc2VyaWFs
aXphdGlvbl9naXQNCj4gPiAuYmINCj4gPiBiL21ldGEtb3BlbnN0YWNrL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1vc2xvLnNlcmlhbGl6YXRp
b25fZ2l0DQo+ID4gLmJiDQo+ID4gaW5kZXggMWJmMTFmNC4uNmQ1ODAxYiAx
MDA2NDQNCj4gPiAtLS0NCj4gPiBhL21ldGEtb3BlbnN0YWNrL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1vc2xvLnNlcmlhbGl6YXRpb25fZ2l0
DQo+ID4gLmJiDQo+ID4gKysrIGIvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLW9zbG8uc2VyaWFsaXphdGlvbg0KPiA+
ICsrKyBfZ2l0LmJiDQo+ID4gQEAgLTUsMTAgKzUsMTAgQEAgTElDRU5TRSA9
ICJBcGFjaGUtMi4wIg0KPiA+ICBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZp
bGU6Ly9MSUNFTlNFO21kNT0zNDQwMGI2ODA3MmQ3MTBmZWNkMGEyOTQwYTBk
MTY1OCINCj4gPg0KPiA+ICBTUkNOQU1FID0gIm9zbG8uc2VyaWFsaXphdGlv
biINCj4gPiAtU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29wZW5zdGFj
ay8ke1NSQ05BTUV9LmdpdCINCj4gPiArU1JDX1VSSSA9DQo+ICJnaXQ6Ly9n
aXRodWIuY29tL29wZW5zdGFjay8ke1NSQ05BTUV9LmdpdDticmFuY2g9c3Rh
YmxlL25ld3RvbiINCj4gPg0KPiA+IC1QViA9ICIxLjExLjArZ2l0JHtTUkNQ
Vn0iDQo+ID4gLVNSQ1JFViA9ICJhODYyNmVhOWY5ZTM3YmY0MTI5MDk2Y2My
Mjk1ZjYzNTE2ZmI3NjhlIg0KPiA+ICtQViA9ICIyLjEzLjArZ2l0JHtTUkNQ
Vn0iDQo+ID4gK1NSQ1JFViA9ICJiZTAyZmRiZWJjMmQ5ZjkyYTk1OWFhMzRl
MGNiNWEzMDkzNGRmYTBkIg0KPiA+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
PiA+DQo+ID4gIGluaGVyaXQgc2V0dXB0b29scw0KPiA+IC0tDQo+ID4gMi43
LjQNCj4gPg0KPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gbWV0YS12
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QNCj4gPiBtZXRhLXZpcnR1YWxp
emF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gPiBodHRwczovL2xpc3RzLnlv
Y3RvcHJvamVjdC5vcmcvbGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0K
PiANCg0KCgo=


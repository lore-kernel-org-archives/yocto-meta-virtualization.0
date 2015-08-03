Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DD56E00A84; Sun,  2 Aug 2015 20:29:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE6EEE0086D
	for <meta-virtualization@yoctoproject.org>;
	Sun,  2 Aug 2015 20:29:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99181656"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 11:32:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t733RRvo001320;
	Mon, 3 Aug 2015 11:27:27 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 3 Aug 2015 11:29:20 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] python-simplejson: upgrade
	3.6.2->3.7.3
Thread-Index: AQHQy5vy9Vz+QPQA/UuQ7jnCjxJLSZ35oaUA
Date: Mon, 3 Aug 2015 03:29:19 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2FC8A@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1438320602-17454-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CADkTA4OoZinY9vfO-DE+RQ1PjgzFHSQAA=JMGM3eg71zT53R9A@mail.gmail.com>
In-Reply-To: <CADkTA4OoZinY9vfO-DE+RQ1PjgzFHSQAA=JMGM3eg71zT53R9A@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-simplejson: upgrade 3.6.2->3.7.3
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
X-List-Received-Date: Mon, 03 Aug 2015 03:29:31 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KPiBPbmUgcmVxdWVzdCB0aG91Z2guIElmIHNvbWV0aGluZyBpcyBmb3IgbWV0
YS1jbG91ZC1zZXJ2aWNlcywgdmVyc3VzIG1ldGEtdmlydHVhbGl6YXRpb24sIGl0DQo+IGlzIHdv
cnRoIG1lbnRpb25pbmcgYXMgW21ldGEtY2xvdWQtc2VydmljZXNdIG9yIFttLWMtc10gaW4gdGhl
IHN1YmplY3QgLi4gSSBoYWQgdG8gZGlnDQo+IHRocm91Z2ggdGhlIHR3byBkaWZmZXJlbnQgbGF5
ZXJzIHRvIGFwcGx5IHRoZSB1cGRhdGVzLg0KDQoNClRoYW5rcy4gSSBnb3QgaXQuDQoNCkNoZWVy
cw0KTGVpDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gU2VudDogRnJpZGF5
LCBKdWx5IDMxLCAyMDE1IDEwOjIwIFBNDQo+IFRvOiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnDQo+
IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6
IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbUEFUQ0hdIHB5dGhvbi1zaW1wbGVqc29uOiB1cGdyYWRl
IDMuNi4yLT4zLjcuMw0KPiANCj4gVGhhbmtzLg0KPiANCj4gSSd2ZSBtZXJnZWQgYWxsIHRoZSB1
cGRhdGVzIHRvIG1hc3Rlci4NCj4gDQo+IE9uZSByZXF1ZXN0IHRob3VnaC4gSWYgc29tZXRoaW5n
IGlzIGZvciBtZXRhLWNsb3VkLXNlcnZpY2VzLCB2ZXJzdXMgbWV0YS12aXJ0dWFsaXphdGlvbiwg
aXQNCj4gaXMgd29ydGggbWVudGlvbmluZyBhcyBbbWV0YS1jbG91ZC1zZXJ2aWNlc10gb3IgW20t
Yy1zXSBpbiB0aGUgc3ViamVjdCAuLiBJIGhhZCB0byBkaWcNCj4gdGhyb3VnaCB0aGUgdHdvIGRp
ZmZlcmVudCBsYXllcnMgdG8gYXBwbHkgdGhlIHVwZGF0ZXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiBCcnVjZQ0KPiANCj4gT24gRnJpLCBKdWwgMzEsIDIwMTUgYXQgMTozMCBBTSwgTGVpIE1hb2h1
aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
ZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9w
eXRob24ve3B5dGhvbi1zaW1wbGVqc29uXzMuNi4yLmJiID0+IHB5dGhvbi1zaW1wbGVqc29uXzMu
Ny4zLmJifQ0KPiA+IHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pICByZW5hbWUNCj4gPiByZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uLXNpbXBsZWpzb25fMy42LjIuYmIgPT4NCj4gPiBweXRob24tc2ltcGxlanNvbl8zLjcu
My5iYn0gKDg0JSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24tc2ltcGxlanNvbl8zLjYuMi5iYg0KPiA+IGIvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXNpbXBsZWpzb25fMy43LjMuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDg0JQ0K
PiA+IHJlbmFtZSBmcm9tIHJlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1zaW1wbGVqc29u
XzMuNi4yLmJiDQo+ID4gcmVuYW1lIHRvIHJlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1z
aW1wbGVqc29uXzMuNy4zLmJiDQo+ID4gaW5kZXggZWNjNDY3OS4uMzlkZmNlNiAxMDA2NDQNCj4g
PiAtLS0gYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc2ltcGxlanNvbl8zLjYuMi5i
Yg0KPiA+ICsrKyBiL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1zaW1wbGVqc29uXzMu
Ny4zLmJiDQo+ID4gQEAgLTEzLDggKzEzLDggQEAgUFIgPSAicjAiDQo+ID4gIFNSQ05BTUUgPSAi
c2ltcGxlanNvbiINCj4gPg0KPiA+ICBTUkNfVVJJID0NCj4gImh0dHBzOi8vcHlwaS5weXRob24u
b3JnL3BhY2thZ2VzL3NvdXJjZS9zL3NpbXBsZWpzb24vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3oi
DQo+ID4gLVNSQ19VUklbbWQ1c3VtXSA9ICJkZWNhODcxYjliZmE0Yjc2ZWEzNjA3NTZiMmEyMjcx
MCINCj4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjk5YzA5MjIwOWY4OGQ0MTE4NThmMDFi
MTRhOTdhNGZjZjhjNGY0MzhhNjg1ZTIzZDczM2EzZDY1ZGU1MmEzNWQiDQo+ID4gK1NSQ19VUklb
bWQ1c3VtXSA9ICIxMTczNDZlNWVlNGVkNDQzNGZmZTQ4NWY4ZTU4ZjVlZCINCj4gPiArU1JDX1VS
SVtzaGEyNTZzdW1dID0NCj4gIjYzZDdmN2IxNGEyMGYyOWY3NDMyNWE2OWU2ZGI0NTkyNWVhZjZl
M2EwMDNlYWI0NmMwMjM0ZmQwNTBhOGM5M2YiDQo+ID4NCj4gPiAgUyA9ICIke1dPUktESVJ9LyR7
U1JDTkFNRX0tJHtQVn0iDQo+ID4NCj4gPiAtLQ0KPiA+IDEuOC40LjINCj4gPg0KPiA+IC0tDQo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBt
ZXRhLXZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KPiA+IG1ldGEtdmlydHVhbGl6YXRpb25A
eW9jdG9wcm9qZWN0Lm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0
aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQo+IA0KPiANCj4gDQo+IC0tDQo+ICJUaG91IHNoYWx0
IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0
IHRoZWUgYXQgaXRzIGVuZCINCg==


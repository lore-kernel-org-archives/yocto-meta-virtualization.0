Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FF6DE00A01; Sun, 16 Aug 2015 18:26:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C34A3E0049B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 16 Aug 2015 18:26:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99696146"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2015 09:29:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7H1QWip002857;
	Mon, 17 Aug 2015 09:26:32 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 17 Aug 2015 09:26:34 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] [meta-cloud-services][PATCH]
	ruby.bbclass: Error fix
Thread-Index: AQHQ0PUL/lG5NbnhPUyvae0dHzbQF54AEqcAgA9iwHA=
Date: Mon, 17 Aug 2015 01:26:32 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBA479@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAPuovEKHHGyqezC7tv3JZURxZ22O0dkox9tn8ZcLGMUtNYoBYw@mail.gmail.com>
In-Reply-To: <CAPuovEKHHGyqezC7tv3JZURxZ22O0dkox9tn8ZcLGMUtNYoBYw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] ruby.bbclass: Error fix
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
X-List-Received-Date: Mon, 17 Aug 2015 01:26:44 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGFzc2Vsc21AZ21haWwuY29t
IFttYWlsdG86YXNzZWxzbUBnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBNYXJrDQo+QXNzZWxzdGlu
ZQ0KPlNlbnQ6IEZyaWRheSwgQXVndXN0IDA3LCAyMDE1IDEwOjI5IFBNDQo+VG86IExpLCBYaW4v
5p2OIOasow0KPkNjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcNCj5TdWJq
ZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dIFttZXRhLWNsb3VkLXNlcnZpY2VzXVtQQVRD
SF0gcnVieS5iYmNsYXNzOiBFcnJvcg0KPmZpeA0KPg0KPkkgaGFkIGludGVudGlvbnMgb2YgZGl2
ZXN0aW5nIG1ldGEtY2xvdWQtc2VydmljZXMgb2YgbXVjaCBvZiB0aGUgcnVieSBiaXRzIGFuZCBh
cyBzdWNoDQo+aGF2ZSBhbHJlYWR5IGdvdCB0aGlzIGNsYXNzIG1lcmdlZCB0byBtZXRhLW9lL21l
dGEtcnVieS4gU28gYmUgc3VyZSB0byBzZW5kIHRoaXMgZml4DQo+dGhlcmUgdG9vLg0KDQpPSywg
SSB3aWxsIHNlbmQgdGhpcyBwYXRjaCB0aGVyZSB0b28uDQoNClRoYW5rcywNCkxpDQoNCg0KPg0K
Pk9uIEZyaSwgQXVnIDcsIDIwMTUgYXQgNTozOSBBTSwgTGkgeGluIDxsaXhpbi5mbnN0QGNuLmZ1
aml0c3UuY29tPiB3cm90ZToNCj4+IFdoZW4gYnVpbGQgdGhlIHJlY2lwZXMgd2hpY2ggaW5oZXJp
dCBydWJ5LEVSUk9SIHdpbGwgb2NjdXIgYXMgZm9sbG93aW5nOg0KPj4gRVJST1I6IFFBIElzc3Vl
OiBub24gZGVidWcgcGFja2FnZSBjb250YWlucyAuZGVidWcgZGlyZWN0b3J5OiBqc29uDQo+PiBw
YXRoDQo+PiAvd29yay9jb3JlMi02NC1vZS1saW51eC9qc29uLzEuOC4zLXIwL3BhY2thZ2VzLXNw
bGl0L2pzb24vdXNyL2xpYi9ydWJ5DQo+PiAvDQo+PiBnZW1zLzIuMi4wL2V4dGVuc2lvbnMveDg2
XzY0LWxpbnV4LzIuMi4wL2pzb24tMS44LjMvanNvbi9leHQvLmRlYnVnL2dlDQo+PiBuZXJhdG9y
LnNvIFtkZWJ1Zy1maWxlc10gU28gbW9kaWZ5IHJ1YnkuYmJjbGFzcy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBMaSBYaW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+PiAtLS0NCj4+ICBt
ZXRhLW9wZW5zdGFjay9jbGFzc2VzL3J1YnkuYmJjbGFzcyB8IDEgKw0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhLW9wZW5zdGFjay9j
bGFzc2VzL3J1YnkuYmJjbGFzcw0KPj4gYi9tZXRhLW9wZW5zdGFjay9jbGFzc2VzL3J1YnkuYmJj
bGFzcw0KPj4gaW5kZXggOTU3YWJmNy4uMGM4NDJkNSAxMDA2NDQNCj4+IC0tLSBhL21ldGEtb3Bl
bnN0YWNrL2NsYXNzZXMvcnVieS5iYmNsYXNzDQo+PiArKysgYi9tZXRhLW9wZW5zdGFjay9jbGFz
c2VzL3J1YnkuYmJjbGFzcw0KPj4gQEAgLTExNCw2ICsxMTQsNyBAQCBGSUxFU18ke1BOfS1kYmcg
Kz0gIiBcDQo+PiAgICAgICAgICAke2xpYmRpcn0vcnVieS9nZW1zLyR7UlVCWV9HRU1fVkVSU0lP
Tn0vZ2Vtcy8qLyovKi8uZGVidWcgXA0KPj4gICAgICAgICAgJHtsaWJkaXJ9L3J1YnkvZ2Vtcy8k
e1JVQllfR0VNX1ZFUlNJT059L2dlbXMvKi8qLyovKi8uZGVidWcgXA0KPj4gICAgICAgICAgJHts
aWJkaXJ9L3J1YnkvZ2Vtcy8ke1JVQllfR0VNX1ZFUlNJT059L2dlbXMvKi8qLyovKi8qLy5kZWJ1
Zw0KPj4gXA0KPj4gKw0KPj4gKyAke2xpYmRpcn0vcnVieS9nZW1zLyR7UlVCWV9HRU1fVkVSU0lP
Tn0vZXh0ZW5zaW9ucy8qLyovKi8qLyovLmRlYnVnDQo+PiArIFwNCj4+ICAgICAgICAgICINCj4+
DQo+PiAgRklMRVNfJHtQTn0gKz0gIiBcDQo+PiAtLQ0KPj4gMS44LjQuMg0KPj4NCj4+IC0tDQo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gbWV0
YS12aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QNCj4+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9j
dG9wcm9qZWN0Lm9yZw0KPj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2xpc3RpbmZv
L21ldGEtdmlydHVhbGl6YXRpb24NCg==


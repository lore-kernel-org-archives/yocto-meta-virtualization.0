Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBA46E00992; Wed, 18 Jan 2017 00:24:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA7EAE0098A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 00:24:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14871914"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2017 16:24:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C954047B0CB6;
	Wed, 18 Jan 2017 16:24:39 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Wed, 18 Jan 2017 16:24:40 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>, "Bruce
	Ashfield" <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
Thread-Index: AQHSb5scmQirE4wdwUuRlXI5mU6wnKE8kLMAgAASJoCAAUWG4A==
Date: Wed, 18 Jan 2017 08:24:39 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6DE7B6C@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CADkTA4PSg5kfWJgjYfk5reLfGXgUDuoxuijHZq8SQc0bYCivcA@mail.gmail.com>
	<CAPuovELe3f-6Co=cz54oniX2i4+E_DbTHhhD=z_Knc2TXbQXHw@mail.gmail.com>
In-Reply-To: <CAPuovELe3f-6Co=cz54oniX2i4+E_DbTHhhD=z_Knc2TXbQXHw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: C954047B0CB6.AB83A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
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
X-List-Received-Date: Wed, 18 Jan 2017 08:24:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXQgdGhhdCB0aW1lLCBJIGRpZCBub3QgZmluZCB0aGUgdXBkYXRlZCB2ZXJz
aW9uLiBUaGUgbGF0ZXN0IHZlcnNpb24gb2YgdGhlIG9mZmljaWFsIHdlYnNp
dGUgaXMgMS4xLjUgbm93LiBDb21wYXJlZCB3aXRoIHRoZSAxLjAuOSB2ZXJz
aW9uLCB0aGUgZG93bmxvYWQgYWRkcmVzcyBoYXMgY2hhbmdlZC4gSSdsbCBz
ZW5kIHRoZSBWMiB2ZXJzaW9uIHRvIHVwZ3JhZGUgaXQgdG8gMS4xLjUgdmVy
c2lvbi4NCg0KVGhhbmtzDQpIdWFuZw0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBhc3NlbHNtQGdtYWlsLmNvbSBbbWFpbHRvOmFz
c2Vsc21AZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgTWFyaw0KPiBBc3NlbHN0
aW5lDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxOCwgMjAxNyA0OjU2
IEFNDQo+IFRvOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21h
aWwuY29tPg0KPiBDYzogSHVhbmcsIFFpeXUv6buEIOeQpuWuhyA8aHVhbmdx
eS5mbnN0QGNuLmZ1aml0c3UuY29tPjsNCj4gbWV0YS12aXJ0dWFsaXphdGlv
bkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0
dWFsaXphdGlvbl0gW1BBVENIXSBweXRob24tc3FsYWxjaGVteTogMS4wLjgg
LT4gMS4wLjkNCj4gDQo+IEh1YW5nIEkgZGlkbid0IHNlZSBhbnkgaW5kaWNh
dGlvbiBpbiB0aGUgY29tbWl0IGxvZyByZWxhdGVkIHRvIHdoeSB5b3Ugc3Rv
cHBlZA0KPiBhdCAxLjAuOSBhbmQgZGlkbid0IGNvbnRpbnVlIHRvIHRha2Ug
dGhpcyB0byAxLjAuMTYuIElzIHRoZXJlIGEgcmVhc29uIHlvdQ0KPiBzZWxl
Y3RlZCB0aGlzIHZlcnNpb24/IEkgd291bGQgbGlrZSB0byB0YWtlIGl0IHRv
IDEuMC4xNiB0byBwaWNrIHVwIHRoZSByZW1haW5pbmcNCj4gYnVnIGZpeGVz
IGFzIHdlbGwgYXMgc3VwcG9ydCB0aGUgdXByZXYgdG8gT3BlblN0YWNrIE5l
d3RvbiBpbg0KPiBtZXRhLWNsb3VkLXNlcnZpY2VzLiBweXRob24tb3Nsby5k
YiBpbiBzdGFibGUvbmV3dG9uIHJlcXVpcmVzIDEuMC4xMCBhdA0KPiBtaW5p
bXVtLiBQbGVhc2UgbGV0IG1lIGtub3cuDQo+IA0KPiBNYXJrDQo+IA0KPiBP
biBUdWUsIEphbiAxNywgMjAxNyBhdCAyOjUwIFBNLCBCcnVjZSBBc2hmaWVs
ZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiB3cm90ZToNCj4gPiBt
ZXJnZWQuDQo+ID4NCj4gPiBCcnVjZQ0KPiA+DQo+ID4gT24gU3VuLCBKYW4g
MTUsIDIwMTcgYXQgODo1MSBQTSwgSHVhbmcgUWl5dQ0KPiA+IDxodWFuZ3F5
LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gd3JvdGU6DQo+ID4+DQo+ID4+
IFVwZ3JhZGUgcHl0aG9uLXNxbGFsY2hlbXkgZnJvbSAxLjAuOCB0byAxLjAu
OS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUWl5dSA8aHVh
bmdxeS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+PiAtLS0NCj4gPj4gIC4u
Li9weXRob24ve3B5dGhvbi1zcWxhbGNoZW15XzEuMC44LmJiID0+DQo+ID4+
IHB5dGhvbi1zcWxhbGNoZW15XzEuMC45LmJifSB8IDQNCj4gPj4gKystLQ0K
PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkgIHJlbmFtZQ0KPiA+PiByZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uLXNxbGFsY2hlbXlfMS4wLjguYmIgPT4NCj4gPj4gcHl0aG9u
LXNxbGFsY2hlbXlfMS4wLjkuYmJ9ICg3NiUpDQo+ID4+DQo+ID4+IGRpZmYg
LS1naXQgYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc3FsYWxj
aGVteV8xLjAuOC5iYg0KPiA+PiBiL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1zcWxhbGNoZW15XzEuMC45LmJiDQo+ID4+IHNpbWlsYXJpdHkg
aW5kZXggNzYlDQo+ID4+IHJlbmFtZSBmcm9tIHJlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1zcWxhbGNoZW15XzEuMC44LmJiDQo+ID4+IHJlbmFt
ZSB0byByZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc3FsYWxjaGVt
eV8xLjAuOS5iYg0KPiA+PiBpbmRleCAyZDY2ZmZkLi4wMWM5NGE1IDEwMDY0
NA0KPiA+PiAtLS0gYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24t
c3FsYWxjaGVteV8xLjAuOC5iYg0KPiA+PiArKysgYi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24tc3FsYWxjaGVteV8xLjAuOS5iYg0KPiA+PiBA
QCAtOCw4ICs4LDggQEAgUkRFUEVORFNfJHtQTn0gKz0gInB5dGhvbi1udW1i
ZXJzIg0KPiA+PiAgU1JDTkFNRSA9ICJTUUxBbGNoZW15Ig0KPiA+PiAgU1JD
X1VSSSA9DQo+ID4+DQo+ICJodHRwczovL3B5cGkucHl0aG9uLm9yZy9wYWNr
YWdlcy9zb3VyY2UvUy8ke1NSQ05BTUV9LyR7U1JDTkFNRX0tJHtQVn0uDQo+
IHRhci5neiINCj4gPj4NCj4gPj4gLVNSQ19VUklbbWQ1c3VtXSA9ICI3Y2Zk
MDA1YmU2Mzk0NWM5NmE3OGM2Nzc2NGFjM2E4NSINCj4gPj4gLVNSQ19VUklb
c2hhMjU2c3VtXSA9DQo+ID4+DQo+ICI5NTBjNzljMGFiZjllOWY5OWM0M2M2
MjdjNTFkNDBkMTRhOTQ2ODEwYTkwYzM1ZTdjZDgyN2JmZDBiZmZlNDZmIg0K
PiA+PiArU1JDX1VSSVttZDVzdW1dID0gIjBlMmQ3NDQyZTcwZDAyYzlmNjM0
NmE1YmYwZWMyMjY1Ig0KPiA+PiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4g
Pj4NCj4gImMzZDM3NTAxZTM2ZWM1ZDc0YzJkN2I0YTM3NjQ3MTlkYjg2YTlj
ZGFiNGEyNDQzMWJmNThiMzg2NzQzYWIxMGUNCj4gIg0KPiA+Pg0KPiA+PiAg
UyA9ICIke1dPUktESVJ9LyR7U1JDTkFNRX0tJHtQVn0iDQo+ID4+DQo+ID4+
IC0tDQo+ID4+IDIuNy40DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IC0tDQo+
ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4+IG1ldGEtdmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
DQo+ID4+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0K
PiA+PiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8v
bWV0YS12aXJ0dWFsaXphdGlvbg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4g
LS0NCj4gPiAiVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50
ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KPiA+IHRoZWUgYXQg
aXRzIGVuZCINCj4gPg0KPiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBtZXRhLXZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdA0KPiA+IG1ldGEtdmlydHVhbGl6YXRp
b25AeW9jdG9wcm9qZWN0Lm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLXZpcnR1YWxpemF0aW9uDQo+ID4N
Cj4gDQoNCgoK


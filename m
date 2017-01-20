Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2E5DE00ADD; Thu, 19 Jan 2017 19:19:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62C9CE00ACE
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 19:19:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14937387"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 11:19:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 75E9E47B0CB2;
	Fri, 20 Jan 2017 11:19:07 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Fri, 20 Jan 2017 11:19:08 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "bruce.ashfield@windriver.com"
	<bruce.ashfield@windriver.com>
Thread-Topic: [0/2] python-sqlalchemy uprev / new version
Thread-Index: AQHScormVJqSkgsaNEW8f/i1Leg5haFArgfA
Date: Fri, 20 Jan 2017 03:19:07 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6DE9138@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 75E9E47B0CB2.AC120
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: Re: [0/2] python-sqlalchemy uprev / new version
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
X-List-Received-Date: Fri, 20 Jan 2017 03:19:17 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSBhZ3JlZSB0byB0aGVzZSBjaGFuZ2VzLiBJdCBkb3Nlbid0IG1hdHRlciB0
byB1c2UgcGF0Y2ggIiBweXRob24tc3FsYWxjaGVteTogMS4wLjkgLT4gMS4x
LjUiLg0KDQpIdWFuZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IE1hcmsgQXNzZWxzdGluZSBbbWFpbHRvOm1hcmsuYXNzZWxz
dGluZUB3aW5kcml2ZXIuY29tXQ0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkg
MjAsIDIwMTcgMzozMyBBTQ0KPiBUbzogbWV0YS12aXJ0dWFsaXphdGlvbkB5
b2N0b3Byb2plY3Qub3JnOyBicnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIuY29t
Ow0KPiBIdWFuZywgUWl5dS+7xiDn+dPuIDxodWFuZ3F5LmZuc3RAY24uZnVq
aXRzdS5jb20+DQo+IFN1YmplY3Q6IFswLzJdIHB5dGhvbi1zcWxhbGNoZW15
IHVwcmV2IC8gbmV3IHZlcnNpb24NCj4gDQo+IFRoZXJlIGFyZSB0d28gZGlz
dGluY3QgYWN0aXZlIHJlbGVhc2Ugc2VyaWVzIG9mIHRoZSBweXRob24gc3Fs
YWxjaGVteSBwYWNrYWdlDQo+ICgxLjAueCBhbmQgMS4xLngpLiBGb3Igc29t
ZSBwYWNrYWdlcywgbGlrZSBkb2NrZXItcmVnaXN0cnkgdGhlcmUgYXBwZWFy
cyB0byBiZQ0KPiBubyBpbmNvbXBhdGliaWxpdHkgaXNzdWVzIHdoZW4gdXNp
bmcgdGhlIDEuMC54IHZzIHRoZSAxLjEueCBzZXJpZXMsIGhvd2V2ZXIsDQo+
IHRoZXJlIGFyZSBvcGVuc3RhY2sgcGFja2FnZXMgd2hpY2ggYXJlIG9ubHkg
Y29tcGF0aWJsZSB3aXRoIHRoZSAxLjAueCBzZXJpZXMuDQo+IEFzIHN1Y2gg
d2UgY2FuIGFkZCB0aGUgcmVjaXBlcyB0byBidWlsZCB0aGUgMS4xLnggc2Vy
aWVzIGJ1dCBmb3Igbm93IHdlIHdpbGwNCj4gbGVhdmUgdGhlIDEuMC54IHNl
cmllcyBpbiBwbGFjZSBmb3IgdGhvc2UgcGFja2FnZXMgd2hpY2ggcmVxdWly
ZSBpdC4NCj4gDQo+IEh1YW5nIFFpeXUncyBvcmlnaW5hbCB1cHJldiB0byAx
LjEuNSBoYXMgYmVlbiBtb2RpZmllZCB0byBsZWF2ZSAxLjAuOSBpbiBwbGFj
ZQ0KPiBhbmQgSSBoYXZlIGluY2x1ZGVkIGEgc2Vjb25kIGNvbW1pdCB0byB1
cHJldiB0byB0aGUgbGF0ZXN0IHN0YWJsZSByZWxlYXNlIGluIHRoZQ0KPiAx
LjAueCBzZXJpZXMuDQo+IA0KPiBIdWFuZyBRaXl1IHBsZWFzZSBoYXZlIGEg
bG9vayBhbmQgYWdyZWUgdG8gdGhlc2UgY2hhbmdlcywgc2luY2UgSSBsZWZ0
IHlvdXINCj4gc2lnbm9mZiBpbiBwbGFjZSBJIGRvbid0IHdhbnQgQnJ1Y2Ug
dG8gbWVyZ2UgdGhpcyB1bnRpbCB5b3UgYXJlIGNvbWZvcnRhYmxlIHdpdGgN
Cj4gbXkgY2hhbmdlcy4NCj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmsNCj4gDQoN
CgoK


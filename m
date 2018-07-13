Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75C13E00DAE; Thu, 12 Jul 2018 18:26:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5726BE0089D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Jul 2018 18:26:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42190100"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2018 09:26:43 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E3544B5CD6A;
	Fri, 13 Jul 2018 09:26:44 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0399.000; Fri, 13 Jul 2018 09:26:43 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] [PATCH] criu: upgrade to 3.9
Thread-Index: AQHUGFPr6LAWPYOoZ02phstNxee0FaSMXftw
Date: Fri, 13 Jul 2018 01:26:44 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF738709B5B4@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1530707794-106222-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CADkTA4NCdxU5OYwNHMoDSyw=1MupjfC=RdgEVeTwaJHGkC1qJQ@mail.gmail.com>
In-Reply-To: <CADkTA4NCdxU5OYwNHMoDSyw=1MupjfC=RdgEVeTwaJHGkC1qJQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1E3544B5CD6A.A8C5A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] [PATCH] criu: upgrade to 3.9
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
X-List-Received-Date: Fri, 13 Jul 2018 01:26:48 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KMSA+Zml4LWJ1aWxkaW5nLW9uLW5ld2VzdC1nbGliYy1h
bmQta2VybmVsLnBhdGNoDQpUaGlzIHBhdGNoIGlzIHJlbW92ZWQgZm9yIGl0
IGhhcyBiZWVuIG1lcmdlZCAgaW4gdXBzdHJlYW0uDQoNCjIgPiArQ0ZMQUdT
X2FybSArPSAiLURfX1dPUkRTSVpFIg0KSSBhZGQgdGhpcyBDRkxBR1MgdG8g
c29sdmUgdGhlIGNvbXBpbGUgcHJvYmxlbSBmb3IgYXJtLg0KDQpUaGUgbG9n
IGlzIGFzIGZvbGxvd2luZzoNCnwgLi4uLi4uL3RtcC93b3JrL2FybXY1ZS1w
b2t5LWxpbnV4LWdudWVhYmkvY3JpdS8zLjQrZ2l0QVVUT0lOQythMzFjMTg1
NGUxLXIwL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvd29yZHNp
emUuaDozNjoyOiBlcnJvcjogI2Vycm9yICJfX1dPUkRTSVpFIGlzIG5vdCBk
ZWZpbmVkIg0KfCAgI2Vycm9yICJfX1dPUkRTSVpFIGlzIG5vdCBkZWZpbmVk
Ig0KfCAgIF4NCnwgLi4uLi4uL3RtcC93b3JrL2FybXY1ZS1wb2t5LWxpbnV4
LWdudWVhYmkvY3JpdS8zLjQrZ2l0QVVUT0lOQythMzFjMTg1NGUxLXIwL3Jl
Y2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvd29yZHNpemUuaDo1OToy
OiBlcnJvcjogI2Vycm9yICJVbmtub3duIF9fV09SRFNJWkUgZGV0ZWN0ZWQi
DQp8ICAjZXJyb3IgIlVua25vd24gX19XT1JEU0laRSBkZXRlY3RlZCINCg0K
MyA+ICtleHBvcnQgQ19JTkNMVURFX1BBVEg9IiR7U1RBR0lOR19JTkNESVJ9
L2xpYm5sMyINCkkgYWRkIENfSU5DTFVERV9QQVRIIHRvIHNvbHZlIHRoZSBj
b21waWxlIHByb2JsZW0gZm9yIGFybS4NClRoZSBwcm9ibGVtIGlzIHRoYXQg
bGlibmV0bGluay5jIGNhbid0IGZpbmQgaGVhZCBmaWxlLg0KDQp8IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBjcml1L2xpYm5ldGxpbmsuYzo1Og0KfCAuLi4u
Li4vdG1wL3dvcmsvYXJtdjVlLXANCnwgb2t5LWxpbnV4LWdudWVhYmkvY3Jp
dS8zLjkrZ2l0QVVUT0lOQysyMDJiNzc0NWJkLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9pbmNsdWRlL2xpYm5sMy9uZXRsaW5rL2F0dHIuaDoxNToxMDogZmF0
YWwgZXJyb3I6IG5ldGxpbmsvbmV0bGluay5oOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5ICAjaW5jbHVkZSA8bmV0bGluay9uZXRsaW5rLmg+DQp8ICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+DQoNCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClpoZW5n
IFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2gu
IENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNv
ZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAyMTAwMTIsIENoaW5h
DQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlzdHUuY29tDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxk
IFttYWlsdG86YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tXSANClNlbnQ6IFR1
ZXNkYXksIEp1bHkgMTAsIDIwMTggOTo0MyBQTQ0KVG86IFpoZW5nLCBSdW9x
aW4v6YORIOiLpemSpiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0K
Q2M6IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KU3Vi
amVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbUEFUQ0hdIFtQQVRD
SF0gY3JpdTogdXBncmFkZSB0byAzLjkNCg0KVGhhbmtzIGZvciB0aGUgdXBy
ZXYsIGJ1dCBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIGJlbG93Lg0KDQpPbiBX
ZWQsIEp1bCA0LCAyMDE4IGF0IDg6MzYgQU0sIFpoZW5nIFJ1b3FpbiA8emhl
bmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gVXBncmFkZSBj
cml1IGZyb20gMy40IHRvIDMuOS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWmhl
bmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0t
LQ0KPiAgcmVjaXBlcy1jb250YWluZXJzL2NyaXUve2NyaXVfZ2l0LmJiID0+
IGNyaXVfMy45LmJifSB8IDcgKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkgIHJlbmFtZSANCj4g
cmVjaXBlcy1jb250YWluZXJzL2NyaXUve2NyaXVfZ2l0LmJiID0+IGNyaXVf
My45LmJifSAoOTQlKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250
YWluZXJzL2NyaXUvY3JpdV9naXQuYmIgDQo+IGIvcmVjaXBlcy1jb250YWlu
ZXJzL2NyaXUvY3JpdV8zLjkuYmINCj4gc2ltaWxhcml0eSBpbmRleCA5NCUN
Cj4gcmVuYW1lIGZyb20gcmVjaXBlcy1jb250YWluZXJzL2NyaXUvY3JpdV9n
aXQuYmINCj4gcmVuYW1lIHRvIHJlY2lwZXMtY29udGFpbmVycy9jcml1L2Ny
aXVfMy45LmJiDQo+IGluZGV4IDdkNjJmMzUuLjM2YzM1NmQgMTAwNjQ0DQo+
IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9jcml1L2NyaXVfZ2l0LmJiDQo+
ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jcml1L2NyaXVfMy45LmJiDQo+
IEBAIC0xMywxNSArMTMsMTQgQEAgRVhDTFVERV9GUk9NX1dPUkxEID0gIjEi
DQo+DQo+ICBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT00MTJkZTQ1ODU0NGMxY2I2YTJiNTEyY2QzOTkyODZlMiINCj4NCj4gLVNS
Q1JFViA9ICJhMzFjMTg1NGUxMDU4MGEwOTYyMWU1MzljM2VjMDUyYjg3NWE4
ZTA2Ig0KPiAtUFYgPSAiMy40K2dpdCR7U1JDUFZ9Ig0KPiArU1JDUkVWID0g
IjIwMmI3NzQ1YmQwYzM3YTE3MzJlYmUyZmIwMDlhMTU3ZDMzOGJmOTUiDQo+
ICtQViA9ICIzLjkrZ2l0JHtTUkNQVn0iDQo+DQo+ICBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20veGVtdWwvY3JpdS5naXQ7cHJvdG9jb2w9Z2l0IFwN
Cj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtY3JpdS1GaXgtdG9vbGNoYWlu
LWhhcmRjb2RlLnBhdGNoIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDIt
Y3JpdS1Ta2lwLWRvY3VtZW50YXRpb24taW5zdGFsbC5wYXRjaCBcDQo+ICAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLWNyaXUtQ2hhbmdlLWxpYnJhcmllcy1p
bnN0YWxsLWRpcmVjdG9yeS5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6
Ly9saWItTWFrZWZpbGUtb3ZlcndyaXRlLWluc3RhbGwtbGliLXRvLWFsbG93
LW11bHRpYXJjLnBhdGNoIFwNCj4gLSAgICAgICAgICAgZmlsZTovL2ZpeC1i
dWlsZGluZy1vbi1uZXdlc3QtZ2xpYmMtYW5kLWtlcm5lbC5wYXRjaCBcDQoN
Ckkgc2VlIHRoaXMgcGF0Y2ggYmVpbmcgcmVtb3ZlZCBmcm9tIHRoZSBTUkNf
VVJJLCBidXQgbm90IHRoZSBkZWxldGUgb2YgdGhlIHBhdGNoLCBvciBhbiBl
eHBsYW5hdGlvbiBvZiB3aHkgaXQgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLg0K
DQo+ICAgICAgICAgICAgIg0KPg0KPiAgQ09NUEFUSUJMRV9IT1NUID0gIih4
ODZfNjR8YXJtfGFhcmNoNjQpLiotbGludXgiDQo+IEBAIC00Niw5ICs0NSwx
MSBAQCBFWFRSQV9PRU1BS0VfYXBwZW5kICs9ICJMT0dST1RBVEVESVI9JHtz
eXNjb25mZGlyfSANCj4gU1lTVEVNRFVOSVRESVI9JHtzeXN0ZW1kX3VuaXQg
IENGTEFHUyArPSAiLURfX1VTRV9HTlUgLURfR05VX1NPVVJDRSAiDQo+DQo+
ICBDRkxBR1MgKz0gIiAtSSR7U1RBR0lOR19JTkNESVJ9IC1JJHtTVEFHSU5H
X0lOQ0RJUn0vbGlibmwzIg0KPiArQ0ZMQUdTX2FybSArPSAiLURfX1dPUkRT
SVpFIg0KDQpDYW4gd2UgZG9jdW1lbnQgd2h5IHRoaXMgaXMgcmVxdWlyZWQs
IGFuZCB3aGF0IHRoZSBlcnJvciBpcyB3aXRob3V0IGl0ID8NCg0KPg0KPiAg
IyBvdmVyaWRlIExERkxBR1MgdG8gYWxsb3cgY3JpdSB0byBidWlsZCB3aXRo
b3V0OiAieDg2XzY0LXBva3ktbGludXgtbGQ6IHVucmVjb2duaXplZCBvcHRp
b24gJy1XbCwtTzEnIg0KPiAgZXhwb3J0IExERkxBR1M9IiINCj4gK2V4cG9y
dCBDX0lOQ0xVREVfUEFUSD0iJHtTVEFHSU5HX0lOQ0RJUn0vbGlibmwzIg0K
DQpMaWtld2lzZSwgd2UgbmVlZCB0byBkb2N1bWVudCB3aHkgdGhpcyBpcyBu
b3cgcmVxdWlyZWQuDQoNCkNoZWVycywNCg0KQnJ1Y2UNCg0KPg0KPiAgZXhw
b3J0IEJVSUxEX1NZUw0KPiAgZXhwb3J0IEhPU1RfU1lTDQo+IC0tDQo+IDIu
Ny40DQo+DQo+DQo+DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IG1ldGEtdmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0DQo+IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9w
cm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcv
bGlzdGluZm8vbWV0YS12aXJ0dWFsaXphdGlvbg0KDQoNCg0KLS0NCiJUaG91
IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9z
IGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZCINCg0KDQoKCg==


Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5020.1607408932854979718
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 22:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 60C6E38C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 06:28:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102167208"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 14:28:27 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C10F4CE600D
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 14:28:26 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 14:28:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::549d:26ce:6b90:da77])
 by G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::549d:26ce:6b90:da77%14]) with
 mapi id 15.00.1497.006; Tue, 8 Dec 2020 14:28:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: "Zang, Ruochen" <zangrc.fnst@cn.fujitsu.com>,
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
Thread-Topic: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
Thread-Index: AQHWvJgqFuP5KAyur06MaH0Kbc9cX6ns3Guw
Date: Tue, 8 Dec 2020 06:28:25 +0000
Message-ID: <655aec7943784ad28bc7a557cbb7fada@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <16483063CB70B824.5807@lists.yoctoproject.org>
In-Reply-To: <16483063CB70B824.5807@lists.yoctoproject.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4C10F4CE600D.A8AD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQpIZWxsbywgSSBmb3VuZCB0aGF0IG5vbmUgb2YgdGhlIHBhdGNo
ZXMgc3VibWl0dGVkIG9uIE5vdmVtYmVyIDE3LCAyMDIwIGhhdmUgYmVlbiBt
ZXJnZWQuIERvIEkgbmVlZCB0byByZSBzdWJtaXQgdGhlc2UgcGF0Y2hlcz8N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRh
LXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEt
DQo+IHZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9u
IEJlaGFsZiBPZiB6YW5ncmMNCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJl
ciAxOCwgMjAyMCAxMjoxNCBBTQ0KPiBUbzogbWV0YS12aXJ0dWFsaXphdGlv
bkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFttZXRhLXZpcnR1YWxp
emF0aW9uXSBbUEFUQ0hdIHB5dGhvbi1weXNxbGl0ZTogUmVtb3ZlIHJlY2lw
ZQ0KPiANCj4gV2hlbiBJIHRyaWVkIHRvIGNoYW5nZSBpdCB0byBweXRob24z
LCBpdCByZXBvcnRlZCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiB8IHB5c3Fs
aXRlIGlzIG5vdCBzdXBwb3J0ZWQgb24gUHl0aG9uIDMuIFdoZW4gdXNpbmcg
UHl0aG9uIDMsIHVzZSB0aGUgc3FsaXRlMw0KPiBtb2R1bGUgZnJvbSB0aGUg
c3RhbmRhcmQgbGlicmFyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFphbmcg
UnVvY2hlbiA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0K
PiAgLi4uL3B5dGhvbi9weXRob24tcHlzcWxpdGVfMi42LjMuYmIgICAgICAg
ICAgIHwgMjIgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIyIGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEtb3BlbnN0YWNrL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi0N
Cj4gcHlzcWxpdGVfMi42LjMuYmINCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
LW9wZW5zdGFjay9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tDQo+
IHB5c3FsaXRlXzIuNi4zLmJiIGIvbWV0YS1vcGVuc3RhY2svcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLQ0KPiBweXNxbGl0ZV8yLjYuMy5iYg0K
PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggNmI4ZGUwMGUu
LjAwMDAwMDAwDQo+IC0tLSBhL21ldGEtb3BlbnN0YWNrL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbi1weXNxbGl0ZV8yLjYuMy5iYg0KPiArKysg
L2Rldi9udWxsDQo+IEBAIC0xLDIyICswLDAgQEANCj4gLURFU0NSSVBUSU9O
ID0gIkRCLUFQSSAyLjAgaW50ZXJmYWNlIGZvciBTUUxpdGUgMy54Ig0KPiAt
SE9NRVBBR0UgPSAiaHR0cDovL2dpdGh1Yi5jb20vZ2hhZXJpbmcvcHlzcWxp
dGUiDQo+IC1TRUNUSU9OID0gImRldmVsL3B5dGhvbiINCj4gLUxJQ0VOU0Ug
PSAiWmxpYiINCj4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PWE4NWJkOTIzZTVjODMwZjhlYjg5ZGIzNTRmZjcyZjM4Ig0K
PiAtDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiN2ZmMWNlZGVlNzQ2NDZiNTAx
MTdhY2ZmODdhYTFjZmEiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAi
ZmU5YzM1MjE2YmY1NmM4NThiMzRjNGI0YzhiZTdlMzQ1NjZkZGVmMjk2NzBl
NWE1YjQzZjljYjhlY2ZiYjINCj4gOGQiDQo+IC0NCj4gLWluaGVyaXQgc2V0
dXB0b29sczMgcHlwaQ0KPiAtDQo+IC1GSUxFU18ke1BOfSArPSAiJHtkYXRh
ZGlyfS8qIg0KPiAtDQo+IC0jIERFUEVORFNfZGVmYXVsdDogcHl0aG9uLXBp
cA0KPiAtDQo+IC1ERVBFTkRTICs9ICIgXA0KPiAtICAgICAgICBweXRob24t
cGlwIFwNCj4gLSAgICAgICAgIg0KPiAtDQo+IC0jIFJERVBFTkRTX2RlZmF1
bHQ6DQo+IC1SREVQRU5EU18ke1BOfSArPSAiIFwNCj4gLSAgICAgICAgIg0K
PiAtLQ0KPiAyLjI1LjENCj4gDQo+IA0KDQoKCg==

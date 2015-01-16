Return-Path: <Christian.Ziethen@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E9DFE0084E; Fri, 16 Jan 2015 07:21:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7B904E0080C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jan 2015 07:21:49 -0800 (PST)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Fri, 16 Jan 2015 16:21:44 +0100
From: =?utf-8?B?Q2hyaXN0aWFuIFppZXRow6lu?= <Christian.Ziethen@enea.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: cfg fragments for networking.
Thread-Index: AdAxn7zXpd+XGDYQR+G2yeNqhHdqYA==
Date: Fri, 16 Jan 2015 15:21:43 +0000
Message-ID: <4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5@sestoex09.enea.se>
Accept-Language: sv-FI, sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.140.33]
MIME-Version: 1.0
Subject: cfg fragments for networking.
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
X-List-Received-Date: Fri, 16 Jan 2015 15:21:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5sestoex09enease_"

--_000_4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5sestoex09enease_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCldlIGhhdmUgc29tZSBjZmcgZnJhZ21lbnRzIGN1cnJlbnRseSBpbmNsdWRlZCBmb3Ig
b3VyIGxvY2FsIGJ1aWxkcyBhbmQgd2Ugd2VyZSBkaXNjdXNzaW5nIGluY2x1c2lvbiBvZiB0aGUg
ZnJhZ21lbnRzIGluIHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyIGFuZCBJIGZpZ3VyZWQg
SeKAmWQgYXNrIGlmIHRoZXJlIHdhcyBhbnkgaW50ZXJlc3QgaW4gaW5jbHVkaW5nIHRoZW0gdXBz
dHJlYW0/DQoNClRoZXkgYXJlIHRocmVlIGZpbGVzIHdpdGggdGhlIG5lY2Vzc2FyeSBjb25maWdz
IGZvciBlbmFibGluZyB2aXJ0aW8sIHZob3N0IGFuZCB2ZXRoLCBzaW1pbGFyIHRvIHRoZSBjdXJy
ZW50bHkgYXZhaWxhYmxlIHZzd2l0Y2guY2ZnLiAoVGhleSB3b3VsZCBiZSB3cmFwcGVkIGluIHNj
YzpzIHRob3VnaC4pDQoNCkJlc3QgcmVnYXJkcywNCkNocmlzdGlhbiBaaWV0aMOpbg0K

--_000_4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5sestoex09enease_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglt
c28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUzt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJ
e21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlv
bjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojOTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1
bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwt
Y29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5k
b3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCW1zby1mYXJlYXN0LWxhbmd1YWdl
OkVOLVVTO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCglt
YXJnaW46NzAuODVwdCA3MC44NXB0IDcwLjg1cHQgNzAuODVwdDt9DQpkaXYuV29yZFNlY3Rpb24x
DQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4
bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94
bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2
OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFw
ZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IlNWIiBsaW5r
PSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+SGksPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxh
bmc9IkVOLVVTIj5XZSBoYXZlIHNvbWUgY2ZnIGZyYWdtZW50cyBjdXJyZW50bHkgaW5jbHVkZWQg
Zm9yIG91ciBsb2NhbCBidWlsZHMgYW5kIHdlIHdlcmUgZGlzY3Vzc2luZyBpbmNsdXNpb24gb2Yg
dGhlIGZyYWdtZW50cyBpbiB0aGUgbWV0YS12aXJ0dWFsaXphdGlvbiBsYXllciBhbmQgSSBmaWd1
cmVkIEnigJlkIGFzayBpZiB0aGVyZSB3YXMgYW55IGludGVyZXN0IGluIGluY2x1ZGluZyB0aGVt
IHVwc3RyZWFtPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+VGhleSBhcmUgdGhyZWUgZmlsZXMgd2l0aCB0
aGUgbmVjZXNzYXJ5IGNvbmZpZ3MgZm9yIGVuYWJsaW5nIHZpcnRpbywgdmhvc3QgYW5kIHZldGgs
IHNpbWlsYXIgdG8gdGhlIGN1cnJlbnRseSBhdmFpbGFibGUgdnN3aXRjaC5jZmcuIChUaGV5IHdv
dWxkIGJlIHdyYXBwZWQgaW4gc2NjOnMgdGhvdWdoLik8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPkJlc3Qg
cmVnYXJkcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBsYW5nPSJFTi1VUyI+Q2hyaXN0aWFuIFppZXRow6luPG86cD48L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4FFCE9ACF029AC4CB16F6B47D78C928A196B34F5sestoex09enease_--

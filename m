Return-Path: <vishwanath.m@samsung.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0872E00E13; Fri, 16 Feb 2018 08:51:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [211.189.100.11 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mailout1.w2.samsung.com (mailout1.w2.samsung.com
	[211.189.100.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B9A8E00E13;
	Fri, 16 Feb 2018 08:51:42 -0800 (PST)
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
	20180216165142usoutp01fef6884270e0cef22e2b675c33c97052~T3Hbf4HPI1574915749usoutp01d;
	Fri, 16 Feb 2018 16:51:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
	20180216165142usoutp01fef6884270e0cef22e2b675c33c97052~T3Hbf4HPI1574915749usoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1518799902;
	bh=aB2SyakuTwLF7P7rYej4r5/YaJy3Siqv6kWtYjn2FTI=;
	h=From:To:Cc:Subject:Date:In-reply-to:References:From;
	b=XI9a1KpTxRddyRWXcNxJ9dcm4WAC+UnIdVp6WFSZaBl8UN1bozJvR0svg+Z+gaQoH
	cmkYGGXF9IZc6Olz4rk2NllvZlW9pqhSxf4AwsZaOvNx1p2XYFKuJCez9LSP4QIOrb
	MHeZYA089U2goQNCDNaIimWXZkzBWBQ22xmkOX24=
Received: from ussmges1.samsung.com (u109.gpu85.samsung.co.kr
	[203.254.195.109]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20180216165142uscas1p2f95836e36a05c789e63fab55ba0bf793~T3HbQut7A1473514735uscas1p2t;
	Fri, 16 Feb 2018 16:51:42 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
	ussmges1.samsung.com (USCPEMTA) with SMTP id C3.96.32262.E1C078A5;
	Fri, 16 Feb 2018 11:51:42 -0500 (EST)
Received: from ussmgxs1.samsung.com (u122.gpu85.samsung.co.kr
	[203.254.195.122]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180216165141uscas1p1260efe6d1939c69c3cef66d399924496~T3Ha-kCXb3001330013uscas1p1G;
	Fri, 16 Feb 2018 16:51:41 +0000 (GMT)
X-AuditID: cbfec36d-f79696d000007e06-7e-5a870c1e7a7f
Received: from usmmp1.samsung.com ( [203.254.195.77]) by
	ussmgxs1.samsung.com (USCPEXMTA) with SMTP id A7.80.03147.D1C078A5;
	Fri, 16 Feb 2018 11:51:41 -0500 (EST)
Received: from SSI-EX4.ssi.samsung.com ([105.128.2.146]) by
	usmmp1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
	64bit
	(built May 5 2014)) with ESMTP id <0P490017O5I5GL20@usmmp1.samsung.com>;
	Fri, 16 Feb 2018 11:51:41 -0500 (EST)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
	SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.669.32; Fri, 16 Feb 2018 08:51:40 -0800
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
	SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
	15.01.0669.032; Fri, 16 Feb 2018 08:51:40 -0800
From: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-topic: [meta-virtualization] Yocto Recipe for LibRXE.
Thread-index: AdOgO2Fj41FOtMBASWeXiKl/dad7xAHSZhGAAA+ytQA=
Date: Fri, 16 Feb 2018 16:51:40 +0000
Message-id: <46cc9fa1662f425c829905fa4134bf78@samsung.com>
In-reply-to: <b62772be-7b4d-0ada-ac07-12771b7c1209@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Originating-IP: [105.128.2.176]
MIME-version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduzrOV05nvYog5vf2SxuHzjCbLHj/io2
	ix9/J7A6MHus37KVyaP9RB9bAFMUl01Kak5mWWqRvl0CV8aX+YfZC77wVLw//oi5gfEETxcj
	J4eEgInE/o4dzBC2mMSFe+vZuhi5OIQEljFK3Pu1nh3CaWGS+PXkEEsXIwdYx7TVrnBFK7bv
	BOsWEvjLKPH0aj1E4iOjxLz+GcwQzgFGiVOts1hBqtgErCQevr7KCpIQEWhilHj0uAusnVnA
	UeJa1xKwImEBa4n+tX2MILaIgI3EnzmNTBC2lcSqyy/ZQGwWAVWJ74/OgMV5geIHWzezg9ic
	QHOmPZvKAmIzAj30/dQaJoj54hLNrTdZIB4VlFg0ew/c0/92PWSDsBUlnrecZISo15R48WUS
	C4StKDFtUQMjxC5BiR+T70HNkZQ4uOIGlP2bTeJGpwAkiFwkjp/WhggLS7w6vgXoNHYgW0bi
	kRzI5xIC94A+X9DBPoFRfRaS42YhWTwLyeJZSBYvYGRZxShSWlycm55abKhXnJhbXJqXrpec
	n7uJEZg6Tv87nLuDcfbugEOMAhyMSjy8Fs/aooRYE8uKK3MPMUpwMCuJ8D5/DBTiTUmsrEot
	yo8vKs1JLT7EKM3BoiTOqzBzdaSQQHpiSWp2ampBahFMlomDU6qB0c3yQv4OY7Zdl5N+pm07
	pPrN+ZBN0d+vUSXdZi53Z+ZU5m3xrb77MvyGtqDxClPTA2ulj9iuzFSWkay/mPxiRV5fu+rj
	ftfd364c28U4ZX+PZeCLLN5rwXGFbf/bvjy7OHU/s6xUTqTd6eN3xXcyZU7Q5Ty81YKtWzbu
	W8Qsj+dC9hy+T7/7KrEUZyQaajEXFScCAO3bHVgZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t9hX11ZnvYog2NTjCxuHzjCbLHj/io2
	ix9/J7A6MHus37KVyaP9RB9bAFMUl01Kak5mWWqRvl0CV8aX+YfZC77wVLw//oi5gfEETxcj
	B4eEgInEtNWuXYycQKaYxIV769lAbCGBJYwS7ec8uxi5gOy/jBJd7fPYIJyPjBKf91xkh6g6
	wCixv6kCxGYTsJJ4+PoqK0iRiEADo8TrfRuYQRLMAo4S17qWsILYwgLWEv1r+xhBbBEBG4k/
	cxqZIGwriVWXX4KtZhFQlfj+6AxYnBcofrB1MzvE5uOMEn+/PgEr4gQaOu3ZVBYQmxHo7u+n
	1jBBLBOXaG69yQLxj4DEkj3nmSFsUYmXj/+xQtiKEs9bTjKCvM8soC4xZUouRKuixLRFDYwQ
	ewUlfky+BzVGUuLgihssExglZyHZMAuhexaS7llIuhcwsqxiFCktLs5Nryg21CtOzC0uzUvX
	S87P3cQIiceqHYx3vtocYhTgYFTi4bV41hYlxJpYVlyZe4hRgoNZSYT3+WOgEG9KYmVValF+
	fFFpTmrxIUZpDhYlcd6Ne1ZHCgmkJ5akZqemFqQWwWSZODilGhhnX7x/ztHGUntld8/hnxMz
	5U4uCXx3xymlNdI0/q5T1z3mQ0aZDfGhofyOgm+4K3cE3Xisu1Qm24DpVJ9EuXf4Qxvmsi/3
	tnk6u97+zaT17dqqlnurjVnqptgK+Pj/tt67bqH1zsbXcdY7Td8cYdXZbdDAt7O7ZLvG/l9X
	77zLucf3eM+zhjglluKMREMt5qLiRAChTacGwwIAAA==
X-CMS-MailID: 20180216165141uscas1p1260efe6d1939c69c3cef66d399924496
X-Msg-Generator: CA
CMS-TYPE: 301P
X-CMS-RootMailID: 20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34
X-RootMTR: 20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34
References: <CGME20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34@uscas1p1.samsung.com>
	<ce37211d0564452faec96b262fcfb720@samsung.com>
	<b62772be-7b4d-0ada-ac07-12771b7c1209@windriver.com>
Cc: "meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Re: Yocto Recipe for LibRXE.
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
X-List-Received-Date: Fri, 16 Feb 2018 16:51:43 -0000
Content-language: en-US
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: base64

UmFuZHksDQoNClllcywgdGhhdCdzIHRoZSBsaWJyeGUtZGV2IEkgYW0gaW50ZXJlc3RlZCBpbi4g
SSBhbSBuZXcgdG8gZGV2dG9vbHMgb24gRlBHQSwgY2FuIHlvdSBwb2ludCBtZSBvbiBob3cgdG8g
Z2VuZXJhdGUgYSBuZXcgcmVjaXBlPw0KDQotVmlzaA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogUmFuZHkgTWFjTGVvZCBbbWFpbHRvOnJhbmR5Lm1hY2xlb2RAd2luZHJpdmVy
LmNvbV0gDQpTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDE2LCAyMDE4IDg6MTkgQU0NClRvOiBWaXNo
IChWaXNod2FuYXRoKSBNYXJhbSA8dmlzaHdhbmF0aC5tQHNhbXN1bmcuY29tPjsgbWV0YS12aXJ0
dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQpDYzogbWV0YS14aWxpbnhAeW9jdG9wcm9qZWN0
Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBZb2N0byBSZWNpcGUgZm9y
IExpYlJYRS4NCg0KT24gMjAxOC0wMi0wNyAxMjo0NSBQTSwgVmlzaCAoVmlzaHdhbmF0aCkgTWFy
YW0gd3JvdGU6DQo+IEhpLA0KPiANCj4gSSBhbSBsb29raW5nIGZvciBhIHlvY3RvIHJlY2lwZSBv
ZiBsaWJyeGU/IFJpZ2h0IG5vdyBJIHdhcyBhYmxlIHRvIGdldCBsaWJyZG1hY20gYW5kIGxpYmli
dmVyYnMsIGJ1dCBsaWJyeGUgeW9jdG8gaXMgbm90IHRoZXJlLiBDYW4gc29tZW9uZSBoZWxwIG1l
IGluIGdldHRpbmcgdGhpcz8NCg0KSXQgZG9lc24ndCBzZWVtIHRvIGV4aXN0IHlldDoNCiAgICBo
dHRwOi8vbGF5ZXJzLm9wZW5lbWJlZGRlZC5vcmcvbGF5ZXJpbmRleC9icmFuY2gvbWFzdGVyL3Jl
Y2lwZXMvP3E9cnhlDQoNCklzIHRoaXMgd2hhdCB5b3UncmUgaW50ZXJlc3RlZCBpbj8NCiAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9Tb2Z0Um9DRS9saWJyeGUtZGV2DQoNCkNhbiB5b3Ugd3JpdGUgYSBy
ZWNpcGUgYW5kIHN1Ym1pdCBpdCB0byBtZXRhLXZpcnQgb3IgbWV0YS1vcGVuZW1iZWRlZCBzaW5j
ZSBpdCBzZWVtcyB0aGF0IG5vIG9uZSBlbHNlIGhhcyBuZWVkZWQgdG8gcGFja2FnZSBpdCBmb3Ig
T0UuDQoNCi4uL1JhbmR5DQoNCj4gDQo+IEhpZ2hseSBhcHByZWNpYXRlIGlmIEkgY2FuIGdldCBz
b21lIGluZm8gb24gdGhlIHNhbWUuDQo+IA0KPiBUaGFua3MsDQo+IC1WaXNoDQo+IA0KDQoNCg0K
LS0NCiMgUmFuZHkgTWFjTGVvZC4gIFdSIExpbnV4DQojIFdpbmQgUml2ZXIgYW4gSW50ZWwgQ29t
cGFueQ0KDQo=


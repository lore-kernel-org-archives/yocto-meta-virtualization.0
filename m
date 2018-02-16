Return-Path: <vishwanath.m@samsung.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02E51E00DFA; Fri, 16 Feb 2018 08:49:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [211.189.100.11 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mailout1.w2.samsung.com (mailout1.w2.samsung.com
	[211.189.100.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A583E00DD0;
	Fri, 16 Feb 2018 08:49:56 -0800 (PST)
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
	by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
	20180216164954usoutp014449a7d97b7b08aea383f196e599d287~T3F3HgtrT1513315133usoutp01Z;
	Fri, 16 Feb 2018 16:49:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
	20180216164954usoutp014449a7d97b7b08aea383f196e599d287~T3F3HgtrT1513315133usoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1518799794;
	bh=/EPwqU9WQbY5AEwEOKzcQAlBE9WzGi26DNB3LLBggQE=;
	h=From:To:Cc:Subject:Date:In-reply-to:References:From;
	b=X3oEuGNEtnZDLPI3Ctb1yUAfJu6ZLmCt4PqHqa6J8zMWieJT57MTDv49quyemrDuX
	daDIjT7goRNySyL1/2odB7xC2wYk5pobaUcIaRUUBTkeeZcJ/irSphQAJLGCSlZjKk
	tUURbe2b0UCcoY9mx6HlLv97+9FmGMXW/4NbXbGY=
Received: from ussmges5.samsung.com (u115.gpu85.samsung.co.kr
	[203.254.195.115]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20180216164954uscas1p24dcec13ef34039e7a003530114d039ec~T3F2v3WMn2325423254uscas1p2R;
	Fri, 16 Feb 2018 16:49:54 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
	ussmges5.samsung.com (USCPEMTA) with SMTP id 43.00.00408.2BB078A5;
	Fri, 16 Feb 2018 11:49:54 -0500 (EST)
Received: from ussmgxs4.samsung.com (u125.gpu85.samsung.co.kr
	[203.254.195.125]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20180216164953uscas1p29a8f084754ee774070b5e0ffbab69072~T3F2bVFeq2325423254uscas1p2Q;
	Fri, 16 Feb 2018 16:49:53 +0000 (GMT)
X-AuditID: cbfec373-f79ba6d000000198-28-5a870bb202fb
Received: from usmmp1.samsung.com ( [203.254.195.77]) by
	ussmgxs4.samsung.com (USCPEXMTA) with SMTP id 7A.50.02085.1BB078A5;
	Fri, 16 Feb 2018 11:49:53 -0500 (EST)
Received: from SSI-EX4.ssi.samsung.com ([105.128.2.146]) by
	usmmp1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
	64bit
	(built May 5 2014)) with ESMTP id <0P490019Z5F52G20@usmmp1.samsung.com>;
	Fri, 16 Feb 2018 11:49:53 -0500 (EST)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
	SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.669.32; Fri, 16 Feb 2018 08:49:52 -0800
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
	SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
	15.01.0669.032; Fri, 16 Feb 2018 08:49:52 -0800
From: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-topic: [yocto] Yocto Recipe for LibRXE.
Thread-index: AdOgOyWlgtjKAqLnTiOPwQEKnL+v7AGU1BkAAC3hDQA=
Date: Fri, 16 Feb 2018 16:49:52 +0000
Message-id: <f2355f750bd24ceaa0fa24eaf750e16e@samsung.com>
In-reply-to: <CAJTo0La3_s=XkzVB0PRF3FB4VwY7LQ3kTQT1oQqVF+-gWMcOkw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Originating-IP: [105.128.2.176]
MIME-version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTURjm7O7juloc52hvFpGDLEVngeYSMTEhyX4E/RCNqJm3aW0quyoq
	JCuXipGmCeEyFQ1JXWxtYtMUdH6lOZZhYgXDqaBTiixk/nG17Wrs3/N13vc8h0MSQj0nlMzL
	L6LU+XKlhMtn909u26NNB6qzzph3+bLvI+OErNVyQdbo0nOTibTOIRcrrfpDHfcqK4ufmEMp
	80oodUzSLX6ueWkIFTpTS+ttbo4GuVJqEUkCjoXRnRu1KMgLD8Mnh4Fbi/ikEHchsLf0cHyG
	EGtZ4DBG7+fnbfh/xlxXzWbILgKT7gmHIVsIHg6s7pERLxlZZftGcXECODe/+MeKcCTYNlcI
	X4jANQjmGnd4PiMER8Pu59+ICUmhb2qZYHAC2Ksd/sNsfBJmHrzn+rDAq68/c/gXBOFr0Pzc
	49eRt5B7Rs/yYQKLofLRVzZTNBg6XgwR+6U9g04ug8NgTTuNmHw2DPQs8Jj5wbCzNx/wERh9
	vejvDLieB1vdbg5jpMJk3xiPwSGwMdW3h49B7x+mJWAHguX2Gh5DPAiMPxc5T1G4LuCGuoDt
	uoDtOu/rEzgCDIMxTCQMmh47eQw+DY9aXvIC9XbE60GiYppWKSg6TkrLVXRxvkJ6u0BlQt4/
	9NEzRlvQujHBijCJJAcFSytVWUKOvIQuU1kRkIREJFjzSYIceVk5pS64qS5WUrQVHSXZErHg
	RHNvphAr5EXUPYoqpNT7LosMCtWgxGHVxeHcX7Nl6SZZVBchjTNnhvabxBnTeZ4Fy49Xyb1J
	WmPD5Pn4+1KWtWJJHxul+5ahsKdXhs+1hW1ONJSLm1M630asaAZc2W11tvg3FXdnty5tWy9P
	lHLTrmwcF2mq5v+iaYf7kEFkGLtuedfadCql9s657gyxUtuW3DEuYdO58rORhJqW/wOgM7TB
	PwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t9hX92N3O1RBs/mG1vcPnCE2WLeDnuL
	SS/XsDkweyze85LJo/1EH1sAUxSXTUpqTmZZapG+XQJXxuYHexgLHrpU9J/9ztrA+NKpi5GD
	Q0LAROLKWYEuRk4gU0ziwr31bF2MXBxCAksYJaa3zmADSQgJ/GWU6GuogEh8ZJR4+WA6C4Rz
	gFHi/ZHbLCBVbAJWEg9fX2UFsUUEtCTOvn7MDFLELNDBKHG/+yhYQlhAV+LvpU+MEEV6EluO
	P2KGsK0kzrffA6thEVCVONW4G2w1L1D8xeR7UNuuM0qc37UQrIhTIFhi5rzjTCA2I9Dh30+t
	AbOZBcQlmltvskA8JCCxZM95ZghbVOLl43+sELaixPOWk4wQ9QkSS45uY4ZYJijxA2wZSI2k
	xMEVN1gmMErMQjJ2FpKWWUhaZgGDkllAU2L9Ln2IEkWJKd0P2SFsDYnWOXPZkcUXMLKvYhQp
	LS7OTa8oNtErTswtLs1L10vOz93ECIng2h2M97/aHGIU4GBU4uF98LgtSog1say4MvcQowQH
	s5II73OQEG9KYmVValF+fFFpTmrxIUZpDhYlcd6Ne1ZHCgmkJ5akZqemFqQWwWSZODilGhj9
	Qju63XgPCypqz1u8kTn9K3fsgg07mYV54/R8VS8c+v6uZMNhuzV/Xi2Si9yY6CR6lI2/5sbr
	zCdWXZO5wtlecG9s5U3T3Xm2m0kijdnkXcaTjKIbG09rHbv2LfPcwX0mHhyrlcJuz+JI9ONa
	8clDQtFK5/RzplPGb5o+MPw2+dYUf0U30UuJpTgj0VCLuag4EQCulaiJ3AIAAA==
X-CMS-MailID: 20180216164953uscas1p29a8f084754ee774070b5e0ffbab69072
X-Msg-Generator: CA
CMS-TYPE: 301P
X-CMS-RootMailID: 20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a
X-RootMTR: 20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a
References: <CGME20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a@uscas1p2.samsung.com>
	<7303d2119528406d838e7922fbadfa95@samsung.com>
	<CAJTo0La3_s=XkzVB0PRF3FB4VwY7LQ3kTQT1oQqVF+-gWMcOkw@mail.gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] Yocto Recipe for LibRXE.
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
X-List-Received-Date: Fri, 16 Feb 2018 16:49:58 -0000
Content-language: en-US
Content-type: multipart/alternative;
	boundary="_000_f2355f750bd24ceaa0fa24eaf750e16esamsungcom_"

--_000_f2355f750bd24ceaa0fa24eaf750e16esamsungcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9zcywNCg0KQ2FuIHlvdSBwb2ludCBtZSB0byB3aGF0IGRldnRvb2wgeW91IGFyZSB0YWxraW5n
IGFib3V0IHRvIGdlbmVyYXRlIHRoZSByZWNpcGU/IEkgYW0gaW4gcHJvY2VzcyBvZiBsZWFybmlu
ZyB0b29scyBvbiBGUEdBLCBub3Qgc3VyZSBvbiBob3cgdG8gZ2VuZXJhdGUgYXMgd2VsbD8NCg0K
LVZpc2gNCg0KRnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29t
XQ0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDE1LCAyMDE4IDI6NTUgQU0NClRvOiBWaXNoIChW
aXNod2FuYXRoKSBNYXJhbSA8dmlzaHdhbmF0aC5tQHNhbXN1bmcuY29tPg0KQ2M6IG1ldGEtdmly
dHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZzsgeW9jdG9AeW9jdG9wcm9qZWN0Lm9yZw0KU3Vi
amVjdDogUmU6IFt5b2N0b10gWW9jdG8gUmVjaXBlIGZvciBMaWJSWEUuDQoNCkl0J3Mgbm90IGlu
IHRoZSBsYXllciBpbmRleCAoaHR0cDovL2xheWVycy5vcGVuZW1iZWRkZWQub3JnL2xheWVyaW5k
ZXgvYnJhbmNoL21hc3Rlci9yZWNpcGVzLz9xPWxpYnJ4ZSksIHNvIEkgc3VnZ2VzdCB5b3Ugc3Rh
cnQgd2l0aCBkZXZ0b29sIHRvIGNyZWF0ZSBhIG5ldyByZWNpcGUuDQoNClJvc3MNCg0KT24gNyBG
ZWJydWFyeSAyMDE4IGF0IDE3OjQzLCBWaXNoIChWaXNod2FuYXRoKSBNYXJhbSA8dmlzaHdhbmF0
aC5tQHNhbXN1bmcuY29tPG1haWx0bzp2aXNod2FuYXRoLm1Ac2Ftc3VuZy5jb20+PiB3cm90ZToN
CkhpLA0KDQpJIGFtIGxvb2tpbmcgZm9yIGEgeW9jdG8gcmVjaXBlIG9mIGxpYnJ4ZT8gUmlnaHQg
bm93IEkgd2FzIGFibGUgdG8gZ2V0IGxpYnJkbWFjbSBhbmQgbGliaWJ2ZXJicywgYnV0IGxpYnJ4
ZSB5b2N0byBpcyBub3QgdGhlcmUuIENhbiBzb21lb25lIGhlbHAgbWUgaW4gZ2V0dGluZyB0aGlz
Pw0KDQpIaWdobHkgYXBwcmVjaWF0ZSBpZiBJIGNhbiBnZXQgc29tZSBpbmZvIG9uIHRoZSBzYW1l
Lg0KDQpUaGFua3MsDQotVmlzaA0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQp5b2N0byBtYWlsaW5nIGxpc3QNCnlvY3RvQHlvY3RvcHJvamVjdC5v
cmc8bWFpbHRvOnlvY3RvQHlvY3RvcHJvamVjdC5vcmc+DQpodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvbGlzdGluZm8veW9jdG8NCg0K

--_000_f2355f750bd24ceaa0fa24eaf750e16esamsungcom_
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
YWNlDQoJe2ZvbnQtZmFtaWx5OiJNYWxndW4gR290aGljIjsNCglwYW5vc2UtMToyIDExIDUgMyAy
IDAgMCAyIDAgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3Nl
LTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiXEBN
YWxndW4gR290aGljIjsNCglwYW5vc2UtMToyIDExIDUgMyAyIDAgMCAyIDAgNDt9DQovKiBTdHls
ZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1h
bA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIu
MHB0Ow0KCWZvbnQtZmFtaWx5OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCmE6bGluaywgc3Bh
bi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJ
dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5r
Rm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0
LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uaG9lbnpiDQoJe21zby1zdHlsZS1uYW1lOmhv
ZW56Yjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBs
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30N
Ci5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFt
aWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjgu
NWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRT
ZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1z
byA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIg
Lz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVs
YXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8
L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJF
Ti1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlv
bjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Qi
PlJvc3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90Oyxz
YW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFt
aWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5DYW4geW91
IHBvaW50IG1lIHRvIHdoYXQgZGV2dG9vbCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdG8gZ2VuZXJh
dGUgdGhlIHJlY2lwZT8gSSBhbSBpbiBwcm9jZXNzIG9mIGxlYXJuaW5nIHRvb2xzIG9uIEZQR0Es
IG5vdCBzdXJlIG9uIGhvdyB0byBnZW5lcmF0ZSBhcyB3ZWxsPzxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2Zv
bnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNh
bnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+LVZpc2g8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWls
eTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gQnVydG9uLCBSb3NzIFttYWls
dG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPGJyPg0KPGI+U2VudDo8L2I+IFRodXJzZGF5LCBG
ZWJydWFyeSAxNSwgMjAxOCAyOjU1IEFNPGJyPg0KPGI+VG86PC9iPiBWaXNoIChWaXNod2FuYXRo
KSBNYXJhbSAmbHQ7dmlzaHdhbmF0aC5tQHNhbXN1bmcuY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4g
bWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnOyB5b2N0b0B5b2N0b3Byb2plY3Qu
b3JnPGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbeW9jdG9dIFlvY3RvIFJlY2lwZSBmb3IgTGli
UlhFLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkl0J3Mgbm90IGluIHRo
ZSBsYXllciBpbmRleCAoPGEgaHJlZj0iaHR0cDovL2xheWVycy5vcGVuZW1iZWRkZWQub3JnL2xh
eWVyaW5kZXgvYnJhbmNoL21hc3Rlci9yZWNpcGVzLz9xPWxpYnJ4ZSI+aHR0cDovL2xheWVycy5v
cGVuZW1iZWRkZWQub3JnL2xheWVyaW5kZXgvYnJhbmNoL21hc3Rlci9yZWNpcGVzLz9xPWxpYnJ4
ZTwvYT4pLCBzbyBJIHN1Z2dlc3QgeW91IHN0YXJ0IHdpdGggZGV2dG9vbCB0byBjcmVhdGUNCiBh
IG5ldyByZWNpcGUuPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5Sb3NzPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPk9uIDcgRmVicnVhcnkgMjAxOCBhdCAxNzo0MywgVmlzaCAoVmlzaHdhbmF0aCkgTWFyYW0g
Jmx0OzxhIGhyZWY9Im1haWx0bzp2aXNod2FuYXRoLm1Ac2Ftc3VuZy5jb20iIHRhcmdldD0iX2Js
YW5rIj52aXNod2FuYXRoLm1Ac2Ftc3VuZy5jb208L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwv
cD4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0ND
Q0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFy
Z2luLXJpZ2h0OjBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSw8YnI+DQo8YnI+DQpJIGFt
IGxvb2tpbmcgZm9yIGEgeW9jdG8gcmVjaXBlIG9mIGxpYnJ4ZT8gUmlnaHQgbm93IEkgd2FzIGFi
bGUgdG8gZ2V0IGxpYnJkbWFjbSBhbmQgbGliaWJ2ZXJicywgYnV0IGxpYnJ4ZSB5b2N0byBpcyBu
b3QgdGhlcmUuIENhbiBzb21lb25lIGhlbHAgbWUgaW4gZ2V0dGluZyB0aGlzPzxicj4NCjxicj4N
CkhpZ2hseSBhcHByZWNpYXRlIGlmIEkgY2FuIGdldCBzb21lIGluZm8gb24gdGhlIHNhbWUuPGJy
Pg0KPGJyPg0KVGhhbmtzLDxicj4NCi1WaXNoPGJyPg0KPHNwYW4gY2xhc3M9ImhvZW56YiI+PHNw
YW4gc3R5bGU9ImNvbG9yOiM4ODg4ODgiPi0tPC9zcGFuPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29s
b3I6Izg4ODg4OCI+PGJyPg0KPHNwYW4gY2xhc3M9ImhvZW56YiI+X19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX188L3NwYW4+PGJyPg0KPHNwYW4gY2xhc3M9Imhv
ZW56YiI+eW9jdG8gbWFpbGluZyBsaXN0PC9zcGFuPjxicj4NCjxzcGFuIGNsYXNzPSJob2VuemIi
PjxhIGhyZWY9Im1haWx0bzp5b2N0b0B5b2N0b3Byb2plY3Qub3JnIj55b2N0b0B5b2N0b3Byb2pl
Y3Qub3JnPC9hPjwvc3Bhbj48YnI+DQo8c3BhbiBjbGFzcz0iaG9lbnpiIj48YSBocmVmPSJodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8veW9jdG8iIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbGlzdGluZm8veW9jdG88L2E+PC9zcGFu
Pjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_f2355f750bd24ceaa0fa24eaf750e16esamsungcom_--

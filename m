Return-Path: <Sathees.Balya@arm.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0E2FE00D2A; Mon, 15 Apr 2019 18:05:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.1.70 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 24077 seconds by postgrey-1.32 at yocto-www;
	Mon, 15 Apr 2019 18:05:44 PDT
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10070.outbound.protection.outlook.com [40.107.1.70])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1983CE00D1E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2019 18:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KD5vz9DNQ24GoCxnupsT0tRk5lOKzZLuAPHZ3W9GC9Y=;
	b=QYzkjz4kPcwfiJdIW3kyIu7pPjZIp1Qly+/nkXHgViSYWaQongGqGwZYklLlLtsk0GwBCnZD1VU7TD0z8bwyM3cxWqGhTWr3KbwleguJTBiXHOelG9Eam0gEOLj1IASIx1OhUzGNP8vj9uHlstpVgWKO0fFHXo0edNr+tsx/1Fg=
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com (20.177.112.218) by
	AM6PR08MB4738.eurprd08.prod.outlook.com (10.255.97.77) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.14; Mon, 15 Apr 2019 15:50:51 +0000
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95]) by
	AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95%3]) with mapi id 15.20.1792.018;
	Mon, 15 Apr 2019 15:50:51 +0000
From: Sathees Balya <Sathees.Balya@arm.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Dev86-native dependency
Thread-Index: AQHU86MAWT+LRFxBPEiFbpO5NpJoDQ==
Date: Mon, 15 Apr 2019 15:50:51 +0000
Message-ID: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Sathees.Balya@arm.com; 
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 886ad95d-b5be-4621-c2f3-08d6c1ba22e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:AM6PR08MB4738; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB4738:|AM6PR08MB4738:
x-microsoft-antispam-prvs: <AM6PR08MB473811823ECB3F34FBEAD28AEF2B0@AM6PR08MB4738.eurprd08.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(396003)(366004)(136003)(346002)(199004)(189003)(40434004)(2351001)(53936002)(106356001)(6506007)(3846002)(316002)(6116002)(6512007)(105586002)(97736004)(82746002)(4744005)(25786009)(2906002)(6306002)(54896002)(36756003)(476003)(486006)(5640700003)(186003)(2616005)(68736007)(26005)(33656002)(2501003)(102836004)(7736002)(256004)(14444005)(86362001)(83716004)(71190400001)(4326008)(5024004)(66066001)(72206003)(71200400001)(8936002)(8676002)(81156014)(478600001)(81166006)(5660300002)(9326002)(6916009)(6436002)(14454004)(6486002)(99286004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4738;
	H:AM6PR08MB3381.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kX07XEgzptTsz9N5B2kbYYxrMawuqNP7c+AmMSoUMbs03mdgriVW6hIOSvb1Xh2Q6gGO8kziA4JDPP63ns26jwBPaOz46AS9Sr6g5xJs4o3VboSjhNrzBPqVHxVp3crBg0kCw/ZXL8FgZZFxyVlPVB4JRNw15B/10XjM9QL8U3XyjK1EoicHnLVnUbFgMC2wtBcjlGVxXrl5qp03rNfo3Oy/kDgukIRy1T/epN06FeFlGfvQ7COAgosAHeAmzt2NhgCuqQbbexxi8VlzsdgNw9XqfWEWpUbpUJrEKheg8RX9no/m5B2oyipwa0YGxKrRxn3Vy1KnbQt/fPgRcXYDQZjwqObyaX2rYc0zyR3l8IZnNXGHN84O2o2k+DGhZcR+knH5iRihI3YnzQF6F7hMnG3wyvvLuXE4Q0aSXdXPUi4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 886ad95d-b5be-4621-c2f3-08d6c1ba22e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 15:50:51.1176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4738
X-OriginatorOrg: arm.com
Subject: Dev86-native dependency
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
X-List-Received-Date: Tue, 16 Apr 2019 01:05:46 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5E914B57EE7248308E458BC19CB7307Earmcom_"

--_000_5E914B57EE7248308E458BC19CB7307Earmcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoZSB4ZW4gcmVjaXBlIGhhcyBhIGhhcmQgZGVwZW5kZW5jeSBvbiBkZXY4Ni1uYXRp
dmUgcGFja2FnZSAobWV0YS12aXJ0dWFsaXphdGlvbi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4u
aW5jKS4gSXQgZG9lcyBub3QgYWxsb3cgdXMgdG8gYnVpbGQgZm9yIGFhcmNoNjQgbmF0aXZlbHkg
Zm9yIEFybS4gQXQgdGhlIG1vbWVudCwgd2UgaGF2ZSBhIHdvcmthcm91bmQgaW4gdGhlIGJiYXBw
ZW5kIGZpbGUgZm9yIHhlbiB0byByZW1vdmUgdGhlIGRlcGVuZGVuY3kuDQoNCkRFUEVORFNfcmVt
b3ZlID0gImRldjg2LW5hdGl2ZSINCg0KQ2FuIHRoZSByZWNpcGUgYmUgbWFkZSBnZW5lcmljIHNv
IHRoYXQgYm90aCB4ODYgYW5kIEFybSBjYW4gYmUgYnVpbHQgd2l0aG91dCB0aGUgbmVlZCBmb3Ig
dGhlIGFib3ZlIHdvcmthcm91bmQ/IFRoYW5rcy4NCg0KDQpSZWdhcmRzLA0KU2F0aGVlcw0KSU1Q
T1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
aW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVy
IHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5m
b3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

--_000_5E914B57EE7248308E458BC19CB7307Earmcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <EAA6923ADB56C548AEDD569578860622@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNl
Y3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIuMHB0IDcy
LjBwdCA3Mi4wcHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQot
LT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tR0IiIGxpbms9IiMwNTYzQzEiIHZs
aW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGksPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGUgeGVuIHJlY2lwZSBoYXMgYSBoYXJkIGRl
cGVuZGVuY3kgb24gZGV2ODYtbmF0aXZlIHBhY2thZ2UgKG1ldGEtdmlydHVhbGl6YXRpb24vcmVj
aXBlcy1leHRlbmRlZC94ZW4veGVuLmluYykuIEl0IGRvZXMgbm90IGFsbG93IHVzIHRvIGJ1aWxk
IGZvciBhYXJjaDY0IG5hdGl2ZWx5IGZvciBBcm0uIEF0IHRoZSBtb21lbnQsIHdlIGhhdmUgYSB3
b3JrYXJvdW5kDQogaW4gdGhlIGJiYXBwZW5kIGZpbGUgZm9yIHhlbiB0byByZW1vdmUgdGhlIGRl
cGVuZGVuY3kuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5ERVBF
TkRTX3JlbW92ZSA9ICZxdW90O2Rldjg2LW5hdGl2ZSZxdW90OzxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q2FuIHRoZSByZWNpcGUgYmUgbWFkZSBnZW5lcmljIHNv
IHRoYXQgYm90aCB4ODYgYW5kIEFybSBjYW4gYmUgYnVpbHQgd2l0aG91dCB0aGUgbmVlZCBmb3Ig
dGhlIGFib3ZlIHdvcmthcm91bmQ/IFRoYW5rcy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzLDxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5TYXRoZWVzPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQpJTVBPUlRB
TlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1l
ZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVy
c29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLA0KIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9y
bWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_5E914B57EE7248308E458BC19CB7307Earmcom_--

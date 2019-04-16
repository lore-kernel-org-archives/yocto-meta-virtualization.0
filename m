Return-Path: <Sathees.Balya@arm.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 188ABE00D47; Wed, 17 Apr 2019 15:08:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.13.48 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 32477 seconds by postgrey-1.32 at yocto-www;
	Wed, 17 Apr 2019 15:08:25 PDT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130048.outbound.protection.outlook.com [40.107.13.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8761E00D44
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=z9utvt51FiuO91RuwAShs1LuCK+UwEe8RYLQwHvvmwc=;
	b=ZQsVc/dFvnmCh8HR66zfuiBXdO+mOtpO4CySuRswGOfYYzKQ1FVnsB5nNqubR7zMx1LjLtWAudWt5WVkV5A2+qF5KjbvJ+/F+eoMtHjZ5HzmfuAfE4L6Dk+u7t1ZPq1uk7+CW0pCkJlhQMfBpsYWeu3IwGT8aJI8c7J4i1t/DRo=
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com (20.177.112.218) by
	AM6PR08MB4737.eurprd08.prod.outlook.com (10.255.97.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.17; Tue, 16 Apr 2019 10:28:54 +0000
Received: from AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95]) by
	AM6PR08MB3381.eurprd08.prod.outlook.com
	([fe80::e9c5:9163:c3c9:ed95%3]) with mapi id 15.20.1792.018;
	Tue, 16 Apr 2019 10:28:54 +0000
From: Sathees Balya <Sathees.Balya@arm.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
Thread-Topic: [meta-virtualization] Dev86-native dependency
Thread-Index: AQHU86MAWT+LRFxBPEiFbpO5NpJoDaY+BSyAgACisoA=
Date: Tue, 16 Apr 2019 10:28:54 +0000
Message-ID: <08776DD3-ECE4-414F-8334-14C36ADB4CC2@arm.com>
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
In-Reply-To: <CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Sathees.Balya@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 818db630-ffd4-4059-189d-08d6c25653bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB4737; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB4737:|AM6PR08MB4737:|AM6PR08MB4737:|AM6PR08MB4737:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR08MB4737257AF945C75AFCF4C277EF240@AM6PR08MB4737.eurprd08.prod.outlook.com>
x-forefront-prvs: 000947967F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(366004)(346002)(136003)(40434004)(199004)(189003)(256004)(14444005)(476003)(486006)(5024004)(229853002)(7736002)(6916009)(11346002)(446003)(6486002)(6436002)(2616005)(478600001)(6512007)(72206003)(66066001)(6306002)(4326008)(97736004)(14454004)(5660300002)(2906002)(305945005)(966005)(3846002)(33656002)(8936002)(68736007)(81166006)(81156014)(316002)(105586002)(36756003)(6116002)(99286004)(71190400001)(71200400001)(83716004)(25786009)(76176011)(6506007)(186003)(53936002)(86362001)(6246003)(82746002)(53546011)(102836004)(26005)(8676002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4737;
	H:AM6PR08MB3381.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q55URUBYdy+Us7rWqCZ6pmKWmQ7r8ZJoetgJLIUF1brUdf/MZoR8EyTd0zP+kwL5pT0ChCaMyWusTELnTpT+2N1ijAzpCoeIQmiUh0z9pHMaxNb0/YWJyMuIjbyM1MQOo28zPD1F+RkrnA2BHq9bOWWrknFYeMI5cCIyoAv3giyF66zA84/klW6e42j5EBDGmGIgmpgIcZCRMqnyTyaOqu9jcLwGGPBIObU2QWZyOcwbmOOu8Ujc2LOblZdxeDlWoY/kQ/YUHeskEYaWvgeOdkWV1Lh3CCXLBXMJxrrolveyLpP53gaYzwW6xpG9QMPhNGWAwNNWmOQdEHS7O1TkgeLc3si+kEV/WKFNaW1YtMD4aG4WJO6AYkcZAvyvpS3FUI+dPi7a5pxFwkckVa6D9GUw8UjkkNKhaLK1l4Yr4sk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 818db630-ffd4-4059-189d-08d6c25653bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2019 10:28:54.6049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4737
X-OriginatorOrg: arm.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dev86-native dependency
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
X-List-Received-Date: Wed, 17 Apr 2019 22:08:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5C73DA0809F22468C8D0D6660D4122F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNClllcy4gWW91ciB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QuIEkgd291bGQgbGlrZSB0
byBkcm9wIHRoZSAiZGV2ODYtbmF0aXZlIiBmcm9tIERFUEVORFMgYW5kIGFkZCBpdCBvbmx5IGZv
ciB4ODYgYXJjaGl0ZWN0dXJlLiBIb3dldmVyIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhlIG92
ZXJyaWRlcyBtZWNoYW5pc20uDQoNCg0KUmVnYXJkcywNClNhdGhlZXMNCg0K77u/T24gMTYvMDQv
MjAxOSwgMDI6NDYsICJNLiBBc3NlbHN0aW5lIiA8YXNzZWxzbUBtY21hc3Rlci5jYT4gd3JvdGU6
DQoNCiAgICBPbiBNb24sIEFwciAxNSwgMjAxOSBhdCA5OjA1IFBNIFNhdGhlZXMgQmFseWEgPFNh
dGhlZXMuQmFseWFAYXJtLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gSGksDQogICAgPg0KICAg
ID4NCiAgICA+DQogICAgPiBUaGUgeGVuIHJlY2lwZSBoYXMgYSBoYXJkIGRlcGVuZGVuY3kgb24g
ZGV2ODYtbmF0aXZlIHBhY2thZ2UgKG1ldGEtdmlydHVhbGl6YXRpb24vcmVjaXBlcy1leHRlbmRl
ZC94ZW4veGVuLmluYykuIEl0IGRvZXMgbm90IGFsbG93IHVzIHRvIGJ1aWxkIGZvciBhYXJjaDY0
IG5hdGl2ZWx5IGZvciBBcm0uIEF0IHRoZSBtb21lbnQsIHdlIGhhdmUgYSB3b3JrYXJvdW5kIGlu
IHRoZSBiYmFwcGVuZCBmaWxlIGZvciB4ZW4gdG8gcmVtb3ZlIHRoZSBkZXBlbmRlbmN5Lg0KICAg
ID4NCiAgICA+DQogICAgPg0KICAgID4gREVQRU5EU19yZW1vdmUgPSAiZGV2ODYtbmF0aXZlIg0K
ICAgID4NCiAgICA+DQogICAgPg0KICAgID4gQ2FuIHRoZSByZWNpcGUgYmUgbWFkZSBnZW5lcmlj
IHNvIHRoYXQgYm90aCB4ODYgYW5kIEFybSBjYW4gYmUgYnVpbHQgd2l0aG91dCB0aGUgbmVlZCBm
b3IgdGhlIGFib3ZlIHdvcmthcm91bmQ/IFRoYW5rcy4NCiAgICA+DQoNCiAgICBJIGFtIG5vdCBz
dXJlIEkgYW0gZm9sbG93aW5nIHlvdSBjb3JyZWN0bHkuIEJ1dCBJIGJlbGlldmUgd2hhdCB5b3Ug
YXJlDQogICAgbG9va2luZyBmb3IgaXMgdG8gZHJvcCAiZGV2ODYtbmF0aXZlIiBmcm9tIERFUEVO
RFMsIHdoZXJlIGl0IGlzDQogICAgY3VycmVudGx5IGxpc3RlZCwgYW5kIGluc3RlYWQgbGlzdCBp
dCBpbiBzb21ldGhpbmcgbGlrZQ0KDQogICAgREVQRU5EU194ODYgPSAiZGV2ODYtbmF0aXZlIg0K
DQogICAgaW4gdGhlIHhlbi5pbmMgZmlsZS4gaWUuIG1ha2UgdXNlIG9mIHRoZSBvdmVycmlkZXMg
bWVjaGFuaXNtIHRvIG9ubHkNCiAgICByZXF1aXJlIGl0IGZvciB4ODYgYXJjaC4gQW0gSSBjbG9z
ZT8NCg0KICAgIE1hcmtBDQoNCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBSZWdh
cmRzLA0KICAgID4NCiAgICA+IFNhdGhlZXMNCiAgICA+DQogICAgPiBJTVBPUlRBTlQgTk9USUNF
OiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25m
aWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBp
bnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBh
bmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2Ug
aXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBh
bnkgbWVkaXVtLiBUaGFuayB5b3UuDQogICAgPiAtLQ0KICAgID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAgICA+IG1ldGEtdmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0DQogICAgPiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcN
CiAgICA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRhLXZpcnR1
YWxpemF0aW9uDQoNCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1h
aWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBw
cml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29u
dGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3Rv
cmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K


Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB3FCE00C2E; Mon, 31 Jul 2017 08:10:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.2.96 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 7287 seconds by postgrey-1.32 at yocto-www;
	Mon, 31 Jul 2017 08:10:30 PDT
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0096.outbound.protection.outlook.com [104.47.2.96])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFED5E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Enea.onmicrosoft.com; 
	s=selector1-enea-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+PGSkFmUJ5IlZIVk26Oq+zcz1CCtYsKfhlIwfrG2F5U=;
	b=Ldu8QqNDhNfuFgc6Fzu8UqRAReRQHL2+VTl0BtDSVfN5NAwtmdJ/93lHe/c5PXVlTRr3+B+xMxY7nrnkHuDB8ZEdoGwf8QxfiCWpsYdFDBZBOAJrI8r5JavLFHMPooGRaR/PZ1NbUZMEiY01C200JyeoN6uFcA6oQCJsFff8zq4=
Received: from VI1PR07MB0895.eurprd07.prod.outlook.com (10.161.108.25) by
	VI1PR07MB1568.eurprd07.prod.outlook.com (10.165.239.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.10; Mon, 31 Jul 2017 10:37:44 +0000
Received: from VI1PR07MB0895.eurprd07.prod.outlook.com
	([fe80::75d9:b559:511f:683c]) by
	VI1PR07MB0895.eurprd07.prod.outlook.com
	([fe80::75d9:b559:511f:683c%14]) with mapi id 15.01.1304.022;
	Mon, 31 Jul 2017 10:37:44 +0000
From: Adrian Dudau <Adrian.Dudau@enea.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] [PATCH] python-requests: Drop recipe
Thread-Index: AQHS9ZLarvBrQfdm4UGRJGl2PDLqD6Jt5uyA
Date: Mon, 31 Jul 2017 10:37:44 +0000
Message-ID: <1501497461.1765.0.camel@enea.com>
References: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
In-Reply-To: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Adrian.Dudau@enea.com; 
x-originating-ip: [192.36.1.252]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR07MB1568;
	20:9Lguuu/9xcbv/sO1fs3BSj40bCVme6tMzVcKhwHqmRLL/+LIvKELS5PHIciZIZmeq/hNssDIs1+PkRQCAqbbO8tw11mU+nnQO9hv736qyEPYRDXilqDz1FoqPPQIQ06vvOYjzzCRbP7SKFsiuLHLa3/0Zha2IWYjlQ7MmNYQhGY=
x-ms-office365-filtering-correlation-id: 1828667c-2a75-4839-2281-08d4d8002dff
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VI1PR07MB1568; 
x-ms-traffictypediagnostic: VI1PR07MB1568:
x-exchange-antispam-report-test: UriScan:(251646265452963);
x-microsoft-antispam-prvs: <VI1PR07MB15689F48A1CB13B86FBE6A6CE4B20@VI1PR07MB1568.eurprd07.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(6041248)(20161123555025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR07MB1568; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR07MB1568; 
x-forefront-prvs: 03853D523D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39410400002)(39400400002)(39830400002)(24454002)(189002)(199003)(377424004)(81156014)(2501003)(3846002)(6116002)(3280700002)(5250100002)(36756003)(8936002)(102836003)(68736007)(81166006)(7736002)(305945005)(3660700001)(50986999)(76176999)(6916009)(6486002)(66066001)(72206003)(6506006)(14454004)(86362001)(229853002)(8676002)(2950100002)(106356001)(99286003)(105586002)(33646002)(53936002)(6246003)(5660300001)(2351001)(25786009)(53386004)(478600001)(6512007)(2906002)(5640700003)(54356999)(6436002)(101416001)(38730400002)(110136004)(97736004)(189998001)(6306002)(2900100001)(103116003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB1568;
	H:VI1PR07MB0895.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: enea.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: enea.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2017 10:37:44.7814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8cdaed89-c47e-40b8-90b5-f28ad2c3fdca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB1568
Subject: Re: [PATCH] python-requests: Drop recipe
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
X-List-Received-Date: Mon, 31 Jul 2017 15:10:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <83BFF570E4030F40A4A1968FA988D518@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gb25zLCAyMDE3LTA3LTA1IGF0IDE1OjI3ICswMjAwLCBBZHJpYW4gRHVkYXUgd3JvdGU6DQo+
IFRoZXJlJ3MgYSBuZXdlciByZWNpcGUgKHYyLjEzKSBtYWludGFpbmVkIGluIG1ldGEtcHl0aG9u
LiBtZXRhLQ0KPiBvcGVuc3RhY2sNCj4gZXhwbGljaXRseSBwcmVmZXJzIHRoYXQgdmVyc2lvbiBv
dmVyIHRoaXMgb25lLCBzbyBubyBwb2ludCBpbiBrZWVwaW5nDQo+IHRoaXMgcmVjaXBlIHNpbmNl
IG5vYm9keSBlbHNlIGlzIHVzaW5nIHRoaXMgdmVyc2lvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBEdWRhdSA8YWRyaWFuLmR1ZGF1QGVuZWEuY29tPg0KPiAtLS0NCj4gwqByZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVxdWVzdHNfMi44LjEuYmIgfCAyOCAtLS0tLS0tLS0t
LS0tLQ0KPiAtLS0tLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDI4IGRlbGV0aW9ucygtKQ0K
PiDCoGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVx
dWVzdHNfMi44LjEuYmINCj4gDQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24tcmVxdWVzdHNfMi44LjEuYmINCj4gYi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tcmVxdWVzdHNfMi44LjEuYmINCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDE4N2Y5N2EuLjAwMDAwMDANCj4gLS0tIGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uLXJlcXVlc3RzXzIuOC4xLmJiDQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsMjggKzAsMCBA
QA0KPiAtSE9NRVBBR0UgPSAiaHR0cDovL3B5dGhvbi1yZXF1ZXN0cy5vcmciDQo+IC1TVU1NQVJZ
ID0gIlB5dGhvbiBIVFRQIGZvciBIdW1hbnMuIg0KPiAtREVTQ1JJUFRJT04gPSAiXA0KPiAtwqDC
oFJlcXVlc3RzIGlzIGFuIEFwYWNoZTIgTGljZW5zZWQgSFRUUCBsaWJyYXJ5LCB3cml0dGVuIGlu
IFB5dGhvbiwgXA0KPiAtwqDCoGZvciBodW1hbiBiZWluZ3MuIFwNCj4gLcKgwqAuwqDCoMKgwqDC
oMKgXA0KPiAtwqDCoE1vc3QgZXhpc3RpbmcgUHl0aG9uIG1vZHVsZXMgZm9yIHNlbmRpbmcgSFRU
UCByZXF1ZXN0cyBhcmUNCj4gZXh0cmVtZWx5IFwNCj4gLcKgwqB2ZXJib3NlIGFuZCBjdW1iZXJz
b21lLiBQeXRob24ncyBidWlsdGluIHVybGxpYjIgbW9kdWxlIHByb3ZpZGVzDQo+IG1vc3QgXA0K
PiAtwqDCoG9mIHRoZSBIVFRQIGNhcGFiaWxpdGllcyB5b3Ugc2hvdWxkIG5lZWQsIGJ1dCB0aGUg
YXBpIGlzDQo+IHRob3JvdWdobHkgXA0KPiAtwqDCoGJyb2tlbi7CoMKgSXQgcmVxdWlyZXMgYW4g
ZW5vcm1vdXMgYW1vdW50IG9mIHdvcmsgKGV2ZW4gbWV0aG9kDQo+IG92ZXJyaWRlcykgXA0KPiAt
wqDCoHRvIHBlcmZvcm0gdGhlIHNpbXBsZXN0IG9mIHRhc2tzLiBcDQo+IC3CoMKgLsKgwqDCoMKg
wqDCoFwNCj4gLcKgwqBUaGluZ3Mgc2hvdWxkbid0IGJlIHRoaXMgd2F5LiBOb3QgaW4gUHl0aG9u
IFwNCj4gLcKgwqAiDQo+IC1TRUNUSU9OID0gImRldmVsL3B5dGhvbiINCj4gLUxJQ0VOU0UgPSAi
QXBhY2hlLTIuMCINCj4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTU4YzdlMTYzYzlmOGVlMDM3MjQ2ZGExMDFjNmFmZDFlIg0KPiAtDQo+IC1TUkNOQU1FID0gInJl
cXVlc3RzIg0KPiAtDQo+IC1TUkNfVVJJID0gImh0dHA6Ly9weXBpLnB5dGhvbi5vcmcvcGFja2Fn
ZXMvc291cmNlL3IvcmVxdWVzdHMvJHtTUkNOQQ0KPiBNRX0tJHtQVn0udGFyLmd6Ig0KPiAtDQo+
IC1TUkNfVVJJW21kNXN1bV0gPSAiYTI3ZWEzZDcyZDc4MjI5MDZkZGNlNWUyNTJkNmFkZDkiDQo+
IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiODRmZThkNWJmNGRjZGNjNDkwMDI0NDZjNDdhMTQ2
ZDE3YWMxMGZhY2YwMGQ5MDg2NjU5MDY0YWM0M2I2YzI1YiINCj4gLQ0KPiAtUyA9ICIke1dPUktE
SVJ9LyR7U1JDTkFNRX0tJHtQVn0iDQo+IC0NCj4gLWluaGVyaXQgc2V0dXB0b29scw0KPiAtLcKg
DQo+IDIuNy40DQo+IA0KDQpwaW5nIQ==


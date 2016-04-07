Return-Path: <bogdan.purcareata@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85D04E00C20; Thu,  7 Apr 2016 02:13:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.55.234.92 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0092.outbound.protection.outlook.com [157.55.234.92])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2EACE00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Apr 2016 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JK7YowFU7lJjyIYf09ax2PbXT+q8MoCC8lJCHQs4YoA=;
	b=lIF7349d92+GxfESkpsCf0+Smeafqip5ad8XL0HocaZtDmBuNijvFN6k/ynV0pF6TLN8nJE8GT9nxEPs8USkgQ36roXAvzrgiqcQ/AsUfGH35cyUjamM/eu22gcrg1Rxp0dBB9sz/pwj4c8Z3bH7eHfiFN0TnSWgJCJulmBRu08=
Received: from AM3PR04MB1234.eurprd04.prod.outlook.com
	(2a01:111:e400:586d::27) by AM3PR04MB1233.eurprd04.prod.outlook.com
	(2a01:111:e400:586d::26) with Microsoft SMTP Server (TLS) id
	15.1.447.15; Thu, 7 Apr 2016 09:13:24 +0000
Received: from AM3PR04MB1234.eurprd04.prod.outlook.com
	([fe80::2082:a5bd:2663:ad3]) by AM3PR04MB1234.eurprd04.prod.outlook.com
	([fe80::2082:a5bd:2663:ad3%14]) with mapi id 15.01.0447.028;
	Thu, 7 Apr 2016 09:13:24 +0000
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] libvirt: Fix bug in assigning
	virtio-mmio disks with qemu
Thread-Index: AQHRkJq4rMaOEkri8UWccb5jo+5ERp9+OkKA
Date: Thu, 7 Apr 2016 09:13:24 +0000
Message-ID: <570624B3.7040005@nxp.com>
References: <1459871312-872-1-git-send-email-bogdan.purcareata@nxp.com>
	<CADkTA4PvBVAJFWQkb1LsceVqxfnGHwR4CoqspKmbfo-7DwJyhQ@mail.gmail.com>
In-Reply-To: <CADkTA4PvBVAJFWQkb1LsceVqxfnGHwR4CoqspKmbfo-7DwJyhQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.88.146.1]
x-ms-office365-filtering-correlation-id: 7c5b2b8c-b221-49bb-d31a-08d35ec4df60
x-microsoft-exchange-diagnostics: 1; AM3PR04MB1233;
	5:NwDSbIbP6KUK3MeA4BTUJBC+EhCrOCAtXTJz0mKp49VmjAaR4hRwb/LAGVULJ8Dm60fAWDcBV1THmis0T1HodEDjlEpUu2qBVjPvD9G2NarDcj6rSfRLDFnn5jKXcNRv20lvY6/XvXxk56rXEVKsvg==;
	24:poecx6RsscBp9Qapk8aJdmEmEa2BZqvYPI30jiq5fUkm06ecM7BCBnFNNpzfnxYt7ABN2BYpvlD3+wiv51AP48cR5ONbOGrjj8SMEFY+OS0=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB1233;
x-microsoft-antispam-prvs: <AM3PR04MB1233CCA20479CAF533A7005BEA900@AM3PR04MB1233.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM3PR04MB1233; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB1233; 
x-forefront-prvs: 0905A6B2C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(377454003)(106116001)(4326007)(110136002)(189998001)(2906002)(3660700001)(86362001)(76176999)(3280700002)(1220700001)(50986999)(87266999)(54356999)(33656002)(81166005)(15395725005)(65816999)(575784001)(5008740100001)(6116002)(80316001)(2950100001)(66066001)(586003)(19580405001)(36756003)(11100500001)(19580395003)(102836003)(5250100002)(1096002)(92566002)(3846002)(5002640100001)(15975445007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB1233;
	H:AM3PR04MB1234.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2016 09:13:24.3012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB1233
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Fix bug in assigning virtio-mmio disks with qemu
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
X-List-Received-Date: Thu, 07 Apr 2016 09:13:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6412F748CB4B274C89014F41EE531023@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMDcuMDQuMjAxNiAwOTo1NywgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+IE9uIFR1ZSwgQXBy
IDUsIDIwMTYgYXQgMTE6NDggQU0sIEJvZ2RhbiBQdXJjYXJlYXRhIDwNCj4gYm9nZGFuLnB1cmNh
cmVhdGFAbnhwLmNvbT4gd3JvdGU6DQo+DQo+PiBQYXRjaCBjb250YWlucyBhIG1vcmUgZGV0YWls
ZWQgZGVzY3JpcHRpb24uIEJhc2ljYWxseSBhbGxvd3MgYWRkaW5nDQo+PiB2aXJ0aW8tbW1pbw0K
Pj4gYmxvY2sgZGV2aWNlIHRvIFFFTVUgZ3Vlc3RzLiBUZXN0ZWQgb24gQVJNNjQuDQo+Pg0KPj4g
UGxlYXNlIGFwcGx5IG9uIGpldGhybyBicmFuY2guDQo+Pg0KPg0KPiBXZSBkb24ndCB3YW50IHRv
IGNyZWF0ZSBmdW5jdGlvbmFsaXR5IG9uIG9sZCBicmFuY2hlcyB0aGF0IGlzbid0IGFsc28gb24N
Cj4gbWFzdGVyLg0KPiBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB0aGlzIHdvdWxkbid0IGJlIGFw
cGxpY2FibGUgdG8gbWFzdGVyIGFzIHdlbGwgPw0KDQpNYXN0ZXIgZGVsaXZlcnMgbGlidmlydCAx
LjMuMiBbMV0gd2hpY2ggaGFzIHRoaXMgcGF0Y2ggaW5jbHVkZWQ6DQoNCltsaWJ2aXJ0XSQgZ2l0
IGNoZWNrb3V0IHYxLjMuMiAmJiBnaXQgbG9nIC0tcHJldHR5PW9uZWxpbmUgfCBncmVwICJJZ25v
cmUgDQp2aXJ0aW8tbW1pbyINCmQ1MjZlMzdiYWQyNTE1Y2Y5MWNhYTBlNGZmM2VkYWY0MWU0NWI1
YzIgSWdub3JlIHZpcnRpby1tbWlvIGRpc2tzIGluIA0KcWVtdUFzc2lnbkRldmljZVBDSVNsb3Rz
KCkNCg0KWzFdIA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21l
dGEtdmlydHVhbGl6YXRpb24vdHJlZS9yZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQNCg0KVGhhbmsg
eW91LA0KQm9nZGFuIFAuDQoNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCb2dkYW4gUHVyY2FyZWF0
YSA8Ym9nZGFuLnB1cmNhcmVhdGFAbnhwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi5pby1tbWlvLWRp
c2tzLWluLXFlbXVBc3NpZ25EZXZpY2VQQ0lTbG90cy5wYXRjaCB8IDgxDQo+PiArKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIHJlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2aXJ0XzEuMi4x
OS5iYiAgICAgICAgIHwgIDEgKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMo
KykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+PiByZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQv
bGlidmlydC9JZ25vcmUtdmlydGlvLW1taW8tZGlza3MtaW4tcWVtdUFzc2lnbkRldmljZVBDSVNs
b3RzLnBhdGNoDQo+Pg0KPj4gZGlmZiAtLWdpdA0KPj4gYS9yZWNpcGVzLWV4dGVuZGVkL2xpYnZp
cnQvbGlidmlydC9JZ25vcmUtdmlydGlvLW1taW8tZGlza3MtaW4tcWVtdUFzc2lnbkRldmljZVBD
SVNsb3RzLnBhdGNoDQo+PiBiL3JlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2aXJ0L0lnbm9y
ZS12aXJ0aW8tbW1pby1kaXNrcy1pbi1xZW11QXNzaWduRGV2aWNlUENJU2xvdHMucGF0Y2gNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwLi5mMGI3YWI1DQo+PiAtLS0g
L2Rldi9udWxsDQo+PiArKysNCj4+IGIvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xpYnZpcnQv
SWdub3JlLXZpcnRpby1tbWlvLWRpc2tzLWluLXFlbXVBc3NpZ25EZXZpY2VQQ0lTbG90cy5wYXRj
aA0KPj4gQEAgLTAsMCArMSw4MSBAQA0KPj4gK0Zyb20gZDUyNmUzN2JhZDI1MTVjZjkxY2FhMGU0
ZmYzZWRhZjQxZTQ1YjVjMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+ICtGcm9tOiBQYXZl
bCBGZWRpbiA8cC5mZWRpbkBzYW1zdW5nLmNvbT4NCj4+ICtEYXRlOiBXZWQsIDkgU2VwIDIwMTUg
MTU6MDI6NTMgKzAzMDANCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIElnbm9yZSB2aXJ0aW8tbW1pbyBk
aXNrcyBpbiBxZW11QXNzaWduRGV2aWNlUENJU2xvdHMoKQ0KPj4gKw0KPj4gK0ZpeGVzIHRoZSBm
b2xsb3dpbmcgZXJyb3Igd2hlbiBhdHRlbXB0aW5nIHRvIGFkZCBhIGRpc2sgd2l0aCBidXM9J3Zp
cnRpbycNCj4+ICt0byBhIG1hY2hpbmUgd2hpY2ggYWN0dWFsbHkgc3VwcG9ydHMgdmlydGlvLW1t
aW8gKGNhdWdodCB3aXRoIEFSTSB2aXJ0KToNCj4+ICsNCj4+ICt2aXJ0aW8gZGlzayBjYW5ub3Qg
aGF2ZSBhbiBhZGRyZXNzIG9mIHR5cGUgJ3ZpcnRpby1tbWlvJw0KPj4gKw0KPj4gK1RoZSBwcm9i
bGVtIGhhcyBiZWVuIGxpa2VseSBpbnRyb2R1Y2VkIGJ5DQo+PiArZThkNTUxNzI1NDRjMWZhZmUz
MWE5ZTA5MzQ2YmRlYmNhNGYwZDZmOS4gQmVmb3JlIHRoYXQNCj4+ICtxZW11QXNzaWduRGV2aWNl
UENJU2xvdHMoKSB3YXMgbmV2ZXIgY2FsbGVkIGZvciBBUk0gInZpcnQiIG1hY2hpbmUuDQo+PiAr
DQo+PiArVXBzdHJlYW0tc3RhdHVzOiBBY2NlcHRlZA0KPj4gK1sNCj4+IGh0dHBzOi8vbGlidmly
dC5vcmcvZ2l0Lz9wPWxpYnZpcnQuZ2l0O2E9Y29tbWl0O2g9ZDUyNmUzN2JhZDI1MTVjZjkxY2Fh
MGU0ZmYzZWRhZjQxZTQ1YjVjMg0KPj4gXQ0KPj4gKw0KPj4gK1NpZ25lZC1vZmYtYnk6IFBhdmVs
IEZlZGluIDxwLmZlZGluQHNhbXN1bmcuY29tPg0KPj4gKy0tLQ0KPj4gKyBzcmMvcWVtdS9xZW11
X2NvbW1hbmQuYyB8IDExICsrKysrKysrKy0tDQo+PiArIHNyYy9xZW11L3FlbXVfY29tbWFuZC5o
IHwgIDEgKw0KPj4gKyAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+PiArDQo+PiArZGlmZiAtLWdpdCBhL3NyYy9xZW11L3FlbXVfY29tbWFuZC5jIGIv
c3JjL3FlbXUvcWVtdV9jb21tYW5kLmMNCj4+ICtpbmRleCBiNTY2NzBjLi4yNWY1N2YyIDEwMDY0
NA0KPj4gKy0tLSBhL3NyYy9xZW11L3FlbXVfY29tbWFuZC5jDQo+PiArKysrIGIvc3JjL3FlbXUv
cWVtdV9jb21tYW5kLmMNCj4+ICtAQCAtMjI2MSw3ICsyMjYxLDcgQEAgcWVtdURvbWFpbkFzc2ln
blBDSUFkZHJlc3Nlcyh2aXJEb21haW5EZWZQdHIgZGVmLA0KPj4gKyAgICAgICAgICAgICAgICAg
dmlyRG9tYWluUENJQWRkcmVzc1Jlc2VydmVOZXh0U2xvdChhZGRycywgJmluZm8sIGZsYWdzKQ0K
Pj4gPCAwKQ0KPj4gKyAgICAgICAgICAgICAgICAgZ290byBjbGVhbnVwOw0KPj4gKw0KPj4gKy0g
ICAgICAgICAgICBpZiAocWVtdUFzc2lnbkRldmljZVBDSVNsb3RzKGRlZiwgYWRkcnMpIDwgMCkN
Cj4+ICsrICAgICAgICAgICAgaWYgKHFlbXVBc3NpZ25EZXZpY2VQQ0lTbG90cyhkZWYsIHFlbXVD
YXBzLCBhZGRycykgPCAwKQ0KPj4gKyAgICAgICAgICAgICAgICAgZ290byBjbGVhbnVwOw0KPj4g
Kw0KPj4gKyAgICAgICAgICAgICBmb3IgKGkgPSAxOyBpIDwgYWRkcnMtPm5idXNlczsgaSsrKSB7
DQo+PiArQEAgLTIyOTQsNyArMjI5NCw3IEBAIHFlbXVEb21haW5Bc3NpZ25QQ0lBZGRyZXNzZXMo
dmlyRG9tYWluRGVmUHRyIGRlZiwNCj4+ICsgICAgICAgICAgICAgaWYgKHFlbXVWYWxpZGF0ZURl
dmljZVBDSVNsb3RzQ2hpcHNldHMoZGVmLCBxZW11Q2FwcywgYWRkcnMpDQo+PiA8IDApDQo+PiAr
ICAgICAgICAgICAgICAgICBnb3RvIGNsZWFudXA7DQo+PiArDQo+PiArLSAgICAgICAgICAgIGlm
IChxZW11QXNzaWduRGV2aWNlUENJU2xvdHMoZGVmLCBhZGRycykgPCAwKQ0KPj4gKysgICAgICAg
ICAgICBpZiAocWVtdUFzc2lnbkRldmljZVBDSVNsb3RzKGRlZiwgcWVtdUNhcHMsIGFkZHJzKSA8
IDApDQo+PiArICAgICAgICAgICAgICAgICBnb3RvIGNsZWFudXA7DQo+PiArDQo+PiArICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBkZWYtPm5jb250cm9sbGVyczsgaSsrKSB7DQo+PiArQEAg
LTI0MjYsNiArMjQyNiw3IEBAIHFlbXVEb21haW5Bc3NpZ25QQ0lBZGRyZXNzZXModmlyRG9tYWlu
RGVmUHRyIGRlZiwNCj4+ICsgICovDQo+PiArIGludA0KPj4gKyBxZW11QXNzaWduRGV2aWNlUENJ
U2xvdHModmlyRG9tYWluRGVmUHRyIGRlZiwNCj4+ICsrICAgICAgICAgICAgICAgICAgICAgICAg
IHZpclFFTVVDYXBzUHRyIHFlbXVDYXBzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
dmlyRG9tYWluUENJQWRkcmVzc1NldFB0ciBhZGRycykNCj4+ICsgew0KPj4gKyAgICAgc2l6ZV90
IGksIGo7DQo+PiArQEAgLTI2MTgsNiArMjYxOSwxMiBAQCBxZW11QXNzaWduRGV2aWNlUENJU2xv
dHModmlyRG9tYWluRGVmUHRyIGRlZiwNCj4+ICsgICAgICAgICAgICAgVklSX0RPTUFJTl9ERVZJ
Q0VfQUREUkVTU19UWVBFX0NDVykNCj4+ICsgICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+
PiArKyAgICAgICAgLyogQWxzbyBpZ25vcmUgdmlydGlvLW1taW8gZGlza3MgaWYgb3VyIG1hY2hp
bmUgYWxsb3dzIHRoZW0gKi8NCj4+ICsrICAgICAgICBpZiAoZGVmLT5kaXNrc1tpXS0+aW5mby50
eXBlID09DQo+PiArKyAgICAgICAgICAgIFZJUl9ET01BSU5fREVWSUNFX0FERFJFU1NfVFlQRV9W
SVJUSU9fTU1JTyAmJg0KPj4gKysgICAgICAgICAgICB2aXJRRU1VQ2Fwc0dldChxZW11Q2Fwcywg
UUVNVV9DQVBTX0RFVklDRV9WSVJUSU9fTU1JTykpDQo+PiArKyAgICAgICAgICAgIGNvbnRpbnVl
Ow0KPj4gKysNCj4+ICsgICAgICAgICBpZiAoZGVmLT5kaXNrc1tpXS0+aW5mby50eXBlICE9DQo+
PiBWSVJfRE9NQUlOX0RFVklDRV9BRERSRVNTX1RZUEVfTk9ORSkgew0KPj4gKyAgICAgICAgICAg
ICB2aXJSZXBvcnRFcnJvcihWSVJfRVJSX0NPTkZJR19VTlNVUFBPUlRFRCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXygidmlydGlvIGRpc2sgY2Fubm90IGhhdmUgYW4gYWRkcmVz
cyBvZiB0eXBlDQo+PiAnJXMnIiksDQo+PiArZGlmZiAtLWdpdCBhL3NyYy9xZW11L3FlbXVfY29t
bWFuZC5oIGIvc3JjL3FlbXUvcWVtdV9jb21tYW5kLmgNCj4+ICtpbmRleCA3NjdkMzFmLi40YWE3
ZjJkIDEwMDY0NA0KPj4gKy0tLSBhL3NyYy9xZW11L3FlbXVfY29tbWFuZC5oDQo+PiArKysrIGIv
c3JjL3FlbXUvcWVtdV9jb21tYW5kLmgNCj4+ICtAQCAtMjg0LDYgKzI4NCw3IEBAIHZpckRvbWFp
blBDSUFkZHJlc3NTZXRQdHINCj4+IHFlbXVEb21haW5QQ0lBZGRyZXNzU2V0Q3JlYXRlKHZpckRv
bWFpbkRlZlB0ciBkZWYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBkcnlSdW4pOw0KPj4gKw0KPj4gKyBpbnQgcWVtdUFz
c2lnbkRldmljZVBDSVNsb3RzKHZpckRvbWFpbkRlZlB0ciBkZWYsDQo+PiArKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmlyUUVNVUNhcHNQdHIgcWVtdUNhcHMsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmlyRG9tYWluUENJQWRkcmVzc1NldFB0ciBhZGRycyk7DQo+
PiArDQo+PiArIGludCBxZW11QXNzaWduRGV2aWNlQWxpYXNlcyh2aXJEb21haW5EZWZQdHIgZGVm
LCB2aXJRRU1VQ2Fwc1B0cg0KPj4gcWVtdUNhcHMpOw0KPj4gKy0tDQo+PiArMS45LjENCj4+ICsN
Cj4+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQvbGlidmlydF8xLjIuMTku
YmINCj4+IGIvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xpYnZpcnRfMS4yLjE5LmJiDQo+PiBp
bmRleCBkZjUzZDU5Li43NzRlZWE0IDEwMDY0NA0KPj4gLS0tIGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJ2aXJ0L2xpYnZpcnRfMS4yLjE5LmJiDQo+PiArKysgYi9yZWNpcGVzLWV4dGVuZGVkL2xpYnZp
cnQvbGlidmlydF8xLjIuMTkuYmINCj4+IEBAIC0zMyw2ICszMyw3IEBAIFNSQ19VUkkgPSAiDQo+
PiBodHRwOi8vbGlidmlydC5vcmcvc291cmNlcy9saWJ2aXJ0LSR7UFZ9LnRhci5nejtuYW1lPWxp
YnZpcnQgXA0KPj4gICAgICAgICAgICAgIGZpbGU6Ly9saWJ2aXJ0LXVzZS1wa2ctY29uZmlnLXRv
LWxvY2F0ZS1saWJjYXAucGF0Y2ggXA0KPj4gICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRvLWZp
eC1idWlsZC1lcnJvci5wYXRjaCBcDQo+PiAgICAgICAgICAgICAgZmlsZTovL1JldmVydC1idWls
ZC1hZGQtcHJlZml4LXRvLVNZU1RFTURfVU5JVF9ESVIucGF0Y2ggXA0KPj4gKw0KPj4gICBmaWxl
Oi8vSWdub3JlLXZpcnRpby1tbWlvLWRpc2tzLWluLXFlbXVBc3NpZ25EZXZpY2VQQ0lTbG90cy5w
YXRjaCBcDQo+PiAgICAgICAgICAgICAiDQo+Pg0KPj4gICBTUkNfVVJJW2xpYnZpcnQubWQ1c3Vt
XSA9ICJiYzNhYjFiYTViNmZhYmQyZTQ1MTZjNzBkZGQ0ZDk3YyINCj4+IC0tDQo+PiAxLjkuMQ0K
Pj4NCj4+IC0tDQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPj4gbWV0YS12aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QNCj4+IG1ldGEtdmlydHVh
bGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9yZw0KPj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qu
b3JnL2xpc3RpbmZvL21ldGEtdmlydHVhbGl6YXRpb24NCj4+DQo+DQo+DQo+


Return-Path: <BSREEKAN@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A12CE0091A; Thu, 29 Mar 2018 15:37:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.44 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 7095 seconds by postgrey-1.32 at yocto-www;
	Thu, 29 Mar 2018 15:37:49 PDT
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0044.outbound.protection.outlook.com [104.47.32.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3A00E00529
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=azQgTuxS2XNYh56CUIBfg85ng8WuKRinMnDyOLYL2uQ=;
	b=02ZTKp8D3i1aSz52f0Z7ovOJMt0JdmnNaNiDNhfDgoJPVAGhjQ94P/Zmt0dfWEyjflUlECS5LQLIAz+oyIFWfyMywbMZUb4K8kn8qF9s8MHBkjD9poKyylGGYJq1YZU7XDkUvhSvAGWZ4rU1UUy/vvCz5pjpJiLmw/b/swes9l4=
Received: from DM2PR0201MB0847.namprd02.prod.outlook.com (10.160.95.156) by
	DM2PR0201MB1037.namprd02.prod.outlook.com (10.160.219.147) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.631.10;
	Thu, 29 Mar 2018 20:06:34 +0000
Received: from DM2PR0201MB0847.namprd02.prod.outlook.com
	([fe80::a04d:c904:6921:866a]) by
	DM2PR0201MB0847.namprd02.prod.outlook.com
	([fe80::a04d:c904:6921:866a%13]) with mapi id 15.20.0609.012;
	Thu, 29 Mar 2018 20:06:32 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [meta-virtualization~][PATCH] inittab: fix
	hypervisor console
Thread-Index: AQHTxUu4NDoWn312wkmRfjvJNSuN4aPnIp+AgACEiNA=
Date: Thu, 29 Mar 2018 20:06:32 +0000
Message-ID: <DM2PR0201MB084744F1796CD7CF0E5B1994B0A20@DM2PR0201MB0847.namprd02.prod.outlook.com>
References: <1522100663-5563-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<CADkTA4MKWNcZdQwacNuXrM+-wfej4YNp4JCUoEY5b=TLw2j_Dg@mail.gmail.com>
In-Reply-To: <CADkTA4MKWNcZdQwacNuXrM+-wfej4YNp4JCUoEY5b=TLw2j_Dg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM2PR0201MB1037;
	7:NYcD64MEcAOXpJOsAy4DaKlSl86w44taz7ieVmjjLwyIm+4yZN8zDPS9UDo6mxsilLzUbYwx2mLG/FSqzfePRne3rvcN1KCu0K4v1GqNvHVlnmH/wgwfmBN6jZg4/58O2mELuDEwgomKhjL9UWJqW48CEo8VeIWvCLlLXw0phUH7jxsCZeFxA2GWVs+1L9P7id/d9sZ1pEj01cwROf+1jmldJZPCpVSPU9Mm4Ic2xQAK3ZoBYeOUjqt2kxOSiRzb
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(366004)(376002)(39380400002)(39860400002)(346002)(396003)(13464003)(199004)(189003)(54906003)(106356001)(25786009)(4326008)(81156014)(81166006)(105586002)(8676002)(478600001)(33656002)(14454004)(97736004)(72206003)(966005)(8936002)(39060400002)(6116002)(3846002)(7736002)(5660300001)(3660700001)(3280700002)(2906002)(305945005)(316002)(74316002)(66066001)(55016002)(53546011)(6306002)(9686003)(6506007)(6436002)(26005)(6246003)(59450400001)(53936002)(186003)(107886003)(229853002)(486005)(68736007)(476003)(2900100001)(6916009)(486005)(11346002)(446003)(5250100002)(5890100001)(86362001)(7696005)(99286004)(76176011)(102836004)(81973001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB1037;
	H:DM2PR0201MB0847.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d56d035-12f6-4ce4-0d2c-08d595b0915a
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM2PR0201MB1037; 
x-ms-traffictypediagnostic: DM2PR0201MB1037:
x-microsoft-antispam-prvs: <DM2PR0201MB10377236F3292F4982588648B0A20@DM2PR0201MB1037.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(85827821059158)(192813158149592); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:DM2PR0201MB1037; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB1037; 
x-forefront-prvs: 0626C21B10
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: hlO6f8WCiBwRQZ/SFqPWqoUWQrPwMKDePvajsfut9ZS3zMzaSegRe7qzWmRZ+LmYkG/7nvcSKbJWwURH+8/KQ6l9on2fLr+pjrvVNtzlzRgZ/tw7vf194cv/MBEq6yKjwift9GaW5VFWquwQLQqn/73fKQyMrOOc7nm5ybazP9YrH9WyOWEK13EfshWzt28eYtr++Sb4EXLCezAd/Z5pX7YIeBaCCC16edOOXFmHLrGW+xA9iurJAYx6ddtRyhAwIcTOIEutwxU2i+v1NzZP0XdJEOnEAeNzydXjS2Vq9OwvGuOLnkHraFROzCe8QKvxErAvqqkvH81QAT4SCJQsJx/pH6V2Qd0fVD1frOHE0kl7aB1gmJmKjx6+m1Wt2NLTQXwuQBs0luSENqO8FDap/FaE4SNYkMk3hsAnUrPJ4Bw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d56d035-12f6-4ce4-0d2c-08d595b0915a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2018 20:06:32.6923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB1037
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Cyril Chemparathy <cyrilc@xilinx.com>
Subject: Re: [meta-virtualization~][PATCH] inittab: fix hypervisor console
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
X-List-Received-Date: Thu, 29 Mar 2018 22:37:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJydWNlIEFzaGZpZWxkIFtt
YWlsdG86YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2gg
MjksIDIwMTggNTowOCBBTQ0KPiBUbzogQmhhcmdhdmEgU3JlZWthbnRhcHBhIEdheWF0aHJpIDxC
U1JFRUtBTkB4aWxpbnguY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2pl
Y3Qub3JnOyBDeXJpbCBDaGVtcGFyYXRoeQ0KPiA8Y3lyaWxjQHhpbGlueC5jb20+OyBNYW5qdWt1
bWFyIEhhcnRoaWtvdGUgTWF0aGEgPE1BTkpVS1VNQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW21ldGEtdmlydHVhbGl6YXRpb25+XVtQQVRDSF0gaW5p
dHRhYjogZml4DQo+IGh5cGVydmlzb3IgY29uc29sZQ0KPiANCj4gV2hlbiBJIGFwcGx5IHRoZSBw
YXRjaCB0byBtZXRhLXZpcnQgbWFzdGVyLCBJIGdldDoNCj4gDQo+IGVycm9yOiBwYXRjaCBmYWls
ZWQ6IHJlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdC1pbml0dGFiXzIuJS5iYmFwcGVuZDox
DQo+IGVycm9yOiByZW1vdmFsIHBhdGNoIGxlYXZlcyBmaWxlIGNvbnRlbnRzDQo+IGVycm9yOiBy
ZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQtaW5pdHRhYl8yLiUuYmJhcHBlbmQ6IHBhdGNo
IGRvZXMgbm90IGFwcGx5DQo+IA0KPiBXaGlsZSBJIGNvdWxkIGp1c3QgcmVtb3ZlIHRoZSBiYmFw
cGVuZCBtYW51YWxseSwgdGhhdCBlcnJvciBpbXBsaWVzIHRoYXQNCj4gd2hhdGV2ZXIgeW91IGFy
ZSB0ZXN0aW5nIGlzIG5vdCB0aGUgc2FtZSBhcyB0aGUgY3VycmVudCBtYXN0ZXIgYnJhbmNoLg0K
PiANCj4gU28gY2FuIHlvdSByZWJhc2UgYW5kIHJlc2VuZCB0aGUgcGF0Y2ggYXMgYSB2MiA/DQoN
CkhpIEJydWNlLA0KDQpJIGhhdmUgdHJpZWQgdGhlIHBhdGNoIG9uIHRoZSBtYXN0ZXIgYW5kIGl0
IGFwcGxpZXMuIEkgZXZlbiB0cmllZCB0aGUgcGF0Y2ggdGhhdCBJIGRvd25sb2FkZWQgZnJvbSB0
aGUgbWFpbGluZyBsaXN0IGFuZCBpdCBzZWVtcyB0byB3b3JrIGZvciBtZS4gVGhpcyB0aGUgbGF0
ZXN0IG1hc3RlciBJIGhhdmUgdHJpZWQgbXkgcGF0Y2ggb246IDczZjQ3NzguIFBsZWFzZSBsZXQg
bWUga25vdyBpZiBJIGFtIG1pc3NpbmcgYW55dGhpbmcuDQoNClRoYW5rcywNCkJoYXJnYXYNCj4g
DQo+IEJydWNlDQo+IA0KPiANCj4gT24gTW9uLCBNYXIgMjYsIDIwMTggYXQgNTo0NCBQTSwgQmhh
cmdhdmEgU3JlZWthbnRhcHBhIEdheWF0aHJpDQo+IDxiaGFyZ2F2YS5zcmVla2FudGFwcGEtZ2F5
YXRocmlAeGlsaW54LmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQ3lyaWwgQ2hlbXBhcmF0aHkgPGN5
cmlsLmNoZW1wYXJhdGh5QHhpbGlueC5jb20+DQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBzd2l0Y2hl
cyBvdmVyIHRvIHVzaW5nIGV4aXN0aW5nIFNFUklBTF9DT05TT0xFUyBtZWNoYW5pc20NCj4gPiBm
b3IgaHZjMCBpbml0dGFiIGVudHJ5IGdlbmVyYXRpb24uICBUaGlzIHRoZW4gcmVzdWx0cyBpbg0K
PiA+IC9iaW4vc3RhcnRfZ2V0dHkgd3JhcHBlciBiZWluZyB1c2VkLCB3aGljaCBhdm9pZHMgdGhl
IGdldHR5IGZhaWx1cmUNCj4gPiBzZWVuIHdoZW4gcnVubmluZyBhIHhlbiBjYXBhYmxlIHJvb3Rm
cyBuYXRpdmVseSBvbiBsaW51eC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIENoZW1w
YXJhdGh5IDxjeXJpbC5jaGVtcGFyYXRoeUB4aWxpbnguY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1hbmp1a3VtYXIgTWF0aGENCj4gPiA8bWFuanVrdW1hci5oYXJ0aGlrb3RlLW1hdGhhQHhpbGlu
eC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmhhcmdhdmEgU3JlZWthbnRhcHBhIEdheWF0aHJp
DQo+ID4gPGJoYXJnYXZhLnNyZWVrYW50YXBwYS1nYXlhdGhyaUB4aWxpbnguY29tPg0KPiA+IC0t
LQ0KPiA+ICBjb25mL2Rpc3Ryby9pbmNsdWRlL3ZpcnRfY29uc29sZS5pbmMgICAgICAgICAgICAg
ICAgfCAxICsNCj4gPiAgY29uZi9sYXllci5jb25mICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMyArKysNCj4gPiAgcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0LWlu
aXR0YWJfMi4lLmJiYXBwZW5kIHwgNiAtLS0tLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBjb25m
L2Rpc3Ryby9pbmNsdWRlL3ZpcnRfY29uc29sZS5pbmMNCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
DQo+ID4gcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0LWluaXR0YWJfMi4lLmJiYXBwZW5k
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvY29uZi9kaXN0cm8vaW5jbHVkZS92aXJ0X2NvbnNvbGUu
aW5jDQo+ID4gYi9jb25mL2Rpc3Ryby9pbmNsdWRlL3ZpcnRfY29uc29sZS5pbmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjRkNTY4MDYNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvY29uZi9kaXN0cm8vaW5jbHVkZS92aXJ0X2NvbnNvbGUuaW5jDQo+
ID4gQEAgLTAsMCArMSBAQA0KPiA+ICtTRVJJQUxfQ09OU09MRVNfYXBwZW5kID0gIiR7QGJiLnV0
aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLA0KPiAneGVuJywgJyAxMTUyMDA7aHZjMCcs
ICcnLCBkKX0iDQo+ID4gZGlmZiAtLWdpdCBhL2NvbmYvbGF5ZXIuY29uZiBiL2NvbmYvbGF5ZXIu
Y29uZiBpbmRleCBmNzFjMTE3Li40NjFjNzNhDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvY29uZi9s
YXllci5jb25mDQo+ID4gKysrIGIvY29uZi9sYXllci5jb25mDQo+ID4gQEAgLTIwLDYgKzIwLDkg
QEAgTEFZRVJERVBFTkRTX3ZpcnR1YWxpemF0aW9uLWxheWVyID0gImNvcmUgbmV0d29ya2luZy0N
Cj4gbGF5ZXIiDQo+ID4gICMgT3ZlcnJpZGUgc2VjdXJpdHkgZmxhZ3MNCj4gPiAgcmVxdWlyZSBj
b25mL2Rpc3Ryby9pbmNsdWRlL3ZpcnRfc2VjdXJpdHlfZmxhZ3MuaW5jDQo+ID4NCj4gPiArIyBB
ZGQgaHlwZXJ2aXNvciBjb25zb2xlDQo+ID4gK3JlcXVpcmUgY29uZi9kaXN0cm8vaW5jbHVkZS92
aXJ0X2NvbnNvbGUuaW5jDQo+ID4gKw0KPiA+ICBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9y
dW5jID89ICJydW5jLWRvY2tlciINCj4gPiAgUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvY29u
dGFpbmVyZCA/PSAiY29udGFpbmVyZC1kb2NrZXIiDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvcmVj
aXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0LWluaXR0YWJfMi4lLmJiYXBwZW5kDQo+ID4gYi9y
ZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQtaW5pdHRhYl8yLiUuYmJhcHBlbmQNCj4gPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAxYjg5YWVjLi4wMDAwMDAwDQo+ID4g
LS0tIGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0LWluaXR0YWJfMi4lLmJiYXBwZW5k
DQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDYgKzAsMCBAQA0KPiA+IC1kb19pbnN0YWxs
X2FwcGVuZCgpIHsNCj4gPiAtICAgICAgIGlmIGVjaG8gIiR7RElTVFJPX0ZFQVRVUkVTfSIgfCBn
cmVwIC1xICd4ZW4nOyB0aGVuDQo+ID4gLSAgICAgICAgICAgICAgIGVjaG8gIiIgPj4gJHtEfSR7
c3lzY29uZmRpcn0vaW5pdHRhYg0KPiA+IC0gICAgICAgICAgICAgICBlY2hvICJYMDoxMjM0NTpy
ZXNwYXduOi9zYmluL2dldHR5IDExNTIwMCBodmMwIiA+Pg0KPiAke0R9JHtzeXNjb25mZGlyfS9p
bml0dGFiDQo+ID4gLSAgICAgICBmaQ0KPiA+IC19DQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+
ID4gVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRlbmRlZCBmb3IgdGhlIHNv
bGUgdXNlIG9mIHRoZSBuYW1lZA0KPiByZWNpcGllbnQocykgYW5kIGNvbnRhaW4ocykgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3ByaWV0YXJ5LA0KPiBwcml2aWxlZ2Vk
IG9yIGNvcHlyaWdodGVkIHVuZGVyIGFwcGxpY2FibGUgbGF3LiBJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQNCj4gcmVjaXBpZW50LCBkbyBub3QgcmVhZCwgY29weSwgb3IgZm9yd2FyZCB0aGlz
IGVtYWlsIG1lc3NhZ2Ugb3IgYW55IGF0dGFjaG1lbnRzLg0KPiBEZWxldGUgdGhpcyBlbWFpbCBt
ZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgaW1tZWRpYXRlbHkuDQo+ID4gLS0NCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IG1ldGEtdmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0DQo+ID4gbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3By
b2plY3Qub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2xpc3RpbmZvL21l
dGEtdmlydHVhbGl6YXRpb24NCj4gDQo+IA0KPiANCj4gLS0NCj4gIlRob3Ugc2hhbHQgbm90IGZv
bGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBh
dA0KPiBpdHMgZW5kIg0K


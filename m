Return-Path: <MANJUKUM@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69026E00A54; Wed,  5 Sep 2018 07:55:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.41.88 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 21744 seconds by postgrey-1.32 at yocto-www;
	Wed, 05 Sep 2018 07:55:07 PDT
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0088.outbound.protection.outlook.com [104.47.41.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68CD6E00953
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ibhGpVDAm3vWJG5hbzVl6W6+yfeOR4xiRteOQvhuCvo=;
	b=qiRA9fXxofNFBgN9/LpLA//HUkCAcfbIaRWXpZAjuIF9It5fXakb0DNCiiK6OoKywsi6ZfFvmvALsNaxM50tvGqtvXDvOumpRYHfFlMBeA0xGX3JpuMXfy+aCy/U1D3xrTv0TxDSHsURfTT8BRfh7uyTqIeo9hbN4S8Q94J58/Y=
Received: from BYAPR02MB4583.namprd02.prod.outlook.com (52.135.239.210) by
	BYAPR02MB4822.namprd02.prod.outlook.com (52.135.234.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1080.17; Wed, 5 Sep 2018 01:19:54 +0000
Received: from BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::ddc4:7ec3:e3df:4940]) by
	BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::ddc4:7ec3:e3df:4940%3]) with mapi id 15.20.1080.020;
	Wed, 5 Sep 2018 01:19:54 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: "Kleve, Jesse R" <jesse.r.kleve@lmco.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] xen-image-minimal: "No package
	kernel-module-xen-* available"
Thread-Index: AQHURK945mmR/fUrvEOphQRHtRV5OKTg426g
Date: Wed, 5 Sep 2018 01:19:54 +0000
Message-ID: <BYAPR02MB4583F6E6B4E51BD9FBE6B79AB9020@BYAPR02MB4583.namprd02.prod.outlook.com>
References: <58F40E73-9AC1-4BA3-A372-5E3BB48C4129@lmco.com>
In-Reply-To: <58F40E73-9AC1-4BA3-A372-5E3BB48C4129@lmco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR02MB4822;
	6:jp1shfdTeRb2noLX+kbagwa2J6X3fAjmDkrZZRmMG1SeODiAxqTC7x8AsdwlqtRsTFO8dmOos0jBiXIj/Bbrq0GwiBfsiKlsGFj3mHUKRcQ8mP/qodJMIb8UagI0Of84aZYGP5PQtIGkVkcKCeyNZ6h8TNuNWQ5hCPUKW+aLOFzAucAARiMXs6pC2qoPdrFs1rDL/GAqkkvEiU7bRbdgN5pDlGkwGLmrL/6qQfYF//z9L5CbRs7RFlKB7IVFruaKt6JxmvyJDZUkuhr/aaMVK/vC5ZrXnIRquJVyTxpmaZryoA5Y+DTMqPWFy+DWFyeZPFioFeo3SQ5gIyJoXrAN7xex2iB9IiapFxNLucAMi1UvUpZTewy+A0npibN/YMKSTv32yQ/EQtEGVyFERPslhicRTJc77FLt/vesPdrrATrwCuQSqRYD6boUlrfRC3XJwBNbH008W2NLfpFphj7ZTA==;
	5:GIYsdnkP619agKhzD5vzpoZYwJI6qKiJvp/AMKRFkgv40MQv1/F2GiAGRH32cCHGpMf7ZMAnHLaLHXtqGsck8zQgupwd9f7nRMkwvIoTEALXoz9ZeJxy3+GlOzz8SqzNq+1k2vQ9vF4ZK/oFaRrRYsgS46ZQelpdq1RS2TGcRqQ=;
	7:riVfdZvhAObXsyYkPP/eDstErReLCrm7bWYIjGpWdhs7PowBunyzIOPWLK4mpFrwhEbfsspqMjy/xKYTD+wz+s/LU3H6uRkcqFKSGtfQlGxoxq38Lw86GbWkxvEP9tn4RsRVyw7Yo7sdlhUu7V7n+E+TKkjDygg2h86nd2yKnmh7cADB6/BvIx/LtI4piVu6Ddi9/I2w/t4NG2PGUiZDmWJFmz3pX+a2kLma3pCIOSM+jLAmGCdj6+U9uVUBAPhf
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8cb43f91-8b47-4f56-7b58-08d612cdafc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4822; 
x-ms-traffictypediagnostic: BYAPR02MB4822:
x-microsoft-antispam-prvs: <BYAPR02MB482206FBECB57933AFA01F45B9020@BYAPR02MB4822.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699016);
	SRVR:BYAPR02MB4822; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4822; 
x-forefront-prvs: 078693968A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(199004)(189003)(13464003)(26005)(110136005)(68736007)(186003)(229853002)(6306002)(55016002)(2900100001)(6436002)(2501003)(5250100002)(9686003)(53936002)(5660300001)(33656002)(966005)(81156014)(81166006)(97736004)(478600001)(7736002)(256004)(6116002)(3846002)(14444005)(74316002)(8936002)(14454004)(102836004)(305945005)(446003)(6506007)(72206003)(53546011)(7696005)(86362001)(76176011)(66066001)(99286004)(486006)(11346002)(316002)(6246003)(105586002)(106356001)(25786009)(2906002)(476003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4822;
	H:BYAPR02MB4583.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: fmc+f0SYM4HDru1RmTODUf7s8zJmAeVJPCAiHbR2WqXSF1mKM013coY/u4gtPoxedpNrNoNSaz2/LFTKywSt6j0LRpPXt6Jc/WXT76VxK2Nsva9KMVulV99K9aS/37D9KLf67L46hXLxgjxtcO6v3FuMBzJWuiPr7vglrxzisHWRkoe3AziRESrCRRRAs+sShcnmDffFphm2mWGVfFfXVXdEmQ+L+s/VvasV9BE8gBHoMZuYWxKoTDNzrHSjgVSmwldMUFYnK7vbNlnfNHm61+FPgg9cL0w6z9AClZTcB9KP9zoinNparOSAGrkRkG8traAqOjIfRBqnvZEtnIVmOfjNuOINACCufbsuNFRCmbE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb43f91-8b47-4f56-7b58-08d612cdafc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2018 01:19:54.4684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4822
Subject: Re: xen-image-minimal: "No package	kernel-module-xen-* available"
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
X-List-Received-Date: Wed, 05 Sep 2018 14:55:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmVzc2UsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbWV0YS12
aXJ0dWFsaXphdGlvbi1ib3VuY2VzQHlvY3RvcHJvamVjdC5vcmcgW21haWx0bzptZXRhLXZpcnR1
YWxpemF0aW9uLQ0KPiBib3VuY2VzQHlvY3RvcHJvamVjdC5vcmddIE9uIEJlaGFsZiBPZiBLbGV2
ZSwgSmVzc2UgUg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMDQsIDIwMTggNToyOSBQTQ0K
PiBUbzogbWV0YS12aXJ0dWFsaXphdGlvbkB5b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFtt
ZXRhLXZpcnR1YWxpemF0aW9uXSB4ZW4taW1hZ2UtbWluaW1hbDogIk5vIHBhY2thZ2Uga2VybmVs
LW1vZHVsZS14ZW4tKg0KPiBhdmFpbGFibGUiDQo+IA0KPiBXaGVuIGJ1aWxkaW5nIHhlbi1pbWFn
ZS1taW5pbWFsIGZyb20gbWV0YS12aXJ0dWFsaXphdGlvbiAocHlybyksIEkgZ2V0IHRoZQ0KPiBm
b2xsb3dpbmcgZXJyb3IgaW4gZG9fcm9vdGZzOg0KPiANCj4gRVJST1I6IENvdWxkIG5vdCBpbnZv
a2UgZG5mLiBDb21tYW5kICcvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3
LQ0KPiBuby1wZXRhbGludXgvc2RzLXlvY3RvL2J1aWxkX3pjdTEwMi16eW5xbXAvdG1wL3dvcmsv
emN1MTAyX3p5bnFtcC1wb2t5LQ0KPiBsaW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZG5mIC15IC1jDQo+IC9kaXNrMDEvdXNlcnMvamts
ZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9idWlsZF96Y3Ux
MDItDQo+IHp5bnFtcC90bXAvd29yay96Y3UxMDJfenlucW1wLXBva3ktbGludXgveGVuLWltYWdl
LW1pbmltYWwvMS4wLQ0KPiByMC9yb290ZnMvZXRjL2RuZi9kbmYuY29uZiAtLQ0KPiBzZXRvcHQ9
cmVwb3NkaXI9L2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRh
bGludXgvc2RzLQ0KPiB5b2N0by9idWlsZF96Y3UxMDItenlucW1wL3RtcC93b3JrL3pjdTEwMl96
eW5xbXAtcG9reS1saW51eC94ZW4taW1hZ2UtDQo+IG1pbmltYWwvMS4wLXIwL3Jvb3Rmcy9ldGMv
eXVtLnJlcG9zLmQgLS1yZXBvZnJvbXBhdGg9b2UtDQo+IHJlcG8sL2Rpc2swMS91c2Vycy9qa2xl
dmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL2J1aWxkX3pjdTEw
Mi0NCj4genlucW1wL3RtcC93b3JrL3pjdTEwMl96eW5xbXAtcG9reS1saW51eC94ZW4taW1hZ2Ut
bWluaW1hbC8xLjAtcjAvb2UtDQo+IHJvb3Rmcy1yZXBvIC0taW5zdGFsbHJvb3Q9L2Rpc2swMS91
c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLQ0KPiB5b2N0
by9idWlsZF96Y3UxMDItenlucW1wL3RtcC93b3JrL3pjdTEwMl96eW5xbXAtcG9reS1saW51eC94
ZW4taW1hZ2UtDQo+IG1pbmltYWwvMS4wLXIwL3Jvb3RmcyAtLXNldG9wdD1sb2dkaXI9L2Rpc2sw
MS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby0NCj4gcGV0YWxpbnV4L3Nkcy15
b2N0by9idWlsZF96Y3UxMDItenlucW1wL3RtcC93b3JrL3pjdTEwMl96eW5xbXAtcG9reS0NCj4g
bGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3RlbXAgLS1ub2dwZ2NoZWNrIGluc3RhbGwg
bG9jYWxlLWJhc2UtZW4tdXMgbG9jYWxlLQ0KPiBiYXNlLWVuLWdiIHFlbXUgeGVuLWJhc2Uga2Vy
bmVsLW1vZHVsZS14ZW4tZ250ZGV2IHBhY2thZ2Vncm91cC1jb3JlLWJvb3QNCj4gbGlidmlydCBr
ZXJuZWwtbW9kdWxlLXhlbi13ZHQga2VybmVsLW1vZHVsZS14ZW4tbmV0YmFjayBrZXJuZWwtbW9k
dWxlLXhlbi0NCj4gYmxrYmFjayBrZXJuZWwtbW9kdWxlLXhlbi1nbnRhbGxvYyBwYWNrYWdlZ3Jv
dXAtY29yZS1zc2gtb3BlbnNzaCBydW4tcG9zdGluc3RzJw0KPiByZXR1cm5lZCAxOg0KPiBBZGRl
ZCBvZS1yZXBvIHJlcG8gZnJvbSBmaWxlOi8vL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nk
cy9wcm9qZWN0Ny1uby0NCj4gcGV0YWxpbnV4L3Nkcy15b2N0by9idWlsZF96Y3UxMDItenlucW1w
L3RtcC93b3JrL3pjdTEwMl96eW5xbXAtcG9reS0NCj4gbGludXgveGVuLWltYWdlLW1pbmltYWwv
MS4wLXIwL29lLXJvb3Rmcy1yZXBvDQo+IExhc3QgbWV0YWRhdGEgZXhwaXJhdGlvbiBjaGVjazog
MDowMDowMSBhZ28gb24gV2VkIFNlcCAwNSAwMDoxNzo1NCAyMDE4IFVUQy4NCj4gTm8gcGFja2Fn
ZSBrZXJuZWwtbW9kdWxlLXhlbi1nbnRkZXYgYXZhaWxhYmxlLg0KPiBObyBwYWNrYWdlIGtlcm5l
bC1tb2R1bGUteGVuLXdkdCBhdmFpbGFibGUuDQo+IE5vIHBhY2thZ2Uga2VybmVsLW1vZHVsZS14
ZW4tbmV0YmFjayBhdmFpbGFibGUuDQo+IE5vIHBhY2thZ2Uga2VybmVsLW1vZHVsZS14ZW4tYmxr
YmFjayBhdmFpbGFibGUuDQo+IE5vIHBhY2thZ2Uga2VybmVsLW1vZHVsZS14ZW4tZ250YWxsb2Mg
YXZhaWxhYmxlLg0KPiBFcnJvcjogVW5hYmxlIHRvIGZpbmQgYSBtYXRjaA0KPiANCj4gDQo+IA0K
PiBXaGVyZSBkbyB0aGVzZSBwYWNrYWdlcyBleGlzdD8gQW0gSSBtaXNzaW5nIGEgbGF5ZXI/IE15
IGJibGF5ZXJzIGlzIHNldCB0bzoNCj4gDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54
L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLQ0KPiB5b2N0by9zb3VyY2VzL3Bva3kvbWV0
YSBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRh
bGludXgvc2RzLQ0KPiB5b2N0by9zb3VyY2VzL3Bva3kvbWV0YS1wb2t5IFwNCj4gICAvZGlzazAx
L3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMtDQo+IHlv
Y3RvL3NvdXJjZXMvcG9reS9tZXRhLXlvY3RvLWJzcCBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xl
dmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0
YS0NCj4gb3BlbmVtYmVkZGVkL21ldGEtZWZsIFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2ZS94
aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLQ0K
PiBvcGVuZW1iZWRkZWQvbWV0YS1maWxlc3lzdGVtcyBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xl
dmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0
YS0NCj4gb3BlbmVtYmVkZGVkL21ldGEtZ25vbWUgXA0KPiAgIC9kaXNrMDEvdXNlcnMvamtsZXZl
L3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEt
DQo+IG9wZW5lbWJlZGRlZC9tZXRhLWdwZSBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUveGls
aW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS0NCj4g
b3BlbmVtYmVkZGVkL21ldGEtaW5pdHJhbWZzIFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2ZS94
aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLQ0K
PiBvcGVuZW1iZWRkZWQvbWV0YS1tdWx0aW1lZGlhIFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2
ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRh
LQ0KPiBvcGVuZW1iZWRkZWQvbWV0YS1uZXR3b3JraW5nIFwNCj4gICAvZGlzazAxL3VzZXJzL2pr
bGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9t
ZXRhLQ0KPiBvcGVuZW1iZWRkZWQvbWV0YS1vZSBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUv
eGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS0N
Cj4gb3BlbmVtYmVkZGVkL21ldGEtcGVybCBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUveGls
aW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS0NCj4g
b3BlbmVtYmVkZGVkL21ldGEtcHl0aG9uIFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxp
bngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLQ0KPiBv
cGVuZW1iZWRkZWQvbWV0YS1ydWJ5IFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngv
c2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLQ0KPiBvcGVu
ZW1iZWRkZWQvbWV0YS1zeXN0ZW1kIFwNCj4gICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngv
c2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLQ0KPiBvcGVu
ZW1iZWRkZWQvbWV0YS13ZWJzZXJ2ZXIgXA0KPiAgIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlu
eC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtDQo+IG9w
ZW5lbWJlZGRlZC9tZXRhLXhmY2UgXA0KPiAgIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9z
ZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtDQo+IHhpbGlu
eCBcDQo+ICAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRh
bGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS0NCj4gdmlydHVhbGl6YXRpb24NCj4g4oCcDQo+
IA0KPiBNeSBsb2NhbC5jb25mIGlzIG1vc3RseSBkZWZhdWx0IHdpdGggYSBmZXcgbW9kaWZpY2F0
aW9ucy4NCj4gDQo+IE1BQ0hJTkUgPSDigJx6Y3UxMDItenlucW1w4oCdDQo+IElNQUdFX0lOU1RB
TEwgKz0g4oCcbGlidmlydOKAnQ0KPiBESVNUUk8gPSDigJxwb2t54oCdDQo+IERJU1RST19GRUFU
VVJFUyArPSDigJx4MTEgeGVuIHZpcnR1YWxpemF0aW9u4oCdDQoNCkFyZSB5b3UgbWlzc2luZyBo
dHRwczovL2dpdGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L2Jsb2IvbWFzdGVyL21ldGEteGls
aW54LWJzcC9yZWNpcGVzLWtlcm5lbC9saW51eC94aWxpbngta21ldGEvYnNwL3hpbGlueC94ZW4u
Y2ZnID8NCg0KSXQgc2hvdWxkIGhhdmUgYmVlbiBlbmFibGVkIHVzaW5nIGh0dHBzOi8vZ2l0aHVi
LmNvbS9YaWxpbngvbWV0YS14aWxpbngvYmxvYi9tYXN0ZXIvbWV0YS14aWxpbngtYnNwL3JlY2lw
ZXMta2VybmVsL2xpbnV4L2xpbnV4LXhsbnguaW5jI0w0NQ0KDQoNClRoYW5rcywNCk1hbmp1DQo=


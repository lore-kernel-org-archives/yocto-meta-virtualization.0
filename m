Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE73EC19F20
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:49:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.2057.1683060539530594392
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=L75MoF6G;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683060540;
  x=1714596540;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qzp/WU+RjL0yT1CeepA9U1nAveY42b31gf1ATf1rDEU=;
  b=L75MoF6Gc3d/pCEMUquzyPsq/YdUijbhYKPzh8H21tinWczAFJM8Gpqz
   dJqRO11gqEl/TjzPNfdyPUQRLHsGEsbzY7PhMsNovRO1bPt4EfnX2eYur
   nGngs4HwuG4qQgvyVXnxMuhs4g8T83le1ULLZaTE8c207BKT4kW9Zzu2K
   99XK0lAAiaLP4hz/BwbMmFcc2IAZSfv1TxOzWmmca7LTheFgW2SRk13o9
   HusqUUXCSHELlK7GG503tZZJXiYD5bHQQlq3OdXHlBmbOrpMRezGHkgOK
   rA0z/zr5oSDPYRoKiUTiI8xRYD1Ow9p8f6877xj1b0CfkrhT1HLaoBubD
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu87s068RYgeTqMhbSfqkeT92fDYOLIwZ5jW20++sWbSqlDk2yH2Fr/+uoHJmrJ7bObgqHJIxRFVBCYNJvpTr9+JzBe1RdrgrQFQ7MI9XXpSr0yG2NyIRIALTc41RCl0frVd6E3lyTWXNzwxssMgAt/dBs8pP62K0kInjZQar589OmSKhDux3bXGmGGWuLwhG8kHBU+OobTh0puFVtNmuyvp+P0O9Ta4O1NFrSJCglOn+E9WKXQKuZdaZT+87LcbLvls9Y3LARNdeFGYM6Peptf7V9/QzTCqUeMptr4S0Ia0xhVeyU8yKhzYd4LCmpiiFL6RFauaRgSP/VJtx0UjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qzp/WU+RjL0yT1CeepA9U1nAveY42b31gf1ATf1rDEU=;
 b=kqfNLx4F1g3QA/SmClc5KartIVwBo8iVxq7aYjyvjZ7eTNB0/0Zig3TbC0I/RjdM+h+zc1he2nvqtINncmZeCADznxdXUeudYEPtQejSyfmDzOwsNpk9xFFHuZct37A6UhPM1URwnLGeKBYN5oiHXZWESJwL7NeKRmsgpCzwwdaqec69vvOrkQZ7D2cka6SKpxnLx6s5znTRrcEgMBy7kJL8/E6uK80sfgQaSFjZAqYozaHQHTbY6sK3ShFxpR2iY2q5I3uF/qkL+GOK5iSftZlCIUWofs+jpn+esgS8eeGS1SkO7jGXzwQskRRqK0cyWbw9JKb0sV+j8ZJhHCoCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qzp/WU+RjL0yT1CeepA9U1nAveY42b31gf1ATf1rDEU=;
 b=Qigi148pZGxCzcSfcZlhdhBmBlLpV69Keim28GaRngD4SdFitQdnVmjDzEQHXr4HajUl/rJYDnxBk0xz9Gay9TdvHmz9hSyhRDZw6boIGpgGmDa0DB4qdBCVHAYlT2tzosDVrzekfbjdGGqW45fVrTIW9NaO0oBWtbd2AwgFT70=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH 4/8] aardvark-dns: Fetch the crate
 instead of the Git repository
Thread-Topic: [meta-virtualization] [PATCH 4/8] aardvark-dns: Fetch the crate
 instead of the Git repository
Thread-Index: AQHZfTZ1235dCui91EOL6PptKfqXca9Hcskw
Date: Tue, 2 May 2023 20:48:54 +0000
Message-ID: <DB5PR02MB102132B06A11ED31A99E7B751EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230502202631.2102074-1-pkj@axis.com>
 <20230502202631.2102074-4-pkj@axis.com>
 <CADkTA4MENogff6ezzKLjf4AY=4NanzAGT98H=WeHN9YxbsDMSw@mail.gmail.com>
In-Reply-To: <CADkTA4MENogff6ezzKLjf4AY=4NanzAGT98H=WeHN9YxbsDMSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6352:EE_
x-ms-office365-filtering-correlation-id: 8250dd31-5ae6-4848-a0ee-08db4b4ea492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Blci/lVB4Fuv4dVhuEyB8ScoGWy/LY/XHSiizB0+hewGIud4KGmJAaEhGRlsCi40I432ilBNdPes7MJZ5GnpMbAJPwiGhRhYMPUJY28jfyuS5MGx3EgT+1yZ3+Bq09a1i1k9VwFbu8hT/cLFJ7qDWLIql9FAp5HfI+vkJhpxbfIEkIPrJTRfI7JqwwC5PBgDzxpdJhE74xoP1beJUKRXwZQ/BcNwkhXpxqpDH8g5t/r13QWlHSLfjxDKtMnCEy7RijhOGk3P0XaynTzE/ckhC267uzk1sPOsL3ByBDkA8BGkxyopAkinqVnRssBy7lAmRcm8QklsZqwyKu3QD8gAOORypaLKshMOzz2OYOg+tj0Nz3E8vAMzc2Lr+gZ1gcaiAt9y2fgk/uLiDZJBJiE+vD442xHkg/H7uI5v485spgncji8rFA69uv12t88sRRhOZRhaLpgrTYWTxLGMo3nKqPOJskEnemULsBTPuLH5EIbuEQb+ZcpOmpmgudegLLFB01WvWJ/6Ysc1mROXFr+fM8DM1IeusgjVuPw32Eva3YN0ekrfXi6BUlv/H+nChECkpbwwOVZr7JjuUYrIxC3dNI3iU0x5TaQyt/F+cHlaNnA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199021)(38070700005)(53546011)(38100700002)(6506007)(9686003)(122000001)(71200400001)(33656002)(186003)(7696005)(26005)(86362001)(83380400001)(41300700001)(64756008)(76116006)(66476007)(66946007)(66556008)(6916009)(316002)(66446008)(4326008)(5660300002)(55016003)(2906002)(478600001)(52536014)(8936002)(8676002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFd6anBaUzFTMld4VDliUmhMVnkvZzlHQ2E2TGVybGNNZGxyM1M3TjBaeWlx?=
 =?utf-8?B?T3FpZm01V2FjdDdybmc2d3Z1eW1YRHdIZlVzU3hUemJtZ1A1S1hrcmJLRVYx?=
 =?utf-8?B?UXBjdTRDenBsMElESEliMnRIbGtHMUlLUW9zSDNVU2xxaUcvNEd4WGhmM0I0?=
 =?utf-8?B?dWJqc3RXV1hMVXAxOXFPOGdIZ01PdngvcUJySU4wQXJXdDZreWttOG5tKzlq?=
 =?utf-8?B?WmxDbVlnMnFUTlJvY25IRmtzT3ZNVFU0MHJzTTJhbVIremdTdG1xaVgyVHQr?=
 =?utf-8?B?VjRxb2RUVDl6RmRzTTVtRWh0Vit2c2xRRC9aaTJKNUdVZ3M5cHpqdmQyZklV?=
 =?utf-8?B?M1JyQmNNVERMYkpyZDIxdFRZM3lhank2MVIwRXNsWjVUU0VyandxMmtlbzd1?=
 =?utf-8?B?eGs0WmhkWk9Nemp3UUZybU1MT3FHNFloRnpMemFPRG9qbi9YUW41b1lzTTI4?=
 =?utf-8?B?Y3RtWnQxQktpTXVtV3Frci84RG5xdTdSUWFIZVMzbXJvNXlPektVa01CaWl3?=
 =?utf-8?B?amo1bWlUU2JXTXZDb0FxMlRNMGp1c0dXTHZuV2luekxjYzhBVzhiaXlSdnZP?=
 =?utf-8?B?b1pjekxrTkxYMStsaDRpaURQdDNnRDdWT2dTeWFUMmV1VXZCektkdUJWVHJa?=
 =?utf-8?B?VmFENk1uL1Y3WGJUS3RPcGF0dWFFWmxGSzN0NUdpcUdkM3ZvY1NmeGRHbTlV?=
 =?utf-8?B?ZEdtelZWeFpWYk1HQWdlZDBjcnhvTGR4MW1nTmkzbWh3MWRGSjBuYTVCbmxP?=
 =?utf-8?B?a3pqdnVnbkZCWHVwT2VLcmNGN0V0eHd0RFhiTHZiMjcyN3FmTHFEeHR4UGgv?=
 =?utf-8?B?WENYdEQ4ZDJYZHB6VGc5Y2UzLzRhVUpsWjR4ZU90TEd2aDY4U1dUZy9ST004?=
 =?utf-8?B?T2RCVThRRmhmUmtLbDNqZlhYSG8xcURic0o4S3g5eWhOU0NpN1F4VjFOT29M?=
 =?utf-8?B?N1NWVkNKN0NxQnh3NFFUS0V6aFBUcWQ1cVhUTWNQOG9MWkRsV2lta2k1ODEy?=
 =?utf-8?B?N0taT1RXNXdxb2orcVlJU2IvTGZvV0dpMWhTenhIb1NnUUZTRERJdjc3ck0x?=
 =?utf-8?B?WFM4cmlOYzR3b3NMV0JnUmVZSCtPT0JJOWRSUHVPTWVrSmlDcmszd2ZEWUJ4?=
 =?utf-8?B?UFU2N0V4WnJkZnZQOXRTaXJRb0lKSmg1VUtmdGhPem9VelMzYTdpa0VqNWFE?=
 =?utf-8?B?amJuTllUMVFRa0JQcjR2a1EycktKb1JGdGpIeHlEaGtneGNkUXFnQjhqUmJw?=
 =?utf-8?B?dE9Hb0x6QVlWM1l0SVdUMkZQREtvenZ6bWlvTXAxV012QUl6SnVyNmpIdkZ3?=
 =?utf-8?B?Skd1ZUNDdlp3V1A3Z3REcmdKREdFUkV5bmc4US9pM3pmZmQxWHY0Y3E4UHVI?=
 =?utf-8?B?VGdCQ3ZxM3lBUS8ydUFCK2lkRGZVZUlqRWJRMzJuZFdtRkx4YlpiaGZncStF?=
 =?utf-8?B?SE9xZXZScmZGRkdRVDZqU2syaXlmSlBwTUIvNzQxemw0M2JiMHk1SE1TSXQ1?=
 =?utf-8?B?a3RkVjdhYi9PaGg0SjI0RWJMYmNxb2FsY2FYWDZDbE5iYWk3ZFY5dDA4UFFX?=
 =?utf-8?B?MUt3cTNzNldmVEtDVGd0RlRaVDc1VWc2NW05OThHK0JJcUdEWkUwKytWRkFy?=
 =?utf-8?B?RVhVdHN0Sm13VkVtV2hVQWN0RDVRdGdRR2dHcDN0ZU41VnRoc2V0UC9GTGli?=
 =?utf-8?B?ckE3akkza3p4UmdVTnY5a3ZkSUNsZE1DdEJuZlpNalVDZTJONG9JcDZ5WHZ1?=
 =?utf-8?B?b1ZCVGg3bHhlNFVFdkZPSE9Qc0xUQ2k3WllEUUlGZTJoMC9FTGE5cEZXNzYv?=
 =?utf-8?B?RW43T3FFdERhQ2JJalJ0dWE3SFNGMGVzZ0tQcVgwVjgrajk0ZUZ6YmFwc3Yz?=
 =?utf-8?B?VkNabloxUzYrUzUxNkNwVFlxZU44ckFSY1luSTQyeHFHN1VrdjYvRGMrVEM0?=
 =?utf-8?B?UE1pNkRlU3FUU3J0Wk5GT1FudXpER0pqc2k0aVlrV2ZnSURqVWFmOFlZTlZy?=
 =?utf-8?B?Y05IdkpucmVWWElXQW9OQldHay8xS3BUdkM0R1ZzbXhwVktOTTloVVI2ZHhu?=
 =?utf-8?B?a0hxYVBlWXJJa2lvOXdvczJEYXlpcGpiWFUzS1NqMU9pY1Rwb0VzWlRYajFU?=
 =?utf-8?Q?v6og=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8250dd31-5ae6-4848-a0ee-08db4b4ea492
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 20:48:54.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3uAbA7VEQdpayslf+01Kz7/Q5G1n4dxJ18+S0J7S5c9qu3JFU1nFwxf3XHqFFeu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6352
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8029

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1
Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMiBtYWogMjAyMyAyMjo0MQ0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENj
OiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBbUEFUQ0ggNC84XSBhYXJkdmFyay1kbnM6IEZldGNo
IHRoZSBjcmF0ZSBpbnN0ZWFkIG9mIHRoZSBHaXQgcmVwb3NpdG9yeQ0KPiANCj4gT24gVHVlLCBN
YXkgMiwgMjAyMyBhdCA0OjI24oCvUE0gUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0tDQo+ID4gIHJl
Y2lwZXMtY29udGFpbmVycy9hYXJkdmFyay1kbnMvYWFyZHZhcmstZG5zXzEuMi4wLmJiIHwgOCAr
Ky0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9hYXJkdmFyay1k
bnMvYWFyZHZhcmstZG5zXzEuMi4wLmJiIGIvcmVjaXBlcy1jb250YWluZXJzL2FhcmR2YXJrLWRu
cy9hYXJkdmFyay1kbnNfMS4yLjAuYmINCj4gPiBpbmRleCAxMDkwMWViLi5hYzJmYzZkIDEwMDY0
NA0KPiA+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9hYXJkdmFyay1kbnMvYWFyZHZhcmstZG5z
XzEuMi4wLmJiDQo+ID4gKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2FhcmR2YXJrLWRucy9hYXJk
dmFyay1kbnNfMS4yLjAuYmINCj4gPiBAQCAtNCwxNSArNCwxMSBAQCBIT01FUEFHRSA9ICJodHRw
czovL2dpdGh1Yi5jb20vY29udGFpbmVycy9hYXJkdmFyay1kbnMiDQo+ID4gIExJQ0VOU0UgPSAi
QXBhY2hlLTIuMCINCj4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciDQo+ID4NCj4gPiAtU1JDUkVWID0gImNi
MWE0NjJkZDg0MjdlMzMzNTVmNjkwNzM5NGEwNjQ2ZjVhMjZiZjIiDQo+ID4gLQ0KPiA+IC0jIGhv
dyB0byBnZXQgYWFyZHZhcmstZG5zIGNvdWxkIGJlIGFzIGVhc3kgYXMgYnV0IGRlZmF1bHQgdG8g
YSBnaXQgY2hlY2tvdXQ6DQo+ID4gLSMgU1JDX1VSSSArPSAiY3JhdGU6Ly9jcmF0ZXMuaW8vYWFy
ZHZhcmstZG5zLzEuMi4wIg0KPiA+IC1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vY29udGFp
bmVycy9hYXJkdmFyay1kbnM7cHJvdG9jb2w9aHR0cHM7bm9icmFuY2g9MSBcDQo+IA0KPiBJIG11
Y2ggcHJlZmVyIHRoZSBnaXQgZmV0Y2gsIGFuZCBhbSBpbmNsaW5lZCB0byByZWplY3QgdGhpcyBw
YXJ0IG9mIHRoZQ0KPiB1cGRhdGUuDQo+IA0KPiBJcyBzb21ldGhpbmcgYWN0dWFsbHkgYnJva2Vu
IHdpdGggdGhlIGdpdCBmZXRjaCA/IElmIHdlIGNhbid0IG1peCB0aGUNCj4gdHdvLCB0aGVuIEkn
bSBpbmNsaW5lZCB0byBzYXkgdGhlIGNyYXRlcyBzdXBwb3J0IGlzIGJyb2tlbi4NCj4gDQo+IEJy
dWNlDQoNCldoaWxlIHRoaXMgY2hhbmdlIGlzIG5vdCBzdHJpY3RseSBuZWNlc3NhcnksIEkgd2Fz
IGxvb2tpbmcgZm9yIA0Kc29tZSByZWNpcGUgaW4gdGhlIGNvbW1vbiBsYXllcnMgdG8gc2VydmUg
YXMgZXhhbXBsZSBmb3IgaG93IHRvIA0KdXNlIHRoZSBjcmF0ZSBmZXRjaGVyIHRvIGZldGNoIHRo
ZSBzb3VyY2UgZm9yIHRoZSByZWNpcGUncyBzb3VyY2UsIA0KYW5kIHRoZXNlIHR3byB3ZXJlIHRo
ZSBvbmx5IG9uZXMgSSBjb3VsZCBmaW5kIHRoYXQgZml0IHRoZSBiaWxsLg0KDQpCZSBhd2FyZSB0
aGF0IHRoaXMgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHBhdGNoIGZvciBuZXRhdmFyayBkbyANCm5v
dCB3b3JrIHVudGlsIHRoZSBmdW5jdGlvbmFsaXR5IGluIHRoZSBjcmF0ZSBmZXRjaGVyIGhhcyBi
ZWVuIA0KcmVzdG9yZWQgdG8gc3VwcG9ydCBmZXRjaGluZyB0aGUgcmVjaXBlJ3MgY29kZSB1c2lu
ZyBpdCAoc2VlIG15IA0KcGF0Y2ggdG8gYml0YmFrZS1kZXZlbCBmcm9tIGEgY291cGxlIG9mIGRh
eXMgYWdvKS4NCg0KLy9QZXRlcg0KDQo+IA0KPiA+ICtTUkNfVVJJID0gImNyYXRlOi8vY3JhdGVz
LmlvLyR7QlBOfS8ke1BWfSBcDQo+ID4gICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCINCj4g
PiAgcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYw0KPiA+DQo+ID4gLVMgPSAiJHtXT1JLRElSfS9n
aXQiDQo+ID4gK1NSQ19VUklbYWFyZHZhcmstZG5zLTEuMi4wLnNoYTI1NnN1bV0gPSAiMWY5ZDAx
MWU1ZWRhYTZlMGZhMDU1ZTM4M2JlYzAzYTQ2YzllZjM1ZGZhMzQ2ODgzYWViNWJmODZiNzk0YTk0
OSINCj4gPg0KPiA+ICBpbmhlcml0IGNhcmdvIGNhcmdvLXVwZGF0ZS1yZWNpcGUtY3JhdGVzIGZl
YXR1cmVzX2NoZWNrIHB0ZXN0DQoNCg==


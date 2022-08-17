Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F742C32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:28:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.31048.1660753686331551375
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KDS9Sg+R;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52289b5357=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCurSW002004;
	Wed, 17 Aug 2022 09:28:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=msXHllPsqX+CAI8gSEhWWqZgJrmEN4AglWlt+OzeAKI=;
 b=KDS9Sg+RwATQKwMua+RIvF0Mnuc01qgcgzLAiFfJLLKIQFSlwuzx2EFtQLuW4MvzDUss
 rUCqlryafSkwjl4N6IIL5GpBk1sWnmGmSGMyLfk//d8nJ82AnLePf6B8CfJcrADkotQQ
 wOmByk2r6iEHqCCu7Wvbw+D/PMCp/Bo26eZx4Kx9TLIeDgCmna5U66/sYZSavnrAOPg3
 XIlA5+a+lRqG9Ihpj2htbdsuEwYHEvCOPGs7PyEmUYknavAlE3xJWpmlTcMb04jQFH3g
 LWWtfrXEGEH49G99cWIEos4Wt+ul5QX2H8L7Ib5gJokBo8/0KXsy5AVbH6ZAwfS3LzVv FA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjkbqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 09:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJgGgWyHCe+hmoUsJ4xHB5hCbp6sRNQjRNufhAiXqgk+LKCvV/sbpVcYD5AvtywpawCCmUwk14W4KOK76cuOveqSvh6wyfTaBQTwtvmB1M/z030zKMgzZZR/2fHI0ob++4MreuF8+cpeQcq9UGRoeogMKAHSzFbcW6lxwJ8Ez5utBs1pWabjp4mVZfLWE6jrRu5jH5XqQJbZjGcAAYy7SBG1ovOgnQqtPDgXoYwof2NOHJ31GjfLSg/GE4PAOT90cVicwqOZ57hAb0AoUiYccqY1KeM4JNsaSC60AYNMJ/F9RsohY2p4uwSOuNlf13EWGHwmbZAi6hMWghb7/VsCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msXHllPsqX+CAI8gSEhWWqZgJrmEN4AglWlt+OzeAKI=;
 b=IbLI69fYPNzSij4RfcsyqjHGVBy8/VQnBuzWzWb3nvvMeNg2LZ9pbkrgqiotri067eCw2EPvcyML5cS4K5sSQDs9mYlGGq7j7xswo9Zgi0K1XACwcz47fHd+C/0r4M99ob1eK8LJGoMBbo5r7Zaf+qLtbs54iOmP0RBnhCpvQoQNVUNAR7EDxvzkzMXS7aCrPmGE/ExjHytX9uNa8o5Az/H4VJEIP6D231A30HuWHEwLQsbD5xN0+jiPBwzX/xkgF81cULFy5TvF5Vc7du9rzgA0BF81yztSh3FuJPWPdrAf+3asC58ROChSqEGShVgTH1Gxpp1w49UJ+RjLTd12Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 16:28:02 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::fd52:2da0:170b:8c37]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::fd52:2da0:170b:8c37%7]) with mapi id 15.20.5525.018; Wed, 17 Aug 2022
 16:28:02 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "Sajal, Sakib"
	<Sakib.Sajal@windriver.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
Thread-Topic: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15
 -> v15.2.17
Thread-Index: AQHYsOpuzZQuL1hMoUmkjcD8sfpX8K2zJqcAgAAkBTA=
Date: Wed, 17 Aug 2022 16:28:01 +0000
Message-ID: 
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed7b69af-68b5-430b-1e5c-08da806d7482
x-ms-traffictypediagnostic: DS7PR11MB6248:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TMe68AV8PevBsdI6g6dCF2frnafgRf6Ns0Uot9kSeKj/LI5zJs8VNq9AmWbXpczq/86FoTDBVN8kaxFe+yax9Q7t5w2hmHZEvVNmq7PaTXJ8BWdgbywqGO7QyrzpRoTpy5mE9vgOK2xRxM0usSVlEfojXcjz/6lXAnTRaTI/fM/fD50q7amEJMp+h0dMp/VEGdtThx6mnw3uwnZpXXKWT5LyUDkEtrULyGzuaouU7yUtsQhEsu7L4TkgLXjOR+mE6pFdaK9Zf9Tc3uf4Mr2tncOfKrtzyMwcqQEHvTh/dZWg+hi2RpCIvj7/sBH04bvgBxyr2c/jQiIkoG0LjuNj2rX+0ZH44tRzMdZDcEfpapoDBMA8g20mP5feYQrvDRyfW/1hEiSCvMqsTkYhkx04G/wxcrbjr/ck4p+g/4mSb4H5m7Lwb2uGPdgrhJdKRaImYn7irelUHiiufKhJeSoLBZl2DChLwPO4WteM0POq+mg6PhckEumh9zsfzqcTr4P/d8GN/mo2DtW1qtZ3YmTmRGF6DqT7k3s8BDWeWQE7+yMa/eyzMxydxF/kpiPapGtjPgiRMEuP0n72OXz1EehqmRHMpIMObGIRJza5LVTLpvtBeq9S/nK02tzrYkjUJFPsYbePxhoxM/bjwfaCUVlmq+qU6D/z6Sn/YLLPnY0ZrO1d/vODqMgSThxPh91NYg2O/ES+UBDOnulzIGb0wyaewvN0u80mGVUwrEMZfFWRQ4k99thwLxF17aYDUXcsLFD5FGG69B02msUH4M+y16PEQlRWV4XEsEncw67/F3O3WUFT+mmaEFqbiDmhXkPsEV517rcQbU7h5ldDzIM2sGCtzx4dpSrHabSnRXHFg59hURnkCJcRrKzHZ5Tqy0zeO8gy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(64756008)(83380400001)(186003)(33656002)(38070700005)(316002)(66476007)(122000001)(38100700002)(5660300002)(66946007)(76116006)(66556008)(8676002)(66446008)(26005)(6636002)(7696005)(8936002)(53546011)(2906002)(4326008)(9686003)(55016003)(41300700001)(86362001)(478600001)(71200400001)(52536014)(966005)(6506007)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkNtNysyTDRoMW5PeThDRWVCd2cwc0ZaeVJtQnlITlV6SkpJcnVpQk1xbjg1?=
 =?utf-8?B?V1R1b3BBbCsrZ2NvZC9pSUQ5QUhGa25rV0Z0M1JMb24yK3pMWjhUR1VGWnBi?=
 =?utf-8?B?K2IzRW9GbnJpUHdYSFNsakVkazRQQmpBSDhITHo3akpzZklEWXBnSVFCVHly?=
 =?utf-8?B?MUJITXlsVjhtc3ZudS9Uc3I1TTdjTm5qTURmSlVVMk94b3poVDNrdGM1N0VP?=
 =?utf-8?B?M20yY0lpR0s5NEFuRFE4RlU0N3p4eEJsejVkaDZhNm1iQmVCZkxHcWZJUUlI?=
 =?utf-8?B?TE96VkJKOWNTNlphMFdQZVZ6UEhLeEJTYWJHZGFaTmZtMmRtZFA0dXQ1S1ZY?=
 =?utf-8?B?SWsvZ0FDUldZcHZITXpMWDYvajVHOG11MmxoMVczRmo2VzBrbHY0TktUa3Ba?=
 =?utf-8?B?bTd1aGowK2JXaTlwWnV3OFhnVDF3YjdkOHpXS2htTFJyUWZpb3hNK2JEQjhX?=
 =?utf-8?B?dG12dEFRSFFvWEVhTENiUEJYOS9lSGxEQ3ZXQXNEb1JKS3E2ODNidDgvNFRq?=
 =?utf-8?B?all3SGF3djlRSFVXb04yZURhM1JDcWtvMk5ZdFJETmJPcGVUb1YwZFBaRStm?=
 =?utf-8?B?cTYrWEs2bmtvVUpBazdyWm80ak5TWjIxMFhNRGg1aGRxRHlKbFYyVXRqZm9T?=
 =?utf-8?B?bmxhK1M1SmtkR0d5RTF0UnB5bTlSbEtYN0lLWmtYcDk5R1JDM1FSUjkvbDFv?=
 =?utf-8?B?bEFld1hjYXVQc2ZkanA2ejRoeWtOVzlKSWFuTm5CVFlJVURjQUs1VWRGZnYr?=
 =?utf-8?B?T3p1eGdWYjVZbGc5SjdTWmdaNjF3VHU1eDJwaUxmOVFnYVJRY1NwSS9vZnNZ?=
 =?utf-8?B?V2RhRXNwSzhUNStkMW90ZWhMSDN4cHQ0M2EzK2hNdTdkUTF3QWcwT05aSGlr?=
 =?utf-8?B?S1QxWUZCMUVJK2RLcml0WU4wZVNqYWd2dEc5OWZ2N3pYSGRadG1KOFRjOXRO?=
 =?utf-8?B?dFE5NURKZHgzcW02NDZmYjBYZG5GYW9pZ29sQXVKSWNaSjB5clQ1elkyT0g4?=
 =?utf-8?B?Z2c3UjBQTjRxd1FqR2kzV05sOElzajA3MUszbmc5eFd4TFNsSWJacUFTMGdo?=
 =?utf-8?B?dEpIWjYweFZIbG8zNy9TQWYyMXhaNTE3Y0lzWXMzbnMrRSt5SXk2REVHVSs0?=
 =?utf-8?B?QnNVM0dxYmViL2UrRE1BeGxkS3dEQ3RJbENtejNBbkRhM2krTE9wNXA5c3VL?=
 =?utf-8?B?SXNZNXZ0ZWVUTDROdDBJcy9xZVhJTnVoSGhGeHBVeTArbE9tdDdPdGlMTW5V?=
 =?utf-8?B?WmNCMVRwb2t1MUE4ZWFSM21zT24zTVZRbWwvZWpQUWYyWXF3cEJyZTB5cU8y?=
 =?utf-8?B?U1g4MG1waE5DQmQ3SytQWTBDSG1jRzIyZDdUYy94VzZOWGFpdzhrUGlCNjJm?=
 =?utf-8?B?T0V0SmwrS0o4bmtTVFJEcVdtYXFKMXkzNWZkNGtFYyszaFpuUHpialZEUjNV?=
 =?utf-8?B?OHNQNmlBSVRyZVEzWWJPcHgxdkFXU2hoN0pDUVQzSGdiR3J6aGJGR294R1lO?=
 =?utf-8?B?UVVSdUJFYk92ejM0dWtzb3I1L3RTaHFKVHM3SnRkYXp6UUZLbi9kZUE5U2xS?=
 =?utf-8?B?Q0NDVG5ESEhzcmxSOG5OTnNROS9va2U0ejJIbDVybkpDSDlnSmJrT0t4MHZV?=
 =?utf-8?B?Yy9sNkxtNG5EWENybUg4STBDNCtlLzRuSGo1ZkdrY1oyaDVaeWxRL0V1UFpC?=
 =?utf-8?B?bEFtRjZ6VDUrTGVINGhWQU9rZzdDeTA2aEZ6anRBNDJZdFoxYTFOQzhDNDZu?=
 =?utf-8?B?VHNTdVV5ODI3emthL2NJdU1GZnZDN2pvQWEwcDFWOGRxMjdHTXRNYnJRNDdm?=
 =?utf-8?B?WW5TV1ExN3J4VklYU3B3Nll5NGx1ZlJpdnIvbUdLQ3Q0ZlhncXpmc24yWDNk?=
 =?utf-8?B?bjJITlNib2ZpNnVZczZ2TmFNNmlkczZ2WWtwY1RqQ2xOTEZmTGl3bWdHQnJa?=
 =?utf-8?B?UjVQTG8vQnZWNXZBTmNyd2cxS3NjL3ZmaW5EWll6bXQyeGlCbnFDTHUxZEk0?=
 =?utf-8?B?ZHdiR2E4TDZPTnVFY282akxVZW9vWmJmL09MNEdQN3pPRnlCUi9QT1M3Nzdo?=
 =?utf-8?B?UDFVSjJLQTNyMUFPaXZBY2dVUnVuNWh1N3FGK0E2MWFURzhFSW9RcHpSeUlK?=
 =?utf-8?Q?QRi1p6kJ1wZEN4HVbemm68l78?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed7b69af-68b5-430b-1e5c-08da806d7482
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 16:28:02.0352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 LaLvx6LajUoESb1Vw0o6+aosVyAmXYFCeHjxmVojkZs8HM7lV51RBsfz6qtrAFv7sXxtwrDbdTN96H+iAWujrijPUv9bHa1SHdkmdfQNddc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-Proofpoint-GUID: bx3eTzfH8atjmihteyixKY-SzHo-JyAT
X-Proofpoint-ORIG-GUID: bx3eTzfH8atjmihteyixKY-SzHo-JyAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_11,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=839 clxscore=1011 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:28:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7534

VGhlIENWRSBmaXggSSBzZW50IHlvdSBpcyBpbiB0aGUgdXBncmFkZWQgdmVyc2lvbiBvZiBjZXBo
LiAgICAgSm9lDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2Ug
QXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBB
dWd1c3QgMTcsIDIwMjIgNzoxOSBBTQ0KPiBUbzogU2FqYWwsIFNha2liIDxTYWtpYi5TYWphbEB3
aW5kcml2ZXIuY29tPjsgU2xhdGVyLCBKb3NlcGgNCj4gPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNv
bT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBT
dWJqZWN0OiBSZTogW2tpcmtzdG9uZV1bbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0hdIGNlcGg6
IHVwZ3JhZGUgdjE1LjIuMTUgLT4NCj4gdjE1LjIuMTcNCj4gDQo+IEkgYWxzbyBoYXZlIGEgcGVu
ZGluZyBwYXRjaCBmcm9tIEpvZSBTbGF0ZXIgdGhhdCBhZGRyZXNzZXMgYSBkaWZmZXJlbnQgQ1ZF
IG9uDQo+IGtpcmtzdG9uZS4NCj4gDQo+IENhbiBzb21lb25lIGxvb2sgYW5kIGNoZWNrIGlmIGl0
IGlzIGFsc28gY292ZXJlZCBieSB0aGlzIHVwcmV2ID8gQ2VwaCB0YWtlcyBhbg0KPiBpbmNyZWRp
Ymx5IGxvbmcgdGltZSB0byBidWlsZCBvbiBteSBzZXJ2ZXJzLCBzbyBJJ2QgbGlrZSB0byBhdm9p
ZCBhcyBtYW55IGJ1aWxkcyBhcw0KPiBwb3NzaWJsZS4NCj4gDQo+IEJydWNlDQo+IA0KPiANCj4g
T24gTW9uLCBBdWcgMTUsIDIwMjIgYXQgNTowMyBQTSA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBVcGdyYWRlIGNlcGggdG8gbGF0ZXN0IHYxNS54Lg0KPiA+IE1p
bm9yIHVwZ3JhZGUgY29udGFpbmluZyBmaXggZm9yIENWRS0yMDIyLTA2NzAuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNvbT4NCj4g
PiAtLS0NCj4gPiAgcmVjaXBlcy1leHRlbmRlZC9jZXBoL3tjZXBoXzE1LjIuMTUuYmIgPT4gY2Vw
aF8xNS4yLjE3LmJifSB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pICByZW5hbWUNCj4gPiByZWNpcGVzLWV4dGVuZGVkL2NlcGgve2NlcGhf
MTUuMi4xNS5iYiA9PiBjZXBoXzE1LjIuMTcuYmJ9ICg5OCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvcmVjaXBlcy1leHRlbmRlZC9jZXBoL2NlcGhfMTUuMi4xNS5iYg0KPiA+IGIvcmVjaXBlcy1l
eHRlbmRlZC9jZXBoL2NlcGhfMTUuMi4xNy5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXggOTglDQo+
ID4gcmVuYW1lIGZyb20gcmVjaXBlcy1leHRlbmRlZC9jZXBoL2NlcGhfMTUuMi4xNS5iYg0KPiA+
IHJlbmFtZSB0byByZWNpcGVzLWV4dGVuZGVkL2NlcGgvY2VwaF8xNS4yLjE3LmJiDQo+ID4gaW5k
ZXggMTdkYmNmMy4uOWZiMmU3MiAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWV4dGVuZGVkL2Nl
cGgvY2VwaF8xNS4yLjE1LmJiDQo+ID4gKysrIGIvcmVjaXBlcy1leHRlbmRlZC9jZXBoL2NlcGhf
MTUuMi4xNy5iYg0KPiA+IEBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL2Rvd25s
b2FkLmNlcGguY29tL3RhcmJhbGxzL2NlcGgtDQo+ICR7UFZ9LnRhci5neiBcDQo+ID4NCj4gPiBm
aWxlOi8vMDAwMS1TbmFwcHlDb21wcmVzc29yLmgtZml4LXNuYXBweS1jb21waWxlci1lcnJvci5w
YXRjaCBcICAiDQo+ID4NCj4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjVkY2NkYWZmMmVi
ZTE4ZDQzNWIzMmJmYzA2ZjhiNWY0NzRiZjZhYzA0MzJhNmEwN2QxNDRiN2M1NjcwMGQwYmYiDQo+
ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICJkOGVmZTQ5OTZhZWIwMWRkMmYxY2M5MzljNWU0
MzRlNWE3ZTJhZWFmM2Y2NTljMDUxMGZmZDU1MDQ3N2EzMmUyIg0KPiA+DQo+ID4gIERFUEVORFMg
PSAiYm9vc3QgYnppcDIgY3VybCBleHBhdCBncGVyZi1uYXRpdmUgXA0KPiA+ICAgICAgICAgICAg
IGtleXV0aWxzIGxpYmFpbyBsaWJpYnZlcmJzIGx6NCBcDQo+ID4gLS0NCj4gPiAyLjMzLjANCj4g
Pg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzc1MjMpOg0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmly
dHVhbGl6YXRpb24vbWVzc2FnZS83NTIzDQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xp
c3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvOTMwNDY0NjgvMTA1MDgxMA0KPiA+IEdyb3VwIE93bmVy
OiBtZXRhLXZpcnR1YWxpemF0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gPiBV
bnN1YnNjcmliZToNCj4gPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZp
cnR1YWxpemF0aW9uL3Vuc3ViDQo+ID4gW2JydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo+IA0KPiANCj4gLS0NCj4gLSBUaG91IHNoYWx0
IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0
IHRoZWUgYXQNCj4gaXRzIGVuZA0KPiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYs
IFN0YXIgVHJlayBJSQ0K


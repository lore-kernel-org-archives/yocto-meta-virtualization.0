Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAAEC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 13:58:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27406.1654869519581533829
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 06:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xoz+M7Ll;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25ACti2V012095;
	Fri, 10 Jun 2022 06:58:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=uoiK3BuaTik5la3JelBNZI0FikpiLeoQ29TslfTsSXc=;
 b=Xoz+M7LlBTg3klAKU2OHRu+gWvqW0TqNZ6RZ1eBJVgqlBo/vd6yTgk7EPXh6HY4T+Y0Q
 VjEQ5lRh50AvBarZwNfiAOy1Qmj+LmzT0Xt8iWw5QAKnFHWiDPZkoyleYj416GS436Hr
 G9+YLfoILWVyiG7/4+JK6AXVD3WuwU+Lwrl0z5ieovXz0+q3L3AEfBSTCQg0rxzz775/
 IcCZu+yvE7/Hax9OznrAcpjAEzRCwKbah+V8iGKcUMRJ87RohvysrZQOhTxpaEwz8ujK
 n5FAsSKbbgBWe4HR289b9YGDxtRj/Q/5uYfRrGQbqx/yx5VadZBpvmC7Mt9TvwXHQMb0 Sg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuwarcuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 06:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Idt7MbNYREVzqW0O4ntpNVS1pOzhImvC07+Wptbxkjv8FHkPFAugbPj2EQ0yH17cKDKxDOnvcjAKAK5erivNnsw80AXys/cvIT+hYT/2OH8hj/g/5rsb1iQOww+xhid1NoSnVrg2oaXSfX96eJ8Rtnm+sWWuLqu4sSFtZjYVc+tKizTIUeP4yo2O9Ru0EpbIcyktxF0B6vVNo0slX7PdXf37+7FpvzFUC6679B71Mcnp2eZX8+Kxl7KiTNMK+0ofbHJRV8JCKMAuxcrUzGp4xLnBL1SZxkipWtVtTMcuJNcj/C0paPmPJuJ/Cj5Cnw9boKgScpAN5hDA7FjkmrQn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoiK3BuaTik5la3JelBNZI0FikpiLeoQ29TslfTsSXc=;
 b=EhP1w9zv60UKPxlc/pInKBSGS3JWlNUkEHyuPkm77GEX2d3zHgwnLtjhvAA0dPvsBxleW0WqPgbM5S1xorZ2XosCJXYKplqaXKLNKfdR78NRHq/0Fu9B8pjUvrL9EaoItnZEMrCXF4SJuHDuI1KNQ/srlA6Bok/Nxcm9vF2CDT8BSj0ONbzKEsBbWslPWHGcGtX4IKnIMRPWI2tMTviPTWKQvYqGr33V7xPTWC6V0NGcs58zrxZto3/vGVX9jBZzc4H7Iy8jU1+o6v0VX3cbVf52OQsM/bWmHIvzO3nhH8LLIzd9QJ2Odicz3z2BC67VA7IMXtOmJpbbtJstbRFpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 13:58:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 13:58:34 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][master][kirkstone][PATCH 2/3]
 docker-distribution: fix build error on new hosts
Thread-Topic: [meta-virtualization][master][kirkstone][PATCH 2/3]
 docker-distribution: fix build error on new hosts
Thread-Index: AQHYfMof6TrppR/NkEiS0s1ROJk7zK1IqG5w
Date: Fri, 10 Jun 2022 13:58:34 +0000
Message-ID: 
 <CO6PR11MB56025C31C487BD7ECF4EA2C1EDA69@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20220610042053.4051-1-Qi.Chen@windriver.com>
 <20220610042053.4051-2-Qi.Chen@windriver.com>
 <CADkTA4OVCWoKY3TLAtAqzkGGUgsJt_Dgh=iHpwnDJdugWDD=tg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OVCWoKY3TLAtAqzkGGUgsJt_Dgh=iHpwnDJdugWDD=tg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d361a60-38e8-4b69-bd09-08da4ae94f5a
x-ms-traffictypediagnostic: SJ0PR11MB5630:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB563084EF7FCADA309D29997FEDA69@SJ0PR11MB5630.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NuLKPgn95hSnOXwUbzSnCOwo9jGXkVf3XimGBd008OanZI4DDSZJBKDV7XDoDr4dmCi+WWFUzc08XkitJGPxBFw5M1tw6VS6qhA8RQ4Ts6ByM22veAVBjzJkE9WtSKmDUxG3g8GAmnsfXPL3VFQpil44QUmAAEJqIYcupJMk0W49AxVu669PuA/AetrbinmI2pAqOZu+fTMLl7XuAvWYbuNKGB845TeeUcB8C0FdyWlqoLOFtKOfpAdxxtagQWM2Xsn2/KzfKP0US0PFK/uLCiFhyqUie/iLVQzjJIlF5VgsYkXP/FB0gIH6yyHOpEho/slK0Z87Is1dtla6WRK7P/IZWKUGkH5PuwMjBd2tRWJmxQyHQrQ5nahggO0J6uuXz7q87xrphvynF+OqgmqRpSYbBPvyoNHvYA1U6YNRivll4JnZRv4x2N9qyQ82AsNmmsSRfttVvP671T1kVu8SvdVKkd9BWBJnQJ+JFM4lEeicZR1wV0E/ok7LBcsScs8gecgBgMnlDtbvNlUe9Wp65Phx8ZntjEYNm3vVnvolfP/kljtA+BiqcURIq/+cc1+UQlRaNW0YNGD5fHdFL5xko4BF/YS0DzgYIRt4OQZxBosQTn6FcrCV1YMfjnKoeUzKaEQUKf1WuV2qZYLv+VkBz2MgVXzla3wxu14h0B6AEOxuF60keYlcmA4/cTWfSpjo+Jqmz9713LjMhQ1/RWxxP1rjWjiO/voC+V3KWWm5fhEjqnPyucJp/UJHPGWb2OocFojtsmMl6w0IQ+a2XLnCmkDh3JoYj2if6x4iJk4Mfj55gIrDM0uIC/34VIZG+5pmhoFh1aA9IRw5Ma2yNcHmqMoPjv1y+CtW7oXKB6CeAjjW5wbMdrfsVbir4koNdCgV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(83380400001)(38070700005)(186003)(86362001)(33656002)(38100700002)(76116006)(4326008)(66556008)(66446008)(966005)(66476007)(8676002)(6916009)(316002)(66946007)(55016003)(2906002)(52536014)(5660300002)(8936002)(9686003)(508600001)(26005)(7696005)(6506007)(53546011)(71200400001)(64756008)(9126006)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTBlTGpSV2FoWW42YkNEWktySWFwdm52bDYxRk1aT1JRbnJob2FGa0htZlhx?=
 =?utf-8?B?NTFscEpQakoxYVhpZXNjSnJ4cGVmQmlOU3RIcXFjcFgvd1gzZEg5TkJjdVJU?=
 =?utf-8?B?cFpabXNDU3VxVFJHYzI3eWtNZ2FnRE90OXh1cFlxR1M0eUVBYjdjL0NBb0pl?=
 =?utf-8?B?bWh4N2NQRVRPM1N1VitRRGhiQnBMR1hsVmRxYTI3YnpybVNkbThJM0c1WU1r?=
 =?utf-8?B?dXBoTWxkNnVvNkVmQ1VsbVp4c0hlSlBwUW1nMkV0MTVOREFNRGxEUnExdFN5?=
 =?utf-8?B?b2tNTFpmbWxCWmM4ck5UcHNNTXpLRzVweXZJaVZTbGwwMnN3THNGK3oyNXhZ?=
 =?utf-8?B?UUFCc29sWEUydzRUUFRjRWFMdW52dFQrMjN3WEJkSWQrUTdwei9QUEZFaldX?=
 =?utf-8?B?T1J1R1FiZmZNZmw5dzdWMHhPdGpBV0pXY3gvdTRyNmdnVDdjTEoyRTFLUjI1?=
 =?utf-8?B?RTc2SnpCTWJEN0ZsWjBvN0JCdE1TZ2RPekxIRnZMWW9mcnVyWHVrd1lyMW4x?=
 =?utf-8?B?bm5CZ1ROdldIS3krbGFFZkNRNERSaDZCZXhBUDF5M2hGbXd4R3Q1RTNYTk5j?=
 =?utf-8?B?ZXErMHM0dytoWFJiU0VSUkdubGJjMW5yZGQ4VFQwUDNSTEY5WGxCRTRVd3Jh?=
 =?utf-8?B?enlwdndVaC9LTkNOUzdFNkhDaE5UTzFxc0xUdmhqZG5QQWFJRyt4NVp0R2tt?=
 =?utf-8?B?WEpGOTNsZDhZc3BlUUdVNmUxTlZVUXBYN3MxRmFVMjNqUVUySUdDcjM1Y1VI?=
 =?utf-8?B?ZHFVWThTS2FMNGt4QUl3NncvdU5lRUFrSEwrLzM0Y2VwNko2NU5YaW9saGdH?=
 =?utf-8?B?cHBKeEhiU3FzMFlqNnhvcVU3VytEVXIvZW9LVlB1NHRyejRFMVplS1JpRFJ1?=
 =?utf-8?B?L1FRdU1zN2F0TUFmTkZLYVEwd0s3SHdtNWxVSVRNa1hDUEx2SVEzZDJEdWlp?=
 =?utf-8?B?d0tnRzR2VFovaHhOdHNnc3VPLzBBY2JGWlNiYlFPUFhWaXZDU3lpN2VYdVFr?=
 =?utf-8?B?cUlxbUc5TjRRYmYzbjU0Q2tuOFJBeHpPdFJGaFgrWlBUR29oYmZrVEtWOFRR?=
 =?utf-8?B?RzJESGZIUHFUNjNiMDVGeEJ5eVFrelo4S3VuSUJXUCtaWDhaYURYVS96WGZp?=
 =?utf-8?B?M0M2dWtUZGRPbW1lWVpiWjJJckhJa1Bia24zVWtaMzVoRzVISE96b0ZmSmVX?=
 =?utf-8?B?WTBCaG9kNzRtbllFeHdoNkJMWFRtTURtcjFFN2dLSStNREZnVVZJLzRJYlFU?=
 =?utf-8?B?cDJHN1R0cHd3MkswT1MyZkFJOVlFcDBISUkwZWNZOVFpVERiM2NYcGNvYW1j?=
 =?utf-8?B?MUR6ZENURHF4VmZHU1NZNjAyQ0tFa2RoOVFnYmRTazl3ZEpwQnVLTWRpUnNl?=
 =?utf-8?B?OEFkR1M4RnRacCs5aHJoQnBFVlhhdWMvRVhSd3RFZEhqOUpPUm9KNmcxYW1M?=
 =?utf-8?B?M1VHK1c0Y2pqOWNhdjhHZ1JWV2F5Vlo2bVFMUVBYM1QyY3JKS1ZjYjB3ZDBR?=
 =?utf-8?B?end1Q2tQZkZMYmtZNTE2YUp3VWxvaWIxemlVZUlFNlNGZGdHZStmblQ5aVZq?=
 =?utf-8?B?cFNBUFBZa2llUTV3bG5McFJnaFlvZGIvMU1QeWxnTGpaZCtCdmswTzJOU0o1?=
 =?utf-8?B?WkNHdHBTVFpHZ2hOcGNlL3AxemdZT3BBQzF2UEh3M1ZCeVF0M0VvN1JsUS9C?=
 =?utf-8?B?dm1jUUhtb1FRanB3VnhmZXRaeDVMS1FVQXQ1bGZGQUJBOXlNNHAvNTc4LytL?=
 =?utf-8?B?cTBGS3Z6VE16WlFzcDRPcXFHL0NUMTRrdEtWZm01V1hmT3NWOU84MURhNzJ1?=
 =?utf-8?B?alRlaGcyb0RGQ3ZSaEh4akJLcGhQVS9oaEx5WmVnRVcvRTZieVlCOVZGa0g4?=
 =?utf-8?B?SVVRem1mRkdwZGY1RzRLSUp6Ky9jU2tNQ2RhQnZOdHYySjd0TFBpaTBad1Ja?=
 =?utf-8?B?NFRkSUQ1TWs1aTg3K1YzT1p1bVN1dytFUVBoWkpJeXdwVzJCOFA4MWU1QkFN?=
 =?utf-8?B?cjBHRlVNZzdNVVJSZ0c3YTFNVjFYWHZVZ0YzY0JnUDF0TW42a2tZVDZ1bldx?=
 =?utf-8?B?TVRPT2p4R09PS0pHVHFyZ3pwcDJhL05NL0FYbE0xMVpNaUh0TGF5ME1hbDZw?=
 =?utf-8?B?ay9iSmpqamtsdjBQUXRHRUs5WEttQ0JkSTZHVHRKMFU1M1F6L0M0R1VVL0tC?=
 =?utf-8?B?Rmg4dk82U2xxS3RyVEJBTzRydllqbkNjR002MnRzWEI0RitSUnJQbGNpNnh0?=
 =?utf-8?B?SjFCZlJ5cnZzelBHc2RKYk1rUDcyQm8wMzN0dms4K1NZUWF5cEMxMVFSenRI?=
 =?utf-8?B?L3ZvczZNRGQ1Rng3UE1QdWdYWWdDQ3R3VXpwVENLT2ZDazd6VDVFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d361a60-38e8-4b69-bd09-08da4ae94f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 13:58:34.4898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 c/NLF/VyKHBFBmuRQQa4KO4m/MDOF1SdfAbyhFAlT39HmfXI/Ca1oOA6LWllf7uHxm3Cq2EbIKr8TFXXNdbdcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5630
X-Proofpoint-ORIG-GUID: 2_GoQpgOsRBdCUhJsWxzwIy9m_xRn7QM
X-Proofpoint-GUID: 2_GoQpgOsRBdCUhJsWxzwIy9m_xRn7QM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100057
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 13:58:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7368

SGkgQnJ1Y2UsDQoNCkdvdCBpdC4gSSdsbCBhZGp1c3QgdGhlc2UgQ0dPX1hYWCBzZXR0aW5ncyBh
bmQgc2VuZCBvdXQgVjIgbmV4dCB3ZWVrLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFp
bC5jb20+IA0KU2VudDogRnJpZGF5LCBKdW5lIDEwLCAyMDIyIDk6MDEgUE0NClRvOiBDaGVuLCBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVttYXN0
ZXJdW2tpcmtzdG9uZV1bUEFUQ0ggMi8zXSBkb2NrZXItZGlzdHJpYnV0aW9uOiBmaXggYnVpbGQg
ZXJyb3Igb24gbmV3IGhvc3RzDQoNCk9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEyOjIxIEFNIENo
ZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+DQo+IFRoZSBDR09fQ0ZMQUdT
IGFuZCBvdGhlciByZWxhdGVkIHZhcmlhYmxlcyBoYXZlIGFscmVhZHkgYmVlbiBzZXQgDQo+IGFw
cHJvcHJpYXRlbHkgYnkgdGhlIGdvLmJiY2xhc3MgaW4gb2UtY29yZS4gU2V0dGluZyB0aGVtIGlu
IHRoaXMgDQo+IHJlY2lwZSBpcyBub3Qgb25seSB1bm5jZXNzYXJ5IGJ1dCBhbHNvIGVycm9yIHBy
b25lLg0KPg0KPiBGb3IgZXhhbXBsZSBDR09fQ0ZMQUdTIGlzIHNldCB0byB1c2UgQlVJTERTREtf
Q0ZMQUdTLCBhbmQgdGhpcyBpcyANCj4gaW5jb3JyZWN0LiBXZSBuZWVkIHRhcmdldCBmbGFncyBp
bnN0ZWFkIG9mIFNESyByZWxhdGVkIGZsYWdzLiBTdWNoIA0KPiBzZXR0aW5nIGhhcHBlbnMgdG8g
d29yayBmb3Igc29tZSBob3N0cy4gSG93ZXZlciwgd2hlbiBidWlsZGluZyBvbiANCj4gbmV3ZXIg
aG9zdHMsIHdlIGdldCBRQSBlcnJvciBsaWtlIGJlbG93Og0KPg0KPiAgIEVSUk9SOiBkb2NrZXIt
ZGlzdHJpYnV0aW9uLXYyLjcuMS1yMCBkb19wYWNrYWdlX3FhOg0KPiAgIFFBIElzc3VlOiAvdXNy
L3NiaW4vcmVnaXN0cnkgY29udGFpbmVkIGluIHBhY2thZ2UgZG9ja2VyLXJlZ2lzdHJ5IHJlcXVp
cmVzDQo+ICAgbGliYy5zby42KEdMSUJDXzIuMzQpKDY0Yml0KSwgYnV0IG5vIHByb3ZpZGVycyBm
b3VuZCBpbiANCj4gUkRFUEVORFNfZG9ja2VyLXJlZ2lzdHJ5PyBbZmlsZS1yZGVwc10NCj4NCj4g
VGhlIGFib3ZlIGVycm9yIHdhcyBmb3VuZCBvbiBoYXJka25vdHQgb24gaG9zdCBGZWRvcmEgMzUu
DQo+IFRyYWNraW5nIGRvd24gdGhlIGVycm9yIGFuZCBJIGZvdW5kIGl0J3MgdXNpbmcgaG9zdCBz
dHVmZiB3aGljaCBpcyANCj4gbGlrZWx5IHRvIGJlIGNhdXNlZCBieSB1c2luZyBpbmNvcnJlY3Qg
Q0dPX0NGTEFHUy4gQXMgdGhlIG1hc3RlciANCj4gYnJhbmNoIGlzIHVzaW5nIHRoZSBzYW1lIHNl
dHRpbmdzLCBpdCBoYXMgdGhlIHNhbWUgaXNzdWUuDQoNCkFuZCBhcyBJIG1lbnRpb25lZCwgZmVl
bCBmcmVlIHRvIGFkanVzdCB0aGUgZmxhZ3MgYW5kIGV4cGxpY2l0IHNldHRpbmdzLCBidXQgSSB3
b24ndCBiZSBkcm9wcGluZyB0aGVtLg0KDQpJJ3ZlIGJlZW4gdGhyb3VnaCA2IHllYXJzIG9mIGdl
dHRpbmcgdGhlc2UgcmVjaXBlcyB3b3JraW5nLCBhbmQgY29udGludWFsbHkgYmVpbmcgYnJva2Vu
IGJ5IGNoYW5nZXMgaW4gdGhlIGNvcmUgY2xhc3Nlcywgc28gSSdtIG5vdCBnb2luZyB0byBkcm9w
IHRoZSBleHBsaWNpdCBzZXR0aW5ncy4NCg0KQnJ1Y2UNCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgLi4uL2RvY2tlci1kaXN0
cmlidXRpb24vZG9ja2VyLWRpc3RyaWJ1dGlvbl9naXQuYmIgICAgICAgfCA5IC0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgDQo+IGEv
cmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1kaXN0cmlidXRpb24vZG9ja2VyLWRpc3RyaWJ1dGlv
bl9naXQuYmIgDQo+IGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1kaXN0cmlidXRpb24vZG9j
a2VyLWRpc3RyaWJ1dGlvbl9naXQuYmINCj4gaW5kZXggMWQwNzRiZjMuLjY3OWJjZjhiIDEwMDY0
NA0KPiAtLS0gDQo+IGEvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci1kaXN0cmlidXRpb24vZG9j
a2VyLWRpc3RyaWJ1dGlvbl9naXQuYmINCj4gKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tl
ci1kaXN0cmlidXRpb24vZG9ja2VyLWRpc3RyaWJ1dGlvbl9naXQuYg0KPiArKysgYg0KPiBAQCAt
MjMsMTcgKzIzLDggQEAgaW5oZXJpdCBnbyBzeXN0ZW1kDQo+ICBFWFRSQV9PRU1BS0U9IkJVSUxE
VEFHUz0nJyINCj4NCj4gIGRvX2NvbXBpbGUoKSB7DQo+IC0gICAgICAgZXhwb3J0IEdPQVJDSD0i
JHtUQVJHRVRfR09BUkNIfSINCj4gICAgICAgICBleHBvcnQgR09QQVRIPSIke1dPUktESVJ9L2dp
dC8iDQo+IC0gICAgICAgZXhwb3J0IEdPUk9PVD0iJHtTVEFHSU5HX0xJQkRJUl9OQVRJVkV9LyR7
VEFSR0VUX1NZU30vZ28iDQo+IC0gICAgICAgIyBQYXNzIHRoZSBuZWVkZWQgY2ZsYWdzL2xkZmxh
Z3Mgc28gdGhhdCBjZ28NCj4gLSAgICAgICAjIGNhbiBmaW5kIHRoZSBuZWVkZWQgaGVhZGVycyBm
aWxlcyBhbmQgbGlicmFyaWVzDQo+IC0gICAgICAgZXhwb3J0IENHT19FTkFCTEVEPSIxIg0KPiAt
ICAgICAgIGV4cG9ydCBDRkxBR1M9IiINCj4gLSAgICAgICBleHBvcnQgTERGTEFHUz0iIg0KPiAt
ICAgICAgIGV4cG9ydCBDR09fQ0ZMQUdTPSIke0JVSUxEU0RLX0NGTEFHU30gLS1zeXNyb290PSR7
U1RBR0lOR19ESVJfVEFSR0VUfSINCj4gICAgICAgICBleHBvcnQgR09fR0NGTEFHUz0iIg0KPiAt
ICAgICAgIGV4cG9ydCBDR09fTERGTEFHUz0iJHtCVUlMRFNES19MREZMQUdTfSAtLXN5c3Jvb3Q9
JHtTVEFHSU5HX0RJUl9UQVJHRVR9Ig0KPiAgICAgICAgIGV4cG9ydCBHTzExMU1PRFVMRT1vZmYN
Cj4NCj4gICAgICAgICBjZCAke1N9DQo+IC0tDQo+IDIuMzYuMA0KPg0KPg0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM3MzU2KTogDQo+IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS83MzU2DQo+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzkxNjYy
MjE4LzEwNTA4MTANCj4gR3JvdXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogDQo+IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWIgDQo+IFticnVjZS5hc2hm
aWVsZEBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg0KLS0NCi0g
VGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFk
bmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2Fu
ZGFsZiwgU3RhciBUcmVrIElJDQo=


Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB751EB64D7
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 02:55:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2017.1687834508553894619
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 19:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gTZ9pkdD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55426a6bdc=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35R2mmi0022886;
	Mon, 26 Jun 2023 19:55:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=LUL7t/L4IlCaHxqonrgZNydpOBftqZq0jjL5+sDLwUU=; b=
	gTZ9pkdDxYnD0sPJCiIJdw8P+wTW0AmbOFA2oz5k39PH+ODGF+SzAo3Iy+qkWp59
	5nNjJe4ioRP9BaqiXj8HZcR3mHBpNQXHJSgT7mg8oRCUF6hKwSfsWCmYssYQLtD4
	Rk58R8ndwt/i8W0pr32NCNsvRsJVqvlhhI491aDJdgOa1hocctckNag+GXBeUBNX
	Mck0Iu+ujP1GGwvJ5KKdop1we3V/24HDiurK30gO5BHO7BMnWSfhPi+MiYV/y/xb
	Z81GjFlc9oiZGHPpcve9kjg9y4eqDHFrfObAC3LvYw4VMieMckOP9WfUyeP8LLLO
	kp8x6s7jami7rclVHr3/uw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb1j5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 19:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frsOv01+cKarggVOI/6r37cBTylfu/IJgJnI+V3HYc0y3O0NCaQteJUPkHkuLNeEDlDOmq+0zh4KFgd2qfIwor2NW8b0EPNzL9tZDYCjyM1dw00IetNOAQqFwNJ3oa79Q47BjfjWUrPrKg94W1hagXwahcdYeeli4q+fJ0wjDVMkTNerLosB9DJglRs7VhnQyECIk/YnQNp8ldRL1cNO3ukTHMpoyzg8BT7amGZ6BuTp4z8JJ6cps5IT3OlyhOO211wzl7svwT17nOUuR9jB6Yl8bUGNLi5a7sN9BZ3+FicMFA5v1JqFi0IGuSFU3+SSYQMlv/k2U2HPoYliO1DC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUL7t/L4IlCaHxqonrgZNydpOBftqZq0jjL5+sDLwUU=;
 b=bL/NJV+LaMEE6a0rza9bqcDYqaAGPwfJb77Ydk8n9q8thUsEnAihDQ5ZyPZBXqj74r2YllxjilUffThn0+r6FlMLz6RLonbMrpaDu8k3xR24D85hg3CrckYbUreN4ONbl0k0Cz3Y/UleHAazK++mNbpFkK1IQ6ul6unqjjvMi+7bkmjiLbFO8V0+GnVykblO5CSpm9FwGP1C7lYLF93au1xdCFZm+NG7pbp/CNsccZhZ5+ewHCYul/3kSUJ4fZhw+xQjPSsxJ14P/SqEepzeFCBpWV//sa+BL5BJt6+jOiB2V5/gP7p+zLvyPOaRPks+U0C9uNaXYv/BxAG7W/JLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 02:55:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 02:55:01 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 2/2] meta-virt: rename
 containerd-opencontainers to containerd
Thread-Topic: [meta-virtualization][PATCH 2/2] meta-virt: rename
 containerd-opencontainers to containerd
Thread-Index: AQHZp/mt1w8Qr6ygzU21AkirXKehrK+c+wP9gAD6g2A=
Date: Tue, 27 Jun 2023 02:55:01 +0000
Message-ID: 
 <CO6PR11MB5602CB97E85B2463294E82FBED27A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230626064420.1012760-1-Qi.Chen@windriver.com>
 <20230626064420.1012760-2-Qi.Chen@windriver.com>
 <176C2405FDA29323.6977@lists.yoctoproject.org>
 <CADkTA4OseSk3cukcf4eOePhRHHqjLBNOk9x-Ap0-nby0a5-EgQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OseSk3cukcf4eOePhRHHqjLBNOk9x-Ap0-nby0a5-EgQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB7386:EE_
x-ms-office365-filtering-correlation-id: 5879bca9-2e28-4c57-0683-08db76b9e6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sknzcOpJzvsX3JmdLRnKlakKXwS5T1xwZc4WrBFvbtM3oZXnXpNfYkYQypnemvbZ4PCp/JBK8F55IEQdzOfo1/2mBUMMShc/RfX46/rG0SdMb8/4IbYpdGoBtl/5D7CWW8QS5qrqhIaUzsklWBvI6iko+o9kL8mOE7sDS2upAOr0zD3PPGqY6xPGxal448zFB/Z64njEBoMaRnqtgR1HMhmBoRffSqxOu1fHESodC7mDRshn2A0Xde+ZzgMIpXHEpgm2Irdtqkeqa1a0mbychTED0u2zgS3+EtcwTF/2wKrkcG1l2ne5LaMGdXU9CMilY5kMsg56uFXsnRdVY3yZ5QpDESQF9zuIEo4F9aUezDhdnWw5e68OMwmzH1C+IzlfdWMY2dn0tydLwqFwLyTg+qMqu3s9CW6D8Q2yUb1KofPRo3QB/sVmxGb5djc9ClgRWuw/DUDDS75y9pFNNwv3LJAlkkDm0Ead+miNO6o/kERjaWKQIwqGi7EBwchgdpR0jrAWYUoxDIZ0IWtxck1JYw5PpDVQE5ntFOd8n5o6ZU1DFjG/xPxoZPoMmMjyE+35ivoFeFVCorW/Wi9n+6vivQ1OecQvZAINxflzEplAEE4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(5660300002)(52536014)(66946007)(66556008)(66446008)(4326008)(76116006)(6916009)(33656002)(66476007)(64756008)(478600001)(316002)(66899021)(8676002)(8936002)(2906002)(966005)(55016003)(38070700005)(86362001)(41300700001)(7696005)(71200400001)(186003)(9686003)(53546011)(26005)(6506007)(38100700002)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFBSaWN3VHFkSjNiSTNXNnVUN0RjOW4yZ0dqamlSMmZmdC92NWZLQUVVeWNY?=
 =?utf-8?B?bEVqRDNYZ0RyOVBBNVF0VGJUTlNrQUw4WWVYSUcrQ2p1Wnk4SHpwa0pzV25o?=
 =?utf-8?B?RmQyZTJOUi9XZjhNZ1YxWm9hL0RPVlNaOEMwMVdjQUJ2MjBVSzZEUVlxOEtP?=
 =?utf-8?B?YXhwd2s3TC8zY1NJelo4MEkyRWwvdjJyQjZTbWFqRnlCSWNyaVMwUy9OOWxB?=
 =?utf-8?B?WGJ5YVlNTlhmSFJMR1c4OGZXeXRvbTZoUXJMMkhUUUYyMXZOUndDWTl6Q2lZ?=
 =?utf-8?B?OE15VTV0Z1IzQ3RYYmhzOHhaL1ZvUXN5TGtLSG1mTWxWUm1QdmpRYzVqUklM?=
 =?utf-8?B?cjBoV3pYZWNJdXRSdUxkK0pxR002MXR0V1pWODB5QkJsT1RUb3JOd1Y3QmFr?=
 =?utf-8?B?SDAxTFZDUm9qdmNnSjFTdk51b3lUL3dCTHV3UTRkTUp0YWFFVDNZZVdwUDcz?=
 =?utf-8?B?VG9oMGVIWDlqK3lGb05jcm84ZGdlcEZ0SGUvWTJ0MmtHYnF0d1g5NjZYM3Y1?=
 =?utf-8?B?aEk5STkzSU5OWndSdlpnaTg5NWJxMmtmQWVXeklrV0pFYWJCZUZucDVkYW5F?=
 =?utf-8?B?aERhL0lJZnEzWG5ZNE55VzdjTmhCaWJXbzJNL3k3VjB0MVRjYmREeUVQK2Rp?=
 =?utf-8?B?bFh3amlZQmg4NkYyd1d4Z01kNWptUTNjdGkwZ3BWMDVhSUNMa1pKZFE1U1VW?=
 =?utf-8?B?NFJJNlFLWk9kcmYvZ2MySFlLSURtbVpVTy9Tc0E5ak1IM0h1ZDVpaUZDVysy?=
 =?utf-8?B?THpwRTlsZ0xNclJwd1FQM0VwM3lIeHEvVy9ISW9Pd0ZHZXhrUVJhWTB6NE9S?=
 =?utf-8?B?YjlEakVYaStRSkthUnZEYjlCTkJrTEhIQjh6UGpiVVRBZ3M2aFZNckdleHVD?=
 =?utf-8?B?bmNBZkZ3UzRuUjA1OG1KUmpzdURad2VZTjFBYlVqK1AreVBwQm8xWWErZTVU?=
 =?utf-8?B?eURHOEtEdjhPN3VwdDd2Smpqell5b3dBR2FmR1Z3SkNyZ1VCM2ZueDYzUTlw?=
 =?utf-8?B?U2ZhbHJ6S0swRmh0TWhmS0lZTmJJcm5GSnhrMWI1WnlYZ0pOZllUZnRrdlkx?=
 =?utf-8?B?N3FQK3NNOTZpL1B2dE8zYmVoejdIa3lZQ2dLNTY2RHpiQmF6dEJOQW93TlUx?=
 =?utf-8?B?TWpsZUczRm9zelJxWU1Ja1M4NlF4SnM2eFlmWFBQdmMvbXZhNk9iM3pJZ2Zx?=
 =?utf-8?B?bG5vSi9sRkd0UmgyTGkwNVBTd1J2MDNEUzd6Yk9YQUFUbjM2OTA4c2hHZ0E1?=
 =?utf-8?B?SExQdGRZb2hnSmhERGZ3NGtxZXY0WUNuYkVPT1NkL0p3QjRVNk92cUo0Y3Uz?=
 =?utf-8?B?VHlxRTRsaHIwRmpQMEg5OXRKUndPWWlYNjN2c1RyK3Bqa0VBeFAzbVZCOXdV?=
 =?utf-8?B?Nzlza1BsU0RJajJ0UVRnTVB4ckM4ZVczRHJhdEV5cUEza0ExTlR3bmIvYlp1?=
 =?utf-8?B?L1FGZEdleUNMeEZzMEppRXF4QXc5Rmw5MUNqU2E1a0ZmNGwyQmJEQkdSeEx4?=
 =?utf-8?B?TFhBNE1ZcklDVk5iYnUxL0JJdTBlYk02eWJzbzdVTkp5cDlCeGZXMXFhNVor?=
 =?utf-8?B?TjZVQVBzUzk0MHExZzBWUVh6WUdPcG9DejU3b0pnak5sZTNZclNwblEyQjZW?=
 =?utf-8?B?MDZJRDJkeDBFd3E4V0FTcytLOWZsMmFBME1PV3haeklpOWNCcStwOHlmcTB4?=
 =?utf-8?B?cVNBMUJWVFlBMlI3K2dXVVlHZEFTVi82YWl5dGRZb1FKajB0b3VoNTNFdHRj?=
 =?utf-8?B?NmpBM1BNTkVrcnlEczRBWitwQitlZjBnQlRBaE9OTFdYbnRvUHhmUlpWNHF5?=
 =?utf-8?B?UnNvS2FqOGtLM3VwVEM5SEk2VzdhanNyQWt1YU9LczlLa2V6Q2lrT1RwbGRV?=
 =?utf-8?B?M0dvV05SREowV1djYTYweHk4MEN0OGNkcE9wQ08rUDdWQWp1UkZxVWZobjVw?=
 =?utf-8?B?L1M0Um51M09KZ0xOZmtMMGFKbko3UENibTM4SVpDQlZtb3hQell2QTN1SWNn?=
 =?utf-8?B?UTdONC82MllIcmJhNHZZUDI4OUIxakxxa3VCdXBEZ216SzNPb3pYbXNITGVt?=
 =?utf-8?B?U1JyclhiWVhVYmtmaWF1Q3ZLQWRsRnp5ZnNjWTdZN2JqNW5vVlJXN3gxSG9G?=
 =?utf-8?Q?yLC0m0oICwJw8Hio1A3rC5+0v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5879bca9-2e28-4c57-0683-08db76b9e6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 02:55:01.8923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8udEMKKDpJyXZ/3f4aq3/f9B8Q5qTyJL0QL5Mj6utUmp8zpRHGLgq14Js7nCEsTcg2MVfKEFcnTEfFLl+GBrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-Proofpoint-GUID: y449DF_eBS43zApwqI-0DlbTOurMEjhP
X-Proofpoint-ORIG-GUID: y449DF_eBS43zApwqI-0DlbTOurMEjhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_20,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270026
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jun 2023 02:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8112

R290IGl0LiBUaGFua3MuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gDQpT
ZW50OiBNb25kYXksIEp1bmUgMjYsIDIwMjMgNzo1OCBQTQ0KVG86IGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbQ0KQ2M6IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+OyBtZXRhLXZpcnR1
YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0
dWFsaXphdGlvbl1bUEFUQ0ggMi8yXSBtZXRhLXZpcnQ6IHJlbmFtZSBjb250YWluZXJkLW9wZW5j
b250YWluZXJzIHRvIGNvbnRhaW5lcmQNCg0KT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMzoxMuKA
r0FNIEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxicnVjZS5hc2hm
aWVsZD1nbWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+DQo+IE9uIE1v
biwgSnVuIDI2LCAyMDIzIGF0IDI6NDTigK9BTSBDaGVuIFFpIHZpYSBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnIA0KPiA8UWkuQ2hlbj13aW5kcml2ZXIuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0K
PiA+DQo+ID4gV2UgaGFkIHR3byBjb250YWluZXJkIHJlY2lwZXMsIGNvbnRhaW5lcmQtb3BlbmNv
bnRhaW5lcnMgYW5kIA0KPiA+IGNvbnRhaW5lcmQtZG9ja2VyLiBCdXQgbm93IHdlIGhhdmUgb25s
eSBvbmUgY29udGFpbmVyZCByZWNpcGUuDQo+ID4gV2Ugc2hvdWxkIGp1c3QgdXNlIHRoZSBuYW1l
ICdjb250YWluZXJkJy4NCj4NCj4gV2UgY291bGQsIGJ1dCB0aGVyZSdzIGFsc28gbm8gcHJlc3Np
bmcgbmVlZCB0byBjaGFuZ2UgaXQgKG90aGVyd2lzZSwgSSANCj4gd291bGQgaGF2ZSkuDQo+DQo+
IEknbGwgbGVhdmUgdGhpcyBhcy1pcywgc2luY2UgdGhlcmUgYXJlIGFjdHVhbGx5IHNvbWUgbGF5
ZXJzIHdpdGggDQo+IGluY2x1ZGVzIHRoYXQgSSBkb24ndCBmZWVsIHRoZSBuZWVkIHRvIGJyZWFr
IGF0IHRoZSBtb21lbnQuDQo+DQoNCkkgc2hvdWxkIGNsYXJpZnkgdGhhdCB0aGlzIGlzIHNvbWV0
aGluZyBJJ2xsIG1vbml0b3IgYW5kIHF1ZXVlIGZvciB0aGUgbmV4dCByZWxlYXNlLCBvbmNlIEkn
dmUgY29uZmlybWVkIHRoYXQgbWlncmF0aW9uIGhhcyBiZWVuIGRvbmUuDQoNCkJydWNlDQoNCj4g
QnJ1Y2UNCj4NCj4gPg0KPiA+IFRoZSBwcmV2aW91cyBDVkVfUFJPRFVDVCBzZXR0aW5nIGluIGNv
bnRhaW5lcmQtb3BlbmNvbnRhaW5lcnMgaXMgDQo+ID4gZGVsZXRlZCwgYXMgaXQncyBubyBsb25n
ZXIgbmVlZGVkLg0KPiA+DQo+ID4gVGhlICdjb250YWluZXJkLW9wZW5jb250YWluZXJzJyBpcyBh
ZGRlZCBpbiBQUk9WSURFUyBhbmQgUlBST1ZJREVTIA0KPiA+IGZvciBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2
ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICBjb25mL2xheWVyLmNvbmYgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gPiAgLi4ua2VmaWxlLWFsbG93LUdP
X0JVSUxEX0ZMQUdTLXRvLWJlLWV4dGVybmFsbHktc3BlY2kucGF0Y2ggfCAwDQo+ID4gIC4uLi8w
MDAxLWJ1aWxkLWRvbi10LXVzZS1nY2ZsYWdzLXRvLWRlZmluZS10cmltcGF0aC5wYXRjaCAgIHwg
MA0KPiA+ICAuLi4ve2NvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiID0+IGNvbnRhaW5l
cmRfZ2l0LmJifSB8IDYgDQo+ID4gKystLS0tDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKSAgcmVuYW1lIA0KPiA+IHJlY2lwZXMtY29udGFpbmVy
cy9jb250YWluZXJkL3tjb250YWluZXJkLW9wZW5jb250YWluZXJzID0+IA0KPiA+IGNvbnRhaW5l
cmR9LzAwMDEtTWFrZWZpbGUtYWxsb3ctR09fQlVJTERfRkxBR1MtdG8tYmUtZXh0ZXJuYWxseS1z
cGVjDQo+ID4gaS5wYXRjaCAoMTAwJSkgIHJlbmFtZSANCj4gPiByZWNpcGVzLWNvbnRhaW5lcnMv
Y29udGFpbmVyZC97Y29udGFpbmVyZC1vcGVuY29udGFpbmVycyA9PiANCj4gPiBjb250YWluZXJk
fS8wMDAxLWJ1aWxkLWRvbi10LXVzZS1nY2ZsYWdzLXRvLWRlZmluZS10cmltcGF0aC5wYXRjaCAN
Cj4gPiAoMTAwJSkgIHJlbmFtZSANCj4gPiByZWNpcGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC97
Y29udGFpbmVyZC1vcGVuY29udGFpbmVyc19naXQuYmIgPT4gDQo+ID4gY29udGFpbmVyZF9naXQu
YmJ9ICg5NiUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvY29uZi9sYXllci5jb25mIGIvY29uZi9s
YXllci5jb25mIGluZGV4IA0KPiA+IDlmZjYxZjEuLmNiZDc1ZjUgMTAwNjQ0DQo+ID4gLS0tIGEv
Y29uZi9sYXllci5jb25mDQo+ID4gKysrIGIvY29uZi9sYXllci5jb25mDQo+ID4gQEAgLTQwLDcg
KzQwLDcgQEAgTEFZRVJSRUNPTU1FTkRTX3ZpcnR1YWxpemF0aW9uLWxheWVyID0gIiBcICANCj4g
PiByZXF1aXJlIGNvbmYvZGlzdHJvL2luY2x1ZGUvdmlydF9zZWN1cml0eV9mbGFncy5pbmMNCj4g
Pg0KPiA+ICBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9ydW5jID89ICJydW5jLW9wZW5jb250
YWluZXJzIg0KPiA+IC1QUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9jb250YWluZXJkID89ICJj
b250YWluZXJkLW9wZW5jb250YWluZXJzIg0KPiA+ICtQUkVGRVJSRURfUFJPVklERVJfdmlydHVh
bC9jb250YWluZXJkID89ICJjb250YWluZXJkIg0KPiA+ICBQUkVGRVJSRURfUFJPVklERVJfdmly
dHVhbC9kb2NrZXIgPz0gImRvY2tlci1tb2J5Ig0KPiA+DQo+ID4gICMgU2FuaXR5IGNoZWNrIGZv
ciBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyLg0KPiA+IGRpZmYgLS1naXQgDQo+ID4gYS9yZWNp
cGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC9jb250YWluZXJkLW9wZW5jb250YWluZXJzLzAwMDEt
TWFrZWYNCj4gPiBpbGUtYWxsb3ctR09fQlVJTERfRkxBR1MtdG8tYmUtZXh0ZXJuYWxseS1zcGVj
aS5wYXRjaCANCj4gPiBiL3JlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQv
MDAwMS1NYWtlZmlsZS1hbGxvdy1HT19CVQ0KPiA+IElMRF9GTEFHUy10by1iZS1leHRlcm5hbGx5
LXNwZWNpLnBhdGNoDQo+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+ID4gcmVuYW1lIGZyb20g
DQo+ID4gcmVjaXBlcy1jb250YWluZXJzL2NvbnRhaW5lcmQvY29udGFpbmVyZC1vcGVuY29udGFp
bmVycy8wMDAxLU1ha2VmaWwNCj4gPiBlLWFsbG93LUdPX0JVSUxEX0ZMQUdTLXRvLWJlLWV4dGVy
bmFsbHktc3BlY2kucGF0Y2gNCj4gPiByZW5hbWUgdG8gDQo+ID4gcmVjaXBlcy1jb250YWluZXJz
L2NvbnRhaW5lcmQvY29udGFpbmVyZC8wMDAxLU1ha2VmaWxlLWFsbG93LUdPX0JVSUwNCj4gPiBE
X0ZMQUdTLXRvLWJlLWV4dGVybmFsbHktc3BlY2kucGF0Y2gNCj4gPiBkaWZmIC0tZ2l0IA0KPiA+
IGEvcmVjaXBlcy1jb250YWluZXJzL2NvbnRhaW5lcmQvY29udGFpbmVyZC1vcGVuY29udGFpbmVy
cy8wMDAxLWJ1aWxkDQo+ID4gLWRvbi10LXVzZS1nY2ZsYWdzLXRvLWRlZmluZS10cmltcGF0aC5w
YXRjaCANCj4gPiBiL3JlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQvMDAw
MS1idWlsZC1kb24tdC11c2UtZ2NmbA0KPiA+IGFncy10by1kZWZpbmUtdHJpbXBhdGgucGF0Y2gN
Cj4gPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gPiByZW5hbWUgZnJvbSANCj4gPiByZWNpcGVz
LWNvbnRhaW5lcnMvY29udGFpbmVyZC9jb250YWluZXJkLW9wZW5jb250YWluZXJzLzAwMDEtYnVp
bGQtZA0KPiA+IG9uLXQtdXNlLWdjZmxhZ3MtdG8tZGVmaW5lLXRyaW1wYXRoLnBhdGNoDQo+ID4g
cmVuYW1lIHRvIA0KPiA+IHJlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmQv
MDAwMS1idWlsZC1kb24tdC11c2UtZ2NmbGFnDQo+ID4gcy10by1kZWZpbmUtdHJpbXBhdGgucGF0
Y2ggZGlmZiAtLWdpdCANCj4gPiBhL3JlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRh
aW5lcmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiIA0KPiA+IGIvcmVjaXBlcy1jb250YWluZXJzL2Nv
bnRhaW5lcmQvY29udGFpbmVyZF9naXQuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk2JQ0KPiA+
IHJlbmFtZSBmcm9tIA0KPiA+IHJlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5l
cmQtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ID4gcmVuYW1lIHRvIHJlY2lwZXMtY29udGFpbmVy
cy9jb250YWluZXJkL2NvbnRhaW5lcmRfZ2l0LmJiDQo+ID4gaW5kZXggYzgwNGNhYS4uYWI0MWE2
YyAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC9jb250YWlu
ZXJkLW9wZW5jb250YWluZXJzX2dpdC5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9j
b250YWluZXJkL2NvbnRhaW5lcmRfZ2l0LmJiDQo+ID4gQEAgLTIwLDggKzIwLDggQEAgQ1ZFX1ZF
UlNJT04gPSAidjEuNy4xIg0KPiA+DQo+ID4gICMgRVhUUkFfT0VNQUtFICs9ICJHT0RFQlVHPTEi
DQo+ID4NCj4gPiAtUFJPVklERVMgKz0gInZpcnR1YWwvY29udGFpbmVyZCINCj4gPiAtUlBST1ZJ
REVTOiR7UE59ID0gInZpcnR1YWwtY29udGFpbmVyZCINCj4gPiArUFJPVklERVMgKz0gInZpcnR1
YWwvY29udGFpbmVyZCBjb250YWluZXJkLW9wZW5jb250YWluZXJzIg0KPiA+ICtSUFJPVklERVM6
JHtQTn0gPSAidmlydHVhbC1jb250YWluZXJkIGNvbnRhaW5lcmQtb3BlbmNvbnRhaW5lcnMiDQo+
ID4NCj4gPiAgUyA9ICIke1dPUktESVJ9L2dpdC9zcmMvZ2l0aHViLmNvbS9jb250YWluZXJkL2Nv
bnRhaW5lcmQiDQo+ID4NCj4gPiBAQCAtOTksNSArOTksMyBAQCBJTlNBTkVfU0tJUDoke1BOfSAr
PSAibGRmbGFncyBhbHJlYWR5LXN0cmlwcGVkIg0KPiA+ICBDT01QQVRJQkxFX0hPU1QgPSAiXig/
IShxZW11KT9taXBzKS4qIg0KPiA+DQo+ID4gIFJERVBFTkRTOiR7QlBOfSArPSAiICR7VklSVFVB
TC1SVU5USU1FX2NvbnRhaW5lcl9ydW50aW1lfSINCj4gPiAtDQo+ID4gLUNWRV9QUk9EVUNUID0g
ImNvbnRhaW5lcmQiDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+DQo+ID4NCj4gPg0KPg0K
Pg0KPiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3Ig
Y2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgDQo+IHRoZWUgYXQgaXRzIGVuZA0KPiAtICJVc2UgdGhl
IGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KPg0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM4MTA3KTogDQo+IGh0dHBzOi8vbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS84MTA3DQo+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzk5NzgyODgx
LzEwNTA4MTANCj4gR3JvdXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbGVhdmUvNjY5MzAxNy8xMDUNCj4gMDgx
MC85NzgwNTg0NzUveHl6enkgW2JydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4NCg0KDQotLQ0KLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5V
TEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZA0K
LSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==


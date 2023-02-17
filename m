Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAFEC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 13:56:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6773.1676642199490774750
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 05:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L560XUjX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HC1VOs012210;
	Fri, 17 Feb 2023 05:56:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KFlAHyTSt1UOn65Reb3LgHvbbvKjI8jezGCmpXWXuVs=;
 b=L560XUjXF5FVl2wjRlKKgT/vpkGNpwjUY7KQVdlUAVFTYqkh/relPQqAOtGzwFWmguAC
 6Y/VgcKz9pon0+y+S0uFpbJVuuYZyUkH0f7RkaP7dLM0lPvZlTUNMwKXQhc/gvzAst3W
 KwT9UUDDzhDNqhYtx/e5szkGnTcBtcODwqGWeWU7C1fiwhUIi2VHBxiB+0aPSRafrTM4
 3qEyfxtThQaZj3v+AWdcyGItFMbErWG6hcRwJdIcOsF5XgbQu+PlJ9es74Du2Zo3OMk+
 GXpspKtX/n/asKONQBaJiY6x3NNrMUK74LzUlgCgbkRWGdkqSHmoPRAXXojvbgyuTPaD mw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc111gn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 05:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkTUumNjWMEu6b6T4iBqg6nSFRWL7FicYuwCtnUHjGIqjyjiLL7t0QzGlGe+POrPyEJXWJ0Ke7jFLePvXrYX3/uNdjsXqH/oiNt0hYotPANnqTW1jWyqPP7PKtOe4AHNqfGT14k6/AGH8LpSzXu3rW2m7xd/Sr2l2Mu4aX/w5DSHlc1f0jx3DuSo4RZX3JNQrD44BsNii8Xaa/rCqRnJ8gG7nJsBQdbOgVfR1cVdS+dgMHpS5iRfv5cYhJ9yncUim8FSuKFNCQyDEVzqdFVmp0/PIb/tLlp9BYpPwY1jE915Hzau+tt0AFAJrlPb8Kfb7pbgDnSRU50abYW5f0nZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFlAHyTSt1UOn65Reb3LgHvbbvKjI8jezGCmpXWXuVs=;
 b=FY65M1b/bo/90CXQ8h+MunnKkcJ4gRzDau2VEBk0QZPz6+xv8A9XvuRvMSf+hKvdOKeEKrKghFUmRKkpG02c5qw0uaEiazWxt8pLrzJ0l0kmmMbmyvhL//coHEoouVVo5QzBAXwZ4pjmdnht4SHvmdqm+/JxiwleWlAzdZ/IAUOyQ9HRwgXpYVpZWpL7LXu0zIl0H5Pnkid78BCj46/Oj4sHg9rkq1rq/UmmJ0I/Zpm53OCERxuoDwY5MbJOvN8pANHrvYJY7PfPfjvKbo8O9Prl0wd8iAQCmltW+7ZpKBENzrVhV5gvC7DLD3PLQmwfL1Qoc83XZaPV/j6l9XkqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 13:56:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 13:56:35 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Topic: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Index: AQHZQpFBJU/R7HzAmEy7AkW97uVQNK7TJ74AgAAAawA=
Date: Fri, 17 Feb 2023 13:56:35 +0000
Message-ID: 
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
 <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB6423:EE_
x-ms-office365-filtering-correlation-id: 5e4dcd2b-dc18-41c2-5c89-08db10eec885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k8BNTwWdbNoL3moOMnato2ic8/ZogDAQ3R2w8NVyffi9DxA4uym1F9QrMA5AAzjL6rc/lvO5q0eYVp8+FZG3rQh19k5ts46UxpZ2sj9eXzGV0c0Rc88Ca1bidNELr6OcfwC87fLHTydqpWGjoK6IPRZgc79KN0gHJFP9RqS+X/pQmXAbnjOy55nKTQiPOBzC3PjbyLYG9M6YU2fsmLttVE1ebc+BbpFPbGrxbuuc9akUla2Rm3wlaEKTYcX5PInKGz6U+gUOvtJLQXNPr0/OzL6VLFgPaZEOJVT3y/pJ/xM9XMUeyMbSIFzIinrMBf4FhpUTJc+ML5+hkS0gSDnB7jROojaI1RWi7EWI0Ryd5dqRRf9tFJQp2A/CUABZGDbeKxx13ZJAfSXUqvUiB9XUBY7Ya1nfvJi3x30Dsa2p5YYa0XgCATXq7CKH8LJ3FsuGJAcRs3jXuvhHE2NS+rrfvOXpOqVoXmS6umeKbxzN5s3h3ZSW+1CbgSIWOnujOsB2bkl0z1EnvdSv2PY/gctScEN9ZEuDWtPKBAqf6brulvHDMW7kb5I1i5X1nEmi2W0ybQ2cP/YC+DVHO9d7EIwHsC/INXcsapMeRzFsbhFY3dvHbMFsyMapny1X1qQ4fJdbzVTLdzPqBC2AYqqB+xArhs25iMBcmWcPUgxwvBtjneijYyZHmfqlAjUPXSFhcaEezD8vUTy5JDPITOuqcIYXQ6fOndcL5WE/8FOE87segmY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(451199018)(6916009)(7696005)(966005)(316002)(8936002)(71200400001)(478600001)(66899018)(66556008)(66476007)(76116006)(64756008)(66446008)(66946007)(8676002)(4326008)(53546011)(41300700001)(26005)(186003)(6506007)(52536014)(5660300002)(55016003)(38100700002)(2906002)(83380400001)(9686003)(38070700005)(33656002)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFBpVWlwcDdmbURMbnZTQTF5WHVkbmJEZ2xOMldMNWs1VlhvQ2lLZmNIMmJa?=
 =?utf-8?B?ZW5PaVlBY2plV0xoeVNGeHZDMlczcm0weGRDcFVCQmdma01hdk9xQjF2NXBW?=
 =?utf-8?B?bFR3N0JGamd4VGdBdUlJNGVIcC9nMmtYUVA4akp4T0ptTEFoeFVsUTUwWXh2?=
 =?utf-8?B?Vk1PSTd5dlo0QVpjVFp6cUZGK2JOT3NOaW45TDUwTDgzNzJlbG5VY3pYSUdi?=
 =?utf-8?B?OUxFaVN4UkllNmh2N05wMjdMYitHU1BXZWYvcXZPV3FrbXA5RmUvT0VnWk9B?=
 =?utf-8?B?WGE5Sm5hRmJxbFIraXFMc0FJaGtWMVhFUFc4UkZBMGNITDVkSHJrWGhCR1g2?=
 =?utf-8?B?ajdOa1VBcVM2WUY0NGpBZUxYK2hNcFlETllVUjZJUkF1VVRNK05EZ2loUjJu?=
 =?utf-8?B?bzJtSmFraVJSdlNmdHRvVWYrQlpOWmlER01hczhMYVFZQURFWHV1K2FSeGwr?=
 =?utf-8?B?OElIOG5iSFNucUR6Qk1nS2ZuMkRUb0oybHJOUFhDeDVqNGdPSC8wVk5rbjR5?=
 =?utf-8?B?MkZQNU9HOVlZYkpmMXpEWUpsZzZqSDZkL2dnUmJNM0U1MnFGcGgyVXlocHBx?=
 =?utf-8?B?QVNVL0czRElFWGJ4aEQyTy9XU3g0anR6SEhpczJ5QitSYUhiaklWUTVPOUwy?=
 =?utf-8?B?KzNtNVlFUHVBeEpodFl2NGVhcm83YXI2TWZ2Qkh6UlJkWnhQVWRIUTN6a3Bl?=
 =?utf-8?B?cVFINGpSYmlhaU9IN0ZvWFBZdmFJd0pEejJoL2RuWHEzSzNwc0pZdndHM1RC?=
 =?utf-8?B?bWVEQ3pEcVpkaDlQZlJDWHlkdjM5NC9tbWJPcVpmaXNuTVZWUUY0SkIxYnBN?=
 =?utf-8?B?Qkx4MGNlRUpmWTRUR3lHaCtiUEkzd2RLZTVld1ppa1lkUCtodk9xMXpqK1o0?=
 =?utf-8?B?WHRUQXpxNG5XVHUyU0pTM3MzTEg0RnJEWDJETFZtVHRSaVhSMVpnYUwyRytY?=
 =?utf-8?B?SFRGMmc4RWFPdmszRkcwbnhWcjAzMVhndlZkSG9MclF5TENXSzZiUlE3SGVY?=
 =?utf-8?B?U2dOcmcwcG1tcE93ZU41YWhSZzY5d3JmLzBvSW1ZdjR1WnBVL1FMdzlCNGVz?=
 =?utf-8?B?MHFjbG12eXFZbUVIWTkxdCtZUitiYXVCRXR1VTZDYktISHFKWVAxdTBnZHpz?=
 =?utf-8?B?V1phdDFIMVQxdkU0Zk8veFMyQ2trT294Tm9GdWhqajQ4YVdCMzIwcHBEQkNM?=
 =?utf-8?B?b24xd2FGakplZmNVcnBTNFEyRzNBK2xQRGMrL2h2aW1Qdzlxc2p5enMwY21i?=
 =?utf-8?B?eHRVRE9zOWRhdWhRV3gvVU1FbUFibTVZWXJEMFpoaXZ0TUNtU21NeUJialFa?=
 =?utf-8?B?VXNBVWpLSXI1V09tOFV0a3BnWGQ2WDdWKzJPT0FUTFVnS3hYVThPYkJrTmJC?=
 =?utf-8?B?QjVVR004azAxbnByUnB0V1VPL0xvWG8yaVo5Y2hkS2Izc2ZUdmV0ZkNmZ1V6?=
 =?utf-8?B?TDBOYWxvbGhUcmtwV0NBcFUzUXJnalpEYmR3ZXdZblc0cmFyQ3pwU0I3dmlK?=
 =?utf-8?B?NTdaTFdyTlh2MldUQzhZOGNRZ1VaOU1DUmdqdkJEbTFIWEp0RHh5QWg2MjVM?=
 =?utf-8?B?YmVuZXdaSE9VVHhpcjlxVnF5OXcyRldGazdEa3haWm9CNk1qV2YxT0dZYkk3?=
 =?utf-8?B?dkE1b3ZjWEpSamZwNFlDNTFQK1l3TzNDcTcyV0UzOUE1V2lUSzRmakg1aUl5?=
 =?utf-8?B?dHIrQ1dXOElSZE5MazhycHQ4RFYrZVp5aWJaTXR6SkFFRnZsaHRpbzFUYmtx?=
 =?utf-8?B?LzhaaWZ2T3pVV05oUDhEcVJkSU5NMWZGNDR1NXBwNlh6bFlLWmVsQ3gzVmdM?=
 =?utf-8?B?MTZrcE1aRXREQitPSGRlOHJ3YkJRNjFpVkdQajhBMFhLbHV2SHU4QjBZMER2?=
 =?utf-8?B?d1NUbGF5eTNtaWZEVGxTZE1NVHlhOWlEak8rS25WYW9JRlRSdU40TXliZU9M?=
 =?utf-8?B?S2k4SmtnU3JrWTcxZ2xtdGhKQy80MFZadjlOd3N1aFJxY1U2eU05cnJSNGtD?=
 =?utf-8?B?RzRtNCsreXNHMkRXU3B1YndoRHlKck90ZHlkZlNDaThZWnhkU3gvYXVPbXBu?=
 =?utf-8?B?UnRmbkE0dFJhdjA5UGZSVWJFNHUwaVhUUDlvWmR0bGY2ekJrdHNrOFdxcmg5?=
 =?utf-8?Q?PggLr8rFW15CWZehXcswlcmyZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4dcd2b-dc18-41c2-5c89-08db10eec885
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 13:56:35.5344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPjuV3KLd4nPY2TjECTRB/BBAThj1densAXeENzEfl1V3Ibq1U7iBlDX0VVlPLraqqV8mYFchuB3SY3RuEcPIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
X-Proofpoint-ORIG-GUID: R6F9gC9-_KhIN2oTHGtYbDWsG2q6NUmm
X-Proofpoint-GUID: R6F9gC9-_KhIN2oTHGtYbDWsG2q6NUmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 mlxlogscore=811 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302170126
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 13:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7868

SSBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQgdG8gYWxpZ24gd2l0aCBvZS1jb3JlL21ldGEtb3BlbmVt
YmVkZGVkIHByYWN0aWNlLCBhbHRob3VnaCBzb21lIG9mIHRoZSByZWNpcGVzIHRoZXJlIGFyZSB1
c2luZyBESVNUUk9fRkVBVFVSRVMgdG8gZGV0ZXJtaW5lIHRoZSBkZWZhdWx0IHZhbHVlLg0KQWxz
bywgc2VsaW51eCBpcyBzZXQgdG8gJ2ZhbHNlJyBieSBkZWZhdWx0IGluIGNyaW8uY29uZiwgYm90
aCBpbiB0aGUgb2xkIGNyaW8uY29uZiBhbmQgdGhlIG5ldyBvbmUuDQoNCkRvIHlvdSB0aGluayB0
aGUgZGVmYXVsdCB2YWx1ZSBzaG91bGQgYmUgc2V0IGFjY29yZGluZyB0byBESVNUUk9fRkVBVFVS
RVM/IE9yIHdlIHNob3VsZCBqdXN0IG1ha2Ugc2VsaW51eCBlbmFibGVkIGJ5IGRlZmF1bHQ/DQoN
ClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJ1Y2Ug
QXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIEZlYnJ1
YXJ5IDE3LCAyMDIzIDk6NDggUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVj
dDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSCAyLzVdIGNyaS1vOiB1c2UgUEFDS0FH
RUNPTkZJRyB0byBoYW5kbGUgc2VsaW51eA0KDQpUaGlzIHN0aWxsIG5lZWRzIHRvIGJlIGVuYWJs
ZWQgYnkgZGVmYXVsdCBpbiB0aGUgcGFja2FnZWNvbmZpZywgdW5sZXNzIHlvdSBjYW4gc2hvdyB0
aGF0IHRoZSBleGlzdGluZyBidWlsZHMgd2VyZSBub3QgZGV0ZWN0aW5nIGxpYnNlbGludXggYW5k
IHVzaW5nIGl0Lg0KDQpCcnVjZQ0KDQpPbiBGcmksIEZlYiAxNywgMjAyMyBhdCAxMjozMiBBTSBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPg0KPiBGb3IgY3JpLW8sIGxp
YnNlbGludXggaXMgb3B0aW9uYWwsIHRoaXMgY2FuIGJlIHNlZW4gZnJvbSBpdHMgTWFrZWZpbGUu
IA0KPiBTbyBsZXQncyBtYWtlIHNlbGludXggb3B0aW9uYWwgYnkgdXNpbmcgUEFDS0FHRUNPTkZJ
Ry4NCj4gSW4gdGhpcyB3YXksIG1ldGEtc2VsaW51eCBkZXBlbmRlbmN5IGNvdWxkIGJlIHJlbW92
ZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4gLS0tDQo+ICByZWNpcGVzLWNvbnRhaW5lcnMvY3JpLW8vY3JpLW9fZ2l0LmJiIHwgNCArKy0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYiANCj4g
Yi9yZWNpcGVzLWNvbnRhaW5lcnMvY3JpLW8vY3JpLW9fZ2l0LmJiDQo+IGluZGV4IDY2ZDExMTYu
LjdhZjY5OGYgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19n
aXQuYmINCj4gKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYg0KPiBA
QCAtMzksMTQgKzM5LDE0IEBAIERFUEVORFMgPSAiIFwNCj4gICAgICBvc3RyZWUgXA0KPiAgICAg
IGxpYmRldm1hcHBlciBcDQo+ICAgICAgbGlic2VjY29tcCBcDQo+IC0gICAgbGlic2VsaW51eCBc
DQo+ICAgICAgIg0KPiAgUkRFUEVORFM6JHtQTn0gPSAiIFwNCj4gICAgICBjbmkgXA0KPiAgICAg
IGxpYmRldm1hcHBlciBcDQo+ICAgICAgIg0KPg0KPiAtU0tJUF9SRUNJUEVbY3JpLW9dID89ICIk
e0BiYi51dGlscy5jb250YWlucygnQkJGSUxFX0NPTExFQ1RJT05TJywgJ3NlbGludXgnLCAnJywg
J0RlcGVuZHMgb24gbGlic2VsaW51eCBmcm9tIG1ldGEtc2VsaW51eCB3aGljaCBpcyBub3QgaW5j
bHVkZWQnLCBkKX0iDQo+ICtQQUNLQUdFQ09ORklHID89ICIiDQo+ICtQQUNLQUdFQ09ORklHW3Nl
bGludXhdID0gIiwsbGlic2VsaW51eCINCj4NCj4gIFBBQ0tBR0VTID0rICIke1BOfS1jb25maWci
DQo+DQo+IC0tDQo+IDIuMzcuMQ0KPg0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCM3ODYxKTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS83ODYxDQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzk3MDIzMjIxLzEwNTA4MTANCj4gR3Jv
dXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KPiBVbnN1YnNjcmliZTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21l
dGEtdmlydHVhbGl6YXRpb24vdW5zdWIgDQo+IFticnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg0KLS0NCi0gVGhvdSBzaGFsdCBub3QgZm9s
bG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0
IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJ
DQo=


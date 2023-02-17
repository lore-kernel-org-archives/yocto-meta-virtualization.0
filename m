Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C7FC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 15:30:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9226.1676647837286488875
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 07:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qB1Tql+i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEwmon028445;
	Fri, 17 Feb 2023 07:30:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yeODcHjamEP8y1jZDZ8WiOGV4DxonjCtLAeX+C219Vs=;
 b=qB1Tql+iPJm1C1EzZBAa1NbvgWbhFKfhDRxbI/hinlI57q8ZEdBBkxrexGaPvUY+kk6g
 MJqJxYygLlYJneUm6FIQWDaQM/JF2UqnZTq1FEkh9VixmQAlnJ9BaISFYerY7pR/0TSQ
 xryXpn4BEjsmZAdt67rrPp6CefHmPzWpTRKfRp1mohd2oK9yaM8UWM/y1uEL7p2T5PIr
 qLgiHYUe6DrN+4rUFvWbZvGEMV3H0xPkPbay4aq5ZhZYwqkuApJM/ARgs+ZRQUMevZ7g
 o5LqpfIPCmI0ncfDgjNGdyLehJEYXYvA5D9ARs6e6uJKERaHj5WFpnkSkGQJd1xdG4Ji iA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxaskn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 07:30:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6XqL92/Ct+OyqX9tSZaJBacr+pYbleU+rqDxmlaB8w16ccB3H5vf1jxWvKP7UClSVzj4i1p9BCZih7yd3wrufvT3Do2kLAxnAdb936i86q+eNjSpvm2zQJPRqyO098N2R7mdgVRC88axlFrSBkOmYjMskBph+bKxT9aZiVGIQBeNWoD8R76ZjeO0CyaDDjcQmws9d7Sl8ri5Knq1vAkOATNT6jlJsCbWb2SWRnQZqZsKvUAptTt+AxijuSrv9tWBqttGpe0npsIls6kJeHJNW338dVuS8KDrwH686oowjcMg2U3siuwvcz77gf06gBYYzHZlEHwlTbKyouBUOOb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeODcHjamEP8y1jZDZ8WiOGV4DxonjCtLAeX+C219Vs=;
 b=dezIgxFc0DjklPf8YPoTcjSpNeeKWOXS1+Wyd/kvli7AUPAfTIKLdFZ7QIxNKmiyC37xKjQTJvRrlfLvcIzLc0b/GUECwY3l+rWj+T4zUF+UiI1GJ3w138kWKZKaLGzuALowp6KsPzIGUrVT2iUiGaTygY2cKfhWOXpEjPlK0a536fN14/fuMMpeOX2CAhCbklGPVGR1in0FG7NQTlIaKXnorPJSojEelHH5D49DlRWX2yJz4a8jw75FOLRlGRd0i91gtlt3sk67LRwLzE9HT7N+dFXnaHCHJYca2LK6NIaCU7OZRxNXnfRgCbtJW61MzI5YdTYYCsX0320cojfegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 15:30:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 15:30:32 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Topic: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Index: 
 AQHZQpFBJU/R7HzAmEy7AkW97uVQNK7TJ74AgAAAawCAAAYHAIAAAl4ggAACCQCAABFYsA==
Date: Fri, 17 Feb 2023 15:30:32 +0000
Message-ID: 
 <CO6PR11MB5602576602D503298F05997AEDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
 <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
 <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4MV=sLbOzdqLDaB48MDQt33=He48VcQp=AsN5E7jX=HOg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MV=sLbOzdqLDaB48MDQt33=He48VcQp=AsN5E7jX=HOg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB5358:EE_
x-ms-office365-filtering-correlation-id: 02eabf10-e226-4955-7a5a-08db10fbe85d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 orx1JrHb6auyuzYHsmLAI+kjkrm8SokvpWjo8gBcFEKnxnN3hLbOi5CzHEkUN3G03KBa0hXMCCcox5zr5uYxZsASlAL+Wgt4DiSWPB/tE4w4L4t7daJoNAp0On1GbHzuuFJ/L3D5/mGgxTgjkZFODQC7S2m7jUwhKME+1PA99BDttXbjIVwDriYwvP/JiPWhzIWp6P1xaeN6B6JUaRj2prJxPJh0nDd/tXC70fhy9yNzm7PwgkbAu5PT4YHjXvBoQkzjFsmh9jR0rW+VUROFyiRCKq0Iw8dH6jFd53XwN/iQBD6BbQ8FOLpWuugQz/p8IbnmCQgScTiQHvle4huENVkot9HOPLY+e0BqiEXLEoMx/tCbM9ppH8LlEWixUgFnKiWymPVW3HPI7aA5rtkcwCN6fSFLgQI5QjSX6mMBO3S4z4u86bqzvSvi44XxHgpYsD2FWPu2rItEwQvjSkXQhN90Gg00sPcmdDEomHSARriksukhkoo94BlcCFFgrRqM7v9AyCma7jG5v7q3ICCDicIcOJ8PkViClhi7pLdUHSjqdaQ3qzliPwtSDTbLBTU+y08OQ12JLxbpBO2doJCAfGmAGIqNY3gl8oFDYijlCfbFfp4JxN0pZ5YOpMZKSVhiePsttaw7vCiujBPIxJcKI6P36gcsnStZDcaIT6wx0KogMhUbBmuWVpHkIL+D5cQndHirtCSnX6xyVjweUidZtdOKFYpxAyimsgpdeNLworQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(451199018)(478600001)(7696005)(55016003)(966005)(83380400001)(86362001)(38070700005)(122000001)(38100700002)(33656002)(9686003)(6506007)(186003)(26005)(53546011)(316002)(66446008)(66556008)(64756008)(66476007)(76116006)(8676002)(5660300002)(66899018)(4326008)(6916009)(8936002)(52536014)(41300700001)(66946007)(2906002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZWltdzBhemx3TStkYWNkQU14YTBGK0plczIrdHhZbEhFUTREdEQzclZyQURR?=
 =?utf-8?B?YzM1UFJlZ29XMlZJWE5SL0VSc2MxTGtPVEE4azNLL1dYeDlIQnRTb1R6ZWFn?=
 =?utf-8?B?UXMrUXhBTnM0YTQ1T2lqRG9FYzluNWtZNno0bDhDRUFEbUE2TFN2S3YrRzh4?=
 =?utf-8?B?eHJyUVBUS3Zta1d3MWw5RkdEVXZIMllzZ2JleG5pVlkzWmM5aHRUM21YSDhQ?=
 =?utf-8?B?dkFkdlRFV2hwRnVWcGpPbG43aVp4SU5Mbk4wRlQ3and5K01RenZyRzlQTEFZ?=
 =?utf-8?B?SlBQYXlMSzYrcGR0V0xHNnJFRUw1OCtHeGdoZHZtWDh5bzNUYTFka1lvNGIy?=
 =?utf-8?B?d25TSjQyQUdmSWU4MGw4ODZyTUtIUmYybEtiTkVDc2tQUXBkbmlWWlQrVWNH?=
 =?utf-8?B?aW5JZnpVcHFNRmtTb0R3b3g1OHZQaUpDUGlSRWJvcGlhZnlxaVJ6ZDBLZ3VU?=
 =?utf-8?B?aDZkK2xpRVhOSUFrWmhVUUV3U1Q2emI0R0pNL3VnQ3U5Vk5NdWgzZzJ2ZUlq?=
 =?utf-8?B?SENxSm5uUUsrNmNYSkgyL1VTbnIyNjJReFpSMnBDSlJKQkN3cmhxWHA2aTBO?=
 =?utf-8?B?R01PYkdHdVRWVFhPSmZ4bXROa1dQcksxUnVidy9LRlNsY1dTUktjUitqUWxn?=
 =?utf-8?B?VTBTak1XSm9MdzZBWmhvS3dCOGIzUjh1ck9OQmF1di9NZm9WTm9QTkc3T2Nq?=
 =?utf-8?B?NVBrN2pieCtuSkJwYU5VaE0xSlhNVHpETEQ3SHVYTXBUYlRQOElTVEtOa0cr?=
 =?utf-8?B?VzQzKzZOMC93VTBtR3VWTWl6ODJ4eEt6LzMyTFVSb1lyVG85TlNWVERuRVJN?=
 =?utf-8?B?dDAyQ2dvMUlzU0lTQWNWNGZEbDRNcUNoRG9RMHdyeEk3ZGdGakRtKzRlY0hr?=
 =?utf-8?B?S3pPdXIyeVpMZnhRbjFLVFdPTElVSkxhWEtSMEdLTnk0aG5DNSs1WXdWc1ZK?=
 =?utf-8?B?V2piZW9JZFNoaEsxUkhXblB1Z0RPNGx0VC9aLzJPR1RQMVRMLzM5eDRJY3Bp?=
 =?utf-8?B?RDZGRnVRTUNKTWZTMFl0MUFtR3o3SElQMFBLellSZUhaeXJNSjc4VWZVdlFU?=
 =?utf-8?B?VnN4d2RaMm4wWEovNnBxcEw2WjdiUGZTLzBqSGJSZ3M0eGNtVVpHTVpJSjNs?=
 =?utf-8?B?T3FYMmJZSmVFVVpuaDFyTlRmeU5oRk00NUV5cWM1K3B0ZnNXclBzbGxQSDNS?=
 =?utf-8?B?dnc3S21XNFQ3N2d0RnJKQlFibTFQYU84YmZReHlkTmZXUDFzb05McHg4TlA4?=
 =?utf-8?B?eEJZVmJ3SlYra3pxNTdNVE9rUTZYZUxTVjN6a24xcU5OZlQ0Mm1PTWVlZU1n?=
 =?utf-8?B?elI1dktwVExVMVp5NmM0aktLbVZ3ejNUVkd2dVZ1MjlIalRoc1k4d2c2emwr?=
 =?utf-8?B?MGZ6dEtXbVRBd1VzS2VmQmRqeTNwRGNRYWJ1K01hSURyYVdCUkQzbHQ4UUVs?=
 =?utf-8?B?eVA1Z251NVlXcU9ZZVowYmRPd3pUbkw5OTlLSjJBVWtpYnVvUGtMWjZ6NE0z?=
 =?utf-8?B?WGU3R2NuQWIwUmlYQ052ZHhpRGYvV25OTGpZT2hRdmRqOEN1L1ZoOWIyY1Bk?=
 =?utf-8?B?S29CSTFvaUI1cGxlTWI3ZHdnYS9CTnhXZmtPa1pFZFA0TDR2cTAxajZMMk0v?=
 =?utf-8?B?UGFxSTdyT3JuYnQzK1oraUUvY2dsM2VZVURKUzJDZXFyWEZRd3lPaXd1OWY5?=
 =?utf-8?B?SnRoSEJQTVhSYUtxdW1rb1VVUEhRVDR3c0x1Z29WQTJNQjNPUjRQRHJDVDJQ?=
 =?utf-8?B?eCtrZU5rMytRVzFpQU0xWEYzTnFEYVVCM1NZT0lpYzRUd2tvbmxiY0trTTFL?=
 =?utf-8?B?K2VTUzNXSTNOeU91ZjU5eHVEQUdiUFBHNloxQjlJdUp4aTh5U1ViZmJTemo2?=
 =?utf-8?B?UUtaUUlXei9ZMExTNGpmNkVwUHhUdkhPS05hZ3dLWUl5WVQ2YWltQkZqVU12?=
 =?utf-8?B?UzN3T2EvY0pEdkJwVzBGNHlpVnREVUNsN1o2ekM2Q0s1T0JnM2FnQy96c015?=
 =?utf-8?B?aXBIR2xtNGlzSm02MG4rV0htTHRBbHdBLzNodDBvZHI2OEg5d2JsUHY3OUNJ?=
 =?utf-8?B?WitTZS9iRGVZS3RpdmNHYTc0aFNjZFVUL2dLM1VkU3NML25sZ0MwZzFIMjN4?=
 =?utf-8?Q?KHpN3O1UQTiduXgz64XHeqIiJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02eabf10-e226-4955-7a5a-08db10fbe85d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 15:30:32.4176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/tKFpzo7jAmPF4BagCANypr0qKrAsIvSagY4VFMx52xlEK0kQNzJfAFanIsflw2DFqqtFQu90hHmVZz9m8clQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
X-Proofpoint-GUID: dzbBOlgjH8IJj6SsQD6rrYZnVKq6XM6L
X-Proofpoint-ORIG-GUID: dzbBOlgjH8IJj6SsQD6rrYZnVKq6XM6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170139
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 15:30:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7877

SGkgQnJ1Y2UsDQoNCkkndmUgc2VudCBvdXQgVjIuDQpJIGFsc28gbm90aWNlZCB0aGVyZSdzIGEg
Y3JpLW8gdXBncmFkZSBpbiBtYXN0ZXItbmV4dCwgc28gSSBjaGVycnktcGlja2VkIGl0IG9udG8g
bXkgYnJhbmNoIGFuZCB0ZXN0ZWQgJ2s4cyArIGNyaS1vICsgZmxhbm5lbCcgZm9yIHFlbXV4ODYt
NjQuIFRoaW5ncyBhcmUgd29ya2luZy4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPiANClNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTcsIDIwMjMgMTA6MjcgUE0NClRvOiBDaGVu
LCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQ
QVRDSCAyLzVdIGNyaS1vOiB1c2UgUEFDS0FHRUNPTkZJRyB0byBoYW5kbGUgc2VsaW51eA0KDQpP
biBGcmksIEZlYiAxNywgMjAyMyBhdCA5OjI0IEFNIENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZl
ci5jb20+IHdyb3RlOg0KPg0KPiBPSywgSSBzZWUuIExldCdzIGp1c3QgZHJvcCB0aGlzIHBhdGNo
IHNvIHRoYXQgbGlic2VsaW51eCBpcyBzdGlsbCBhIGRlcGVuZGVuY3kgYW5kIHRoZSBsYXllciBj
aGVjayBpcyBzdGlsbCB0aGVyZS4NCj4gSSdsbCBzZW5kIG91dCBWMiBvZiB0aGUgUkVBRE1FIGNo
YW5nZSB0byBtYXRjaCB0aGUgY3VycmVudCBzaXR1YXRpb24uDQoNCkl0IHdvdWxkIGJlIG5pY2Ug
dG8gaGF2ZSB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIHRoZSBzZWxpbnV4IHN1cHBvcnQsIGZvciB0
aG9zZSB0aGF0IGRvbid0IG5lZWQgaXQuDQoNClNvIHRyaWdnZXJpbmcgZXZlcnl0aGluZyBvZmYg
dGhlIGRpc3RybyBmZWF0dXJlIGlzIGZpbmUsIGlmIHlvdSB3YW50IHRvIGRvIHRoYXQgd2l0aCB0
aGUgdjIuIE5vIG5lZWQgdG8gbW9kaWZ5IHRoZSBjcmlvLmNvbmYgZm9yIG5vdywgYXMgd2UgZG9u
J3QgaGF2ZSBzZWxpbnV4IHBvbGljaWVzIHRvIGZ1bGx5IHRlc3QgaXQgcmVnYXJkbGVzcy4NCg0K
QnJ1Y2UNCg0KPg0KPiBSZWdhcmRzLA0KPiBRaQ0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0K
PiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDE3LCAyMDIzIDEwOjExIFBNDQo+IFRvOiBDaGVuLCBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1b
UEFUQ0ggMi81XSBjcmktbzogdXNlIFBBQ0tBR0VDT05GSUcgDQo+IHRvIGhhbmRsZSBzZWxpbnV4
DQo+DQo+IE9uIEZyaSwgRmViIDE3LCAyMDIzIGF0IDg6NTYgQU0gQ2hlbiwgUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBJIGRpc2FibGUgaXQgYnkgZGVmYXVsdCB0
byBhbGlnbiB3aXRoIG9lLWNvcmUvbWV0YS1vcGVuZW1iZWRkZWQgcHJhY3RpY2UsIGFsdGhvdWdo
IHNvbWUgb2YgdGhlIHJlY2lwZXMgdGhlcmUgYXJlIHVzaW5nIERJU1RST19GRUFUVVJFUyB0byBk
ZXRlcm1pbmUgdGhlIGRlZmF1bHQgdmFsdWUuDQo+ID4gQWxzbywgc2VsaW51eCBpcyBzZXQgdG8g
J2ZhbHNlJyBieSBkZWZhdWx0IGluIGNyaW8uY29uZiwgYm90aCBpbiB0aGUgb2xkIGNyaW8uY29u
ZiBhbmQgdGhlIG5ldyBvbmUuDQo+ID4NCj4NCj4gVGhlcmUncyBubyBzdWNoIHBvbGljeSBpbiBt
ZXRhLXZpcnQuDQo+DQo+IE15IHBvaW50IGlzIHRoYXQgbGlic2VsaW51eCB3YXMgcHJldmlvdXNs
eSBhIERFUEVORFMuIFdoaWNoIG1lYW5zIHRoYXQgaXQgd291bGQgYWx3YXlzIGJlIGF2YWlsYWJs
ZSB0byBiZSBkaXNjb3ZlcmVkL3Byb2JlZCBieSB0aGUgY3JpLW8gYnVpbGQuIFdoaWNoIG1lYW5z
IHRoYXQgaXQgaXMgKGF0IGxlYXN0IHRoZW9yZXRpY2FsbHkpIGVuYWJsZWQgYnkgZGVmYXVsdCB3
aGVuIGNyaS1vIGlzIHVzZWQuDQo+DQo+IEJ5IG1ha2luZyB0aGlzIGEgcGFja2FnZWNvbmZpZywg
YW5kIHRoZW4gbm90IGVuYWJsaW5nIGl0IGJ5IGRlZmF1bHQsIG1lYW5zIHRoYXQgd2UgYXJlIGNo
YW5naW5nIHRoZSBkZWZhdWx0IGJlaGF2aW91ci4gIFdoaWNoIHdlIHdvbid0IGRvIHVubGVzcyBz
b21ldGhpbmcgaXMgYnJva2VuLg0KPg0KPiA+IERvIHlvdSB0aGluayB0aGUgZGVmYXVsdCB2YWx1
ZSBzaG91bGQgYmUgc2V0IGFjY29yZGluZyB0byBESVNUUk9fRkVBVFVSRVM/IE9yIHdlIHNob3Vs
ZCBqdXN0IG1ha2Ugc2VsaW51eCBlbmFibGVkIGJ5IGRlZmF1bHQ/DQo+ID4NCj4NCj4gRG9pbmcg
aXQgYnkgZGlzdHJvIGZlYXR1cmUgY2hlY2sgaXMgYWNjZXB0YWJsZSwgYW5kIGluIHRoZW9yeSwg
d2Ugc2hvdWxkIHRha2UgaXQgYSBzdGVwIGZ1cnRoZXIgYW5kIGRvIGEgc2VkIG9wZXJhdGlvbiB0
byBjaGFuZ2UgdGhlIGNyaW8uY29uZiBhdCB0aGUgc2FtZSB0aW1lLg0KPg0KPiBCcnVjZQ0KPg0K
PiA+IFJlZ2FyZHMsDQo+ID4gUWkNCj4gPg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4NCj4g
PiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDE3LCAyMDIzIDk6NDggUE0NCj4gPiBUbzogQ2hlbiwg
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gPiBDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0
aW9uXVtQQVRDSCAyLzVdIGNyaS1vOiB1c2UgDQo+ID4gUEFDS0FHRUNPTkZJRyB0byBoYW5kbGUg
c2VsaW51eA0KPiA+DQo+ID4gVGhpcyBzdGlsbCBuZWVkcyB0byBiZSBlbmFibGVkIGJ5IGRlZmF1
bHQgaW4gdGhlIHBhY2thZ2Vjb25maWcsIHVubGVzcyB5b3UgY2FuIHNob3cgdGhhdCB0aGUgZXhp
c3RpbmcgYnVpbGRzIHdlcmUgbm90IGRldGVjdGluZyBsaWJzZWxpbnV4IGFuZCB1c2luZyBpdC4N
Cj4gPg0KPiA+IEJydWNlDQo+ID4NCj4gPiBPbiBGcmksIEZlYiAxNywgMjAyMyBhdCAxMjozMiBB
TSBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEZv
ciBjcmktbywgbGlic2VsaW51eCBpcyBvcHRpb25hbCwgdGhpcyBjYW4gYmUgc2VlbiBmcm9tIGl0
cyBNYWtlZmlsZS4NCj4gPiA+IFNvIGxldCdzIG1ha2Ugc2VsaW51eCBvcHRpb25hbCBieSB1c2lu
ZyBQQUNLQUdFQ09ORklHLg0KPiA+ID4gSW4gdGhpcyB3YXksIG1ldGEtc2VsaW51eCBkZXBlbmRl
bmN5IGNvdWxkIGJlIHJlbW92ZWQuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgcmVjaXBlcy1jb250
YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYiB8IDQgKystLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdp
dCBhL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19naXQuYmINCj4gPiA+IGIvcmVjaXBl
cy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYg0KPiA+ID4gaW5kZXggNjZkMTExNi4uN2Fm
Njk4ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19n
aXQuYmINCj4gPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19naXQuYmIN
Cj4gPiA+IEBAIC0zOSwxNCArMzksMTQgQEAgREVQRU5EUyA9ICIgXA0KPiA+ID4gICAgICBvc3Ry
ZWUgXA0KPiA+ID4gICAgICBsaWJkZXZtYXBwZXIgXA0KPiA+ID4gICAgICBsaWJzZWNjb21wIFwN
Cj4gPiA+IC0gICAgbGlic2VsaW51eCBcDQo+ID4gPiAgICAgICINCj4gPiA+ICBSREVQRU5EUzok
e1BOfSA9ICIgXA0KPiA+ID4gICAgICBjbmkgXA0KPiA+ID4gICAgICBsaWJkZXZtYXBwZXIgXA0K
PiA+ID4gICAgICAiDQo+ID4gPg0KPiA+ID4gLVNLSVBfUkVDSVBFW2NyaS1vXSA/PSAiJHtAYmIu
dXRpbHMuY29udGFpbnMoJ0JCRklMRV9DT0xMRUNUSU9OUycsICdzZWxpbnV4JywgJycsICdEZXBl
bmRzIG9uIGxpYnNlbGludXggZnJvbSBtZXRhLXNlbGludXggd2hpY2ggaXMgbm90IGluY2x1ZGVk
JywgZCl9Ig0KPiA+ID4gK1BBQ0tBR0VDT05GSUcgPz0gIiINCj4gPiA+ICtQQUNLQUdFQ09ORklH
W3NlbGludXhdID0gIiwsbGlic2VsaW51eCINCj4gPiA+DQo+ID4gPiAgUEFDS0FHRVMgPSsgIiR7
UE59LWNvbmZpZyINCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMi4zNy4xDQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiA+IFZpZXcvUmVwbHkgT25saW5l
ICgjNzg2MSk6DQo+ID4gPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZp
cnR1YWxpemF0aW9uL21lc3NhZ2UvNzg2MQ0KPiA+ID4gTXV0ZSBUaGlzIFRvcGljOiANCj4gPiA+
IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85NzAyMzIyMS8xMDUwODEwDQo+ID4g
PiBHcm91cCBPd25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnDQo+ID4gPiBVbnN1YnNjcmliZToNCj4gPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWINCj4gPiA+IFticnVjZS5hc2hmaWVs
ZEBnbWFpbC5jb21dDQo+ID4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+ID4NCj4gPg0K
PiA+DQo+ID4gLS0NCj4gPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVy
LCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgDQo+ID4gYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQo+ID4g
LSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCj4NCj4NCj4N
Cj4gLS0NCj4gLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNo
YW9zIGFuZCBtYWRuZXNzIGF3YWl0IA0KPiB0aGVlIGF0IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBm
b3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg0KDQoNCi0tDQotIFRob3Ugc2hh
bHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdh
aXQgdGhlZSBhdCBpdHMgZW5kDQotICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0
YXIgVHJlayBJSQ0K


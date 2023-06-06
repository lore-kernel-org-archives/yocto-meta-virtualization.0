Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5950EC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:20:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52.1686061198619181417
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ATgK6jUy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521525cda=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3568Rd30017937;
	Tue, 6 Jun 2023 14:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=AQbaL4KlczFhkRxrk1f1uBSVlNyvFT5mxTh1S1d4OVc=;
 b=ATgK6jUyTL7TGPCaywlnfBe/TQVyS1muRNj0Xn4Tvb4IeT9QNJhCdV4FNLkEccSlP/wZ
 aAVoupK6n9ZMVF4i+jByhG4wWMhpBcDo6r7/pX2l9UJa4rM9MnUOVDItgpViCMx558Mg
 00XCLq4KXtBH6WSqlJ3gljNVmzyOG/jr8bboGvtTK8NMiXBgCZTmP0h3Z06ZBO5WnFhS
 wVWfutk19oV/mUiS3w2ux2Mk+LvE4F2xvsgrgwyB2lozWP1ZhL+gHh37rI19g/yXBC/4
 fMWkZ5/EKpMXFQrxsnSDgkpiPKdnLiNUXeGSNrOY+wah7dXvW2iaG7OYuznXtOAi/AHT 6A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jhph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 14:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7F8ttNYcIhv8xWniKYXoc4vZZZToRFb+5jEyVvak/FhIwLySKPVn8bsXO/mSGH8j79vq9N/wZI1XNrW8IweEQRqOzluifAsDVodZI7O16qR47SouvuA9LmBjuHIOie4Q1QDbu0kNXgtK0oZuv/W71b1l40c0vaxAtQl4FhfIDSpShguPy2Slz1HF+SV1XSGTvZmwogYlRX51BS0ayUd80ktxBfI1ImtKV9oAzNILzoUOBevMOAcfSZeR9WvBT/6Q/kpOl8LNqcO7iAY0WSLpgQrmCWxAZSIrQa9JDLwzrznqs8MAt+HgWKbPWF/23w3mWdgUJrEdxDHMNGt5wmPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQbaL4KlczFhkRxrk1f1uBSVlNyvFT5mxTh1S1d4OVc=;
 b=luKo7+LpEg048tVSyKFj3EW7wcR2gXz1vALaM3CZl1uva5bXZkWEc629816zG9P78LRKcPbGjrOBF3fhPMipiEmsHSLGWJxCzLYYrLXAVhVEQINqq8SboL5kUzUQjQMMio4BJselyG5QgPX3XT1mkBULJNjJj7IlL8EP0Y4s0GDdZzcU6YfFdnv0TbllXzwzN6s9uo2qaIUGWTLiIKq6brOOccEbBVPDJ2yoxdICf+9UgWGu7UxkyS3R8065uEl5FP0aYnKPHrPGEvm7JfUvCFmeey+Dy6aFfQZSHC/jxYKTPUHJIJ3OTEAeVIBZB+rMv8b3kvBsOPAQ0/sA3DKkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 14:19:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 14:19:52 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][master][mickledore][PATCH] runc: bump to
 1.1.6
Thread-Topic: [meta-virtualization][master][mickledore][PATCH] runc: bump to
 1.1.6
Thread-Index: AQHZmEU9iyUsmFa+A0OD+3WiuJf0r699sxKAgAAgPMA=
Date: Tue, 6 Jun 2023 14:19:52 +0000
Message-ID: 
 <CO6PR11MB56029145AC4E218FBD0AF357ED52A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230606070502.1019140-1-Qi.Chen@windriver.com>
 <CADkTA4Oa1jJiijSkWOdhPowTNmCH5xNS7xs3SePiR0jPPBq+nQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Oa1jJiijSkWOdhPowTNmCH5xNS7xs3SePiR0jPPBq+nQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB5488:EE_
x-ms-office365-filtering-correlation-id: 66799cb3-5183-4fbf-ee0b-08db66991839
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oE0Vv+K4VV/5fZFsznDL6xStoLqfuDrDFBp745Qx3wq1ifE7YiKqJPowvu9AOCSbYRa0bjru5VfrsNBXSj5qy99e+bWmeN872kf0HSFtSB5+8b82R0xxFlYmkTTpV3DtOJiAEaGjKwqdbYW4LhFDoqNJWr8jeUCSc6OQzty6wwS/geBNiJ6HKPF/cR8rZGkx4LGDS/LTBCTwNsCDHkGi6Gmg5YUuamToGI9Qp8O+xvQeUJWAcA1DSYTI/xU7ZXOLFdMQkXG3il62MVER9q+mwT86zwFDcLVoDVXlqjkjg4zkKbJ/m6VE7MCm6RnnI0LrqpzjUJH8TwDouZzdJKJji+nxmM5NnhaMy2BQNi+dMhr+406oau6ijqJBvu9z0MEkYZ56Xfk+8b4Jk+Sql7MsIaLm92N7ADUvts6wGJ/VtZxn049FqQKznbg/fSvQxCYTsPsED5oWjmHhc0ANINitbfPuZpHe8XhGld/xGWb+WdnBPhb96lAnhHQ7jQPrhbWQBaUGtiUkejXxMW/AeGgOATmHBuBkBUmwPITAh2l1rgVX5ieY4BIa9zgScChpE+zs7N4xA6pelbRLDhbako2whXK+AK4FVBHi+KvSb6yjChU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199021)(26005)(9686003)(53546011)(6506007)(83380400001)(38100700002)(41300700001)(7696005)(186003)(966005)(71200400001)(66899021)(478600001)(2906002)(66556008)(66446008)(66476007)(64756008)(122000001)(6916009)(76116006)(55016003)(316002)(66946007)(4326008)(52536014)(8936002)(5660300002)(8676002)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QTQvalF4OWJVaWxXZXNUN3FoYk9sR1ZhWWcrZHdhVmNoQjljdXF1SGxzUDlT?=
 =?utf-8?B?Ty9FMXFzeVpjVHRrQWR0czVDWEhsbTZBYnZFcnRtSDR6cHM4TTNNcEg3VXhi?=
 =?utf-8?B?SE5pNktqL3ZNNzFSZnRvRTR6bW9XdkRwQmU2bVlFbmUwdGhmQngrcTQ5Y1Ev?=
 =?utf-8?B?blNJdUFaT3RpMjlOV2FlSXF2cXViaTlYakhBZHo4NmNwNmJVbHg5b3pvdkdj?=
 =?utf-8?B?QXp3c0YzVmk2eUEwT0VqdkRBVTdnZktLR3JEakVDeGR5eUNVQ3Z6UDQxaEph?=
 =?utf-8?B?RVJWQm1qNWNoTzZ5UklFc3ZwQkc1MGVhdStpRGNiZk14V1JzMlVmbnQ4Nnd6?=
 =?utf-8?B?WS9TQ0xBa25tNnVzMHhVMzJLbmExVjltRHBHYmNGMVBRdmNsTUQxSy8yMlp2?=
 =?utf-8?B?T0NUOEpGd204eFdwVjJBTlpkNG12amIyTm1OazlHellOL29ERkFaZlNTZ2s1?=
 =?utf-8?B?U2FFb0lOSmFoRnk0eWU4bXByOXovOCtadVZaaUFsc0pUdW91OUtCVHJJQmxD?=
 =?utf-8?B?bGNBblFnV0dZRG9zSExWRTJ5OEluYUhRZnVRT3lwc2pqNXNiZ2ZIbm8wcnpk?=
 =?utf-8?B?a0RBYld1TGl5TDBjSDVHUi91UEdkS01LR21OSUVzQUhJWVAvQU5EZkNxSlkv?=
 =?utf-8?B?K0k2d1FESVp2Zm1IbUdRV0F3ZUNjMzNoTlVXVTN2WmxPeVJySXNkK3R0a1JU?=
 =?utf-8?B?MmZEME5YY3VpSXF4YWFTV2Z2bWpVYWsyMWVxNmlpdjhZTG1TQjlaRWZrVDl3?=
 =?utf-8?B?RDQwS1lYZTNSK01JdnVwbVh1ZHpvQWFHczZ5YVE4aTNyRmFBaFB0MWNpV3BS?=
 =?utf-8?B?cDV5aElBNjlaRktWaU9uQzg2aG5QUTd3NUFVTFFLR2drdElMdGVLQ3I1VXQz?=
 =?utf-8?B?Yk1DajhVRWV2Q2NONTA3dWlkR0h6cmFZQmRMZEtZN2hBN25XdjZ6RVNjYWlN?=
 =?utf-8?B?aHc0QkpyeTBxeStYVWdveHNGVWR4L2ZzQ3UwWU1OM2pwZkJJclFZYmc0dUth?=
 =?utf-8?B?SkRRcVVaZzh1eVJ4V2o5czJpa1FYZGNBRU8rWTRrWVhYYTA5RTVVWmZ3ZVVB?=
 =?utf-8?B?TVpycS8xb2dydmVkV1VubEFuTno1U2krUVJXUDdNYUZQNS9ZZjR6RENLSkcv?=
 =?utf-8?B?NUdvaHZ4TXk1NUJUT0pwVUtUa2ZDZnFDdHcvQ3BXZ2RrLy9wVGRLOVF4V2xj?=
 =?utf-8?B?QjRaRm1NaG9CK1UweWx0d3h3dlg3QVFRNzVNQ0djVjMxTUlQRVNvc01ReThI?=
 =?utf-8?B?QTdTK0dNMTBYOG0xeVNad0NKRExFdDVucFZwVTRwdy83VStPazhKMlp1L2Va?=
 =?utf-8?B?akd1dThoRTBWaHVZc1hvOHArOFgrZUVEK3JHN0VFNHhIVmNHbG4yVVE5VzdK?=
 =?utf-8?B?VTcyRlhuNTJtL1FibVJaZVM5Uk5uMExFaDZCcGdJSktlMWQ1eHFIVmVET1RS?=
 =?utf-8?B?Z29KMHozWWdMUVJkVGNmajhDRlJGUzExbGRkWE1PNVZsZFg4OWhWenB2TWhT?=
 =?utf-8?B?YU9JSXlBMmxOdEl0Y3RybHBqencyV1ZhbmtvOTJZMjNRTGhodEFKVlc2cDNk?=
 =?utf-8?B?YlUrcjY1em1lQ0RONC9vRjR6ZDlSbUM2VjBUV3dCRG5ZZ3p1M2svNnFsTjA5?=
 =?utf-8?B?UDc1NVdtTXkxZmtVYldXakJnZ0lpQVlJL0hXWkxMb1FyTEEyMEoyZEhncWdk?=
 =?utf-8?B?bU9iNG03TTBWTE9qRGdacm1td1JxMUpFYmZFazgrVHNiY1hsaG4zcVFGVFZB?=
 =?utf-8?B?dFhPTEFMQk00UjNKR3I5dnE3TU1iQXYrWTZSQ2tKQnpxekhjNGlZL3FkUjlJ?=
 =?utf-8?B?bnFPbk1CK0tXSWVHMDhpbmVVK0xRUitENTM0ZllYT2xDcEJVbHRZVG16ZndY?=
 =?utf-8?B?djRtaDRjMjI4bjQzai9SU0xmNUtGRTFMdGZKMm5INzJPUFBwREM3MFNSS21k?=
 =?utf-8?B?cUdNN0VJcnk4NkFpY3pXREtUWW5tNWkxNStUaHAwLzRxSlROWC9CN25qOHpK?=
 =?utf-8?B?UU53MytmL2dNTEw2T3U3KzEwaVEzeDNqMHVyQkd6UXV2ZHdCK01GdFo5cUtR?=
 =?utf-8?B?VmZoVlJIUU1MdUlPemxLSkxZRXFLSmQxSkh6RmsvSys4S2ZFTTVVOVlVOGRz?=
 =?utf-8?Q?prG1Dgq6NTlCqbmzcgWqMwveg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66799cb3-5183-4fbf-ee0b-08db66991839
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 14:19:52.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWKF6JcUSwYsKQKY6OZCXGFl+CBaHz1T5pg7y18/Bnykd8prmxsNB8TSYsJukcZOCcTpzCdy8Nd8CyJEB9ZHJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5488
X-Proofpoint-ORIG-GUID: H4QgtnzplFvhx10L0Ox0eKRhn4lnjcl4
X-Proofpoint-GUID: H4QgtnzplFvhx10L0Ox0eKRhn4lnjcl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_10,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=760
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8095

R290IGl0LiBUaGFua3MuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gDQpT
ZW50OiBUdWVzZGF5LCBKdW5lIDYsIDIwMjMgODoyNCBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVu
QHdpbmRyaXZlci5jb20+DQpDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnDQpTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW21hc3Rlcl1bbWlja2xl
ZG9yZV1bUEFUQ0hdIHJ1bmM6IGJ1bXAgdG8gMS4xLjYNCg0KbWFzdGVyLW5leHQgaGFzIGFscmVh
ZHkgbW92ZWQgcGFzdCB0aGVzZSB2ZXJzaW9ucy4gSSdsbCBiZSBjaGVycnktcGlja2luZyB0aGVt
IGludG8gbWlja2xlZG9yZSBvbmNlIEkgZmluaXNoIHRlc3RpbmcgYXMgdGhleSBhcmUgYnVnZml4
IHJlbGVhc2VzLg0KDQpCcnVjZQ0KDQpPbiBUdWUsIEp1biA2LCAyMDIzIGF0IDM6MDXigK9BTSBD
aGVuIFFpIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+DQo+IEZyb206IENoZW4gUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIHJlY2lwZXMtY29udGFpbmVycy9ydW5jL3J1bmMtZG9j
a2VyX2dpdC5iYiAgICAgICAgIHwgNCArKy0tDQo+ICByZWNpcGVzLWNvbnRhaW5lcnMvcnVuYy9y
dW5jLW9wZW5jb250YWluZXJzX2dpdC5iYiB8IDQgKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVz
LWNvbnRhaW5lcnMvcnVuYy9ydW5jLWRvY2tlcl9naXQuYmIgDQo+IGIvcmVjaXBlcy1jb250YWlu
ZXJzL3J1bmMvcnVuYy1kb2NrZXJfZ2l0LmJiDQo+IGluZGV4IGI3NGZmYzNhLi5jYzA5Y2MzOSAx
MDA2NDQNCj4gLS0tIGEvcmVjaXBlcy1jb250YWluZXJzL3J1bmMvcnVuYy1kb2NrZXJfZ2l0LmJi
DQo+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9ydW5jL3J1bmMtZG9ja2VyX2dpdC5iYg0KPiBA
QCAtMiwxMyArMiwxMyBAQCBpbmNsdWRlIHJ1bmMuaW5jDQo+DQo+ICAjIE5vdGU6IHRoaXMgcmV2
IGlzIGJlZm9yZSB0aGUgcmVxdWlyZWQgcHJvdG9jb2wgZmllbGQsIHVwZGF0ZSB3aGVuIGFsbCBj
b21wb25lbnRzDQo+ICAjICAgICAgIGhhdmUgYmVlbiB1cGRhdGVkIHRvIG1hdGNoLg0KPiAtU1JD
UkVWX3J1bmMtZG9ja2VyID0gIjE3YTJkNDUxZDYzNWU1ZWRhMmU0OTAyMzI0NDI4ZjFiYzY1YjAz
NjQiDQo+ICtTUkNSRVZfcnVuYy1kb2NrZXIgPSAiMGY0ODgwMWEwZTIxZTNmMGJjNGU3NDY0M2Vh
ZDJhNTAyZGY0ODE4ZCINCj4gIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9vcGVuY29udGFp
bmVycy9ydW5jO2JyYW5jaD1yZWxlYXNlLTEuMTtuYW1lPXJ1bmMtZG9ja2VyO3Byb3RvY29sPWh0
dHBzIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtcnVuYy1BZGQtY29uc29sZS1zb2NrZXQt
ZGV2LW51bGwucGF0Y2ggXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlZmlsZS1yZXNw
ZWN0LUdPQlVJTERGTEFHUy1mb3ItcnVuYy1hbmQtcmVtb3ZlLXJlLnBhdGNoIFwNCj4gICAgICAg
ICAgICAgZmlsZTovLzAwMDEtcnVuYy1kb2NrZXItU0lHVVNSMS1kYWVtb25pemUucGF0Y2ggXA0K
PiAgICAgICAgICAgICINCj4NCj4gLVJVTkNfVkVSU0lPTiA9ICIxLjEuNSINCj4gK1JVTkNfVkVS
U0lPTiA9ICIxLjEuNiINCj4NCj4gIENWRV9QUk9EVUNUID0gInJ1bmMiDQo+IGRpZmYgLS1naXQg
YS9yZWNpcGVzLWNvbnRhaW5lcnMvcnVuYy9ydW5jLW9wZW5jb250YWluZXJzX2dpdC5iYiANCj4g
Yi9yZWNpcGVzLWNvbnRhaW5lcnMvcnVuYy9ydW5jLW9wZW5jb250YWluZXJzX2dpdC5iYg0KPiBp
bmRleCBhNWEyZjExYi4uNjBlMDI5YzYgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtY29udGFpbmVy
cy9ydW5jL3J1bmMtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+ICsrKyBiL3JlY2lwZXMtY29udGFp
bmVycy9ydW5jL3J1bmMtb3BlbmNvbnRhaW5lcnNfZ2l0LmJiDQo+IEBAIC0xLDEwICsxLDEwIEBA
DQo+ICBpbmNsdWRlIHJ1bmMuaW5jDQo+DQo+IC1TUkNSRVYgPSAiMTdhMmQ0NTFkNjM1ZTVlZGEy
ZTQ5MDIzMjQ0MjhmMWJjNjViMDM2NCINCj4gK1NSQ1JFViA9ICIwZjQ4ODAxYTBlMjFlM2YwYmM0
ZTc0NjQzZWFkMmE1MDJkZjQ4MThkIg0KPiAgU1JDX1VSSSA9ICIgXA0KPiAgICAgIGdpdDovL2dp
dGh1Yi5jb20vb3BlbmNvbnRhaW5lcnMvcnVuYzticmFuY2g9cmVsZWFzZS0xLjE7cHJvdG9jb2w9
aHR0cHMgXA0KPiAgICAgIGZpbGU6Ly8wMDAxLU1ha2VmaWxlLXJlc3BlY3QtR09CVUlMREZMQUdT
LWZvci1ydW5jLWFuZC1yZW1vdmUtcmUucGF0Y2ggXA0KPiAgICAgICINCj4gLVJVTkNfVkVSU0lP
TiA9ICIxLjEuNSINCj4gK1JVTkNfVkVSU0lPTiA9ICIxLjEuNiINCj4NCj4gIENWRV9QUk9EVUNU
ID0gInJ1bmMiDQo+IC0tDQo+IDIuNDAuMA0KPg0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
Cj4gVmlldy9SZXBseSBPbmxpbmUgKCM4MDg4KTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS84MDg4DQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzk5MzU4NTI4LzEwNTA4MTAN
Cj4gR3JvdXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWIgDQo+IFticnVjZS5hc2hmaWVsZEBnbWFpbC5j
b21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg0KLS0NCi0gVGhvdSBzaGFsdCBu
b3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0
aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBU
cmVrIElJDQo=


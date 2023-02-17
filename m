Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E7CC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:07:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7048.1676642865484540437
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hQ8VE24U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HBnsWX019460;
	Fri, 17 Feb 2023 06:07:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yuWUtUhg43OW0OoWod3L7zjZqm38NHb3zWluXcrpYK4=;
 b=hQ8VE24UeHemzsklR4YGNV0y1lpmW/x8KluFXQzC5HWjfpmJfVRQRyERTsdQA/7fl+E1
 3gYXF6ohAdTtajSbagigaHKA8F6/xorXNMym9fYuCzSgxUPran+KngtRMBoBsr/WtUUW
 BMymrcWdO02GbHmd5p3566qZmT7GEUOKfOIlLAqPStCm8PqfZgA7W+yuNQQDkiw+Qc5G
 B+VtMV8xexUrjsN+jCgiQxQftKk6coCkt3Sfasy0lr/RYOFIxxhexlWcJQovJj6E1d3l
 QqEzMeiF6AG5/yCxmTvj8assC6RAnF/tOrxyMcGb8jdrXDMlUf/nrbiOeVh6MKEqZ6M2 Xw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc111h3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 06:07:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOx4xvmcp2fOGR9YTLo5H09uMT7yYbc873XjqdHcvVbbFmKoj1bcO4OtJn23R+mrbR/LG3H3z6ptldIPPIqlFcmIL09TyNW1nxE6yLjrSHEecig5LUGyDY6z6ovdUNOWx05JY2LWmjxRjTJzfKF2o61ObngMuV3+6PVQbiqMySVFQDu3InWOcyfDjjAl+4kBDuFeBOqBbS0QMze24x6zKlTEa1P2frWRD1ur6mq7YQtfEPeFnVU6AlFtv4fQZ/odFzH3CvVjUEosmn1YmlqW7xX1Yftd/ICCXjtFL93PwEhevTgIdkGFxR4D9zVCvKPorppADkpp7tiBsOOOyTZx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuWUtUhg43OW0OoWod3L7zjZqm38NHb3zWluXcrpYK4=;
 b=EsgKWHeBaptXw4BEvYkrJf5Qs3H6frI9cV9sxMxmovvqSCkpgeBuelyJT1UUq/vJ7CU/VeWA2ckZ516giRHMZmqdvAqFxQO0JTLvHrkdhJ2uYsmx8wJ74gFphybfchCgB1VXKUNToatgg9XiBmnFTkvgP8PrTQVGbhw1uf1t77tfGYkxKHxlGmUXrHM6qSy0u2tWkkLRUF+t6Muoj0EUdmUCUagtR5kezVh43kfdEE8/pjM+u/yY6mxMq7i5IpDp77cFag+eDziWAFsR6C3+HcpTAjIhi5Voz7ErGq13S9AjECp++gZebHuS+yfk81XbsScT/dIlhL+J4VQxNpymAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 14:07:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 14:07:41 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 2/2] cri-o: create registries.conf to
 avoid image inspection error
Thread-Topic: [meta-virtualization][PATCH 2/2] cri-o: create registries.conf
 to avoid image inspection error
Thread-Index: AQHZQrESmcUdMfMn0U2dOt/WoEWEQ67TKZiAgAACsXA=
Date: Fri, 17 Feb 2023 14:07:40 +0000
Message-ID: 
 <CO6PR11MB5602C299612EA8475216F34AEDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230217092014.3810-1-Qi.Chen@windriver.com>
 <20230217092014.3810-2-Qi.Chen@windriver.com>
 <CADkTA4MF-3n1bxXGjCLxdqGvg=3G8gX=ytLibEMt5_Yb_txWjg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MF-3n1bxXGjCLxdqGvg=3G8gX=ytLibEMt5_Yb_txWjg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: 969a52ad-21ee-4368-3695-08db10f05529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7CypW60ejhnnCnfbVgYkGcNUQ0WPOsNyTrXQjU5V7LtyiZ6V6TpXQqe7zE5JBXne4kexp1EwmsyNMwcU0ontaC7nDYRE0QpujFtMQZnEb90d4Z+GTs6DgwrOm98QqIirNoXvGmUzkpug6sJjMm6po99nttxFCuEvIw99CIZ4LVrAnHwc0MzK5e1815NPFbvJudWcsosichZl8piJfEMOWlJRf3hsa1LFF9gkxEXXj5yN1/L7/corgQRdnEwNxsWvVqJzHZrsbPD0nkwji0Okh5HIiAX0PR4COz5aKAyXNbcSCstE2Ttb8qFoBFM/NOfGg/LsPVBrkRpV2pS+n4Zrz8seb+QVrFxYgZhBFIfh0jUdG0dAn66siy43fr1ixYKEUz43CxI7EXybzDFMR3OUQLUIlMS83h9BztM21KGf6xvVrC3xSptJYBDB5wZOmo6EIvHjKMDuHrR3AoM2PSufKYzbUm3uZC3tINZKr+XzUT95+6EJ00kljz1TgdVOIdgXEGARtrKZgAQJ28IeKfIQiHfyRCBi+Nkg3v4eeV5PjkXIKTZVDfwZvd0d/qBNx2Zwd3zaeHRaT2Y+pB4IR5ACQ9K8GLdzGyFhw26On8I0UtWEZm6S+BXcocxigPLMqcTeyVN5SAQZlx0JL2ZSKqh5Omq9Pd+7ZWNUTYZg9nsGIQkyRTy/lEfZMwli6Nkwc4KJeyP9Raf9hrv0RBqOUpOdg6lVOC590KpycM/ksjcNdXo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(396003)(39850400004)(451199018)(66899018)(6916009)(86362001)(2906002)(33656002)(478600001)(83380400001)(7696005)(9686003)(316002)(53546011)(8936002)(186003)(6506007)(38070700005)(4326008)(71200400001)(55016003)(26005)(966005)(5660300002)(52536014)(64756008)(66476007)(76116006)(66446008)(38100700002)(41300700001)(8676002)(122000001)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S2dJUHFsWEtjaEorVUhtNXFzVEFjWmtOdDJhVHFBRCtkVkhvN2tMWnRyQXAw?=
 =?utf-8?B?UGJHQnNFazdERDhUbXRkcndZbVcyd3QvSXprQnJFU3JneHFoSzdiMWtRTkxo?=
 =?utf-8?B?ZWRLL3F1bEdFRGwvdlJVRXQ4U3ZEWnhRVmZXeXpRMHdtdXBCUXU4QWd3TlBK?=
 =?utf-8?B?Z1VuMlVIcUNYRXJma0l2NEdNSk9Ka0NBc3JlNWZLcVV6RG5QMUs5RjlHSzlF?=
 =?utf-8?B?d3k0bTVXWGhNL3krZkFQcE83RFlFWDYzZEtVZGRHbjREd2pueE9vTWE2QXJx?=
 =?utf-8?B?dnBrU1VDZENDcUlzc281b3k3ZHkzS0ZkTk9tcUhIelM1K1NvTTk0K1VMd1lS?=
 =?utf-8?B?TllmZ2RPWUVFc0JEV2VFV3VvZTdTNGU5MGF0N3BIRFhCT1NvMDFWcEZDNWJ1?=
 =?utf-8?B?RUxqY3ZmRDNNVWx5dFBXTHJza0xrOU1FSC9DdGM0YzhnSFcyQmlZeTBtYXNY?=
 =?utf-8?B?ZDZTaHFERGgyZ3piR0JhNFJkM1ZDbW0xK3ZySzVjU2I5dHQ5MHpndHFOVnhW?=
 =?utf-8?B?RWs1SGlKMVlxK3o2ODBDWi9BREQ4MVlhZUowM0g5ZXQ1bjhsLzZ0eFRlR0ly?=
 =?utf-8?B?YW5FTUtuZ2tVY1BVSnBzUXZUdVIydVJnWEZwVWlyalRSRWwwOVBqM01zTVQ5?=
 =?utf-8?B?c3hGcm1OK3UvVkhyb1g2SUxIQjc4cnBhWjlpbGdoc3Jta0k1dzJhKzB4aVFx?=
 =?utf-8?B?cE90RGlUVUwxVlNOY2s2NGp1YVl2VldjTlJSM3hhd3g0MW5IUncwdWVBa0V4?=
 =?utf-8?B?djJJWmdSZXVGbTNvMEdjSGR0Y0cwdjVsODhHdmVZSnI0TzhNRkk2SnN5a2tY?=
 =?utf-8?B?UHZOY1pocVVPcjBUSW9VK09YTXlNc3Z3UnBZTDNwSXZqbjN0RHJFWk0zd2FG?=
 =?utf-8?B?dElNQysxdElGdHpmM2c3cnVsRjJkcUEwZHpZeTZKZjR5a2FOTHh0WVd4YTVH?=
 =?utf-8?B?RVBvNXpnL05RdGJrRXllajd4Rmwwa2NYaHU2SDg3dC8yTW5aUTlRWVA1S1hz?=
 =?utf-8?B?RTlNNWNZeDVmd3IwRnlmR3BDa3YwejFyMllZUzVVdXFRNis5Nm1Cd2U3bkVN?=
 =?utf-8?B?anNITG4zZVZWdndpZFZ5YUVoeVRQWUpSNllxbjJFOFNCZ3RWbGdMS1BFMkxI?=
 =?utf-8?B?L29FdFV0ZGtCclpidnNJbEMweG4xSXhGWUlrelU5MTV6Y3BnQ0tLR0EyM1c2?=
 =?utf-8?B?U0JZUnpSWlNQYWE1TXkyQXlrUlhZbW1qcWJhc2xneWV6WEJ0bjhXcWl4cXhu?=
 =?utf-8?B?ZGc3ZVFwWlc0ZjhrNHFDZDhOeVpsTjVnanVEVTUzbjZUVXd2WlFwTjRwYWxM?=
 =?utf-8?B?QTNGRno5V1FLUE44aEh2amNRdTh3VGxwYTQ3V2NWMWg5dEltSzcrOVlMZzU1?=
 =?utf-8?B?R2tUaUxZZDBnZncrclNuSDJGN0g4azZlU3B3WmxzVG1RUFFrOFNBVGNTTW1F?=
 =?utf-8?B?eFJKLzZjS1hnK1RRZldmZmtTQkdjRWpEUDJTekwvdDFCRC9SK3lYYkpaaDg1?=
 =?utf-8?B?b2xyRFlSOGxyWFkyZnlDb0VLSGxTWVBXODlOeVFmQ2JRbFZCSkNBZXNkOTZk?=
 =?utf-8?B?Y0U3bHdPeTJWYVMzbzNXQ0JMdVBUcFZJVjBuNDBkYklNWVN2Z3k2TEJpVk90?=
 =?utf-8?B?a1JaY1lUVllkbktZVnBPZ04zNVpWbm12NnczQ0dhYjh2SnpvR2RUVFJxeXh2?=
 =?utf-8?B?MFV3dkE3a0VBWEN3RHBsemc1UlN1a0Voam1SeTFHZTI1T3pYMkV4NWZyTkFZ?=
 =?utf-8?B?Wk5FRUVMaUtwSklXdTh4VjIzcVhPR3VDdGtaRi93RGZrZmNSTFBHdDJad0l1?=
 =?utf-8?B?WGE2Y0JweXA3RVlyc2hrKzVlYWZaV2k5dVBuZWN0S3B2ck5FTHlPNm5FVXVo?=
 =?utf-8?B?Yy9mUFJNVDJobGNuOWVvbTd1aEltSUVUb2NQOUhETmNXR29mY2RFWGdta3lC?=
 =?utf-8?B?Z2VHSTJRUXpaUXZOQStCK0kybnBTVUtaaTgrRkxTTzR5TFViVXEvSlRYb2k2?=
 =?utf-8?B?K2Q4cjZiY1g2SmN3Z2c2bnl4cXBCVmptNmVaQkVKL3Z2NU9HU3FKQU1yazhh?=
 =?utf-8?B?ZUlQVGwvNU91eE93RlJ6bmcrOC9pR3NxY2tmb0ZSSW9GNlI2YVkweGlPZ3Mr?=
 =?utf-8?Q?NQnD0d7nhxpdOKoYuWrtlI+L3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969a52ad-21ee-4368-3695-08db10f05529
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:07:40.9860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jrtRI4iGh9VpxSpu71W3bGMMrP65UykZ4RjU7D0kZhGzXh54Ejk/WJKRbw4BttKgR4P3AWsk38Z9oNcZ2kZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
X-Proofpoint-ORIG-GUID: aQX2e32eCGhRxU8pao8qr5BsSw6PxCB-
X-Proofpoint-GUID: aQX2e32eCGhRxU8pao8qr5BsSw6PxCB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302170128
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7869

WWVzLCBpbmRlZWQuIFRoYW5rcyBhIGxvdCBmb3Igc3BvdHRpbmcgdGhhdC4NCkEgY29tbW9uIGNv
bmZpZ3VyYXRpb24tb25seSBwYWNrYWdlIGRvZXMgc2VlbSB0byBiZSB0aGUgbW9zdCByZWFzb25h
YmxlIHNvbHV0aW9uLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+IA0KU2Vu
dDogRnJpZGF5LCBGZWJydWFyeSAxNywgMjAyMyA5OjU1IFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0ggMi8yXSBj
cmktbzogY3JlYXRlIHJlZ2lzdHJpZXMuY29uZiB0byBhdm9pZCBpbWFnZSBpbnNwZWN0aW9uIGVy
cm9yDQoNCk9uIEZyaSwgRmViIDE3LCAyMDIzIGF0IDQ6MjAgQU0gQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPiB3cm90ZToNCj4NCj4gV2hlbiBkZXBsb3lpbmcgYSBzaW1wbGUgd29ya2xv
YWQgdXNpbmcgJ2t1YmVjdGwgYXBweSAtZicsIHdlIG1ldCB0aGUgDQo+IGZvbGxvd2luZyBlcnJv
ci4NCj4NCj4gICBGYWlsZWQgdG8gaW5zcGVjdCBpbWFnZSAidWJ1bnR1OmxhdGVzdCI6IHJwYyBl
cnJvcjogY29kZSA9IFVua25vd24NCj4gICBkZXNjID0gc2hvcnQtbmFtZSAidWJ1bnR1OmxhdGVz
dCIgZGlkIG5vdCByZXNvbHZlIHRvIGFuIGFsaWFzIGFuZA0KPiAgIG5vIGNvbnRhaW5lcnMtcmVn
aXN0cmllcy5jb25mKDUpIHdhcyBmb3VuZA0KPg0KPiBDcmVhdGUgYSByZWdpc3RyaWVzLmNvbmYg
YW5kIGluc3RhbGwgaXQgdG8gL2V0Yy9jb250YWluZXJzIHRvIGZpeCB0aGlzIA0KPiBpc3N1ZS4g
VGhlIGNvbnRlbnRzIGNvbWUgZnJvbSB0ZXN0L3JlZ2lzdHJpZXMuY29uZiBpbiBjcmktbyBnaXQg
cmVwbywgDQo+IHdpdGggdGVzdCBzcGVjaWZpYyBhbGlhcyByZW1vdmVkLg0KDQpUaGlzIHdpbGwg
Y29uZmxpY3Qgd2l0aCBza29wZW8gaWYgYm90aCBhcmUgaW5zdGFsbGVkIGluIHRoZSBzYW1lIGlt
YWdlLg0KDQpMZXQncyBkcm9wIHRoaXMgcGF0Y2gsIGFzIEkgaGF2ZSBhIFdJUCBjaGFuZ2UgdG8g
Y3JlYXRlIGEgY29uZmlndXJhdGlvbi1vbmx5IHBhY2thZ2UgdGhhdCBhZGRzIGZpbGVzIGxpa2Ug
dGhlc2UuDQoNCkkgY2FuIGNsZWFuIGl0IHVwIGFuZCBwdXNoIGl0IHRvIG1hc3Rlci1uZXh0IHNo
b3J0bHkuDQoNCkJydWNlDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIHJlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19n
aXQuYmIgICAgICAgICAgfCAyICsrDQo+ICByZWNpcGVzLWNvbnRhaW5lcnMvY3JpLW8vZmlsZXMv
cmVnaXN0cmllcy5jb25mIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtY29udGFpbmVycy9jcmktby9maWxlcy9y
ZWdpc3RyaWVzLmNvbmYNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9jcmkt
by9jcmktb19naXQuYmIgDQo+IGIvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5i
Yg0KPiBpbmRleCBmNjlkYzBmLi42ZTU4YjQ5IDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWNvbnRh
aW5lcnMvY3JpLW8vY3JpLW9fZ2l0LmJiDQo+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jcmkt
by9jcmktb19naXQuYmINCj4gQEAgLTE5LDYgKzE5LDcgQEAgU1JDX1VSSSA9ICJcDQo+ICAgICAg
ICAgZ2l0Oi8vZ2l0aHViLmNvbS9rdWJlcm5ldGVzLXNpZ3MvY3JpLW8uZ2l0O2JyYW5jaD1yZWxl
YXNlLTEuMjU7bmFtZT1jcmktbztwcm90b2NvbD1odHRwcyBcDQo+ICAgICAgICAgZmlsZTovLzAw
MDEtTWFrZWZpbGUtZm9yY2Utc3ltbGlua3MucGF0Y2ggXA0KPiAgICAgICAgICBmaWxlOi8vY3Jp
by5jb25mIFwNCj4gKyAgICAgICAgZmlsZTovL3JlZ2lzdHJpZXMuY29uZiBcDQo+ICAgICAgICAg
Ig0KPg0KPiAgIyBBcGFjaGUtMi4wIGZvciBkb2NrZXINCj4gQEAgLTEwMCw2ICsxMDEsNyBAQCBk
b19pbnN0YWxsKCkgew0KPiAgICAgIGluc3RhbGwgLWQgJHtEfSR7bG9jYWxzdGF0ZWRpcn0vbGli
L2NyaW8NCj4gICAgICBpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L2NvbnRhaW5lcnMNCj4g
ICAgICBpbnN0YWxsIC1tIDA2NDQgJHtTfS9zcmMvaW1wb3J0L2NvbnRyaWIvcG9saWN5Lmpzb24g
DQo+ICR7RH0ke3N5c2NvbmZkaXJ9L2NvbnRhaW5lcnMNCj4gKyAgICBpbnN0YWxsIC1tIDA2NDQg
JHtXT1JLRElSfS9yZWdpc3RyaWVzLmNvbmYgDQo+ICsgJHtEfSR7c3lzY29uZmRpcn0vY29udGFp
bmVycw0KPiAgfQ0KPg0KPiAgRklMRVM6JHtQTn0tY29uZmlnID0gIiR7c3lzY29uZmRpcn0vY3Jp
by9jb25maWcvKiINCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9maWxl
cy9yZWdpc3RyaWVzLmNvbmYgDQo+IGIvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2ZpbGVzL3Jl
Z2lzdHJpZXMuY29uZg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi4w
YjkyOWRhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvcmVjaXBlcy1jb250YWluZXJzL2NyaS1v
L2ZpbGVzL3JlZ2lzdHJpZXMuY29uZg0KPiBAQCAtMCwwICsxIEBADQo+ICt1bnF1YWxpZmllZC1z
ZWFyY2gtcmVnaXN0cmllcyA9IFsncXVheS5pbycgDQo+ICssJ3JlZ2lzdHJ5LmFjY2Vzcy5yZWRo
YXQuY29tJywgJ3JlZ2lzdHJ5LmZlZG9yYXByb2plY3Qub3JnJywgDQo+ICsnZG9ja2VyLmlvJ10N
Cj4gLS0NCj4gMi4zNy4xDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzc4NjUpOiANCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cv
bWV0YS12aXJ0dWFsaXphdGlvbi9tZXNzYWdlLzc4NjUNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvOTcwMjUwNjMvMTA1MDgxMA0KPiBHcm91cCBP
d25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IFVuc3Vic2NyaWJlOiANCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS12
aXJ0dWFsaXphdGlvbi91bnN1YiANCj4gW2JydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg0KDQotLQ0KLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cg
dGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRz
IGVuZA0KLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg==


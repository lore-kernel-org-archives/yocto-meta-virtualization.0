Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EEEC6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:24:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7449.1676643854990790373
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pn61PqZP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEKrCN005161;
	Fri, 17 Feb 2023 06:24:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nvwNEiwH0FT/QotDmYd4AcCNms4eSqCgBQqr6Py9o1s=;
 b=Pn61PqZP8q2IDLghnmoCxRRrP5iDG2A8MRWbqVEQ4HmcQ2+noDkkKZbJzF7Xb4BIcE2D
 aIoFJyYZw9OKF/Dh8ftQoo7I9+ThkQvoq+0nuVi5109AL9O56GVuvRoMn+Ge8Pk2aG/f
 4QaFTD86y1LFhDFLQp7uQmVNCekQ619foGelGewzjuHRfhwaIm3zIHmPyFPoI4zBuIeA
 WZjnwOg+U3/ifaSRv3BgPeB9IL4O6dTrFe3B7h14V6weCEgltfgfd9EFBhEuDg9B5nlz
 3qF8wiPO9d7NoGn3A4AvsSVXNXYB1SPRD9ehh8oGk+djuNlO3C+m/oMPmQpSx49LgKff Og== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc111hj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 06:24:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb4tSIhMSUOvRj2C04n//iEfdh7Lvb9NxpyeFnN8zS1xzR48M4VJwAcE0OBZZ44L4HFF0RJ1s8HcA4OtNJvrKow5wzMvmf8n5bku1+3PQagdWqKlGxqGPDLV3aTv3sG6+ilMYPlfjbdsjk8WA/dVgRtgeuxU6jPAkPVJTLo79XKKDdsZMJVvAnDaTw65ezKTMHEe4yK0RHRPOAYtxeWWbRgqhZZ/4R+RCG/8wvCveZnOp3WalRnAc7pH8aHkeGQc4Mtm/ZcI992wxtIKuk8KS/gCeWjmqDdt64tgyx8xClZjnPU7pdoLwOFuLL+nY33sLPvU1mBsqslVefhMbEqYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvwNEiwH0FT/QotDmYd4AcCNms4eSqCgBQqr6Py9o1s=;
 b=YucLntXdJHuKftK/Z0oQQz5vYqRAiYLGxHfeHE1NrZZyuj96XHDHNTe3dspNrDl+pbGuJ3DEzoT7pLbc250e+YKdhrt3INtG4Ym/aUZRB/aUo3ApWKBecUOdS0w0nin2alrdAfK/esOy0E77fsdTe5Is1scjBcHpjmGMRfpf8XqrZ7dcaHiafAMH8GNvwhFhI7qceTp/bi9G6JwPRxtK/9aYGeB24yiu7ASWwLo440GdPg5IWyNj9vhxZd+wvF/OQEksFKFBnTn0/6UsvQmi717xzKBhjHkkZODOn+kApzUEciKYZMkt538gCD1TB3eKroo0M2qfAhGMXRlz+v1jmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 14:24:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 14:24:09 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Topic: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
Thread-Index: AQHZQpFBJU/R7HzAmEy7AkW97uVQNK7TJ74AgAAAawCAAAYHAIAAAl4g
Date: Fri, 17 Feb 2023 14:24:09 +0000
Message-ID: 
 <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
 <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH7PR11MB8010:EE_
x-ms-office365-filtering-correlation-id: c03aaf1d-37f8-42d6-5c18-08db10f2a251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ztclmcAhHKKcLAep9ogO+K5y3ZAeizXiYWRQhcI86aPGSW2dNOORp29QXOo8fsYJDC2zCAmEzfUwUx20RoYvl7dDuB5oYXpzTwc/tCggSTgF+b+Wl8TXMttKNZRdBeQiiysIR5cIP8cwHv+AW26rEcXcVv5QbfHCN4vM+eY2JVgpBC4Z5HXlK6wJJJT79KdMHceynuXUyUNpxGbmSpnC5VazaAKwQZm32Xr+lITZurzGHQU0PU5octPe42WsDl2L1N7/He7xUx5OIeisFr48ur70JmX6mgxX8uDgpGTEwbyiA8WC5UR/9YNf0QhvlWFoPh4973PQIxT8DxZCphqGhidCi4qe3Na3MhsG0LkKFfUeeUWRuN7ZCUhXRr25mvMsMBorJwUDi5cVEBbj0w9M0rOIyrX3zSElJBonAHLnD1BIChcWvnyzvZZnZlr1NfeCHxDs3bneboH4BNo0xIYQZlZTDPQTmSwvXttARgMJohsyUeXRJIG66vlzc9yP6HsHDlhpWBJ22//soSAt4U36C3eSAMCjld31bHgXu9GnlWqImHdeUO+f3PcljjRaUqjpvTB9wvICS/oTwPr29kkWcHSWjznIMDBTKgT2HpDZegaiv6Xx625JqwsLIGykfIG804XrywAwCiHagm9wU0CR9q9x0ulRXq0tb8lxoiDf5PO0HqKtbhfgu+cs/rLIDeD/ogpih4GoYJ7Q61rGbccKqWzSItkAe2M1P7z4wdKYaNo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199018)(66899018)(38100700002)(122000001)(33656002)(316002)(71200400001)(55016003)(7696005)(38070700005)(966005)(478600001)(83380400001)(9686003)(186003)(6506007)(53546011)(2906002)(5660300002)(26005)(8936002)(52536014)(41300700001)(4326008)(6916009)(66946007)(8676002)(86362001)(66446008)(66476007)(66556008)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cDhYc1FrWE5tWGxBTlJLNjRWRFpEanZiS3JuYVhqU3MxdERxdnFaTUtuSzdl?=
 =?utf-8?B?VkpzSkhHMElUaTVGVTVyc0dRLzNqQ2MzTjJpYnFQc3BMTE05NlJWRUZ1RGdL?=
 =?utf-8?B?aWsrR01LdXJtRFpER1ozVCtZaDhNeWE2VWhXQktjMy9sb3d6OHV5Q0VRTmhN?=
 =?utf-8?B?UW1MbkJ6T0M0ZEdNditaNGJ1a2crV1ZCQWxwdFN2UGxFaHpVbTNEVjRSWnZM?=
 =?utf-8?B?YUlaMGttMW9pdHN4Mm44dGRINXRUS0EzVzVyVDdudnFuYVExRmFRYWdVNUxX?=
 =?utf-8?B?TTl0VmVDSVR4enBoVWZSSVYzYmN2T1pYNmZSZDRhcS9SajBlNFQwY0hKaEky?=
 =?utf-8?B?Vm9yendNNkVxWTdtYVo3NHJjQ2ZwMWJQSXozb2NWczhEa0ZXM0ZDTG84SHJJ?=
 =?utf-8?B?aG5JL1VyamxDamZ4ZUhCWjRjTE9UaVMxKzJzOEozVlNPSitiTkthRnY2elRG?=
 =?utf-8?B?N2JIc3EzQWJ4eHdxVFdseEtjNmEvTGQ4eGZ0T1EydUtMOWdNaHJOS3hxR2E0?=
 =?utf-8?B?SThYZmhZOTcrOFZDMldyaWJ6clhFME9WMHVRZjdLMjhLQUZOeTArMFRjT3hS?=
 =?utf-8?B?Nm02cElMWnRkWmtoWkU5WElHbjVFa0x5WGZYZFllOE8vQTcyQUxlMDFSR1kv?=
 =?utf-8?B?K1ZhL2tuMjVzK0luQzhqNHN2blhxRVNTc3BTL3V4SDJGckVGRW9EUGNnMmdz?=
 =?utf-8?B?QVd1YmNSOHRqMWRqN0tNZUlOY1lydFRxTnQ2NTk4UlpRUzM1YVFtaXRXcXlD?=
 =?utf-8?B?WDZnZTFVSXQwbi9jSjUvOStCN3NHalFDWlB2RHEwb2RrdklpenJqOHhYdFdE?=
 =?utf-8?B?QVVHUE1mZGNjd2lRY2s1akFXdzBwcExuNXozQWZ6VkNYNVhpN1FQb0NCUG5y?=
 =?utf-8?B?YmlISmJUajFBdTJDTWlUbU1xZUo5QnlyM2NBYys0a1I3V25HQVNILzdvYnRW?=
 =?utf-8?B?TjdzS2ZzUXVZZ1JTN1poMXhLSjN1ZURJKytNU1R1Uk1ncWFQZXduZ3RKQzZZ?=
 =?utf-8?B?dDl3OW1XdEdCQlJQcHIzNkpUSG1ZVmlEMUpBSHpSaEROOVFSNUJjeGxKRklR?=
 =?utf-8?B?RXNkdXBCQVlrRWJESFdOVFYxdlBTbExNSUtKT2xpZE9NeUxQTE50VjVCWHla?=
 =?utf-8?B?czF3TkNPVjE2ZlpaOUs1NUlHeXVBWnhxd3BqR29iOGJaNWpnbzY0ZGlhUjhF?=
 =?utf-8?B?eko4ZXJ6aFgxaWJXeHJta3ZpNVMrWWJEYWNmeVRBSnZyMUZFT2kzbFp2Q2po?=
 =?utf-8?B?Y0FDWjZ4Q0NMWkRTOW5FZWdZeTZnUm9RR3FTWm42MXdROHZpVXJHbHlkZ0Rm?=
 =?utf-8?B?NjF0djlBS0t6Y2trM3dzYU5IaEFWOTVFa1RmQjcyQjJtaFhwVVFZVHIwaWF2?=
 =?utf-8?B?YnVwd0ZnV28zSDlWYitaYmwyVlFCQTRmb3hQMUxHZWNXakxtNjZOUE0xT0p3?=
 =?utf-8?B?d3JiRVNoZ3dPcUdZZXQrS1lVRXhRV2F0Ri96d1h3aDBaVVplby9WSCtoQ29U?=
 =?utf-8?B?NXRJUnhjelZGWmpsNzdpK3dGYUM5bXpFTUp2aFg5R2ZBeUUrRFBGSjZoUGJ0?=
 =?utf-8?B?U0VUakFPOEdsQjNoK1VuYURCbDFFM091S1dRa3hnakhJQXNuLzFNY1dQSFpw?=
 =?utf-8?B?ZTlMMnprZEovbm9TMHdLWERBRzBxV0p2bjgvWmVmWVF2UVFmdUEzVlFVb0ox?=
 =?utf-8?B?ZXQxUXVLT0dDcnNNOSt4ZTRvblU5NEJxYjhZV2wvZEIwOXJFTDd6eW1WNjNw?=
 =?utf-8?B?VW5acUwyOEFZZm1ZL2hmUUFMSkVFYnI3WUxpb0VtSHNoNlhtU1pvUldiM08x?=
 =?utf-8?B?enNqK3NHaDAyTlFCeGtSdWlENGdScGFzbmgzZm1uN2dnVkFSckdCTk94eUdn?=
 =?utf-8?B?OGF3azZNT0hycUwxRnc3ZmcvWHB1dUdhUGE4L2RpSEszbnExOVdXZ1ZaZVJt?=
 =?utf-8?B?SENGWTdjMkVwMC9rTEx1WGUyMWt6YlJFdVpCRDVjZ21PQlR0cnpwVUg4YThz?=
 =?utf-8?B?ZU9SMExpdEdjcEJvOUFGWm5VaGdlaDFON1JzK2ZKeTVabVhVUUl1VE5mTmxX?=
 =?utf-8?B?bk9FWU1NdDhCWVNsWHRFc0lObFZ2Rlh0QVpxdXkwdThLeVhIbFBpc0dHY2hm?=
 =?utf-8?Q?rIIhn5hvNdXQ44Gxh0yaDoG0N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03aaf1d-37f8-42d6-5c18-08db10f2a251
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:24:09.4271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFGZuxVakYydKEUkqikQHOSqPw9sNks8sqGng4p0tUOEf/MO4Sw+qPoQ5ejiZzzyKmI+1Tcdf+iziu+l8EQjhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
X-Proofpoint-ORIG-GUID: 1FtWZJUjGihiHfUp9bdh6hRQ_KUYJPZD
X-Proofpoint-GUID: 1FtWZJUjGihiHfUp9bdh6hRQ_KUYJPZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_09,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 mlxlogscore=879 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302170130
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7872

T0ssIEkgc2VlLiBMZXQncyBqdXN0IGRyb3AgdGhpcyBwYXRjaCBzbyB0aGF0IGxpYnNlbGludXgg
aXMgc3RpbGwgYSBkZXBlbmRlbmN5IGFuZCB0aGUgbGF5ZXIgY2hlY2sgaXMgc3RpbGwgdGhlcmUu
DQpJJ2xsIHNlbmQgb3V0IFYyIG9mIHRoZSBSRUFETUUgY2hhbmdlIHRvIG1hdGNoIHRoZSBjdXJy
ZW50IHNpdHVhdGlvbi4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPiANClNl
bnQ6IEZyaWRheSwgRmVicnVhcnkgMTcsIDIwMjMgMTA6MTEgUE0NClRvOiBDaGVuLCBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSCAyLzVd
IGNyaS1vOiB1c2UgUEFDS0FHRUNPTkZJRyB0byBoYW5kbGUgc2VsaW51eA0KDQpPbiBGcmksIEZl
YiAxNywgMjAyMyBhdCA4OjU2IEFNIENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+IHdy
b3RlOg0KPg0KPiBJIGRpc2FibGUgaXQgYnkgZGVmYXVsdCB0byBhbGlnbiB3aXRoIG9lLWNvcmUv
bWV0YS1vcGVuZW1iZWRkZWQgcHJhY3RpY2UsIGFsdGhvdWdoIHNvbWUgb2YgdGhlIHJlY2lwZXMg
dGhlcmUgYXJlIHVzaW5nIERJU1RST19GRUFUVVJFUyB0byBkZXRlcm1pbmUgdGhlIGRlZmF1bHQg
dmFsdWUuDQo+IEFsc28sIHNlbGludXggaXMgc2V0IHRvICdmYWxzZScgYnkgZGVmYXVsdCBpbiBj
cmlvLmNvbmYsIGJvdGggaW4gdGhlIG9sZCBjcmlvLmNvbmYgYW5kIHRoZSBuZXcgb25lLg0KPg0K
DQpUaGVyZSdzIG5vIHN1Y2ggcG9saWN5IGluIG1ldGEtdmlydC4NCg0KTXkgcG9pbnQgaXMgdGhh
dCBsaWJzZWxpbnV4IHdhcyBwcmV2aW91c2x5IGEgREVQRU5EUy4gV2hpY2ggbWVhbnMgdGhhdCBp
dCB3b3VsZCBhbHdheXMgYmUgYXZhaWxhYmxlIHRvIGJlIGRpc2NvdmVyZWQvcHJvYmVkIGJ5IHRo
ZSBjcmktbyBidWlsZC4gV2hpY2ggbWVhbnMgdGhhdCBpdCBpcyAoYXQgbGVhc3QgdGhlb3JldGlj
YWxseSkgZW5hYmxlZCBieSBkZWZhdWx0IHdoZW4gY3JpLW8gaXMgdXNlZC4NCg0KQnkgbWFraW5n
IHRoaXMgYSBwYWNrYWdlY29uZmlnLCBhbmQgdGhlbiBub3QgZW5hYmxpbmcgaXQgYnkgZGVmYXVs
dCwgbWVhbnMgdGhhdCB3ZSBhcmUgY2hhbmdpbmcgdGhlIGRlZmF1bHQgYmVoYXZpb3VyLiAgV2hp
Y2ggd2Ugd29uJ3QgZG8gdW5sZXNzIHNvbWV0aGluZyBpcyBicm9rZW4uDQoNCj4gRG8geW91IHRo
aW5rIHRoZSBkZWZhdWx0IHZhbHVlIHNob3VsZCBiZSBzZXQgYWNjb3JkaW5nIHRvIERJU1RST19G
RUFUVVJFUz8gT3Igd2Ugc2hvdWxkIGp1c3QgbWFrZSBzZWxpbnV4IGVuYWJsZWQgYnkgZGVmYXVs
dD8NCj4NCg0KRG9pbmcgaXQgYnkgZGlzdHJvIGZlYXR1cmUgY2hlY2sgaXMgYWNjZXB0YWJsZSwg
YW5kIGluIHRoZW9yeSwgd2Ugc2hvdWxkIHRha2UgaXQgYSBzdGVwIGZ1cnRoZXIgYW5kIGRvIGEg
c2VkIG9wZXJhdGlvbiB0byBjaGFuZ2UgdGhlIGNyaW8uY29uZiBhdCB0aGUgc2FtZSB0aW1lLg0K
DQpCcnVjZQ0KDQo+IFJlZ2FyZHMsDQo+IFFpDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+
IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTcsIDIwMjMgOTo0OCBQTQ0KPiBUbzogQ2hlbiwgUWkg
PFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BB
VENIIDIvNV0gY3JpLW86IHVzZSBQQUNLQUdFQ09ORklHIA0KPiB0byBoYW5kbGUgc2VsaW51eA0K
Pg0KPiBUaGlzIHN0aWxsIG5lZWRzIHRvIGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBpbiB0aGUgcGFj
a2FnZWNvbmZpZywgdW5sZXNzIHlvdSBjYW4gc2hvdyB0aGF0IHRoZSBleGlzdGluZyBidWlsZHMg
d2VyZSBub3QgZGV0ZWN0aW5nIGxpYnNlbGludXggYW5kIHVzaW5nIGl0Lg0KPg0KPiBCcnVjZQ0K
Pg0KPiBPbiBGcmksIEZlYiAxNywgMjAyMyBhdCAxMjozMiBBTSBDaGVuIFFpIDxRaS5DaGVuQHdp
bmRyaXZlci5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRm9yIGNyaS1vLCBsaWJzZWxpbnV4IGlzIG9w
dGlvbmFsLCB0aGlzIGNhbiBiZSBzZWVuIGZyb20gaXRzIE1ha2VmaWxlLg0KPiA+IFNvIGxldCdz
IG1ha2Ugc2VsaW51eCBvcHRpb25hbCBieSB1c2luZyBQQUNLQUdFQ09ORklHLg0KPiA+IEluIHRo
aXMgd2F5LCBtZXRhLXNlbGludXggZGVwZW5kZW5jeSBjb3VsZCBiZSByZW1vdmVkLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+IC0t
LQ0KPiA+ICByZWNpcGVzLWNvbnRhaW5lcnMvY3JpLW8vY3JpLW9fZ2l0LmJiIHwgNCArKy0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYg0K
PiA+IGIvcmVjaXBlcy1jb250YWluZXJzL2NyaS1vL2NyaS1vX2dpdC5iYg0KPiA+IGluZGV4IDY2
ZDExMTYuLjdhZjY5OGYgMTAwNjQ0DQo+ID4gLS0tIGEvcmVjaXBlcy1jb250YWluZXJzL2NyaS1v
L2NyaS1vX2dpdC5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9jcmktby9jcmktb19n
aXQuYmINCj4gPiBAQCAtMzksMTQgKzM5LDE0IEBAIERFUEVORFMgPSAiIFwNCj4gPiAgICAgIG9z
dHJlZSBcDQo+ID4gICAgICBsaWJkZXZtYXBwZXIgXA0KPiA+ICAgICAgbGlic2VjY29tcCBcDQo+
ID4gLSAgICBsaWJzZWxpbnV4IFwNCj4gPiAgICAgICINCj4gPiAgUkRFUEVORFM6JHtQTn0gPSAi
IFwNCj4gPiAgICAgIGNuaSBcDQo+ID4gICAgICBsaWJkZXZtYXBwZXIgXA0KPiA+ICAgICAgIg0K
PiA+DQo+ID4gLVNLSVBfUkVDSVBFW2NyaS1vXSA/PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0JC
RklMRV9DT0xMRUNUSU9OUycsICdzZWxpbnV4JywgJycsICdEZXBlbmRzIG9uIGxpYnNlbGludXgg
ZnJvbSBtZXRhLXNlbGludXggd2hpY2ggaXMgbm90IGluY2x1ZGVkJywgZCl9Ig0KPiA+ICtQQUNL
QUdFQ09ORklHID89ICIiDQo+ID4gK1BBQ0tBR0VDT05GSUdbc2VsaW51eF0gPSAiLCxsaWJzZWxp
bnV4Ig0KPiA+DQo+ID4gIFBBQ0tBR0VTID0rICIke1BOfS1jb25maWciDQo+ID4NCj4gPiAtLQ0K
PiA+IDIuMzcuMQ0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZp
ZXcvUmVwbHkgT25saW5lICgjNzg2MSk6DQo+ID4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qu
b3JnL2cvbWV0YS12aXJ0dWFsaXphdGlvbi9tZXNzYWdlLzc4NjENCj4gPiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85NzAyMzIyMS8xMDUwODEwDQo+
ID4gR3JvdXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWINCj4gPiBbYnJ1Y2UuYXNoZmllbGRAZ21h
aWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCj4NCj4NCj4gLS0NCj4g
LSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBt
YWRuZXNzIGF3YWl0IA0KPiB0aGVlIGF0IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJy
eSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg0KDQoNCi0tDQotIFRob3Ugc2hhbHQgbm90IGZv
bGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBh
dCBpdHMgZW5kDQotICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJ
SQ0K


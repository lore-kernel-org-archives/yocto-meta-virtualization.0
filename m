Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.64])
 by mx.groups.io with SMTP id smtpd.web10.8097.1619766883801781347
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 00:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GJm6b+7q;
 spf=pass (domain: windriver.com, ip: 40.107.223.64, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khsnOwjPhTL/JJd+ZjnwaG0Uet96i3AfHstXCa66n5IyaR57ao7Zy0UkaNZ/M++RutXbbTn4NR+576HKdFSSlQx9wEZCaZrftYTC+Po8ZbgreRU+Baj1JJ1yd0UNzaa336j7P+vs+RAZz1nXDJV41uZvVw9Ab7loS6hcliI2srLQTM6kr/CEPEZGMzvmcbA6bYMRawBIlbMejQOxkwQnnZQ/wrXL/utb/+Lv5DldGbX9+EivR1VN9ebbXWnw9O+M0DsGXwtVpxUQ6K8gi3ArqrjX1u1OeYFo4oK4abvKgef4R/y8rHM05mgctcr5GTrkZEeDrwF25aA7xTFWBiuzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMZ1NEw89zfj+tMGQ5eMxNtv7JA5ph4hrsHExtZJCR4=;
 b=oF+YLVvPYU/Li6J+cvEqduRXhw23g/V2YQWw9pMkmoOFRAdExZhCtFS+mPw9kfgpE/PODpzdJBHowGCe10rFDmq+DRAEmDVNs5ckmsvhDldzC4/R1d16T10DQ9cb0YZH0noYsTsdE1nEZUPHxGI61SZ0ZRTciwPFGM7t3LLwy+Lo0Y4LpA+Iesf5L3q6SMjk/FPvQJV4GL7WSw8Sk9i7JiZHu7Y+Vp7whUtWmkvojY6CKX0DlugMcFbHUOxqeT4XK6OhMLO6TE2lEu2UNgpqazTkw7U6kkYBPoIyBVbdEVUGI9w1bY5ncbE8FxO7ebk0PGLcilxzUr+Ol4od6Qwgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMZ1NEw89zfj+tMGQ5eMxNtv7JA5ph4hrsHExtZJCR4=;
 b=GJm6b+7qBq+j3xKRP5qCCIjHQhX7ALv5ly6Zymnw3b9MT2mNAoyVrQ9TGTZns4MjDBdIClL+OskgVjZDVDdiv7IAlBTPOxuIGKytLplQGgssTHSMPmRfYnZVvQYobwu4xbejmFKKSteT17DoJ5xiD6O85DhcPVWaSUJbTQjwT8Y=
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR11MB1931.namprd11.prod.outlook.com (2603:10b6:3:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 30 Apr
 2021 07:14:42 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 07:14:41 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: =?UTF-8?B?5Zue5aSNOiBIZWxwIG9uIG9wZW52c3dpdGNo?=
Thread-Topic: Help on openvswitch
Thread-Index: AQHXOzFR1u+PL85GCUaB3pK/EDn6KKrJOZaAgAAL69iAALUNgIACriuT
Date: Fri, 30 Apr 2021 07:14:41 +0000
Message-ID: 
 <DM6PR11MB42027EF800146A88FAC8A5B5FF5E9@DM6PR11MB4202.namprd11.prod.outlook.com>
References: 
 <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>
 <CADkTA4Otjn5uujw4Am89nsxPjAroTHVFUw1X-Ai73wq6YZeMYQ@mail.gmail.com>
 <DM6PR11MB420281956331ED9A9C71E07FFF409@DM6PR11MB4202.namprd11.prod.outlook.com>,<CADkTA4M7BQZHh9qxKGbvbM8D6-QuU1ZBZroAaYEMJEWjoGiWhQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M7BQZHh9qxKGbvbM8D6-QuU1ZBZroAaYEMJEWjoGiWhQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef4149ab-38f0-441d-3eb4-08d90ba79fe7
x-ms-traffictypediagnostic: DM5PR11MB1931:
x-microsoft-antispam-prvs: 
 <DM5PR11MB193109E49A6C8C17E8929829FF5E9@DM5PR11MB1931.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FKaVPvM0bH1JhlGr8LA8354z4kKyej9iBmI4Cw5FFeuRBk40dNiklGthgO/M8x4kuGDZbJYLuD/WKZdR6s3W6WtJqgzHVkzXi1f2jOCK0Y4GGyuafjsz/qMdMfmbYL69u9P3GFsksHi2TTPH8SUuPg4btzcU0m+EIS2AYV8XTXGSL/HbZFxRNipMDFQfUUSNaAUl2pOUTay2sIPxhAf0qy9t9St5X4xAdKjO1Q1SosgThVqofgletK3DgZpKiJuVYlRvQkCjPsPsQ+U4UAIRJZuJx/o8uajfrggJnL14PpJY2eAoslbhfnykQnkGvvx7gZilH1eFDmw83c4ZvxXNAIQ4sN7OotY3okSPOujvht9HL6ZiFrb9qGUMdFYtQwjkBjaWD1wWTU+p3EICsniLWBPxApqYTlg9qDfFyUDip/QX6OXiueMriILTxzpPcsQiwQXTjacLHo4D6v1DGC5HTZVo16LUIyChTTyEouEQoSqTrkW8a+CfGyDeORSMV674vl1R5ML7W7T6EAn7ABc09bR6zhpVCm6W5jSLYv1sQIKFHFmsNO9pKfYBKvD9kyKfiOR4+E/hOzCG4rVVn9Hu9w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39850400004)(6506007)(66476007)(52536014)(83380400001)(76116006)(66556008)(38100700002)(5660300002)(66446008)(64756008)(6916009)(71200400001)(2906002)(33656002)(186003)(66946007)(316002)(224303003)(91956017)(478600001)(55016002)(26005)(53546011)(9686003)(86362001)(7696005)(8936002)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?STM0RmlmYUpVRE1aUk0zR0FSYkNLRWprdGFpazdnTVNUZG1ONFBrWk5nT3VE?=
 =?gb2312?B?WFhyUFZnanNyMURXZzA0eXpBVksreHZwRFhCYk5zSnI3N1FteFArcXhNbGNX?=
 =?gb2312?B?NUJyRWw2d2h5c0M1SmFkOWNVWmFhVnNONkV3dk1yOWthNHRIRW96aU9ZMmUv?=
 =?gb2312?B?cWRTamhZeGx5Yjdsc1RReDhsTmdNY0ZwWFN6MTQvbVhYd2FOQ3RvZjNYTVdH?=
 =?gb2312?B?clBROGNGa0h4ck9WV3R3QVdOWmpFN3pkT0NvZVAwVnlvQjhWcHNZd2NlVXcz?=
 =?gb2312?B?WEJTMStabXA4RUFvT3Q3b3ZhRGJqQzkyMCtWRHZhUWo0R2lsc2pacFV0QzRQ?=
 =?gb2312?B?dTF1cjMzZm9KUG5ib0RyVjVqK2d5Y3hKSFlsNTR1bk9uOXo2S09JOVlqYWdu?=
 =?gb2312?B?VHJlRUEvSmhXSnlBbUhNNTU4a3Z0cEdUS1ZFT0ZoU1lZOHhWWjBoU2dyM0hG?=
 =?gb2312?B?a1FMaFNxZEtXMnQ0MFRKTGVjZ1JIUnAraWlhVG1qMnE5TG1yU3diMWVMNjZ6?=
 =?gb2312?B?Zm1kYkNZWGZDbmcvSnl1ME1JcDZVUGFYWFhSemlmLzZtMzA2QjJPMTVOS2do?=
 =?gb2312?B?NmxqQmUvQ1RtWWZXa216c3Zzd3h0N3BSdWw3NHo5Qmthb2lCcS80TFZrdnZ6?=
 =?gb2312?B?QnN6OUJITFhRa3JVV3hjRjR3d0wzS2cyMDFwMG5BMkpwRUI1ajU5UVh3Nkwv?=
 =?gb2312?B?ZzBNOWZIQTBzYjhQWEFkTWJrVWZGQlBqaWxzbFQxOVlnSDJqVUQyVHR0RUda?=
 =?gb2312?B?Q243TXB4dTBzRWd4V2FYNWEvaFdrS1hhVEhOdGFneW5XUVdyV0VGRlpZMzJI?=
 =?gb2312?B?TGIyaGdJVlY3T2xuNzRtZjZ4akpKeEphL21La1JUOEJWdzh5L2M3ZnJ5emJZ?=
 =?gb2312?B?enY5U2o5cFRmQStVVmduNVNXb0k5NFlnWHpWQTFrSXZnTkFXT08wK3cxQ05B?=
 =?gb2312?B?Um83aW16TVJXU3NIR2VRN2dzTVpFWnBTM2RlVWU1QnZjWWQxVUlaYTk1VmdR?=
 =?gb2312?B?R0FZNUgrU3IxdEphUFNaYkdlc2FqUUFyaS9wTHlFR0xLOTlNUHRBb2tORmc5?=
 =?gb2312?B?SklydzJXOUluTitxaFBxRzFHN1c3RWRONTlzSHBDOW9XR3VTanlhUnZYMC80?=
 =?gb2312?B?WnIrWG83Ri9kWmhZM0FiVUo2cG4vUWJicXljZ1RISi81c0tmakVmdVdiM3Va?=
 =?gb2312?B?MTdEMnhuYVVjdWNHbDk2YWZ2OTNQa3dpSUNVZTQ3Z1pzdlJBSTN5Y1o0aGZM?=
 =?gb2312?B?eFliRFhYcm91U3ZGVUkzaUJubUlDSHdiTC9NK0pZQU5OcitQeDQ1ZDhvZnVY?=
 =?gb2312?B?MXdKSTg4a2duUEhUaGNObW1VZHkxRmpkNTAwRmFrdEVTS0M0dUZNbW5JWDR3?=
 =?gb2312?B?VksyeldDRnNCODJnSXFqRjVHZk9KdlpZNytya0xFK2ZWZ3llLy9lZWpTVXE5?=
 =?gb2312?B?REFSZHhGUHRLR0ZUQzAzRHdIZUVXNG41Umg2bWpNT0locDRzdys1NFZBV3Uv?=
 =?gb2312?B?VUg1cTJUazd4R2NhOEYyT2RYMTY3RTRqZlJVZEVzMklNOUxMc1ljSmRmZm9G?=
 =?gb2312?B?U0RiaEoxN0JHM1BGeDlJU3ZuYmV0cHlHdS93Ym5VcmdMVzNpSTlQZ3Rrd2E2?=
 =?gb2312?B?QmxXdFNsa1NiM05VUnJIRjJaSGtaZ1U5TkQvZzhEeGdBaUpsZ2Y2S0dZaDRQ?=
 =?gb2312?B?N3JvR0ZnNVpUaTNtOXR4ZzUzZDJJeXRjeW5rd1FGeDRCTXVTNGR0Mkc1bVJl?=
 =?gb2312?Q?byr471hlSj/C4sQP8A=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4149ab-38f0-441d-3eb4-08d90ba79fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 07:14:41.7523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZX/gC5qQW9JlrfKDNY5qIwJjTPIqd8PRNoiSK2wOiaXVfQ4/5Rp+1cIbV7vdbkMO0/X1B2kd19/sb8YrjpGQfzGtGjpUsiriKw6BcTzMcoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1931
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogQnJ1Y2Ug
QXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4Kt6LLzcqxvOQ6IDIwMjHE6jTUwjI4
yNUgMjI6MTIKytW8/sjLOiBaaGFuZywgUWlhbmcKs63LzTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnCtb3zOI6IFJlOiBIZWxwIG9uIG9wZW52c3dpdGNoCgpbUGxl
YXNlIG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3Nd
CgpPbiBUdWUsIEFwciAyNywgMjAyMSBhdCAxMTo0MSBQTSBaaGFuZywgUWlhbmcgPFFpYW5nLlpo
YW5nQHdpbmRyaXZlci5jb20+IHdyb3RlOgo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiC3orz+yMs6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVs
ZEBnbWFpbC5jb20+Cj4gt6LLzcqxvOQ6IDIwMjHE6jTUwjI4yNUgMTA6NDEKPiDK1bz+yMs6IFpo
YW5nLCBRaWFuZwo+ILOty806IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZwo+INb3zOI6IFJlOiBIZWxwIG9uIG9wZW52c3dpdGNoCj4KPiBbUGxlYXNlIG5vdGU6IFRo
aXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdCj4KPiBPbiBUdWUs
IEFwciAyNywgMjAyMSBhdCAyOjU0IEFNIFpoYW5nLCBRaWFuZyA8UWlhbmcuWmhhbmdAd2luZHJp
dmVyLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8gQnJ1Y2UKPiA+Cj4gPiB3aGVuIG9wZW52c3dp
dGNoIGVuYWJsZSBEUERLLCB0aGUgZG9fY29uZmlndXJlIHdpbGwgdHJpZ2dlciBmb2xsb3cgZXJy
b3I6Cj4gPgo+ID4gY2hlY2tpbmcgd2hldGhlciBkcGRrIGlzIGVuYWJsZWQuLi4geWVzCj4gPiB8
IGNoZWNraW5nIGZvciBydGVfY29uZmlnLmguLi4geWVzCj4gPiB8IGNoZWNraW5nIHdoZXRoZXIg
UlRFX0xJQlJURV9WSE9TVF9OVU1BIGlzIGRlY2xhcmVkLi4uIG5vCj4gPiB8IGNoZWNraW5nIHdo
ZXRoZXIgUlRFX0VBTF9OVU1BX0FXQVJFX0hVR0VQQUdFUyBpcyBkZWNsYXJlZC4uLiBubwo+ID4g
fCBjaGVja2luZyB3aGV0aGVyIFJURV9MSUJSVEVfUE1EX1BDQVAgaXMgZGVjbGFyZWQuLi4gbm8K
PiA+IHwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX1BNRF9BRl9YRFAgaXMgZGVjbGFyZWQu
Li4gbm8KPiA+IHwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX1ZIT1NUX05VTUEgaXMgZGVj
bGFyZWQuLi4gKGNhY2hlZCkgbm8KPiA+IHwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX01M
WDVfUE1EIGlzIGRlY2xhcmVkLi4uIG5vCj4gPiB8IGNoZWNraW5nIHdoZXRoZXIgUlRFX0xJQlJU
RV9NTFg0X1BNRCBpcyBkZWNsYXJlZC4uLiBubwo+ID4gfCBjaGVja2luZyBmb3IgbGlicmFyeSBj
b250YWluaW5nIGRsb3Blbi4uLiAtbGRsCj4gPiB8IGNoZWNraW5nIHdoZXRoZXIgbGlua2luZyB3
aXRoIGRwZGsgd29ya3MuLi4gbm8KPiA+IHwgY29uZmlndXJlOiBlcnJvcjogQ291bGQgbm90IGZp
bmQgRFBESyBsaWJyYXJ5IGluIGRlZmF1bHQgc2VhcmNoIHBhdGgsIHVwZGF0ZSBQS0dfQ09ORklH
X1BBVEggZm9yIHBrZy1jb25maWcgdG8gZmluZCB0aGUgLnBjIGZpbGUgaW4gbm9uLXN0YW5kYXJk
IGxvY2F0aW9uCj4gPiB8IFdBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5k
Lgo+ID4KPiA+IEkgZGlkbid0IGZpbmQgb3V0IHdoeSwgIGhhdmUgeW91IHJlcGVhdGVkIHRoZSBx
dWVzdGlvbj8KPiA+Cj4KPiA+SSBoYXZlIHNlZW4gdGhpcyB3aXRoIG90aGVyIHBhY2thZ2VzIGlu
IHRoZSBwYXN0LCBidXQgY2FuJ3QgPmZpbmQgdGhlCj4gPnJlZmVyZW5jZXMgdG8gc3BlY2lmaWMg
Zml4ZXMgbm93Lgo+ID4KPiA+SGF2ZSB5b3UgbG9va2VkIHRvIHNlZSBpZiBkcGRrIGlzIGluIGZh
Y3QgcHJvZHVjaW5nIGEgLnBjIGZpbGUgPj8gV2UKPiA+a2luZCBvZiBvdmVybG9hZCBwYWNrYWdl
IGNvbmZpZyBpbiBPRSB3aGVyZSBpdCBpcyBhIGdlbmVyYWwgPnNldCBvZgo+ID5vcHRpb25zIGZv
ciByZWNpcGVzLCBhbmQgYWxzbyB0aGUgYWN0dWFsIHBrZy1jb25maWcgPmFwcGxpY2F0aW9uICh0
aGF0Cj4gPm5lZWRzIHRob3NlIC5wYyBmaWxlcykuCj4gPgo+ID5BIHF1aWNrIGNoZWNrIHNob3dz
IHRoYXQgb3BlbnZzd2l0Y2ggaXNuJ3QgaW5oZXJpdGluZyB0aGUgPnBrZ2NvbmZpZwo+ID5iYmNs
YXNzLCB3aGljaCBtZWFucyBvdXIgcGtnLWNvbmZpZy1uYXRpdmUgaXNuJ3QgaW4gdGhlID5kZXBl
bmRlbmN5Cj4gPmNoYWluLgo+Cj4gSGVsbG8gQnJ1Y2UKPgo+IFRoZSAyLjE1IG9wZW52c3dpdGNo
IHBhcmFtZXRlciAgLS13aXRoLWRwZGs9IG11c3QgYmUgJ3N0YXRpYycgb3IgJ3NoYXJlZCcuICAg
YmVmb3JlICBwYXJhbWV0ZXIgLS13aXRoLWRwZGs9IGJlIHNldCBhIHBhdGguCj4KPiAgSSBtYWRl
IHRoZSBmb2xsb3dpbmcgY2hhbmdlcwo+Cj4gLS0tIGEvcmVjaXBlcy1uZXR3b3JraW5nL29wZW52
c3dpdGNoL29wZW52c3dpdGNoX2dpdC5iYgo+ICsrKyBiL3JlY2lwZXMtbmV0d29ya2luZy9vcGVu
dnN3aXRjaC9vcGVudnN3aXRjaF9naXQuYmIKPiBAQCAtMSw2ICsxLDYgQEAKPiAgcmVxdWlyZSBv
cGVudnN3aXRjaC5pbmMKPgo+IC1ERVBFTkRTICs9ICJ2aXJ0dWFsL2tlcm5lbCIKPiArREVQRU5E
UyArPSAidmlydHVhbC9rZXJuZWwgcGtnY29uZmlnLW5hdGl2ZSIKPgo+ICBQQUNLQUdFX0FSQ0gg
PSAiJHtNQUNISU5FX0FSQ0h9Igo+Cj4gQEAgLTM1LDcgKzM1LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MWNlNWQyM2E2NDI5ZGZmMzQ1NTE4NzU4ZjEzYWFlYWIi
Cj4gIERQREtfSU5TVEFMTF9ESVIgPz0gIi9vcHQvZHBkayIKPgo+ICBQQUNLQUdFQ09ORklHID89
ICJsaWJjYXAtbmciCj4gLVBBQ0tBR0VDT05GSUdbZHBka10gPSAiLS13aXRoLWRwZGs9JHtTVEFH
SU5HX0RJUl9UQVJHRVR9JHtEUERLX0lOU1RBTExfRElSfS9zaGFyZS8ke1RBUkdFVF9BUkNIfS1u
YXRpdmUtbGludXhhcHAtZ2NjLCxkcGRrLGRwZGsiCj4gK1BBQ0tBR0VDT05GSUdbZHBka10gPSAi
LS13aXRoLWRwZGs9c3RhdGljLCxkcGRrLGRwZGsiCj4gIFBBQ0tBR0VDT05GSUdbbGliY2FwLW5n
XSA9ICItLWVuYWJsZS1saWJjYXBuZywtLWRpc2FibGUtbGliY2FwbmcsbGliY2FwLW5nLCIKPiAg
UEFDS0FHRUNPTkZJR1tzc2xdID0gIiwtLWRpc2FibGUtc3NsLG9wZW5zc2wsIgo+Cj4gIFRoZSBm
b2xsb3dpbmcgZXJyb3Igd2lsbCBiZSBnZW5lcmF0ZWQgOgo+Cj4gY2hlY2tpbmcgZm9yIHN0cnVj
dCB0Y2ZfdC5maXJzdHVzZS4uLiB5ZXMKPiB8IGNoZWNraW5nIHdoZXRoZXIgZHBkayBpcyBlbmFi
bGVkLi4uIHllcwo+IHwgY2hlY2tpbmcgZm9yIERQREsuLi4gbm8KPiB8IGNvbmZpZ3VyZTogZXJy
b3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRzIChsaWJkcGRrKSB3ZXJlIG5vdCBtZXQ6Cj4gfAo+IHwg
Tm8gcGFja2FnZSAnbGliZHBkaycgZm91bmQKPiB8Cj4gfCBDb25zaWRlciBhZGp1c3RpbmcgdGhl
IFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZSBpZiB5b3UKPiB8IGluc3RhbGxl
ZCBzb2Z0d2FyZSBpbiBhIG5vbi1zdGFuZGFyZCBwcmVmaXguCj4gfAo+IHwgQWx0ZXJuYXRpdmVs
eSwgeW91IG1heSBzZXQgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcyBEUERLX0NGTEFHUwo+IHwg
YW5kIERQREtfTElCUyB0byBhdm9pZCB0aGUgbmVlZCB0byBjYWxsIHBrZy1jb25maWcuCj4KPkxl
dCBtZSB0cnkgYW5kIHN1bW1hcml6ZSwKPgo+RFBESyBoYXMgcmVwbGFjZWQgYSBmbGFnIHRoYXQg
dXNlZCB0byBwb2ludCB0byB0aGUgYmluYXJ5ID53aXRoIGEKPnN0YXRpYy9ub24tc3RhdGljIGZs
YWcgYW5kIGlzIHVzaW5nIHBrZy1jb25maWcgdG8gbG9jYXRlIHRoZSA+YmluYXJ5Lgo+Cj5JZiB0
aGUgeW9jdG8gZHBkayBwYWNrYWdlIGlzbid0IHByb2R1Y2luZyBhIHZhbGlkIHNldCBvZiAucGMg
PmZpbGVzCj50aGF0IHBrZy1jb25maWcgaXMgbG9va2luZyBmb3IsIHRoZW4gaXQgd29uJ3QgZmlu
ZCB0aGVtIGFuZCA+dGhhdAo+ZG9lc24ndCBoZWxwIHVzLgo+Cj5TbyB3ZSBuZWVkIHRvIHNlZSBp
ZiB0aGUgZHBkayBwYWNrYWdlIGlzIHByb2R1Y2luZyB0aGVtLCA+YW5kIGlmIHNvLAo+d2h5IGFy
ZW4ndCB0aGV5IGluIHRoZSByaWdodCBwbGFjZS4KPgo+SWYgd2UgZG9uJ3Qgd2FudCB0byBnbyB0
aGF0IHJvdXRlLCBkaWQgeW91IHRyeSBzZXR0aW5nIHRoZSA+RFBES19DRkxBR1MKPmFuZCBEUERL
X0xJQlMgdG8gdGhlIHBhdGggdG8gd2hlcmUgdGhlIGxpYnJhcmllcyBoYXZlID5iZWVuIGluc3Rh
bGxlZAo+aW4gdGhlIHBhY2thZ2Ugc3lzcm9vdCA/Cj4KClRoYW5rcyBCcnVjZSBoZWxwLCAgdGhp
cyBwcm9ibGVtIG9jY3VycyBvbmx5IGluIG9wZW52c3dpdGNoIHVzZSBEUERLIDE5LjExICwgIEkg
c2V0IERQREtfQ0ZMQUdTIGFuZCBEUERLX0xJQlMgcmVzb2x2ZSBpdC4gCgpRaWFuZwo+QnJ1Y2UK
Cj4gfCBTZWUgdGhlIHBrZy1jb25maWcgbWFuIHBhZ2UgZm9yIG1vcmUgZGV0YWlscy4KPiB8IFdB
Uk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLgo+Cj4gUWlhbmcKPgo+ID5J
J2Qgc3RhcnQgdGhlcmUuCj4gPgo+ID5CcnVjZQo+Cj4gPiBUaGFua3MKPiA+IFFpYW5nCj4KPgo+
Cj4gLS0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hh
b3MgYW5kIG1hZG5lc3MgYXdhaXQKPiB0aGVlIGF0IGl0cyBlbmQKPiAtICJVc2UgdGhlIGZvcmNl
IEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQoKCgotLQotIFRob3Ugc2hhbHQgbm90IGZv
bGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQKdGhlZSBh
dCBpdHMgZW5kCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJ
Cg==

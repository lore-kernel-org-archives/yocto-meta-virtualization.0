Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.82])
 by mx.groups.io with SMTP id smtpd.web08.6963.1619581278925382365
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 20:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F7+Xuxmj;
 spf=pass (domain: windriver.com, ip: 40.107.236.82, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRBni4iwc35lh0GACcziU7mUmas7OaOWP1w17r/obGOmUGMibL+bJqVXIs42Sb8ovYg2XnpM128lLoccwJqtxWJWeKiBe6rccx8vPLmWdQmk8r+zi7cDEWerq3rXnBQiyGoTZYMbF89NcZaIy+AIZEbd8gCLqUoyXonDVq40gVuqYvXq0bWu5MwTGV36EjWFQsRgHYOgWZTdU3QbDGxhNWqKWOme0frKf+0M4VF9QywS8uHIixrPQXiG2KXCN0UVLx7XjT3rhfiLKw6ILiFavDrXPb5+AX9T5SudTsPRw7aGPnpgPS/KvEtgw6WcBkAYnORph5PyGNNG+DcMzPGJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFVUxRQjBUjR5qG3jGn06vBUjRGQTvTHFEUJJl0OFKs=;
 b=UF+/gbnFaSAlEdFILqSyhDYWl6DmJlUuYLAxTYo8fGMq3WQ79YmPzquNdcEQvIa2SWuOYB+VkU/62qKOD7wgm08m/CRcVdTAs40g6KH/jDaPwj205IlA5nFut+f3qe1Sqk+7UDBjbTdM7wAV3q8Ixq5QCDgVR+bH731Ck95rsyROKDN9VWs6Au15LL8uT8BxtEIWnE/p3Wdk0NYm/8bXEzYjXUVFNuPkGoOHMX7OFcs+0IpqN95kt7sXnX3TgTE1ZKoleqifIHa6Ye/42hVjeZsDZrmJ2vMhDGargbEH0oeM8QX61k/0Nxzi7iI7JUHLOLb8BlmrxuA12KE7rZA9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFVUxRQjBUjR5qG3jGn06vBUjRGQTvTHFEUJJl0OFKs=;
 b=F7+Xuxmjr+vyqZtaOhqEoJBscYyo7i0fYAv9CsZ5JI1WnFNwFmOrWoveWeLSLPjjOwDtnFvlFfA1jqD7qDoMIcwOif2KcW00irICU5B7oSi8rigFdvAHlHofv7oMjdLLOT+K5+AkfXkfk5SHV5/iIY+syCXxgr25T2VR5FiKVTk=
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR11MB0026.namprd11.prod.outlook.com (2603:10b6:4:62::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 03:41:17 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 03:41:17 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: =?UTF-8?B?5Zue5aSNOiBIZWxwIG9uIG9wZW52c3dpdGNo?=
Thread-Topic: Help on openvswitch
Thread-Index: AQHXOzFR1u+PL85GCUaB3pK/EDn6KKrJOZaAgAAL69g=
Date: Wed, 28 Apr 2021 03:41:16 +0000
Message-ID: 
 <DM6PR11MB420281956331ED9A9C71E07FFF409@DM6PR11MB4202.namprd11.prod.outlook.com>
References: 
 <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>,<CADkTA4Otjn5uujw4Am89nsxPjAroTHVFUw1X-Ai73wq6YZeMYQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Otjn5uujw4Am89nsxPjAroTHVFUw1X-Ai73wq6YZeMYQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee8da0be-3c99-404a-f91d-08d909f77ab7
x-ms-traffictypediagnostic: DM5PR11MB0026:
x-microsoft-antispam-prvs: 
 <DM5PR11MB00269B5634D4875D41CFFE43FF409@DM5PR11MB0026.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L7JAb1ZQ/jmOaM0CtiI01UEKeb1u2bBHo7ugkiSawVu1W/7jBy3Aah1kusxMhItGGLSi0GZEkSqI65LrvdDUFs1lXmAKKKLyo4YFEqr6h1/kjLsV11MRKSq4Osc+l7ISBXm+VJqRwRtCBwaaCh+XflICC1bcoqYcwcHwsCbJRrHHf4LVZPcPSZHQ7sT8h1LGGTnkssIDlkUUdtuJegS1o6JloUVVX7cWt6e+twL0GCFx3xXBYGxgxKSQfSIYziymSV9sDSVGSuzG18d64FYNyJP0a8kFJjdM6CHxFQgP8yrU1qJOXwEVk0VkW7RtzEGbAzBCuw2Ryn72vwwHAMOcJWV786pb3brOZeJoMpIrOGKaEsmsKKUCBzprRuU39ZCnHtWB5aG2Lpwc6R0d22nwiOTR7Jn7YrbLCz2hlmkJ5XtIxiljRGC1Rsuj/k9LQtC3pDYrQrVP1ZkbwG+4SQgOLBbW2R5k+7TF31R4FDi7eU+Gx76R3cTmLfH/8kxn3Y/G7hQVtQMjUg4iHBPMn/DLdn29SI7CSmjGvRu0YWpWerzTIXTyR+WbFCxDbKmh3bSvvo6nh+s4zBeQU8TE4TooqQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(26005)(33656002)(5660300002)(4326008)(224303003)(478600001)(64756008)(53546011)(186003)(316002)(9686003)(66946007)(83380400001)(66476007)(55016002)(38100700002)(66446008)(7696005)(6506007)(8936002)(86362001)(2906002)(66556008)(76116006)(6916009)(91956017)(122000001)(52536014)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?aG4wZEpzWDU2aWZlakQvbFo1WS91dUxYTU9KK05SRnlON1d6M0NZTTZER3Bn?=
 =?gb2312?B?SEJacmJUazFDUm1NdnFMaURyT05ENytzUzl3TFh0YWN4eGNXeC9LNkJqQzcw?=
 =?gb2312?B?TGJaT1c2MDBvLzZmVkE0R092bW1rc1k0SjVVZkxwWUlwbUwweWdhVm9saEJj?=
 =?gb2312?B?YkFYS2NGRW55QTVwVkx2SU9KUTQ3QUIwS0I3REVOMlBRR05UbEFXUHc1eC94?=
 =?gb2312?B?TFUwUlhha215dzVRbnN0YWt6bnZHTURRdDNLdkdpazUwanJuQzRJZ0dlS0pC?=
 =?gb2312?B?RzVkck5YdUJhOTJQUnd4ZjdmeW5MNlhRTFI0UnZiMlFRUm9ENnBic2VOZ3BE?=
 =?gb2312?B?UU9zTldlZE9qNmNNWnN0MnJYOG5kUDIwSWFXMFpWMEJOd0hzd0srVXY5MG56?=
 =?gb2312?B?d2RZaFhVSXdwM3ZWMjVxL3pWaTRSbEdReDJDRmhwWDNrS2tTZW5oa0VIaE8r?=
 =?gb2312?B?NnVsb3pudTlGYTZjN2VzdW5HZUtUUnZmZTZuOXVoRllmS3J6OE51TFV3UlVl?=
 =?gb2312?B?djllcVlQNUN1YzNVWE1aS3A3Wlhpdmg2L2F3TzZYbzVHTzREKzkrSS9qM3Na?=
 =?gb2312?B?ZU1GWXVCdzRWWDVTbk8wL1RCZHhpUkV5NE9VR09ia1J6K1QzTElTb3MvQmkx?=
 =?gb2312?B?L2ZCVFQ0cTBxQWRkMUdoSDdZOTFNUklZRmNqVmM5M2R3aVBWMjhoL3djNjV5?=
 =?gb2312?B?cjBiWTduNU5MRmpKbmdERW1UVThGRlpMVUM5Rk8rNFNIeFRYNjZGTlpuemx4?=
 =?gb2312?B?MXBoVjRXZGZRRkk2bWI2dEdYdWVsSkFidXVEQW9KUlI2SlN3bEhSdjRxUDRX?=
 =?gb2312?B?RFJIQUVJazRqNUJaVHJaU0hrY2JJMStoTFRhekdHU1NEZ0UzV0RvTXhvQWcr?=
 =?gb2312?B?aWNnK2JXcTF0bXcySVBWeFhjTUVFdmRHTU4rNlVaTTkvWTJMNnd2RXQwZ2Fy?=
 =?gb2312?B?MzJLWmJwWFdvaUVpN3E4ejI1VFRvSnZibFBEQlFhU3haUjJIV0d0NkRJRmZB?=
 =?gb2312?B?TU50RXV2a0xiVVA3dEhmM3hYYXVEMlpDeExVT2o2Um1RVk55a095R2pKbjhn?=
 =?gb2312?B?N29BM0tEeUY3RzlobUYxZWZoVUlZQUdrYVVRUjlmalBCVnlidWtQeHhyRXJ3?=
 =?gb2312?B?Nk5ubGxROUk4bDZacDBmcmJPWExQclorL2VhMUpyTWtaM2pDdy9PSnpRQ2x1?=
 =?gb2312?B?Z0daR1h0ZXpHK0EybFhDNmZPQjNuT3p0cE41bFMrRkJZc3BEQ3lMZUlMSzZC?=
 =?gb2312?B?YlZQRW9XNDVHamMzUHZuVlo0b2dIakN6S05xMWxUZno3SFBESStwMDFNNEdl?=
 =?gb2312?B?Q0VqdEExWXBrWXBlY3dVcnFieVg0VTREZDd3ZDRnbzR0UWRIRUNmbDkzVTdY?=
 =?gb2312?B?SWM0MWw2R1Bvd2w2K2Z6SUlpd09ad3NwRk1jTmFqVXpMcjhYcmw4TmJDR05y?=
 =?gb2312?B?T2NWWGVKbTY0SzdNQXdFWWM4K1dvYnozS0g2RDdTU21nOW5OcU05U3BpVmQw?=
 =?gb2312?B?cS83a2d3aExCMlVlUUdyb01aTytvVlFXK0E0N3J4NHRmNnZmWFJKRWhGYS9U?=
 =?gb2312?B?a1B5a0NiNVRhcFVBMU1TV0RaNGtBd1dYaFRQbTd4c21TSThPcG4vU2dITmxO?=
 =?gb2312?B?UVFpdVRValZCQkRKS1pmQmVzemNDUjlUN3RUbU9NdGVmaWd3Wnh4VHZ6SkVO?=
 =?gb2312?B?UWR1WkFQcDhyMCtmV3F3NEl1aFpJV3NZT0h1ZFhGK20vWEpOd1VGN2RGU2k2?=
 =?gb2312?Q?tTz3x1p5eqNARsK2VA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8da0be-3c99-404a-f91d-08d909f77ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 03:41:16.8835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Kq4nzUHo4X8J23Lg2aFGXUzeD92szQ85+W87KH/meaSBm3gxGJ0iN88EjDaNbYUoa2Bo9RBMbdxDX4/AoQHUtZ1xdS+6x00ZLHXZ41JOE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0026
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogQnJ1Y2Ug
QXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4Kt6LLzcqxvOQ6IDIwMjHE6jTUwjI4
yNUgMTA6NDEKytW8/sjLOiBaaGFuZywgUWlhbmcKs63LzTogbWV0YS12aXJ0dWFsaXphdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnCtb3zOI6IFJlOiBIZWxwIG9uIG9wZW52c3dpdGNoCgpbUGxl
YXNlIG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3Nd
CgpPbiBUdWUsIEFwciAyNywgMjAyMSBhdCAyOjU0IEFNIFpoYW5nLCBRaWFuZyA8UWlhbmcuWmhh
bmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBCcnVjZQo+Cj4gd2hlbiBvcGVudnN3
aXRjaCBlbmFibGUgRFBESywgdGhlIGRvX2NvbmZpZ3VyZSB3aWxsIHRyaWdnZXIgZm9sbG93IGVy
cm9yOgo+Cj4gY2hlY2tpbmcgd2hldGhlciBkcGRrIGlzIGVuYWJsZWQuLi4geWVzCj4gfCBjaGVj
a2luZyBmb3IgcnRlX2NvbmZpZy5oLi4uIHllcwo+IHwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElC
UlRFX1ZIT1NUX05VTUEgaXMgZGVjbGFyZWQuLi4gbm8KPiB8IGNoZWNraW5nIHdoZXRoZXIgUlRF
X0VBTF9OVU1BX0FXQVJFX0hVR0VQQUdFUyBpcyBkZWNsYXJlZC4uLiBubwo+IHwgY2hlY2tpbmcg
d2hldGhlciBSVEVfTElCUlRFX1BNRF9QQ0FQIGlzIGRlY2xhcmVkLi4uIG5vCj4gfCBjaGVja2lu
ZyB3aGV0aGVyIFJURV9MSUJSVEVfUE1EX0FGX1hEUCBpcyBkZWNsYXJlZC4uLiBubwo+IHwgY2hl
Y2tpbmcgd2hldGhlciBSVEVfTElCUlRFX1ZIT1NUX05VTUEgaXMgZGVjbGFyZWQuLi4gKGNhY2hl
ZCkgbm8KPiB8IGNoZWNraW5nIHdoZXRoZXIgUlRFX0xJQlJURV9NTFg1X1BNRCBpcyBkZWNsYXJl
ZC4uLiBubwo+IHwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX01MWDRfUE1EIGlzIGRlY2xh
cmVkLi4uIG5vCj4gfCBjaGVja2luZyBmb3IgbGlicmFyeSBjb250YWluaW5nIGRsb3Blbi4uLiAt
bGRsCj4gfCBjaGVja2luZyB3aGV0aGVyIGxpbmtpbmcgd2l0aCBkcGRrIHdvcmtzLi4uIG5vCj4g
fCBjb25maWd1cmU6IGVycm9yOiBDb3VsZCBub3QgZmluZCBEUERLIGxpYnJhcnkgaW4gZGVmYXVs
dCBzZWFyY2ggcGF0aCwgdXBkYXRlIFBLR19DT05GSUdfUEFUSCBmb3IgcGtnLWNvbmZpZyB0byBm
aW5kIHRoZSAucGMgZmlsZSBpbiBub24tc3RhbmRhcmQgbG9jYXRpb24KPiB8IFdBUk5JTkc6IGV4
aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLgo+Cj4gSSBkaWRuJ3QgZmluZCBvdXQgd2h5
LCAgaGF2ZSB5b3UgcmVwZWF0ZWQgdGhlIHF1ZXN0aW9uPwo+Cgo+SSBoYXZlIHNlZW4gdGhpcyB3
aXRoIG90aGVyIHBhY2thZ2VzIGluIHRoZSBwYXN0LCBidXQgY2FuJ3QgPmZpbmQgdGhlCj5yZWZl
cmVuY2VzIHRvIHNwZWNpZmljIGZpeGVzIG5vdy4KPgo+SGF2ZSB5b3UgbG9va2VkIHRvIHNlZSBp
ZiBkcGRrIGlzIGluIGZhY3QgcHJvZHVjaW5nIGEgLnBjIGZpbGUgPj8gV2UKPmtpbmQgb2Ygb3Zl
cmxvYWQgcGFja2FnZSBjb25maWcgaW4gT0Ugd2hlcmUgaXQgaXMgYSBnZW5lcmFsID5zZXQgb2YK
Pm9wdGlvbnMgZm9yIHJlY2lwZXMsIGFuZCBhbHNvIHRoZSBhY3R1YWwgcGtnLWNvbmZpZyA+YXBw
bGljYXRpb24gKHRoYXQKPm5lZWRzIHRob3NlIC5wYyBmaWxlcykuCj4KPkEgcXVpY2sgY2hlY2sg
c2hvd3MgdGhhdCBvcGVudnN3aXRjaCBpc24ndCBpbmhlcml0aW5nIHRoZSA+cGtnY29uZmlnCj5i
YmNsYXNzLCB3aGljaCBtZWFucyBvdXIgcGtnLWNvbmZpZy1uYXRpdmUgaXNuJ3QgaW4gdGhlID5k
ZXBlbmRlbmN5Cj5jaGFpbi4KCkhlbGxvIEJydWNlCgpUaGUgMi4xNSBvcGVudnN3aXRjaCBwYXJh
bWV0ZXIgIC0td2l0aC1kcGRrPSBtdXN0IGJlICdzdGF0aWMnIG9yICdzaGFyZWQnLiAgIGJlZm9y
ZSAgcGFyYW1ldGVyIC0td2l0aC1kcGRrPSBiZSBzZXQgYSBwYXRoLgoKIEkgbWFkZSB0aGUgZm9s
bG93aW5nIGNoYW5nZXMgCgotLS0gYS9yZWNpcGVzLW5ldHdvcmtpbmcvb3BlbnZzd2l0Y2gvb3Bl
bnZzd2l0Y2hfZ2l0LmJiCisrKyBiL3JlY2lwZXMtbmV0d29ya2luZy9vcGVudnN3aXRjaC9vcGVu
dnN3aXRjaF9naXQuYmIKQEAgLTEsNiArMSw2IEBACiByZXF1aXJlIG9wZW52c3dpdGNoLmluYwog
Ci1ERVBFTkRTICs9ICJ2aXJ0dWFsL2tlcm5lbCIKK0RFUEVORFMgKz0gInZpcnR1YWwva2VybmVs
IHBrZ2NvbmZpZy1uYXRpdmUiCiAKIFBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iCiAK
QEAgLTM1LDcgKzM1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
MWNlNWQyM2E2NDI5ZGZmMzQ1NTE4NzU4ZjEzYWFlYWIiCiBEUERLX0lOU1RBTExfRElSID89ICIv
b3B0L2RwZGsiCiAKIFBBQ0tBR0VDT05GSUcgPz0gImxpYmNhcC1uZyIKLVBBQ0tBR0VDT05GSUdb
ZHBka10gPSAiLS13aXRoLWRwZGs9JHtTVEFHSU5HX0RJUl9UQVJHRVR9JHtEUERLX0lOU1RBTExf
RElSfS9zaGFyZS8ke1RBUkdFVF9BUkNIfS1uYXRpdmUtbGludXhhcHAtZ2NjLCxkcGRrLGRwZGsi
CitQQUNLQUdFQ09ORklHW2RwZGtdID0gIi0td2l0aC1kcGRrPXN0YXRpYywsZHBkayxkcGRrIgog
UEFDS0FHRUNPTkZJR1tsaWJjYXAtbmddID0gIi0tZW5hYmxlLWxpYmNhcG5nLC0tZGlzYWJsZS1s
aWJjYXBuZyxsaWJjYXAtbmcsIgogUEFDS0FHRUNPTkZJR1tzc2xdID0gIiwtLWRpc2FibGUtc3Ns
LG9wZW5zc2wsIgoKIFRoZSBmb2xsb3dpbmcgZXJyb3Igd2lsbCBiZSBnZW5lcmF0ZWQgOgoKY2hl
Y2tpbmcgZm9yIHN0cnVjdCB0Y2ZfdC5maXJzdHVzZS4uLiB5ZXMKfCBjaGVja2luZyB3aGV0aGVy
IGRwZGsgaXMgZW5hYmxlZC4uLiB5ZXMKfCBjaGVja2luZyBmb3IgRFBESy4uLiBubwp8IGNvbmZp
Z3VyZTogZXJyb3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRzIChsaWJkcGRrKSB3ZXJlIG5vdCBtZXQ6
CnwgCnwgTm8gcGFja2FnZSAnbGliZHBkaycgZm91bmQKfCAKfCBDb25zaWRlciBhZGp1c3Rpbmcg
dGhlIFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZSBpZiB5b3UKfCBpbnN0YWxs
ZWQgc29mdHdhcmUgaW4gYSBub24tc3RhbmRhcmQgcHJlZml4Lgp8IAp8IEFsdGVybmF0aXZlbHks
IHlvdSBtYXkgc2V0IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgRFBES19DRkxBR1MKfCBhbmQg
RFBES19MSUJTIHRvIGF2b2lkIHRoZSBuZWVkIHRvIGNhbGwgcGtnLWNvbmZpZy4KfCBTZWUgdGhl
IHBrZy1jb25maWcgbWFuIHBhZ2UgZm9yIG1vcmUgZGV0YWlscy4KfCBXQVJOSU5HOiBleGl0IGNv
ZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4KClFpYW5nCgo+SSdkIHN0YXJ0IHRoZXJlLgo+Cj5C
cnVjZQoKPiBUaGFua3MKPiBRaWFuZwoKCgotLQotIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUg
TlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQKdGhlZSBhdCBpdHMgZW5k
Ci0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJCg==

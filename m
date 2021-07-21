Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web08.261.1626900586857150556
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 13:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=BJ1UtJnl;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3158; q=dns/txt; s=iport;
  t=1626900586; x=1628110186;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xBAyjy9OonS5YhAzr5Ctm/c+6dFbwi3TTKj3bjGhm6A=;
  b=BJ1UtJnlCPQc+XVTN7fP3KQEUMWzbByYS1Iov3iEtNUezhWYP3Dx1xdw
   xF5yG3EGEk3HP06PKvgx52ulrxl1enJX5uxIvd0nea5Ymxa6p3NCiN3+K
   EdFAt31QFoa7lFTJYNAVLLr00Dzi4itE6RAve6VYYHY8PzCuLtDpsqShJ
   U=;
IronPort-PHdr: =?us-ascii?q?A9a23=3ALYpM6hOjAG6RHoC9pUQl6ncZWUAX0o4cdiYe6?=
 =?us-ascii?q?4EsjPRFdaHwt5jhPUmK4/JrgReJWIjA8PtLhqLQtLyoQm0P55uN8RVgOJxBX?=
 =?us-ascii?q?hMIk4MaygonBsPWAkzgJ/msZCs/T4xOUVZ/9CS9Nk5YUM/1e1zVpCi06jgfU?=
 =?us-ascii?q?hXyPAZ4PKL7AInX2s+2zOu1vZbUZlYguQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AhA7LZq16XJdxU3gwC1wrBQqjBepxeYIsim?=
 =?us-ascii?q?QD101hICG9Lfb4qyn+ppomPEHP5wr5AEtQ5uxpOMG7MBThHO1OkPcs1NCZLU?=
 =?us-ascii?q?nbUQqTXcBfBO7ZowEIdBeOjdK1uZ0QFpSWTeeAcWSS7vyKozVQcexQuuVvmZ?=
 =?us-ascii?q?rA7Yy1ohsdLnAJV0gj1XYFNu/xKDwReOAyP+tAKHPq3Ls/m9PPQwVyUu2LQl?=
 =?us-ascii?q?0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInFy6IZn1VKAvx3y56?=
 =?us-ascii?q?2lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0OVjcVaKvm/VQIO0aeSAW?=
 =?us-ascii?q?UR4YDxStAbTpxOAkbqDyaISN3WqlLdOXgVmiXfIBSj8AreSITCNUIH4ox69N?=
 =?us-ascii?q?9kmt+z0Tt+gDm6u5g7g15x/qAnfi/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSo?=
 =?us-ascii?q?cGbqRNxLZvsH+9Pa1wVh4S0rpXXdWGzfusksp+YBefdTTUr2NvyNujUjA6GQ?=
 =?us-ascii?q?qHWFELvoiQ3yJNlH50wkMEzIhH901wuq4VWt1B/aDJI65onLZBQosfar98Hv?=
 =?us-ascii?q?4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fq92CadgN1t8/iZ7BWFRXuS?=
 =?us-ascii?q?o7fF/vE9SH2NlR/hXEUAyGLH/QIwFlltBEU5jHNc3W2AG4OSUTevqb0rwi65?=
 =?us-ascii?q?fgKoSO0bptcoveEVc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DpDAAOiPhg/5JdJa1aHgEBCxIMQIF?=
 =?us-ascii?q?OC4FTUQd3WjcYGYRIg0gDhTmIYQOBEIlHj1mBLoElA1QLAQEBDQEBKgcQBAE?=
 =?us-ascii?q?BhFcCF4JeAiU2Bw4CBAEBARIBAQUBAQECAQYEexOFaA2GRQEBAQQBERERDAE?=
 =?us-ascii?q?BNwELBAIBCBECAgEBAQICHwcCAgIfBwoVCAgCBAENBQgaglCCVQMvAZ0GAYE?=
 =?us-ascii?q?6AoofeoEygQGCBwEBBgQEhS4NC4IzCYEQKoJ8hA6BF4VLJxyCDYEVQ4IrNz6?=
 =?us-ascii?q?CIEIFgSQ7gxU2gi6DG2MrCIE8bJVjpyhbCoMkgTGJBIw5gWuFehKFKqE1LZV?=
 =?us-ascii?q?bj2eVJQIEAgQFAg4BAQaBYgYugVlwFYMkCUcZDo4fN4MhGYUUhUpzAjYCBgs?=
 =?us-ascii?q?BAQMJiUmCRwEB?=
X-IronPort-AV: E=Sophos;i="5.84,258,1620691200"; 
   d="scan'208";a="643429711"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2021 20:49:45 +0000
Received: from mail.cisco.com (xbe-rcd-002.cisco.com [173.37.102.17])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 16LKnjRP014541
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Wed, 21 Jul 2021 20:49:45 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-002.cisco.com
 (173.37.102.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 15:49:44 -0500
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 15:49:44 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-003.cisco.com (173.37.135.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Wed, 21 Jul 2021 15:49:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLXefZDKnIKtYayOG8gFZM3/D0Z76K/qauFyI7JLBxLUO3RXLC2yPP4/JEWh6RYLQB5VBbUsvRbjR+/o0XW8J9sY4IkO3foM2KjXtj4mDWFJQwnM9Ext6IBcNR3pv99Cqo/nC8kplsmcnbLvQ9QlGs69mDSeumd1+1CbOvRmJAwDSE0GGCaEN/QN5WbbYK0vVcteTdNsKnttwTXLVr+F9Hbz30zme9qqo3XKZd5VuicyDoiNtoC++/crfgVViG5M7pklNxaLySNxMgQg/B+RRCHjhiQOMMJNcs4J7ZW04YszQAFd3obGOugyLSxpHHJoDtrIjoZ9W1JFhAImpP2CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBAyjy9OonS5YhAzr5Ctm/c+6dFbwi3TTKj3bjGhm6A=;
 b=lFoQ4sJC78BKC7PVWxH7UbffwokQcFzjqgIYSCJ048doCaMCybmKVdoEG5BRe4gv248/9DfaSpLOEJBOg8t4YjWFaqH5QONeM4ysF18H31PX8A0110LWvNx1bZl5EX3TMq/Y1EscBusVEyO6bjrylERjvAEm3GNLGSrpMaJIoti4njs+dlS6QPF/tTYVE/5UfWXue8mlHOnnB7SakLP+I6v08tESsaL9Tc+LvdRSoVPJwbK7tQ6Fg3SpCcr/X7OYlJ7NUzB006eJ+knAWFb5mY4FtZ2Up6UAxC9zHGB7b76Hbx8eOq4916C5MhJfhvn2RNAE538aabs0m9PI+wJd2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBAyjy9OonS5YhAzr5Ctm/c+6dFbwi3TTKj3bjGhm6A=;
 b=LH4FsuLHgrIUQrJMGHdFPkkMv24ZlJmgywOuSX0s+1/ACTNFE7y8u3F+oTs6mVDTNB42EViQreqTdsQt5CA82WxWX6BpLZbsZU35b9SmW/qS5f6chl1Cj+oZ8RdHHSksRJQtcTT68IeUqQF6SgRLlGePtFLV7rDkoDT/PkRyJMI=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 20:49:42 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%5]) with mapi id 15.20.4352.024; Wed, 21 Jul 2021
 20:49:42 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: "Ruslan Babayev (fib)" <fib@cisco.com>,
        Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
Thread-Topic: [meta-virtualization][PATCH] python3: unbreak python3-native
 when virtualization is in DISTRO_FEATURES
Thread-Index: AQHXfm83bnU8N4frvEiMNcIFL78GGqtN4geAgAAAbkCAAAQysA==
Date: Wed, 21 Jul 2021 20:49:42 +0000
Message-ID: <SJ0PR11MB47840ED9E9582FAD969BC68FADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210721202955.137761-1-fib@cisco.com>
 <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
 <1693E8C660DC5CDD.19034@lists.yoctoproject.org>
In-Reply-To: <1693E8C660DC5CDD.19034@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cisco.com; dkim=none (message not signed)
 header.d=none;cisco.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ef31567-68e7-4f65-8a40-08d94c8910ce
x-ms-traffictypediagnostic: BY5PR11MB3896:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB38966721C2E56C0CF2155203ADE39@BY5PR11MB3896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfaOKs/nkSwg6qsud7PCcqB5KbWmj6oA94tQCD9REVhxS/Vd2q9roACIj3XWrM6UOHOIODWDBR7TB8rsjCqr9iHZljp7K9uuDbl3RgELZoVeSSwjqmcinpHEiZdEJWITeuuV1rWH+FBGWFGRqWZQTraEKrJyC/GG+XXpi/Xdd9MZuCyuROTrbK1rKOJJwruxhVrVohcIbbpMz4lqShejWMsnQZffwKT/9cakLy8x7RzlAcmqFtlQXEKeEICcKMVdRXIrWDaIOdofF+Y5XnRk0RVvRfHuKd2vkp0fb9MUbnlnP1sHIiXvdH8Vh+wOXdzV0a+oykzDF71rn0jhj4+w+SIMFVEW965LCtiGG06+v5AjMHrtUj/BEeOIU2FzjpxmW/+Lv3ehgsBY+VuVn802b0YCYJ9iboJWPWh0Dl8PwPYF+QbL+Mwy4M6RvbjmhTPy8pQFeTW73B7ChS05h+x5dpOBEjlgNleMEWBM+eA+Eq6xj3ZWMuuF/fUd4xIlh0hkOvxWLgfTRWTiGotK2OmMKdQWqy5cLqoXby5HQRxQl1MhmpBwVg1KfXhGq3urVeUcB1aK/+0Hzdkqlkz/m6ZU2w6sFbP1B1PYg6dY7T89nJNZADGqkMKWitQUR/Yyp9NW0rPOyljvtihTwF0f3pHpvrUPxY3YrQiDiuvJE4KuDwUsPD0hi7Rh3otgvj+vxyF4EEPVWz02n03uJyZ1DrKwkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(346002)(376002)(396003)(316002)(5660300002)(76116006)(110136005)(7696005)(66446008)(64756008)(4326008)(66556008)(66476007)(38100700002)(8936002)(122000001)(26005)(66946007)(2906002)(52536014)(6506007)(86362001)(33656002)(53546011)(478600001)(9686003)(71200400001)(83380400001)(186003)(8676002)(55016002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTZQTTk2cUJFcUtNMXFZMjZXbm5MQ3F0ZklLWlZzOWF3c0Z2NzZTZFh3Q3VN?=
 =?utf-8?B?RWd5ck9wVGVNWTQ0cjdPN3hleEhValRjVE43SjJSWUdHTzBQSTQ0ZHNza2Rr?=
 =?utf-8?B?anpQV3FWNEVwSy85ZzdkYXZwSzJidERBOHdyNkdiRzFySG5vWVo0SVBickc1?=
 =?utf-8?B?UWRQbTV4Tml1T0V3V3lVVzZIYlJmdjA4S3lNa3F1ZTV5QmY3ZHV6V3dzRzdz?=
 =?utf-8?B?N2R3bis1TWdycm5rNGQ2MEdxNEdhM09WSkovVTVTbVNOOCtkN3JNM29tNG11?=
 =?utf-8?B?ZC9Ec2dtdWtiaTNQY2I2TzBFSm5LK1ZjWHZwQm9NdW1xUUJWcmQvMFJCdSsv?=
 =?utf-8?B?ZUVYV0pCY2RkbUxMK1k1WWx4N3V2MGlaY3l4alV4UWdXTnk3S0YxcW8vNGRm?=
 =?utf-8?B?aWpiQVhSUlJ3dm04aVVhcXB5K0J2S1BXZEVlRE5ZUDMya0NCNWd3SkJEQ3ZE?=
 =?utf-8?B?RFVVcEQzcHBPQTFFL0kxOG5xaUsxc3ZCUDREa2orT2d0MnppeFRoYU1LVVd4?=
 =?utf-8?B?NzVicXNJU3hlTXR6Wi9RS3NGOGVHdWRLRzA4cWtaaHU2U1JRVFJaaEl0QmQ4?=
 =?utf-8?B?cFdDQU5nVGF5SzhJRDNTcHVMTUhucmtCOHRkTldwajdPWUVMVnlndmNDRjZL?=
 =?utf-8?B?Um54djVzK0o4c0dzZ0VoNm8wV2RvaGVlY3lyMU4xaklpbTVIRHZEa28vcS9p?=
 =?utf-8?B?YlE4TkpHL0ZhNWdCS1A0TjYwWVRCVmNxL0ZCSE5sZWJoeEZXM3ZoZTI0Rmlo?=
 =?utf-8?B?Y21HYTgyZCtXQitGTC9rSWxGekZqb0dub2tsZHRJbENhZE5obHh1S21NZG45?=
 =?utf-8?B?Y25rRGFoVmZGK25LNURUaDRsM1hNNllLbEJIVzFHa2RvemZwUW5ZUWtDdXFY?=
 =?utf-8?B?Y1dHclV1dU1jby81ZUw3VzJSNGdLL1FxazRod3V3MTVJNTZuSlcxRlpsQXdL?=
 =?utf-8?B?UFdWM3M4LzRpUzM4ZW9zdlVtQURQN3REUnh1dk9tWkRYVDliZVBOUjF1QlVK?=
 =?utf-8?B?QkNXa216VVc1dDBTdUJab2NJNmxPOGpKRHF2eXZmNHNseGtrYWhoNUV0ZUtQ?=
 =?utf-8?B?b29ablFQaWRDZlMxTnk5L1g0YUFiNEo5R2FZZ1pnUTF4K01ia1oyK01RZ0Jr?=
 =?utf-8?B?TmI4dlIrTFNxdkgxQW9sdGpQdFBueThBTStBVU9VcWJya1R6QU9WYnd5SDM2?=
 =?utf-8?B?VG53ekUwMXFVM2Fjd214TGZzU0ZVSzB3Nk4vRnp1WUV6ZGtVc2hsN2lXMDlv?=
 =?utf-8?B?NDV5RHpnT3IvZlF5b0RIbzh0SzYyNmNKR1JnQkRmVnpKVFVJY1VnUjdTU1k4?=
 =?utf-8?B?Y3dlakFiSlhYeTFSYmpVaHFCWE1yOFVEOVg0YXg1aFhJbU9FazhEbVg4TXR4?=
 =?utf-8?B?ZnNkdnJ1UXNwNi80ZFBjOXNUd3NtQUxFemU5bWxBNlpuK1dRRTA5RnMvV3pG?=
 =?utf-8?B?Zk04cEY4d2pIMnEvcWZkTDhxVWJpT09RN09UM3FDd2hrRlN1N2RTZFdpTE40?=
 =?utf-8?B?bjlKVW5XcDB1ZVJaMEUvcUZDTVk1eUt5NjYrcWlxK3JmT3d1K0J3cTU3WGpN?=
 =?utf-8?B?NjRzSHRUTmRibGRpOHk1VnVnYlBtLzFrWWMwenVOSWpDbnlxOERZZG5lNjVk?=
 =?utf-8?B?dU91Mjc5ZDUySktoMTNFRVplYWNsNGN0MFZ5dzdZTk1FeVFlUTlZV1c0d2ZX?=
 =?utf-8?B?UHhmRXdTOEppbEdQbVZTRC9TT2lGUzdsemxwTWN1K2laOEtCRSs0QTh2YWx2?=
 =?utf-8?Q?VsT/MJO6yJq9nkHowE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef31567-68e7-4f65-8a40-08d94c8910ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 20:49:42.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6mPP92xX5fXFlqzkePiYepqj11qpy5YAmGRyMM9E9ryFhXGeiDWNoVifHJZR/W8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.17, xbe-rcd-002.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SnVzdCBkbyBhZGQuIEkgYW0gbm90IHN1cmUgd2h5IHRoZSBwcmVwZW5kIHdpdGggZXhwb3J0IExJ
QlJBUllfUEFUSCB3YXMgYWRkZWQgdG8gYmVnaW4gd2l0aC4gUGVyaGFwcyBpdCBpcyBubyBsb25n
ZXIgcmVxdWlyZWQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBtZXRhLXZp
cnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtdmlydHVhbGl6YXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJ1c2xhbiBCYWJheWV2IChmaWIp
IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIw
MjEgMTozNyBQTQ0KVG86IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+
DQpDYzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0
OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIXSBweXRob24zOiB1bmJyZWFrIHB5dGhv
bjMtbmF0aXZlIHdoZW4gdmlydHVhbGl6YXRpb24gaXMgaW4gRElTVFJPX0ZFQVRVUkVTDQoNCkJh
c2ljYWxseSwgcHl0aG9uMy1uYXRpdmUgcmVjaXBlIHdpdGggRElTVFJPX0ZFQVRVUkVTIHdpdGgg
dmlydHVhbGl6YXRpb24gaXMgYnJva2VuIGR1ZSB0byAke1NUQUdJTkdfRElSX1RBUkdFVH0gYmVp
bmcgdW5kZWZpbmVkIGFuZCBMSUJSQVJZX1BBVEggZW5kaW5nIHVwIGFzICIvbGliIi4NCg0KSSBj
YW4gcHV0IHRoZSBwYXJ0IGFib3V0ICR7U1RBR0lOR19ESVJfVEFSR0VUfSBub3QgZGVmaW5lZCBm
b3IgbmF0aXZlIHJlY2lwZXMgaW4gdGhlIGJvZHkgb2YgdGhlIGNvbW1pdCBpZiB5b3UgbGlrZS4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIDxicnVj
ZS5hc2hmaWVsZEBnbWFpbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKdWx5IDIxLCAyMDIxIDE6
MzIgUE0NClRvOiBSdXNsYW4gQmFiYXlldiAoZmliKSA8ZmliQGNpc2NvLmNvbT4NCkNjOiBtZXRh
LXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0
YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0hdIHB5dGhvbjM6IHVuYnJlYWsgcHl0aG9uMy1uYXRpdmUg
d2hlbiB2aXJ0dWFsaXphdGlvbiBpcyBpbiBESVNUUk9fRkVBVFVSRVMNCg0KWW91IG5lZWQgdG8g
ZWxhYm9yYXRlIG11Y2ggbW9yZSBpbiB0aGlzIGNvbW1pdCBtZXNzYWdlLiBXZSBuZWVkIHRvIGRv
Y3VtZW50IHdoYXQgZXhhY3RseSB3ZXJlIHRoZSBzeW1wdG9tcywgaW4gd2hhdCBzb3J0IG9mIGJ1
aWxkIHRoaW5ncyB3ZXJlbid0IHdvcmtpbmcsIGFuZCBob3cgdGhpcyBmaXhlcyBpdC4NCg0KQ2hl
ZXJzLA0KDQpCcnVjZQ0KDQpPbiBXZWQsIEp1bCAyMSwgMjAyMSBhdCA0OjMwIFBNIFJ1c2xhbiBC
YWJheWV2IDxmaWJAY2lzY28uY29tPiB3cm90ZToNCj4NCj4gU2lnbmVkLW9mZi1ieTogUnVzbGFu
IEJhYmF5ZXYgPGZpYkBjaXNjby5jb20+DQo+IC0tLQ0KPiAgcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uM192aXJ0dWFsaXphdGlvbi5pbmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfdmlydHVhbGl6YXRpb24uaW5jIA0KPiBiL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfdmlydHVhbGl6YXRpb24uaW5jDQo+IGluZGV4IDU1MzAx
YzcuLjQ4MWRiNTggMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjNfdmlydHVhbGl6YXRpb24uaW5jDQo+ICsrKyBiL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjNfdmlydHVhbGl6YXRpb24uaW5jDQo+IEBAIC0yLDcgKzIsNyBAQCBGSUxFU0VYVFJBUEFU
SFNfcHJlcGVuZCA6PSAiJHtUSElTRElSfS8ke1BOfToiDQo+DQo+ICBERVBFTkRTICs9ICIgbmN1
cnNlcyINCj4NCj4gLWRvX2NvbXBpbGVfcHJlcGVuZCgpIHsNCj4gK2RvX2NvbXBpbGVfcHJlcGVu
ZF9jbGFzcy10YXJnZXQoKSB7DQo+ICAgICAgICAgZXhwb3J0IExJQlJBUllfUEFUSD0ke1NUQUdJ
TkdfRElSX1RBUkdFVH0vbGliDQo+ICB9DQo+DQo+IC0tDQo+IDIuMjYuMi5DaXNjbw0KPg0KDQoN
Ci0tDQotIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3Mg
YW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQotICJVc2UgdGhlIGZvcmNlIEhhcnJ5
IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0K
